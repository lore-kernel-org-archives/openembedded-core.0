Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C41BC3ABCD
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 13:22:55 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.50152.1747056169699102439
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 06:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XwY6TqcW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so2747455e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 06:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747056168; x=1747660968; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSIygootrwkrLVK89rDQe46PLwKfIQ9jYnoDdQyyVxs=;
        b=XwY6TqcW9RbHJTbjV+wlHf+grQQmvz4v3Y2bgbMXo4f8vT3cn6CkvkveIHQa1ys/L5
         qWce59+HvT4NsF2zXuDcV6Fe68RdWag+LEdRbWjrr6Si8ghSBHFxs2l6nuG38v4utULt
         Thkz5Z0ewE3fHhRHS4j2Fpw2BpgequNX+PSf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056168; x=1747660968;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lSIygootrwkrLVK89rDQe46PLwKfIQ9jYnoDdQyyVxs=;
        b=FEeZwtvzTy4vW1EOxlFTnXC+25faqEng7MIJwQLnYIWCJZj0pqHKQ3UszbHnETcRys
         p0ZHQkadRqNcABEk8i52r3xxXT6dWEepAJ8SnMrDEMSSVUIUOH/gyy9t1sM7ie5vDyNI
         k3DnPdsTtZNDc52Xu5uOnYU7Mi4Olx5/2Vv4mmJda0kOrDJ2a15C63iBKOL7/CKnS0NP
         W5sje1bmcKnUAO1rCl9T06Fq6wskkqAvsxfZHf34pPIDo8it1vjTEdWsr6TQWYFWQ0wK
         h7lL9VB++rwX0/eThYlhJOgby58Tix/LXvSwM8rrDTIqL9qaBlJOxyDuxvkdS7FmgIYB
         tpiw==
X-Forwarded-Encrypted: i=1; AJvYcCXV8W7qL8b7LroL1WeN/l53C1BGKunUKfpyX/GW2oMcbS9arJPSGo48KiZ82ufh8RrV/wuV1/4+20vWtb7cGkBKZQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyJrFnZFNowGfBeTpcQKrszhtehxKD+JfzD1OdJQcFkgZCuHYw4
	ddybACXLyM1MY7xDZVcYioqQKQCihmJvcx1TRzuljzIjpgmJFqwDwoqsBAa7AXU=
X-Gm-Gg: ASbGncuNU5u3tbceCTX8PfxKKCXGPPIw0PZS/SvfYwEbvzY3Kko5LxA1bttUYpfaEjq
	refnKaXSIpB36kOl08NgR+3UQPJ7Gx8JvEaRDPTJsAVp2LlzUpnZChvAeyLRgraQV6kfayY2hxL
	ZNzGJj7kkojeKN/R0KFDhLfenmOYW4nvpuAlkDq0BGA15XYB0HS61/rrlyLTem76Ilq0tk1DExp
	qaaXzASgMu+IZPn6AKaO9SxI4bm0F/0nPEvESKefUHl9S3CXB9rBJvh2zfhSiSmxyFwMO/yWOWD
	Sm3n2/Hq/XloBqAY+l4S5SpO4yCmEDirRLRWh+VMpNEIk9wbeRzGLu4aSAXtZIWTY8BjI1Rp+Xd
	6v8GDr9DSc0I80PBsWyYWkZJVOt+fDxh5t+FqaHuKuyjwyqGvthM=
X-Google-Smtp-Source: AGHT+IH83x1DLDUQQLU5XxjQxiPGKkhkaCxUBcsWbvPKUk4UTyfIzU2ZEFvr8xpZ0z0IVMVGESUZ/A==
X-Received: by 2002:a05:600c:4454:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-442d6d44aa7mr140026155e9.10.1747056167938;
        Mon, 12 May 2025 06:22:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ce7a:b6f9:5dbf:5fce? ([2001:8b0:aba:5f3c:ce7a:b6f9:5dbf:5fce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7d2bsm169639805e9.36.2025.05.12.06.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:22:47 -0700 (PDT)
Message-ID: <185f54b0fe32289f81b23cc978da6dcd04ba7666.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 33/56] openssh: upgrade 9.9p2 -> 10.0p1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2025 14:22:46 +0100
In-Reply-To: <1747040619-7566-33-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
	 <1747040619-7566-33-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 13:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216368

On Mon, 2025-05-12 at 17:03 +0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> 0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch
> refreshed for 10.0p1
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
> =C2=A0...gress-test-exec-use-the-absolute-path-in-the-SSH-e.patch | 6 +++=
---
> =C2=A0.../openssh/{openssh_9.9p2.bb =3D> openssh_10.0p1.bb}=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A02 files changed, 4 insertions(+), 4 deletions(-)
> =C2=A0rename meta/recipes-connectivity/openssh/{openssh_9.9p2.bb =3D> ope=
nssh_10.0p1.bb} (99%)


https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/1579

(and many more)

The ssh server doesn't work after this change as per the other similar patc=
hes sent.

Cheers,

Richard

