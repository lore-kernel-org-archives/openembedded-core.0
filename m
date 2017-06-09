Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id BC62C78299
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 14:02:16 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u101so7038993wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 07:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NgaLbPn5ykIdumMrCoh1z6NBSoSyaEaD96Fm7A0uVpw=;
	b=KNWQz3xOMH+TVcX1ARysjVtFeysXr5DzmBcyihQElKnHa0UWxedtTwUyTf0rZQo8Qs
	yfNm+dS6l2Je9bhLZtA4n06vsc7UiV5WKXE0ZhlW238SVPEMkllOxdXPzPpYAVANLhOO
	ny3GlvImVDioOMxFSj00igMo4fsL0erBiPmMOShdO/Ubek+lsceYdy+2TJPiLEqlG9km
	AtF30EIkHmjb+MmPkNkZ7x9WexZ03cOTNQK6Rbg/gkSo61drQ78c/wbvbVizBuVGl8e2
	C9WBXQqInS8cP9U3QdCp5pZ+0PBPgEB1nlLeMeOgwc5AZGxKslJCvHQdV9eMNG81CzBk
	LTuQ==
X-Gm-Message-State: AKS2vOzAw2LmXzkWWiLO20wC35fcuQG3pdYKw+2g9XvSZXoLOaOjhZWG
	MAh77xAfmG1yG5mbauQ=
X-Received: by 10.28.132.210 with SMTP id g201mr7446055wmd.26.1497016937579;
	Fri, 09 Jun 2017 07:02:17 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id b8sm1825630wrb.7.2017.06.09.07.02.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Jun 2017 07:02:16 -0700 (PDT)
Message-ID: <1497016935.4561.15.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 09 Jun 2017 15:02:15 +0100
In-Reply-To: <CAMKF1srdVU0p-e4gPJx5rNEhk4aQdsiELuz+-1AsD_tgG6b_Gw@mail.gmail.com>
References: <cover.1496979431.git.raj.khem@gmail.com>
	<c0e598696af9be3f567751a8641effb08431a7d2.1496979431.git.raj.khem@gmail.com>
	<CAJTo0La6u=Tzzsow5ZYwqmWHY8RzyvgVqT=J4J9UpKy8uKbb9A@mail.gmail.com>
	<CAMKF1srdVU0p-e4gPJx5rNEhk4aQdsiELuz+-1AsD_tgG6b_Gw@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/3] pulseaudio: disable PIE flags when hardened flags are enabled
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
X-List-Received-Date: Fri, 09 Jun 2017 14:02:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-09 at 13:07 +0000, Khem Raj wrote:
> On Fri, Jun 9, 2017 at 5:56 AM Burton, Ross <ross.burton@intel.com> wrote:
> 
> > 
> > On 9 June 2017 at 04:41, Khem Raj <raj.khem@gmail.com> wrote:
> > 
> > > +SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
> > > 
> > 
> > These tend to go into security-flags.inc, not the recipe.
> > 
> 
> I know that's been the case but I think having a global file is error
> prone
> its better to have it in recipe context since it can get attention at
> upgrade time to test if this has been fixed in new release etc

Isn't one of the main root causes really that bitbake passes -fpie -pie even
when the recipe is building a shared library? (Maybe not in this case here,
though). Obviously, bitbake doesn't really know about shared libraries, and
yes, each recipe's build system could filter out pie flags for shared
library targets, but that's probably better done at libtool level:

http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/110048.html


Cheers,
Andre'


