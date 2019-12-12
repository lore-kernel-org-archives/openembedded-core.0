Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5A0757F9A5
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:17:38 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t2so3824170wrr.1
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=qlqE3Ax7IwDtjHFgxeSsAJqogLda+yc5bORgA7RgHWk=;
	b=f0nSgFr7U75S1lermn4NjHpI6LHZWOXZWAt1eiEO7srcydY7t2Iofhmh7+xd3HxyJ9
	TyPOutfFrR+iK09Y9x6Fg8o79F8BJ2LdQDbOBHP2dYbC5w5uaAiUVd/y+14d0O1ZIlDI
	PP5vFnxm30khTQGWLYl4YnhGr95t0kMZ+ByqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=qlqE3Ax7IwDtjHFgxeSsAJqogLda+yc5bORgA7RgHWk=;
	b=Mtq5glsqnZgfclrMpQVNBxPNcwsZ4Qqh7xG66SGRK0prss9L3eo9qo6mIGzefDfayP
	/+FQz0o9DuhTOmIbElsRCMNeSM+99bC6lreuz8ay2HsPA3s/p5MMATEV9c+31u2qPQYG
	O/rHxLvjiF8AcDCyBSxFaWtM+DppTAc24cx+rW106KDC9qXhyemkNseyiiV/yJshgrwF
	kR52I0FOxOkxtF5LPZP9KQjdVYxVWbo53qxx/Y8xo3bZqHCskuNLqIuEC/O3LfNq9jE+
	Q+7emhdOh3XSqN6ez7C5DS21iU8ZW8NK0RadTZvATLHjmhXGMSQ0kEjCIep1VAOhu13A
	RdOg==
X-Gm-Message-State: APjAAAXSI1WMAfiTgFW1fLQFy6maeRWqe6kwD4vvVOWNLLI+oSV/kZN4
	GxaTkzzaoFxgxCI/cGbQhJDZxg==
X-Google-Smtp-Source: APXvYqzPpq+LwqWRqvkLIhA+dxKbDp43YqZjB+3TZkhCsyNBEXH53NNEYXpZFT9xeSVGH4ovHB745Q==
X-Received: by 2002:a5d:6089:: with SMTP id w9mr7799736wrt.228.1576174659075; 
	Thu, 12 Dec 2019 10:17:39 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s3sm6782022wmh.25.2019.12.12.10.17.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:17:38 -0800 (PST)
Message-ID: <3c5243c3abf579069c651312902ca48a087e9842.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>, "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Date: Thu, 12 Dec 2019 18:17:37 +0000
In-Reply-To: <20191212160557.GA9981@mcrowe.com>
References: <20191212160557.GA9981@mcrowe.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: Use of multilib.conf taints hashes of -native recipes
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
X-List-Received-Date: Thu, 12 Dec 2019 18:17:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-12-12 at 16:05 +0000, Mike Crowe via Openembedded-core
wrote:
> We compile for a variety of machines, some of which require
> multilib.conf
> and some that do not. I was surprised to discover when switching
> between
> machines that the do_populate_sysroot_setscene tasks run for many
> -native
> recipe. :(
> 
> It looks like this is because RECIPE_SYSROOT changes:
> 
>  Variable RECIPE_SYSROOT value changed from '${WORKDIR}/recipe-
> sysroot' to '${WORKDIR}/${MLPREFIX}recipe-sysroot'
> 
> This problem goes away if I add the following line to native.bbclass:
> 
>  RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
> 
> but this feels like I'm solving the problem in the wrong place. Would
> it be
> better to modify multilib.conf to say something like:
> 
>  RECIPE_SYSROOT_class-target = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
> 
> instead? (Although I'm rather worried that this will stop it actually
> working.)

I'm a little bit surprised we don't have tests which detect this. 

"oe-selftest -r ssstatetests"

should have something which detected this, at least from memory. Could
you take a look and see if we're missing some testcase?

You're right that we probably should do something fix this and I think
you are probably right about changing multiconfig.conf as above FWIW.

Cheers,

Richard


