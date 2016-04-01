Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AEF2E760AD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 17:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u31H1igF024710 for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Apr 2016 18:02:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sNRLUEX7TLuc
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 18:02:13 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u31H27Lx024730
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Apr 2016 18:02:08 +0100
Message-ID: <1459530127.7348.30.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 01 Apr 2016 18:02:07 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] base: Fixup PACKAGECONFIG incorrect mappings
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
X-List-Received-Date: Fri, 01 Apr 2016 17:02:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

PACKAGECONFIG doesn't work in cross-canadian recipes at the moment as
DEPENDS are prepended with mlprefix.

A recipe is either nativesdk, native or target so adjust the if
statements accordingly, use inherits_class for more accurate recipe
classification and add cross-canadian support.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 85d6bc4..02429dd 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -398,11 +398,11 @@ python () {
             if not appends:
                 return
             if varname.find("DEPENDS") != -1:
-                if pn.startswith("nativesdk-"):
+                if bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('cross-canadian', d) :
                     appends = expandFilter(appends, "", "nativesdk-")
-                if pn.endswith("-native"):
+                elif bb.data.inherits_class('native', d):
                     appends = expandFilter(appends, "-native", "")
-                if mlprefix:
+                elif mlprefix:
                     appends = expandFilter(appends, "", mlprefix)
             varname = d.expand(varname)
             d.appendVar(varname, " " + " ".join(appends))



