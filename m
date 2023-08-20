Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE0DEE49A3
	for <webhook@archiver.kernel.org>; Sun, 20 Aug 2023 00:43:54 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.21249.1692492226992408778
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Aug 2023 17:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QOu7lxSh;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-56ee1ed7781so782501eaf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Aug 2023 17:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692492226; x=1693097026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=peVXviW9eheCCZIT+POTqMa4PtzCEgvRq7O6nvJFuu0=;
        b=QOu7lxShwpAj6q8nHwl9cHzh5pvwDxqjVhmKMaYsKQ1e1nvVISVqTQEBtkS8rwM/7Y
         1cq+T4BIwTHKelS2s0tcEbe8jGyRbUpvPSlPIEg/yUEzomCqkGYdPLkk9svX+2PdvLCB
         ePctmQY9UgKolMxtc3WOKI5TFs9P7qdSCnb9VVt67qRdwWT2pugbe9ypKMmhxvAKqipU
         279nuKpNTrlvnAXhvrPhuo/Bov6GigzdsN1p+XLal0IAWDccfrrkE8YVz7bGUwAcVgxi
         D+wkCjtoJa/NgazIfQoYkoKQQp+LLkzpzeGwykk99oBx26gE0lub8MhFhcLB8b+Y6Ziy
         OHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492226; x=1693097026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peVXviW9eheCCZIT+POTqMa4PtzCEgvRq7O6nvJFuu0=;
        b=dBZYW+Peqx8TAfuQGURFCGxKkLZF7vuv/3yDkOHjnT8d1YhNg6D3ogoVlj1ASvQlHQ
         zZ8tSs/TPG7+On5o2yX+dD1OG3B7dNO2Olosml7fKJ76Zs14Sc9fQPv79KtzqkptYwJi
         w2s1g7cytBbUi0RAadbu/+3fVFs56++76bHk7RemSW3xUGgTzUJtau8aOJFE4L8M3AoH
         4yfsBOTFM1LRxPrpT9coRRFqhRtgIlC3bJY+0p5xBhgM6YjJObDSiou1rkxoMm8FE2c+
         f2uOnH8N41UImqfDGVnneURIAFIWicjIBSItDovC/VSzCZ6Wh1qy8doWv8KvFdcGL4Jg
         5rgA==
X-Gm-Message-State: AOJu0YxYX81TQqlJ9mUrCqfLYlM9OEg/yF+wuXh9HLpkt3DCJIH+9j3O
	RQxxzzOTbkzd60QNU5Gur8Syc2cAprU9eIJjKNQ=
X-Google-Smtp-Source: AGHT+IFDx2x1hsH1MlX3gvC69ggrsIR3hV3OGhN4p77zjTti+f5Tv0n8OmqxA7l5vyO3KSs1NFH57UqdbVMcgdpl+X4=
X-Received: by 2002:a05:6870:e387:b0:1bf:1c49:7455 with SMTP id
 x7-20020a056870e38700b001bf1c497455mr4436925oad.6.1692492226172; Sat, 19 Aug
 2023 17:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230815145218.1561896-1-f_l_k@t-online.de> <CAMKF1spOpBLBQ4ENJGdidsCHbX0faejtvrB7rWmwPFBQjP2ZJQ@mail.gmail.com>
 <IHIJZR.16XNVQ6SKCIP1@t-online.de> <CAMKF1soQSYA1xg8iDciyVxxZSqxekVOv-tjaojiXXqgOqU4Pqg@mail.gmail.com>
 <G7LLZR.6FLOA2CLJNX21@t-online.de> <CAMKF1spUD6Lh-GoshPq9g9r4Y7LkHDUczJycP38hg4MABMwTFQ@mail.gmail.com>
 <1SYNZR.YGJKMZAB9Y9V3@t-online.de>
In-Reply-To: <1SYNZR.YGJKMZAB9Y9V3@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Aug 2023 17:43:35 -0700
Message-ID: <CAMKF1sr2oP1qNP51Dxm_mHcz607eqWToUVN3_Duj_iD9NNvdHg@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] gtk4: upgrade 4.10.5 -> 4.12.0
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ed1c4c0603500d65"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 00:43:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186404

--000000000000ed1c4c0603500d65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 19, 2023 at 5:31 PM <f_l_k@t-online.de> wrote:

