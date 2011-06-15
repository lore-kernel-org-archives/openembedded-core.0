Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWseI-0007iO-1v
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 18:08:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Jun 2011 09:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,370,1304319600"; d="scan'208";a="13238355"
Received: from unknown (HELO [10.255.13.50]) ([10.255.13.50])
	by azsmga001.ch.intel.com with ESMTP; 15 Jun 2011 09:05:29 -0700
Message-ID: <4DF8D848.9000605@linux.intel.com>
Date: Wed, 15 Jun 2011 09:05:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] DISTRO_MIRRORS / DISTRO_PREMIRRORS
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
X-List-Received-Date: Wed, 15 Jun 2011 16:08:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Folks,

Recently we have seen a number of fetch failures, due to upstream sites 
being down or deprecated (tinylogin, pscmic and others).

The issue is that oe-core as a non-distro does not have a default set of 
mirrors, which causes the fetcher to fail as there is no fall-back 
mirror to distrubte the source code.

As has been pointed out, different projects and distributions (Yocto 
Project and Angstrom) both have upstream source mirrors which could be 
used. Currently the Yocto Project defines it's MIRRORS and PREMIRRORS in 
meta-yocto/conf/distro/poky.conf.

I propose that we add a list of DISTO_MIRRORS and DISTRO_PREMIRRORS with 
default settings pointing to the current autobuilder.yoctoproject.org 
source site.  These would be added to the mirrors.bbclass, so that 
oe-core will have a default set of mirrors that can be overridden by a 
distro or layer.

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 2146087..a52c6d5 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -1,4 +1,22 @@
+DISTRO_PREMIRRORS ?= "\
+bzr://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
+cvs://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
+git://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
+hg://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n \
+osc://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
+p4://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n \
+svk://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
+svn://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n"
+
+PREMIRRORS += "${DISTRO_PREMIRRORS}"
+
+DISTRO_MIRRORS ?= "\
+ftp://.*/.*      http://autobuilder.yoctoproject.org/sources/ \n \
+http://.*/.*     http://autobuilder.yoctoproject.org/sources/ \n \
+https://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n"
+
  MIRRORS += "\
+${DISTRO_MIRRORS} \
  ${DEBIAN_MIRROR}/main  http://snapshot.debian.net/archive/pool \n \
  ${DEBIAN_MIRROR}       ftp://ftp.de.debian.org/debian/pool \n \
  ${DEBIAN_MIRROR}       ftp://ftp.au.debian.org/debian/pool \n \

Thoughts, ACKs, NAKs??


--
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System



