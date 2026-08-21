Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BA5C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 11:03:49 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4977.1787310223568393934
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 04:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=enLCorzh;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f633e6058so765585f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 04:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787310222; x=1787915022; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IkN2qANSW5QtH6KuqBpSQuZJ5j0GIp65O5GgjkjpRE=;
        b=enLCorzh4stic5d0wWke1Gz/taqqBq4mTFE65OZZhlmHluA3fqpPfUxNPoNP5K5aO9
         r1y9wK7iz77kd80lAot3QLBp1qQgwo6bRvaofGhRxaGmqG/BFwIMSQTn62+hJjjCmlZ9
         DBZn1UQRr54kvJCuD4o8zizVdAFcVLENA/P0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787310222; x=1787915022;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1IkN2qANSW5QtH6KuqBpSQuZJ5j0GIp65O5GgjkjpRE=;
        b=ZTDUIH035a5mGEisbQ6iwR1dr4y2zjOGTVlc575RLstQZ2z/GZoliTdAstb8dZ2LaE
         BH1spe7osZlBCY4uqpAE2AW4kMwfG89MoSTUI7XF0AlgTJtKSyPBqNFAkoPbS9DAY8IW
         B5sYXWyDZRFc4cGXqj7d1V/riRmCmFXh7IyAWEmI8K4GHTkcQxTzknHuNrMW6uqDLucC
         EhP6Gns8HSM6Evg9carr6syLtvO0VlxENS1Q8BNJi8UPP60KzoQYF/DgU6PkgQqFlKlK
         umnwhvuWe5yt5zetE602KgNity94x/1fcrsfeAEK8V+6pxtycU+9l6zweeb3AgDpvl7s
         UpGA==
X-Forwarded-Encrypted: i=1; AHgh+RrqAkF/7i/2zk1hV1vnZRJsJfvWYviwFVxF+3naLp69urPgHwk+yCdsKiCTMrfYVxckg3MFTUNtKKMQf3/7Spw+gg==@lists.openembedded.org
X-Gm-Message-State: AFuF++lSusr8jOXPP9qbP/4G/AwOg9SEGCqMxOkBel5u8+port6NSirj
	qZxZeu+0yIPP5xRK6oNWLsAZQqS5xP2NCxCfBnaZ83eNaVSF0j67B/bgXvnNFXnj9jBVJCfxEcq
	46b4snVk=
X-Gm-Gg: AR+sD11w0danl09jko1NrN4WLOxAdL5Z/9K54ZvnxA9UvnUuHeCgYWgRd8lWMutRg/3
	OF83ccGJPWAcbpRWw61khSf4YB4yllBS1a+nqWUjhhGAp4JLaCw5++K16HDspmdtMezQAxNJNP2
	2dM490jvbHbzdNwGaBu3SQMXbXvCTq2IvMl/QyDN9IQ9D51rZ0L+UCY1jll6G1trQ7DfTpAbIy8
	mPoNZtth80Y1yw1IBlkmzb+COUoQHEPcpFnWfwcMtes9XCBTdbZ9dse3C+t7/CYwCHZoUxNLlXM
	XTN6Jy6vE2LviPNFEZnPhKIpT2UroAFKos6xVuYPdvNgYN7C7/XYcSM+06K3JODUQ+E27wsEDGJ
	T7vfjHvBxX2dXbo4Ihg1nY93xJrwdpnnvhT6+qAXQF9iklFbbxzAKy0fP8MIYfUPBotocpG1fgt
	NFw/gbW5/HeBR6yTysmHAPc8w+dOQazzGQNqX+suITDTTw+zyoM6TZJJ728TubDT0vukn0xnCO1
	leMGrnRbCi9QVFQfLWgQ0CiFFJdSSIffjQCN0QRlu/l0x4ugZM=
X-Received: by 2002:a05:6000:70a:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-482c0b94af7mr8307520f8f.14.1787310208993;
        Fri, 21 Aug 2026 04:03:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d055dsm16778574f8f.34.2026.08.21.04.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 04:03:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Aug 2026 13:03:28 +0200
