Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIcNM-0006sR-D2
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 09:56:32 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so1799429pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2011 00:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=OVq9u6rYd6umTygJwWMGeYmAlHSIlnB8m67/B9B7T8w=;
	b=OfrNjWrACFS6qUjJ6dGrg2gBDgY4f9siso4RuxjZJWrN3TBejSjoNxdqSi5hEXK1ay
	+RcDAv5RokYMwmaV60UWNkIDZB+U/5fZ/RaInS6c0VerKdWUbACFvtO7FxC8xI6npanj
	2PlCkOvIfq7KAI8f9Y3pK72xGlR5AkF7jEv5g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VDDD4Zga7DrPIg63el4/yHosTzRiOu6ubWt6E5ilufWJnJeG9A5e1pz2vVqHNet7sg
	42js7z2SwEOwLxmVcig1LAezZMtQ67vV4EzpFt43oxIDN+4H/rMPrzO7887EmjQi5v85
	LO3WhSkK+7IIEaNNteqngNNJJ4Q2+jP4Y4bog=
Received: by 10.68.59.228 with SMTP id c4mr6040555pbr.520.1304754832588;
	Sat, 07 May 2011 00:53:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id t4sm2676911pbl.45.2011.05.07.00.53.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 00:53:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat,  7 May 2011 00:53:48 -0700
Message-Id: <2bd1ade80a799c7b90fc6db9b3e1138234c5651a.1304754527.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1304754527.git.raj.khem@gmail.com>
References: <cover.1304754527.git.raj.khem@gmail.com>
Subject: [PATCH 4/8] conf/layer.conf: Use .= to append to BBPATH and =+ for BBFILES
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
X-List-Received-Date: Sat, 07 May 2011 07:56:32 -0000

Appending to BBPATH gives a definite order to BBLAYERS which
means paths are preferred in order from left to right.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/layer.conf |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 5287417..10a6948 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -1,9 +1,16 @@
 BBPATH ?= ""
 # We have a conf and classes directory, add to BBPATH
-BBPATH := "${BBPATH}:${LAYERDIR}"
-
+BBPATH .= ":${LAYERDIR}"
 # We have a packages directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/packages/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb"
+# packages is still there because metadata_scm.bbclass still uses
+# it to deduce the repo directory and thats the reason to prepend
+# to BBFILES here because this class uses the first entry in
+# BBFILES to calculate the scm base.
+# since the order of BBFLILES is not that important its acted upon
+# using BBFILES_PRIORITY we are ok to keep the oe-core BBFILES dir
+# at top
+
+BBFILES =+ "${LAYERDIR}/packages/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb"
 
 BBFILE_COLLECTIONS += "normal"
 BBFILE_PATTERN_normal := "^${LAYERDIR}/"
-- 
1.7.4.1



