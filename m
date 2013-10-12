Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB626CF35
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2013 11:24:57 +0000 (UTC)
Received: from [173.34.6.101] (port=60592 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VUxJa-0006HT-Lb for openembedded-core@lists.openembedded.org;
	Sat, 12 Oct 2013 07:24:58 -0400
Date: Sat, 12 Oct 2013 07:24:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.DEB.2.02.1310120713010.21588@oneiric>
Message-ID: <alpine.DEB.2.02.1310120720030.21659@oneiric>
References: <alpine.DEB.2.02.1310120713010.21588@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Sat, 12 Oct 2013 11:24:59 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  wait, i think i might have just answered my own question ... see
below ...

On Sat, 12 Oct 2013, Robert P. J. Day wrote:

>   just to make sure i'm not missing anything subtle, i know you can
> add a "packagegroup" to your build using IMAGE_FEATURES, but given
> that there are *lots* more packagegroup recipe files in oe-core than
> have corresponding PACKAGE_GROUP_* definitions in core-image.bbclass:
>
> $ find . -name "packagegroup*bb"
> ./recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
> ./recipes-gnome/packagegroups/packagegroup-toolset-native.bb
> ./recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
> ./recipes-devtools/packagegroups/packagegroup-core-device-devel.bb
> ./recipes-core/packagegroups/packagegroup-cross-canadian.bb
> ./recipes-core/packagegroups/packagegroup-core-sdk.bb
> ./recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
> ./recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> ./recipes-core/packagegroups/packagegroup-core-boot.bb
> ./recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> ./recipes-core/packagegroups/packagegroup-self-hosted.bb
> ./recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
> ./recipes-core/packagegroups/packagegroup-core-tools-debug.bb
> ./recipes-core/packagegroups/packagegroup-core-buildessential.bb
> ./recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
> ./recipes-core/packagegroups/packagegroup-base.bb
> ./recipes-core/packagegroups/packagegroup-core-nfs.bb
> ./recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
> ./recipes-graphics/packagegroups/packagegroup-core-x11.bb
> ./recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
> ./recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
> ./recipes-graphics/packagegroups/packagegroup-core-clutter.bb
> ./recipes-graphics/packagegroups/packagegroup-core-directfb.bb
> ./recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
> ./recipes-qt/packagegroups/packagegroup-core-qt4e.bb
> ./recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
> ./recipes-qt/packagegroups/packagegroup-core-qt.bb
> ./recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> ./recipes-extended/packagegroups/packagegroup-core-lsb.bb
> ./recipes-extended/packagegroups/packagegroup-core-basic.bb
> $
>
> is it accurate to say that you can just as equivalently add the recipe
> file directly using, say, CORE_IMAGE_EXTRA_INSTALL? is there any
> functional difference between those two approaches?

  feeling a bit sheepish if this is the answer ... i notice that
core-image.bbclass defines:

  PACKAGE_GROUP_nfs-server = "packagegroup-core-nfs-server"

however, while there is no recipe file named
"packagegroup-core-nfs-server.bb", there is one named
"packagegroup-core-nfs.bb", which contains:

  inherit packagegroup

  PACKAGES = "${PN}-server"

so does defining a PACKAGE_GROUP_* entry in core-image.bbclass allow
the packagegroup definition search to examine the internals of a
recipe file to check the definition of "PACKAGES" to find a match? as
opposed to referring to a recipe file directly which must *exactly*
match the name of the recipe file?

  thanks for any clarification.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



