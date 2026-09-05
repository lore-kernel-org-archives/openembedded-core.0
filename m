Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C18C79FA0
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:36 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2599.1788641131746810588
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wzon7MKw;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so30172505e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641130; x=1789245930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5IPfQtq77qUGLHy4MUOX6IxPRTtEGeGxHY5VvWIAS4Q=;
        b=wzon7MKwQp2lCkgcRcQIgkGx+PJjr1COM01DkZyFqzQAIMAyOg/ZABfIC0wgKrbg4z
         wEuk7vGEZuzhAioU2JGjjvHjsGwMyMGNYq9g2KQGf+EpamgPwLFFbeymTIBrXbfIkBXl
         88bDsivIqN24lEB1hLM/FPTEw6TMU1jaB6ecs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641130; x=1789245930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5IPfQtq77qUGLHy4MUOX6IxPRTtEGeGxHY5VvWIAS4Q=;
        b=M2fftvG8EFKVM04JM7476k6vV2z/2Ga4ZqvxOXXDy5hnVw3cQXKNp+W2p/2bVrJpDG
         YJhrsOSGDeeDs9lOAl8+BpMeuhRtNuJx1yO98JGLGxhfZPELsTKzmcptqMPlWhdbzjs2
         6SMOXzne5lU/JOQMYXhyybpII1sTO7JlmM1+efdSjSIO6OEvEjY97v/SftvxY/oYnKl+
         phZuW17DtG2z1oMIBxcEkjAr7F7JhvzOFLkPwzOUyPSLsrOkzZWkGmHKa4j7jkvzsIn5
         29jz/LM1QEGV7efx1KDNEPzppsT7Iy9OtUI3r/Ru2sFmAxdpVlQFii2+yvTgXLUARhv/
         d8vA==
X-Gm-Message-State: AFuF++m/v/mByIQNpDdTSZTjqaoV8rIzb8oQXN+yDnFkp1ZA/higMHIl
	e9tDn0emRYG0fezc2Z0H2bO4mRnMfjRF4NpzeRGHZBm0IdJ3xu15TWTpB/58ru5gvJVjFXn/z9/
	V6PS5Gg0=
X-Gm-Gg: AYBFou3ppZjxS1UdkmwK9CJwaKgIL5ptHMDZ7JLW+ysJPvV2d7SvTjBDDJY0pQ/zzGK
	THtEmCmXy6dGS89o7Hj803823UxVxHKkfKSmf6iZdxhMy1axcjfEsLrA90Ho2XDClIQ6FzWnUEq
	Nr5c9t0Gdxehwwp2zZKgMAInZrn7T66k290krHhi2FwAzhWeDaDVpnQnVyqSzUoW5lFtcV5itme
	b7xXSlQRrBqNgoDax8eRXA77jPIeaeDLp4YcRyfG4+7yoYEQ1SSBimgIfNr6U9fjydYxi62UX5c
	RcUEp5YsoS66/855j2cBifwqNwxByF+telw/jl9Q7vQTPB5VsIZYsvoCS8R2tVseVn2yPwBQckc
	SuEVZBfP1d9f18gejsdAVph6LSTFkOLRy7JejTEQ19ZBNPJ4CugiSlryiGJNqN/cN/gy0pHe5yu
	H80ybmwTXF4xteliqs1d+wiEMhlxz1sm1/PKVSnOdZvwXXSorcqv0XBeZwaa8PyPC6CDGtBlJnP
	GpLC9j5Bkp3Tb3gi5pHsF79y3w76XIGjeyuzFIeqjFVJx0VneZYW86S/SA/Dur80Q==
X-Received: by 2002:a05:600c:1551:b0:49c:fa21:1c89 with SMTP id 5b1f17b1804b1-49cfa211d5fmr124123515e9.30.1788641129895;
        Sat, 05 Sep 2026 13:45:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 34/40] perl: fix CVE-2026-42496 and CVE-2026-42497
Date: Sat,  5 Sep 2026 22:44:35 +0200
Message-ID: <7bda2b9dc01abaa39c56301acd230affe51b6537.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245186

From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>

