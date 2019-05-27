Return-Path: <prvs=043ccbe6f=Michael.Ho@bmw.de>
Received: from esa6.bmw.c3s2.iphmx.com (esa6.bmw.c3s2.iphmx.com
	[68.232.139.124])
	by mail.openembedded.org (Postfix) with ESMTP id A933C7D1F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1558971773; x=1590507773;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version;
	bh=W92WedboDSEesE42NJsB5xm2hvnAHxgaF9LpW6O2mI8=;
	b=T7r/FfTcpZX4j6ABH2BL2p80T+7Otk7iZ1U6CG0sFzfJrsyYSg4WsSir
	SyW39TMGbvbHDopK/G80XM5sQg+JMhgfzixMwxR2pnQrISpDNgeov9KHN
	ZsjBACr9TMrXdXR8RdW7sAbuKzqx856ovI35lkb+mIlPUfOMfD1Sx0707 E=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa6.bmw.c3s2.iphmx.com with ESMTP/TLS; 27 May 2019 17:42:51 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw5.muc with ESMTP/TLS;
	27 May 2019 17:42:47 +0200
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp)
	([160.48.96.43])
	by esabb2.muc with ESMTP/TLS; 27 May 2019 17:42:47 +0200
Received: from michael-pc.bmw-carit.intra (192.168.221.45) by
	smucm09k.europe.bmw.corp
	(160.48.96.43) with Microsoft SMTP Server (TLS;
	Mon, 27 May 2019 17:42:47 +0200
From: Michael Ho <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 May 2019 17:42:36 +0200
Message-ID: <1558971756-12303-1-git-send-email-Michael.Ho@bmw.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557324149-15256-1-git-send-email-Michael.Ho@bmw.de>
References: <1557324149-15256-1-git-send-email-Michael.Ho@bmw.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.221.45]
X-ClientProxiedBy: smucm19l.europe.bmw.corp (160.48.96.84) To
	smucm09k.europe.bmw.corp (160.48.96.43)
Cc: Michael Ho <Michael.Ho@bmw.de>
Subject: [PATCH v2] base.bbclass: add named SRCREVs to the sstate hash
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
X-List-Received-Date: Mon, 27 May 2019 15:42:51 -0000
Content-Type: text/plain

Several fetchers support named sources that require setting a SRCREV with
the source name as a suffix. These named SRCREV variables are not captured
in the sstate hash calculation because they're only referenced within the
bitbake fetcher function. Several recipes avoid this bug by adding the
different SRCREVs to their packaging versioning but this is not enforced so
it is very trivial to trip this bug case.

Add a snippet to the base.bbclass anonymous python to add all named SRCREV
variables to the vardeps of do_fetch to capture them in the sstate hash
calculation.

Testing of the bug can be shown by running the following bitbake commands
with this patch set not applied:

bitbake vulkan-demos | tee
sed -i 's/SRCREV_gli = ".*"/SRCREV_gli = "xxx"/' \
  ../meta/recipes-graphics/vulkan/vulkan-demos_git.bb
bitbake vulkan-demos | tee;

The above results in no errors despite a broken SRCREV because the recipe  is
considered unchanged by the bitbake sstate hash.

After applying this patch the above commands instead result in a fetcher
error which is correct.
---
 meta/classes/base.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1636c6e..25d5fff 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -639,6 +639,18 @@ python () {
     if needsrcrev:
         d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}")
 
+        # Gather all named SRCREVs to add to the sstate hash calculation
+        # This anonymous python snippet is called multiple times so we
+        # need to be careful to not double up the appends here and cause
+        # the base hash to mismatch the task hash
+        for uri in srcuri.split():
+            parm = bb.fetch.decodeurl(uri)[5]
+            uri_names = parm.get("name", "").split(",")
+            for uri_name in filter(None, uri_names):
+                srcrev_name = "SRCREV_{}".format(uri_name)
+                if srcrev_name not in (d.getVarFlag("do_fetch", "vardeps") or "").split():
+                    d.appendVarFlag("do_fetch", "vardeps", " {}".format(srcrev_name))
+
     set_packagetriplet(d)
 
     # 'multimachine' handling
-- 
2.7.4


