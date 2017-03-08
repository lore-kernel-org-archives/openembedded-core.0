Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id C0C2A71A71
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 21:46:42 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id w189so19800619pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 13:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HCeD8vICYAgWR1W5MZAeZZLf7rCmKnnxE4HoDCh30+U=;
	b=Md2O7twVfQio7NLDpLkWW9PUHsNxze646lq5f3AdU+xGwCXk375lTunfdfwdOU88QJ
	rMoJI0dR2+hd3qM3twbEJ7Hp84qmnBU6SND8vHNULXj8Qc240aBwOLpIlOINzNLbkwxj
	W6LhLa6rVhKQI+YZIjC3ursSiHaFtBpMKm42uRJJiPhgF/8RnnqECoAYNtHq0IBIp/dD
	3Sr77ZnDpsSJ3irB11jCi+vScBSuWZnQSGP8lOp5l1PlcqiSVmq8r0sdqIz5nWNEb728
	gWuGWJEZnFydLWbsaPrMW+quPJo5NyNPeODEqrO8af2LCUracpjuDI4mIEwBQzST0NQ8
	3dpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HCeD8vICYAgWR1W5MZAeZZLf7rCmKnnxE4HoDCh30+U=;
	b=NiR1A8RAOLUdA15VOzm1kFSofKayYqjmW1WdAubibyCrvm5b0e2oMCe8kMcUnDGCID
	03h66WOzazPPrfWrIscnEgmh+D+8PAq8wNFrQXUfRnpW5uY3AYcRWEHYIA9YsfOuns2G
	fAIZ99hA/5IV/YLJ6GLbFwfpx8ExVZnoNf/+XuJ7qI0quo+CYJJ1i0vOtWvW1nMzgyQ/
	pwATg8mlsAaoQO255svUn7hkoAme6krnrr79r+IYq6glPDR4MuFgYIBDmZ8qyIkHuaM3
	XcSz/qwzv6K1ZSWeZPRGt7c3z7UOCp9DfRAA20Y7xLmOe3+Ol65SeUqbfMXFZbDkn8rS
	xV/A==
X-Gm-Message-State: AMke39nS+W8L8MT6BgKmJfEHA4ipQLaTAEugCVPwNgn9f76JzCmqsEpjgVqIsrM7HKVKUw==
X-Received: by 10.99.45.2 with SMTP id t2mr9692606pgt.209.1489009603695;
	Wed, 08 Mar 2017 13:46:43 -0800 (PST)
Received: from haswell (c-76-102-32-192.hsd1.ca.comcast.net. [76.102.32.192])
	by smtp.gmail.com with ESMTPSA id
	y67sm7942548pfa.96.2017.03.08.13.46.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Mar 2017 13:46:43 -0800 (PST)
Date: Wed, 8 Mar 2017 13:46:37 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Message-ID: <20170308214636.GA17756@haswell>
References: <8f9c4dbb-10b7-25b9-1f38-704645a2eab2@xevo.com>
MIME-Version: 1.0
In-Reply-To: <8f9c4dbb-10b7-25b9-1f38-704645a2eab2@xevo.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Default rpaths in BUILD_LDFLAGS
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
X-List-Received-Date: Wed, 08 Mar 2017 21:46:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 17-03-07 16:43:47, Martin Kelly wrote:
> Hi,
> 
> While debugging an issue with a package that uses llvm-config to compile
> with clang, I started hitting [rpaths] QA warnings because some output
> executables contained absolute rpaths pointing into my build directory.
> After tracing through the issue, I determined the rpaths to eventually be
> originating from the setting of BUILD_LDFLAGS in meta/conf/bitbake.conf. The
> rpath part of this was added in commit 35759f97 to the poky repo.

thats for native packages alone.

> 
> A quick grep through the poky repo reveals that many projects have turned
> off rpath in their builds (the mechanism through which is
> build-system-dependent and doesn't always work right). Obviously, I can do
> the same for clang/llvm-config, but it doesn't seem like the ideal solution
> if many projects are having to do the same.
> 
> I'm wondering if those with more background on this issue could provide more
> detail regarding why rpaths are set at the top level and why they are
> necessary. In addition, I'm wondering if there might be a cleaner way to
> remove the rpaths for those projects that need to do so without each project
> manually writing sed and similar invocations to do it.
> 
> Thanks,
> Martin
> 
> In case you're curious about the background of the issue, my project is
> using the output of llvm-config --ldflags to set its linker flags.
> llvm-config is populating the output --ldflags with whatever it is given for
> CXX_LINK_FLAGS. CXX_LINK_FLAGS is being populated by the generic cmake logic
> in cmake.bbclass, which is getting its flags from BUILD_LDFLAGS in
> meta/conf/bitbake.conf.

I think we shoud not need rpaths for target recipes. We should see if we
can just remove it atleast for /lib /usr/lib

