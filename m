Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0D7C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 13:24:48 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14891.1789565085678111076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 06:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V44gRTRl;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so5096645e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 06:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789565084; x=1790169884; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iLDq9aD0aTUeLKf8LLMopObLlFaBQftvG9uyrIoraco=;
        b=V44gRTRlV3lHbltEvRh+7JgFKfBUbSQmE0XU6LKYnuJ2exfeEWzpdTmS+Gv7ttI/0a
         B5Ys19UbtFVe7Hj+7ZKwgrD+O7ekr7xpQ97vdTGnYfK86+U4UqOLcz6RvveDx1Ggu6fo
         M0m9bJX9Rrr7+06Gt8tqipOsmhoqrwkcKs46c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565084; x=1790169884;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLDq9aD0aTUeLKf8LLMopObLlFaBQftvG9uyrIoraco=;
        b=oVPwwqO4Ley3XjXQ8Rp7TjiWSZxBq3+Yyx7HtT7DMEXSStlW/rodhA3+ucNfv/x6Lt
         +FMh4wfc82IGF/vyEG0b+f28Ycsw/KhCINYvYni8UF3CGxZl6mqFyDNOHm1aCGAkOsEo
         H1orro3Rh7OauMmgYNdm5NXMl81klXuI7JDqihnBOVRVyngMuTXYFHUlU9UJZKtB+KBY
         JRia5vmWCvBHyG7SSBJIKQ0oMv4j2puiHKNSm0dbn5AcYI6VsTdHsAv9rkWt/ufij1mI
         KNWFtWKfdJNDaML6GHRJa41NYxwJTQU6BOhCygb4TCCGanRCfm4VV5Dns9c4pX8kBtni
         ZArw==
X-Forwarded-Encrypted: i=1; AKwUvBzKgK8/1Vu/+JQDxgtzKq3c15pCYJfjvS69jVr+Mp82DQd72mWdK17kCx7F9RVgcBZlh8U7KdGAF4DHPO8ytd6frQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++lUFUkueh8xlfIhD+5N7Tq6firQCwmpM94zf4CsWDVlj+Tmeaoy
	oVNZ7V2CpfWPn7bvKAIFUvqconVI4jkNUI6eOVTklmwtUb6IjlVz7LsivnH5N+zkuqM=
X-Gm-Gg: AYBFou20/zW15C2F6CJNpvY6ZSb3jdMSpSfxi7H9sEGg2JHF9yRiX3RvhmlgpRSbMpg
	akii2qa0biiKVyT5+ym2wSHBaA/clgdJXa8sM+8QSYz/6p5grfHVcP0Q1s1JH+A2yuTU9K0XFZN
	HM9YoJsg/1TQ+21xhG2C3HctC7EfVj8arjPaZ4iEgJY3ZpPEI24COETzkt5ppGNleBQmFkei/Nk
	bMuYwDfIAaXOy70d6Y0KGN466rLpbCNMhQ4HWO+hV7BiKXkR5hQHBUyKgq2Xbb6P8ZsSSnkws0B
	/2IE3lj9GLwMFh0Gknf061EiqBiD7PZTN6tkpzjva2Abqo4wQc+sTWIF0jRk62WaQVIDOLzEhKJ
	6bYLzQbV6R5LyMIxW9UjPEa3LVr+hGtcqXkHDn8TuCoeLGf6hLrfrnX6q4Kh+AMkz6TTgKPh0Te
	zmF6NfahwyYb0AN0lPoRvPwVnS4zBhOd5tDBrvSCZ7DzuXsi9Idob3NqW9XfQMmwPpX4LeyzMgs
	PQGViV02M2DhfRH2HhMH36uiNS/5rhL+Qlszj0x1o3M1pxZKjf8zwOLxdiDgIph
