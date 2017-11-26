Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A9EAD608B7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 22:44:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Nov 2017 14:44:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,461,1505804400"; 
   d="scan'208";a="9856581"
Received: from swold-mobl2.jf.intel.com ([10.252.136.108])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2017 14:44:40 -0800
Message-ID: <1511736279.11515.20.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, 
	openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Sun, 26 Nov 2017 14:44:39 -0800
In-Reply-To: <3a0e2cdc-ca8c-07ba-e27d-701e3e4f6154@windriver.com>
References: <20171122184724.21416-1-sgw@linux.intel.com>
	<3a0e2cdc-ca8c-07ba-e27d-701e3e4f6154@windriver.com>
X-Mailer: Evolution 3.24.5 (3.24.5-1.fc26) 
Mime-Version: 1.0
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
X-List-Received-Date: Sun, 26 Nov 2017 22:44:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-11-22 at 15:51 -0500, Bruce Ashfield wrote:
> On 2017-11-22 1:47 PM, Saul Wold wrote:
> > Ensure we have a clean and empty STAGING_KERNEL_BUILDDIR (kernel-
> > build-artifacts)
> > before creating it, otherwise there might be older artifacts from a
> > prior
> > kernel build.
> > 
> 
> What's the actual error that this triggers ? It would be nice to
> log it here in the commit message .. or at least a description
> of the symptoms.
> 
As refered to in the bug, there is not an actual error occurs, but
there are multiple older and non-appropriate (read older) artifacts
remaining in the kernel-build-artifacts directory, just as the commit
message describes.

Sau!

> > [YOCTO #11880]
> > 
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >   meta/classes/kernel.bbclass | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/meta/classes/kernel.bbclass
> > b/meta/classes/kernel.bbclass
> > index 756707a3c25..2a0a7707a14 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -400,6 +400,7 @@ emit_depmod_pkgdata() {
> >   
> >   PACKAGEFUNCS += "emit_depmod_pkgdata"
> >   
> > +do_shared_workdir[cleandirs] += " ${STAGING_KERNEL_BUILDDIR}"
> >   do_shared_workdir () {
> >   	cd ${B}
> >   
> > @@ -655,8 +656,6 @@ kernel_do_deploy() {
> >   		fi
> >   	done
> >   }
> > -do_deploy[cleandirs] = "${DEPLOYDIR}"
> > -do_deploy[dirs] = "${DEPLOYDIR} ${B}"
> 
> This isn't clear to me. Why does cleaning the STAGING_KERNEL_BUILDDIR
> as part of the do_shared_workdir mean that we no longer need the
> clean before the deploy (as well as the deploy dir).
> 
> Bruce
> 
> >   do_deploy[prefuncs] += "package_get_auto_pr"
> >   
> >   addtask deploy after do_populate_sysroot do_packagedata
> > 
> 
> 

