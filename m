Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AED7C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 11:49:47 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.6874.1744890578243822691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 04:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eGVDT8AK;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39d83782ef6so1230077f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 04:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744890577; x=1745495377; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iKX/Ne1Q8ZietqkYhLenqCcyGY9kFH9d1cXDeBMDfIM=;
        b=eGVDT8AK6mUcE4+gepwoTSXv78SqDlV3Y9qo1IVrI6VlapmtzYlMJnrd3g2ono5csO
         He/GKnTVAeGz0dVQb+M7YUGT4C4NwOpfK1Qvf7J16Z+ce2TFpUVYp/FnSZQgL6gDcoXL
         ehqPaK5PfVDpCOXogaTjdXuCY2g+Mif1zdYxl8bEfyhkFzvYJqr97rHWx8h0ED6sXafj
         HmVPPcTiBKryWsxuJ2HQQTBzVlXu8IPSCwHMJTouRheAa9Qtlv6ZcpiXhn4qx0kSNj4z
         pVaHUVuHKBZ8SCoE864+TdYtkeowVcYtqMMnZorUxAEw3qStPklj8J+0JPhNqpXAoFuT
         7npQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744890577; x=1745495377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iKX/Ne1Q8ZietqkYhLenqCcyGY9kFH9d1cXDeBMDfIM=;
        b=dHN00+HHWsaimKD7aPDOArdPGl9LN7eHHb6hXhZCiavFuthceGXEMwADObE2oOb8+n
         4v3FKh93CzHwADJjrEqrmnMcs568PO9mm0tlomGGQioA6SqItIw2h/U7ZMMxX6ffklSR
         ojLxJO0eTa/lVS4AS8rsNMPxDzMtrcqMHvXB3ftr68yfVWqqhgQsdO6Q+rT/DsknemU3
         f20mKeSGtLiLZ296U5YWvTM+VU9kPoUPP3/OzHo+t2zOItEqo2AoWuWbFEwi6cQlgRTd
         yJ7fGzAj9plUSqFi58xuiBluw3ZJoeaIzXMxSTSpQoTtbKymUwLYrR7WFG2RVdDnP5ft
         J2YQ==
X-Gm-Message-State: AOJu0Yz+f6dZfEKEYSKzTLTOUBLCVzgu1Tdt1MX45qwUEs/bcXsogSFS
	mT4sDyKsbv+fvnzvDbpIbhz5QlOSujVwys8nusXqo8yqapbpmNeS
X-Gm-Gg: ASbGncvwHUlYPl8nRBohwwT7GQtgw8mmcOryFWO5XglrIkAyzkq8D5xB2qPMTQtJ5uF
	OvdCxZ2/gY1xS+R1Er4lcgyEEdv/U8NYb3HRf8gnP3BSOk3ehQQb5WWUYD+AkeYOrite+vok1tX
	WpHKt+4H+MR5zOmEBrVu/X010MLM1hgEpXnolZqxvP0+zPvQNFf2rGrRGbi6ZSOIPKlzjq1W7AU
	it6g9wk7e2ay9m7Px1C4lXndkT6umIOdxKoq+fT8hTAyB19a81vqDnlfAqVyDUEHTyyHc6bZFyM
	iyvwPge34I+YhyN1ijfvp0jQD2lT4h4TAwRl+ZqGt1VcQsGM
X-Google-Smtp-Source: AGHT+IG6CrRv7nTEn68yfDu0r2+VRuBN9qZYmLyza8iiH9RqB82fgUrRTly8WUtN0LBd4f1g8ETa7w==
X-Received: by 2002:a5d:5985:0:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-39eea39d992mr1909670f8f.25.1744890576421;
        Thu, 17 Apr 2025 04:49:36 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445708sm20183148f8f.96.2025.04.17.04.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 04:49:36 -0700 (PDT)
Message-ID: <a7007ad1-972a-430e-a1b1-8d3acffb5b74@gmail.com>
Date: Thu, 17 Apr 2025 13:49:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH v2 1/5] libsoup: Fix CVE-2025-32910
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250417104258.64180-1-vanusuri@mvista.com>
 <5d660e04-3839-4af3-a2d3-398e199448bb@gmail.com>
 <CANQUz19f9DEyCkbHkaGk4wbeX2OaRMdx3AqcVAiE=uaT+jWCGQ@mail.gmail.com>
 <a4e0b8b0-95f6-413d-8f98-f750611b6e61@gmail.com>
 <CANQUz1-M-2qFX0PBH_YXVdiBSkv5NobYfCasaWu8kTZoW8dmxA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANQUz1-M-2qFX0PBH_YXVdiBSkv5NobYfCasaWu8kTZoW8dmxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 11:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215075

Ahh, so I was missing something, it fixes multiple CVEs... thanks for
the clarification.

