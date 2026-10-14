Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F017CC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 15:27:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16648.1791991638887698228
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 08:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dc5ftaQa;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so34520595e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 08:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791991637; x=1792596437; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMLZUA3rVegyRIlSOFB9t5Uh68hvTrUXNyd9W9MajBY=;
        b=dc5ftaQadIZUW3n084m5DcEE634fDzLDxhP8d932sELXWkjoDUzNNIiQP+h3bGuQZk
         floI0zOoIuz/ZPLi7MTf7gIecFMCxzjDO0SN0ARzGSm5/+VqphxaXfLcmscqnbQ3rvJx
         apM+LtgKhwkJE7BvHTLlzimuNITw+tN3/+WRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991637; x=1792596437;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMLZUA3rVegyRIlSOFB9t5Uh68hvTrUXNyd9W9MajBY=;
        b=1oHhYWPNm0NuG8QmBK/c3+10O0sZapUmIAtg7mRJx2cOh1PcnY0k4mCqb/aGVeiYke
         Y08qmIUdRwVQ0sMvhoy0ZsnvQmY0r1V+nlFyCcxyfnnSPmjS5HlrBNAvpo71MkFtHY/c
         WqXN9J9Yy4xRRnnOnUs5sZf1IN+voXL5NUlGxZvr3R+0fx2FNX3iwKzsSYefwKtYBrLZ
         PRzvQJctoxvjnQ82siDN2xqYCem+XbDxasq5L/P3maKKORv3K3c9j9JXDx8OT04kiIQ7
         ytV8SGSiT5A5dStMi24Q38eSyHqrvnYulFvGoKk9R6b98AbDZIojDpSXEXUyvPj7r4Um
         40Mw==
X-Forwarded-Encrypted: i=1; AKwUvBxPFmoreQeYVIX3MXpR5BVngUdejVOuTe9wzUpwG4//qVSoKIz4yhY7zLl7tjPuwE0Xu2xXF+imY+G86BxbniyIfA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIOnhGB4d4FdX20mcg/lBxEFi5w1MWgw4/lomDlGSZX1EDMSVm6
	RkK9vI7r4rEyRPCG+P8WMZ5RbwF1edl7ToQntF3p35frkFKvIenlsVjp3WD4Ul3mlws=
X-Gm-Gg: AYBFou2mlLj2KjCqXTzsM/9hXyi9lF97y3bF5lt6UPJCG9TM1y5Kl2+hWxnnw6I8R8a
	QqsNLBsyB95ytcipQRQy+tN1rHtfflfCXg3/wPU/ByyVLzUXDA0Pstvo3cf19grNmX3+BXvsP8B
	OFnTQOfyyjFGTmoJiBdDi1eQbTTRKF7D6Rj+mnqQVaTIuCYNxzGql9KQCzwsrQIUOWLTQ6alCLs
	Ud0SrRxqN/I1mKBifCnoUaNKRJPJM8XZLTMLnoMc1+6biytCGLDYAuxf+JiBjPG+h03HW0DCeof
	PXZdTwjrJJOfdTE/xCLswYqWzz9w0DCwWM68Xr70PVDnja1pADD9zH3KU/lQUl6tB6URElm/8MN
	XwIde0EfZB4VOjh/FvOPdV3vXhAZ8KuZDGz3Kt2VE2m3q+BXndG3NkAkWHgHRBPhxwjAgA/m2ze
	KIwnntZP5hiICoXopVZGO8o2H6KN++O7aFoaQeG732t+PluWv1JsoC8VcTlN3NkKXwa3zhF3nXs
	MLhBPKMaXANE3yDYf/5CVO9nno0jBCD44se4aTLlzFMOmWQ439VFDsMP08=
X-Received: by 2002:a05:600c:3488:b0:49f:e941:d6e with SMTP id 5b1f17b1804b1-4a18e4c05d9mr323910615e9.21.1791991636978;
        Wed, 14 Oct 2026 08:27:16 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd0adc6csm6378535e9.14.2026.10.14.08.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:27:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 17:27:15 +0200
Message-Id: <DM4O0ONXKQX6.I4PJC42REZQ8@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <rsangam@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH v2] perl: Security fix for
 CVE-2026-48962
