Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A893F6FE2A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 15:40:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5DFesvK019481; Fri, 13 Jun 2014 16:40:54 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BL1Uu1Bo1zit; Fri, 13 Jun 2014 16:40:54 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5DFen2W019475
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 13 Jun 2014 16:40:51 +0100
Message-ID: <1402674044.29913.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 13 Jun 2014 16:40:44 +0100
In-Reply-To: <CAP9ODKr_oLKick6wKscWpzq7r88G4ekB1CURxiJ_Oxqe5AJHnA@mail.gmail.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
	<37280175766b34129a22d2602f057511e90263b1.1402552609.git.sgw@linux.intel.com>
	<CAP9ODKobCoJiCmLZ+-JwoZB8hBZdTSn0jX0bbmgFtosWXVJ2WQ@mail.gmail.com>
	<1402646797.12440.477.camel@ted>
	<CAP9ODKr_oLKick6wKscWpzq7r88G4ekB1CURxiJ_Oxqe5AJHnA@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC - WIP v2 01/10] conf-files: New recipe to create single recipe for config files
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
X-List-Received-Date: Fri, 13 Jun 2014 15:41:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-06-13 at 12:30 -0300, Otavio Salvador wrote:
> On Fri, Jun 13, 2014 at 5:06 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2014-06-12 at 10:57 -0300, Otavio Salvador wrote:
> >> On Thu, Jun 12, 2014 at 2:56 AM, Saul Wold <sgw@linux.intel.com> wrote:
> >> > This recipe will create 1 package for config files, we could optionally add
> >> > a bbclass file to ensure consistency with RRECOMMENDS_ = =conf
> >> >
> >> > This is a work in progress, the do_install might even beable to automagically
> >> > generated.  We don't want to create a bbclass for these since it will cause
> >> > the actual recipe/packaging to become machine specific, using this recipe will
> >> > ioslate that.
> >> >
> >> > [YOCTO #4011]
> >> >
> >> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >>
> >> I think the configuration file, nowadays, already made those machine
> >> specific in every BSP which has those overriden so I don't see why use
> >> a single recipe to provide several configuration files.
> >>
> >> I think it will be confusing and this recipe will fast grow.
> >
> > There are a few good reasons to do this.
> >
> > Machine customisation is spread around a whole load of different recipes
> > at the moment and its hard to obtain a good view of what files are
> > available and which ones a BSP author may need to provide.
> >
> > Its rather ugly to have to provide and maintain multiple bbappend files
> > with rather ugly syntax within them. Its also rather inefficient from a
> > build process standpoint to have 15-20 recipes just packaging
> > configuration files.
> >
> > The intent isn't to mandate *every* config file should be in this
> > recipe, you will as now be able to add additional ones. Where we see the
> > same files being added in many layers, adding something common and
> > shared makes sense though.
> >
> > It should in some cases also allow the "core" recipe to stop being
> > machine specific and shared, improving build efficiency. There is little
> > point in a recipe becomming machine specific over a config file.
> >
> > So I'd consider this move a consolation which we can improve over time.
> > For new users I'd suggest that one more common place for the majority of
> > machine specific files would be more understandable too.
> 
> I understand and mostly agree. However I don't want to have a recipe
> with 20 configuration files where I'd need just two.
> 
> So I think we'd need to have a way to 'enable/disable' each
> configuration override. Does it makes sense?

I'd have thought our standard inheritance would apply so that if you
didn't append a machine specific version, the default would be used?

Cheers,

Richard



