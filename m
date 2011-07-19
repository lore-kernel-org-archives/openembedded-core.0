Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qiy4O-00025y-5I
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:21:52 +0200
Received: by mail-iy0-f175.google.com with SMTP id 12so2181780iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 17:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6g65QEbnlDzEzVBfkAyvGURNntC69t+WYhHOWGqy4fM=;
	b=ImnLKKZxO8ZQPKEQPGaUCspvk5BWO3tV+Fb5YXTjj2zBuzW6p0Cpslpxw7Kfw5X1PQ
	FS0y/zdBOd7E1y8CcicPjbQvks7CwoFjhhVtUSpAKSYCQyfjBDcfyVQyWvlAX7S19Dn+
	JBVylAKq7e2BIOBze6l029NWNAKN9EQHnMy5c=
Received: by 10.42.156.195 with SMTP id a3mr8247021icx.460.1311034669688;
	Mon, 18 Jul 2011 17:17:49 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b6sm3248255ibg.14.2011.07.18.17.17.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 17:17:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 17:17:24 -0700
Message-Id: <5732330369c5304b75c1e5e6aff0b14d6ad22d8b.1311034342.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
In-Reply-To: <cover.1311034342.git.raj.khem@gmail.com>
References: <cover.1311034342.git.raj.khem@gmail.com>
Subject: [PATCH 05/16] classes/gettext: Do not disable nls for non target recipes
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
X-List-Received-Date: Tue, 19 Jul 2011 00:21:52 -0000

nls disabling is target specific but USE_NLS=no will
disable nls even for other kind of recipes. We should
let them build with nls

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/gettext.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index 86b505b..d5b3d70 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -7,7 +7,7 @@ def gettext_dependencies(d):
 
 def gettext_oeconf(d):
     # Remove the NLS bits if USE_NLS is no.
-    if d.getVar('USE_NLS', True) == 'no':
+    if d.getVar('USE_NLS', True) == 'no' and not oe.utils.inherits(d, 'native', 'nativesdk', 'cross', 'cross-canadian'):
         return '--disable-nls'
     return "--enable-nls"
 
-- 
1.7.4.1



