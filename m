Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB057611B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:55 +0000 (UTC)
Received: by pacan13 with SMTP id an13so77391052pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ybzZ+DivkPYHRXtqHFgGiH3rzXabkd7TxG+kJdZLd+4=;
	b=IWiSS/vIP6aKrvORAq7iqSUUlHKtZY1dOeZzifkhGm8K2SNIvmiRQdoA+Ors7QiSHp
	uGgutP9iobJQ8dvKx9dL1B2URgQf3l3DkZYZOOKv8ziK6E9HmCrP8Mr3cx4mOsBACndj
	uiuDJI5298So5tYNFDd2er1AFgnwhLUi78oaC2hPVR4hLbxhhT4AcoL/6yWG7OJBt8n8
	Rm1lngNSh+JN5y9xdnyXkXcJPxbJ7HbgqSlVAqzHhbYd+62B5HoFEc0VTfi9+RzRRM9q
	1RjeJmPMGmTPKyyG9/5/f4KfCoLjQdowffUqOeuIHERnBPnyrufjjNrnB5KudcUIgFHM
	rphQ==
X-Received: by 10.68.136.34 with SMTP id px2mr29355480pbb.41.1437232615543;
	Sat, 18 Jul 2015 08:16:55 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	xp10sm5885112pac.34.2015.07.18.08.16.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:51 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 71329FC12FF; Sat, 18 Jul 2015 08:16:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:30 -0700
Message-Id: <9ae5a883e1d0b7ef87fe6cc509e3e599fc7f3151.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 23/25] rpm: Fix CVE-2014-8118
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:55 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Backport patch to fix CVE-2014-8118. Description is on [1] and
original patch taken from [2].

[1] https://bugzilla.redhat.com/show_bug.cgi?id=1168715
[2] https://bugzilla.redhat.com/attachment.cgi?id=962159

[YOCTO #7181]

(From OE-Core rev: 0a1f924157cb75d0f67cf534762c89dc8656d352)

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../rpm/rpm/rpm-CVE-2014-8118.patch                | 43 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.11.2.bb            |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch b/meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch
new file mode 100644
index 0000000..bf1795c
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch
@@ -0,0 +1,43 @@
+From 71c812edf1431a9967bd99ba6ffa6ab89eb7ec7c Mon Sep 17 00:00:00 2001
+From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
+Date: Wed, 10 Jun 2015 12:56:55 +0000
+Subject: [PATCH 1/2] rpm: CVE-2014-8118
+
+Upstream-Status: Backport
+
+Reference:
+https://bugzilla.redhat.com/show_bug.cgi?id=1168715
+
+Description:
+It was found that RPM could encounter an integer overflow,
+leading to a stack-based overflow, while parsing a crafted
+CPIO header in the payload section of an RPM file.  This could
+allow an attacker to modify signed RPM files in such a way that
+they would execute code chosen by the attacker during package
+installation.
+
+Original Patch:
+https://bugzilla.redhat.com/attachment.cgi?id=962159
+
+Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
+---
+ lib/cpio.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/cpio.c b/lib/cpio.c
+index 382eeb6..74ddd9c 100644
+--- a/lib/cpio.c
++++ b/lib/cpio.c
+@@ -296,6 +296,9 @@ int rpmcpioHeaderRead(rpmcpio_t cpio, char ** path, struct stat * st)
+     st->st_rdev = makedev(major, minor);
+ 
+     GET_NUM_FIELD(hdr.namesize, nameSize);
++    if (nameSize <= 0 || nameSize > 4096) {
++        return CPIOERR_BAD_HEADER;
++    }
+ 
+     *path = xmalloc(nameSize + 1);
+     read = Fread(*path, nameSize, 1, cpio->fd);
+-- 
+1.8.4.5
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.11.2.bb b/meta/recipes-devtools/rpm/rpm_4.11.2.bb
index 86a14fa..86a5fbb 100644
--- a/meta/recipes-devtools/rpm/rpm_4.11.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.11.2.bb
@@ -34,6 +34,7 @@ SRC_URI += "http://rpm.org/releases/rpm-4.11.x/${BP}.tar.bz2 \
             file://fix_libdir.patch \
             file://rpm-scriptetexechelp.patch \
             file://pythondeps.sh \
+            file://rpm-CVE-2014-8118.patch \
            "
 
 SRC_URI[md5sum] = "876ac9948a88367054f8ddb5c0e87173"
-- 
1.9.1


