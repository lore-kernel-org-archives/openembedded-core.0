Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.24568.1591304429344738668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 14:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DUxEHSQW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id d128so7061836wmc.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 14:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=LrwTU6iIT42SWXZmmT5O8WmSPL5e069RQFv4dGulzvU=;
        b=DUxEHSQWchlVXxoqQotM03WsjB3DVR9WknHbKKFqQ3lp/58h3rIdRKabMFHPyRQGuZ
         aeYH7rOUmm871189QLHwMwRX6LCL9hzbfxVnrUFXBRKZxonxqU8PdpH7CpGMrzIATfdy
         CIr+PClswlO58nMcBPVwVrqZnGtapdPS88nwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LrwTU6iIT42SWXZmmT5O8WmSPL5e069RQFv4dGulzvU=;
        b=rupCktqTD7JJGOKaruIJfpPE+RDp1pNavCLhAogPGHHZywSqmvGXWZD2OcipRZTsWU
         GNkzDlaHQpm3Axjvn09rpVx5kqbqNF2lsH29TZra3I6phSMBd0MRL6seRP1L4FtHwmB9
         GySMXUSn/J1bu/sdzyvC72y3tgQ5CNFmvIIOpeiA6bhXd4x4e2uS7lVxVSzyfPrKH5nn
         QuBVRvID3WhI8rgrYz6/+iJgYq9JjpjTosk2UoF8pX4ak/auYbtefCS4JGWgNMFa+RTu
         GWMG9oYkg3cP2mGZBT8FZAolNfrQpgQCq7wrslVxytWyhhcb9PRm9qi5CA4h89MC1WqG
         itrg==
X-Gm-Message-State: AOAM533AOuPUZd+1TyWcayvBA+rD4TInUtltkjRADO7orlXtdRGTuVJK
	Pdm3JLdjnWwOJy7q2fiYzAeuwQ==
X-Google-Smtp-Source: ABdhPJyiCnOo92HtJa73hO6tyJSX/UZ3uXYoBUJKZb0zlTpZVKqG23TRLNxwCnhdpyT1Se/jsnuxCQ==
X-Received: by 2002:a7b:c761:: with SMTP id x1mr6020716wmk.90.1591304427765;
        Thu, 04 Jun 2020 14:00:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id h15sm9018735wrt.73.2020.06.04.14.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 14:00:26 -0700 (PDT)
Message-ID: <7b90285ec759589cc2edc3994ef39ef508b8927d.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3 4/8] bitbake: lib: Add PrefixLoggerAdapter helper
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: bitbake-devel <bitbake-devel@lists.openembedded.org>
Date: Thu, 04 Jun 2020 22:00:24 +0100
In-Reply-To: <20200603025405.26885-5-JPEWhacker@gmail.com>
References: <20200601202807.26357-1-JPEWhacker@gmail.com>
	 <20200603025405.26885-1-JPEWhacker@gmail.com>
	 <20200603025405.26885-5-JPEWhacker@gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-02 at 21:54 -0500, Joshua Watt wrote:
> Adds a helper logger adapter to add a prefix to all log messages.
> This
> is useful to distinguish log messages between multiple instances of a
> object.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  bitbake/lib/bb/__init__.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/bitbake/lib/bb/__init__.py b/bitbake/lib/bb/__init__.py
> index 2e2966c3b9..1de32041ed 100644
> --- a/bitbake/lib/bb/__init__.py
> +++ b/bitbake/lib/bb/__init__.py
> @@ -84,6 +84,14 @@ logger.setLevel(logging.DEBUG - 2)
>  
>  mainlogger = logging.getLogger("BitBake.Main")
>  
> +class PrefixLoggerAdapter(logging.LoggerAdapter):
> +    def __init__(self, prefix, logger):
> +        super().__init__(logger, {})
> +        self.__msg_prefix = prefix
> +
> +    def process(self, msg, kwargs):
> +        return "%s%s" %(self.__msg_prefix, msg), kwargs
> +

Ignoring the mailing list issue, I think there is something odd going
on with different python versions somewhere in here.

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/1004
https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/585
https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/2255
(all debian9)

and then selftest issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1020

Cheers,

Richard

