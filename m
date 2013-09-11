Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 85E4260F18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 18:17:52 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id cb5so2527310wib.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 11:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6/NzKbu+kPFQvFeuTnT9o0K1eo7GWjO5x3lGXnRujbU=;
	b=NImOc+0bmYNoDF2zdUnpCq140zQdo7l+otmFVJ4JEuTmolmvi6vTSyvONlu2Fnx1c1
	eAp5Qod6tFJowzbHpdaXm8yl4dFQz2ixwEz9966oZ0H3EBjGKbHZBnpn+duDQc/P6WvX
	JUE2ThiK+PnxrLxmVs3bZY+u3ua7pf7wP07CYUVPP6iCpBeEXRswXf6/23QktJYnMS+w
	sa0OlPP1tUlL4UE8tJRz9wlsr/YkB5A3VhOg0JLZ/95o9MgJt9+ANaa6SFDXin8ObC+Y
	a1nKhQXyHWvAnNGaBtomjremuBPazymwhzACUoWDj4nT6zrBt6Z9JbL4phepJ0Wy4pmq
	oF5Q==
X-Gm-Message-State: ALoCoQkHT35LDioarhBAvOp1Vp8nrBTbDCTspQ3XQlynkaHArmIzqzjGhvi9ztGHoLCtkMVbHiJs
X-Received: by 10.180.38.73 with SMTP id e9mr2459522wik.31.1378923473884;
	Wed, 11 Sep 2013 11:17:53 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fb9sm12442961wid.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Sep 2013 11:17:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2013 19:17:42 +0100
Message-Id: <1378923463-31773-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] base: improve PACKAGECONFIG handling logic
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
X-List-Received-Date: Wed, 11 Sep 2013 18:17:52 -0000

The existing code for handling PACKAGECONFIG lists wasn't the cleanest Python
around.  Instead of diving into the list directly using indices and lengths, use
pop() to iterate through the list.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass |   23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index dfa580c..37dc790 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -420,7 +420,7 @@ python () {
         def appendVar(varname, appends):
             if not appends:
                 return
-            if varname.find("DEPENDS") != -1:
+            if "DEPENDS_" in varname:
                 if pn.startswith("nativesdk-"):
                     appends = expandFilter(appends, "", "nativesdk-")
                 if pn.endswith("-native"):
@@ -442,12 +442,21 @@ python () {
                 bb.error("Only enable,disable,depend,rdepend can be specified!")
 
             if flag in pkgconfig:
-                if num >= 3 and items[2]:
-                    extradeps.append(items[2])
-                if num >= 4 and items[3]:
-                    extrardeps.append(items[3])
-                if num >= 1 and items[0]:
-                    extraconf.append(items[0])
+                if items:
+                    item = items.pop(0)
+                    if item:
+                        extraconf.append(item)
+                # Skip over disable
+                if items:
+                    items.pop(0)
+                if items:
+                    item = items.pop(0)
+                    if item:
+                        extradeps.append(item)
+                if items:
+                    item = items.pop(0)
+                    if item:
+                        extrardeps.append(item)
             elif num >= 2 and items[1]:
                     extraconf.append(items[1])
         appendVar('DEPENDS', extradeps)
-- 
1.7.10.4


