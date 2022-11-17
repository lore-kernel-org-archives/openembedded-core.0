Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035F4C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 14:20:24 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.16738.1668694819671530407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 06:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gcL+K9kI;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id g7so3033544lfv.5
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 06:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9IFNZsQGmKB5rj1RfrSVV5eSgoAnEiNvb7Vs57epjEA=;
        b=gcL+K9kI8yl0EuTtu4Ok/fpulUmDy3E+bCbWaVmnB+VoeTW5C5XRsK/isK+RgzsBoz
         6FH6ZIPQ437DepAe6I6R4plYrAyjwmuDjz7yRWwB1Z4A9BAQ90JbYQRSSLfkZ1vvSRoc
         UjoIrE6PXtgPTpLkd6zux17PgXES1AvWwfTpaDp2podBjsK7GxFPrG2tBM7Z+P+WaNx0
         thcJK9+H58SxflTFjENRbgLPRwFdkOjnfNkaBN6uUAn3DPyFA8Rfk6U52CinWuYKXub4
         H9K9W5DYzdEbtQvzXjc8qN8pfDPIi6InsPbP9GN24AXvRIU3oWi4HFmltIaVHsuLF6d+
         SZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IFNZsQGmKB5rj1RfrSVV5eSgoAnEiNvb7Vs57epjEA=;
        b=bM+2nMMoibIthRKvQNzFNRAZk3PbpjGRzLu4weMnJj7aPh2z0YIxGwdDolMSeipxHo
         GIozInBUbXZq/+oGj+ohiUzeWTIZNx3ikQSSkYKG6J2h0JaXRKPk8nnMptf7xb4eWE/x
         vBD6jHghxKZWGSe9ibQjJYAeQ8wWv6FIzmQG7cg+kPzuL3iJ9f37PYC8nroQ3l8AXWs7
         HjGeOaxiEKmmxk8PHQIN9YcAQdqEZW+qHABBiyYr+nlSCFArou0IZOuHh9e9xyj+bPz/
         49fzVq1+ToUqFLtg6zoh6IaraysWqeAnMjgxoYOqDHuwPqaUIj0CbY2DaZBYtZFokEB5
         SgbA==
X-Gm-Message-State: ANoB5pnoaJ+fCYLlS0FEBcESi0PaW2yq8OHahqJBPFBHdAncFunysZRp
	YghMFaJvlycak6t0MM1VPnw6/w==
X-Google-Smtp-Source: AA0mqf7X8jG15H4L39+zOkwzQyC0c2QcV55WrpbZgZK3YaR3VOErVCutuH6zSXoThEsAx/jLqaT7vw==
X-Received: by 2002:a19:8c1e:0:b0:4a2:48d6:2181 with SMTP id o30-20020a198c1e000000b004a248d62181mr1051581lfd.591.1668694817679;
        Thu, 17 Nov 2022 06:20:17 -0800 (PST)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id u7-20020ac25bc7000000b004b4b600c093sm170570lfn.92.2022.11.17.06.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 06:20:17 -0800 (PST)
Date: Thu, 17 Nov 2022 16:20:15 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] runqemu: limit slirp host port forwarding
 to localhost 127.0.0.1
Message-ID: <Y3ZDH6S/Ee6lxNEs@nuoska>
References: <20221114155038.3654499-1-mikko.rapeli@linaro.org>
 <20221114155038.3654499-2-mikko.rapeli@linaro.org>
 <3dd2aa3d-6510-90e4-d8a8-a5ec12e9c16c@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dd2aa3d-6510-90e4-d8a8-a5ec12e9c16c@theobroma-systems.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 14:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173424

Hi,

On Thu, Nov 17, 2022 at 02:17:13PM +0100, Quentin Schulz wrote:
> Hi Mikko,
> 
> On 11/14/22 16:50, Mikko Rapeli wrote:
> > With default slirp port forwarding config qemu listens on TCP ports
> > 2222 and 2323 on all IP addresses available on the build host. Most
> > use cases with runqemu only need it for localhost and it is not
> > safe to run qemu images with root login without password enabled
> > and listening on all available, possibly Internet reachable network
> > interfaces. Limit qemu port forwarding to localhost 127.0.0.1 IP
> > address. Now qemu machine SSH and telnet ports are only
> > reachable from the build host machine, not full Internet.
> > 
> > If qemu machine needs to be reachable from network, then it can
> > be enabled via local.conf or machine config variable QB_SLIRP_OPT:
> > 
> > QB_SLIRP_OPT = "-netdev user,id=net0,hostfwd=tcp::2222-:22"
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >   scripts/runqemu | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/runqemu b/scripts/runqemu
> > index a6ea578564..7bd9465593 100755
> > --- a/scripts/runqemu
> > +++ b/scripts/runqemu
> > @@ -1071,7 +1071,7 @@ class BaseConfig(object):
> >           logger.info("Network configuration:%s", netconf)
> >           self.kernel_cmdline_script += netconf
> >           # Port mapping
> > -        hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
> > +        hostfwd = ",hostfwd=tcp:127.0.0.1:2222-:22,hostfwd=tcp:127.0.0.1:2323-:23"
> 
> With the additional knowledge we gathered in the last patches, I believe it
> would be a good thing to say a few words/update the documentation.
> 
> See https://lore.kernel.org/yocto-docs/fedb4cc0-44d6-d7d8-bc26-c8de5bee06ca@theobroma-systems.com/T/#t
> for a patch I believe might make it to master soon? I think we should say
> what the default value entails (even if this patch isnt' taken) and maybe
> point/refer to the QEMU documentation for the meaning of options in
> QB_SLIRP_OPT. I believe some/all of options listed
> https://www.qemu.org/docs/master/system/invocation.html are possible?
> 
> What do you think?

Yes, I agree, and saw that change too. I'll try to document this once
change gets integrated.

Cheers,

-Mikko

> Cheers,
> Quentin

