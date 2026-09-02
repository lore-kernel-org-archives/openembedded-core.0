Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4199AC624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 12:00:04 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10752.1788350397430589575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 04:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P/Xt09pB;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52ff0eea420so9858201cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 04:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788350396; cv=none;
        d=google.com; s=arc-20260327;
        b=LW3+Lm0jsgtI5bPAQ26PdI9NtUX23lcW2So1fsvHJMhSzvmeDEYOQso0749l4hhzxI
         ETFPcOlA0aXMnWzxYwFTCMy3GsNNMAdxvtgaBe0JXVc7tt7ytY2d2BnBJOT4sM7Xny3K
         OlvxgCeDKcqkvI5ELJfObZ9zf0LcGIHSTrtgk6RILMKlz5iK+hySfX7Iukmb5a3jpayN
         WtL1OTo7z22ODItiDGT5c2OWN/uH5EpM9ZBpWsIb3thV9rYzGNxU5oZITat0bPEsLSs0
         dvEollc8iEStTpoOR3BGWLhMnIAKiEQskJtZLwx9e7lJQZocqsygvCRMuKVYYTSyhcwP
         DIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8j8qBObsLZb29dVN6IdYnkYMUJi+mf/YEZ8JhM7I8FQ=;
        fh=ZfVU6jf+dRkaj7NBogrTyOVyJIDyPKrCJHCtfvSwpGE=;
        b=RRwqtB6FkXy2aNR+Rv0Fdtkhoo31k50rSJYYphcDa6UuWNA9IiNCyJTVzDYBdAXveW
         p5L653+uvrevanAfk8wjyom2v0kaq/MjcydDdjvBhhsZWKhAYkhgqT0q7jjlqMLvIwHb
         jSf3mtF4yDbmYPz0Pm5yD/SW4xT1POLbtrGllKGUH3Np60gypIbc5ceqPNkTX08AC6uL
         ZlPmtjrQEA7Gur8an5iuHA3q2EqerKB9PUfDgNuEwIY9NvS8qONVbY8T1gGBsxXUx50A
         n0qsGuEB02JOMHfybvX7RDh4T2vRzqswYwjL+7D+8hexHs0OdosahZAwhcAMe3q8JsUi
         /nJQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788350396; x=1788955196; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8j8qBObsLZb29dVN6IdYnkYMUJi+mf/YEZ8JhM7I8FQ=;
        b=P/Xt09pBynrOnHzYqJXsiGXyyuyovhitnAGn6JdMfZjFBOKtT/ZFltzLFJwy/E3G2C
         ln7nUkecdupziQIAe6PyMO7lqlem+6JJIMcjtqsfa6w7VU4JIkOAK7/1yRem0M1LuAGt
         Yij8wYQMpsjvYomafrzA+hBHVHXN9/HhJZKk0M70ncZtHZ9DKLBMb/hphGBsH/Zlpjhb
         YFff37oeZ0f3F6DpDF197mTdFxQ28Nazeq/+pTMYhVYHQUnFHlu/I6AoZjmeFj8cbuLb
         knEcNU8nEqkTC/0JPSmbAM891nJlKJI+j2eHMDrrKq/Q8yq9RKXNej/0oxYg8tzVEEBV
         hw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350396; x=1788955196;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8j8qBObsLZb29dVN6IdYnkYMUJi+mf/YEZ8JhM7I8FQ=;
        b=SrlrGDcyMA8XKyK/0HVXWbrqiKQnHIqhk/mHivSjlhuRqTb0FFpW6d/zhg5vAvHhYA
         Roi1Tj2GdtnH2PeRFvMkBczRoo/kJWKkbTHk7j/RkYFCZzYfAAXqfVWZIW9OKkbjfb2w
         DetsCvRCC08C55gzp+2x/znvnj/CfoHVTGIitZ+j1rqUbESxgLaA93JD9Z8lAPqgiPuB
         yvNWjVcgANcRxIx5Yczq7IZiyZgFGeN10lBCX/Xt/1H2bOIDbJXBhhMc2H5AFOy8f95D
         6eLygTMJnXKjj6XnC4mK348XaH+CEvNUkY7ceaNuqyX5PXNer6OG2b8wB8MhlBvqeiHu
         d/MA==
X-Gm-Message-State: AFuF++l+LeuK0lT2OWwLNu7Sd46nYdKiX3+cKLSvG5PUOMPq6XKBN3mA
	k5dQpZuMW+uu/zwsH7G9lz+svSEzmSlviPQS7og8q5peFTddSRLVBOR1Ic9gR16G5hDCC8YePQU
	6dIgH/5gF5w9KrZRUPCZ7chf3yjpoeyY=
X-Gm-Gg: AR+sD12+9uB47tfUfq4ybIUh/sNKNsKDADeL1n7+Syz28P3+itukM3kD/164kaENXW3
	ecEdNFmMLjjy8HXCIlIvM+YDZUhS6aAqC6I6+RfzjC1g4d9YnTA3Miess1ef2eEgWV8l/tabCKQ
	WXYjqEg4yoX8Fv+FJN3Fl7bvfTRcIIBxZSXgVw2uXgp1ck5z8x0TNsbu5YYuSivsulmRJzYFzxP
	26UQTL7NkYt0sx0FVsit2kR1LfZ7fGEJ+AdO4SImT6N8l3qkYOuzkot/jcpACGLQUPegzK89pLy
	DS8iYKaH0HN/OHh2sQIalNhwEi+J0eu9MJ9AuuQ0zpubeEZ3Vwr5s+ULc8RHMGDcfQFoFpgK4J3
	vTJQf9a+ecLP9cw==
X-Received: by 2002:ac8:5c8f:0:b0:530:256c:2a7a with SMTP id
 d75a77b69052e-5303a54adbamr7279601cf.12.1788350396221; Wed, 02 Sep 2026
 04:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260902083814.3966089-1-gustali@axis.com>
In-Reply-To: <20260902083814.3966089-1-gustali@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Sep 2026 13:59:45 +0200
X-Gm-Features: AcwNN1VEDOjGMQ4D18Qi-dHv94I0TA-zVWFHGp8CuDWtXR_mxYBxHyISqJCn0wY
Message-ID: <CANNYZj-U2CMMmb51x2phvgMwT5O+dPh+OrOu4hy=GjAjezbO2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv6] boost-asio: Add recipe
To: gustali@axis.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 12:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244937

On Wed, 2 Sept 2026 at 10:38, Gustav Lindberg via
lists.openembedded.org <gustali=axis.com@lists.openembedded.org>
wrote:
>
> This is needed to build boost asio as a shared library rather than a
> header-only library, which is needed to save memory.

Why specifically asio and nothing else? If we want to build bits of
boost as shared libraries where upstream only supports them as
header-only libs, then there should be a general solution, and ideally
one that is accepted upstream.

I think you need to discuss with boost upstream first before proposing
something custom for core.

Alex

