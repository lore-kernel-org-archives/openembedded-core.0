Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06DE6C02196
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 12:58:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.11132.1738760300672851504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 04:58:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hQkP/pge;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361f664af5so77038815e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 04:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738760299; x=1739365099; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Wktswvgi9oqnPbUMGjhrBtEtNNREhciw1V35lXaENk=;
        b=hQkP/pgeX7cGrawqGmzUWaP553wLa5h9s53cKgyhtjKqYQxFEAn5lhpQs0L43JINL+
         37ms0EqIE7RZKNTfmpS1fXRBXmMefe0Pyk1bL1oV2hZblARNC6QVRfqO2RUoOjoB+ulI
         PK+d2CJZeoYe7XKgc53JkuWLUo/hStjQCt6Yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738760299; x=1739365099;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Wktswvgi9oqnPbUMGjhrBtEtNNREhciw1V35lXaENk=;
        b=jSq0L5EhIwtIomYAU3w1xk/kDlHHAKPA50S2IevE43seSMch6GYDdpR+cJikNxHYOk
         Vql6zS3CCQgMscpzWdbMNEcmjtwMO7OHYRKiP1pdgXrtk6287vKsXcZtDAZ/J18fMN/q
         6Y2+sIt7CgfIXwD6lLt7dyNEhXFeC+700hxsYvM3mysDHb/z9pINfLZhF9hx8KinuhM7
         BcqKqI1A6Ba5IQw6F6K/TRuiMppsYWeWa9W5p++y+As3UpkqHYgnv8zTmezkYe5j97oH
         jF3kLi5KikJgFdlTxXDP95dGV1x9zHREu+k2t6JDkXi68+Y/h9eZUOJiwBEXtcnXfg2z
         X4Iw==
X-Forwarded-Encrypted: i=1; AJvYcCW/LmWfPeDfPLj5XCxiZsi0lka5QTz5XyG5uOujhbSVeQA19efnTuEibGPekfpcCHR6/Krjo/FbiKhrFUpKbXrAsA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwlBpFF0d7DL6noaRLXsJWuhxlbWsV0Nj0XKzFvaFv65A2QlwE8
	+cytsR1pYNaz8tlRZxEmkly/MlgXVROoG5BRRrEAjiBjt1BmJzntWpmB54EknVQ=
X-Gm-Gg: ASbGncuvhAbztHHHb3roZXhOyBfIrckxu31921lT3cLqgwMv4JcPw4n0sGr5+mJ06kq
	3o+CPzt86Ep1xX3Dp+TApGSWAw2lKJlgOJX/WXx80og+lcoFyBkVjYK7DMc88MU2YFZsBeSUj+k
	pJGS2s1jIUoOtbdTfToPbbFskH6sehgjJJYmyUAhDEZ5iSqXwZOhsy9xUJ1vIFaoxVUWyBFAbye
	SR76zW16GcQiqv5N49uBlu/RoDNFuFElxxFXkiG9sxh2vMY3043KQNeVKltUUIMAQ9yxnLJEjbE
	CGjXMv1/hYDAldjOd5dVo3mFfraHft4NefNLZIxzrk8anbtRFGkDhbqZXNY9WtMgWjZ8s8WOif5
	wCS8j
X-Google-Smtp-Source: AGHT+IFgsUfPnM4hjvq/QrH2V1vMqfPmWN/f05h1dE1bVhh8T1T4usbBv+A/c2ZqLd9rpFhxG1k3cA==
X-Received: by 2002:a05:6000:4020:b0:38d:b2e4:6da3 with SMTP id ffacd0b85a97d-38db485890fmr2012736f8f.9.1738760298906;
        Wed, 05 Feb 2025 04:58:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:be8c:5293:84c1:352a? ([2001:8b0:aba:5f3c:be8c:5293:84c1:352a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d933a3esm21674795e9.5.2025.02.05.04.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:58:18 -0800 (PST)
Message-ID: <80da1f00553f9379ddbcd9af8c46bb5fb156f05f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/3] systemd-boot-native: undelete but
 disable configure and compile tasks
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Wed, 05 Feb 2025 12:58:17 +0000
In-Reply-To: <20250204141705.1222153-1-mikko.rapeli@linaro.org>
References: <20250204141705.1222153-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 12:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210846

On Tue, 2025-02-04 at 16:17 +0200, Mikko Rapeli via
lists.openembedded.org wrote:
> The tasks were deleted and do_patch() was run after do_install()
> which means that patches applied in SRC_URI were not in the
> ukify.py binary installed. Mark the tasks as noexec since
> they don't need to do anything.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/recipes-core/systemd/systemd-boot-native_257.1.bb | 5 ++---
> =C2=A01 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
> b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
> index 58db408dcf..5b4b63c294 100644
> --- a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
> +++ b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
> @@ -2,13 +2,12 @@ require systemd.inc
> =C2=A0
> =C2=A0inherit native
> =C2=A0
> -deltask do_configure
> -deltask do_compile
> +do_configure[noexec] =3D "1"
> +do_compile[noexec] =3D "1"
> =C2=A0
> =C2=A0do_install () {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -Dm 0755 ${S}/src/ukif=
y/ukify.py ${D}${bindir}/ukify
> =C2=A0}
> -addtask install after do_unpack

I'm a little torn on this, we could fix it by changing do_unpack to
do_patch.

Using deltask is slightly more efficient in that it completely removes
a a node on the task graph rather than having it present and running
all the way up to just short of execution.

Cheers,

Richard

