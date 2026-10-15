Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E6FCC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 22:17:10 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9446.1792102619539780269
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 15:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iFPqmUy0;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso54436185e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 15:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792102618; x=1792707418; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6Rb3z4O+CKF2mi8VhHU1pd4caCxHpvDcd8p4PQKJM6U=;
        b=iFPqmUy06zjSWWR90jkfcjno0KLr6VVtK78pBu4q80WWBd73Qm5FLSXMIK1xg1CfQd
         eCrK0WJPoWdw8GIIqTv1oQBZdA3tF2f0EckAKu2bwckN50AZ+jQdkuEK0jjz4FZ7iVpw
         L4cXNogzAgdOP8Ilia8E2rqIeZgCnDoMrW1Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102618; x=1792707418;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Rb3z4O+CKF2mi8VhHU1pd4caCxHpvDcd8p4PQKJM6U=;
        b=GRt4ibkCgwYQHkOwEGMCewgR+IJg2U/4M82+sONOdIHdsnGjGBu0iFFpGms6Khiiy3
         smkDXYk8ab/SXOc4KQBOUvHNQbsj0K+7QPJIWSEiWQgYs3j7l56MAyPu3DZVXvusxZxo
         LmS4/jOg1qLlYxrai3GNfK9KqbHc5gaxfmXmiGrT1LYyMBwNOY9XJ8vAOOPlakrQtZdp
         zNy2mlBplNmZi8C4u/ZxA8SnyFipFRD/id7l+uoVS581V4k0eHgI8bKW4c0FbX8DqDKC
         qgQbasurJcQQDtaFqHyr/Pe8ir/nrdmdt0QzYLbI9Tn+D7QQ452DumGGLgOGFwyidk42
         3PSw==
X-Forwarded-Encrypted: i=1; AKwUvBx71mNgu4bWlthkOZynTIyOUwG5Q+NbQlIbTdyBVBfDR1yOAa1fFMknHCrCFQ3zd4wROiqAvcH1eamoF1VilpJe9g==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIC/GLGeDIO5qK64F8mmReQ6PPVaDjTLdzXr3oMOfG1gIbSJvRQ
	AVe3o8XAmUtNUR7TAIWH4AK+wP+seShon/Ul2NdmV8P4f13mhsYPOnzppmfXRwAKz4c=
X-Gm-Gg: AYBFou0t6o3sHq5Dx75wfwk4wSD53j+k5g8SsUs0DnNCuB6IsVIpP/Wuix/wlb7kVbb
	Cd5sgX+vQ2cC5v8Dff5f3RcsXAqtCKEEsX5Qp7wTBi3VHLSXm8CKLA8biNCPHWll71SbaLlChaM
	UBHSHMc2fJouh1bEc3D6ZHBJYXYrBWMyUARTgSMXPfbGxp4RRCFbIXLxUVOK8c+xQE+cEVs22cu
	LsQGDuUhJLEFvV9uB0uxNZUMqVfCdlLVmuDU2/R5temVi0rHOa3AnYlWHEIPWZp7/IMTBwX5U/B
	I4owYawwTCYB/Sdu1mxTiyWMjxmc14HBVtAdRtFh7yRGmpLBsxtD4rXRymYMwYtBGuXoAk4Ln34
	5etM6iMEI+uLW+CerqhQ/2xSQSJYVuJgdIVC7//OWclFIrAa6eWIda71c346jg6IDyHVJKvcL15
	P1NPBOS92I7BURukuLixKMPRvvl992DLhKJlEczy8V1jjRZIWzQel+EQbz+EYS7cmU2c5ahm1tj
	8IKZ/Oh3H94CRV624NJM4pdTahB3aHkkD3NRr2hEbpaCHFid7367qV5Z0W1fg==
X-Received: by 2002:a05:600c:a112:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4a1966379f7mr297703065e9.11.1792102616205;
        Thu, 15 Oct 2026 15:16:56 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5b2dsm845186f8f.31.2026.10.15.15.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 15:16:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 00:16:55 +0200
Message-Id: <DM5RCW1TRHK2.PULTXANX1CJY@smile.fr>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][Patch 02/11] u-boot-tools: Ignore
 CVE-2024-42040
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Peter Marko" <peter.marko@siemens.com>
X-Mailer: aerc 0.20.0
References: <cover.1787731424.git.hthakar@cisco.com>
 <240b02378283bcfe760e1902a29fad5361fda380.1787731424.git.hthakar@cisco.com>
 <DLCHXHGCOH27.3OW22UEZ4WRRG@smile.fr> <DLCI03E7XIUV.244KWPU4PD674@smile.fr>
 <967518.1790247412147100715@lists.openembedded.org>
 <2269369.1792050860134896226@lists.openembedded.org>
In-Reply-To: <2269369.1792050860134896226@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 22:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247901

