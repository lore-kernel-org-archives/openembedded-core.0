Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1E871951
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 04:55:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 28 Apr 2016 21:56:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,550,1455004800"; d="scan'208";a="942620776"
Received: from ychia3-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.143.114])
	by orsmga001.jf.intel.com with ESMTP; 28 Apr 2016 21:55:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanevskiy <kad@kad.name>, Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Fri, 29 Apr 2016 16:55:55 +1200
Message-ID: <9947705.d0hNahSzfP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.7-300.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <CANFkWpnEAFoBRf=oAnKLUasuVhxDgoYswk_o0s3HFT-4W8yiMw@mail.gmail.com>
References: <cover.1461749328.git.ed.bartosh@linux.intel.com>
	<c32880f5e89776d3515079d6c8ebe86111cb10ed.1461749328.git.ed.bartosh@linux.intel.com>
	<CANFkWpnEAFoBRf=oAnKLUasuVhxDgoYswk_o0s3HFT-4W8yiMw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/3] bmap-tools: initial commit, version 3.2
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
X-List-Received-Date: Fri, 29 Apr 2016 04:56:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 29 Apr 2016 01:07:56 Alexander Kanevskiy wrote:
> On Wed, Apr 27, 2016 at 12:36 PM, Ed Bartosh <ed.bartosh@linux.intel.com>
> 
> wrote:
> > Bmap-tools - tools to generate block map (AKA bmap) and flash images
> > using bmap. Bmaptool is a generic tool for creating the block map
> > (bmap) for a file and copying files using the block map.
> > 
> > The idea is that large file containing unused blocks, like raw system
> > image files, can be copied or flashed a lot faster with bmaptool than
> > with traditional tools like "dd" or "cp".
> > 
> > [YOCTO #9414]
> > 
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > ---
> > 
> >  meta/recipes-support/bmap-tools/bmap-tools_3.2.bb | 24
> > 
> > +++++++++++++++++++++++
> > 
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
> > 
> > diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
> > b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
> > new file mode 100644
> > index 0000000..e10f5fd
> > --- /dev/null
> > +++ b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
> > @@ -0,0 +1,24 @@
> > +SUMMARY = "Tools to generate block map (AKA bmap) and flash images using
> > bmap"
> > +DESCRIPTION = "Bmap-tools - tools to generate block map (AKA bmap) and
> > flash images using \
> > +bmap. Bmaptool is a generic tool for creating the block map (bmap) for a
> > file, \
> > +and copying files using the block map. The idea is that large file
> > containing \
> > +unused blocks, like raw system image files, can be copied or flashed a
> > lot \
> > +faster with bmaptool than with traditional tools like "dd" or "cp"."
> > +HOMEPAGE = "http://git.infradead.org/users/dedekind/bmap-tools.git"
> > +SECTION = "console/utils"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > +
> > +SRC_URI = "ftp://ftp.infradead.org/pub/${BPN}/${BPN}-${PV}.tgz"
> > +SRC_URI[md5sum] = "92cdad1cb4dfa0cca7176c8e22752616"
> > +SRC_URI[sha256sum] =
> > "cc6c7f7dc0a37e2a32deb127308e24e6c4b80bfb54f3803c308efab02bf2d434"
> > +
> > +RDEPENDS_${PN} = "python-core python-compression"
> > +
> > +inherit setuptools
> > +
> > +BBCLASSEXTEND = "native"
> > +
> > +do_install_append_class-native() {
> > +    sed -i -e 's|^#!.*/usr/bin/env python|#! /usr/bin/env nativepython|'
> > ${D}${bindir}/bmaptool
> > +}
> 
> better to use recipe that would create in deploy/tools standalone version
> of the tool.
> Otherwise, there is no easy way for user to utilize generated bmap files.

You both probably have had notification already, but just to close the loop I 
found the issue with the do_deploy version, see the comments on bug 9414:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=9414

Cheers,
Paul

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