Message-Id: <DKUKLAGINTTR.1W5IKJ5PRG8R7@smile.fr>
Subject: Re: [OE-core][scarthgap][patch] rpcbind: Fix CVE-2026-16277
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20260814113323.1033135-1-vanusuri@mvista.com>
In-Reply-To: <20260814113323.1033135-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 11:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243922

On Fri Aug 14, 2026 at 1:33 PM CEST, Vijay Anusuri via lists.openembedded.o=
rg wrote:
> Pick patch according to [2]
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-16277
> [2] https://security-tracker.debian.org/tracker/CVE-2026-16277
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../rpcbind/rpcbind/CVE-2026-16277.patch      | 34 +++++++++++++++++++
>  .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.=
patch
>
> diff --git a/meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch b=
/meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch
> new file mode 100644
> index 0000000000..868e5c3f01
> --- /dev/null
> +++ b/meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch
> @@ -0,0 +1,34 @@
> +From bb9bb7286a4c345442946dc2ce3c9e7f67e96d4d Mon Sep 17 00:00:00 2001
> +From: Steve Dickson <steved@redhat.com>
> +Date: Wed, 27 May 2026 11:42:11 -0400
> +Subject: [PATCH] rpcinfo: stack buffer overflow in rpcinfo rpcbaddrlist(=
)
> +
> +rpcinfo's rpcbaddrlist() formats two server-controlled, unbounded XDR st=
rings into a fixed 128-byte stack buffer with sprintf(). A malicious or on-=
path rpcbind server overflows it when a user runs:
> +rpcinfo -l <host> <prognum> <versnum>
> +
> +Reported-by: Michalis Vasileiadis <vmihalis.tmd@gmail.com>
> +Signed-off-by: Steve Dickson <steved@redhat.com>
> +
> +Upstream-Status: Backport [https://git.linux-nfs.org/?p=3Dsteved/rpcbind=
.git;a=3Dcommitdiff;h=3Dbb9bb7286a4c345442946dc2ce3c9e7f67e96d4d]
> +CVE: CVE-2026-16277
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + src/rpcinfo.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/rpcinfo.c b/src/rpcinfo.c
> +index 0e14f78..43e8115 100644
> +--- a/src/rpcinfo.c
> ++++ b/src/rpcinfo.c
> +@@ -1120,7 +1120,7 @@ rpcbaddrlist (netid, argc, argv)
> +=20
> + 	  re =3D &head->rpcb_entry_map;
> + 	  printf ("%10u%3u    ", parms.r_prog, parms.r_vers);
> +-	  sprintf (buf, "%s/%s/%s ",
> ++	  snprintf (buf, sizeof(buf), "%s/%s/%s ",
> + 		   re->r_nc_protofmly, re->r_nc_proto,
> + 		   re->r_nc_semantics =3D=3D NC_TPI_CLTS ? "clts" :
> + 		   re->r_nc_semantics =3D=3D NC_TPI_COTS ? "cots" : "cots_ord");
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipe=
s-extended/rpcbind/rpcbind_1.2.6.bb
> index dbd4d32e0a..07e2f10c98 100644
> --- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> +++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV=
}.tar.bz2 \
>             file://rpcbind.conf \
>             file://rpcbind_add_option_to_fix_port_number.patch \
>             file://0001-systemd-use-EnvironmentFile.patch \
> +           file://CVE-2026-16277.patch \
>            "
>  SRC_URI[sha256sum] =3D "5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2b=
b5e83b9defeee8de"
> =20
Hello Vijay,

Thanks for this patch, but the issue affects wrynose (1.2.8) as well.
This fix was merged upstream from 1.2.9 (yocto's master version).

Could you please submit a patch for the wrynose branch first?

Regards,
--=20
Fabien Thomas
Smile ECS


