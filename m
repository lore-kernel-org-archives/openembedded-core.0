Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6CE4B6CC8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 09:48:28 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 14 Oct 2013 02:48:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,491,1378882800"; d="scan'208";a="307447615"
Received: from unknown (HELO helios.localnet) ([10.252.120.188])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Oct 2013 02:48:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chris Larson <clarson@kergoth.com>,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 14 Oct 2013 10:48:16 +0100
Message-ID: <5784034.W1sd5RUuTd@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CABcZANmgG2Pv-XH+7t=Sd_KRRi=Qp=FXb7pnJLz4tp5aNGxRDA@mail.gmail.com>
References: <alpine.DEB.2.02.1310120713010.21588@oneiric>
	<alpine.DEB.2.02.1310120720030.21659@oneiric>
	<CABcZANmgG2Pv-XH+7t=Sd_KRRi=Qp=FXb7pnJLz4tp5aNGxRDA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: can one add a "packagegroup" simply by adding the recipe file for it?
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
X-List-Received-Date: Mon, 14 Oct 2013 09:48:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 12 October 2013 07:46:02 Chris Larson wrote:
> On Sat, Oct 12, 2013 at 4:24 AM, Robert P. J. Day
> <rpjday@crashcourse.ca>wrote:
> >  wait, i think i might have just answered my own question ... see
> > below ...
> > 
> > On Sat, 12 Oct 2013, Robert P. J. Day wrote:
> > >   just to make sure i'm not missing anything subtle, i know you can
> > > 
> > > add a "packagegroup" to your build using IMAGE_FEATURES, but given
> > > that there are *lots* more packagegroup recipe files in oe-core than
> > > have corresponding PACKAGE_GROUP_* definitions in core-image.bbclass:
> > > 
> > > $ find . -name "packagegroup*bb"
> > > ./recipes-gnome/packagegroups/
> > 
> > packagegroup-core-standalone-gmae-sdk-target.bb
> > 
> > > ./recipes-gnome/packagegroups/packagegroup-toolset-native.bb
> > > ./recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
> > > ./recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
> > > ./recipes-core/packagegroups/packagegroup-cross-canadian.bb
> > > ./recipes-core/packagegroups/packagegroup-core-sdk.bb
> > > ./recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
> > > ./recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> > > ./recipes-core/packagegroups/packagegroup-core-boot.bb
> > > ./recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> > > ./recipes-core/packagegroups/packagegroup-self-hosted.bb
> > > ./recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
> > > ./recipes-core/packagegroups/packagegroup-core-tools-debug.bb
> > > ./recipes-core/packagegroups/packagegroup-core-buildessential.bb
> > > ./recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
> > > ./recipes-core/packagegroups/packagegroup-base.bb
> > > ./recipes-core/packagegroups/packagegroup-core-nfs.bb
> > > ./recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
> > > ./recipes-graphics/packagegroups/packagegroup-core-x11.bb
> > > ./recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
> > > ./recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
> > > ./recipes-graphics/packagegroups/packagegroup-core-clutter.bb
> > > ./recipes-graphics/packagegroups/packagegroup-core-directfb.bb
> > > ./recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
> > > ./recipes-qt/packagegroups/packagegroup-core-qt4e.bb
> > > ./recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
> > > ./recipes-qt/packagegroups/packagegroup-core-qt.bb
> > > ./recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> > > ./recipes-extended/packagegroups/packagegroup-core-lsb.bb
> > > ./recipes-extended/packagegroups/packagegroup-core-basic.bb
> > > $
> > > 
> > > is it accurate to say that you can just as equivalently add the recipe
> > > file directly using, say, CORE_IMAGE_EXTRA_INSTALL? is there any
> > > functional difference between those two approaches?
> > > 
> >   feeling a bit sheepish if this is the answer ... i notice that
> > 
> > core-image.bbclass defines:
> >   PACKAGE_GROUP_nfs-server = "packagegroup-core-nfs-server"
> > 
> > however, while there is no recipe file named
> > "packagegroup-core-nfs-server.bb", there is one named
> > 
> > "packagegroup-core-nfs.bb", which contains:
> >   inherit packagegroup
> >   
> >   PACKAGES = "${PN}-server"
> > 
> > so does defining a PACKAGE_GROUP_* entry in core-image.bbclass allow
> > the packagegroup definition search to examine the internals of a
> > recipe file to check the definition of "PACKAGES" to find a match? as
> > opposed to referring to a recipe file directly
> 
> PACKAGE_GROUP_<some group that can be listed in IMAGE_FEATURES> = "<a list
> of binary packages, just as you'd add to IMAGE_INSTALL or
> CORE_IMAGE_EXTRA_INSTALL yourself>"
> 
> That's all there is to it. packagegroup-core-nfs-server is a binary
> package. PACKAGE_GROUP_nfs-server accepts lists of binary packages, not
> lists of recipes.
> 
> Things got a bit more confusing once tasks got renamed to packagegroups, as
> the pure data driven package grouping mechanism (PACKAGE_GROUP) already
> existed at that time.

Now that PACKAGE_GROUP has finally made it into the manual (for 1.5) we've 
tried to explain that it's not the same thing as a packagegroup. Hopefully it 
will dispel some of the confusion.

We could look at renaming PACKAGE_GROUP to something else in 1.6 (perhaps to 
IMAGE_FEATURE_PACKAGES or something like that?) if people think that it would 
help.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

