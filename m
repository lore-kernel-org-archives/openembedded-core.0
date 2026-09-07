Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C725FC79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 07:41:50 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29626.1788766902646488573
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 00:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ds2se5iv;
 spf=pass (domain: mvista.com, ip: 209.85.215.181, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so3452687a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 00:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788766902; x=1789371702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9Uc/bzwtfJiWsv7hBQdQwm0whjdzQ4JjjRUbUe1/sI=;
        b=Ds2se5ivRfFpRf/CvTpFZuCWhQ5dGtySQ/N+zQh7NuQKTmm7xBiGofH49AYiU6GpPM
         pdYYJJRBNH31xHEiZFg8UsUYLBJnRF1+CWdZaIAOw9sk9CbOI6eo3t8zWS4LrkKEaRfV
         0LHSncbYmXjmFrUbsycUYQ/qVp9Xv91gFmCDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766902; x=1789371702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9Uc/bzwtfJiWsv7hBQdQwm0whjdzQ4JjjRUbUe1/sI=;
        b=kZGzM2a4nezU8WHyP0XGLxtiGVEK5s1SMQXBt+Gr3mPNAbbihRyqhzHVdQgvK3jnOp
         lw+HgEus89SAOHjzFU3XbyjUh6r2nSYBmFpz1Su4jpOAz+nFhmKQPqJslMD+lYoUI7xC
         A5wqZ2sjGJ1rVl5iCGEWce/J0Gxu0HKIAIO+7zqzH3eStNEztjLTuEq+DH56ADW51hPQ
         Jmgq5+dDYd6XKcIHFYCzzC60Q5rhyPfNZVedfuKZJ5DADh5/62Od+CHV0IdsfLlrWiVm
         9CJqmvy6r/7BaYtLnM/baAuToBrmryB5+hIM0nkqKMm32xNuaW9/MHUilPZ/NksC6Que
         Uwbw==
X-Gm-Message-State: AFuF++mKZ8JNY9pUFUqEAJR8QgNXd/LvmkPQBWrVpx9vycIFkWn0tyT1
	udVxqdTyLMwN+2UocvtrKU8+6TetKDBW7skpg4r1mKHoglDD6lYfxdFmh8VXfCdxNNZ7cAbeyVz
	4yDNs5ak=
X-Gm-Gg: AYBFou11j21GkWlK7mJaSCkW9PD6eKfLJMfNUDklRCXdshuYk6bLrLD5quZgTynj6of
	YA0m89BfqTVMOvayyG+zzscM6cx173AJOCxvfxGXb8RHOcQYDWSbOp0jabcZUdjfpecVGDR5iPU
	oiIo1HS2qaRD12rZ3+CV7TbsOma/cXGFjBYI1btXX6ifsSNrzxEmKPTQLn/rfg0SKBoYyWPmlkH
	sq9sS/SwhwwOg6XLZNE2WmhxMK9Y8sWSS/xMTT2irz2ewUk399f9G7RGabhMEvmns1mohy3MO9Z
	7IjMH+DQqSPc45TXzbnkdENtknxpdMbesmKhNyEeUKLWl1+yeOngH6Ggf/lMcOGUILk0JfpQyDN
	r9b4GtdO50dAUeWD/mbnP9qTqczHSbHNSTM+FiwF9UYu05zQSYStAh4Pa+w4rB4YRl2pOJV0VVM
	cn3osrIIx/ZLfnL6mbk7S2PLa7GET+z7FEwsveIPakth+b6Wa4sVtgzgcJoZeJkFZWu24rPE7+H
	Jk=
X-Received: by 2002:a17:90b:3944:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39b261b19d9mr35651505a91.14.1788766901529;
        Mon, 07 Sep 2026 00:41:41 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.170])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm22577832eec.6.2026.09.07.00.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:41:40 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] perl: fix for CVE-2026-42496
