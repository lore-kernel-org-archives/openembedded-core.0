Return-Path: <bruno.bottazzini@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8CD65C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 16:15:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 05 Mar 2015 08:15:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,347,1422950400"; d="scan'208";a="462977764"
Received: from bottazzini-thinkpad-t430.bz.intel.com (HELO [10.218.99.51])
	([10.218.99.51])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Mar 2015 08:08:44 -0800
Message-ID: <1425572096.2831.16.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Anders Darander <anders@chargestorm.se>
Date: Thu, 05 Mar 2015 13:14:56 -0300
In-Reply-To: <20150305142802.GA6833@ad.chargestorm.se>
References: <bruno.bottazzini@intel.com>
	<1425504462-6979-1-git-send-email-bruno.bottazzini@intel.com>
	<1425504462-6979-4-git-send-email-bruno.bottazzini@intel.com>
	<20150305142802.GA6833@ad.chargestorm.se>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] systemd: split modules into packages
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
X-List-Received-Date: Thu, 05 Mar 2015 16:15:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Qui, 2015-03-05 at 15:28 +0100, Anders Darander wrote:
> * Bruno Bottazzini <bruno.bottazzini@intel.com> [150304 22:28]:
> > if one wants to launch a simple deamon, most modules are not
> > required.
> > He will be able to save space and exclude unwanted packages
> > from the final image.
> > ---
> >  meta/recipes-core/systemd/systemd_219.bb | 1071 ++++++++++++++++++++++++++----
> >  1 file changed, 942 insertions(+), 129 deletions(-)
> 
> > diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> > index 6a8b5b8..fd6cf57 100644
> > --- a/meta/recipes-core/systemd/systemd_219.bb
> > +++ b/meta/recipes-core/systemd/systemd_219.bb
> > @@ -56,10 +56,31 @@ LDFLAGS_append_libc-uclibc = " -lrt"
> 
> >  GTKDOC_DOCDIR = "${S}/docs/"
> 
> > -PACKAGECONFIG ??= "xz \
> > +DEPENDS += "curl"
> > +
> > +PACKAGECONFIG ??= "acl \
> > +                   blkid \
> > +                   efi \
> > +                   kmod \
> > +                   gcrypt \
> > +                   lz4 \
> > +                   xz \
> > +                   libidn \
> >                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
> >                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}"
> 
> Just a quick question before I look into the patch in more detail.
> 
> Is the new setting of PACKAGECONFIG consistent with how systemd was
> built previously? I guess it is.

Hi Anders,

it is consistent with how systemd was built previously. If you apply the
patch and bitbake it. Systemd will be built and shipped normally.

But now it will give some options on how to customize it by excluding
packages you don't want to be with systemd.

> 
> Another comment, you should remove the dependcies that gets added using
> PACKAGECONFIG from DEPENDS, e.g. acl etc. (Or are they required
> nevertheless?)

You mean I should do the following ?
- PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
+ PACKAGECONFIG[acl] = "--enable-acl,--disable-acl"

If I get what you said correctly, yes they are required. 

Best Regards,

> 
> Cheers,
> Anders
> 



