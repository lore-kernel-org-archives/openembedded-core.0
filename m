Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E3CC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 14:27:02 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41418.1785940021440869846
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 07:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U1OZgQJg;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8f0e5e36912so5873456d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 07:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785940020; cv=none;
        d=google.com; s=arc-20260327;
        b=HydtZGsFfHvASJEBIhqxPwJunTwOaRm/u2O0yoILcUYASWppC3dJ55Ok3R7eNio7C/
         1RfL8gEIOCKZzRA63sSBDSXcR50O0JJWQu1wXMZb61EWNsu+OtQihdN6i+flmKxkAk3e
         Fi+WSSZ1QZwYgzU3R+OYtMPbK6FRlP+xIEF5MXOdqzQsxY5QPoa6X750cSbTpGLxks40
         kizlHtuY+tsDjD6HuqchVrMyJsQ2yYH7BmPcCX+LMFUVqaR5O8Jbr++ajcvy9vYfd4+t
         6qTobwk4hTMrbkoB7DJ3pi4Eg5IYnkywSC5zhHzuCxznkxL15pPmSpVdBlBjCHA/gv4d
         7XbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sViOAZziARqNga+zYMt4GC0zckmlv9Rtxwc4qQeoj9U=;
        fh=hrLIMLnLgn9lA4UjcABRY9PW9LZQM2JxdaLMYkWr4sM=;
        b=VeZLsHXlW3WrJtHoW8bFu+Rzh5zNI2gDcX69b5wELq9yEaVSpd1nl5DjfFgJb6Yr+r
         YNu9L/JQuRJIN+C4dmEv6GexiRl6+kJ1yQkGspvtRL3J42zXJK/tmmVvUvzCu2ivSZGU
         Ydn8LIhU311ZgA/aTrLyF3oRzqbQiUgdiJHO18fpXFfmxNdE3Y3hjUvvL91DhQwYIuNN
         QnujR8nrgYSDDoq7D8BDb+NRTlbtYl1UR15ma+OtloIpZbl2e7WHwiOyRyCi9FkfdoJb
         QKrza2af1qauElUISxuzJrnSR9nviI6rvTr75I48GXx+UqsNthUim6//Q0dedjLo4NuM
         IXdQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785940020; x=1786544820; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sViOAZziARqNga+zYMt4GC0zckmlv9Rtxwc4qQeoj9U=;
        b=U1OZgQJgwbOc6QWZPwa3uc80J6H0ay7n7PyzVC19mpErdBIa4liqMlpXk43VGIo1P7
         rudKqCaZNetNAkRpjDP29SttWTloWa+LYyQzKcqzYkqTMCnkt/I+IIQNOqvLPCGmLD6Y
         5xlZ8Av0c4Ypj/0/N0gxu5uxqSRMHqX613Ud7RYWui/b7lAPtSOb6oNZx66m2Nk5ny4t
         Vc7i70bTuEnD+ZuFr85fd0z+yStb30vGsZkYqP1belCqR8YjY+eL7iiru8ZglJZ/JhWu
         a630bXUJh1LxlCpumRRORbmO6I1ujDRjFaiIh2TEC+p/1gWl9ZdRQD/bPUZ7d66Sel5W
         cyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785940020; x=1786544820;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sViOAZziARqNga+zYMt4GC0zckmlv9Rtxwc4qQeoj9U=;
        b=UhNKmQQKOky1H05M4SQ9tzj3w/eC0dqgbWR8Bf93Zrt25vKkfyEGcus6ogMf//XuWC
         7toz2337t+6+Wconcn5uV286xboOij1urCCeM/TKHCV6sARMCfN1XXA2b5OUet8ihlh3
         AsCQm9lu1Ri7wvZjwYCQhGJGAgf9GIoZQQy/7zm/4KUHOPFOsel+IRCbbLLTsartDnX0
         Za3VNL/gsNMvNPGOgdULfzpkKQ8cujgcWHIyQ9ez+59sWSpsMhhxVDAOZ3Hd+ZJuPHCB
         EQgbosnQHcleEQhph0ZGka1V3g447WWTOb3+zEzj3BlLvq4U2w7BgwyekDs8eWtjufMt
         mB6g==
X-Gm-Message-State: AOJu0YxC7laA263UPohGrH65z+suunwwFNpoWau5S5u4rB6tdVRYEYN8
	Q67qLUe76uhSamqK+5RIC7miMalwwh33nlVq49IhFonMSq8YmgAgvdggusxo8w46HCsf/t67lwJ
	idB9nsIaCqususA52FYrfMLDroiSSLic=
X-Gm-Gg: AR+sD12UFqR/jTADM/HeaNLWWD0swpCvfTrx/4UNFg/l0CYz6KXNwTn+SAIwEL334mQ
	EUWVQgtBnKHilrQqWrtYdwM4ekwiW8BSLAznyrTNzMf7Ww/Eol4eNn9Sdf1xta+KcC6pgi4py5t
	l7/M8tby64szKv0en5vUn9LowTdpEYbCbLq+2qaS/e4qjmS2WG6wdlDdfrW0Y6/ifiAd3Z8E5ly
	+LSbby93VY8Fk2y3R7SLVD/djcN+bMQrQg4k5dqCmIemGJ0XiS0z2pVKvsqmQ1Q/N7qWBkS3IoA
	UaUdjdIAEZannRzzh3qwXnm6TNd9Eg6i1ZtEBD8C2u7Ep8VfwPMcru+yvDCT7PzA6JSCwnBPqEr
	o5dM=
X-Received: by 2002:a05:6214:2028:b0:8e7:8d53:2417 with SMTP id
 6a1803df08f44-9088137aa2amr77948066d6.27.1785940020321; Wed, 05 Aug 2026
 07:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260805131657.35726-1-pratik.farkase@est.tech>
In-Reply-To: <20260805131657.35726-1-pratik.farkase@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Aug 2026 16:26:49 +0200
X-Gm-Features: AUfX_mxLw_JTjoxiPOwAeCLArZvfmTFC9Nu94oQI_R4pqiU9vawZDbpbHzEgGo8
Message-ID: <CANNYZj__fBerAF1q1_dB2F1rscfEag=QRyr7=uVONW4C+1AfJQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v1] glib-2.0: skip a timing sensitive
 monotonic-time ptest
To: pratik.farkase@est.tech
Cc: openembedded-core@lists.openembedded.org, pratik.farkase@ericsson.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 14:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242870

On Wed, 5 Aug 2026 at 15:17, Pratik Farkase via lists.openembedded.org
<pratik.farkase=est.tech@lists.openembedded.org> wrote:
> +Subject: [PATCH] Skip /monotonic-time-ns/similar test
> +
> +The test_similar test compares g_get_monotonic_time() and
> +g_get_monotonic_time_ns() by spinning until the microsecond clock ticks
> +and then asserting the two clocks haven't diverged beyond a factor of
> +50. This is inherently racy under QEMU emulation on loaded hosts: the
> +process can be preempted between the two clock reads, causing the
> +assertion "50 * ns_elapsed > 1000 * us_elapsed" to fail.
> +
> +https://bugzilla.yoctoproject.org/show_bug.cgi?id=16230
> +
> +Upstream-Status: Inappropriate [OE-specific]

Hello Pratik,

the patch is Inappropriate, but it is not oe-specific; the issue can
happen on any loaded host. The actual reason for Inappropriate status
is: it does not address the issue in the test, but simply disables it
altogether, which is not an appropriate fix to suggest to upstream.

Can you please open a ticket upstream, and include the link in the
patch, like below?

Upstream-Status: Inappropriate [upstream ticket: <link>]

Alex