Archive::Tar before 3.08 passes the tar header's linkname directly to
symlink()/link() in _make_special_file() without validating absolute
paths or '..' segments. This allows a crafted tar archive to create
symlinks or hardlinks targeting paths outside the extraction directory,
leading to arbitrary file read/write.

Backport patch to fix CVE-2026-42496 and CVE-2026-42497.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2026-42496]
[https://nvd.nist.gov/vuln/detail/CVE-2026-42497]

Upstream Patch:
[https://github.com/jib/archive-tar-new/commit/17c873492a05eddc0de18c1485e0b2cccd5a9158]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: in perl, the fix was integrated with
https://github.com/Perl/perl5/commit/560820ab273deb6b27408c8e5c2f34d72b1c3bbb (v5.43.11) ]
---
 .../perl/files/CVE-2026-42496.patch           | 99 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-42496.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-42496.patch b/meta/recipes-devtools/perl/files/CVE-2026-42496.patch
new file mode 100644
index 00000000000..ae370340cf5
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-42496.patch
@@ -0,0 +1,99 @@
+From edde2083c6e93e42b979068af5529710b5e2a7ab Mon Sep 17 00:00:00 2001
+From: Stig Palmquist <stig@stig.io>
+Date: Thu, 21 May 2026 19:59:21 +0100
+Subject: [PATCH] Validate symlink and hardlink linkname in SECURE MODE
+
+Archive::Tar before 3.08 passes the tar header's linkname directly to
+symlink()/link() in _make_special_file() without validating absolute
+paths or '..' segments. This allows a crafted tar archive to create
+symlinks or hardlinks targeting paths outside the extraction directory,
+leading to arbitrary file read/write.
+
+Add validation in SECURE EXTRACT MODE (the default) to reject:
+- Symlink/hardlink targets with absolute paths
+- Symlink/hardlink targets containing '..' path traversal
+
+Adjusted patch paths from upstream Archive::Tar standalone repository
+(lib/Archive/Tar.pm) to match perl5 source tree layout
+(cpan/Archive-Tar/lib/Archive/Tar.pm).
+
+Upstream-Status: Backport [https://github.com/jib/archive-tar-new/commit/17c873492a05eddc0de18c1485e0b2cccd5a9158]
+
+CVE: CVE-2026-42496
+CVE: CVE-2026-42497
+
+Signed-off-by: Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ cpan/Archive-Tar/lib/Archive/Tar.pm     | 30 +++++++++++++++++++++++++
+ cpan/Archive-Tar/t/04_resolved_issues.t |  2 ++
+ 2 files changed, 32 insertions(+)
+
+diff --git a/cpan/Archive-Tar/lib/Archive/Tar.pm b/cpan/Archive-Tar/lib/Archive/Tar.pm
+index 2df0931..733feef 100644
+--- a/cpan/Archive-Tar/lib/Archive/Tar.pm
++++ b/cpan/Archive-Tar/lib/Archive/Tar.pm
+@@ -954,6 +954,19 @@ sub _make_special_file {
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
+@@ -967,6 +980,23 @@ sub _make_special_file {
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
+index b3566a1..08d339a 100644
+--- a/cpan/Archive-Tar/t/04_resolved_issues.t
++++ b/cpan/Archive-Tar/t/04_resolved_issues.t
+@@ -220,6 +220,7 @@ if ($^O ne 'msys') # symlink tests fail on Windows/msys2
+ 		}
+ 
+     { #use case 1 - in memory extraction
++      local $Archive::Tar::INSECURE_EXTRACT_MODE=1;
+ 			my $t=Archive::Tar->new;
+ 			$t->read( $archname );
+ 			my $r = eval{ $t->extract };
+@@ -231,6 +232,7 @@ if ($^O ne 'msys') # symlink tests fail on Windows/msys2
+ 
+ 		{ #use case 2 - iter extraction
+ 		  #$DB::single = 2;
++      local $Archive::Tar::INSECURE_EXTRACT_MODE=1;
+ 			my $next=Archive::Tar->iter( $archname, 1 );
+ 			my $failed = 0;
+ 			#use Data::Dumper;
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
index 8716f1f2572..3469258f727 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://CVE-2026-13221.patch \
            file://CVE-2026-57432-01.patch \
            file://CVE-2026-57432-02.patch \
+           file://CVE-2026-42496.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \

