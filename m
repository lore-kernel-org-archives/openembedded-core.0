Return-Path: <mario.goulart@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 855506013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 14:03:54 +0000 (UTC)
Received: by qkgy4 with SMTP id y4so5971363qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 07:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=dwB4VVWMB9cPl3IHAuFcQJ13oc9k6Ca/X0XdDvwxrgA=;
	b=GT79qXhVxpgXjzeFV19LZC+m0VBPJ7vsk3JFyt5r32LZopn/7Cqxrgol0HpzyzsRxj
	cycpTAqMPop7URlZY+/JvdQc60U4kdHi6I6GjemmSRnURjpNKUkVAOLaqvgCbHhQ867E
	X63nG+/eYLVmchBmtnwAm066ETvjoA2wljAq7AA6voIx3isviARnUXaC/ADFbHagK4oh
	S6Zclp0R5yeJhNUvlLzLt4h8Vwh/iMDuszKzgi+aQ72w3SQiZgbDm+JrTyaowmr2jyeS
	p8ev1HX6t2ROSW66TeibenU5VVYSy2XA8I223O5taqaRJYGLnIbKi/WUoGpcVus15X9D
	/MYA==
X-Received: by 10.55.25.34 with SMTP id k34mr33331990qkh.12.1431439435816;
	Tue, 12 May 2015 07:03:55 -0700 (PDT)
Received: from mario.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id 93sm13249989qkx.38.2015.05.12.07.03.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2015 07:03:55 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 May 2015 11:03:40 -0300
Message-Id: <1431439420-5500-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [PATCH] native.bbclass: avoid unintended substring replacement when setting PROVIDES
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
X-List-Received-Date: Tue, 12 May 2015 14:03:56 -0000

The way native_virtclass_handler was implemented leaded to
unintended substring replacements when setting PROVIDES for
native providers, in case the original PROVIDES value contains
providees with common substrings.

Here's a practical case where the old behavior was problematic:
the oracle-jse-jdk-x86-64 recipe provides both virtual/java and
virtual/javac:

Before:

$ bitbake -e oracle-jse-jdk-x86-64-native | grep ^PROVIDES=
PROVIDES="oracle-jse-jdk-x86-64-native  virtual/java-native virtual/java-nativec"

After:

$ bitbake -e oracle-jse-jdk-x86-64-native | grep ^PROVIDES=
PROVIDES="oracle-jse-jdk-x86-64-native virtual/java-native virtual/javac-native"

Change-Id: I8186992dae58e37c2a2364586360ff9b7da9198f
Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta/classes/native.bbclass |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 5ca5c95..1f8139b 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -151,12 +151,13 @@ python native_virtclass_handler () {
         map_dependencies("RREPLACES", e.data, pkg)
 
     provides = e.data.getVar("PROVIDES", True)
+    nprovides = []
     for prov in provides.split():
         if prov.find(pn) != -1:
             continue
         if not prov.endswith("-native"):
-            provides = provides.replace(prov, prov + "-native")
-    e.data.setVar("PROVIDES", provides)
+            nprovides.append(prov.replace(prov, prov + "-native"))
+    e.data.setVar("PROVIDES", ' '.join(nprovides))
 
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-native")
 }
-- 
1.7.10.4


