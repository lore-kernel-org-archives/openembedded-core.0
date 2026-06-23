Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB86BCD4F26
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 07:07:48 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15565.1782198459796646581
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 00:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oMg97Hb+;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4629d80fa08so4986255f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 00:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782198458; x=1782803258; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8csXteLsx8k5kUce1BttbcS67CKomOqMorL9aLrbG0o=;
        b=oMg97Hb+tN5qr9zA7CHZexPR9lsHVOeiCanwZPR9rBbqb23u68FTx3LG5nsrxbTvTo
         jGh0mNFXMFQVWxsCqakghbiRIIwhTv78TyIYryd/VXSJ6SqnuNQ0OssZXgaLjZ1S/D7q
         EBBGWsN8CkeYkzf58G/m/HlEwVPpb2ipFLP1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782198458; x=1782803258;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8csXteLsx8k5kUce1BttbcS67CKomOqMorL9aLrbG0o=;
        b=d+KxSb9BklgNzF5X9fzv55mfHDBdzO+vTSgdOA06vZDE+ljdrwgI52jf6ss5KvF7c/
         vY0wuYs+E/WqipiB6OShahXZy1QoNYJw3wDUPLQhrSHCJX637fBF0Q1sv+UFS8Wmm7ya
         74E42VKAVqSAvoskdMhaJK4W+pXY8sIOZjjS8JQhX2C3HM9Wo/8X/JOjSujDV3iOYThz
         tku065vZuW+1iHV59bfacaDgS7ZJyxVWv/ABPV2xlQ9OdGUfbEK5VjESYPvWlrWBMThs
         XNU+OLLOXQgZXK/AM4PMsHRDb23kHkLxQ489kHeKKbAFj4gLrQsts31nHKBMDnDmVBqW
         A6MQ==
X-Forwarded-Encrypted: i=1; AHgh+RqN3Z1VBU2regRGmeUOz59Rpi6N7ztO8vHIuAFZmrKzzw9R0TXbqBl/+EfEQnNnf5I9kla6Rbic4Vd101jiLrzbmA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx5TVixNwz5UMnUOaQ5Wtv047YX6y02Z8BUpJYDaQf4oUWYo0s5
	9OMTDqHLPWH1ki54/6sg7UBTXh5uao9QlaqhMrwDDMho2KFcYq4S+VLdkTFRnC1zGe5VoNMEa6H
	YnVLk
X-Gm-Gg: AfdE7cm2NmUK3doPFvqRIu0KzUrjJzRy8wAMGbMSG9QuvUOL+CyVgqkjwjYjOz5wmbJ
	xg+/C8ay4ygSuwO8iej7WzlNlxW/WiYLQjR3utJeNH59lj2aMreuKAqcPR7cyTMAl4PbLPsXzvU
	9C0PYwavucvFshecbaZtSAT2c38lSOT7sYV/nZu9NT+QqXxs77YwikMyPo3Q3NY/sH85gwYcPwg
	MvfXDZtzdkD3BVutZzoJAQnzMORH+C82xog8Z2ysCCEM3zhZF9DiYp+YP3tE1v1LfgTGdD1Lf+n
	69f7qQv35CqVbMfgjLztjN4BqeaXFSvMLxkx6zKFjGLzrk+/D0qW0rJUGAqkifsnK8HTYBri5bw
	4tk2S2kuHEy2RIAhxk+zHOv24kF/Do10eTDjyEE0j/Z0h/AkEuHDARVo9nwP67un4UUztXRCIb9
	rnePbQLtIQtkIczqoKrzozofNo1k3tp0XYhbR5IV6fkhJ0d4KMw+LfRYbGX6l1MVBLfhglT6OWS
	+jdgA==
X-Received: by 2002:a05:6000:2903:b0:460:1f32:628d with SMTP id ffacd0b85a97d-4650685a360mr30593154f8f.11.1782198457633;
        Tue, 23 Jun 2026 00:07:37 -0700 (PDT)
Received: from localhost (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c698dsm35663485f8f.16.2026.06.23.00.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 00:07:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 09:07:31 +0200
Message-Id: <DJG8MI4MVEDF.33LV9PHJO05IJ@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] perl: fix for CVE-2026-42496
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260623060344.339663-1-hprajapati@mvista.com>
In-Reply-To: <20260623060344.339663-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 07:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239337

On Tue Jun 23, 2026 at 8:03 AM CEST, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> Pick patch from [1] also mentioned at NVD report in [2]
>
> [1] https://github.com/jib/archive-tar-new/commit/17c873492a05eddc0de18c1=
485e0b2cccd5a9158
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-42496
> [3] https://security-tracker.debian.org/tracker/CVE-2026-42496
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---

Hello,

Is that needed for wrynose and master? Since this is vendored in perl,
this is not trivial to check.

Thanks!

