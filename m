Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6D866609B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 08:12:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5L8ITkA014468; Fri, 21 Jun 2013 09:18:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3Ie1tmvVKFha; Fri, 21 Jun 2013 09:18:29 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5L8IOu5014458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 21 Jun 2013 09:18:26 +0100
Message-ID: <1371802316.20823.286.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 21 Jun 2013 09:11:56 +0100
In-Reply-To: <CAP9ODKoKYJ+nzTjPoNCdFA9OxEDpTzmeNiEUb7HChgvYEv0irQ@mail.gmail.com>
References: <CAPhnLPBBK1=GohMDVCSGseg=DWn_Ac32p+UjjbGff585rWTG_w@mail.gmail.com>
	<CAP9ODKoKYJ+nzTjPoNCdFA9OxEDpTzmeNiEUb7HChgvYEv0irQ@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Utilizing LAYERVERSION_ to identify breaking changes to a layer
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
X-List-Received-Date: Fri, 21 Jun 2013 08:12:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-06-20 at 21:33 -0300, Otavio Salvador wrote:
> On Thu, Jun 20, 2013 at 7:56 PM, Flanagan, Elizabeth
> <elizabeth.flanagan@intel.com> wrote:
> > I know I've run into this issue and I'm going to bet that other folks
> > have as well.
> >
> > When running some sort of continuous integration system (in my case,
> > yocto-autobuilder), I need to build to at least two releases back. The
> > problem is, sometimes, local.conf and bblayers.conf requirements
> > change, for example, a layer needs a BBMASK for the prior release but
> > can't have it for the current one or a layer gets split so that I need
> > to add two directories to BBLAYERS as opposed to just the one that I
> > used a few commits back. I currently have no great way of figuring
> > that out and it has causes immense amounts of pain.
> 
> I am sorry but I didn't follow what it will help. Can you please
> provide an example?
> 
> I always thought the right way to handle it is to have a branch...

In the autobuilder there is information about what it builds, lets say
that it should build "core image-sato". Sometimes we do
add/remove/rename or otherwise change things (e.g. we might drop
meta-toolchain now the -c populate_sdk target works for images).

What is being proposed here is that we should start using the layer
version information to allow the autobuilder to have a better idea of
what to run when.

LAYERVERSION_core already exists for other reasons and this would seem a
logical extension to it. If we're worried about the major version
changes being a problem, we could use a MAJOR.minor type scheme which
would still give the autobuilder the information it needs.

The aitobuilder can then look at the version and run "bitbake
meta-toolchain" in one case but populate_sdk for later versions, or
whatever.

Cheers,

Richard