Date: Mon,  7 Sep 2026 13:11:27 +0530
Message-ID: <20260907074128.234508-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 07:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245238

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://github.com/jib/archive-tar-new/commit/17c873492a05eddc0de18c1485e0b2cccd5a9158
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-42496
[3] https://security-tracker.debian.org/tracker/CVE-2026-42496

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../perl/files/CVE-2026-42496.patch           | 86 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.38.4.bb     |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-42496.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-42496.patch b/meta/recipes-devtools/perl/files/CVE-2026-42496.patch
new file mode 100644
index 0000000000..34d59d9363
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-42496.patch
@@ -0,0 +1,86 @@
+From 17c873492a05eddc0de18c1485e0b2cccd5a9158 Mon Sep 17 00:00:00 2001
+From: Stig Palmquist <stig@stig.io>
+Date: Thu, 21 May 2026 19:59:21 +0100
+Subject: [PATCH] Validate symlink and hardlink linkname in SECURE MODE
+
+Signed-off-by: Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
+
+CVE: CVE-2026-42496
+Upstream-Status: Backport [https://github.com/jib/archive-tar-new/commit/17c873492a05eddc0de18c1485e0b2cccd5a9158]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ cpan/Archive-Tar/lib/Archive/Tar.pm     | 30 +++++++++++++++++++++++++
+ cpan/Archive-Tar/t/04_resolved_issues.t |  2 ++
+ 2 files changed, 32 insertions(+)
+
+diff --git a/cpan/Archive-Tar/lib/Archive/Tar.pm b/cpan/Archive-Tar/lib/Archive/Tar.pm
+index 476e646..4c73823 100644
+--- a/cpan/Archive-Tar/lib/Archive/Tar.pm
++++ b/cpan/Archive-Tar/lib/Archive/Tar.pm
+@@ -944,6 +944,19 @@ sub _make_special_file {
+     my $err;
+ 
+     if( $entry->is_symlink ) {
++        if( !$INSECURE_EXTRACT_MODE ) {
++            my $linkname = $entry->linkname;
++            if( File::Spec->file_name_is_absolute($linkname) ) {
++                $self->_error( qq[Symlink '] . $entry->full_path .
++                    qq[' has absolute target. Not extracting under SECURE EXTRACT MODE] );
++                return;
++            }
++            if( grep { $_ eq '..' } File::Spec->splitdir($linkname) ) {
++                $self->_error( qq[Symlink '] . $entry->full_path .
++                    qq[' target attempts traversal. Not extracting under SECURE EXTRACT MODE] );
++                return;
++            }
++        }
+         my $fail;
+         if( ON_UNIX ) {
+             symlink( $entry->linkname, $file ) or $fail++;
+@@ -957,6 +970,23 @@ sub _make_special_file {
+                 $entry->linkname .q[' failed] if $fail;
+ 
+     } elsif ( $entry->is_hardlink ) {
++        if( !$INSECURE_EXTRACT_MODE ) {
++            my $linkname = $entry->linkname;
++            if( File::Spec->file_name_is_absolute($linkname) ) {
++                $self->_error( qq[Hardlink '] . $entry->full_path .
++                    qq[' has absolute target '$linkname'. Not extracting ] .
++                    qq[under SECURE EXTRACT MODE: extraction itself chmods ] .
++                    qq[the shared inode.] );
++                return;
++            }
++            if( grep { $_ eq '..' } File::Spec->splitdir($linkname) ) {
++                $self->_error( qq[Hardlink '] . $entry->full_path .
++                    qq[' target '$linkname' attempts traversal. Not ] .
++                    qq[extracting under SECURE EXTRACT MODE: extraction ] .
++                    qq[itself chmods the shared inode.] );
++                return;
++            }
++        }
+         my $fail;
+         if( ON_UNIX ) {
+             link( $entry->linkname, $file ) or $fail++;
+diff --git a/cpan/Archive-Tar/t/04_resolved_issues.t b/cpan/Archive-Tar/t/04_resolved_issues.t
+index fc713cd..593501a 100644
+--- a/cpan/Archive-Tar/t/04_resolved_issues.t
++++ b/cpan/Archive-Tar/t/04_resolved_issues.t
+@@ -219,6 +219,7 @@ SKIP: {
+ 		}
+ 
+     { #use case 1 - in memory extraction
++	        local $Archive::Tar::INSECURE_EXTRACT_MODE=1;
+ 			my $t=Archive::Tar->new;
+ 			$t->read( $archname );
+ 			my $r = eval{ $t->extract };
+@@ -230,6 +231,7 @@ SKIP: {
+ 
+ 		{ #use case 2 - iter extraction
+ 		  #$DB::single = 2;
++		local $Archive::Tar::INSECURE_EXTRACT_MODE=1;
+ 			my $next=Archive::Tar->iter( $archname, 1 );
+ 			my $failed = 0;
+ 			#use Data::Dumper;
+-- 
+2.50.1
+
diff --git a/meta/recipes-devtools/perl/perl_5.38.4.bb b/meta/recipes-devtools/perl/perl_5.38.4.bb
index b86c58f540..f2a1b22b14 100644
--- a/meta/recipes-devtools/perl/perl_5.38.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://CVE-2026-57432-01.patch \
            file://CVE-2026-57432-02.patch \
            file://CVE-2025-40909.patch \
+           file://CVE-2026-42496.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.50.1


