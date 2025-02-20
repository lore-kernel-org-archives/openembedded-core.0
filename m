Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2A9C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 10:19:51 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.46204.1740046788416384948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 02:19:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kB2LvVQ3;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6dd15d03eacso7496906d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 02:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740046787; x=1740651587; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eGRczv/8j4OMJoWA7ia2C5g1KcRfK9iPCRYD/JgzmM4=;
        b=kB2LvVQ3oL6Ub3bz2dexy1kDQ4vslY7nxhAUAFaF1H7ocigP4YrhOHSycbGcOOzHYU
         EgAloPSYgLFDTYK75NRwvSWrp/txabuiepjZNZli7DFQeLxQof4ejbwi2V62w7+mHrcr
         OgzDL4TbMhH41qHZNJfRGNPKOXZSA8GvN3urzZCioHTqqlr2bCNq71qk5nkfWsx4ZJFP
         3/YVG347gviv/6lPG8SsVyK3ZB1Lr2UV5URt34sG4ved4WAP02mxtc7stGBw5vnneU6R
         1H3YeZVlAEt8lGRQ22y+OY1meQQb/C0Uff8Y/TvtwYJPIcHOppTs4gZHbPUKG6UkqfTZ
         0/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740046787; x=1740651587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGRczv/8j4OMJoWA7ia2C5g1KcRfK9iPCRYD/JgzmM4=;
        b=pgfv3i8tHt4DLqxnKf8D060vJH/OVxqyshksL1UTHZq/aPACgWMrEqtjFCm09hI1cq
         4pm5Lwxg8TiohVBY7F/F6XIEejiAicJBm+OFrUMkdnkcpgMzri2NW5HAZm0jm62iFEaQ
         KaTznJzAvSxmCXbnHLGQjIEr5zFrytBwxJ0+mgIVkNafE4h1Ut1QnutbCBBNdSRMLMs7
         Z803JRpXpgmsGaR7p1HuRXvQDh48V4NBqZYRUueDAXWIpblICPqhpzVkCnNWzAuksgmi
         s2S5f3uoWR5Pj1V3+2ZIaEN8WQz83dztcexjlz0gD1oV3rHa96a7KSGpQ6BekPJli5Cd
         WB1Q==
X-Gm-Message-State: AOJu0Yxe0zqXCwprWrNx168NBJGB+jBxni2dO98QNhOMEqhtC0I6xJUl
	r0YGqfttErec/atTr0pQ7wYgC/WEXnnfnV302GtNhyOML2r6L9z3/mSgwQiQgIpjrUJii5T4Z+7
	6mhTrcuTlWHv84BfeJpEns11R+HU=
X-Gm-Gg: ASbGnctFKZxQInW0V7VxLoCOa1LjfEIGhI74MBp88xdNdu/QhHHh15yhZJ4HgnlKlkd
	VuuENqaRtwE/4dE4ZKsDJ8M9kgGg2B8TUjNA3ZwdlcekcFdoluRUuKyqdbcdzqBEZCRGeAt0ZjI
	JtZRJREtuaEj3tb/NB2I9HtqQCRk4Yp3U=
X-Google-Smtp-Source: AGHT+IFWVPfGZxScn66aITdGxIQm7BCriehIobPtjgGkwr8gOFTsp0e7FlM1APBSR80pq5yYom+mDoOOSUXMyahijB0=
X-Received: by 2002:a05:6214:226e:b0:6e4:5fc3:723f with SMTP id
 6a1803df08f44-6e6a24b1de3mr37759336d6.0.1740046787421; Thu, 20 Feb 2025
 02:19:47 -0800 (PST)
MIME-Version: 1.0
References: <1740011460-3468-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1740011460-3468-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Feb 2025 11:19:36 +0100
X-Gm-Features: AWEUYZm5ewnoFXwqqojAfdX-JzB4iO-njjEtX-LPHDAjr3K_IzBrDTF8hBzQnnU
Message-ID: <CANNYZj-ATQpHVfdEvuShSqWz77HdC1M1GbJD3R1Fc2fm5yx+7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] pango: upgrade 1.55.5 -> 1.56.1
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 10:19:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211751

On Thu, 20 Feb 2025 at 01:31, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
> Add python3-docutils-native to provide rst2html5
> -DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
> +DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi python3-docutils-native"

This should be conditional to GIDOCGEN_ENABLED to avoid unnecessary
build chains, e.g

DEPENDS:append = "${@' python3-docutils-native' if
d.getVar('GIDOCGEN_ENABLED') == 'True' else ''}"

Alex

