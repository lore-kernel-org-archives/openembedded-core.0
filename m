Return-Path: <amarnath.valluri@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4183478301
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 19:22:22 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 12:22:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,339,1493708400"; d="scan'208";a="97605638"
Received: from amolonie-mobl1.ger.corp.intel.com (HELO avalluri-ubook)
	([10.252.0.207])
	by orsmga004.jf.intel.com with ESMTP; 13 Jun 2017 12:22:22 -0700
Message-ID: <1497381935.9691.2.camel@intel.com>
From: Amarnath Valluri <amarnath.valluri@intel.com>
Reply-To: amarnath.valluri@intel.com
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Tue, 13 Jun 2017 22:25:35 +0300
In-Reply-To: <288f60b6952d42c6b8e80819dfe90571@XBOX02.axis.com>
References: <5b5d7bf2edde4d1a9bcffe8c9e6c6644@XBOX02.axis.com>
	<1497360213-27709-1-git-send-email-amarnath.valluri@intel.com>
	<288f60b6952d42c6b8e80819dfe90571@XBOX02.axis.com>
Organization: Intel
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 7/8] image: create symlinks needed for merged /usr
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
X-List-Received-Date: Tue, 13 Jun 2017 19:22:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-06-13 at 14:16 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Amarnath Valluri
> > Sent: den 13 juni 2017 15:24
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH v4 7/8] image: create symlinks needed for
> > merged /usr
> > 
> > Prepare the symlinks required for merged /usr at the time of rootfs
> > creation.
> > 
> > The links created in rootfs are:
> > /bin --> /usr/sbin
> > /sbin --> /usr/sbin
> > /lib --> /usr/lib
> > /lib64 --> /usr/lib64
> > 
> > We cannot make these symlinks as part of 'base-files' or some other
> > package.
> > Because at rootfs creation, installation of the package(say kernel)
> > that depends
> > on these root folders/links fails, if package manager installs this
> > package
> > prior to base-files.
> > 
> > These symbolic links in top level folder should be present as long as
> >  - kernel tools use /lib/{module,firmware}
> >  - shell scripts uses "#!/bin/sh"
> > 
> > Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> > ---
> >  meta/classes/image.bbclass | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index 85f6b9a..2a3c1e3 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -617,3 +617,24 @@ do_bundle_initramfs () {
> >  	:
> >  }
> >  addtask bundle_initramfs after do_image_complete
> > +
> > +# Prepare the root links to point to the /usr counterparts.
> > +create_merged_usr_symlinks() {
> > +    install -d ${IMAGE_ROOTFS}${base_bindir} ${IMAGE_ROOTFS}${base_sbindir} ${IMAGE_ROOTFS}${base_libdir}
> > +    lnr ${IMAGE_ROOTFS}${base_bindir} ${IMAGE_ROOTFS}/bin
> > +    lnr ${IMAGE_ROOTFS}${base_sbindir} ${IMAGE_ROOTFS}/sbin
> > +    lnr ${IMAGE_ROOTFS}${base_libdir} ${IMAGE_ROOTFS}/${baselib}
> 
> You missed one. Change "/${baselib}" to "${baselib}".
${baselib} is not directory path and does not prefix with '/' unlike
${base_libdir}, so its valid here.

- Amarnath