On Thu Oct 15, 2026 at 9:54 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> On Thu, Sep 24, 2026 at 04:26 PM, Hetvi Thakar -X (hthakar - E INFOCHIPS =
PRIVATE LIMITED at Cisco) wrote:
>
>>=20
>> On Fri, Sep 11, 2026 at 06:19 PM, Yoann Congal wrote:
>>=20
>>> On Fri Sep 11, 2026 at 2:46 PM CEST, Yoann Congal wrote:
>>>=20
>>>> On Wed Aug 26, 2026 at 10:12 AM CEST, Hetvi Thakar -X (hthakar - E
>>>> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>>>>=20
>>>>> From: Hetvi Thakar <hthakar@cisco.com>
>>>>>=20
>>>>> Analysis:
>>>>> - CVE-2024-42040 affects the U-Boot DHCP client in net/bootp.c [1].
>>>>> - u-boot-tools uses tools-only_defconfig, where CONFIG_NET is disable=
d
>>>>> [2].
>>>>> - Hence ignore this CVE for u-boot-tools; the exclusion is
>>>>> configuration-based.
>>>>>=20
>>>>> Reference:
>>>>> [1] https://nvd.nist.gov/vuln/detail/CVE-2024-42040
>>>>> [2] https://github.com/u-boot/u-boot/blob/866ca972d6c3/configs/tools-=
only_defconfig
>>>>>=20
>>>>>=20
>>>>> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
>>>>> ---
>>>>> meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb | 2 ++
>>>>> 1 file changed, 2 insertions(+)
>>>>>=20
>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
>>>>> b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
>>>>> index 4b6d89ed4e..b5711e1f97 100644
>>>>> --- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
>>>>> @@ -2,3 +2,5 @@ require u-boot-common.inc
>>>>> require u-boot-tools.inc
>>>>>=20
>>>>> SRC_URI +=3D "file://CVE-2026-46728.patch"
>>>>> +
>>>>> +CVE_STATUS[CVE-2024-42040] =3D "not-applicable-config: DHCP client c=
ode in
>>>>> net/bootp.c is not built by tools-only_defconfig, which disables
>>>>> CONFIG_NET."
>>>>=20
>>>> Hello,
>>>>=20
>>>> I don't think we need this because, even if the code is not compiled, =
it
>>>> has been fixed earlier in scarthgap:
>>>> See 5c086db3f44 (u-boot: fix CVE-2024-42040, 2025-10-29)
>>>> Same reasonning apply to other patches in this series. Can you check i=
f
>>>> we really need those?
>>>>=20
>>>> Thanks!
>>>=20
>>> In the meantime, I took 1/11 in my branch and held the rest (2-11/11).
>>> Be aware of this if you send a new series.
>>=20
>>=20
>> Hi Yoann,
>>=20
>> Thanks for pointing this out.
>>=20
>> The referenced fix was initially added in u-boot-common.inc, where
>> it applied to both u-boot and u-boot-tools. It was later moved to
>> u-boot.inc [1], so it now applies only to the u-boot recipe and
>> not to u-boot-tools.
>>=20
>> u-boot-tools does not inherit u-boot.inc; it uses
>> u-boot-common.inc and u-boot-tools.inc. Therefore, the existing
>> CVE status is no longer applied to u-boot-tools.
>>=20
>> The CVE is still reported against u-boot-tools because its
>> CVE_PRODUCT [2] maps to the U-Boot product. However, u-boot-tools
>> uses tools-only_defconfig, where CONFIG_NET is disabled, so the
>> vulnerable DHCP client code in net/bootp.c is not compiled.
>>=20
>> Therefore, the proposed change only adds a recipe-specific CVE status
>> for u-boot-tools; it does not duplicate the source fix.
>>=20
>> I also noticed Peter's proposed change [3], which moves these CVE
>> patches from u-boot.inc to u-boot-common.inc. Since
>> u-boot-common.inc is inherited by both u-boot and u-boot-tools,
>> this would cause all of those patches to be applied to u-boot-tools
>> as well.
>>=20
>> I don't think this move is necessary, since not all of the affected
>> code is built by u-boot-tools. The actual source fixes should remain
>> with u-boot, where they are required. For u-boot-tools, the CVEs
>> whose vulnerable code is not compiled can instead be handled with the
>> appropriate CVE_STATUS entries.
>>=20
>> References:
>> [1]
>> https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=
=3Df4ced8ff03147dd532a88cf3ce08d61fab057522
>>=20
>> [2]
>> https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=
=3D9170fe393c379b9161a8843506420269f5b53e40
>>=20
>> [3]
>> https://patchwork.yoctoproject.org/project/oe-core/patch/20260923173850.=
21338-1-peter.marko@siemens.com/
>
> Hi Yoann,
> Any update on this?
>
> Regards,
> Hetvi

Hello,

Sorry I meant to answer earlier but didn't :(

I've put my thoughts under Peter's patch:
Re: [OE-core] [scarthgap][PATCH] u-boot-tools: use all patches from u-boot
https://lore.kernel.org/all/DM5RBD9MJT2O.2M12R8AMW5OLY@smile.fr/

Let's continue the conversation there.
--=20
Yoann Congal
Smile ECS


