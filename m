Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6A02671AE6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 12:27:49 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id m203so5668943wma.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 04:27:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KIwsEgeveJW+mLO+8RDKLp/12JPSR+8XAjZ0eyqSHR4=;
	b=Qg042DuTedQ0V8NqkLKMY0jFbEAijPvVii58cQnDKd/wH27uzeP70//410ippw7vsb
	Vf3eKl4ezI8wZXETPAY9ptM1/QiImMI8GxsvG0aveRPENlFRv3fz04ZpF5CmIw/jiNrM
	O5p9QTJL6EnPG1/Z3+0DOJQMhTsyJKQUmPeecAba4VHKPbJuM/0G5tcMgOFhyvoDHefJ
	uWpJhiap3sAIDl1Ph0sicq6Fy3gcbN7nnGFJFHXP6awZv0EU9vkdGjmmZ5lLWGY891I9
	gTLNj0jseihEXvhuSc9OxeXf32I8Pp/ymPX4MyLZh9Tn3PCMTg5YqMpWRipXyWvPm/at
	VUEA==
X-Gm-Message-State: ABUngvefmskslxn+rSk+FS3ZNfwq8WjnlkG4T8NPXAMoFZEU73oI0SwlTNTJacOA8ZJJ0g==
X-Received: by 10.28.35.14 with SMTP id j14mr21659964wmj.24.1479472070122;
	Fri, 18 Nov 2016 04:27:50 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id b15sm3157239wma.5.2016.11.18.04.27.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 Nov 2016 04:27:49 -0800 (PST)
Message-ID: <1479472068.27546.12.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 Nov 2016 12:27:48 +0000
In-Reply-To: <alpine.LFD.2.20.1611180634400.3556@localhost.localdomain>
References: <alpine.LFD.2.20.1611180634400.3556@localhost.localdomain>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Subject: Re: small number of perl modules that can't be cross-compiled
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
X-List-Received-Date: Fri, 18 Nov 2016 12:27:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-11-18 at 06:41 -0500, Robert P. J. Day wrote:
>   after OE recipfying over 100 perl modules from CPAN, i'm down to
> less than a dozen that are going to take more work, and a small number
> of those seem to be simply badly written in that they don't support
> cross-compilation for my target choice of "qemuppc". example
> boilerplate recipe i put together produces this:
> 
> $ make libauthen-pam-perl
> ... snip ...
> Checking if your kit is complete...
> Looks good
> checking for gcc... powerpc-wrs-linux-gcc -m32 -mhard-float -mcpu=7400
> --
> sysroot=/home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/qemup
> pc
> checking for C compiler default output file name... a.out
> checking whether the C compiler works... configure: error: cannot run
> C compiled programs.
> If you meant to cross compile, use `--host'.
> See `config.log' for more details.

It'd be useful to see config.log, ...

> Error in configuring the Authen::PAM module.
> ... snip ...
> 
>   so i'm assuming the source itself for Authen::PAM:
> 
> https://metacpan.org/pod/Authen::PAM
> 
> is somehow flawed in that it doesn't properly recognize
> cross-compilation, would that be it?

... there is at least one issue in Authen-PAM-0.16/configure.ac, I would
say, in that it tries to detect RTLD_GLOBAL support based on the host's
perl. So it's likely there are more flaws.

A.


