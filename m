Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96926EE49A3
	for <webhook@archiver.kernel.org>; Sun, 20 Aug 2023 00:31:24 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.21220.1692491482329929154
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Aug 2023 17:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout02.t-online.de (Postfix) with SMTP id 51A732221C;
	Sun, 20 Aug 2023 02:31:20 +0200 (CEST)
Received: from [192.168.0.109] ([24.134.105.89]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qXWLf-3Y5iym0; Sun, 20 Aug 2023 02:31:19 +0200
Date: Sun, 20 Aug 2023 02:31:13 +0200
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCHv2] gtk4: upgrade 4.10.5 -> 4.12.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <1SYNZR.YGJKMZAB9Y9V3@t-online.de>
In-Reply-To: <CAMKF1spUD6Lh-GoshPq9g9r4Y7LkHDUczJycP38hg4MABMwTFQ@mail.gmail.com>
References: <20230815145218.1561896-1-f_l_k@t-online.de>
	<CAMKF1spOpBLBQ4ENJGdidsCHbX0faejtvrB7rWmwPFBQjP2ZJQ@mail.gmail.com>
	<IHIJZR.16XNVQ6SKCIP1@t-online.de>
	<CAMKF1soQSYA1xg8iDciyVxxZSqxekVOv-tjaojiXXqgOqU4Pqg@mail.gmail.com>
	<G7LLZR.6FLOA2CLJNX21@t-online.de>
	<CAMKF1spUD6Lh-GoshPq9g9r4Y7LkHDUczJycP38hg4MABMwTFQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Wl1l3KiVQMKwRiBeRtye"
X-TOI-EXPURGATEID: 150726::1692491479-BCFFAEAB-E6A35DB6/0/0 CLEAN NORMAL
X-TOI-MSGID: ba6599fa-939f-4e07-a03c-caaf15a36713
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 00:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186403

--=-Wl1l3KiVQMKwRiBeRtye
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Interesting.

vulkan_core.h should normally define VK_USE_64_BIT_PTR_DEFINES 0 on=20
32bit platforms
<https://github.com/KhronosGroup/Vulkan-Headers/blob/85c2334e92e215cce34e8e=
0ed8b2dce4700f4a50/include/vulkan/vulkan_core.h#L29>

vulkan_core.h is added by vulkan.h which is only included in=20
gdkvulkancontext.h when vulkan was enabled in meson

<https://gitlab.gnome.org/GNOME/gtk/-/blob/main/gdk/gdkvulkancontext.h#L29>

So if the problem only occurs on 32 bit and with vulkan disabled, my=20
theory would be that the issue can be avoided by at least adding=20
vulkan_core.h in any case

#ifdef GDK_RENDERING_VULKAN
#include <vulkan/vulkan.h>
#else
#include <vulkan/vulkan_core.h>
#endif

On Sat, Aug 19 2023 at 09:23:47 AM -07:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
> This is also reported upstream see
>=20
> <https://gitlab.gnome.org/GNOME/gtk/-/issues/6033>
>=20
> I have proposed a workaround in meta-clang for now
> <https://github.com/kraj/meta-clang/pull/843>
>=20
> Thanks
> -Khem
>=20
> On Fri, Aug 18, 2023 at 10:43=E2=80=AFAM Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  On Thu, Aug 17 2023 at 08:12:56 AM -07:00:00, Khem Raj=20
>> <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> wrote:
>>=20
>>  Perhaps need libgcc dev package on build host
>>=20
>>=20
>>  Unfortunately that didn't help


--=-Wl1l3KiVQMKwRiBeRtye
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Interesting.</div><div><br></div><=
div>vulkan_core.h should normally define VK_USE_64_BIT_PTR_DEFINES 0 on 32b=
it platforms</div><div><a href=3D"https://github.com/KhronosGroup/Vulkan-He=
aders/blob/85c2334e92e215cce34e8e0ed8b2dce4700f4a50/include/vulkan/vulkan_c=
ore.h#L29">https://github.com/KhronosGroup/Vulkan-Headers/blob/85c2334e92e2=
15cce34e8e0ed8b2dce4700f4a50/include/vulkan/vulkan_core.h#L29</a></div><div=
><br></div><div>vulkan_core.h is added by vulkan.h which is only included i=
n gdkvulkancontext.h when vulkan was enabled in meson</div><div><br></div><=
div><a href=3D"https://gitlab.gnome.org/GNOME/gtk/-/blob/main/gdk/gdkvulkan=
context.h#L29">https://gitlab.gnome.org/GNOME/gtk/-/blob/main/gdk/gdkvulkan=
context.h#L29</a></div><div><br></div><div>So if the problem only occurs on=
 32 bit and with vulkan disabled, my theory would be that the issue can be =
avoided by at least adding vulkan_core.h in any case</div><div><br></div><d=
iv>#ifdef GDK_RENDERING_VULKAN</div><div>#include &lt;vulkan/vulkan.h&gt;</=
div><div>#else</div><div>#include &lt;vulkan/vulkan_core.h&gt;</div><div>#e=
ndif</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Sat, Aug 19 202=
3 at 09:23:47 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><=
blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: bre=
ak-spaces;">This is also reported upstream see

<a href=3D"https://gitlab.gnome.org/GNOME/gtk/-/issues/6033">https://gitlab=
.gnome.org/GNOME/gtk/-/issues/6033</a>

I have proposed a workaround in meta-clang for now
<a href=3D"https://github.com/kraj/meta-clang/pull/843">https://github.com/=
kraj/meta-clang/pull/843</a>

Thanks
-Khem

On Fri, Aug 18, 2023 at 10:43=E2=80=AFAM Markus Volk &lt;<a href=3D"mailto:=
f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 On Thu, Aug 17 2023 at 08:12:56 AM -07:00:00, Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:

 Perhaps need libgcc dev package on build host


 Unfortunately that didn't help
</blockquote></div></blockquote></div>
--=-Wl1l3KiVQMKwRiBeRtye--


