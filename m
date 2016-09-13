Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 46202731F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 13:29:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b184so2399143wma.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 06:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=caprPAZJownI7iSbeagWmmM6m71gCGAj63WLIp0ufiU=;
	b=SLmQJ7fh+FtopXVJHEfizwMsdNTfKkGGY/M5F2delvcoNK1qGcdamqovIfZHovG1QL
	K7ppeQq6dHl7nMGNt79Rxb162q1DhSPd+vATIRP3F4/12y541kAWax6a2i5x7BQWblX+
	3dywZmswrl3+tCsQkULpZz4GO4CJ5odSk7UBozAjSo7qxKKSaAMUHw3tFBRocjbWTn87
	fFOlkapMcnTvDXxJWA/iXqsrwqBYujsUHkHMP2t7MPVZopwbYkDKVwrtST1/y4fvFeaM
	vLODJ/axi0Z3znzi4YFkAc0izF7wrYMVaDRdkIqoS/kXDk5YJVR2Q7g8DRPhMGfBvzH6
	c41Q==
X-Gm-Message-State: AE9vXwMPccfTZ2R52awQ5dp/piBfJxsdUGaV4iESNqzdbe54T4lphti6u9vgv195cTRquw==
X-Received: by 10.194.103.3 with SMTP id fs3mr20469002wjb.115.1473773343824;
	Tue, 13 Sep 2016 06:29:03 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	ml1sm22921528wjb.46.2016.09.13.06.29.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Sep 2016 06:29:02 -0700 (PDT)
Message-ID: <1473773341.5279.8.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2016 14:29:01 +0100
In-Reply-To: <1473764984.5279.6.camel@andred.net>
References: <20160913090710.22945-1-git@andred.net>
	<1473764984.5279.6.camel@andred.net>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH] kernel-yocto: remove do_shared_workdir from SRCTREECOVEREDTASKS
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
X-List-Received-Date: Tue, 13 Sep 2016 13:29:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Please unignore this patch :-) The patch does what I intended.

Sorry for the noise.

On Di, 2016-09-13 at 12:09 +0100, André Draszik wrote:
> Ignore this. This doesn't yet work as I intended I think.
> 
> On Di, 2016-09-13 at 10:07 +0100, André Draszik wrote:
> > 
> > Various recipes depend on the kernel's do_shared_workdir
> > task, a quick grep suggests all external kernel modules
> > (via module.bbclass), but also perf, and potentially any
> > additional headers as outlined in linux-libc-headers.inc
> > are affected.
> > 
> > Having do_shared_workdir in SRCTREECOVEREDTASKS means this
> > task is removed when externalsrc is enabled, making all
> > those recipes fail as the task they depend on,
> > virtual/kernel:do_shared_workdir, doesn't exist.
> > 
> > Remove do_shared_workdir from SRCTREECOVEREDTASKS so that
> > all those recipes work even if externalsrc is activated.
> > 
> > According to the comment in here, the reason for
> > do_shared_workdir to be removed as a task is because it
> > modifies the source tree, but that doesn't seem to be
> > case.
> > 
> > Signed-off-by: André Draszik <git@andred.net>
> > ---
> >  meta/classes/kernel-yocto.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-
> > yocto.bbclass
> > index 82b9210..53659f2 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -1,5 +1,5 @@
> >  # remove tasks that modify the source tree in case externalsrc is
> > inherited
> > -SRCTREECOVEREDTASKS += "do_kernel_configme do_validate_branches
> > do_kernel_configcheck do_kernel_checkout do_shared_workdir do_fetch
> > do_unpack do_patch"
> > +SRCTREECOVEREDTASKS += "do_kernel_configme do_validate_branches
> > do_kernel_configcheck do_kernel_checkout do_fetch do_unpack do_patch"
> >  
> >  # returns local (absolute) path names for all valid patches in the
> >  # src_uri

