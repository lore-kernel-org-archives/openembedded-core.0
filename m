Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF9D6D1BDC2
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 14:27:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.47910.1732372063373007768
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Nov 2024 06:27:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AQqGvEeU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4314f38d274so36419485e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 06:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732372062; x=1732976862; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BrpVe4JIA95VkME44qc8pmeEA0C8LIT/sjhrUbAtcg=;
        b=AQqGvEeUKvPsHeoHoKJMASHlHyQ2QvFiFooLm2mwGDnpQBOjfN4mMkXUHyNYTgUc+M
         Dy19TNcdUic4n9xesX+J4KiO/EdZatccvJ+JvuKbzYKeHQ2+Up6QlwVniuzsUHucx4EO
         bVV1vjBcA3cSE45aW2hg9unrg5YB1AYheHv0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732372062; x=1732976862;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0BrpVe4JIA95VkME44qc8pmeEA0C8LIT/sjhrUbAtcg=;
        b=QglPhdWipqiz3THdBfvqN1PmvY23B9MunjdncZxl7QPxgorwge2WnH/S0tnTKKOGpx
         zKg+ys3/e7FZ0HVOPHHF38RJIhifBEHg+RUG4N/9LQpZXyz+5M7QdHkFT/h0siyzuLAv
         HDGc7fGav3lWCh1PvfoLXyi3cr0C8OwRbtBcbTSOP13l0a540kv/ukZr+tD9Tjzz00tr
         o8VSo042vrEiRIIhA83z+6W/TFdOuyt4zW+xjzHSbX3z7Nr6ViLJEaf7+aEKINZPd6TV
         qLd/7vRxBCmd5ITowe/DVGn/ytU7aywW+6XTF5swIr1bGjPFo2VVQ7e1Fp1VPDFrDb92
         KV3w==
X-Forwarded-Encrypted: i=1; AJvYcCVtkjJd5bqXwYbXEycJhPGt1GnwguQzP3PO7/DirxAOibNqFiXxOi0RVUprVmrsQ/XVj/DtrR63le4/DzWwFnD5LQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw8+WIonAw259rQ60uS2trkC6+Lr5SjEPCTS8CRw3/NxDsTjxtQ
	H/cYdFfWKoD7qt+zoKF4Av3WPNqzvkcxWS620Ap//rvZ+cHSAw3oFge0ia6xkto=
X-Gm-Gg: ASbGncsMfWCt7m1bm4N8vqhkzp1+vtoWTgGmBm3xGeqSCfzJp7oijBbJZtdmXS40Z9e
	ZLdMYUE0AGNjzOHxVFYWl+q0EoZ6TkEfuW/Z+IezCRYTdNfYb+4TT6zhI59txqc5la+Kn56C44y
	+h5v7lzqQ+0rzRK4UUgZKj9stfZTqbdJlYeQrGzZZTk/EWvX/NZgBc2zNiBgPn/XUzM1zMuk8qL
	EMC0MBoDBOa67wxoNS5uP6zViT0slxLt/mxmFIMIHQLGRBUTq5t4sMek/o9yz75gaL18wI8s4sU
	uju53jHeBpP6WmV9IV6ArnY+qQYncXv76Bgc
X-Google-Smtp-Source: AGHT+IHI4becB58YNeimy53zGdohZ3/lHuUU5GTZA/TkREqfL5vOUmt4I7J55aYTbDBsRzgiA3TS1g==
X-Received: by 2002:a5d:64a9:0:b0:382:4fa4:e544 with SMTP id ffacd0b85a97d-38260b3caf5mr6643680f8f.6.1732372061438;
        Sat, 23 Nov 2024 06:27:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4aac:8e83:cfd2:609? ([2001:8b0:aba:5f3c:4aac:8e83:cfd2:609])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafe147sm5341859f8f.30.2024.11.23.06.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 06:27:40 -0800 (PST)
Message-ID: <d870ae24a80c7de6082cc4ff99c080e97cf1aee4.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] spdx: Add do_deploy_build_sbom_spdx
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2024 14:27:39 +0000
In-Reply-To: <20241122201623.2247149-1-JPEWhacker@gmail.com>
References: <20241122201623.2247149-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 14:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207687

On Fri, 2024-11-22 at 13:16 -0700, Joshua Watt via lists.openembedded.org w=
rote:
> Adds a task that can be used to generate a stand alone SBoM for a given
> build of a recipe. This SBoM includes the inputs and output for the
> build, as well as the build and runtime dependencies. The dependencies
> however will be added as unresolved imports to the OE SPDX alias, so as
> to avoid pulling in the entire dependency tree (that is, the generated
> SBoM is focused on just the specific recipe, not the entire build
> dependency tree).
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
> =C2=A0meta/classes/create-spdx-3.0.bbclass | 25 ++++++++++++
> =C2=A0meta/lib/oe/sbom30.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 55 ++++++++++++++++--------=
--
> =C2=A0meta/lib/oe/spdx30_tasks.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 59 ++++++++++++++++++++++++++--
> =C2=A0meta/lib/oeqa/selftest/cases/spdx.py | 20 +++++++++-
> =C2=A04 files changed, 133 insertions(+), 26 deletions(-)

One of the other selftests may need a tweak after this:

https://valkyrie.yoctoproject.org/#/builders/76/builds/477/steps/14/logs/st=
dio

Cheers,

Richard

