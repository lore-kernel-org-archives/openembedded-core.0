Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8E5D4784D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 10:16:09 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id r135so21635388lfe.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 02:16:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QT0c6uQT0AOL9kSn5yex3wq+GzvMw43JLzYZyuXlG2w=;
	b=Mbeg6COmdhhybMVe64tkmOu88HrscowWwr0d9sPRL1hKwBMl0IeouHE2/LBCvMTNve
	LxtImTkVZNfY98Bx7aRnjEC2nwkP4mJVpM6BLWM3VgiWEyWyEK+RQgHmkshDyAr5QvY5
	OaDbykf/GCGboCrsSbPvHmrLT6rKhW1vk3B0IZmOACRzbyVLHVFS1fwQjiuUPqo9oyas
	27iak3SOLjLkKBnDEYvXBVjim8ftLd8HcU8/MABjMKEhRYHndGfr7euebPiVuj732o+Q
	JCy9kJstyKC43S1vKpgwafNUW0Zp9dpeqU6/AMxjS884QThvyRxLdUpLvKAFH10BvqbW
	/Ccg==
X-Gm-Message-State: AJaThX4J+dDO4/Ount3BUl5cwW8v7UxBnzrYAt3Wtg9kPYYC6KtwPLzH
	gy60acsUmOLRq+rY9Dh0neVa7epi
X-Google-Smtp-Source: AGs4zMYKzPrfma1rIjj8RdBeXQ1/dGc3kgfbwZtN0EEbIVHQGX7glA/75h/Ie8xBhxQJwTkHYBd25w==
X-Received: by 10.25.121.10 with SMTP id u10mr294505lfc.50.1510654570196;
	Tue, 14 Nov 2017 02:16:10 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id m26sm600298ljb.61.2017.11.14.02.16.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Nov 2017 02:16:09 -0800 (PST)
Message-ID: <1510654568.4049.64.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 10:16:08 +0000
In-Reply-To: <a4f2cfac-2714-ef11-c4ff-308ce183f1e1@windriver.com>
References: <cover.1510550741.git.Qi.Chen@windriver.com>
	<62db9387c3ee71f4bed87a7a546afdf927ba5ac0.1510550741.git.Qi.Chen@windriver.com>
	<1510563249.4049.33.camel@andred.net>
	<a4f2cfac-2714-ef11-c4ff-308ce183f1e1@windriver.com>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] autoconf-archive: inherit allarch and fix package splitting
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
X-List-Received-Date: Tue, 14 Nov 2017 10:16:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-11-13 at 19:54 +0800, Robert Yang wrote:
> 
> On 11/13/2017 04:54 PM, André Draszik wrote:
> > Hi,
> > 
> > On Mon, 2017-11-13 at 13:26 +0800, Chen Qi wrote:
> > > autoconf-archive is a set of common m4 macros, it should be allarch,
> > > just like it is on other distros.
> > 
> > I have found previously that when changing a recipe to produce more
> > generic
> > output, like in this case, and the old binary package is still in
> > deploy/,
> > then the package manager would always pick the more specific version,
> > even
> > if a more recent (by package version) exists in deploy. In my case I was
> > moving from PACKAGE_ARCH=${MACHINE_ARCH} to
> > PACKAGE_ARCH=${TUNE_PKGARCH},
> > but I guess it'll be the same here.
> 
> I think that it is because of the priority MACHINE_ARCH > TUNE_PKGARCH >
> allarch,
> which is the right behavior.

I'd say this patch here is a good example why it's not the right behaviour.

This patch is making autoconf-archive allarch, i.e. lower priority than
before. In other words, anybody who has the previous TUNE_PKGARCH version
already will never get an update, even if the version number is bumped.

Cheers,
Andre'


