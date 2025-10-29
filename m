Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E0ACCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 10:46:26 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.3524.1761734785812708785
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 03:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hrGE/43R;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-87c20106cbeso104682636d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761734785; x=1762339585; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YfWnNiJXIB0Bk69PKCIoJzXXIpYnYMJ9ZZvchmwO/K8=;
        b=hrGE/43R2d1a1UEL7aNE6rMkDkL89P4tG0TlgrQ6A0cy8+XbMK9kmgAx3G3s+E2898
         J2X8zJdV4yzR2lvpEHi+7/OU4bpxNndl/58okQh2kaWfVGJwmKdJgTBLLxY+ldfgXOUv
         bbIjQaYRFQ4EmjtTuzkgfnKbkUFVlBzaY6TXpDZzeo0Xb43QXrQu7Umz22P+EjwXaMp8
         C375O1wJU4XIExBY+07gxEdIrznlVqAoGLKC/DTYnokaLpUXMi7/3z/0qX55JwkbJGDa
         1J/4iIvJ2S9mgZaZShg+niZ8YmYXt6cOeIxyPyoNK7vdRyk/aTdGxXhkL3a5Sc4LKJpG
         vDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761734785; x=1762339585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfWnNiJXIB0Bk69PKCIoJzXXIpYnYMJ9ZZvchmwO/K8=;
        b=k+cAri9ZY/4ne/ZzKR64YZhs1cp7RwfNlrIgrYme+ttB0mOOH2FT5tkqPhEkABsoCz
         J0pcSZg5G2gDVuzIYzMjdxcb7VveURf3qXIhXWjbC8yM8+OoTYCpM/65NAlsg6KVqYP7
         YKCZft6aFqS+Y8hW6VL2Ij5y23P6wjM/4VXQbW/F30nwr0gvsCZkWWQwxnF7QIKeZv9q
         1NHf2iA8xE+gLRU7KaMosjezyX2+fWgME9vaSTkqUl0HB67CVUZ6hIoRZloermMK0L3y
         YW7e05Em5Cvt16brU0y/Fim55c0aQbDz0Uj/o995DLDYTME4sVKE9hCLNFNT8j13Zmm7
         3axg==
X-Gm-Message-State: AOJu0Yz+j0yyHJfQz4lXchWpdl7wLhV6M5vL359+L3n/nHvdVxqHWTjy
	zbjz7oNfQ/5L4DSN8EOYHBlMoZjxISy3HXAdXDzv0DTWmCVL7MPzqVxcsR0jGHbaISKLtbpm8K5
	IHnUkwuQpKMpDh5fpnjdPxFjb5EgsU04=
X-Gm-Gg: ASbGnctZEDoZdPJK85ZiC2jQRwXdXUatnE+dUts6OxR70q0O3VCNN+/6Vt6IAubWqNB
	lu5cqnPNMRrH5nSNjvSk4/XztqB/IH3i85VHAuohO+EhH6eVSO+t/pjXHcuPUo0pNN4xSwKIbZe
	wqL1H6r7Nc0xL+10iaeDaAL0B4NPQ1dJLAk0ztPcFlm/r2xpLNsO3sb9gQIfrt2JF02qQ5sFfTd
	Gga09emGiIYyN25AnMzImJeSp7jOElfQhAYiPICe3wGyOeJVoTGDWRxJX+Omf4HKJYoG44fDrt3
	QogC9Sozsedbbk9GyijRmTMdsmgJEos8urm2XnjSn0w+B2dbD02i9yiHHzJifkNIeAIe/ZboVAN
	ZNIIaClRS7Y+PGJBpyg==
X-Google-Smtp-Source: AGHT+IHGc9Y1xa2dVN52N6BKewKNh7disKLZfR1G0+P2KdiHRFm6zb1rFBazPgnFCYV4ai1ClIgauFQ3kFKs+6n3C8I=
X-Received: by 2002:ad4:5ca9:0:b0:87e:32:8f16 with SMTP id 6a1803df08f44-88009c0915fmr25510586d6.52.1761734784808;
 Wed, 29 Oct 2025 03:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251029002918.3728797-1-dmitry.baryshkov@oss.qualcomm.com>
 <CANNYZj83omwdp2NNvBf5i_AVMSgWtT4F9_Gyq6HMsDhsNzyKDQ@mail.gmail.com> <1872F068E93A2F1B.25345@lists.openembedded.org>
In-Reply-To: <1872F068E93A2F1B.25345@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Oct 2025 11:46:13 +0100
X-Gm-Features: AWmQ_blpw0EFP_xnRshy7P3yhYxsUWOrEC8PGmfZGAMMLtPxFv6tjC1a0okrows
Message-ID: <CANNYZj_s0JtugEJrCWs5jEupZg2A_AHaDkzk2+r0VZWY4Mbtbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] libconfig: import recipe from meta-oe
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 10:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225445

On Wed, 29 Oct 2025 at 11:45, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > > +UPSTREAM_CHECK_URI = "https://github.com/hyperrealm/libconfig/releases"
> > > +UPSTREAM_CHECK_REGEX = "Version (?P<pver>\d+(\.\d+)+)"
>
> Oh, and: the latest upstream version is 1.8.1. Putting that into
> oe-core would be much preferred from the start.

This ^^^ nevermind :)

Alex

