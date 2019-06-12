Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 591BB7E6E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 00:05:27 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id e16so14914769wrn.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 17:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=H9XjQPwiyPXtCP9X0W78VJ42bRh5TASMt97beQhgax0=;
	b=BiTlUF7Qje6wLETxIVnuYeKVW4syxHiTqu4pxdtej/H7mRmkHfVTLI1rt6KPPqbEJ7
	uWX2Dc0zE/dBj3tTtQb/cRbU4Mu0jBIdBO1OBwfar9jsjTiGoFwRswcCeP5R+E5t2LF6
	jw3WKLjcgfoJ8GFa6KxBjqJtiLuy6Iz4x1anw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=H9XjQPwiyPXtCP9X0W78VJ42bRh5TASMt97beQhgax0=;
	b=d/Vkn8KDtB1Bc8sCx8NFhpNsKN8svwGkbcqmVcloLJsWh37wAS/OO9GPm61mLI4r6b
	K/WpGhVb2QjwwcceWwspgU/4xPwum2ZAVOAfllaFRxA7XsmR/rRMr+7YwKpnxhlttG/X
	cdykEE67Ya1Cbm63MhFTL/Lk2QeDx/xLh03muMjawhHBNmnEhYvn2/GZHW2PfMe9dnJA
	TvTVWgsLi+Yfp1a9FDgWFO4Vw+sbdoZJD1vXtKWePX9S7AJ+GC6EEXktxCFHJFxibLlR
	g2L05t8/UcJJF5ieRdQlVvGV3eSvujp97ytAdqfh/q0Gi1PHF+WkxSoMk9sYvi0VMv0L
	n5Lw==
X-Gm-Message-State: APjAAAWyYy8E0dByWSpqxnKKO0pqLY24ktbTT+rfHVQuh2fdPQzW6gt9
	x4svT6ex8vjW5Ck5xwakw8KBLlhoO34=
X-Google-Smtp-Source: APXvYqyepk40vsduEVCcOqn2u49Xc4MIRW4xBkRXOTIR2wnE7msgvamjrFJS1FBk+tyICIeHpM+cnw==
X-Received: by 2002:adf:ff86:: with SMTP id j6mr19572268wrr.318.1560297928140; 
	Tue, 11 Jun 2019 17:05:28 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id t63sm6328247wmt.6.2019.06.11.17.05.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 11 Jun 2019 17:05:27 -0700 (PDT)
Message-ID: <f89948476688118012710c34f880bac3d5114faf.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Randy MacLeod <randy.macleod@windriver.com>, Sakib Sajal
	<sakib.sajal@windriver.com>
Date: Wed, 12 Jun 2019 01:05:25 +0100
In-Reply-To: <1607ff2c-d02a-a867-f761-bd3ecd2d1af3@windriver.com>
References: <1607ff2c-d02a-a867-f761-bd3ecd2d1af3@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bash ptests: use runuser? also remaining errors.
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
X-List-Received-Date: Wed, 12 Jun 2019 00:05:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-06-11 at 15:00 -0400, Randy MacLeod wrote:
> Richard, et. al.
> 
> I have two patches (ptest-runner, bash) that enable all but two [*]
> of the bash-ptests to pass. A potential problem is that when started
> by
> ptest-runner, 'su' (both busybox and util-linux versions), results in
> a few of bash's tests failing whereas they work if started by
> 'runuser'.
> The test failure is due to a warning:
>      bash: cannot set terminal process group (16036): \
>            Inappropriate ioctl for device
> that contaminates the test logs and makes a diff with the expected
> results fail. I can easily redirect that warning to /dev/null but
> that seems wrong and would be a patch that we'd have to carry in
> oe-core.
> 
> To get 'runuser' from util-linux into an image, it seems that you
> need:
>   - the RDEPENDS for ptest,
>   - REQUIRED_DISTRO_FEATURES = "pam" in bash.inc, and
>   - to set the 'pam' DISTRO_FEATURE in your local.conf.

The requirement for pam is a problem as we can't require that for
ptests.

> Is that something you are willing to do for all ptests or perhaps
> just for bash's ptests?  If so, I'll clean-up my ptest-runner patch
> and send this to the list.
> 
> 
> I also considered using util-linux's 'setpriv' but enabling that
> has turned into a mess of dependency loops and other build problems.
> man runuser:
>     If the PAM session is not required then recommended solution
>     is to use setpriv(1) command.

What kind of dependency loops? Can we just enable it for target builds,
would that help?

> Other solutions to properly starting user tests from root are
> welcome!

Not sure but I think we're going to need to find some. Enabling setpriv
sounds like the easiest first option but it depends on the errors.

Cheers,

Richard