X-Mailer: aerc 0.20.0
References: <20261014105954.8267-1-rsangam@mvista.com>
In-Reply-To: <20261014105954.8267-1-rsangam@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 15:27:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247780

Hello,

On Wed Oct 14, 2026 at 12:59 PM CEST, Rohini Sangam via lists.openembedded.=
org wrote:
> Pick patch from [1] also mentioned at Debian tracker in [2]
>
> [1] https://github.com/pmqs/IO-Compress/commit/f2db247bf90d4cc7ee2710be38=
4946081f3b4610
> [2] https://security-tracker.debian.org/tracker/CVE-2026-48962
>
> Signed-off-by: Rohini Sangam <rsangam@mvista.com>
> ---
>  .../perl/files/CVE-2026-48962.patch           | 168 ++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.38.4.bb     |   1 +
>  2 files changed, 169 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-48962.patch
>
> diff --git a/meta/recipes-devtools/perl/files/CVE-2026-48962.patch b/meta=
/recipes-devtools/perl/files/CVE-2026-48962.patch
> new file mode 100644
> index 0000000000..d4b76bcdda
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/files/CVE-2026-48962.patch
> @@ -0,0 +1,168 @@
> +From f2db247bf90d4cc7ee2710be384946081f3b4610 Mon Sep 17 00:00:00 2001
> +From: pmqs <pmqs@cpan.org>
> +Date: Sat, 16 May 2026 17:48:34 +0100
> +Subject: [PATCH] remove use of eval in globmapper. #73
> +
> +CVE: CVE-2026-48962
> +Upstream-Status: Backport [https://github.com/pmqs/IO-Compress/commit/f2=
db247bf90d4cc7ee2710be384946081f3b4610]
> +
> +Signed-off-by: Rohini Sangam <rsangam@mvista.com>
> +---
> + cpan/IO-Compress/lib/File/GlobMapper.pm | 52 ++++++++++++++++++++-----
> + cpan/IO-Compress/t/globmapper.t         | 52 ++++++++++++++++++++++++-
> + 2 files changed, 94 insertions(+), 10 deletions(-)
> +
> +diff --git a/cpan/IO-Compress/t/globmapper.t b/cpan/IO-Compress/t/globma=
pper.t
> +index c97beb6..08802ec 100644
> +--- a/cpan/IO-Compress/t/globmapper.t
> ++++ b/cpan/IO-Compress/t/globmapper.t
> +@@ -290,6 +290,56 @@ Perl $]" )
> +         ], "  got mapping";
> + }
> +=20
> ++{
> ++    title "check escaping";
> ++
> ++    my $tmpDir ;#=3D 'td';
> ++    my $lex =3D LexDir->new( $tmpDir );
> ++
> ++    my $BEGIN_DELIM =3D "\xFF";
> ++    my $END_DELIM   =3D "\xFE";
> ++
> ++    #mkdir $tmpDir, 0777 ;
> ++
> ++    touch map { "$tmpDir/$_.tmp" } qw( abc1 abc2 abc3 ) ;
> ++
> ++    my $map =3D File::GlobMapper::globmap("$tmpDir/*b*.tmp", "$tmpDir/X=
-${BEGIN_DELIM}#2-#1${END_DELIM}-X");
> ++    ok $map, "  got map"
> ++        or diag $File::GlobMapper::Error ;
> ++
> ++    is @{ $map }, 3, "  returned 3 maps";
> ++    is_deeply $map,
> ++        [ [map { "$tmpDir/$_" } ("abc1.tmp", "X-${BEGIN_DELIM}c1-a${END=
_DELIM}-X")],
> ++          [map { "$tmpDir/$_" } ("abc2.tmp", "X-${BEGIN_DELIM}c2-a${END=
_DELIM}-X")],
> ++          [map { "$tmpDir/$_" } ("abc3.tmp", "X-${BEGIN_DELIM}c3-a${END=
_DELIM}-X")],
> ++	], "  got mapping";
    ^ This is a tab but upstream got spaces.

Please try to minimise changes from upstream to your submitted patch.

Thanks!
--=20
Yoann Congal
Smile ECS


