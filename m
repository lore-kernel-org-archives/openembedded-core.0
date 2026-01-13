Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E085BD0C84C
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:40:41 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56081.1768300840146474941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:40:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cwr/WnLZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c24f867b75so757742385a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 02:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768300839; x=1768905639; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3GsljnV0gIp8SmYZndK+s4upGO9hSyNTUn1vg84Bn+8=;
        b=cwr/WnLZN+rdi3RdKyF1vNR+eRwPmX4IYXpO5DBeN0wLe7+8VON0L1UBSyzP/osiGV
         aHXji6yUmjxJJyLBXIi7LOhKXeqsIj5U3cAlddEH5uAwzSZc3HTuoZ5UfftCSKfnxJTq
         6Tc400zeHYA9oBwiTBRKJqRdZPGt1VtvLEH4dx4ix1ZYBJdMSEjHnMmRvkoTybxwDsyC
         c2eVupiy/KSO3UmZQz7a+3DGJfjk+MKl3iGyfos3mAuXWCk/Ye4G3t2GMjbNnvnVkgvd
         mQni8Lp8desnPfpC0yueZORDzU9Pg/kIqOk5b0xWyx489175IlNAXdHVti4WBUijFfOK
         Qhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300839; x=1768905639;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GsljnV0gIp8SmYZndK+s4upGO9hSyNTUn1vg84Bn+8=;
        b=iYG22x1PGwf3YJWg0e3Sti6dx5HoZu88qc57lHpVFR7lY2CwA0TG9ydYpKN/FjrLnk
         7ifsYKRU4DW6Tj/H5fYZsiIm83oJiydfJKdZTrUugWoyK9yVqbGlhvM3d3MDiWP8WYKX
         Ety/xqWG9pwUmS9AKblKjhYIr31P6pMyNfYuGmzcHkzeOVgLWoxx+rECaYU1yZNZkrQJ
         glBdAa2um/GFxSrpuQG0NJ/dj0YKRTvnBplseJp52YIq1thUG20Fl+LGZJkKqClDop4d
         rGBP5oKFUThpgFuIRLV3OHCeAU2Wl5E4VlzqlIUWcwJ3Wlb0vTa3pCuSFzFBw+YZgVPE
         1Wrg==
X-Gm-Message-State: AOJu0YwaYEyc0n8x3o8MJhhNzlNLBrHyPTEgkw/bSLTQBr5Mv18jSe7n
	lv6lYdSUBvoMg51dI9q1oU7gml5SPeGJvdil63PlAeIWOeqEGR1U4Id+f/ucxum58/yS+I9oWeI
	VlqSe83SmgYHVtCxWYktsKYl9+/RCv3Y=
X-Gm-Gg: AY/fxX6ap9YCxiuPxi7PuJAyJnpNf6JhtR8nyLfg8Hb+EWDHYAYpxDXyZSs4ojIybax
	1Cyedpr7plWIvJgWNPXDS35zV6kEp/fMGUCSCVErBA2v/5jN83Brwel3CqvyXx++KSUGkLRkHbh
	ZxiHG0M2Sx03n6z44etTChqx+GJTC2BvxTud/iq3IntiRi7Hv+nwEZ5JILR+IW9+jG7NKClQgop
	TTVXTve48WJBRwRK3M5RVZbP0b74cMUHnQraoLB9BqcU/I9MnM1nA81SW+UNxizarj04w==
X-Google-Smtp-Source: AGHT+IHiXzhfoKzlgsOScJLoNl0aMxWXOjXgZpfbHeb76uMHZMxXIUhKg/2JZ+LNhpSeSiqxWmdlGUFh57sVJ1+NFHI=
X-Received: by 2002:a05:620a:4808:b0:8b2:7536:bd49 with SMTP id
 af79cd13be357-8c38937200amr2621405685a.12.1768300839072; Tue, 13 Jan 2026
 02:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20260113070254.8041-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260113070254.8041-1-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Jan 2026 11:40:28 +0100
X-Gm-Features: AZwV_Qh1EJS14tcfTWGlkCa3CWfM9i4Wt_fVeQAuaE2dJWMQDBJUjiyvPLbQ6Vc
Message-ID: <CANNYZj9x2wzvSg_HX2HuJzO9D5y2Uy5U=rRo1wAZsLTF=3pHzw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] orc: upgrade 0.4.41 -> 0.4.42
To: liuyd.fnst@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229258

On Tue, 13 Jan 2026 at 08:03, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=fujitsu.com@lists.openembedded.org>
wrote:
> 2.Documentation are no longer built with gtk_doc.
> -inherit meson pkgconfig gtk-doc
> +inherit meson pkgconfig

The commit needs to mention that it was replaced by hotdoc:
https://gitlab.freedesktop.org/gstreamer/orc/-/commit/0ad1f5884c654b614cf1ddd114a7ec9140311a3a

Alex

