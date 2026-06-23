Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A114CD98F0
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 06:03:57 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14922.1782194633436208666
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 23:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jQVd4ti2;
 spf=pass (domain: mvista.com, ip: 74.125.82.176, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30bf854d5feso10478845eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 23:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1782194633; x=1782799433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yZaRBf6qLIq2CWKp7V1TTHxC4nnEc0eMr8+6lLbd1U4=;
        b=jQVd4ti2h+7jam/fOG3AR3vIEamSb7qYsAhKhmG3r9bd7WtqFV3DwP/Qw4KSXQ5bN8
         oBTOlWtP2M/6zWvYkCdB/LAvCZqcpZlbOUuqK+5mq1KF7Kq/11j/QnKOzedv99SVnIYB
         kyr+fVt150+R3UrsKOMYKc4/e3vWVaJb/O6Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782194633; x=1782799433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZaRBf6qLIq2CWKp7V1TTHxC4nnEc0eMr8+6lLbd1U4=;
        b=km389th7GR5IRXSN9txNfRQFm+zlXAzw3pZDvNo10DC5A0UIUn7WUr4ONh/kAnNUG4
         4hXzXYPw/+DnI1SJu6Ydrsk0FsCkWARHkBlUIgJ4H0J8BdcSydcjLs7urqx9B6uYGYBf
         yKB3n2mucHzylUnrR1cIoEv261URKLyfNc0Ww1BvvYgO8HlHQVXcdoU8DeUwW5smfx49
         iS5PKO/8mFrRrZCofxrD+LK4BCodM5ERPzyk6uEFLcpsaL13ELx+gYOnQTYOpX8fgvUa
         myP1RsHMfEEzLXjLQhWTKO4I+QqR2v1d3ZMOSG4cc616neMdk4YXLtmCRxLPcbW9iSzh
         xhlg==
X-Gm-Message-State: AOJu0Yw6Jr6qOtXfNZh3ODISXdQN/UQ7/wlKcqAMAPxIwe8rWwRjty8K
	AfATlDmUWp3em5inuBou9fWxQXHTtsvh4KMiUN4al0M6ZPHXq1yIKjrV1ZF4iLqpq+UXnREh0LW
	vHJgt
X-Gm-Gg: AfdE7cl2AJiRxj2hl8DFtgdMz+2dRPuqTRuIOi1FRvXr8W/6yBxSsSpYOSc1QK8889D
	As49PjounD8I9ki1dL5wUWz4ZhC24skAdT5/snW6aVyc6nOA3ItobVRo5Va+I7QDAcNZSw5aRYt
	x+7IYL8bqD+xCTpgcOpag1I3Q4+kdKSA9+7sHnbjre1MakEwNcM719Vr/QkYccAWqpC3U5tLafk
	DWELs/LJcWGRSpeyF8vI8UKHHXpszIZvbbVeMz864aeLQdnlVsCbDU3vL725+qtHlJdd0cM6/EM
	XvHv6ZIkDR8pLrApJdY87kLl1XuRaXjuxJo7JrbJAzGeI2jdq4fShy7TUyZ9+hYXRscwV5qR1zm
	iVAwJTYx6JSm9BnQAWtqijg4ng3vQDxye21Jc2+GA/VPwrQ4ltvwhwZ6mPWdfBlXoXuIXM70+Vl
	r9UVjPZDJBWlEnsICZgK0HYX/eXA==
X-Received: by 2002:a05:7300:2315:b0:30c:3f19:8bcd with SMTP id 5a478bee46e88-30c5b92389fmr790863eec.24.1782194632564;
        Mon, 22 Jun 2026 23:03:52 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.200])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba635d8sm15412906eec.10.2026.06.22.23.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 23:03:52 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] perl: fix for CVE-2026-42496
Date: Tue, 23 Jun 2026 11:33:44 +0530
Message-ID: <20260623060344.339663-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239335

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
index 5ab49ed3d7..611824056e 100644
--- a/meta/recipes-devtools/perl/perl_5.38.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
            file://0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch \
+           file://CVE-2026-42496.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.50.1


