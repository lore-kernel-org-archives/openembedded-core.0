Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5E5C27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 10:08:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.16039.1718014127766496830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 03:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NAeIyqZ3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-421a1b834acso6914115e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 03:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718014126; x=1718618926; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q+K7oIz5X8vfuVCfpzM4HQP+oUCbYYTsIYBOG4w+O8M=;
        b=NAeIyqZ3o+wnRSTQbyXfhXYaGJMxrLLhSyDC3eXY8olcQ1FYrw/ioQ1Wlarl5NsYaN
         x394+/fh2/2eFs0Ue8Oo0xviD0epY206UE9HcU4yjr0Gi8hH9S/JdxR3rt99gS31uQtk
         XV8aM9txQRlcPySL3Y0LSMZMJQTyVIFJJxLJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718014126; x=1718618926;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+K7oIz5X8vfuVCfpzM4HQP+oUCbYYTsIYBOG4w+O8M=;
        b=qu4D810Z/jtoOXZQXPdTSLhBzV6BBKOhtXEhf/43t1olnQTssoPoKlraNn23bdeHTl
         Wp8yio6xr9AUSjz2ommpZVC8LhMZZaKIkvczyNHPIRnHmKopPhNNWi+McycMlIkEr1dW
         ig8KQ0NuHxx2jQJNbuiwy/HxPgpJBv9/vb/j2gATFLGPhZdOCSd5x4gdrGVqBUlC7s/S
         tzjiXJQJO/MsWTmqbCXvUkADknrrZ4DnYE2O0sw3pzl+1V44aMGyqCg51Lu1t27/iArK
         voDY5VRcnsk6KE0LJTT8RCpUPYS9iHefg3OxXkqx26Y3h0TvyurSuYR6XivhfICOOAPY
         M4Vg==
X-Forwarded-Encrypted: i=1; AJvYcCU+K3zwv1vgOgtCk7vSQwdldVVTRs+qPvmLGFeyA7UUOG7OZ1+92sqJUwUEa+4o/PRwc4JOs6SueZBxs15MUUOgtt8WlNoZlgzsZgbETq9RqBi7PnYxGg9e
X-Gm-Message-State: AOJu0YxPV3p8nMCjnEC46vnZw7E1EM7ri/mP3wN2iclimIaA35UkNZbf
	ncX608bH5Q++6EtNuhjSLMZ8cAaakL+lM6PQOTEvlfwPyD2502LVQQEUGRSVeUU=
X-Google-Smtp-Source: AGHT+IHb23TrzyaUBBZTuMYqjEvAUmGUIHgstNs/6YUda3aVI9+NEpquQn6MT7682vK4yAIqkZFL0Q==
X-Received: by 2002:a05:600c:4e92:b0:421:82ed:28d1 with SMTP id 5b1f17b1804b1-42182ed2cc4mr18177425e9.41.1718014126070;
        Mon, 10 Jun 2024 03:08:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fc3b:77d4:176b:a54? ([2001:8b0:aba:5f3c:fc3b:77d4:176b:a54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4218932d9dfsm41515645e9.3.2024.06.10.03.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:08:45 -0700 (PDT)
Message-ID: <39d85fcd4e6a1b4bd439fdd7654b64ff69d4e646.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake-config-build: add a plugin for config
 fragments
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Mon, 10 Jun 2024 11:08:45 +0100
In-Reply-To: <20240509160843.3283186-1-alex.kanavin@gmail.com>
References: <20240509160843.3283186-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 10:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200468

On Thu, 2024-05-09 at 18:08 +0200, Alexander Kanavin via lists.openembedded=
.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> This allows fine-tuning local configurations with pre-frabricated
> configuration snippets in a structured, controlled way. It's also
> an important building block for bitbake-setup.
>=20
> There are three operations (list/add/remove), and here's the list output:
>=20
> alex@Zen2:/srv/storage/alex/yocto/build-64$ bitbake-config-build list-fra=
gments
> NOTE: Starting bitbake server...
> Available fragments in selftest layer located in /srv/work/alex/poky/meta=
-selftest:
>=20
> selftest/test-another-fragment	This is a second configuration fragment in=
tended for testing in oe-selftest context
> selftest/test-fragment	This is a configuration fragment intended for test=
ing in oe-selftest context
>=20
> The tool requires that each fragment contains a one-line summary
> at the top, followed by multiple lines of description, as hash-prefixed
> comments.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

Firstly, thanks for putting this together, I'm very much in favour of
adding something like this. The main questions I have are around the
interface and naming. My feedback/open questions:

a) I'm not totally sold on "bitbake-config-build" as the command name.
I will give that a bit more thought.

b) The code adding/removing require lines from local.conf seems a
little fragile. I did wonder if we wanted a higher level bitbake API to
this, for example a BB_CONF_FRAGMENTS variable which basically tagges a
set of config files onto the end of the base configuration parsing?
This wouldn't be hard to implement in bitbake and would then make the
tooling easier and less fragile.

c) Do we want to have the config fragment name as a
"<layername>/<fragementname>" pair and have the fragments live directly
in conf/fragments in a layer?

d) How do you control ordering between the fragments? Do we need
dependencies? How does layer ordering or dependencies affect anything?
Can fragments conflict?

e) You've used comments at the start of the files as
summary/description. Should we use some kind of more variable like
syntax which allows for other information in the future?

Cheers,

Richard


