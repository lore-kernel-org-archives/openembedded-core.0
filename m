Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9EECD6FFE8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 08:27:01 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c133so1860516wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Sep 2016 01:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IpT/K6OR9GueJQpNtRl0Mi7QDB/rnWazmIIaaDQLo1c=;
	b=K5CVFAFuIQkoGUSR2bJGwZTtXNG37WrKvxTKUHnZGMFlA+6HdkKJFryoAmMVDPTzhL
	hhoszbbpYCOfYKQwhSrTdymZfJM3jCURS9Z8IlIHNROpMlTmK3+dYZU3ztNwMZ/vfE+1
	xBj61ODh8oYTkQaN5BOdavImGXvle/t/NtS7D8gVQdVQ7cWjrdLhki/Gwkm58WU8CKRl
	SqIPoMHMQdMmnwjdNiRwAWyM9PZf/SGm46AjDsl8lK6jUxAvcbGTWn4zioSwirPApuDJ
	BIELSr7hWWhlPAwcyAX1dSAhSEqPOTAE8JmKP2pQK8RzPB7H/FOMNO7fsyJzRzLatlSO
	fUMw==
X-Gm-Message-State: AE9vXwP4GThsOcopEkQL2QSCmM2odxi0BVHM4JgiQbjtZprr2NUQPiuJATvBk/WA1gBPiQ==
X-Received: by 10.28.199.1 with SMTP id x1mr1945408wmf.0.1472804821719;
	Fri, 02 Sep 2016 01:27:01 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	bc5sm2671206wjb.37.2016.09.02.01.27.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Sep 2016 01:27:00 -0700 (PDT)
Message-ID: <1472804818.9440.14.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 02 Sep 2016 09:26:58 +0100
In-Reply-To: <b506d54a2cb91ebf6e166775b9f05c0311c650d0.1472794137.git.liezhi.yang@windriver.com>
References: <cover.1472794137.git.liezhi.yang@windriver.com>
	<b506d54a2cb91ebf6e166775b9f05c0311c650d0.1472794137.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libnl: remove RREPLACES and RCONFLICTS for libnl-genl
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
X-List-Received-Date: Fri, 02 Sep 2016 08:27:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Thanks Robert!

For my eduction, I don't understand this yet, though, and I don't want to
cause issues like this again...

On Do, 2016-09-01 at 22:30 -0700, Robert Yang wrote:
> The libnl-genl.rpm provides libnl-genl2 and libnl-genl-3-200:
> 
> $ rpm -qp --provides tmp/deploy/rpm/core2_64/libnl-genl-3-200-3.2.28-
> r0.2.core2_64.rpm
> elf(buildid) = 4e753b2361ba0b02f162244a87cc0680796e46cc
> libnl-genl = 3.2.28
> libnl-genl-3.so.200()(64bit)
> libnl-genl-3.so.200(libnl_3)(64bit)
> libnl-genl2

How does RPM manage to add a provides of libnl-genl2 here?

> libnl-genl-3-200 = 1:3.2.28-r0.2
> 
> so that we don't need set them in the RREPLACES and RCONFLICTS, the
> package manager can handle it, otherwise it would cause do_rootfs errors
> when install both libnl-genl.rpm and lib32-libnl-genl.rpm:
> 
> Computing transaction...error: Can't install libnl-genl-3-200-1:3.2.28-r0.
> 0@core2_64: conflicted package libnl-genl-3-200-1:3.2.28-r0.0@lib32_x86 is
> locked
> 
> We didn't meet the error before was because there was no libnl-genl.rpm,
> so that it had no effect, but now the following commit fixed the
> packaging problem: (master-next branch)

Hm, there has been a libnl-genl.ipk all the time. Why no rpm?

> libnl: fix packaging mistakes
> 
> Remove RREPLACES and RCONFLICTS for libnl-genl will fix the problem.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-support/libnl/libnl_3.2.28.bb | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/meta/recipes-support/libnl/libnl_3.2.28.bb b/meta/recipes-
> support/libnl/libnl_3.2.28.bb
> index 7ddbd40..799962f 100644
> --- a/meta/recipes-support/libnl/libnl_3.2.28.bb
> +++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
> @@ -44,5 +44,3 @@ FILES_${PN}-idiag = "${libdir}/libnl-idiag-3.so.*"
>  FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
>  FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
>  FILES_${PN}-xfrm  = "${libdir}/libnl-xfrm-3.so.*"
> -RREPLACES_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
> -RCONFLICTS_${PN}-genl = "libnl-genl2 libnl-genl-3-200"

I can see how 'libnl-genl-3-200' could be an issue with RPM based systems
(whereas libnl-genl2 shouldn't be a problem, except that RPM seems to add
that as a provides???) But I don't understand how this wasn't a problem
before?

What am I missing?

Cheers,
Andre'


