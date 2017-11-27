Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3D71F783BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 18:38:32 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2017 10:38:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,465,1505804400"; d="scan'208";a="178386392"
Received: from swold-mobl2.jf.intel.com ([10.254.95.206])
	by orsmga005.jf.intel.com with ESMTP; 27 Nov 2017 10:38:34 -0800
Message-ID: <1511807913.2714.6.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Nov 2017 10:38:33 -0800
In-Reply-To: <CADkTA4PgddGafbwcYYd=KyVyra8UMD91tFWCtRc3KNUZ_9=Gzg@mail.gmail.com>
References: <20171122184724.21416-1-sgw@linux.intel.com>
	<3a0e2cdc-ca8c-07ba-e27d-701e3e4f6154@windriver.com>
	<1511736279.11515.20.camel@linux.intel.com>
	<CADkTA4P98ysLwQ6nqpQGy940SLJ-aLRFs9QWMv4gKdkHN-+5ag@mail.gmail.com>
	<CADkTA4PgddGafbwcYYd=KyVyra8UMD91tFWCtRc3KNUZ_9=Gzg@mail.gmail.com>
X-Mailer: Evolution 3.24.6 (3.24.6-1.fc26) 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Add cleandirs for do_shared_workdir
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
X-List-Received-Date: Mon, 27 Nov 2017 18:38:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-11-27 at 08:35 -0500, Bruce Ashfield wrote:
> 
> 
> On Sun, Nov 26, 2017 at 11:52 PM, Bruce Ashfield <bruce.ashfield@gmai
> l.com> wrote:
> > 
> > On Sun, Nov 26, 2017 at 5:44 PM, Saul Wold <sgw@linux.intel.com>
> > wrote:
> > > On Wed, 2017-11-22 at 15:51 -0500, Bruce Ashfield wrote:
> > > > On 2017-11-22 1:47 PM, Saul Wold wrote:
> > > > > Ensure we have a clean and empty STAGING_KERNEL_BUILDDIR
> > > (kernel-
> > > > > build-artifacts)
> > > > > before creating it, otherwise there might be older artifacts
> > > from a
> > > > > prior
> > > > > kernel build.
> > > > >
> > > >
> > > > What's the actual error that this triggers ? It would be nice
> > > to
> > > > log it here in the commit message .. or at least a description
> > > > of the symptoms.
> > > >
> > > As refered to in the bug, there is not an actual error occurs,
> > > but
> > > there are multiple older and non-appropriate (read older)
> > > artifacts
> > > remaining in the kernel-build-artifacts directory, just as the
> > > commit
> > > message describes.
> > 
> > Quoting a bug isn't useful .. everything that someone needs to
> > know 
> > *must* be in a commit message. I'm not clicking through later on
> > when doing a 'git whatchanged', and I may not even be online at
> > that time .. so that bug reference just isn't useful.
> > 
> > So the old artifacts remain .. is it a disk usage question ? Is it
> > a possible
> > confusion when inspecting a build ? .. All that the message does is
> > describe the change, not the why.
> > 
> > 
> 
> I should have highlighted my real question, change log semantics and
> nitpicking are just noise :D See below in the double quoted reply.
>  
Sorry, I missed the real question!


> > Bruce
> > 
> >  
> > > Sau!
> > > 
> > > > > [YOCTO #11880]
> > > > >
> > > > > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > > > > ---
> > > > >   meta/classes/kernel.bbclass | 3 +--
> > > > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/meta/classes/kernel.bbclass
> > > > > b/meta/classes/kernel.bbclass
> > > > > index 756707a3c25..2a0a7707a14 100644
> > > > > --- a/meta/classes/kernel.bbclass
> > > > > +++ b/meta/classes/kernel.bbclass
> > > > > @@ -400,6 +400,7 @@ emit_depmod_pkgdata() {
> > > > >
> > > > >   PACKAGEFUNCS += "emit_depmod_pkgdata"
> > > > >
> > > > > +do_shared_workdir[cleandirs] += "
> > > ${STAGING_KERNEL_BUILDDIR}"
> > > > >   do_shared_workdir () {
> > > > >     cd ${B}
> > > > >
> > > > > @@ -655,8 +656,6 @@ kernel_do_deploy() {
> > > > >             fi
> > > > >     done
> > > > >   }
> > > > > -do_deploy[cleandirs] = "${DEPLOYDIR}"
> > > > > -do_deploy[dirs] = "${DEPLOYDIR} ${B}"
> > > >
> > > > This isn't clear to me. Why does cleaning the
> > > STAGING_KERNEL_BUILDDIR
> > > > as part of the do_shared_workdir mean that we no longer need
> > > the
> > > > clean before the deploy (as well as the deploy dir).
> > > >
> 
> 
> It was this that was the real part of the question. The removal of
> these cleandirs
> didn't seem to be directly replaced by the new method. Is it that the
> DEPLOYDIR
> and STAGING_KERNEL_BUILDDIR are the same thing ?
> 
Yeah, oops, those where not meant to be removed, not sure what happened
or why I missed it on review.

Sau!

> Bruce
>  
> > > > Bruce
> > > >
> > > > >   do_deploy[prefuncs] += "package_get_auto_pr"
> > > > >
> > > > >   addtask deploy after do_populate_sysroot do_packagedata
> > > > >
> > > >
> > > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 
> > 
> > 
> > -- 
> > "Thou shalt not follow the NULL pointer, for chaos and madness
> > await thee at its end"
> 
> 
> 

