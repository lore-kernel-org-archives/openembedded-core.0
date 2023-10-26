Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F617C25B67
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 14:36:47 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.72391.1698330999590271357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 07:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TqyXc1Pu;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5079f9675c6so1473080e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 07:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698330997; x=1698935797; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/PRkVU/kwuenoc4cc/+SQWmMfgzbz6e+YdED4xtTuSE=;
        b=TqyXc1PulVzA4f8+ieBEhX40QMAhA37gHatJVKk+4FjS5a36CBuPuH8Bzc+65VdNCD
         k49coWqvX+StiijxWdnevvAS3oY/9ntbGXIc4Wm9FnEIT70E5cSgsclrPtONE+RKZhvc
         YT4Aiv/j6VVd7vFJZXinnhHfN6emztqtlu5jdb2WLqWi/1bVmdNdNJMkkb46PHYAKCYI
         MFLC9HbBk7dqIhIvfTjf581buB88mDAp/7bQ6n/pbGFYelzqjuOMxKiAbijg2UuPqjBb
         RyRACeWDZK02+dG1OAOJWY7hkgDhwqdNNO0lJmBPP8UVpBvmim3NymJ3c4qizBag/9Vd
         D3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698330997; x=1698935797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/PRkVU/kwuenoc4cc/+SQWmMfgzbz6e+YdED4xtTuSE=;
        b=ipvZ13cHKvV82S7seppulTLA5Y2+uZbNy4wrOQwFDSibNN6ZWXD2M7989DpvTFc48D
         8zrOXD2cpxICk7KIVEqZDHXo+WKA35tsV8MEjlWVGMsgr/Dmj+aMzGw5YM/Htxh84vz8
         sg0Q/0MAGZZZw/Auv0bJrLq47TYFajr4u4Ud9QMwHDtXmgB+vpvAbkIkQIvFdEzGseOw
         k21+bX2Bb99gNE0GdHgfSaF0+Q1FTF9+f+h+JhQgRF1T0nEOfvVPn8xupYGoSGam+8Cq
         HXAGd6kg4vds/Ngxdjr0mkcoMpZjTBRWRWtrlnHhKTDLMdUswigo0BJIdGm79Isnpsts
         KBDQ==
X-Gm-Message-State: AOJu0Ywxevn4JtbQPwkWoEGSR6f3yDCTJ1vNEihyBCTOimVXrp9R/XZW
	/xDwZUHDC8R6izp/1PihnhNigntMIGxoCT/CRIA=
X-Google-Smtp-Source: AGHT+IEdxJSqNOIVsw2C2F8His0H0Xw0ExajK+CTfl6R9U4ujYbqZo2LklzJYqttNj53dedVflk6n6Bpi7nV6EL6zqw=
X-Received: by 2002:a05:651c:b11:b0:2c5:169f:ff03 with SMTP id
 b17-20020a05651c0b1100b002c5169fff03mr14843876ljr.5.1698330997245; Thu, 26
 Oct 2023 07:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20231023110618.3525311-1-alex@linutronix.de> <20231023110618.3525311-3-alex@linutronix.de>
 <20231024103345.306b9171@booty> <CANNYZj9NJs2jBKZxhDAAARcdCM+sX=d5Ztt+fzYeCh19dH4wFg@mail.gmail.com>
 <d1592d8729869060f7226e55171ea7760672aa0d.camel@linuxfoundation.org>
 <CANNYZj9fLzU0wT9EyWL3hYF7Xpk+F_E9n2i+OmsrWj1qmw+3FQ@mail.gmail.com>
 <ec16e182f9a2ca5452920f6bbf8d7cdb96bfdc71.camel@linuxfoundation.org>
 <CANNYZj8+FTOO4cDsPzE_g4Hdfw7qtHvnYvK1WwFYdRRLKhJbWA@mail.gmail.com> <973f1bdb68a371c54826efc9ed6ebbeb6c0c98b0.camel@linuxfoundation.org>
In-Reply-To: <973f1bdb68a371c54826efc9ed6ebbeb6c0c98b0.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Oct 2023 16:36:25 +0200
Message-ID: <CANNYZj-HbxPewRCJ_44F4FhCcMQ-fmbP=o4=4fE-srQf+QQD_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] selftest/sstatetests: add a test for CDN
 sstate cache
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 14:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189730

On Thu, 26 Oct 2023 at 14:53, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6105/steps/25/logs/stdio
>
> AssertionError: False is not true : Missing objects in the cache:
> connman-gnome_0.7.bb:do_package_write_rpm
> font-util_1.4.1.bb:do_package_write_rpm
> gdk-pixbuf_2.42.10.bb:do_package_write_rpm
> librsvg_2.56.3.bb:do_package_write_rpm
> gstreamer1.0-plugins-bad_1.22.6.bb:do_package_write_rpm
> gst-examples_1.18.6.bb:do_package_write_rpm
>
> which is a little worrying :/

I've seen this in local testing some days back too, with the same set
of missing objects, but I had ascribed it to master not being
populated yet. Seems like it's not that simple, but I don't have a
clear plan forward right now.

Alex