>  .../perl/files/CVE-2026-42496.patch           | 86 +++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.38.4.bb     |  1 +
>  2 files changed, 87 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-42496.patch
>
> diff --git a/meta/recipes-devtools/perl/files/CVE-2026-42496.patch b/meta=
/recipes-devtools/perl/files/CVE-2026-42496.patch
> new file mode 100644
> index 0000000000..34d59d9363
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/files/CVE-2026-42496.patch
> @@ -0,0 +1,86 @@
> +From 17c873492a05eddc0de18c1485e0b2cccd5a9158 Mon Sep 17 00:00:00 2001
> +From: Stig Palmquist <stig@stig.io>
> +Date: Thu, 21 May 2026 19:59:21 +0100
> +Subject: [PATCH] Validate symlink and hardlink linkname in SECURE MODE
> +
> +Signed-off-by: Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
> +
> +CVE: CVE-2026-42496
> +Upstream-Status: Backport [https://github.com/jib/archive-tar-new/commit=
/17c873492a05eddc0de18c1485e0b2cccd5a9158]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + cpan/Archive-Tar/lib/Archive/Tar.pm     | 30 +++++++++++++++++++++++++
> + cpan/Archive-Tar/t/04_resolved_issues.t |  2 ++
> + 2 files changed, 32 insertions(+)
> +
> +diff --git a/cpan/Archive-Tar/lib/Archive/Tar.pm b/cpan/Archive-Tar/lib/=
Archive/Tar.pm
> +index 476e646..4c73823 100644
> +--- a/cpan/Archive-Tar/lib/Archive/Tar.pm
> ++++ b/cpan/Archive-Tar/lib/Archive/Tar.pm
> +@@ -944,6 +944,19 @@ sub _make_special_file {
> +     my $err;
> +=20
> +     if( $entry->is_symlink ) {
> ++        if( !$INSECURE_EXTRACT_MODE ) {
> ++            my $linkname =3D $entry->linkname;
> ++            if( File::Spec->file_name_is_absolute($linkname) ) {
> ++                $self->_error( qq[Symlink '] . $entry->full_path .
> ++                    qq[' has absolute target. Not extracting under SECU=
RE EXTRACT MODE] );
> ++                return;
> ++            }
> ++            if( grep { $_ eq '..' } File::Spec->splitdir($linkname) ) {
> ++                $self->_error( qq[Symlink '] . $entry->full_path .
> ++                    qq[' target attempts traversal. Not extracting unde=
r SECURE EXTRACT MODE] );
> ++                return;
> ++            }
> ++        }
> +         my $fail;
> +         if( ON_UNIX ) {
> +             symlink( $entry->linkname, $file ) or $fail++;
> +@@ -957,6 +970,23 @@ sub _make_special_file {
> +                 $entry->linkname .q[' failed] if $fail;
> +=20
> +     } elsif ( $entry->is_hardlink ) {
> ++        if( !$INSECURE_EXTRACT_MODE ) {
> ++            my $linkname =3D $entry->linkname;
> ++            if( File::Spec->file_name_is_absolute($linkname) ) {
> ++                $self->_error( qq[Hardlink '] . $entry->full_path .
> ++                    qq[' has absolute target '$linkname'. Not extractin=
g ] .
> ++                    qq[under SECURE EXTRACT MODE: extraction itself chm=
ods ] .
> ++                    qq[the shared inode.] );
> ++                return;
> ++            }
> ++            if( grep { $_ eq '..' } File::Spec->splitdir($linkname) ) {
> ++                $self->_error( qq[Hardlink '] . $entry->full_path .
> ++                    qq[' target '$linkname' attempts traversal. Not ] .
> ++                    qq[extracting under SECURE EXTRACT MODE: extraction=
 ] .
> ++                    qq[itself chmods the shared inode.] );
> ++                return;
> ++            }
> ++        }
> +         my $fail;
> +         if( ON_UNIX ) {
> +             link( $entry->linkname, $file ) or $fail++;
> +diff --git a/cpan/Archive-Tar/t/04_resolved_issues.t b/cpan/Archive-Tar/=
t/04_resolved_issues.t
> +index fc713cd..593501a 100644
> +--- a/cpan/Archive-Tar/t/04_resolved_issues.t
> ++++ b/cpan/Archive-Tar/t/04_resolved_issues.t
> +@@ -219,6 +219,7 @@ SKIP: {
> + 		}
> +=20
> +     { #use case 1 - in memory extraction
> ++	        local $Archive::Tar::INSECURE_EXTRACT_MODE=3D1;
> + 			my $t=3DArchive::Tar->new;
> + 			$t->read( $archname );
> + 			my $r =3D eval{ $t->extract };
> +@@ -230,6 +231,7 @@ SKIP: {
> +=20
> + 		{ #use case 2 - iter extraction
> + 		  #$DB::single =3D 2;
> ++		local $Archive::Tar::INSECURE_EXTRACT_MODE=3D1;
> + 			my $next=3DArchive::Tar->iter( $archname, 1 );
> + 			my $failed =3D 0;
> + 			#use Data::Dumper;
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-devtools/perl/perl_5.38.4.bb b/meta/recipes-dev=
tools/perl/perl_5.38.4.bb
> index 5ab49ed3d7..611824056e 100644
> --- a/meta/recipes-devtools/perl/perl_5.38.4.bb
> +++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.ta=
r.gz;name=3Dperl \
>             file://determinism.patch \
>             file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-det=
erm.patch \
>             file://0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t=
.patch \
> +           file://CVE-2026-42496.patch \
>             "
>  SRC_URI:append:class-native =3D " \
>             file://perl-configpm-switch.patch \


--=20
Yoann Congal
Smile ECS


