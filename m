Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84262CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:02:39 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7112.1779264149575434300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WWL5BfV9;
 spf=pass (domain: smile.fr, ip: 209.85.218.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bd4f8260e4eso930224966b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779264148; x=1779868948; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbDtEzKPf7NSw1Ua7pWfH3YLvaBtPA1gD2kjajGuKK4=;
        b=WWL5BfV94EzcYhkhXysy0JsAwdUNQDepqHA6GqrgBu9pvWTUtZZiPz8MkdJvzKKqeD
         kyG1FpIIWXfc4Uj+DhkdK5ydtkfIWeJ9gPmrwi60/kBCL5GZqJD3K3OL7M1yNHuOs3BV
         mZXw44g0hH855X/zE03kPt/rJo1ejsA7dMTfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264148; x=1779868948;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BbDtEzKPf7NSw1Ua7pWfH3YLvaBtPA1gD2kjajGuKK4=;
        b=eZdtVy+Q0RguQzQrYeY5nTj5DD9Q6KrGMHVRbANDAeCX9ooS8fHK2ukW30/c/WwA5W
         NrCiXcaijvH72kqSHBS+E1Pp0UY33HOVffIHMpAuuZba+Zd2Z2y97uv9SurWNgJj7aMc
         eXGqrw9U3WJaaSDYReCwK3hVG7YDlqxfTl343jSdeSUe4zy72pl4HyfZvyQmRnZhCo+i
         GSD/KbYPW2tIcCkvyO74yjBzhXBAlle39yZfi/oN4ZsG+2zVjdNqP4VVYH01+jAmeMki
         SMjAOOh8uhDF0NhWUA8NDps7asKSZhjzSWIATaEDLEHOMgb7+/iQfwi/0lxMQKcPZ29H
         PlRg==
X-Forwarded-Encrypted: i=1; AFNElJ9Tvdh9lX9ZoQXs+Fy1mqMk46zgHB5gHTzDXV2mWPMeGdwm0K98s1Sd8DJ9vfNopI+ZEA1HvCopozpJhaCPOepOMg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzyo10BlXKDFKe3hbjyL7ZwzlwsrmSw/CcmqhcDcojxXg7d3AEx
	o+7iWHg9UgC/MTF5t6uBigK2Ozo8ASKiGbV73pCbtxqjLtRh6Vtcxtrv0jLfodjiiLo=
X-Gm-Gg: Acq92OGieVKGhzhb3F4qtMxujEFNxfKKU6rHMg2iEym2p7/tnMStBwtDRreQqFGNT+o
	+e4ACsyT8eEVgedTonEzBFuqlVFAx33vjATBKwJIh17W7JK459sA8ta+v6/kvtanvEjy4U98UOQ
	RFjQ/ZMTZ1+m2EQvEzRfZi+44b0Ycn5VcEIVCjNNbqT3At6J+sxlTHLs37Zp5kDz4+idcca5o3V
	PwkVROV1vL81m5DRncntcUYD7xkh4jfFRU5PrWypxiSE+6jU+2aUEVHEgzVRYELqzpMrdZl4OHT
	4gHXn0IijHAXkrje9zeqeOz8R20z9FSNIyf0MMIIvShHHkwE5VxMAg2XsdAUYYIKhkrVENIeIEE
	yFXNsb0A//WTiXwlP0E+J27YIwV9PvdiaJI8rYbA2gvy6sdEyhVhoYJQbjm/MHkUblLeA1UphBh
	neHfTYJTWYzlYflkx9AoixoqpPSTDtaxr/AwCvSCc6iI2T20vVpo89ueJwuPlQJJg+KXe8VpB7w
	x5AzUa3FmGp
X-Received: by 2002:a17:907:d0e:b0:bda:5265:423 with SMTP id a640c23a62f3a-bda52650a31mr190620266b.44.1779264147550;
        Wed, 20 May 2026 01:02:27 -0700 (PDT)
Received: from localhost (2a02-8440-250c-1761-bf48-cd02-2cb4-03a6.rev.sfr.net. [2a02:8440:250c:1761:bf48:cd02:2cb4:3a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a17a22sm52115793f8f.22.2026.05.20.01.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:02:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 10:02:25 +0200
Message-Id: <DINCI0JMLAA7.2WS7KRJDIQQX1@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 2/2] busybox: fix CVE-2026-29004
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "ChenQi" <Qi.Chen@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260519052711.3732145-1-Qi.Chen@windriver.com>
 <20260519052711.3732145-2-Qi.Chen@windriver.com>
 <DIN0GUE7HWMJ.770K6WDGCV6K@smile.fr>
 <456f3aa4-07f3-48fa-abbe-bf05565afb30@windriver.com>
In-Reply-To: <456f3aa4-07f3-48fa-abbe-bf05565afb30@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237389

On Wed May 20, 2026 at 3:47 AM CEST, ChenQi wrote:
> On 5/20/26 06:36, Yoann Congal via lists.openembedded.org wrote:
>> On Tue May 19, 2026 at 7:27 AM CEST, Chen Qi via lists.openembedded.org =
wrote:
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> Backport two patches to fix CVE-2026-29004.
>>>
>>> Reference:
>>> https://nvd.nist.gov/vuln/detail/CVE-2026-29004
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>> Hello,
>>
>> As far as I can tell, this CVE-2026-29004 also applies to master (in
>> particular, it does not looked fixed in the recent 1.38.0 upgrade).
>>
>> I can't merge this on wrynose until a fix is merged on master.
>> Can you send the equivalent fix to master?
>
> I checked this before I sent out patches. I can confirm that the issue=20
> has been fixed in 1.38.0.
>
> """
> $ grep -A 5 "Setup environment variable"=20
> busybox-1.38.0/networking/udhcp/d6_dhcpc.c
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* Setup environment variable */
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 *new_env() =3D dlist =3D xmalloc(4 + addrs * 40 + 1);
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 dlist =3D stpcpy(dlist, "dns=3D");
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 option_offset =3D 0;
>
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 while (addrs-- !=3D 0) {
> """
>
> And Andrej has already sent the 1.38.0 update for master branch.

Ah right. The github mirror is missing the 1.38.0 tag. But the commit
is listed in the changelog. So I'll add this patch to my series.

Thanks!

>
> Regards,
> Qi
>
>>
>> Thanks!
>>
>>>   .../busybox/busybox/CVE-2026-29004-01.patch   | 42 +++++++++++++++++
>>>   .../busybox/busybox/CVE-2026-29004-02.patch   | 47 ++++++++++++++++++=
+
>>>   meta/recipes-core/busybox/busybox_1.37.0.bb   |  2 +
>>>   3 files changed, 91 insertions(+)
>>>   create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-0=
1.patch
>>>   create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-0=
2.patch
>>>
>>> diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch =
b/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
>>> new file mode 100644
>>> index 0000000000..8ce4858adc
>>> --- /dev/null
>>> +++ b/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
>>> @@ -0,0 +1,42 @@
>>> +From d9a718cc17535c31d38f31fccb904a30e823166d Mon Sep 17 00:00:00 2001
>>> +From: Denys Vlasenko <vda.linux@googlemail.com>
>>> +Date: Thu, 12 Mar 2026 07:25:38 +0100
>>> +Subject: [PATCH 1/2] udhcpc6: fix buffer overflow
>>> +
>>> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
>>> +
>>> +CVE: CVE-2026-29004
>>> +
>>> +Upstream-Status: Backport [https://github.com/vda-linux/busybox_mirror=
/commit/42202bfb1e6ac51fa995beda8be4d7b654aeee2a]
>>> +
>>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> +---
>>> + networking/udhcp/d6_dhcpc.c | 6 +++---
>>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>>> +
>>> +diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
>>> +index 79cef1999..d13b05829 100644
>>> +--- a/networking/udhcp/d6_dhcpc.c
>>> ++++ b/networking/udhcp/d6_dhcpc.c
>>> +@@ -351,15 +351,15 @@ static void option_to_env(const uint8_t *option,=
 const uint8_t *option_end)
>>> + 			addrs =3D option[3] >> 4;
>>> +
>>> + 			/* Setup environment variable */
>>> +-			*new_env() =3D dlist =3D xmalloc(4 + addrs * 40 - 1);
>>> ++			*new_env() =3D dlist =3D xmalloc(4 + addrs * 40 + 1);
>>> + 			dlist =3D stpcpy(dlist, "dns=3D");
>>> + 			option_offset =3D 0;
>>> +
>>> +-			while (addrs--) {
>>> ++			while (addrs-- !=3D 0) {
>>> + 				sprint_nip6(dlist, option + 4 + option_offset);
>>> + 				dlist +=3D 39;
>>> + 				option_offset +=3D 16;
>>> +-				if (addrs)
>>> ++				if (addrs !=3D 0)
>>> + 					*dlist++ =3D ' ';
>>> + 			}
>>> +
>>> +--
>>> +2.34.1
>>> +
>>> diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch =
b/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
>>> new file mode 100644
>>> index 0000000000..734f0bbbdb
>>> --- /dev/null
>>> +++ b/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
>>> @@ -0,0 +1,47 @@
>>> +From 1e14c5c577a7bd46f42315e9bc445419770041a7 Mon Sep 17 00:00:00 2001
>>> +From: Denys Vlasenko <vda.linux@googlemail.com>
>>> +Date: Thu, 12 Mar 2026 13:23:48 +0100
>>> +Subject: [PATCH 2/2] udhcpc6: check the size of D6_OPT_IAPREFIX option
>>> +
>>> +function                                             old     new   del=
ta
>>> +option_to_env                                        694     711     +=
17
>>> +
>>> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
>>> +
>>> +CVE: CVE-2026-29004
>>> +
>>> +Upstream-Status: Backport [https://github.com/vda-linux/busybox_mirror=
/commit/d368f3f7836d1c2484c8f839316e5c93e76d4409]
>>> +
>>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> +---
>>> + networking/udhcp/d6_dhcpc.c | 7 +++++--
>>> + 1 file changed, 5 insertions(+), 2 deletions(-)
>>> +
>>> +diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
>>> +index d13b05829..1851cee2a 100644
>>> +--- a/networking/udhcp/d6_dhcpc.c
>>> ++++ b/networking/udhcp/d6_dhcpc.c
>>> +@@ -287,8 +287,8 @@ static void option_to_env(const uint8_t *option, c=
onst uint8_t *option_end)
>>> +  * |                        valid-lifetime                         |
>>> +  * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
>>> +  */
>>> +-			/* Make sure payload contains an address */
>>> +-			if (option[3] < 24)
>>> ++			/* Make sure payload exists */
>>> ++			if (option[3] < (16 + 4 + 4))
>>> + 				break;
>>> +
>>> + 			sprint_nip6(ipv6str, option + 4);
>>> +@@ -332,6 +332,9 @@ static void option_to_env(const uint8_t *option, c=
onst uint8_t *option_end)
>>> +  * |               |
>>> +  * +-+-+-+-+-+-+-+-+
>>> +  */
>>> ++			/* Make sure payload exists */
>>> ++			if (option[3] < (4 + 4 + 1 + 16))
>>> ++				break;
>>> + 			move_from_unaligned32(v32, option + 4 + 4);
>>> + 			v32 =3D ntohl(v32);
>>> + 			*new_env() =3D xasprintf("ipv6prefix_lease=3D%u", (unsigned)v32);
>>> +--
>>> +2.34.1
>>> +
>>> diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes=
-core/busybox/busybox_1.37.0.bb
>>> index 4790899684..a6abfa2598 100644
>>> --- a/meta/recipes-core/busybox/busybox_1.37.0.bb
>>> +++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
>>> @@ -64,6 +64,8 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${=
PV}.tar.bz2;name=3Dtarball \
>>>              file://0001-tar-strip-unsafe-hardlink-components-GNU-tar-d=
oes-th.patch \
>>>              file://0002-tar-only-strip-unsafe-components-from-hardlink=
s-not-.patch \
>>>              file://CVE-2024-58251.patch \
>>> +           file://CVE-2026-29004-01.patch \
>>> +           file://CVE-2026-29004-02.patch \
>>>              "
>>>   SRC_URI:append:libc-musl =3D " file://musl.cfg"
>>>   SRC_URI:append:x86-64 =3D " file://sha_accel.cfg"
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#237345): https://lists.openembedded.org/g/openembedd=
ed-core/message/237345
>> Mute This Topic: https://lists.openembedded.org/mt/119386348/3618072
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Q=
i.Chen@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
Yoann Congal
Smile ECS


