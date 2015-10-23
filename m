Return-Path: <jpuhlman@mvista.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 14B9460125
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 17:18:15 +0000 (UTC)
Received: by padhk11 with SMTP id hk11so123548547pad.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 10:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nxqCuGqtj1OxTKDZvkIbqwAtT8w9/6ky8xWtql1r1oE=;
	b=akvP+kUxNDZ/SrkHk6zmSN96RaR5G6YnlYJbfco1UFIUireUNe3JDO/u8SYEQULlQ7
	1CfblfpMDbTVY/J3+8jl2WNs5NH2ADJb1lixsWjIcXUKiV/sTwfL8Cpgcvb7OiDWUTLS
	DXcPzHCo0hHEqHkMZ2dH9HdkECq3EKrlFPiwvtlcFv1RrJuzKUGGtSpC8dGMH2pAJ/HL
	Q82fbemSLd7K4xSx6ntRjOPiOP6qPUdRcjieVnXWNZIYvKVHS7nQ+u+wteI7RYwucS2e
	3FgkxgECprSx/fm4fSg9cYhJQlzzSID7hbVaOW9kgW5a6m66Fj7DhrLslcU41pfpEmp/
	PMrQ==
X-Gm-Message-State: ALoCoQmerDqI6mTpaG1ej+HWT1xfw4zkhBosRtT6zXao1KqdTJpxzqFEnAQCcLcb6k2A//QwDUUY
X-Received: by 10.68.182.5 with SMTP id ea5mr6342743pbc.148.1445620695788;
	Fri, 23 Oct 2015 10:18:15 -0700 (PDT)
Received: from localhost.localdomain
	(99-0-9-164.lightspeed.frokca.sbcglobal.net. [99.0.9.164])
	by smtp.gmail.com with ESMTPSA id
	ux3sm20014269pac.18.2015.10.23.10.18.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Oct 2015 10:18:14 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Oct 2015 10:18:07 -0700
Message-Id: <1445620687-9578-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] Perl: Use CC version not $Config(gccversion)
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
X-List-Received-Date: Fri, 23 Oct 2015 17:18:16 -0000

Get version data from querying $CC rather then
$Config(gccversion) which comes from running version of
perl. Since perl-native is not likely compiled by gcc
5 at this point, it will never trigger the required
fixes for gcc 5.

[YOCTO #8367]

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 .../perl/perl/perl-errno-generation-gcc5.patch     | 23 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.22.0.bb          |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch

diff --git a/meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch b/meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch
new file mode 100644
index 0000000..efbc55d
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch
@@ -0,0 +1,23 @@
+Upstream-Status:Inappropriate [embedded specific]
+
+The upstream code assumes that the compiler version used to compiler miniperl/perl-native
+is the same as the one being used to build the perl binary. Since most people are not running
+systems with gcc 5, it is unlikely that it will work on any supported host. Switch out gccversion
+for the version extracted from $CC --version.
+
+--- perl-5.22.0/ext/Errno/Errno_pm.PL	2015-10-19 18:01:20.622143786 -0400
++++ perl-5.22.0-fixed/ext/Errno/Errno_pm.PL	2015-10-19 17:50:35.662137367 -0400
+@@ -224,9 +224,12 @@
+ 
+     {	# BeOS (support now removed) did not enter this block
+     # invoke CPP and read the output
++        my $compiler = $ENV{'CC'};
++        my $compiler_out = `$compiler --version`;
++        my @compiler_version = split / /,$compiler_out; 
+ 
+ 	my $inhibit_linemarkers = '';
+-	if ($Config{gccversion} =~ /\A(\d+)\./ and $1 >= 5) {
++	if (@compiler_version[2] =~ /\A(\d+)\./ and $1 >= 5) {
+ 	    # GCC 5.0 interleaves expanded macros with line numbers breaking
+ 	    # each line into multiple lines. RT#123784
+ 	    $inhibit_linemarkers = ' -P';
diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
index 3ce7849..66e074d 100644
--- a/meta/recipes-devtools/perl/perl_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
@@ -62,6 +62,7 @@ SRC_URI += " \
         file://ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch \
         file://ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch \
         file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
+        file://perl-errno-generation-gcc5.patch \
 "
 
 # Fix test case issues
-- 
2.6.2


