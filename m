Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TypQh-0008HR-NV
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 20:59:16 +0100
Received: by mail-pb0-f47.google.com with SMTP id wz17so393306pbc.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 11:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=lCctzT55U4MDbQFVKO3lihwNYn2eLSzIxsvqFQtxer8=;
	b=Q91iBPGfWz3ojDKMlimZPXZry+lxQodzqSH5BoCoqcz1JYUpVhaN4dFaGCsAviHy/l
	g0XraLEvDhkgo+ULcjjvEFmP9001UYnMrLc5H5Siqh53LH91D9onCz42G2v4KqsRP5q+
	lKcHnJwoox1hjNCdELOB7/n3QXoXO0rHKGg5Fbc2wTqun2OpmCrIWcSW5FESzNGWKlt9
	yRRTHmvKLZWDCJDIPNXaC7Yw5tW3cmdMAqjP0v4FHKlC75PXApU9nAkVmtFTXrY4B//T
	oq2P1Dvgc7YCANHb3jj6ATXvRV5XDFWvciINFe/ewrdTBQHNrggXeBaPp7wFVEojBXWb
	op8g==
X-Received: by 10.68.223.230 with SMTP id qx6mr16956023pbc.159.1359143020485; 
	Fri, 25 Jan 2013 11:43:40 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id nf9sm1183638pbc.17.2013.01.25.11.43.38
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 11:43:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 20:42:54 +0100
Message-Id: <7f7ccb65953536768d1558491d5d80ec0e4f74c2.1359142768.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
In-Reply-To: <cover.1359142768.git.Martin.Jansa@gmail.com>
References: <cover.1359142768.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1359142768.git.Martin.Jansa@gmail.com>
References: <cover.1359142768.git.Martin.Jansa@gmail.com>
Subject: [PATCH 7/7] oe-core: add world-image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 19:59:17 -0000

* this depends on newer bitbake
* similar to world target, but collects all PACKAGES
* recipes marked with EXCLUDE_FROM_WORLD are excluded from world as well
  as world-image
* recipes marked with EXCLUDE_FROM_WORLD_IMAGE are excluded completely
  from world-image, sometimes you can build 2 recipes in same sysroot,
  but cannot install them in the same image
* PACKAGES listed in EXCLUDE_PACKAGES_FROM_WORLD_IMAGE are also
  excluded. You can remove e.g. ${PN}-dbg, but keep all other PACKAGES.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/images/world-image.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta/recipes-core/images/world-image.bb

diff --git a/meta/recipes-core/images/world-image.bb b/meta/recipes-core/images/world-image.bb
new file mode 100644
index 0000000..ab195c3
--- /dev/null
+++ b/meta/recipes-core/images/world-image.bb
@@ -0,0 +1,10 @@
+# IMAGE_INSTALL is set from bitbake itself to union of all PACKAGES
+# from all recipes which are not marked as:
+# EXCLUDE_FROM_WORLD or EXCLUDE_FROM_WORLD_IMAGE
+# or individual packages listed in
+# EXCLUDE_PACKAGES_FROM_WORLD_IMAGE
+
+inherit image
+
+# don't build this in regular world builds
+EXCLUDE_FROM_WORLD = "1"
-- 
1.8.1.1



