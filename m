Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 93547748D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 12:44:44 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o78-v6so33292413wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 05:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=q+jW+8Xl9kUYMZ1nJ8L2hTU1ntYJ8OTh4tANN6TVoKw=;
	b=O8I49kYwflEbIoD8j3d7EfEpRdHcQ6Ty/1xchohys3u4klQYga8Z9PLBrxutidXVpI
	luYsE85FVcW4UlEKjtXPFNpNJyLfQAns5Xp92p8f+rbjSydqWl7G0CLmDUl0yOz3xF4e
	6pvNGoccVo1NIsZkeWggm5+fPQs69A7NE9yPPXZgJcrjfIKVo2ohAlDLppoghWtHje/H
	fp9EwmNnKgJRa8c/LF2d/VT4A5MyGPN4J5fpvnw12FNAMT9XD5vvLBjiYFq58XIhhqgY
	P+Mx4wsBx25pMXkA743S6lBVpyVC9cr9vuyqUWHF5OvfBMdURno2MoKk9e9KcxsljZ68
	VPWA==
X-Gm-Message-State: ALKqPwdMhwy4PCSiYhFdjPseUVPmC4epoLeMxAdFzYVNizrXuF/I/zZ3
	GdOCQBQnagUALY6FbvZyxYA=
X-Google-Smtp-Source: AB8JxZolhGwH0UGiFKf+RDKGDqCxt6huDS770f19O6v+uG8bi04ivHURLb26nY745wIG0MvHVM/Kbg==
X-Received: by 2002:a50:b1e2:: with SMTP id
	n31-v6mr2116947edd.197.1526993084968; 
	Tue, 22 May 2018 05:44:44 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	m25-v6sm8701695edf.76.2018.05.22.05.44.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 22 May 2018 05:44:44 -0700 (PDT)
Message-ID: <5f46404f93ccc609edbe4c7b7ad3486c893daee7.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2018 13:44:43 +0100
In-Reply-To: <1526992429.8937.152.camel@linuxfoundation.org>
References: <20180522122553.29109-1-git@andred.net>
	<20180522122553.29109-4-git@andred.net>
	<1526992429.8937.152.camel@linuxfoundation.org>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 4/4] sstate: avoid indirect bison/flex-native dependencies (via SSTATE_EXCLUDEDEPS_SYSROOT)
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
X-List-Received-Date: Tue, 22 May 2018 12:44:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-05-22 at 13:33 +0100, Richard Purdie wrote:
> On Tue, 2018-05-22 at 13:25 +0100, André Draszik wrote:
> > From: André Draszik <andre.draszik@jci.com>
> > 
> > Avoid adding flex-native or bison-native to the sysroot without a
> > specific
> > dependency in the recipe. This means indirect dependencies
> > (e.g. X -> Y -> binutils-cross -> flex-native) no longer meet the
> > dependency incidentally. This improves determinism and avoids build
> > failures when people switch to external toolchains.
> > 
> > Based on an idea by Richard Purdie:
> >     http://lists.openembedded.org/pipermail/openembedded-core/2018-Ja
> > nuary/146324.html
> > 
> > Signed-off-by: André Draszik <andre.draszik@jci.com>
> > ---
> >  meta/conf/layer.conf | 6 ++++++
> >  1 file changed, 6 insertions(+)
> 
> The trouble was that the patch above of mine doesn't actually work and
> breaks things from what I remember, some issue showed up in testing on
> our autobuilder. I don't remember exactly what it breaks unfortunately
> :(.

Well, I did test this series with the images I build, and nothing broke,
except for one missing dependency in meta-oe, for which I've sent a patch
already.

I think your patch placed the skipping in the wrong place? Maybe it was
intentional, but I have it in a different place, and I don't return (True)
on a match, but continue iterating over the remaining items.

In any case, if there are other breakages caused by this, the autobuilder
would at least have a log message, so I can fix the patch hopefully... :-)

Cheers,
Andre'


