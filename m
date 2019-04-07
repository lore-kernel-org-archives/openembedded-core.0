Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 29FAB7D485
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Apr 2019 21:35:59 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id k11so14022573wro.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2019 14:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=vGsjAazcAD4e8hiwxQ0NyRpT+Y+BpyMPDqQaCB2Hv9o=;
	b=hMt12vuKfyScXnPerlYFMIUiodDgO/3SOuBLuIaYoLwBHxVIdvUrp4YLw9V5fx7Uvd
	0a2Is5PdXMZmAvX1bDKdXlXXBGsKkGMsm6H1GDUAkGe7B4eNuMBu+AJFlNncyVsNOsnz
	O5MCIWjMRvvej+Nx8bqkHsiqXbQq8GOvAaqlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=vGsjAazcAD4e8hiwxQ0NyRpT+Y+BpyMPDqQaCB2Hv9o=;
	b=WJViB5NAzKNcZQKsGDd6YA815UYc9gjk9uiAgXc/8qSYKgjQJ54AXWXnBY+gBLPZQ7
	N0f76AB5Mov3nr7PDFUaajOXiNuFX8dkVno4PtH29VV6VxVix+B9dTTTMxqDsti1bv1X
	xt3TNh2NjuzamFRDDWBP+dFGSQqjQUGZ4ASrGDg2L2fc88BvMC9AlZfDYkoGIGYZZKro
	UOeQ0CbnnNbofUDw4l2LpXFkVckLySV9N8yiC0scE9xCRSrJSzsm5kUTrhnRUKupjU42
	cGiMrjk1Wu93zsIBzJJ0HGZ6FzxsJxi4Ugw7jTlLhFMrcnBgxzC0CtwoOq00xZDQYVzM
	1iFQ==
X-Gm-Message-State: APjAAAXDAKKtNJcdDeQeWH2jo+opYCFY7FPfwGHsSpB1KRbdUFjxpnti
	6ngxr1ObS543F7z1DURN3AxVMGymyg8=
X-Google-Smtp-Source: APXvYqySN6/HgjL2MFCJIdkM+Y6nuWvzwWqfqWGmr1t+8heYUqCaW5K43QOfFtkbCAiOAXKfhjPslQ==
X-Received: by 2002:a5d:6181:: with SMTP id j1mr16736084wru.11.1554672959969; 
	Sun, 07 Apr 2019 14:35:59 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t17sm21774531wrr.26.2019.04.07.14.35.58
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 07 Apr 2019 14:35:59 -0700 (PDT)
Message-ID: <e32fe531d73752de6447e32acb4581fed2982cda.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 07 Apr 2019 22:35:58 +0100
In-Reply-To: <7fcf8b36-8d26-e391-0b2a-df618065a11a@herbrechtsmeier.net>
References: <7fcf8b36-8d26-e391-0b2a-df618065a11a@herbrechtsmeier.net>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: Circular dependency of do_populate_sysroot
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
X-List-Received-Date: Sun, 07 Apr 2019 21:35:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-04-07 at 21:18 +0200, Stefan Herbrechtsmeier wrote:
> I'm working towards an integrated Node.js support without npm and
> have a  problem with a circular dependency of do_populate_sysroot for
> the native build.
> 
> I have two recipes a.bb and b.bb which have no DEPENDS but a 
> RDEPENDS_${PN} between each other. This is no problem for a cross
> build but leads to the following error for the native build:
> Task virtual:native:a.bb:do_populate_sysroot has circular dependency
> on virtual:native:b.bb:do_populate_sysroot.
> 
> It looks like the problem comes from the following lines in 
> native.bbclass and commit eea86c4f0a960d0094571a78dc0cf9d46d162a22:
> RECIPERDEPTASK = "do_populate_sysroot"
> do_populate_sysroot[rdeptask] = "${RECIPERDEPTASK}"
> 
> Is the rdeptask on the same task really needed or is it possible to
> use  an other task after do_populate_sysroot as sync task which run
> time dependency on the other do_populate_sysroot task?

You're saying A runtime depends on B and B runtime depends on A.

The code is quite correctly therefore trying to install B into A's
sysroot since you might want to run it and also install A into B's
sysroot since that also depends on it and you may want to run that.

The dependency is therefore correct and you're trying to ask the system
to do something impossible.

You likely need to decide that the native A doesn't really runtime
depend on native B or vice versa and break at least the native
dependency.

Cheers,

Richard


