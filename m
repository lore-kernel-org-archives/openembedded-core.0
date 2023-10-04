Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058B7E7B615
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 13:29:53 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.18374.1696426183500009367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 06:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZngD1dp4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3214cdb4b27so2104710f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 06:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696426182; x=1697030982; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=awjm8vZecprXdBLLgM8XEkg91sRbxBO3otGAWAzk9qQ=;
        b=ZngD1dp46elH7NAfeGVCzxJM1+9rr7ZvI0fGv24VyxSd/C1/zpyaJIEfMDOwaLfHVf
         JL8e1NBRESOGiG6O18OqVylrViASsap2e2bEMhgHJcKqsDRZc4FmzbQEnIz3TFj2wiAQ
         FF4IwFnKP5iYGLQiC4hYj8sVwLSDeaOFHc6N0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696426182; x=1697030982;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=awjm8vZecprXdBLLgM8XEkg91sRbxBO3otGAWAzk9qQ=;
        b=i99qiAFJuOU4XQ+EwAc2M3z492NCqVbqUYPCxQpIv3jKRAfcy7Sp0YXabRDoRI04dr
         OFHBfGHPUxcnxIqoT7c5cI34b4o+TxZWqjMxb1oV8msEzQYYHno4gyNxY98C2jfFEwwo
         r6ZkptQcbien+q/J8kk+aymFlV6KuC3N5hmFcJrXzrLIk1/B+VREl+PJAjPDt0WM4CWI
         wWMqQXaOX9F4FouSfy7Wb8LB60UCN38WfvrUzqio2WwETNcAzzMOn7mlt9uZu9Loksbb
         pG6WiAETCalGaN3WxBi1u0QGiwk7icK8Qq7hBNo8aGgs32NP5pd0UUoBd9nfJ1uEHnD/
         dRvQ==
X-Gm-Message-State: AOJu0YyM3zm7+sNWkoBlUdAQ4CzBRFhTW8QrbOHuOpNSsBcqxdUJZ0XK
	z/Vj+78mZqumbHzva3VxvOZu6g==
X-Google-Smtp-Source: AGHT+IG5qnln80sirge/lgOiTAP60qqes/akmbqVErQO4Pk3BWIil0tyS2SVFbcSlTFwj8g5E0hTFQ==
X-Received: by 2002:adf:edc3:0:b0:321:56af:5ef9 with SMTP id v3-20020adfedc3000000b0032156af5ef9mr1980511wro.70.1696426181825;
        Wed, 04 Oct 2023 06:29:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc7c:410f:894f:7a55? ([2001:8b0:aba:5f3c:cc7c:410f:894f:7a55])
        by smtp.gmail.com with ESMTPSA id s12-20020a5d424c000000b00327cd5e5ac1sm4086790wrr.1.2023.10.04.06.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 06:29:41 -0700 (PDT)
Message-ID: <61c00ad09a90ebc9886e2ddee069f0817b0069e9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/5] qemurunner: Show both the login console
 log and all logging upon failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 04 Oct 2023 14:29:40 +0100
In-Reply-To: <ZR1jk6AlAXCswWJw@nuoska>
References: <20231004123823.2990916-1-richard.purdie@linuxfoundation.org>
	 <20231004123823.2990916-5-richard.purdie@linuxfoundation.org>
	 <ZR1jk6AlAXCswWJw@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 13:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188686

On Wed, 2023-10-04 at 16:07 +0300, Mikko Rapeli wrote:
> Hi,
>=20
> Acked-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>=20
> for the full series. I hope our discussion over #yocto irc channel
> helped resolve these and the test failures seen with master-next.

Yes, thanks! It was useful to have someone to talk the issues through
with and much appreciated.

Sadly I don't think we've found all the issues yet.

On the build N-1 we have a selftest failure on debian12-ty-1:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5803/step=
s/14/logs/stdio

with these logs saved:

https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/d/qemurunn=
er_log.20231004022851
https://autobuilder.yocto.io/pub/failed-builds-data/6.5%20kernel/d/qemu_boo=
t_log.20231004022851

which suggest that ttyS1 never got any output but a getty did appear on
ttyS0. I confirmed there were only two serial devices in that
configuration. The exact image downloaded off that worker and run
locally worked so it isn't the image, it has to be some kind of race.
The image does have gettys configured for both serial ports. The kernel
boot log isn't present which a patch in this series attempts to fix.

There was also:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5528/step=
s/13/logs/stdio

which looks again like a getty didn't show up on a serial port. We
don't have more logs for that one but "Running postinst /etc/rpm-
postinsts/100-sysvinit-inittab" worries Ross and I a bit. It may or may
not be related.

That brings me to:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2199

which has two failures, I think both in commands run over the serial
interface. These ones appear to be more reproducible on ARM.

I'm trying a new build run with this series applied to see if that
helps shed any light on what is going on.

Cheers,

Richard













