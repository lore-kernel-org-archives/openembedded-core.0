Received: from mx.mailsparr.se ([212.112.184.237])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <johan.hovold@lundinova.se>) id 1Tl1wv-0000nW-F2
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 19:31:29 +0100
Received: from pi (unknown [92.33.14.100])
	by mx.mailsparr.se (Halon Mail Gateway) with ESMTPSA;
	Tue, 18 Dec 2012 19:16:36 +0100 (CET)
Received: from johan by pi with local (Exim 4.80.1) (envelope-from <johan@pi>)
	id 1Tl1iT-0001d9-Hd; Tue, 18 Dec 2012 19:16:33 +0100
From: Johan Hovold <johan.hovold@lundinova.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 19:16:23 +0100
Message-Id: <1355854583-6229-1-git-send-email-johan.hovold@lundinova.se>
X-Mailer: git-send-email 1.8.0.2
Sender: <johan.hovold@lundinova.se>
Subject: [RFC][PATCH] layer.conf: allow BBFILE_PRIORITY to be overriden
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2012 18:31:29 -0000

Use weak assignment for BBFILE_PRIORITY so that it can be overriden
locally in bblayers.conf.

Signed-off-by: Johan Hovold <johan.hovold@lundinova.se>
---

Hi, 

This would allow the layer priorities to be altered locally while still letting
upstream define default priorities for the layers.

In my setup I try to use oe-core over meta-oe whenever possible, but the
default priorities are inversed. Simply pinning the version is not an option
when the same version exists in more than one layer (e.g. udev-182).

Would this be an acceptable way of adding local layer-priority control? Is
there any other way?

Thanks,
Johan

 meta-hob/conf/layer.conf      | 2 +-
 meta-skeleton/conf/layer.conf | 2 +-
 meta/conf/layer.conf          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-hob/conf/layer.conf b/meta-hob/conf/layer.conf
index 5f5eb82..ff43271 100644
--- a/meta-hob/conf/layer.conf
+++ b/meta-hob/conf/layer.conf
@@ -6,4 +6,4 @@ BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb"
 
 BBFILE_COLLECTIONS += "hob"
 BBFILE_PATTERN_hob := "^${LAYERDIR}/"
-BBFILE_PRIORITY_hob = "1"
+BBFILE_PRIORITY_hob ?= "1"
diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
index edb31dd..977fb75 100644
--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -6,5 +6,5 @@ BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb"
 
 BBFILE_COLLECTIONS += "skeleton"
 BBFILE_PATTERN_skeleton := "^${LAYERDIR}/"
-BBFILE_PRIORITY_skeleton = "1"
+BBFILE_PRIORITY_skeleton ?= "1"
 
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 78ceae9..d5b3f94 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -5,7 +5,7 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb"
 
 BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core := "^${LAYERDIR}/"
-BBFILE_PRIORITY_core = "5"
+BBFILE_PRIORITY_core ?= "5"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-- 
1.8.0.2



