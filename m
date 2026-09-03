Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8497BC624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:58:25 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4283.1788429495859295436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B/Dlw3hT;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-90cc372d6b2so27286466d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 02:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788429495; cv=none;
        d=google.com; s=arc-20260327;
        b=LUIH6KBQflZbfo8oYy/848V4GZnngyscs9+LN4F3NPcSLoqyHLb75756In7Mxqwcce
         NtNyT32aHaoc/w95bdyX84kl1QNfMievS2faZoUTPI3OE/e1Nza4YSGD+Wic4yOXjMkX
         NJDklDPn7MxbsKl3bttt9p3ehEJdAxRxDWKGC2sViW1Aq1cF0uU3FJmdPSbSV+by49wN
         fynn5zpeNvcmbjZ6BtWHUSKJ5+WgKN1EOO/CpVFphhOfCiLfHAMSW4/ISkVAgPybGML1
         r6TrsHLqQdyGggxdqZTcUu0LnhvfKhfMwviJnR446zrLavnAg6bM0pLEALOf8K+bHKXi
         JTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JWk7rqnQgOn4eueLn1c3PG1IaktNTy/cBGf+pCdTv94=;
        fh=ZfVU6jf+dRkaj7NBogrTyOVyJIDyPKrCJHCtfvSwpGE=;
        b=n2urLQVt3RRwG7o+7lq8rRxMVnY3+HwDcu3CSucVvpddvUORZOh4zX2LXa44BLG3zz
         YJf6/rDeT9/3lBawsLiFem0jJiUnP7IC1XkEbK6Z2H4B+a3XMias6WqeepIT/Mg2/lW6
         fO1wxw6rksLKMZ9UJktgl4Dkp6T8WtiWbHHyYdHJxFPI0nJ5ZpOGoWYpbLlyPMFr+0Pl
         IHY3tlyTowJpWkuOzggxxqYhu0PP0hR9WBLy88IrXF9eOaOfTAu1UCQCwd4G0Blg5YOQ
         XuAZ7IJfAb9I0jDWzKmx+f+MsNXfUcn5Ipz9/br3EQBCbWde5bJ4WkX9sZJ9i0nU+uYO
         ESAA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429495; x=1789034295; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWk7rqnQgOn4eueLn1c3PG1IaktNTy/cBGf+pCdTv94=;
        b=B/Dlw3hTysmgGYlQR7VBa4fvmjcXQZC/ra+JJl9xibeHtuOnO7Ae+JeqJLxXIGUohQ
         kal3NsUUAbWPYaskX7K54B+zvEA8lI/NdQ7ABzO3GLb/4N2FCg0nB/jMuvA9WEOonrat
         LjFMPa+ce1LXphGU66a4PJ06Gkg1Pyd6ZbYCeHzJ7OEWL3rbE6dmV9JRqB7Az6sVGkXl
         n+w7m0LKtBz5D5YsOkRET8y7EkqR1FOKY40p+DC5iQB6+iQMEtCXb/CjP8p8j5KwfEKt
         QEwn66JbfT3Bta8zRd58bpElUxQGnIoAUGCYFNPDLuK3DZf+GKoNSDUVm2/VllhLLx85
         GHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429495; x=1789034295;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JWk7rqnQgOn4eueLn1c3PG1IaktNTy/cBGf+pCdTv94=;
        b=auZ1ULeoiPOykfue/WcZUm3uZqcDqGHmXyx9TdDwi9cE01YWpApYYUNVHEaBzmL4xp
         dC2Il1Bz8jQSZVlFVdEIID7tWFBa3kdRonZu6tL+3O8/yHXGCLqW2DMuls7fAu7c7Hvm
         U+1GeoiaQvgbAoEExQDtCicI4CwgJx5zoudIMEke6GfIqdGu4oVN6Nh43o1JKQbelFFY
         5QRkMxJbmFA3sVbl0B24Qhu89ymyQrTC/9TA/C0LmBEHGnwwir6rWyorFSePxFQoLsud
         ADRCXRIAhP6LwJbrWo8iBhGmKu7XGiuUkF+8yGX3qEhlKiGpZCI5IqWN7Rrq7NVVf0NT
         oOGg==
