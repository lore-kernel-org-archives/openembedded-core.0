Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9E0C25B67
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 16:13:48 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.75059.1698336819749710666
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 09:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lp32oMNW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4084b0223ccso8613915e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 09:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698336818; x=1698941618; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JaFi3sMhGXRyuCCYmDLUoO5LFks9P9rDSOX1CcVO/0Q=;
        b=Lp32oMNW9aG10CCyGzWaVHB1PWTNKMzQHViL9pqciMT0/5iotTW4/g/AxZ48kHKYs5
         Mwys7XWbby5yE8RkN2r5pM+X/rYgl5m0zU4YzPilm02/QacD7gsoeAm5U+m6jHBo/j5i
         TfQyu/5xSpT5+V0qNDqviacsnbhmF3GjGuqkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698336818; x=1698941618;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JaFi3sMhGXRyuCCYmDLUoO5LFks9P9rDSOX1CcVO/0Q=;
        b=C3cT+7d7sN+PdXM/O4cqiq7GQGic4/Gvxj1IeZtypVkGBqe4rYEUkq5WQNgi5aGhjA
         zI1W7bit6MBfhk6CiuVj8JVH/nxUT/lJBt+W5uIjP/TklAC3XeLFuAeF1u2ogl6LSpQO
         BDZ9HSp4oC805C+ZOWO6TQGmpq+om3JpVbLlnh2BYOvncwSGElCUoj85phq7oAj8Wlhr
         /uRjGxRE6XpaV+SO6qwKN0ahVU/vmSOmNbYsxS9Il+P5UCAaW5w1j/YGFsaOG4qjhVd4
         7+I+Olz7PDlXV2gI4EQhfeBnGmxoDcVn524iNpl59sPq9gYyqCikPAI2ToXevuNcvmp6
         r6DQ==
X-Gm-Message-State: AOJu0YzwoZqF9RCv9aFcVwUmoYYHyHPTYGgN4Xna9lnZtKrReKFNDHFH
	GVJ+dQZZy9PEZtJxSD7+6Ue3Fw==
X-Google-Smtp-Source: AGHT+IF/skkW72GnYsZHFpzAbmebcHQvAaZJxQrcZlMNGSpU3fLbJsNPJS6ORVLUiZI2atGKySvjoA==
X-Received: by 2002:a05:600c:2206:b0:409:295:9c6e with SMTP id z6-20020a05600c220600b0040902959c6emr203333wml.30.1698336817960;
        Thu, 26 Oct 2023 09:13:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3? ([2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3])
        by smtp.gmail.com with ESMTPSA id m5-20020a05600c3b0500b00407752f5ab6sm3035225wms.6.2023.10.26.09.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 09:13:37 -0700 (PDT)
Message-ID: <a42209bfa5e02dd7b906631184f698e5bfdfd77d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] selftest/sstatetests: add a test for CDN
 sstate cache
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Date: Thu, 26 Oct 2023 17:13:36 +0100
In-Reply-To: <CANNYZj-HbxPewRCJ_44F4FhCcMQ-fmbP=o4=4fE-srQf+QQD_w@mail.gmail.com>
References: <20231023110618.3525311-1-alex@linutronix.de>
	 <20231023110618.3525311-3-alex@linutronix.de>
	 <20231024103345.306b9171@booty>
	 <CANNYZj9NJs2jBKZxhDAAARcdCM+sX=d5Ztt+fzYeCh19dH4wFg@mail.gmail.com>
	 <d1592d8729869060f7226e55171ea7760672aa0d.camel@linuxfoundation.org>
	 <CANNYZj9fLzU0wT9EyWL3hYF7Xpk+F_E9n2i+OmsrWj1qmw+3FQ@mail.gmail.com>
	 <ec16e182f9a2ca5452920f6bbf8d7cdb96bfdc71.camel@linuxfoundation.org>
	 <CANNYZj8+FTOO4cDsPzE_g4Hdfw7qtHvnYvK1WwFYdRRLKhJbWA@mail.gmail.com>
	 <973f1bdb68a371c54826efc9ed6ebbeb6c0c98b0.camel@linuxfoundation.org>
	 <CANNYZj-HbxPewRCJ_44F4FhCcMQ-fmbP=o4=4fE-srQf+QQD_w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 16:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189735

On Thu, 2023-10-26 at 16:36 +0200, Alexander Kanavin wrote:
> On Thu, 26 Oct 2023 at 14:53, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6105/=
steps/25/logs/stdio
> >=20
> > AssertionError: False is not true : Missing objects in the cache:
> > connman-gnome_0.7.bb:do_package_write_rpm
> > font-util_1.4.1.bb:do_package_write_rpm
> > gdk-pixbuf_2.42.10.bb:do_package_write_rpm
> > librsvg_2.56.3.bb:do_package_write_rpm
> > gstreamer1.0-plugins-bad_1.22.6.bb:do_package_write_rpm
> > gst-examples_1.18.6.bb:do_package_write_rpm
> >=20
> > which is a little worrying :/
>=20
> I've seen this in local testing some days back too, with the same set
> of missing objects, but I had ascribed it to master not being
> populated yet. Seems like it's not that simple, but I don't have a
> clear plan forward right now.

Lets make the test print the hashes it can't find?

It would be useful to know if they're perhaps delayed somehow on the
CDN?

Seems odd it is the same list of things though.

We need to find the hashes we build, and the ones we can't find and see
if they're the same. If we get the siginfo files for them, we can
compare and see why they're changing.

Cheers,

Richard

