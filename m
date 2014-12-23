Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB297272C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 06:25:45 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id s18so5086603lam.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 22:25:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=STOFP3XK3rb2sNI6MleppgSxKxjJsDFm7kVxeTOx5gw=;
	b=asP52u0nVfd7TceZm3B803yjpHBKAuCPu6e3eNFAo5QOIEMXm8XMQ9+y0vviuD7DLL
	7UcjuELKqIdydcBXl8oX8D08xay3ycw2bWt2MDl9vlBO0tD80QwnuXD+G7mtqCC7rnJ1
	jHB9YhbId/DrcQSV7bA16tQl4sfzsSJgpPOpdybsh1YXvJBklIz4MMYairV6NwLxnwSL
	JeU51a7cdy8XFiddVHukg0Rs2+WeT8vqpynrbyRlBfHaaijFVO1a/OhwQ1OaeDWupNPK
	Z2loPqEIrFMkgYi3LIyjB71DovKPMV1z3YINg59Ugs/NEhOlfWK3lH41ZdvnpZ4VYJ4K
	iy4A==
X-Gm-Message-State: ALoCoQmR7+DvBxJrlvAyXKX4Hmz1TYBM7ByaeqQbpKJEyKCnSw5g/2RLbH5qaJoc7XyfArcPyqrr
X-Received: by 10.152.228.164 with SMTP id sj4mr24719391lac.98.1419315945104; 
	Mon, 22 Dec 2014 22:25:45 -0800 (PST)
Received: from ad.chargestorm.se (c-83-233-19-145.cust.bredband2.com.
	[83.233.19.145])
	by mx.google.com with ESMTPSA id zo3sm5585900lbb.10.2014.12.22.22.25.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Dec 2014 22:25:44 -0800 (PST)
Date: Tue, 23 Dec 2014 07:25:42 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20141223062542.GA9157@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1418969925.git.Qi.Chen@windriver.com>
	<084ad3c5c70057e5f8f06bf85b4543a590a17a54.1418969925.git.Qi.Chen@windriver.com>
	<5493C8D0.1040907@topic.nl> <5498CBEA.1040708@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5498CBEA.1040708@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 1/4] packaging: allow globs in CONFFILES
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
X-List-Received-Date: Tue, 23 Dec 2014 06:25:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* ChenQi <Qi.Chen@windriver.com> [141223 02:58]:

> On 12/19/2014 02:42 PM, Mike Looijmans wrote:
> >On 12/19/2014 07:21 AM, Chen Qi wrote:
> >> ...
> >>As almost all files under /etc are basically configuration files, we
> >>provide a default value for CONFFILES.

> >>     CONNFFILES = "${sysconfdir}"

> >This is going to hurt a lot of recipes. Please do not set this.

Definitely true!

> >The default has always been that CONFFILES is empty. I see no reason
> >whatsoever to suddenly change this.

> >>In this way, we don't need to modify every recipe to set the
> >>CONFFILES variable. Of course, setting CONFFILES in recipes take
> >>precedence over the CONFFILES. For example, if the recipe author
> >>decides that package A should only treat files under
> >>${sysconfdir}/default/ as config files, he/she can write like this.

> >>     CONFFILES_A = "${sysconfdir}/default"

> >>The above situation should not be common. As according to FHS, the
> >>/etc directory is a place for all system related configuration
> >>files.

No, similar lines will be required for quite a few recipes...

> >FHS may have written that somewhere, but if you just take a quick
> >look at what is in /etc/, you'll find that actual configuration files
> >are quite rare, but there are tons of scripts and distro related
> >files there.  Whether or not a file there is supposed to be edited by
> >the end-user is something of a distro decision.

> >Also, "configuration file" does not necessarily mean that the USER is
> >in control. A configuration file may also simply distinguish machine
> >capabilities or software features.

> >We'll end up having to patch hundreds of recipes with a CONFFILES=""
> >or similar line.

> Most files under /etc are configuration files. If we don't default
> CONFFILES to ${sysconfdir}, then we have to patch a lot of recipes
> with CONFFILES_xxx = "xxxx" lines.

Well, there are a lot of those configuration files, that only the
distribution will care about. Especially if we're talking embedded
devices.

> The fact is that when people write recipes, they often forget about
> CONFFILES.  The typical example is the shadow recipe. And I can easily
> give you more examples.

This patch won't help this, it just shifts everything 180 degrees
around. Now we have to explicitly remove a number of files from
CONFFILES in a number of packages; which obviously is something that
people will forget...

> And it's not uncommon that people forget to check CONFFILES when they
> update the recipe.  When the recipe is updated to a new version, it's
> possible that the CONFFILES should change.  The typical example is the
> systemd recipe.

> *The bad effect of the above? On-target package upgrades override user
> changes. That's a really annoying problem, isn't it?* Users of OE
> based projects have complained about this. There were patches on OE
> which fixed several recipes. But the solution doesn't scale.

I tend to agree with Mike here. It's better to explicitly add files (or
directories) in each recipe, as that will make it more obvious which
files won't get overwritten during a package upgrade. Sure, short-term
this might mean more patches (I'm nt really sure of the status regarding
this). 

But more importantly, it will keep the determinism and explicit marking
of CONFFILES. Again, remember that we're primarily talking about
embedded devices here, where the distibution/distributor quite likely
need some more control, compared to a regular desktop distribution.

> The patchset is an effort to change this situation.

I don't think we'll gain that much from this patch; rather we'll
loose...

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

