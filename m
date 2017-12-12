Return-Path: <sgw@linux.intel.com>
X-Greylist: delayed 573 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Dec 2017 15:21:47 UTC
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id C41EA719A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 15:21:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Dec 2017 07:12:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,395,1508828400"; d="scan'208";a="17609829"
Received: from swold-mobl2.jf.intel.com ([10.254.41.228])
	by orsmga002.jf.intel.com with ESMTP; 12 Dec 2017 07:12:15 -0800
Message-ID: <1513091535.24181.82.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Dec 2017 07:12:15 -0800
In-Reply-To: <CAJTo0LYhgbpRWEB6pjvBdtf1Qo1Sg8tqx8UherUfg2MsVFxyhg@mail.gmail.com>
References: <20171205230006.22740-1-sgw@linux.intel.com>
	<CAJTo0LYhgbpRWEB6pjvBdtf1Qo1Sg8tqx8UherUfg2MsVFxyhg@mail.gmail.com>
X-Mailer: Evolution 3.24.6 (3.24.6-1.fc26) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: Use full mrproper to clean
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
X-List-Received-Date: Tue, 12 Dec 2017 15:21:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-12-12 at 11:57 +0000, Burton, Ross wrote:
> This breaks some of the sanity tests, which build a kernel module:
> 
> https://autobuilder.yocto.io/builders/nightly-x86-64/builds/664
> 
Interesting, I did a local build of a kernel module as well as a full
build of the kernel with out failure, I will investigate the oe-
selftest failure.

Sau!

> Ross
> 
> On 5 December 2017 at 23:00, Saul Wold <sgw@linux.intel.com> wrote:
> > By using the full mrproper clean target it also removes some
> > generated files
> > that are not required on the target to build. It also helps to fix
> > reprodudible
> > builds as the generated files could have different permissions
> > causing the
> > check to fail.
> > 
> > Tested with building and booting kernel from source on the target
> > 
> > [YOCTO #12137]
> > 
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >  meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> > b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > index c1b5b7786d7..d925a33aeb1 100644
> > --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> > +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > @@ -52,7 +52,7 @@ do_install() {
> >          # The main build artifacts. We clean the directory to
> > avoid QA errors on mismatched
> >          # architecture (since scripts and helpers are native
> > format).
> >          KBUILD_OUTPUT="$kerneldir"
> > -        oe_runmake -C $kerneldir CC="${KERNEL_CC}"
> > LD="${KERNEL_LD}" clean _mrproper_scripts
> > +        oe_runmake -C $kerneldir CC="${KERNEL_CC}"
> > LD="${KERNEL_LD}" clean mrproper
> >          # make clean generates an absolute path symlink called
> > "source"
> >          # in $kerneldir points to $kerneldir, which doesn't make
> > any
> >          # sense, so remove it.
> > --
> > 2.13.6
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 

