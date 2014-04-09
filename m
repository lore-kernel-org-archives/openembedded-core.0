Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C38FD65DB9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Apr 2014 10:08:30 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s39A8FSK026609; Wed, 9 Apr 2014 11:08:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id H90eLXZ9Nlcn; Wed,  9 Apr 2014 11:08:25 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s39A8IZ7026598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 9 Apr 2014 11:08:20 +0100
Message-ID: <1397038093.24597.140.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ming Liu <ming.liu@windriver.com>
Date: Wed, 09 Apr 2014 11:08:13 +0100
In-Reply-To: <53451A86.3020308@windriver.com>
References: <1396870039-26834-1-git-send-email-ming.liu@windriver.com>
	<1396870039-26834-3-git-send-email-ming.liu@windriver.com>
	<1396870587.24597.35.camel@ted> <53435E81.9060308@windriver.com>
	<1396951390.24597.88.camel@ted> <5344EB93.1070209@windriver.com>
	<1397036562.24597.139.camel@ted> <53451A86.3020308@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] binconfig.bbclass: fix multilib file conflicts
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
X-List-Received-Date: Wed, 09 Apr 2014 10:08:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-04-09 at 18:01 +0800, Ming Liu wrote:
> On 04/09/2014 05:42 PM, Richard Purdie wrote:
> > On Wed, 2014-04-09 at 14:41 +0800, Ming Liu wrote:
> >> On 04/08/2014 06:03 PM, Richard Purdie wrote:
> >>> On Tue, 2014-04-08 at 10:27 +0800, Ming Liu wrote:
> >>>> On 04/07/2014 07:36 PM, Richard Purdie wrote:
> >>>>> On Mon, 2014-04-07 at 19:27 +0800, Ming Liu wrote:
> >>>>>> In most cases binconfig files conflict among multilib packages, to avoid
> >>>>>> that, use update-alternatives link *-config from real path with a
> >>>>>> PACKAGE_ARCH suffix.
> >>>>>>
> >>>>>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> >>>>>> ---
> >>>>>>     meta/classes/binconfig.bbclass | 65 ++++++++++++++++++++++++++++++++++++------
> >>>>>>     1 file changed, 56 insertions(+), 9 deletions(-)
> >>>>> This isn't going in, its complex and supports a minority use case.
> >>>>> binconfig should be dying out, not being extended and shored up like
> >>>>> this.
> >>>>>
> >>>>> I'd also add this patch is buggy, its pure luck that update-alternatives
> >>>>> is available at rootfs generation time since its not in a visible
> >>>>> dependency.
> >>>>>
> >>>>> So going forward I'd like to see patches which simply delete binconfig
> >>>>> scripts. Where there isn't a .pc alternative we should be adding them
> >>>>> and pushing them upstream.
> >>>> Did you mean we'd better remove all *-config scripts, insteaded by
> >>>> providing .pc files, and send the changes to all upstreams providing and
> >>>> using *-config? That seems a huge work and we need co-operate with a lot
> >>>> of projects.
> >>> Basically, yes, that is what I mean. I might be wrong but I don't think
> >>> there are that many projects which don't ship .pc files now and just
> >>> have a binconfig as a backup.
> >> Yes, I also noticed that many of them are providing .pc files as well as
> >> binconfig as a backup, so I think there must be reasons binconfig
> >> remained in their projects, that might be for compliable considering,
> >> so I am not sure they would like to remove them from their projects, but
> >> I can try to ping them. Nevertheless, the conflicts still exist, we just
> >> leave them here so far?
> > I'm thinking we should start deleting the -config files at do_install
> > time where we know a good .pc file exists and remove the binconfig
> > inherit. If this causes any problem in software using the package, we
> > should fix those to use pkgconfig.
> >
> > Over time the conflicts will stop existing since the binconfig class
> > will not be used anywhere.
> Yes, that's a feasible solution, but it needs a lot of testing works, 
> unfortunately, I am a little busy with my daily work recently and cant 
> handle it parallelly, so I'd like to file a bug in Yocto, see if anybody 
> like to take it, or I will do it when I can tear myself away from work 
> later.

Agreed, I'm not asking you personally to do all of this, just suggesting
that ultimately this is the route we need to take.

Cheers,

Richard


