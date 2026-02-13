Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48D2EDF169
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 14:27:03 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72940.1770992821792248078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 06:27:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JfwFVq8U;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59e63811e45so847492e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 06:27:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770992820; cv=none;
        d=google.com; s=arc-20240605;
        b=CS9dCbA5lQlTRiuKQU7AjyCFFVrvgqCYdhwuHJvYeoRfz8X4dp5g8ArUOUbJwiqqfz
         A4HHA22XniJylifecHi1UUjQhRuQd9PBPjZkfloeP5+LcuSX+Oa/5DiqG+DPFLe1v07c
         HHu9Rael7ZfN5AMRR5WLSuOU1vxHaF93s6wfHH7KumPo4N/Z+z+SX+LrlyeAXEsjWBAc
         Z9Yfpb0eP8Oa5PaZjQSXE9jQwV9wt70oIwiH6ptyBZdRmMP4igAGq8ZTLmfd6bvQzLHt
         jQe5Ccs3AviQORVyEQ5iLvVVnwV51WQ27ipKv0zXEEJyFJAbQXsUT0ZxUU//tvJWQS1A
         QoRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v6xQwQ0oad0HiQ5AKp7IqzGZTFjxXf2AfO965u+/yqo=;
        fh=+GiRts8kn5FigT72JKRxWyowjZtd/aI3iO/08d78AOQ=;
        b=YIWjuPWj6w/0iT+nrTS9V1kepivAVrs1xEEiiYZfFm7mmN7oe+dier7lDMClRHrbVP
         kWGMdii0UTev4akmG4vGD5tktrXTdi2YA8NLT8WqQ8hEQYf8vJvq3E+Mj1g37M9jZIJr
         RontmHIFTWZMzbENC+efFb1ex/hOyOQ+Z/IRQ/uT48KBaeETyKOWu7YlWD7fX7jP4u3g
         5jYVxz921ylVVo8sIWrNeEp/anMwv2KotgiJefkR8m9g7tyZGzYPmz1mQM+xCtZtqZk1
         JplPwzjVKmDq6SCoyIgIXPxaNIyFM/7auaBw5DrQCECEX9+AH8y5+VNIFEx49OKl8bCx
         xAvw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770992820; x=1771597620; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6xQwQ0oad0HiQ5AKp7IqzGZTFjxXf2AfO965u+/yqo=;
        b=JfwFVq8UP6qtdzAusQMoppOoqSCFRInKyl/HyuBE867ddUl7ckLJR+2XLdw5Cc83Vn
         ZrYWe0Rp58j/h/wLuHR10zusX+/avc0PaIp3mn3ZZo2XY8HHdhGGSrpS30GVkHzBB90I
         UYnYS15JK+7TE6EBi1PUoOL6qYj8xsir7M9VLITBy600ESHHWujxKsOpKxT/J87fxjQa
         /dOU0aEuzWRBvc+W4QmCEJpLLuDpcu/WzEMddcU78DtXtNdywFANvQ+//N2sZuHAvi2s
         2yi2d9xCn6C7KktXTEDa2NpX7vle5zJqaXiUHGD89pE+AZtl09PjbnA7hZIGVvpeyVY6
         3Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770992820; x=1771597620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v6xQwQ0oad0HiQ5AKp7IqzGZTFjxXf2AfO965u+/yqo=;
        b=RYQPhw2oJBOTWmwfXkPdamWKdm257yrsw3MvN9XvEbBRppCBdNtKZvQ3akqQhfdsxk
         m7gkW845/0WQgIMKcvjRpn3MHwKSi7D4X/c8m2OWMXZPaJV46x9JlGdMka8FLQcv1FVO
         kk24a85v74GodW55lqDbHAxWfSN5BLHA6CCEA27ABFPUlZUlJ+dtrFzjF4zKy24hNsfQ
         K8HH4O6cNCEd5zhNKJrNoLMO8KoDM9wQSqr+bhs76M3lXX5rZDHLp7+LyZMdRfjoMdeT
         2IbJiSGWOwGW4XWNGZf16SAzwF38LWmploVD0amJ9Gjrx2LjG7RsnEEjx2oQJC6dFXAk
         d8pw==
X-Gm-Message-State: AOJu0YyyF3m8grsTYLClgcDTGjsV8p7VB/2ceL4InZH1ruUMmEy5T28Z
	GI4uqiD9QKCrCrwqjUna5NtBuLGKC2t1GA6oHkms3dyr5uOUhIN3QtTbauipZdvo1zKnwl3+aao
	cDXVL59FuINVG7HJWAfg2+VF8wHwkmiw=
X-Gm-Gg: AZuq6aKkiaaQK9Bvf0jlz+W22Fb+6rFnBM00pjGEK5dDLNGCUbRYMyHnaYwctsMcEZ2
	w8dgQYwxdLK5l5+6VyrfRRUwxNcP8O1QtHMm5SUXKCR5+ZPkyV5HioNYqaabTTX7Yf+tl/LLRpc
	b8b+8ghFAwtvKEVxTkbWOexkQGvPkmrpbQtjBoQqfzMcC6OBkv+jF4bvLX5nbqxndi9jV+6RnfB
	R61YOQuVEELYqUkI++kSHcf4A/kwzB9Ti3LlvWzPOy4Jo9DwcwUeaql2mKTDu9jrtbs+6ooxEb+
	bn+UkPS9tQ==
X-Received: by 2002:a05:6512:398e:b0:59e:50e7:1270 with SMTP id
 2adb3069b0e04-59f69c3b467mr737308e87.19.1770992819457; Fri, 13 Feb 2026
 06:26:59 -0800 (PST)
MIME-Version: 1.0
References: <20260213-mesa-26-v1-0-9e925e474091@cherry.de>
In-Reply-To: <20260213-mesa-26-v1-0-9e925e474091@cherry.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 13 Feb 2026 15:26:45 +0100
X-Gm-Features: AaiRm51Ms-bCr-qbku0nWMw0Ys_QqanXRvst7W2sZ0Nv9Cy4kVxCUm-U_o-qWEM
Message-ID: <CA+chaQdEyxgZE8Vqj2RbxzWq1Us949dNziW867TfrcnUKfSu2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/2] mesa: bump to 26.0.0
To: foss@0leil.net
Cc: openembedded-core@lists.openembedded.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 14:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231119

On Fri, Feb 13, 2026 at 2:23=E2=80=AFPM Quentin Schulz via
lists.openembedded.org <foss=3D0leil.net@lists.openembedded.org> wrote:
>
> This fixes a small oversight of llvm missing for compiling i915 gallium
> driver.
>
> This bumps mesa to 26.0.0, the latest stable release.

I am not against this upgrade, but mesa has this strange versioning
that 26.0.0 is considered new development release not stable release.

As in:
https://docs.mesa3d.org/relnotes/26.0.0.html
Mesa 26.0.0 is a new development release. People who are concerned
with stability and reliability should stick with a previous release or
wait for Mesa 26.0.1.

