Return-Path: <mac@mcrowe.com>
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id 9A1A860291
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 18:21:45 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout05 with smtp
	id kJMj1u0040BmcFC01JMkw2; Mon, 13 Feb 2017 18:21:44 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=Hr8GIwbS c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=IkcTkHD0fZMA:10 a=n2v9WMKugxEA:10 a=-An2I_7KAAAA:8 a=mDV3o1hIAAAA:8
	a=u5TeresQ_fhQvVkEcVAA:9 a=QEXdDO2ut3YA:10 a=Sq34B_EcNBM9_nrAYB9S:22
	a=_FVE-zBwftR9WsbkzFJk:22
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>)
	id 1cdLFv-0006DA-AL; Mon, 13 Feb 2017 18:21:43 +0000
Date: Mon, 13 Feb 2017 18:21:43 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170213182143.GA23802@mcrowe.com>
References: <20170213124142.17081-1-mac@mcrowe.com>
	<CAMKF1sqa-TunzUMu_ZsHftcj=XdZpk9q_bctT=Y2wYmTRfDKOw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqa-TunzUMu_ZsHftcj=XdZpk9q_bctT=Y2wYmTRfDKOw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: Attempt to work around do_image_complete race
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
X-List-Received-Date: Mon, 13 Feb 2017 18:21:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Monday 13 February 2017 at 09:38:04 -0800, Khem Raj wrote:
> On Mon, Feb 13, 2017 at 4:41 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > If two do_image_complete tasks run in parallel they risk both trying to put
> > their image into ${DEPLOY_DIR_IMAGE} at the same time. Both will contain a
> > README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt file. In theory this
> > should be safe because "cp -alf" will just cause one to overwrite the
> > other. Unfortunately, coreutils cp also has a race which means that if one
> > copy creates the file at just the wrong point the other will fail with:
> >
> >  cp: cannot create hard link ‘..../tmp-glibc/deploy/images/pantera/README_-_DO_NOT_DELETE_FILES_IN_THIS_D.txt’ to ‘..../tmp-glibc/work/rage_against-oe-linux-gnueabi/my-own-image/1.0-r0/deploy-my-own-image-complete/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt’: File exists
> >
> > The coreutils bug has been reported and fixed upstream as
> > https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25680 , but it will take
> > a while for host distributions to catch up.
> >
> > In the meantime, let's try and avoid the race altogether by causing
> > sstate.bbclass:sstate_install to take a lock file in
> > ${DEPLOY_DIR_IMAGE} whilst writing. This lock is probably a bit broad,
> > but it's better than the build failing.
> >
> 
> will this lock serialize writing other files too ? then this will slow
> down parallel builds. Perhaps, writing common files can be spun into a
> task of its own which is then common 1 task across all images building
> in parallel.

That sounds like a great idea.

Or, we could just lose the common README file altogether. :)

Mike.

