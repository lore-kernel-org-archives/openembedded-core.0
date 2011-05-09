Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QJVQT-0005hW-Kj
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 20:43:28 +0200
Received: by pzk36 with SMTP id 36so2591605pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2011 11:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=HRb+L9qe9+N43GJiUvxpJSbn2q1Ob36v0IHMVuOIzUU=;
	b=EkwCi5sZuhUMnN6dVVN3V8RuHEobVZKRO8ZUA0U+igwoEaKa/4zu5YxAv3waLknX4j
	UJKHdmTxs9fles9/8+rQZoMIqExNwMEIu2me9ZZBXM5MjCAdXSOAYAA2ohTuHrUUEETj
	QxTLyvuxzwrWZujuCpukcw+Og8llQPU4erHY0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=V6UVRDKuFGOl3IMufRFRkg9FTD0cP+fZcpLA6Av4DXEpQVH2Dr7aL8jG4sKA95X9Y8
	RvSDuwAXV4H2CQyVa9Emakd77MmOFz0pSrMHwKyoHO7eH/wYhocPY9zIXFRroiuMZ+GI
	UOKiK2dZavgNXPHF2uYSAEFCO7xY0z9xqGO2w=
Received: by 10.68.26.134 with SMTP id l6mr10781936pbg.50.1304966440424;
	Mon, 09 May 2011 11:40:40 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i7sm4263541pbs.7.2011.05.09.11.40.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 11:40:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon,  9 May 2011 11:40:33 -0700
Message-Id: <294589c1ee1b6c5c850cad09d89d97b8859b105b.1304966147.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1304966147.git.raj.khem@gmail.com>
References: <cover.1304966147.git.raj.khem@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/6] conf/layer.conf: Use .= to append to BBPATH and =+ for BBFILES
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
X-List-Received-Date: Mon, 09 May 2011 18:43:29 -0000

Appending to BBPATH gives a definite order to BBLAYERS which
means paths are preferred in order from left to right.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/layer.conf |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 3f63c7d..10a6948 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -2,7 +2,15 @@ BBPATH ?= ""
 # We have a conf and classes directory, add to BBPATH
 BBPATH .= ":${LAYERDIR}"
 # We have a packages directory, add to BBFILES
-BBFILES += "${LAYERDIR}/packages/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb"
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



