Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 80CF865F99
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 05:20:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5G5KeC5016011
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jun 2014 22:20:40 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 15 Jun 2014 22:20:39 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 01:20:35 -0400
Message-ID: <0c9ae168604c96d3333810b5fc0ae70af832ff88.1402895653.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402895653.git.wenzong.fan@windriver.com>
References: <cover.1402895653.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] Dpkg::Source::Patch: Correctly parse C-style diff filenames
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jun 2014 05:20:46 -0000
Content-Type: text/plain

From: Guillem Jover <guillem@debian.org>

based on: commit a82651188476841d190c58693f95827d61959b51

We need to strip the surrounding quotes, and unescape any escape
sequence, so that we check the same files that the patch program will
be using, otherwise a malicious package could overpass those checks,
and perform directory traversal attacks on source package unpacking.

Fixes: CVE-2014-0471

Reported-by: Jakub Wilk <jwilk@debian.org>
[drop the text for debian/changelog,because it's not suitable
 for the veriosn]
Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471.patch      |   83 ++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.4.bb          |    1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471.patch b/meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471.patch
new file mode 100644
index 0000000..f5a023a
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471.patch
@@ -0,0 +1,83 @@
+diff -uarN dpkg-1.17.1-org/scripts/Dpkg/Source/Patch.pm dpkg-1.17.1/scripts/Dpkg/Source/Patch.pm
+--- dpkg-1.17.1-org/scripts/Dpkg/Source/Patch.pm	2014-06-05 15:24:07.422446284 +0800
++++ dpkg-1.17.1/scripts/Dpkg/Source/Patch.pm	2014-06-05 15:41:37.746446314 +0800
+@@ -324,14 +324,53 @@
+     return $line;
+ }
+ 
+-# Strip timestamp
+-sub _strip_ts {
+-    my $header = shift;
+-
+-    # Tab is the official separator, it's always used when
+-    # filename contain spaces. Try it first, otherwise strip on space
+-    # if there's no tab
+-    $header =~ s/\s.*// unless ($header =~ s/\t.*//);
++my %ESCAPE = ((
++    'a' => "\a",
++    'b' => "\b",
++    'f' => "\f",
++    'n' => "\n",
++    'r' => "\r",
++    't' => "\t",
++    'v' => "\cK",
++    '\\' => '\\',
++    '"' => '"',
++), (
++    map { sprintf('%03o', $_) => chr($_) } (0..255)
++));
++
++sub _unescape {
++    my ($diff, $str) = @_;
++
++    if (exists $ESCAPE{$str}) {
++        return $ESCAPE{$str};
++    } else {
++        error(_g('diff %s patches file with unknown escape sequence \\%s'),
++              $diff, $str);
++    }
++}
++
++# Fetch the header filename ignoring the optional timestamp
++sub _fetch_filename {
++    my ($diff, $header) = @_;
++
++    # Strip any leading spaces.
++    $header =~ s/^\s+//;
++
++    # Is it a C-style string?
++    if ($header =~ m/^"/) {
++        $header =~ m/^"((?:[^\\"]|\\.)*)"/;
++        error(_g('diff %s patches file with unbalanced quote'), $diff)
++            unless defined $1;
++
++        $header = $1;
++        $header =~ s/\\([0-3][0-7]{2}|.)/_unescape($diff, $1)/eg;
++    } else {
++        # Tab is the official separator, it's always used when
++        # filename contain spaces. Try it first, otherwise strip on space
++        # if there's no tab
++        $header =~ s/\s.*// unless $header =~ s/\t.*//;
++    }
++
+     return $header;
+ }
+ 
+@@ -400,7 +439,7 @@
+ 	unless(s/^--- //) {
+ 	    error(_g("expected ^--- in line %d of diff `%s'"), $., $diff);
+ 	}
+-        $path{old} = $_ = _strip_ts($_);
++	$path{old} = $_ = _fetch_filename($diff, $_);
+ 	$fn{old} = $_ if $_ ne '/dev/null' and s{^[^/]*/+}{$destdir/};
+ 	if (/\.dpkg-orig$/) {
+ 	    error(_g("diff `%s' patches file with name ending .dpkg-orig"), $diff);
+@@ -412,7 +451,7 @@
+ 	unless (s/^\+\+\+ //) {
+ 	    error(_g("line after --- isn't as expected in diff `%s' (line %d)"), $diff, $.);
+ 	}
+-        $path{new} = $_ = _strip_ts($_);
++	$path{new} = $_ = _fetch_filename($diff, $_);
+ 	$fn{new} = $_ if $_ ne '/dev/null' and s{^[^/]*/+}{$destdir/};
+ 
+ 	unless (defined $fn{old} or defined $fn{new}) {
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
index 5507352..48e1394 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://noman.patch \
             file://dpkg-configure.service \
             file://glibc2.5-sync_file_range.patch \
             file://no-vla-warning.patch \
+            file://dpkg-1.17.4-CVE-2014-0471.patch \
            "
 
 SRC_URI[md5sum] = "cc25086e1e3bd9512a95f14cfe9002e1"
-- 
1.7.9.5


