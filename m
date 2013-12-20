Return-Path: <paul.betafive@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id E142C60D7E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 18:25:37 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id wm4so3105293obc.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 10:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=wtApYuQiVNxf9g9cC4w507BxGhCRFiyOG9GM4nUkiCc=;
	b=v4Spo1lGIbvUBGeC4CzbmullKBHDkfuQ8eUhid/A6nxD9CZO0IQ2JyQjlmwt77PH24
	aRecBHcSZ6jnP2a6BIVmvrdf0K7W/8km9zz7fjTipGGx6tNO5xuESA2Dwmy62QGCzgaT
	pBEKBsXmq6LND34r7CyCaiT/kZndgwVog/bKzSZTbuPOMgjXqfX9HjrPl3jobhaF9+Zf
	zV8Pksy/WUbqpGU1JjvhMQLKhsCgqSsMVgYJ/sbRlOdW9AUU83+gE/uIjqPYbMdfpAJA
	WGj7syjgIYoXAd2reGxajyOV1wVQ9VZDK2/cP27zE7IcuPsy9UTVL90BnxoTvl1usbXN
	Pc6w==
X-Received: by 10.60.37.33 with SMTP id v1mr7477577oej.2.1387563938719; Fri,
	20 Dec 2013 10:25:38 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.76.88.239 with HTTP; Fri, 20 Dec 2013 10:24:58 -0800 (PST)
In-Reply-To: <1387366203.6402.34.camel@ted>
References: <1387366203.6402.34.camel@ted>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 20 Dec 2013 18:24:58 +0000
X-Google-Sender-Auth: BgQfq4HHY5Y3Gp-3kUL-JKGuPkI
Message-ID: <CANyK_8eHa5N-W6t07mGuyyuLgHj0CdUw8n9ivA14+h5VpLR0rA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] externalsrc: Use deltask API
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Dec 2013 18:25:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 December 2013 11:30, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Now we have deltask API, stop poking around bitbake internal variables.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
> index c759289..53c71cb 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -26,21 +26,6 @@
>
>  SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
>
> -def remove_tasks(tasks, deltasks, d):
> -    for task in tasks:
> -        deps = d.getVarFlag(task, "deps")
> -        for preptask in deltasks:
> -            if preptask in deps:
> -                deps.remove(preptask)
> -        d.setVarFlag(task, "deps", deps)
> -    # Poking around bitbake internal variables is evil but there appears to be no better way :(
> -    tasklist = d.getVar('__BBTASKS') or []
> -    for task in deltasks:
> -        d.delVarFlag(task, "task")
> -        if task in tasklist:
> -            tasklist.remove(task)
> -    d.setVar('__BBTASKS', tasklist)
> -
>  python () {
>      externalsrc = d.getVar('EXTERNALSRC', True)
>      if externalsrc:
> @@ -53,16 +38,16 @@ python () {
>          d.setVar('SRC_URI', '')
>
>          tasks = filter(lambda k: d.getVarFlag(k, "task"), d.keys())
> -        covered = d.getVar("SRCTREECOVEREDTASKS", True).split()
>
>          for task in tasks:
>              if task.endswith("_setscene"):
>                  # sstate is never going to work for external source trees, disable it
> -                covered.append(task)
> +                bb.build.deltask(task, d)
>              else:
>                  # Since configure will likely touch ${S}, ensure only we lock so one task has access at a time
>                  d.appendVarFlag(task, "lockfiles", "${S}/singletask.lock")
>
> -        remove_tasks(tasks, covered, d)
> +        for task in covered:
> +            bb.build.deltask(task, d)
>  }
>

I've just updated oe-core whilst trying to test my in-development
version of opkg using externalsrc and I'm getting:

 *** 0022:        for task in covered:
     0023:            bb.build.deltask(task, d)
     0024:
Exception: NameError: global name 'covered' is not defined

I don't really know the code in question well so I don't know whether
the solution is to remove that last for loop or to add back in the
declaration of 'covered'.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

