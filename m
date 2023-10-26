Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A733C25B67
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 12:53:26 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.199257.1698324802139987218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 05:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NYzDnIzb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4084f682d31so6381435e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 05:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698324800; x=1698929600; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q2HgUpEWPsyVzqzR/mlupqnTOLrryMLcVfC0uJBKo7o=;
        b=NYzDnIzbF3aUz84oIYrRIPjs84saLUMNjwev8m6+5zG+mR9/1gZO493m8SunN/oI8F
         1os3A4tJczjRmWEwGWq/Gzavgfb1rlL9+4LXGTbnQ6n+1LbEyFoP6HLbFSMc7gRl5kMa
         QYGjSYmK29BCeLPFh1n8sOqE7BlKulc5fhrPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698324800; x=1698929600;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q2HgUpEWPsyVzqzR/mlupqnTOLrryMLcVfC0uJBKo7o=;
        b=aIHVCT5EsKhN1NXnmFXgFU8ikZQjyhTHeI1s/Mic9y3Omi5R3V9y6g9ZSE+QqPPNGg
         RKQypypooPOe5T7rWZqChkRHfD+HaXkhXXoNnJ3xl0bDjoFqw5kdFm7Lai376a4CXHVp
         Z2ag6slvxd6qd2pueGZooUDxQxjcBKpSp+pdZJFxST3VJE67Rgar+u4+35cLcN2iXOpg
         XffzakiozObsUvhIWTM8XWokkhiP/tX1PaIjG2IPMQKKycOnwfzD+W2yb/e/K9iU+8T3
         qoEvBcvGm6mj8ASwqcrVcrBG3rezyIUi240m+qe91Fs7OVPfcisO0SCfs3Sc0wH9HStZ
         c3/A==
X-Gm-Message-State: AOJu0Yx+WDqKiqGwJ6fCTJWChSOP996JwOKmR6FUwC0+vyOwoMYqMrlT
	l6ebdxGUC23nzepucqlXNUYxBA==
X-Google-Smtp-Source: AGHT+IH+jL6avKi4pG8cFzNVqA9XoYyFvwAEuaABDUMTlKI+hhN5x2OUzRVsOr5WUM2S2YyD8petpg==
X-Received: by 2002:a05:600c:19d1:b0:406:8c7a:9520 with SMTP id u17-20020a05600c19d100b004068c7a9520mr13955809wmq.36.1698324800556;
        Thu, 26 Oct 2023 05:53:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3? ([2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3])
        by smtp.gmail.com with ESMTPSA id i1-20020a05600011c100b0032dcb08bf94sm14239433wrx.60.2023.10.26.05.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 05:53:20 -0700 (PDT)
Message-ID: <973f1bdb68a371c54826efc9ed6ebbeb6c0c98b0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] selftest/sstatetests: add a test for CDN
 sstate cache
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Date: Thu, 26 Oct 2023 13:53:19 +0100
In-Reply-To: <CANNYZj8+FTOO4cDsPzE_g4Hdfw7qtHvnYvK1WwFYdRRLKhJbWA@mail.gmail.com>
References: <20231023110618.3525311-1-alex@linutronix.de>
	 <20231023110618.3525311-3-alex@linutronix.de>
	 <20231024103345.306b9171@booty>
	 <CANNYZj9NJs2jBKZxhDAAARcdCM+sX=d5Ztt+fzYeCh19dH4wFg@mail.gmail.com>
	 <d1592d8729869060f7226e55171ea7760672aa0d.camel@linuxfoundation.org>
	 <CANNYZj9fLzU0wT9EyWL3hYF7Xpk+F_E9n2i+OmsrWj1qmw+3FQ@mail.gmail.com>
	 <ec16e182f9a2ca5452920f6bbf8d7cdb96bfdc71.camel@linuxfoundation.org>
	 <CANNYZj8+FTOO4cDsPzE_g4Hdfw7qtHvnYvK1WwFYdRRLKhJbWA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 12:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189724

On Thu, 2023-10-26 at 13:32 +0200, Alexander Kanavin wrote:
> On Thu, 26 Oct 2023 at 13:26, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > We need to think of ways to test/debug this that don't require runnin=
g a-full.
> >=20
> > We can create a separate target (builder) on the AB to just run the
> > test?
>=20
> But it needs to run just after the task (e.g. world or some other
> which should be dynamically specified) that is supposed to create the
> required objects. I guess it needs to be done with a custom branch on
> yocto-autobuilder-helper which would define that, but then how to
> trigger it through the UI?

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6105/step=
s/25/logs/stdio

AssertionError: False is not true : Missing objects in the cache:
connman-gnome_0.7.bb:do_package_write_rpm
font-util_1.4.1.bb:do_package_write_rpm
gdk-pixbuf_2.42.10.bb:do_package_write_rpm
librsvg_2.56.3.bb:do_package_write_rpm
gstreamer1.0-plugins-bad_1.22.6.bb:do_package_write_rpm
gst-examples_1.18.6.bb:do_package_write_rpm

which is a little worrying :/

Cheers,

Richard

