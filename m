Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECBACC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 22:15:00 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9516.1792102499276089487
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 15:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GnLKwhn8;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so36422155e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 15:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792102497; x=1792707297; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fKK2Td8ayFp8N2dg0Q9k984sHfa8ISrD+cR7V3NTHwk=;
        b=GnLKwhn8T3Brr9pu4ibDvLKf8iu1WeV/dLo5ZwRNI1XwWQZe/wHYlJ25JurBVYMjY0
         5Z1NJxg9FZ4molv85QJzX47pV6BtKG0pfKOdcm26EVUgcIvkgfK5wVOAsDJDpsAy5VYL
         hVZ8lzdo22N5jYogDR6LsiOzb9VeLs8oiqNlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102497; x=1792707297;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKK2Td8ayFp8N2dg0Q9k984sHfa8ISrD+cR7V3NTHwk=;
        b=0ZotFo1aWjm8T11+n7LNarX4e6UsinOJeaC+6FrWQRyTW6Pe/TjjASmmsa2Lk7AA4J
         60HomZCNYhlNmZ4ujdMbScasb0fjDdY62TBcXOPT4iazhBLdJIVkRLPpIXQWgNFSKXF8
         pprp+g7GFY2apXSaMrrPZP+gH5azFPPboc21wDuaSKlY0B7gBZafKY9jbr1I4SQSCr+3
         R8PWvooh8lmli6jx9EeXRUYao9V5Q2CReJYTYeKxffbrCgrMBGiU9QixjQd5Qej2Gndl
         XHt9L9zmj198maBehqKAROGFgzXx5oWU/58bCFOhfzk6xbHzrA3JjiMGtD8Jmu5oks2U
         hDcA==
X-Forwarded-Encrypted: i=1; AKwUvBwfgGJK+yYOSy0/z6/d8kFbhJ1WAuYcHjug5OYhHLggABxgY+d+4uFobYqcy9EWHIIGqQ4WdseyxxNZDe9k0bho+w==@lists.openembedded.org
X-Gm-Message-State: AFq9FYL215F3N7omoZrz30kHiCjoEz4HP4pGNbc/jixp73q5eXQ7vnpi
	uzZsovuBh70+2M2sPCm2AeexU1N6rL7on6e4b6Vevy+is+l2baN8G4fM0yIj/eZ1/x8=
X-Gm-Gg: AYBFou0FLfx/gAjfFfHhUPlhXkgOjoaLNY6+okO7l4dBgfzE9C+5J+EdVY1USniHtPx
	HKr/3DyvZY+D+R6JkDSD1dOSO3dPnwZY5Dt1s2+5IiQwiNw4GQkUfX26nr2FN83NwqujEYa/F3K
	IDxJd6L2oHFyqE0O9+1/kYSlH2xuoC+GBIbi6nPbp6W4p/ZajYkPECBa1hcae1GhdabfKMsMZPU
	uyASq8xJ/T3wyR2ZFikk9TvkzQjtO0BxoOpz0hdx5JHJ+/gR/0GYpTVXVzQ2k6V7DMvkxBmpUh8
	tFBDJJRieCejBIYY/CarjUt2dBW5cl+FHfChPgrAC1cgdyUj/Bfl4rcNPQtPn/EeWzvLTvJ5ZPh
	kE2TSVcmziXkT+uKMOhYmOb5VLdHO7Ln1h7ISoW9MzQpljb8NcBFWYljhsvSYsk6E7o0kL4VeXK
	dOWS9QAfDMsSisVNYDXz2bWZ9lOo944gpraYLIbcIqZB9C7DsnDAJVW8OoC7KCXtKIGU0ONpYa2
	LYys7+dLYfOrkIrHPuOgaISL9T8xPvb/vLMA1OwKzTodhViAgy3P3mdqo/RPgZ5WtqqD9ok
X-Received: by 2002:a05:600c:548e:b0:49f:f9d1:e618 with SMTP id 5b1f17b1804b1-4a18e4aa057mr420893295e9.17.1792102497262;
        Thu, 15 Oct 2026 15:14:57 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ab8bb2sm7058015e9.1.2026.10.15.15.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 15:14:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 00:14:56 +0200
Message-Id: <DM5RBD9MJT2O.2M12R8AMW5OLY@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches from
 u-boot
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Hetvi Thakar" <hthakar@cisco.com>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260923173850.21338-1-peter.marko@siemens.com>
In-Reply-To: <20260923173850.21338-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 22:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247900

On Wed Sep 23, 2026 at 7:38 PM CEST, Peter Marko via lists.openembedded.org=
 wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> After sharing CVE_PRODUCT between u-boot and u-boot-tools CVEs
> patched in u-boot showed-up in CVE reports for u-boot-tools.
>
> It does not make much sense to share git repository but not share all
> patches on top of it, so move adding all patches from u-boot recipe to a
> common include file where also the git repository is defined.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-common.inc       | 10 ++++++++++
>  meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb |  2 --
>  meta/recipes-bsp/u-boot/u-boot_2024.01.bb       | 12 ------------
>  3 files changed, 10 insertions(+), 14 deletions(-)

Hello Peter, Hetvi,

There is a bit of back-and-forth around u-boot-common.inc. So I thought I
would give my vision and get your thoughts.

Fundamentally, there is confusion about the usage of this .inc file:
* This is the common part of u-boot and u-boot-tools recipes (what the
  above patch uses)
* But, also, this may be used by downstream layers to reuse u-boot
  recipe parts. We basically did the revert of Peter's patch a few month
  ago for this reason[0].

With Paul, we would like to have a single set of patches common for both
u-boot and u-boot-tools, but that can't be in u-boot-common.inc as there
is a risk of breaking downstream layers.

Our idea is to create a new inc file "u-boot-common-patches.inc" (I'm
not attached to the name) that contains only SRC_URI +=3D "CVE_*.patch"
and a big warning explaining that is file is only supposed to be
included from layer-local recipes (namely u-boot and u-boot-tools).

This whole situation is not ideal but think the above would solve our
issues and still be acceptable under stable policy.

What do you think?

Regards,

[0]: u-boot: move CVE patches out of the common .inc file - openembedded-co=
re - OpenEmbedded Core layer
     https://git.openembedded.org/openembedded-core/commit/?id=3Df4ced8ff03=
147dd532a88cf3ce08d61fab057522
--=20
Yoann Congal
Smile ECS


