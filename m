Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 35AD776651
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 13:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u22DBoEZ017491; Wed, 2 Mar 2016 13:11:50 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id B_EvWIsh3O1M; Wed,  2 Mar 2016 13:11:50 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u22DBj13017486
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 2 Mar 2016 13:11:47 GMT
Message-ID: <1456924305.25131.30.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 02 Mar 2016 13:11:45 +0000
In-Reply-To: <20160302123800.GB10529@jama>
References: <1456610987-17836-1-git-send-email-Martin.Jansa@gmail.com>
	<20160302123800.GB10529@jama>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH][RFC] base.bbclass: Introduce EXTRA_CONF_PACKAGECONFIG variable
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
X-List-Received-Date: Wed, 02 Mar 2016 13:11:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-03-02 at 13:38 +0100, Martin Jansa wrote:
> On Sat, Feb 27, 2016 at 11:09:47PM +0100, Martin Jansa wrote:
> > * add separate variable for configuration options generated from
> >   PACKAGECONFIG setting, this helps other bbclasses and recipes
> >   to take advantage of PACKAGECONFIG mechanism, without including
> >   other options from EXTRA_OECONF
> > * e.g. meta-qt5 recipes are abusing EXTRA_OECONF to get options
> >   from PACKAGECONFIG:
> >   EXTRA_QMAKEVARS_PRE +=
> >   but with
> >   conf/distro/include/no-static-libs.inc
> >   it means getting --disable-static as invalid option inside
> >   EXTRA_QMAKEVARS_PRE as reported by Alexandre Belloni who tried
> >   to use poky with meta-qt5.
> > * once we migrate all bbclasses and recipes to
> > EXTRA_CONF_PACKAGECONFIG
> >   we should also restrict EXTRA_OECONF append only to
> > autotools.bbclass
> >   like I did for cmake.bbclass
> 
> No comments? Should I resend without [RFC] tag?
> 
> This is needed to fix couple components when
> conf/distro/include/no-static-libs.inc is used.

I can see the need for it, I'm just not 100% sure I like the form of
the patch. No one particular thing is doing that, just a general
feeling of unease which I can't quite put into words :(.

We continue to have a need to differentiate between "proper" autotools
recipes and non-autotools recipes which would make this kind of issue
easier. I guess I'm trying to weigh up whether we should consider
something a bit more invasive to try and improve things and if we do
that whether this patch helps or hinders that (it probably does help).

I'm also not 100% convinced EXTRA_CONF_PACKAGECONFIG is the right name,
but I can see how you got here and I'm not sure I have a better
suggestion (PACKAGECONFIG_CONFPARAMS? _CONFARGS?)

Cheers,

Richard



