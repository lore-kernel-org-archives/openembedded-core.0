Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDxF-0005ei-QB
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:11:25 +0200
Received: by mail-yx0-f175.google.com with SMTP id 17so3903734yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=3HAhWfVC9w5UJBscrXWgHPR9GxoeJ3G4D+FxT9g55Ek=;
	b=WbyY6wxwKcqycjl3sBwlhWeANDjLruL3RtR5mjeB85OTH1AoH4l81ciZd7vMJxCmn3
	LTP8oi9SaQIU38fsspgwxhRbki9XHww8FytvyKkJA8E8KCOrYjbCgHq58K0FO9XCBN48
	fxl514HujVr9EKwMJh9oOrr6ufr+knrJ+yulA=
Received: by 10.223.88.148 with SMTP id a20mr11983285fam.28.1318007150311;
	Fri, 07 Oct 2011 10:05:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m26sm13620859fac.6.2011.10.07.10.05.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:05:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:04:58 +0200
Message-Id: <0cabf4acc3e90c9dde50d97b6ee5c35a0b41d87e.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 03/31] glx-use-tls.inc: add include file to enable glx-tls only when TARGET_OS isn't uclibc
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
X-List-Received-Date: Fri, 07 Oct 2011 17:11:26 -0000

* will be used in mesa-common.inc and xserver-xorg.inc
* based on mesa-tls.inc (glx-use-tls.bbclass) from
  http://git.openembedded.org/cgit.cgi/openembedded/commit/packages/mesa/mesa-tls.inc?id=b527d8f723c98c77f2f5c5358062e5348493d767
---
 meta/recipes-graphics/mesa/glx-use-tls.inc |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/glx-use-tls.inc

diff --git a/meta/recipes-graphics/mesa/glx-use-tls.inc b/meta/recipes-graphics/mesa/glx-use-tls.inc
new file mode 100644
index 0000000..7530872
--- /dev/null
+++ b/meta/recipes-graphics/mesa/glx-use-tls.inc
@@ -0,0 +1,7 @@
+def get_tls_setting(bb, d):
+    # until we have no prober TLS support in uclibc disable it
+    if bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >= 0 :
+        return ""
+    return "--enable-glx-tls"
+
+EXTRA_OECONF += "${@get_tls_setting(bb, d)}"
-- 
1.7.7



