Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A41BD65530
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 10:31:35 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11296.1765967487714008188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 02:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wn95aPht;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-888310b91c5so3471246d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 02:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765967487; x=1766572287; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aEr3YP4EYjNcfDcxrGQs1E0P4+qiMy0SKYey7DeaktA=;
        b=Wn95aPht5lsZFUySoke2ND+gTvDSQZpMDRIdTX0HlZ0beu1kJfoJwOvDX1xfmc9+PL
         +c6H/jR+nXjvvkWCUSYK1S46+QlCxm3tZm7h3G0rKbobm5erYcTMFqU8pyk94Px4zhFi
         MFk+o+dANXkTuwaSI+RjxnOvjKCoGX72fKyBrbSfIoisHe1DqpNh8GBmyGz5/1pvGPdV
         2BIbq5RzbyourwzjvFvwCQJ9mee3XAQsTGN3AVeKiQ6w7q69lr2G/svVM9P5E3kcIswB
         LI5ctVMuPFocFgW897uT6bm531fiL37CkhL5udMs8iF8GqB1mTS8jAb3cTHFJJ+4lDT6
         jruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765967487; x=1766572287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEr3YP4EYjNcfDcxrGQs1E0P4+qiMy0SKYey7DeaktA=;
        b=HWLrS6i8lvxtVth68Q92MHQxVPNlLMmOgPMEugEJbchJCfYc9KmRmckPoeMwD+EHXt
         qTh5luQ1A8KcvOOmdVQ+WcomNZsLJ/6jyeibNBbCekazDxoITbOn7uoZ4trOQ3m4YcL+
         PIQ8rmNqv3bXfZMJ3A1OZsD+bFQgzI0wemuSRdVcOmqw7VPsux4ck9SeFMRFf1uAKwuM
         rnxLOBsuNvK+clmcBLw412VFKItD7cMe5VpKVAukpMnSqUjCZzuoL1g25zPbuzWLRoO4
         yKoOUlSboYHasYEDWDqaLCHZskQejYkmwzcvXWESae1QaldnL4qxu5rg4ShTEPa8Oubf
         nBTw==
X-Forwarded-Encrypted: i=1; AJvYcCUKoCDned19e195PEpQ9iJh2rg3MBEydQ0FNegzkv/nC558X0DYksAro69K+abqHVW5ovt/EoB4sMlz5+Yy4e9W1Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw6xjlPKeSuaueVc3rHIJqg8odyJIqbiGvUaZTpzIo6BqCmFtxh
	d0pW3CNU5SJQUnem2QhfHaOMPT+zCfo9SieEsRw9rqxwYrKFuw0R6rr2r1a5sD+zio97+wR4YgV
	oGqInqiauFz0qYcwoXQYu+oUKEMnz4Lk=
X-Gm-Gg: AY/fxX4F0hD2w1hKqwaa37DrqaVmGeu2WOqDyOFXYvxsE7qzOAvl6bVKLnE1FWkEqdz
	/hkFKCFskJjbkT1W9dlpkFHrzGGqxDva3D6eCk7nH/+qVrVqphO1lnaEaVH8c6agyIg1ZeWSrdh
	74E3hlNoiVqVad/2/fyPTy1pD1X1IbMym5/fkW1Rkjqidfiy00BwswBi+SXboy24IXTCWwt8StI
	5N+6+dBO84ad/MqwmWcp3I63nvaU+jZ80n5guBMby7hEdvSDL2tVnaXaT8O9dK7pueBxM1jwl5q
	w5Q0desUaovaUECv7l/SK16cfODeeQ==
X-Google-Smtp-Source: AGHT+IEwI3wwf9hOWBuAy43bD86IzJTHctSI2o/tBucNSE2nCchhqpzsYX5x4TyBR/zCHo1oE6hi7zE2HZ4HvT6aQlo=
X-Received: by 2002:a05:6214:252a:b0:880:88cf:59ff with SMTP id
 6a1803df08f44-8887f2bf035mr253140616d6.22.1765967486501; Wed, 17 Dec 2025
 02:31:26 -0800 (PST)
MIME-Version: 1.0
References: <18807B69349A79F6.984558@lists.openembedded.org>
 <c0d06db9-f163-4421-80ae-97136b09d6c5@windriver.com> <53587996-F67E-43F1-A6D1-2D8863D2A3B7@arm.com>
 <a85b6698-ecc2-469c-8d89-cf9b631a0ce1@windriver.com>
In-Reply-To: <a85b6698-ecc2-469c-8d89-cf9b631a0ce1@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Dec 2025 11:31:15 +0100
X-Gm-Features: AQt7F2o97le25yWQWsVPM0EEdiHpLBUsoRsLQC0wZEWs1RYXQ-5_JWwhxsxbrbo
Message-ID: <CANNYZj_AVzfzRCAy0P8KX_uCRhVVV2b4UOktVp-nC_w6whoQTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0: install Gst-1.0.gir to
 ${libdir} for multilib
To: hongxu.jia@windriver.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 10:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228020

On Wed, 17 Dec 2025 at 03:59, hongxu via lists.openembedded.org
<hongxu.jia=windriver.com@lists.openembedded.org> wrote:
> Alex, what is your option?

I kinda don't know what to say with certainty.

First, https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/10363
lacks important information for the upstream. It adds a meson option
but doesn't explain why. You need to explain this:
=====
Due to upstream commit [1], the size of padding differs between 32 bit
> arch and 64 bit arch
> ...
> |typedef struct {
> |  /* < private > */
> |  gpointer pointer;
> |#if GLIB_SIZEOF_VOID_P == 8
> |  guint8 padding[8];
> |#elif GLIB_SIZEOF_VOID_P == 4
> |  guint8 padding[12];
> |#else
> |  #error "Only 32 bit and 64 bit pointers supported currently"
> |#endif
> |} GstIdStr;
> ...
>
> It made the generated Gst-1.0.gir be different for 32 bit and 64 bit packages,
> Install Gst-1.0.gir to ${libdir} which splits 32 bit and 64 bit libraries
>
=====
so that gstreamer folks can see the actual issue, and not just the
proposed solution. You should also reference
https://gitlab.gnome.org/GNOME/gobject-introspection/-/issues/323 to
confirm for them that g-i upstream is aware of the problem, and
(selectively) installing to libdir (and fixing tools to look there) is
how they're dealing with it.

Second, on my Debian system I indeed see
/usr/lib/x86_64-linux-gnu/gir-1.0/GLib-2.0.gir (but everything else
remains in /usr/share), so presumably they managed to make it work
(some details are in the ticket Ross mentioned:
https://gitlab.gnome.org/GNOME/gobject-introspection/-/issues/323#note_2118013).
Yet oe-core's glib recipe still installs to /usr/share/gir-1.0.

From reading that ticket I'd say the precedent is set, g-i/glib/gnome
upstream has accepted that multiarch sytems are valid, and libdir is a
viable location, and it's fair to do the same in gstreamer. g-i itself
is fixed to support that, and the rest of the ecosystem is mostly
fixed. But we still need to devise a test for this before we start
moving files around.

Alternatively, if you just need to get rid of the do_rootfs error, and
do not have any actual use for these .gir files, all of the above is
way overkill, and you can just delete one of the files (or both) in a
bbappend.

Alex

