Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 23FE060138
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 16:06:45 +0000 (UTC)
Received: by widdi4 with SMTP id di4so28287532wid.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 09:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=wzG5Xn9VPDW6FNCCPvdyfVBI1cIrnVbS/kgJ03hLGfI=;
	b=XvHlQIqS83L9zShH4eWrLvPTOqwwNOk6/yRf4Ei2366z3Qavxl6vcMJBtdJmE7gzmS
	xn2XhJu/BSav8ycM7U7BDKOtnOwbx/ySQH/FaOkTV6LPXdXqo+OsmRcqdrQ7PliHgKtH
	ywM9xLsJ33Pu3Y8wLW8c8VFMiSA4xte6pPbePa7HXhPGxXtj9vXTzWGPe1npsaG/BAWQ
	uF2FCz/nvZa1y/YeXc9SjCsjchLoVkxeLaTkJuGXWvAV4wf7Q2L6W/SLSSmWykxo5pg7
	vUtr+VNOzMRYTrA3tMg9Io5qJIDy8BHcR+ot97TGEHYZe5STg932bpeyquycgyeesgMs
	ZH3g==
X-Received: by 10.194.176.225 with SMTP id cl1mr20301747wjc.45.1430928406393; 
	Wed, 06 May 2015 09:06:46 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id n3sm2837490wix.1.2015.05.06.09.06.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 09:06:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 May 2015 18:07:08 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150506160708.GD2067@jama>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
	<1430521154.18360.28.camel@linuxfoundation.org>
	<55440C90.5060605@windriver.com> <20150502081346.GD2366@jama>
	<55458D0D.6070904@windriver.com> <20150506144241.GA2067@jama>
	<554A2C1C.5040304@windriver.com> <20150506153325.GB2067@jama>
	<1430927086.8074.65.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1430927086.8074.65.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 06 May 2015 16:06:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2015 at 04:44:46PM +0100, Richard Purdie wrote:
> On Wed, 2015-05-06 at 17:33 +0200, Martin Jansa wrote:
> > On Wed, May 06, 2015 at 10:58:36AM -0400, Bruce Ashfield wrote:
> > > On 2015-05-06 10:42 AM, Martin Jansa wrote:
> > > At this point, all I can say is file a bug. My builds of the same
> > > board work, and the autobuilder show up green.
> > >=20
> > > That screams race condition, so I'll look into it from that angle.
> >=20
> > I'm considering providing simple old-style recipes for vanilla kernels
> > and using them in my jenkins builds instead linux-yocto, because kernel
> > shouldn't block testing other recipes from meta-oe and other layers as
> > often as linux-yocto does.
>=20
> I wasn't aware of linux-yocto breaking that often?

Someone can query http://errors.yoctoproject.org/ database to see how
often (or if it's just me and my builds), unfortunately the full-text
search for "linux-yocto" doesn't provide good overview of issues,
because it shows 350 errors and not all are from linux-yocto recipe.

http://www.openembedded.org/wiki/Bitbake_World_Status* pages and status
on e-mail also aren't very accurate because I submit only reports from
relatively success full builds (so I usually skip the builds with failed
kernel, unless it's failing like that for long time).

> I am aware that:
>=20
> * we have a race issue with shared_work which we're trying to resolve
>   and its proving tricky to find a patch which doesn't break builds
>=20
> * we have the newly reported issue in this thread. FWIW the builders=20
>   I've seen are all green
>=20
> * there are some warnings in the build which need addressing
>=20
> but on the most part I thought we'd caught the serious kernel failures
> in advance of changes hitting master. Are you using master-next or
> master?=20

I've used master-next week or two ago (mostly to test bluez4 and python3
changes) and soon after that dropped all linux-yocto related changes
=66rom it assuming that it's indeed cause for the issues I'm seeing, but
it's not and it's still failing with master as well (and my
jenkins/world builds are just small portion of my builds executed
elsewhere where I see similar issues).

> Its its -next, I can understand the problems more as that has been
> unstable recently but then by its nature, it can be. We are rooting out
> problems before master afaict though?
>=20
> Cheers,
>=20
> Richard

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

