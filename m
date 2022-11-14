Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D576C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 10:59:39 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.4288.1668423574067856003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 02:59:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YP6xOkgX;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id b9so12651406ljr.5
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 02:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yiFq6ZtDuW4i83PZRuDbPuyZarX1SkyFbkmKUcUVGlY=;
        b=YP6xOkgX8rrSECJvRDY+h2VoTDsINj66Nwfws8nRaaoWClSeLZrvtfzxDJ03Y2yQEz
         jAaMjd9dz19kZUoFJkT1ExwsEerFTmcnSm59VJptSYNthmLuqnMDWijMQBMPrcTwkL5H
         HM+zSqoevs6vH+saEKRYsuf2oETQD+FeYkY820LUrBMN8b/Vt7oDl5UUaPx+BQr1BmT8
         7l4dPefzqieNpgtaQkJvSXp6nZCdcnA6+HZSsdsTv70c+M8VXa2EkRppk9ze3EBoqUpQ
         yxWF+7vlqGpcr0zZ/1XWEDyBU12N53hwB4pPB8i4N18OBL07tgdoULM+H8ykoTwv2X8y
         WzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiFq6ZtDuW4i83PZRuDbPuyZarX1SkyFbkmKUcUVGlY=;
        b=6OwCdXif0mCUCfLofX3hzFPLRh+Tkp8tayvscxXVQnuG3gBgJMsGN/4ldrwVBvy93C
         +C8WkXwIy8IVPQJKxk8XYFYwMqBS3iw6VdGafk3nU57TTtcQaf/99S+CLkYM/a64yFpn
         pwyLc9d5uy4XNoYZ0LN4TYMyji22Ff7gxc930SLjCFezUlaMOJDO/VFm5wCwikzh8tQe
         TO9cvnwzDHZrl6AN/HcZ7zk30n3vuDEFyFZNRNIG4kpsrlGQMF6tdH41RIhHyvdQqBAd
         8K2bT1DWLWiN/GJDD2iXP+K9Eu44YRgwUNqMK8dsLk/Aa0XM5VdY+1uQOXAH45Fqp4q9
         m2yA==
X-Gm-Message-State: ANoB5pmxYlainTN1+EnML+cN1FSvr0l0EHdYflHFHZwiQj9SHqDRuB4L
	aK6BjQFdYo/6GlA2+SX2AvWmwA==
X-Google-Smtp-Source: AA0mqf5mRS4DPpZ6ZgGWIWzuvoAcAz7HchgehfPdxH9+pYWJDqLlYW/cscsbQSG1KV1p+uPqsHWWqA==
X-Received: by 2002:a2e:97d7:0:b0:277:2600:9cc3 with SMTP id m23-20020a2e97d7000000b0027726009cc3mr3770553ljj.229.1668423571933;
        Mon, 14 Nov 2022 02:59:31 -0800 (PST)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id bu42-20020a05651216aa00b004aac3944314sm1775699lfb.249.2022.11.14.02.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 02:59:31 -0800 (PST)
Date: Mon, 14 Nov 2022 12:59:29 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] qemurunner.py: support setting slirp host ip
 address
Message-ID: <Y3IfkUB9tw2Vni+x@nuoska>
References: <20221114101907.626251-1-mikko.rapeli@linaro.org>
 <89da82a5-06f3-312f-cbe0-733974fbe908@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89da82a5-06f3-312f-cbe0-733974fbe908@theobroma-systems.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 10:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173236

Hi,

On Mon, Nov 14, 2022 at 11:31:11AM +0100, Quentin Schulz wrote:
> Hi Mikko,
> 
> On 11/14/22 11:19, Mikko Rapeli wrote:
> > By default host side IP address is not set and qemu listens
> > on all IP addresses on the host machine which is not a good
> > idea when images have root login enabled without password.
> > It make sense to listen only on localhost IP address 127.0.0.1 using
> > config:
> > 
> > QB_SLIRP_OPT = "-netdev user,id=net0,hostfwd=tcp:127.0.0.1:2222-:22"
> > 
> > Support detecting port number from this too.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >   meta/lib/oeqa/utils/qemurunner.py | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> > index e602399232..f175f8a1de 100644
> > --- a/meta/lib/oeqa/utils/qemurunner.py
> > +++ b/meta/lib/oeqa/utils/qemurunner.py
> > @@ -401,7 +401,8 @@ class QemuRunner:
> >                   cmdline = re_control_char.sub(' ', cmdline)
> >               try:
> >                   if self.use_slirp:
> > -                    tcp_ports = cmdline.split("hostfwd=tcp::")[1]
> > +                    tcp_ports = cmdline.split("hostfwd=tcp:")[1]
> > +                    tcp_ports = tcp_ports.split(":")[1]
> >                       host_port = tcp_ports[:tcp_ports.find('-')]
> >                       self.ip = "localhost:%s" % host_port
> 
> But localhost is enforced here?

Is it really? Where?

With default "-netdev user,id=net0,hostfwd=tcp::2222-:22" I am able
to login using all local IP addresses:

$ nc 192.168.1.103 2222
SSH-2.0-OpenSSH_8.9
^C

$ nc -v -v -v 127.0.0.1 2222
Connection to 127.0.0.1 2222 port [tcp/*] succeeded!
SSH-2.0-OpenSSH_8.9
^C

The open port 2222 show on the build machine with:

$ lsof -i|grep qemu | grep 2222
qemu-syst  170445 builder   12u  IPv4 45057952      0t0  TCP *:2222 (LISTEN)

By using "hostfwd=tcp:127.0.0.1:2222-:22" this reduces to the more safe:

$ lsof -i|grep qemu
qemu-syst  127592 builder   12u  IPv4 44993375      0t0  TCP localhost:2222 (LISTEN)

I don't dare to make that the new default so just enabling
runqemu to work when user configures the host IP address like this.

> This patch basically allows to pass
> hostfwd=tcp:127.0.0.1:2222-:22
> instead of
> hostfwd=tcp::2222-:22
> but with the exact same result (which is, localhost:2222 will be used?)

Nope, now the other non-local IP addresses are not open for the port
2222 on the machine running qemu. The localhost:2222 works in both
cases.

> Also, this could be migrated to using re instead of doing manual lookups.

Yes, but re is more resource consuming.

> I'm not sure the commit log matches what the commit is actually doing?

How could I improve that? If I manually start the qemu machine with
hostfwd=tcp:127.0.0.1:2222-:22 the machine works but with runqemu it
fails due to a confusing error about detecting IP address. I could add that
if it helps. With this patch runqemu doesn't care how the IP address
is configured when looking for the port number, and also doesn't fail
when it's set.

Cheers,

-Mikko

