Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBBDC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 21:48:44 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.101613.1783115317342635234
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 14:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eJmBa87l;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8efef6533aaso6933576d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 14:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783115316; cv=none;
        d=google.com; s=arc-20260327;
        b=mG4HLImObgHNCkTneIbHReaOflZqPKSVrDnmyiBA/pRvqNrYy81O9szW5Sa8xNyxAr
         pe4bXOnFo1iSetJqFkEOrfubA6luDNsOeBjlMdawOMTIKoUyk920fQCPr3Cn2p+ZapSa
         mhlxTQmpPtqZH8Qf0GA7OyHxkF39iO1GuHBDFJw9ixcl1gSzuVbIgvtxQcPb4ZStAJ2R
         I0u/Ruca5x4vePvIJEWfNPhFXVP0lbIi6LkzxiCo7nIpuxzzq5oXL/9FZYa9YahPUvTv
         eGlb4lLqNi31WZaDHX2N2DnnMqizCa1XRhXAFwnlQHU1ARd/YnAG8d/6ECDA2gNsCtri
         MSZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ctlLqAbjEuvPlEyc45l0nV4uJbjz0FGbAZ7CgXqdLh0=;
        fh=/7NPlvL018559tmBreG+id+aU5o32Mk+yNFhzsYO0tk=;
        b=Ko537+DsnOF9XhmY59O4GQMKK6rF6CHFffQh0Z3q3ZyqeFHowKcd6avanDwmalyJwV
         XJj2g2RQotUpM0ATVszCHWcdkSD0e2TehUVA7/if2/bwa1HZJ4k7F2sfeJUFSwHBqhuv
         DdVwIe1TSrQAUa/wIxR/urcJa0oydwvCsJTfaDUjyGAdlHKRQRs6xZXUARGIJ05oJWSk
         M4zmqvtqoRN85UVLPfB1ogQtEe77BeuwJWOG/gviogiPVU9D+TagSqXpv109sDeS4A+V
         93DmQ/+LbLwRJpTpK8H0hE3frydtQwZPDM/g3SugGX2C5oLZI0Vmb1Y44wOZ6Y3ehLmm
         R5+g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783115316; x=1783720116; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctlLqAbjEuvPlEyc45l0nV4uJbjz0FGbAZ7CgXqdLh0=;
        b=eJmBa87lzcjahmOT6GP9KWlS3zuhyEdQ3j4rYr5SV4+nNtPtxoXd2dWh2z0uIMytNf
         Ear4qzbMBC0Vw16aywG5Zc8IZiz4ky9rzjmV6cxlUv2qu7veRZiShQVdaLcKYO77Lo9a
         Y4CzNHaloAWxRqKYSRczs9JlfRlGm9mJxqFWQllwYgowOg/TR+ccNeARSyW/+aoYCBBH
         73bQeSJATaGG4NIwpDjFqCC+HOHkRVjfVBUDBYlIDvLtASDThW3yfMJSoTzzuFiwiwYv
         b+k/vhkl1HfsVAMLxfQ0+KhGayPdka+G/rmr2/sStqavdRhQk6Z/1w8NcI610s96gd3r
         MClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783115316; x=1783720116;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ctlLqAbjEuvPlEyc45l0nV4uJbjz0FGbAZ7CgXqdLh0=;
        b=Lb2DdGx2Buq9wDiOF1ze6QFG8WR+WPH+ojd1rUC/6NjWaKhvuIwh+iJvsjmSgJDkAg
         Ykqt+0iKU4it0vLINWvD+EnzPvOLPramIFSxco8JffIQZOBSOoq3SPzpUp770Y+JJh46
         C159RmifNCOXFvhYQiYrGc5cp/5IkSJWNkDWLjs5YHN+hg0j7fLTE2sag7b5XrhVaZF4
         kMe6/b8ds+Yw1HHVi7MN6GFvgWp+hQb+2YX9SdLmMFoEALWmMhfohpnd9JhWf1cF0hUv
         J1Dv+S8KCMICAh51rTXXnP3mCIdgZkeqAPz3lPZPfgTLOln6QP22xw/StiwmRIlISe5g
         EFPA==