On 4/17/25 13:45, Vijay Anusuri wrote:
> I haven't seen your yesterday's message :
> https://lists.openembedded.org/g/openembedded-core/message/214981
>
> Those 2 missing commits were added as part of CVE-2025-32912 patch.
>
> Thanks for letting me know. I will rename those patches and will send
> a v3 patch.
>
> Thanks & Regards,
> Vijay
>
> On Thu, Apr 17, 2025 at 4:55 PM Gyorgy Sarvari <skandigraun@gmail.com>
> wrote:
>
>     Your reply makes me wonder if my feedback from yesterday reached you:
>     https://lists.openembedded.org/g/openembedded-core/message/214981 -
>     don't know if you disagree with it, or maybe you just haven't seen it.
>
>     On 4/17/25 13:21, Vijay Anusuri wrote:
>     > I have renamed one of the patches in the v2 patch.
>     >
>     > Thanks & Regards,
>     > Vijay
>     >
>     >
>     > On Thu, Apr 17, 2025 at 4:45 PM Gyorgy Sarvari
>     <skandigraun@gmail.com>
>     > wrote:
>     >
>     >     This seems to be identical to v1.
>     >
>     >     On 4/17/25 12:42, Vijay Anusuri via lists.openembedded.org
>     <http://lists.openembedded.org>
>     >     <http://lists.openembedded.org> wrote:
>     >     > From: Vijay Anusuri <vanusuri@mvista.com>
>     >     >
>     >     > Upstream-Status: Backport from
>     >   
>      https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832
>     >     >
>     >     > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>     >     > ---
>     >     >  .../libsoup-3.4.4/CVE-2025-32910.patch        | 27
>     >     +++++++++++++++++++
>     >     >  meta/recipes-support/libsoup/libsoup_3.4.4.bb
>     <http://libsoup_3.4.4.bb>
>     >     <http://libsoup_3.4.4.bb> |  1 +
>     >     >  2 files changed, 28 insertions(+)
>     >     >  create mode 100644
>     >     meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
>     >     >
>     >     > diff --git
>     >   
>      a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
>     >   
>      b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
>     >     > new file mode 100644
>     >     > index 0000000000..32e0c86e62
>     >     > --- /dev/null
>     >     > +++
>     >   
>      b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
>     >     > @@ -0,0 +1,27 @@
>     >     > +From ea16eeacb052e423eb5c3b0b705e5eab34b13832 Mon Sep 17
>     >     00:00:00 2001
>     >     > +From: Patrick Griffis <pgriffis@igalia.com>
>     >     > +Date: Fri, 27 Dec 2024 13:52:52 -0600
>     >     > +Subject: [PATCH] auth-digest: Fix leak
>     >     > +
>     >     > +Upstream-Status: Backport
>     >   
>      [https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832]
>     >     > +CVE: CVE-2025-32910
>     >     > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>     >     > +---
>     >     > + libsoup/auth/soup-auth-digest.c | 1 +
>     >     > + 1 file changed, 1 insertion(+)
>     >     > +
>     >     > +diff --git a/libsoup/auth/soup-auth-digest.c
>     >     b/libsoup/auth/soup-auth-digest.c
>     >     > +index 350bfde6..9eb7fa0e 100644
>     >     > +--- a/libsoup/auth/soup-auth-digest.c
>     >     > ++++ b/libsoup/auth/soup-auth-digest.c
>     >     > +@@ -72,6 +72,7 @@ soup_auth_digest_finalize (GObject *object)
>     >     > +     g_free (priv->nonce);
>     >     > +     g_free (priv->domain);
>     >     > +     g_free (priv->cnonce);
>     >     > ++        g_free (priv->opaque);
>     >     > +
>     >     > +     memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
>     >     > +     memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
>     >     > +--
>     >     > +GitLab
>     >     > +
>     >     > diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
>     <http://libsoup_3.4.4.bb>
>     >     <http://libsoup_3.4.4.bb>
>     >     b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
>     <http://libsoup_3.4.4.bb>
>     >     <http://libsoup_3.4.4.bb>
>     >     > index b2e32b892a..757e6432f7 100644
>     >     > --- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
>     <http://libsoup_3.4.4.bb>
>     >     <http://libsoup_3.4.4.bb>
>     >     > +++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
>     <http://libsoup_3.4.4.bb>
>     >     <http://libsoup_3.4.4.bb>
>     >     > @@ -18,6 +18,7 @@ SRC_URI =
>     >     "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
>     >     >             file://CVE-2024-52531-1.patch \
>     >     >             file://CVE-2024-52531-2.patch \
>     >     >             file://CVE-2024-52531-3.patch \
>     >     > +           file://CVE-2025-32910.patch \
>     >     >            "
>     >     >  SRC_URI[sha256sum] =
>     >   
>      "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
>     >     > 
>     >     >
>     >     > -=-=-=-=-=-=-=-=-=-=-=-
>     >     > Links: You receive all messages sent to this group.
>     >     > View/Reply Online (#215059):
>     >   
>      https://lists.openembedded.org/g/openembedded-core/message/215059
>     >     > Mute This Topic:
>     https://lists.openembedded.org/mt/112311177/6084445
>     >     > Group Owner:
>     openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     >     <mailto:openembedded-core%2Bowner@lists.openembedded.org
>     <mailto:openembedded-core%252Bowner@lists.openembedded.org>>
>     >     > Unsubscribe:
>     >     https://lists.openembedded.org/g/openembedded-core/unsub
>     >     [skandigraun@gmail.com]
>     >     > -=-=-=-=-=-=-=-=-=-=-=-
>     >     >
>     >
>

