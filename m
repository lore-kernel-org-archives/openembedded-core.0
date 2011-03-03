Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Pv9CB-0005OV-MV
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 15:08:01 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Mar 2011 06:05:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,258,1297065600"; 
	d="scan'208,223";a="608648435"
Received: from unknown (HELO [10.255.17.39]) ([10.255.17.39])
	by orsmga002.jf.intel.com with ESMTP; 03 Mar 2011 06:05:17 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <E900D076-3678-445D-89D2-973EC3A558A8@dominion.thruhere.net>
References: <4D6E7EB1.5080602@windriver.com>
	<41F9E0FC-E0A1-4C7F-8999-3E1B53FDDEE1@dominion.thruhere.net>
	<1299157757.2550.5.camel@scimitar>
	<E900D076-3678-445D-89D2-973EC3A558A8@dominion.thruhere.net>
Date: Thu, 03 Mar 2011 14:05:11 +0000
Message-ID: <1299161111.2550.8.camel@scimitar>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 (2.32.1-1.fc14) 
Subject: Re: oe-core cleanup...
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Mar 2011 14:08:01 -0000
X-Groupsio-MsgNum: 171
Content-Type: multipart/mixed; boundary="=-c/FpSe52PSfsPW+2BkAr"

--=-c/FpSe52PSfsPW+2BkAr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-03 at 14:57 +0100, Koen Kooi wrote:
> Op 3 mrt 2011, om 14:09 heeft Joshua Lock het volgende geschreven:
> 
> > On Thu, 2011-03-03 at 13:46 +0100, Koen Kooi wrote:
> >> Op 2 mrt 2011, om 18:30 heeft Mark Hatle het volgende geschreven:
> >> 
> >>> I finally got a chance to look at the oe-core and where it currently is..  Some
> >>> suggestions below:
> >>> 
> >>> LICENSE file, this may need to be cleaned up to only cover the components
> >>> actually in the oe-core.
> >>> 
> >>> README likely needs some revision
> >>> 
> >>> README.hardware needs a lot of revision.  Anything outside of support for QEMU
> >>> should be removed.
> >> 
> >> Agreed on the above
> >> 
> >>> The meta-demoapps
> >> 
> >> That has a lot of GNOME bits I need, so I would suggest meta-oe, a seperate gnome layer or the easiest way, keep it as a seperate layer, but outside of yocto. I think a GNOME (2) layer would make a lot of sense, but I don't know how many people will be looking after it.
> >> With my beagleboard.org hat on, a full GNOME desktop is one of our deliverables to go on the SD card included with the board at the factory, so sorting out the duplication between the layers for GNOME components would be nice.
> > 
> > I'd be inclined to suggest the separate GNOME layer, though see below
> > for some further thoughts.
> > 
> >> 
> >>> and meta-rt components, will those be staying or going?
> >> 
> >> I don't have a real opinion on that.
> >> 
> >>> The meta/recipes.txt needs to be verified as still what we want -- I assume it
> >>> is at this point..
> >> 
> >> It looks OK to me
> >> 
> >>> meta/recipes-...  sato, qt, gnome, I thought were going elsewhere?
> >> 
> >> See above for GNOME layer, QT is likely a similar case. Layers would also benefit from having their own git repository, but I can see the combinatorial explosion that could bring.
> > 
> > I agree with this in principle, but before we dive into this we need to
> > decide where we draw the line. GNOME and Qt are not comparable. GNOME
> > and KDE are, Gtk+ and Qt are.
> 
> You completely right on that!
> 
> > Where should Gtk+ and Qt live? E.g: if Gtk+ lives in meta-gnome does
> > that mean someone creating a meta-xfce needs to either a) provide their
> > own (copy of the) Gtk+ recipe OR b) depend on the meta-gnome's presence.
> > 
> > I'll accept "We'll cross that bridge when we come to it" as an answer
> > but I at least feel it's worth pointing this out.
> 
> I thought about that as well, but gtk+ is in core, as is glib-2.0 which both gtk+ and QT use. There shouldn't be any other overlay between xfce and gnome. If 2 layers really don't get along we can consider the following:

Whoops, I'd missed that Gtk+ was in core... I guess this is a non-issue
atm then.

> 
> 1) put the overlap in oe-core
> 2) put the overlap in meta-oe
> 3) put the overlap in yet another layer
> 4) duplicate
> 
> All these show that we need more and better tools to deal with layers. At the minimum bitbake should print out warnings about layer issues like bbappend a recipe that doesn't exist.

I agree, in fact yesterday I discovered we have the beginnings of such a
tool (bitbake-layers) written by Chris. Currently it prints out which
recipes are being modified by a .bbappend and .bbappend files for which
no recipe exists.

I had to write a trivial patch (attached) to make it work but it's a
good start. :-)

Cheers,
Joshua
-- 
Joshua Lock
        Intel Open Source Technology Centre

--=-c/FpSe52PSfsPW+2BkAr
Content-Disposition: attachment; filename="bitbake-layers.patch"
Content-Type: text/x-patch; name="bitbake-layers.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From eca003ed03f4fab28d8526d916586534636696a5 Mon Sep 17 00:00:00 2001
From: Joshua Lock <josh@linux.intel.com>
Date: Wed, 2 Mar 2011 17:59:38 +0000
Subject: [PATCH 2/2] bitbake/bitbake-layers: fix to run with recent changes

This patch marks the bitbake-layers script as executable and fixes the
instantiation of the BBCooker to match recent changes in the BitBake
libraries.

I've also added a brief header which demonstrates the intent and usage
as taken from Chris Larson's original commit message.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 bitbake/bin/bitbake-layers |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)
 mode change 100644 => 100755 bitbake/bin/bitbake-layers

diff --git a/bitbake/bin/bitbake-layers b/bitbake/bin/bitbake-layers
old mode 100644
new mode 100755
index ed11e5a..03bda13
--- a/bitbake/bin/bitbake-layers
+++ b/bitbake/bin/bitbake-layers
@@ -1,4 +1,10 @@
-#!/usr/bin/env python2.6
+#!/usr/bin/env python2
+
+# This script has subcommands which operate against your bitbake layers, either
+# displaying useful information, or acting against them.
+# Currently, it only provides a show_appends command, which shows you what
+# bbappends are in effect, and warns you if you have appends which are not being
+# utilized.
 
 import cmd
 import logging
@@ -13,6 +19,7 @@ import bb.cache
 import bb.cooker
 import bb.providers
 from bb.cooker import state
+from bb.server import none
 
 
 logger = logging.getLogger('BitBake')
@@ -38,7 +45,7 @@ class Commands(cmd.Cmd):
         self.returncode = 0
         self.config = Config(parse_only=True)
         self.cooker = bb.cooker.BBCooker(self.config,
-                                         self.register_idle_function)
+                                         bb.server.none)
         self.config_data = self.cooker.configuration.data
         bb.providers.logger.setLevel(logging.ERROR)
         self.prepare_cooker()
-- 
1.7.4


--=-c/FpSe52PSfsPW+2BkAr--