X-Gm-Message-State: AFuF++m+voEiNxiBd/o8lFyndJSIwBJeNUZoUethprsG5gMOIMuqT0sO
	jx4CW8tmMQxqfPDPZr3akuVZu65V90rLz/OcpKG1XADqcRcoAt1QpWmPt8w6v+Hvx5tmdIOXD3Q
	x2jkStpQv3KYXJ0PmhoHsAtQboOgaQXQ=
X-Gm-Gg: AYBFou1JSNTI4W6/cC8ruG54PP8FoFwz0i1WNgT2XikY1CthueP9NzjeiwAChBTaI/O
	+VPcujlFhsfxIh4HOW9jz29K3UCrglLSTYY82chZj5izuSTU3KPYlSoPSp2ymYF0urX//88HUJa
	kjSWu7gmfglaYiBokwRr3iic6qqsiV5StJmzmHJrUYtEtm2pAI+v0577gBvp3qGsqjdMCNyhY6p
	K88TH2tu9W/TFzmnZB1ex/gxEtzpKsMgwtqwyrysJs3N1KL4LVRvgrUfXPxLwC8AUH+O7DtGoVX
	M2mTgyv0xqfHzlcbZhtpjeS4ukjRJZE1tMXgebfuNi+369uvhZoZSO20VcuT2uvKsuwdPP4o/sr
	/org=
X-Received: by 2002:a0c:d792:0:b0:910:3453:d4a5 with SMTP id
 6a1803df08f44-9103453d5c1mr50090986d6.31.1788429494747; Thu, 03 Sep 2026
 02:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260903094517.891670-1-gustali@axis.com>
In-Reply-To: <20260903094517.891670-1-gustali@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Sep 2026 11:58:03 +0200
X-Gm-Features: AcwNN1XVcCWjd_KOjGHuUKepuUe4d3y9H3NPp_K6ZDKxi-saisa88UGpKG1EPPY
Message-ID: <CANNYZj9QfcgbYxfGy47hJNOCcaNLFE3Q7YcxJrbZKga6qTc1vg@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv7] boost: Add support for building boost-asio as
 a shared library
To: gustali@axis.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 09:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245022

On Thu, 3 Sept 2026 at 11:45, Gustav Lindberg via
lists.openembedded.org <gustali=axis.com@lists.openembedded.org>
wrote:
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -44,6 +44,7 @@ BOOST_LIBS = "\
>         type_erasure \
>         url \
>         wave \
> +       ${@bb.utils.contains('PACKAGECONFIG', 'asio', 'asio', '', d)} \

Adding asio to BOOST_LIBS enables asio as a header-only install? Then
it should not be subject to PACKAGECONFIG, it can simply be added
unconditionally like all other libraries.

> +PACKAGECONFIG[asio] = ",,"

Then this should be named 'asio-shared' as it is also used to build
and install a shared library.

> +do_compile:append() {
> +       if ${@bb.utils.contains('PACKAGECONFIG', 'asio', 'true', 'false', d)}; then
> +               ${CXX} ${CPPFLAGS} ${CXXFLAGS} \
> +                       -DBOOST_ASIO_DYN_LINK=1 \
> +                       -I${S} \
> +                       -fPIC \
> +                       -shared \
> +                       -Wl,-soname,libboost_asio.so.${PV} \
> +                       ${UNPACKDIR}/boost_asio.cpp \
> +                       ${LDFLAGS} \
> +                       -o ${B}/libboost_asio.so.${PV}
> +       fi

No custom compiler executions please. Building a shared library should
be done by the boost build system itself, and enabled via a flag to it
during do_configure (e.g. via PACKAGECONFIG_CONFARGS or BJAM_EXTRA).
You probably need to patch boost to do this, and send the needed patch
upstream.

> +do_install:append() {
> +       if ${@bb.utils.contains('PACKAGECONFIG', 'asio', 'true', 'false', d)}; then
> +               install -Dm 0755 ${B}/libboost_asio.so.${PV} ${D}${libdir}/libboost_asio.so.${PV}
> +               ln -sf libboost_asio.so.${PV} ${D}${libdir}/libboost_asio.so
> +       fi
> +}

Same here: no custom installation, boost itself should do it if it was enabled.

Alex