X-Gm-Message-State: AOJu0Yz9yCzS1bH4lNgMdHY6ls6F9Efi+Ogb9I+l6h+veLAF9Sh5H4/X
	nbMNj151lyaiPP7S/f7JQ8cl05YSv/pmqCMEDKAydB9cgajMapIS9f3I5ZhbX4DbiiG+gBR0o7k
	mISuyWAoHr2VrzSSrkf8eRiX65qipWj0=
X-Gm-Gg: AfdE7ckqsTqrbkOFp1vEG89bi77KxfCT+LTEjHoNU5CZIcEVR8xtFxbsQe8pgOEb8hr
	Sy5jIF/kZUbbqwCU05zzFN4QDGzquQQhnM1itBHJ+EAnNk+7Yq+U0whvnZoZe6LEBbNieQoAZEV
	wjk4yFNGfKUPajFOUm41xBOY5L6ZUZ9/FJCfFAdvSKPAz9TQIXg+xkhqlZ3OEeKWqoaI05I2Hs4
	07Ouh79SZZ3R0IE0fTAEG+JhMyOozGyhpos8wvTpVIEKbCF//VeYMw1b2vXtLMOebl8q7e35h1L
	ro4rlNpiP3EHAL5k49L/WNeURJhw
X-Received: by 2002:a05:6214:4508:b0:8cc:ea2c:f2b3 with SMTP id
 6a1803df08f44-8f74a139f9bmr14239406d6.21.1783115315770; Fri, 03 Jul 2026
 14:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260703-glib-2-0-cve-2026-58016-master-v1-1-e16967ddff16@bootlin.com>
In-Reply-To: <20260703-glib-2-0-cve-2026-58016-master-v1-1-e16967ddff16@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 3 Jul 2026 23:48:24 +0200
X-Gm-Features: AVVi8CdY33nMKpORfyraWe0iDe5F4HJw_25Abd7y0ImuTdx9DZMzbjQVKeygktU
Message-ID: <CANNYZj_ffP48T3+YOkt9iQumB+G0Fs2LLhv8QtiS=KfYYdDd=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: Upgrade 2.88.1 -> 2.89.1
To: benjamin.robin@bootlin.com
Cc: openembedded-core@lists.openembedded.org, olivier.benjamin@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, pascal.eberhard@se.com, wahid.essid@se.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 21:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240127

On Fri, 3 Jul 2026 at 16:34, Benjamin Robin via lists.openembedded.org
<benjamin.robin=bootlin.com@lists.openembedded.org> wrote:
>
> This upgrade fixes CVE-2026-58016
>
> A flaw was found in GLib. A state confusion issue exists in
> g_dbus_node_info_new_for_xml() in the gio/gdbusintrospection.c file when
> processing malformed D-Bus introspection XML, specifically with a <node>
> element nested within other elements like <method>, <signal>, <property>
> or <arg>. This issue can cause an unsigned integer overflow and lead to an
> out-of-bounds read, resulting in a denial of service.
>
> The CVE NVD entry is wrong, it indicates that the CVE is fixed in 2.88.1
> but the fix was realized in 2.89.0, see [1]. The fix is not present in 2.88.2.
>
> [1] https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2
>  .../glib-2.0/{glib-2.0-initial_2.88.1.bb => glib-2.0-initial_2.89.1.bb} | 0
>  meta/recipes-core/glib-2.0/{glib-2.0_2.88.1.bb => glib-2.0_2.89.1.bb}   | 0

2.89.1 is a pre-release, we cannot take it. You need to backport the
patch, or get the upstream to release 2.88.3 with it.

Alex

