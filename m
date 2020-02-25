Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 45D6060154
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:16:22 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t3so14222011wru.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 03:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=E6VyDMcHUZrKvuTC8qzLjEMXtBy9pzhR2McnU46zW1M=;
	b=ZtPFFq+bxBOYZcf9mPxLD3yRKCGh72xZgCAztB3s99pyQcIOWZQtRSoMTjb6mOXt5x
	WuzKo6PCP8vvGltvIv51ydy22qZyvqhCLvx9DaghYQWwwOE1vW+VZMPZG5oj1nC/sKEe
	LnYKWCx7GF5IAeg/c523rR9eRLK3i2WIQFuTUtp9KoGb30Rk9YuYad9ay9W8LMQ4xau4
	DmCFdnVEhVKoAFOA8k+iPJUHoqb41C/p7ZTksb/LW96ZjrVxL7yV1+aIt8IM2ia0QU5p
	K+sC9VyxNBVEPmJT6llKLO+1XN9t09rbm8fWAW5a/LyEVRJGi5mrcysjoAETcLQ9BIfu
	6/bw==
X-Gm-Message-State: APjAAAUkOeR5x6QF1znbN3CTg2NUzJn6uGmCLWUgdP1phiq4eJF0vC29
	RVq+4h/HIQZM209MyCfIR7k=
X-Google-Smtp-Source: APXvYqyZozJl1RfA1VmX4W2eoZOAItfz75XqKQZFSVMNJ9NnRaVX+aq83etThSvTCtYzqZuOUD2qIQ==
X-Received: by 2002:a5d:5044:: with SMTP id h4mr68948322wrt.4.1582629382765;
	Tue, 25 Feb 2020 03:16:22 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	f1sm23677833wro.85.2020.02.25.03.16.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 03:16:22 -0800 (PST)
Message-ID: <0018e8670b37836cfae92fd7332e927ec49f19ca.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Adrian Bunk <bunk@stusta.de>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Date: Tue, 25 Feb 2020 11:16:21 +0000
In-Reply-To: <20200224151041.GE27036@localhost>
References: <20200224125955.26771-1-git@andred.net>
	<20200224134022.GB27036@localhost>
	<6c0d874e887dc5a2355d236d77e8ec771ea729f9.camel@andred.net>
	<20200224143155.GD27036@localhost>
	<5639b75022c28419467aefb8de62c6ab24f9eae6.camel@andred.net>
	<20200224151041.GE27036@localhost>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: reproducible builds involving xz (was: Re: [PATCH v2] bitbake.conf: omit XZ threads and RAM from sstate signatures)
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
X-List-Received-Date: Tue, 25 Feb 2020 11:16:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2020-02-24 at 17:10 +0200, Adrian Bunk wrote:
> On Mon, Feb 24, 2020 at 02:58:21PM +0000, André Draszik wrote:
> > On Mon, 2020-02-24 at 16:31 +0200, Adrian Bunk wrote:
> > > On Mon, Feb 24, 2020 at 02:21:57PM +0000, André Draszik wrote:
> > > > ...
> > > > Once the artefact has been created, it doesn't matter anymore how it
> > > > was created, as long as the high-level options aren't being changed (like
> > > > an explicit compression level, checksum method, etc.)
> > > > ...
> > > 
> > > meta-poky/conf/distro/poky.conf:INHERIT += "reproducible_build"
> > 
> > I still maintain these are two different problems. I am not trying to fix
> > reproducible builds.
> 
> But won't fixing reproducible builds require reverting the patch you 
> suggest for fixing your problem?

No, I don't think so.

To fix reproducible, you need to either patch xz to always behave like in
multi-threaded mode, even when --threads=1 was given in the arguments.
Additionally, a patch to xz to allow it to scale down the number of
threads, but not the compression level (--no-adjust prevents both),
could be useful.

Alternatively, you need to decide if you want to support it with
--threads=1 or --threads >= 2, and issue at least a warning in
reproducible_build.bbclass if somebody deviates.


You should also calculate the memory requirements, reduce the number
of threads to fit, and again give at least a warning if the compression
can not be done without changing compression level after that.

I still maintain that none of that is related to my original patch.



Cheers,
Andre'



