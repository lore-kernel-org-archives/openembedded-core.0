Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Si4G8-0003Qk-9q for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 15:50:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5MDe1UZ001893
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 14:40:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01132-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 14:39:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5MDdrvo001887
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 14:39:54 +0100
Message-ID: <1340372395.394.35.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jun 2012 14:39:55 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] layer.conf/bblayers.conf.sample: Fix empth BBPATH entry warnings
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
X-List-Received-Date: Fri, 22 Jun 2012 13:50:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Many people are seeing issues from the empty path warnings from BBPATH.
The empty path entry corresponding to the current working directory is a
problem since if cwd changes, so does BBPATH and build reproducibility.

Simply removing the empty element causes problems since the build
directory then isn't listed in BBPATH which means local.conf isn't found
and this gives an extremely confusing error message about bbappends
being unsatisfied.

The build directory in bitbake terms is TOPDIR. The correct way to fix
things is to add in TOPDIR into bblayers.conf itself. This means the
layers can happily append/prepend to BBPATH at will as its no longer
empty hence neatly solving all the various problems. Since the file has
changed, the version is also changed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

---
 meta/conf/bblayers.conf.sample |    4 +++-
 meta/conf/layer.conf           |    1 -
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bblayers.conf.sample b/meta/conf/bblayers.conf.sample
index 222b03a..e621866 100644
--- a/meta/conf/bblayers.conf.sample
+++ b/meta/conf/bblayers.conf.sample
@@ -1,8 +1,10 @@
 # LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
 # changes incompatibly
-LCONF_VERSION = "4"
+LCONF_VERSION = "5"
 
+BBPATH = "${TOPDIR}"
 BBFILES ?= ""
+
 BBLAYERS ?= " \
   ##COREBASE##/meta \
   "
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 43e4295..090c8e2 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -1,4 +1,3 @@
-BBPATH ?= ""
 # We have a conf and classes directory, add to BBPATH
 BBPATH .= ":${LAYERDIR}"
 # We have a packages directory, add to BBFILES



