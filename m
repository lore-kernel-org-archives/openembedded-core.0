Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EC6AC72F2A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 13:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v29D29Uh020155; Thu, 9 Mar 2017 13:03:43 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xObgh84VDqZx; Thu,  9 Mar 2017 13:03:43 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v29D3cnh020235
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 9 Mar 2017 13:03:39 GMT
Message-ID: <1489064618.22968.106.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Thu, 09 Mar 2017 13:03:38 +0000
In-Reply-To: <CAJTo0LZeOiwCJzMdeSCkHuj9mfHBbjwCAKZkeAsbziHBaVhmMg@mail.gmail.com>
References: <1488993907-13037-1-git-send-email-ross.burton@intel.com>
	<CAJTo0LZeOiwCJzMdeSCkHuj9mfHBbjwCAKZkeAsbziHBaVhmMg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] classes: add gitupstream class
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
X-List-Received-Date: Thu, 09 Mar 2017 13:03:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-03-09 at 12:38 +0000, Burton, Ross wrote:
> 
> On 8 March 2017 at 17:25, Ross Burton <ross.burton@intel.com> wrote:
> > +    d.setVar("S", "${WORKDIR}/git")
> > +        d.setVar("PV", pv + "+git${SRCPV}")
> > 
> I guess these are the only two lines which are git-specific.  Would
> it be sensible to be VCS-agnostic and simply look at the protocol of
> the first entry in SRC_URI?
> 
> So if someone had:
> 
> BBCLASSEXTEND="devupstream:target"
> SRC_URI_class-devupstream = "svn://some/svn/url"
> 
> You'd get:
> 
> S=${WORKDIR}/svn
> PV=${PV}+svn${SRCPV}
> 
> Annoyingly that breaks current behaviour as svn checkouts use the
> module name, whereas git clones just use "git" (and I can't remember
> why that is). The class could look at the SRC_URI further: for git
> set SRC_URI to WORKDIR/git, for svn set WORKDIR/{module name}.  Also
> current practise is +svnr{SRCPV} not +svn, so that could either be
> special-cased again or ignored.
> 
> Thoughts?  I don't want something to be merged which we rewrite in a
> months' time...

I worry that making it support generic scms may make it fragile and
hard to extend if we do end up needing to do scm specific work in here
so I'm torn. Having a class per scm would also be annoying...

Cheers,

Richard

