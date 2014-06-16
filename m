Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F32BF6FB6D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 05:20:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5G5KfuK007909
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jun 2014 22:20:41 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 15 Jun 2014 22:20:40 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 01:20:36 -0400
Message-ID: <24fee997c2aeda1aa68d3a0fc191f13d4c88962b.1402895653.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402895653.git.wenzong.fan@windriver.com>
References: <cover.1402895653.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] Dpkg::Source::Patch: Outright reject C-style filenames in patches
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

based on: commit a12eb58959d0a10584a428f4a3103a49204c410f

Because patch only started recognizing C-style filenames in diffs
in version 2.7, it's not safe to assume one behaviour or the other,
as the system might or might not have a recent enough version, or
a GNU patch program at all. There's also no reason we should be
supporting this kind of strange encoded filenames in patches, when
we have not done so up to now.

Let's just ban these types of diffs and be done with it.

Fixes: CVE-2014-0471
Closes: #746306

[drop the text for debian/changelog,because it's not suitable
for the veriosn]
Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127.patch  |   49 ++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.4.bb          |    1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127.patch b/meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127.patch
new file mode 100644
index 0000000..d49b073
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127.patch
@@ -0,0 +1,49 @@
+diff -uarN dpkg-1.17.1-org/scripts/Dpkg/Source/Patch.pm dpkg-1.17.1/scripts/Dpkg/Source/Patch.pm
+--- dpkg-1.17.1-org/scripts/Dpkg/Source/Patch.pm	2014-06-05 16:32:41.765446564 +0800
++++ dpkg-1.17.1/scripts/Dpkg/Source/Patch.pm	2014-06-05 16:37:21.461446359 +0800
+@@ -324,31 +324,6 @@
+     return $line;
+ }
+ 
+-my %ESCAPE = ((
+-    'a' => "\a",
+-    'b' => "\b",
+-    'f' => "\f",
+-    'n' => "\n",
+-    'r' => "\r",
+-    't' => "\t",
+-    'v' => "\cK",
+-    '\\' => '\\',
+-    '"' => '"',
+-), (
+-    map { sprintf('%03o', $_) => chr($_) } (0..255)
+-));
+-
+-sub _unescape {
+-    my ($diff, $str) = @_;
+-
+-    if (exists $ESCAPE{$str}) {
+-        return $ESCAPE{$str};
+-    } else {
+-        error(_g('diff %s patches file with unknown escape sequence \\%s'),
+-              $diff, $str);
+-    }
+-}
+-
+ # Fetch the header filename ignoring the optional timestamp
+ sub _fetch_filename {
+     my ($diff, $header) = @_;
+@@ -358,12 +333,7 @@
+ 
+     # Is it a C-style string?
+     if ($header =~ m/^"/) {
+-        $header =~ m/^"((?:[^\\"]|\\.)*)"/;
+-        error(_g('diff %s patches file with unbalanced quote'), $diff)
+-            unless defined $1;
+-
+-        $header = $1;
+-        $header =~ s/\\([0-3][0-7]{2}|.)/_unescape($diff, $1)/eg;
++	error(_g('diff %s patches file with C-style encoded filename'), $diff);
+     } else {
+         # Tab is the official separator, it's always used when
+         # filename contain spaces. Try it first, otherwise strip on space
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
index 48e1394..83526f3 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://noman.patch \
             file://glibc2.5-sync_file_range.patch \
             file://no-vla-warning.patch \
             file://dpkg-1.17.4-CVE-2014-0471.patch \
+            file://dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127.patch \
            "
 
 SRC_URI[md5sum] = "cc25086e1e3bd9512a95f14cfe9002e1"
-- 
1.7.9.5