X-Received: by 2002:a05:600c:1986:b0:49e:70b2:66ab with SMTP id 5b1f17b1804b1-49eac40f67emr32993515e9.0.1789565083648;
        Wed, 16 Sep 2026 06:24:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cd09:70e0:c6de:9b09? ([2001:8b0:aba:5f3c:cd09:70e0:c6de:9b09])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b11691sm88476865e9.12.2026.09.16.06.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:24:41 -0700 (PDT)
Message-ID: <5e2534d7886c69c5f47a71f2e03951b29489d04c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] sstate: fix access to a cached object
 rewriting its modification time
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>, "Haener, Michael"
	 <michael.haener@siemens.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "zhanxusheng@xiaomi.com" <zhanxusheng@xiaomi.com>, "Marko, Peter"
	 <Peter.Marko@siemens.com>
Date: Wed, 16 Sep 2026 14:24:40 +0100
In-Reply-To: <e524024743400d16118921d688ad46c4204d3e60.camel@siemens.com>
References: <20260910211821.48424-1-michael.haener@siemens.com>
				 <20260911070121.39436-1-michael.haener@siemens.com>
			 <14700b98da9c582f0c74951364179b091cb911df.camel@siemens.com>
		 <233a6dcc8a610dd6e09031e619a2437c43b3dfb1.camel@linuxfoundation.org>
	 <e524024743400d16118921d688ad46c4204d3e60.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 13:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245973

On Wed, 2026-09-16 at 11:39 +0000, Freihofer, Adrian wrote:
> Some time ago, Michael came to the exact same conclusion as you
> regarding this patch, but you were quicker to the
> list!=C2=A0
> https://git.openembedded.org/openembedded-core/commit/?id=3Dcc07895f951
> 140dbbffcf32d3eabf65788cc4d00
> To me, this is a great sign that we=E2=80=99re working toward the same go=
al
> and share a common understanding. :-)
>=20
> One point we are still looking to clarify, however, is the reasoning
> behind writing to mtime when a read access occurs. According to
> standards, this should be handled via atime (provided the sstate
> directory is mounted with -o atime). In most cases, -o relatime is
> even sufficient and less costly. We=E2=80=99d argue that an NFS+ZFS serve=
r
> setup should work perfectly fine with standard atime and mtime
> updates on the Yocto side.

From a theoretical standpoint you can argue this. Real world experience
suggests things aren't this straightforward. The code was a mix and in
the end I just standardised it to do everything consistently. I know
there have been requests and code for mtime in the past, at least
partially. Whether this was a bug with atime handling is unclear.

We don't currently document you must have sstate mounted with atime, or
working atime. Perhaps we should, I don't know. I do know just atime at
the filesystem level alone hasn't been enough in the past.

>=20
> We can leave Ceph and other cluster filesystems for a separate follow-
> up discussion. Our immediate goal is to improve sstate.bbclass in
> general; moving toward standard-compliant behavior should naturally
> benefit NFS, but also Ceph in the long run.
>=20
> However, cluster filesystems introduce unique challenges: atime must be
> handled carefully on the client side to avoid the massive overhead of
> synchronizing metadata across all nodes. In contrast, a simple single-
> node filesystem can afford to be more "relaxed," potentially dropping
> or deferring metadata updates at various points in the chain from the
> application to the physical medium.
>=20
> Do you think sstate.bbclass should stick to touching both mtime and
> atime, or do you agree that moving toward atime only for cache
> management would be the right next step for bare-metal and NFS
> filesystems?

Touching mtime and atime was the least worst option last time I worked
on the code. If we want to drop mtime, we need to have a pretty good
feeling that usecases won't break. I've therefore tried to at least
articulate what some of those are. We'd need to look at what the
autobuilder is doing, how some of our other users use things in CI and
so on to see what impact that would have. Getting people to do this
kind of review is hard work :/. Just saying it should work in theory
and talking about standards isn't really enough in this case.

So I guess I'm saying it may be possible to change but we do need a bit
more analysis and buy in from others for the change than what we have
right now.

Cheers,

Richard

