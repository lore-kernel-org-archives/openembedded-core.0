Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QMnw6-0001o2-U9
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 23:05:43 +0200
Received: by pxi6 with SMTP id 6so1505521pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 14:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=/8kuCY87yPPdMKNeEgyxOwAcERGaPYDhX5hFItC3fJ4=;
	b=tcyYzctzTbwVImw35EWt6CtK/LzebJu0HrYTvoHwq/1/nuDMkzQJbh4sxxWPzEfQhB
	TPP45OLcouVmnm38KtCC8tT7PS6rExgbWG1tobFtCnA/4VYJg5VlXpD58HUhCZkd1Icf
	Q3oCYi6NHYidGwEIemA2JuwGGblPmR8su/wcQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Q/VHX+Y8sOBIuxWLgZ4vvafV+tt1p3X7twjHS0h9ui9axEnfKCtpObhhqYIyzqrMyo
	M4nc4NA+Z1dMSHXB9w9tda9n/L0VXPIhEsOyIGTpbSl+xL9rbkjJl7Ip79sq1k6T6Dr1
	2j0c+gYVE/1k9HIFofRKbDtltgWN6oR7VnA9I=
Received: by 10.142.202.9 with SMTP id z9mr1300853wff.374.1305752567392;
	Wed, 18 May 2011 14:02:47 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id k6sm1690201wfa.5.2011.05.18.14.02.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 14:02:46 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 14:02:33 -0700
Message-Id: <2370078806c22a1aa1e23a0e20e9fb5b17149deb.1305752502.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305752502.git.chris_larson@mentor.com>
References: <cover.1305752502.git.chris_larson@mentor.com>
In-Reply-To: <cover.1305752502.git.chris_larson@mentor.com>
References: <cover.1305752502.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 5/5] base.bbclass: use oe.data for OE_IMPORTS
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
X-List-Received-Date: Wed, 18 May 2011 21:05:43 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/base.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 391545c..7950bc3 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -11,6 +11,7 @@ inherit buildstats
 inherit logging
 
 OE_IMPORTS += "os sys time oe.path oe.utils oe.data"
+OE_IMPORTS[type] = "list"
 
 def oe_import(d):
     import os, sys
@@ -25,7 +26,8 @@ def oe_import(d):
         else:
             __builtins__[name] = value
 
-    for toimport in d.getVar("OE_IMPORTS", True).split():
+    import oe.data
+    for toimport in oe.data.typed_value("OE_IMPORTS", d):
         imported = __import__(toimport)
         inject(toimport.split(".", 1)[0], imported)
 
-- 
1.7.1



