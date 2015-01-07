Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 24559729F1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 11:34:11 +0000 (UTC)
Received: from [70.30.87.145] (port=47635 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Y8osJ-0008Fd-9u for openembedded-core@lists.openembedded.org;
	Wed, 07 Jan 2015 06:34:07 -0500
Date: Wed, 7 Jan 2015 06:34:02 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1501070615450.5905@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
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
Subject: summarizing how to create new core images from existing ones [pt 1]
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
X-List-Received-Date: Wed, 07 Jan 2015 11:34:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  for purposes of tutorial, i want to clarify the two ways to create
new core images and maybe submit a couple cleanups later (looking at
all the core-image* recipe files under openembedded).

  first, there's just "require"ing an existing core-image recipe file
and adding some mods. as an example, core-image-minimal-dev.bb
consists trivially of just:

  require core-image-minimal.bb

  DESCRIPTION = "A small image just capable of allowing a device to
  boot and is suitable for development work."

  IMAGE_FEATURES += "dev-pkgs"

as i read it, using this technique, the primary variables you'd
typically set for the new core image recipe (and, really, the
only major ones i've seen) would be:

  * DESCRIPTION = "blah blah"
  * IMAGE_FEATURES += "additional image features"
  * IMAGE_INSTALL += "additional packages"

in addition to those canonical settings, i can see some new recipes
that will simply set specific variables, like this in
core-image-sato-sdk.bb:

  QT4PKG = "qt4-pkgs"
  QT4PKG_mips64 = ""

beyond that, am i missing anything that might show up in a new
core image recipe file defined this way?

  the only curiosity is setting LICENSE in, say, core-image-rt.sdk.bb:

  require recipes-core/images/core-image-minimal.bb
  ... snip ...
  LICENSE = "MIT"

given that the underlying core-image-minimal.bb already sets that
LICENSE variable:

  LICENSE = "MIT"

i'm assuming that variable setting in the new recipe file is
superfluous, yes? the new core image recipe file will strictly inherit
the underlying license, will it not?

  and is there any possibility that a new core image recipe file might
*redefine* the license value of the underlying required file, perhaps
to something more restrictive?

  i think that's it for part 1 ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


