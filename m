Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T102m-0001X2-Nh
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 21:11:16 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 13 Aug 2012 11:59:21 -0700
Received: by wibhr14 with SMTP id hr14so2974409wib.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 11:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=/B13ZJylal+UeaE1rYSwv491ShOiIC2MPPp9YoK3JGY=;
	b=ot6WV/x0FSSUzvCDZj4eS6IzVY1BYLrDnpCL2jcJhAcUJYOiCkN6aIhlGBszuq71aU
	bxrNfgmQL4PK8yvCLVploaaMkibaS9dZsFK55IfyH8fakLEoZpaG0D5ZlXGalalZ0Ctg
	kzAhmFgRqkdMVjsjzM0+7li+fk6FgM0dRUQgi3yx01uK66ABn9VM74oir1/b3xpFJTPO
	kV9MaE46bXwEDBx/N67tfOkBZk53Su7jk89PpzXj+y1vNr2RPugFNbRV8psj9Eic211V
	QDzazBsVX+mxUgjKKpKdXUKbmSJizw6tn3yxCWUjVITbb+dsqzqXr0JspLb+iV73oydG
	sJZg==
Received: by 10.180.91.228 with SMTP id ch4mr20749271wib.7.1344884359618;
	Mon, 13 Aug 2012 11:59:19 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id h9sm17936447wiz.1.2012.08.13.11.59.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 11:59:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 19:58:40 +0100
Message-Id: <b594f8c989894f960fa9b084e74e963ded794627.1344884283.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlXJ0Hhb5Kh32tLi9/Ndw5T77AN0YhagWtGkhtG+xT4psUiOAD+NDL2dfcYEqVAL/M7G8go
Subject: [PATCH 1/8] base.bbclass: fix PACKAGECONFIG handling code
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
X-List-Received-Date: Mon, 13 Aug 2012 19:11:16 -0000

From: Yao Zhao <yao.zhao@windriver.com>

PACKAGECONFIG flag code only handles that when it has 3 or 4 items in flag,
it may have a stale data if some flags doesn't need DEPENDS and RDEPENDS.

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass |   25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e15fa26..3e6a7de 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -364,20 +364,19 @@ python () {
             if flag == "defaultval":
                 continue
             items = flagval.split(",")
-            if len(items) == 3:
-                enable, disable, depend = items
-                rdepend = ""
-            elif len(items) == 4:
-                enable, disable, depend, rdepend = items
+            num = len(items)
+            if num > 4:
+                bb.error("Only enable,disable,depend,rdepend can be specified!")
+
             if flag in pkgconfig:
-                if depend:
-                    extradeps.append(depend)
-                if rdepend:
-                    extrardeps.append(rdepend)
-                if enable:
-                    extraconf.append(enable)
-            elif disable:
-                    extraconf.append(disable)
+                if num >= 3 and items[2]:
+                    extradeps.append(items[2])
+                if num >= 4 and items[3]:
+                    extrardeps.append(items[3])
+                if num >= 1 and items[0]:
+                    extraconf.append(items[0])
+            elif num >= 2 and items[1]:
+                    extraconf.append(items[1])
         appendVar('DEPENDS', extradeps)
         appendVar('RDEPENDS_${PN}', extrardeps)
         appendVar('EXTRA_OECONF', extraconf)
-- 
1.7.10



