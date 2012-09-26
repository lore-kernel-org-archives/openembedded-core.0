Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TGsWM-0002h4-3H for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 16:23:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8QEAYru020381;
	Wed, 26 Sep 2012 15:10:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20063-06; Wed, 26 Sep 2012 15:10:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8QEAQ2D020375
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 26 Sep 2012 15:10:27 +0100
Message-ID: <1348668628.8662.115.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 26 Sep 2012 15:10:28 +0100
In-Reply-To: <20120926135548.GN3313@jama.jama.net>
References: <1348570313-16920-1-git-send-email-Martin.Jansa@gmail.com>
	<1348575933.8662.48.camel@ted> <20120925123652.GI3295@jama.jama.net>
	<1348577188.8662.53.camel@ted> <20120926135548.GN3313@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] linux-yocto: drop machine from SRCREV_FORMAT
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 14:23:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-26 at 15:55 +0200, Martin Jansa wrote:
> On Tue, Sep 25, 2012 at 01:46:28PM +0100, Richard Purdie wrote:
> > On Tue, 2012-09-25 at 14:36 +0200, Martin Jansa wrote:
> > > On Tue, Sep 25, 2012 at 01:25:33PM +0100, Richard Purdie wrote:
> > > > On Tue, 2012-09-25 at 12:51 +0200, Martin Jansa wrote:
> > > > > * otherwise LOCALCOUNT is incremented after each MACHINE switch when 
> > > > >   machine usually has different SRCREV (e.g. because of different KBRANCH)
> > > > > * see http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/029392.html
> > > > > 
> > > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > > ---
> > > > >  meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > index 973970d..6efb578 100644
> > > > > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > @@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE ?= "standard"
> > > > >  # KMETA ?= ""
> > > > >  KBRANCH ?= "master"
> > > > >  KMACHINE ?= "${MACHINE}"
> > > > > -SRCREV_FORMAT ?= "meta_machine" 
> > > > > +SRCREV_FORMAT ?= "meta" 
> > > > >  
> > > > >  LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
> > > > 
> > > > No, absolutely not. I have discussed this with Bruce before and there
> > > > are no guarantees that the meta branch gets updated whenever machine
> > > > changes. This is necessary to have deterministic builds and correctness
> > > > of sstate for example.
> > > 
> > > Isn't SRCREV_FORMAT used only to construct PV? So builds are still
> > > deterministic because SRCREV is still locked to same value?
> > 
> > PV is what triggers the system to rebuild. So if its not included,
> > rebuilds won't happen when the revisions change.
> 
> PR bump too and also sstate checksum change when OEBasicHash is enabled, right?

PR changes will trigger a rebuild, yes. A SRCREV change will not trigger
a sstate change unless some dependency is added from fetch -> SRCREV
though, regardless of which hash system is used.

> > > Also PV which keeps changing without any change in source or metadata
> > > doesn't look deterministic to me.
> > 
> > I agree there is a problem, this is just not the right way to fix it,
> > the problem is elsewhere, likely in the git fetcher. Making the
> > revisions in the sqlite database respect components of STAMP/WORKDIR is
> > probably the way we'll end up having to fix this (so some database
> > entries are machine specific, some arch specific, some allarch).
> 
> I still don't get your point in this case, see bellow:
> 
> Build core-image-minimal
> bitbake -k core-image-minimal
> ...
> NOTE: Tasks Summary: Attempted 1489 tasks of which 1242 didn't need to be rerun and all succeeded.
> 
> Apply:
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index 2f8f957..3380688 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -7,7 +7,7 @@ SRCREV_machine_qemuarm ?= "8f05f1d8adbf1551a80225049dd381ffbb64a6c5"
>  SRCREV_machine_qemumips  ?= "fb23a2ed7b94548b1736fdb55efb26f88bc5c171"
>  SRCREV_machine_qemuppc ?= "cdecf5940d81330680ce1517a7bc101556792e71"
>  SRCREV_machine_qemux86 ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
> -SRCREV_machine_qemux86-64 ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
> +SRCREV_machine_qemux86-64 ?= "00709f7f01c3a10252f030f0bdacecbb349d7be4"
>  SRCREV_machine ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
>  SRCREV_meta ?= "8bdc655034a58a7147176a8a882d81e2fd51e4b9"
> 
> and indeed linux-yocto is rebuilt:
> bitbake -k core-image-minimal
> ...
> NOTE: recipe linux-yocto-3.4.11+git3+5bdc655034a58a7147176a8a882d81e2fd51e4b9-r4.3: task do_fetch: Started
> NOTE: recipe linux-yocto-3.4.11+git3+5bdc655034a58a7147176a8a882d81e2fd51e4b9-r4.3: task do_fetch: Succeeded
> ...
> NOTE: Tasks Summary: Attempted 1489 tasks of which 1456 didn't need to be rerun and all succeeded.
> 
> Because do_validate_branches checksum is different:
> $ bitbake-diffsigs \
>   stamps.1348666953/qemux86-64/qemux86_64-oe-linux/linux-yocto-3.4.11+git3+5bdc655034a58a7147176a8a882d81e2fd51e4b9-r4.3.do_validate_branches.sigdata.8de0c7968171d72ceef34c16693adcdc 
>   stamps.1348667138/qemux86-64/qemux86_64-oe-linux/linux-yocto-3.4.11+git3+5bdc655034a58a7147176a8a882d81e2fd51e4b9-r4.3.do_validate_branches.sigdata.91568475cd863438643fffa047e66e3e
> basehash changed from 7cbacf9af68c92988dbf5e23fc57dafc to aa3c320a8a79614aadf94084c06fe9ba
> Variable SRCREV_machine value changed from 00709f7f01c3a10252f030f0bdacecbb349d7be4 to 3fa06aa29078fdb2af431de2d3fdae7d281ba85f
> 
> So it _does_ trigger rebuild when SRCREV_machine is changed (even without it in SRCREV_FORMAT).
> 
> And if every SRCREV_machine change is accompanied with PR bump or with PR service it will 
> also increment pkg version for target to upgrade it.

So by luck, do_validate_branches changes checksum since it probably
references those variable names explicitly. do_fetch however did not and
should have. That is a serious problem and proves my point. So this
change is not safe and must not go in.

The real problem is in the git fetcher and needs to be fixed there,
anything else is just working around it.

Cheers,

Richard



