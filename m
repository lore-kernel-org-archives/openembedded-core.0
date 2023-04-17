Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32C3C77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 17:54:51 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by mx.groups.io with SMTP id smtpd.web10.3113.1681754083523843211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 10:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=christoph.lauer@email.de header.s=s29768273 header.b=K3dM3rc9;
 spf=pass (domain: email.de, ip: 212.227.17.12, mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=email.de;
	s=s29768273; t=1681754080; i=christoph.lauer@email.de;
	bh=EGc81aUXVmThc7GRHr7jWCm0KX071UW0TIUkxC3/crM=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=K3dM3rc9tNk6nrpC8KBEKRR6pbLFy9sCLtjc4CDDVEer/SYX3mqbUVdXvkmScdghS
	 quW6+aVkM47uUJarro2fVjBhTaDZ+EkisfPq9aPGQzI9+GMj5Mwk9olX/dtqQ3PhcL
	 B5ikPlZkDX+dcNHzyMiimRouesWWqP04NIP6r5rk16bcoAfwDpnqw681vGYGHHfTZv
	 0uojwReWdR1k7lTf5GzaWHLkw82wZq16lWfkgHL4e4jnBiWCZViZeJff4tSaiN4gPf
	 NOuhMrdwkLPqs5QMqUj3nuFRIadOjCrDle7Hg8mEwszaoEQXrIbrl6jUt8u5CjNo4t
	 YyuOh6gThT+1w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.35] ([91.23.94.88]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYLii-1ptXFK0G94-00VfgY; Mon, 17
 Apr 2023 19:54:40 +0200
Message-ID: <7dff700b-49ae-d924-5ef0-4ad92ad055b4@email.de>
Date: Mon, 17 Apr 2023 19:54:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Christoph Lauer <christoph.lauer@xtronic.de>
References: <20230416103052.28268-1-christoph.lauer@email.de>
 <CANPvuRm3KYY4GbKJ6c37fO0-J=JN_1dxsqcGSQLoS+xjR9DxTA@mail.gmail.com>
Content-Language: en-US
From: Christoph Lauer <Christoph.Lauer@email.de>
In-Reply-To: <CANPvuRm3KYY4GbKJ6c37fO0-J=JN_1dxsqcGSQLoS+xjR9DxTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EjK9pwMT2nlOBFbdYZ3JOqi7j7/AQ8pQEmstaJ7hkYxa8GCxED0
 y96+/CV25IUP3Q7LnDtArnCxXhErG4OtXpsS3VfQplJjMEPdN1YN42+urrBplNBH/QrzmTh
 IwZq35wgUQPgDztnyEcWV0GaE+QtEeumoY6OOVi82nYnI1KgeabojpZr06zcW1x5f/YNQuY
 cdxuQaPPIa787CV2SE4Zw==
UI-OutboundReport: notjunk:1;M01:P0:T+e8IsIx04E=;8yOWOuETnUh1V1AupxbJqS0occP
 F2WDmqGwvYvdxuLyWBPoCHuHl+w5w+xFETzTGrTY3z2FUzTAQG9XyHuxNoSTe4k2oyfTEDM1d
 6Xq6UHg+SGcJXSLT1qxpz8s/SoKiGIK2+T/daGDfgDgMeFY57DeDSLJtl8MP2QnIadGJyYx/q
 N+Gf00/koShouVVcRShQVorx+yO+dECtHWBSUeTDLepKoVUSWAmA/dl0aZgvOvp6dTpDUz+Gx
 PXL0knWC8CYi61QW5t5GsFDJKYvh5g48Lv51PiGzURDgnCUAqKhYdcRRO5u/MEiVIlaQhW98z
 qZoZrFLXrsJcdYG8xilY4rnWv7FiljEz24YmIdB5WWy4AjKbzy0NK/OgIiPGdCx8VYWA8Q3Mr
 DlAVakgmNsc2XDbUpSmQaslP+MrrYM/bxyLXv0DD7sljDRyISjhpn/fZZXsxygV5NWGao1zuo
 M4MoQSeF7sVCRXflf1Xb1qeAoZqOU6TFcpT3pyIctdK3FNb+RKG2t5NvLYI7K4lLTa52KegqL
 +bDJkIDa8N4t2vQHLbZE5Mot7HPtK6VvjqsDvLo401qpxZnP2jgyEPabck1z1iVvN60Vmkc4H
 CM4jj7VDUg+qUIpMsNMbiN3+X0US8iS0K7gttEWe7ir4iAmpkg9BCsf7NCbxZAH47dCNaeq0V
 G4Jf4w5SzF6HtviLg4TM2GS00X3P8Hi0b6sbg7m45jaIijEtkXY+9P3gS8zP99dUC9/1gNGYI
 KI2WHvhzjnbrmZ9hfpOi3XttM51T+ieaa1tB5cZgWtBbRGJpExyVopZple30WAK4U7VsPmuCh
 lXc2A8YDpSPXkE5zEr2WWx/jB4QRrMEHbLoRJBqrXe+tp3LRIcr36lVSlkEUONQdIhV/HjLvJ
 inrs7X46pFNV55yVtd4ZUKM945Mks5U34TSO5E0Qv8M/of9luNb4EbI8ddEkGgnVcTd9v9tTK
 Q1IS2oZvhapQehEAOKXroLZaX08=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 17:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180165

Hi Jose,

Thanks for your comment; I intend to backport the patch to all actively
maintained branches once it is accepted for master merge.

Christoph

Am 17.04.23 um 12:19 schrieb Jose Quaresma:
> Hi Christoph,
>
> This patch is also applicable on kirstone so it can be backported.
> I use in my distro=C2=A0RM_WORK_EXCLUDE +=3D "make-mod-scripts" but your=
 fix
> looks better.
> Thanks.
>
> Jose
>
> Christoph Lauer <christoph.lauer@email.de
> <mailto:christoph.lauer@email.de>> escreveu no dia domingo, 16/04/2023
> =C3=A0(s) 11:31:
>
>     From: Christoph Lauer <christoph.lauer@xtronic.de
>     <mailto:christoph.lauer@xtronic.de>>
>
>     With rm_work active, external module signing throws an error:
>     scripts/sign-file: error while loading shared libraries:
>     libcrypto.so.3: cannot open shared object file: No such file or
>     directory
>     Preserve libraries that sign-file script needs during runtime.
>
>     Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de
>     <mailto:christoph.lauer@xtronic.de>>
>     ---
>      =C2=A0meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>     <http://make-mod-scripts_1.0.bb> | 3 +++
>      =C2=A01 file changed, 3 insertions(+)
>
>     diff --git
>     a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>     <http://make-mod-scripts_1.0.bb>
>     b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>     <http://make-mod-scripts_1.0.bb>
>     index 28e0807d1d..0e24efc597 100644
>     --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>     <http://make-mod-scripts_1.0.bb>
>     +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>     <http://make-mod-scripts_1.0.bb>
>     @@ -32,3 +32,6 @@ do_configure() {
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -C ${STAGIN=
G_KERNEL_DIR}
>     O=3D${STAGING_KERNEL_BUILDDIR} $t
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
>      =C2=A0}
>     +
>     +# keep native libraries required for module signing
>     +RM_WORK_EXCLUDE_ITEMS +=3D "recipe-sysroot-native"
>     --
>     2.17.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#180113):
>     https://lists.openembedded.org/g/openembedded-core/message/180113
>     <https://lists.openembedded.org/g/openembedded-core/message/180113>
>     Mute This Topic: https://lists.openembedded.org/mt/98296212/5052612
>     <https://lists.openembedded.org/mt/98296212/5052612>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [quaresma.jose@gmail.com <mailto:quaresma.jose@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma

