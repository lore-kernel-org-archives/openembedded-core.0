Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 789BC7EFB8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 21:27:55 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y135so5907340wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 14:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=maOH19nGDS7hP71dffMvE+cFTZrkSQhdVfBj70Rzlao=;
	b=NmwI7E1KNvQyM/k6+KWYFklPIhTVFkz7aZIYXY2oXeEdItvEgsRLLPEvNVt/vZx/fj
	OZzSsI4vBvHAqJcD6ZHX/JXy7BN7SWjtUefzbzBGlv3b0ytifvMYsMB8vGIgJqJ2LO37
	JHMmt915j41JuBDah0a6WXKMjwCXvQu2rNarE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=maOH19nGDS7hP71dffMvE+cFTZrkSQhdVfBj70Rzlao=;
	b=rGxOJf5Lc57HAcXx6U9mIT0VHkgNnMWNA/JC3oXBjU2VWSQ6STXsyCD6Ir7rqRrG30
	sFbi8wYlZZVIUnS81EbjO1UyCogRMih/6MulMlbEtSVu42F9B04ecT44x0n1hj+plBSy
	l6nar/p6wPgCO2Ju1c1akaAkIKPZvl1cS8nX/DADTR5yAJ1gFUuX/u4+e2ILSXA71erO
	5oPDGluRzz6j1LLUmluEYIooD/0W72uvdKciFAo20MnhU6a13cj0/gj1koMCG4MDyLZ+
	HS6b9VTJTltSZpvlcE5/RZwEbPSDIVvSNxJkDFVZaPXt4boxAe5e/VLMCp8DhMNk1AET
	WpwQ==
X-Gm-Message-State: APjAAAWW9YDqnUDjuCnXsJiMj7iygtfsD7ufD28cHObxyGuoa7DOoiWN
	+TmK9eSBR33zRiIFBhQFwj6avQ==
X-Google-Smtp-Source: APXvYqwzfrrD/CgGrS27IBtqx0v+iRwPtW+x+Z/93sxXbby+70Ji4Yg32UeOI/ay8oSdpd6fvqTH+A==
X-Received: by 2002:a7b:c3c6:: with SMTP id t6mr4544015wmj.5.1567718875810;
	Thu, 05 Sep 2019 14:27:55 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id v2sm6305451wmf.18.2019.09.05.14.27.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 14:27:55 -0700 (PDT)
Message-ID: <ed991280f92d2eaf14dadb912d86cd88601b2284.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Mark Asselstine <mark.asselstine@windriver.com>, 
	openembedded-core@lists.openembedded.org, Michael Halstead
	<mhalstead@linuxfoundation.org>
Date: Thu, 05 Sep 2019 22:27:53 +0100
In-Reply-To: <25701351.g1SN1yf5Qq@yow-masselst-lx1>
References: <20190822155616.35046-1-mark.asselstine@windriver.com>
	<25701351.g1SN1yf5Qq@yow-masselst-lx1>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH][V2] sdkext: use simpler kernel module for devtool test
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
X-List-Received-Date: Thu, 05 Sep 2019 21:27:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-09-05 at 13:54 -0400, Mark Asselstine wrote:
> On Thursday, August 22, 2019 11:56:16 A.M. EDT Mark Asselstine wrote:
> > The current devtool test for the building of an out-of-tree kernel
> > module uses something which requires several "high order" kconfigs
> > to
> > be set. This results in the test failing, not for expected reasons,
> > but rather because it depends on specific kernel configuration.
> > 
> > You will get error messages such as
> > 
> >   ERROR: "video_ioctl2"
> >  
> > [.../1.0-r5/testsdkext/workspace/sources/v4l2loopback-
> > driver/v4l2loopback.k
> > o] undefined!
> >   ERROR: "video_unregister_device"
> >  
> > [.../1.0-r5/testsdkext/workspace/sources/v4l2loopback-
> > driver/v4l2loopback.k
> > o] undefined!
> > 
> > Using a simpler hello-world kernel module example will only require
> > that CONFIG_MODULE is enabled, thus avoiding a false positive.
> > 
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> > 
> > **V2**
> >  - also updated the CROPS manual test json file
> >    (I have no idea how to run this so untested but this is a
> > straight
> >     substition)
> >  - continue to use github until we can move the sample to somewhere
> >    like git.yoctoproject.org
> 
> Richard, are you thinking we need to figure out the
> git.yoctoproject.org repo 
> before we can move ahead with merging this?

I would like to fix that, yes. I could ask Michael for help but I do
have access to sort it myself too.

I'm also trying to sort out a few other issues before -next can merge.

Since I'm failing to get to it,

Michael,

Could you clone:

https://github.com/masselstine/kernel-module-hello-world.git 

onto git.yp.org as a new repo and give write access to it for Mark,
myself, Bruce and Ross please?

Cheers,

Richard



