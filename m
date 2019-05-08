Return-Path: <prvs=02457a582=Michael.Ho@bmw.de>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 May 2019 14:10:19 UTC
Received: from esa10.bmw.c3s2.iphmx.com (esa10.bmw.c3s2.iphmx.com
	[68.232.139.98])
	by mail.openembedded.org (Postfix) with ESMTP id 9C9FE7D74A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 14:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1557324621; x=1588860621;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=2/rdQuh/KgpmRzkcTuOGVVxm3boODMLIym216tG4qyI=;
	b=V0a3lO9gM5m0jhCB7E7PUZAeBqRiy9+hL8eL4pqeMM4CyEarAtxsAppB
	3qv7mjA1PW9KrVZXaXLdYSjyo8q955MMAYgb9a8BuTMgTHXL6WAlUiPIC
	49oHe1aKSQE3bRytXJLANu0jeKSif/fyCMbPtaxLsykxRo6gc/BFPmt11 Y=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
	esa10.bmw.c3s2.iphmx.com with ESMTP/TLS; 08 May 2019 16:02:41 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw1.muc with ESMTP/TLS;
	08 May 2019 16:02:41 +0200
Received: from smucm12m.bmwgroup.net (HELO smucm12m.europe.bmw.corp)
	([160.48.96.57])
	by esabb3.muc with ESMTP/TLS; 08 May 2019 16:02:41 +0200
Received: from michael-pc.bmw-carit.intra (192.168.221.44) by
	smucm12m.europe.bmw.corp
	(160.48.96.57) with Microsoft SMTP Server (TLS;
	Wed, 8 May 2019 16:02:40 +0200
From: Michael Ho <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 May 2019 16:02:29 +0200
Message-ID: <1557324149-15256-1-git-send-email-Michael.Ho@bmw.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.168.221.44]
X-ClientProxiedBy: smucm03m.europe.bmw.corp (160.48.96.21) To
	smucm12m.europe.bmw.corp (160.48.96.57)
Cc: Michael Ho <Michael.Ho@bmw.de>
Subject: [PATCH] base.bbclass: add named SRCREVs to the sstate hash
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
X-List-Received-Date: Wed, 08 May 2019 14:10:20 -0000
Content-Type: text/plain

Several fetchers support named sources that require setting a SRCREV with
the source name as a suffix. These named SRCREV variables are not captured
in the sstate hash calculation because they're only referenced within the
bitbake fetcher function.

Add a snippet to the base.bbclass anonymous python to add all named SRCREV
variables to the vardeps of do_fetch to capture them in the sstate hash
calculation.

Testing of the bug can be shown by running the following bitbake commands
with this patch set not applied:

bitbake vulkan-demos | tee
sed -i 's/SRCREV_gli = ".*"/SRCREV_gli = "xxx"/' \
  ../meta/recipes-graphics/vulkan/vulkan-demos_git.bb
bitbake vulkan-demos | tee;

Results in no errors despite a broken SRCREV because the vulkan-demos is
considered unchanged.

After applying this patch the above commands instead result in a fetcher
error which is correct.
---
 meta/classes/base.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1636c6e..84a27f5 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -638,6 +638,16 @@ python () {
 
     if needsrcrev:
         d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}")
+        # Gather all SRCREV_* references to add to the sstate hash calculation
+        # This may capture SRCREVs not used but it's difficult to try to restrict it
+        # to only what is needed
+        for dkey in d.keys():
+            if dkey.startswith("SRCREV_"):
+                # This anonymous python snippet is called multiple times so we
+                # need to be careful to not double up the appends here and cause
+                # the base hash to mismatch the task hash
+                if dkey not in (d.getVarFlag("do_fetch", "vardeps") or '').split():
+                    d.appendVarFlag("do_fetch", "vardeps", " {}".format(dkey))
 
     set_packagetriplet(d)
 
-- 
2.7.4