> Interesting.
>
> vulkan_core.h should normally define VK_USE_64_BIT_PTR_DEFINES 0 on 32bit
> platforms
>
> https://github.com/KhronosGroup/Vulkan-Headers/blob/85c2334e92e215cce34e8=
e0ed8b2dce4700f4a50/include/vulkan/vulkan_core.h#L29
>
> vulkan_core.h is added by vulkan.h which is only included in
> gdkvulkancontext.h when vulkan was enabled in meson
>
> https://gitlab.gnome.org/GNOME/gtk/-/blob/main/gdk/gdkvulkancontext.h#L29
>
> So if the problem only occurs on 32 bit and with vulkan disabled, my
> theory would be that the issue can be avoided by at least adding
> vulkan_core.h in any case
>
> #ifdef GDK_RENDERING_VULKAN
> #include <vulkan/vulkan.h>
> #else
> #include <vulkan/vulkan_core.h>
> #endif
>


Possibly a good fix I think you should propose it at the bug I pointed out

>
> On Sat, Aug 19 2023 at 09:23:47 AM -07:00:00, Khem Raj <raj.khem@gmail.co=
m>
> wrote:
>
> This is also reported upstream see
> https://gitlab.gnome.org/GNOME/gtk/-/issues/6033 I have proposed a
> workaround in meta-clang for now
> https://github.com/kraj/meta-clang/pull/843 Thanks -Khem On Fri, Aug 18,
> 2023 at 10:43=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wrote:
>
> On Thu, Aug 17 2023 at 08:12:56 AM -07:00:00, Khem Raj <raj.khem@gmail.co=
m>
> wrote: Perhaps need libgcc dev package on build host Unfortunately that
> didn't help
>
>

--000000000000ed1c4c0603500d65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Aug 19, 2023 at 5:31 PM &lt;<a href=3D"mailto:f_l_k=
@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D"m_7777711248127172478geary-body" dir=3D"auto"><div=
>Interesting.</div><div><br></div><div>vulkan_core.h should normally define=
 VK_USE_64_BIT_PTR_DEFINES 0 on 32bit platforms</div><div><a href=3D"https:=
//github.com/KhronosGroup/Vulkan-Headers/blob/85c2334e92e215cce34e8e0ed8b2d=
ce4700f4a50/include/vulkan/vulkan_core.h#L29" target=3D"_blank">https://git=
hub.com/KhronosGroup/Vulkan-Headers/blob/85c2334e92e215cce34e8e0ed8b2dce470=
0f4a50/include/vulkan/vulkan_core.h#L29</a></div><div><br></div><div>vulkan=
_core.h is added by vulkan.h which is only included in gdkvulkancontext.h w=
hen vulkan was enabled in meson</div><div><br></div><div><a href=3D"https:/=
/gitlab.gnome.org/GNOME/gtk/-/blob/main/gdk/gdkvulkancontext.h#L29" target=
=3D"_blank">https://gitlab.gnome.org/GNOME/gtk/-/blob/main/gdk/gdkvulkancon=
text.h#L29</a></div><div><br></div><div>So if the problem only occurs on 32=
 bit and with vulkan disabled, my theory would be that the issue can be avo=
ided by at least adding vulkan_core.h in any case</div><div><br></div><div>=
#ifdef GDK_RENDERING_VULKAN</div><div>#include &lt;vulkan/vulkan.h&gt;</div=
><div>#else</div><div>#include &lt;vulkan/vulkan_core.h&gt;</div><div>#endi=
f</div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Possibly a good fix I think you should propose it =
at the bug I pointed=C2=A0out</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D"m_7777711248127172478geary-body" dir=3D"auto"><div dir=3D"auto"></div><=
/div><div id=3D"m_7777711248127172478geary-quote" dir=3D"auto"><br>On Sat, =
Aug 19 2023 at 09:23:47 AM -07:00:00, Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br><block=
quote type=3D"cite"><div style=3D"white-space:break-spaces">This is also re=
ported upstream see

<a href=3D"https://gitlab.gnome.org/GNOME/gtk/-/issues/6033" target=3D"_bla=
nk">https://gitlab.gnome.org/GNOME/gtk/-/issues/6033</a>

I have proposed a workaround in meta-clang for now
<a href=3D"https://github.com/kraj/meta-clang/pull/843" target=3D"_blank">h=
ttps://github.com/kraj/meta-clang/pull/843</a>

Thanks
-Khem

On Fri, Aug 18, 2023 at 10:43=E2=80=AFAM Markus Volk &lt;<a href=3D"mailto:=
f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 On Thu, Aug 17 2023 at 08:12:56 AM -07:00:00, Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:

 Perhaps need libgcc dev package on build host


 Unfortunately that didn&#39;t help
</blockquote></div></blockquote></div></blockquote></div></div>

--000000000000ed1c4c0603500d65--

