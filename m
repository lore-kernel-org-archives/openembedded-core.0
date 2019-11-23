Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id C5A977FCA8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:18:45 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id z4so5151121pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=r1g73/lbr3zLMFInBRcaYkY3daDX/c8u2606Ed+ZZlc=;
	b=O1Vm6LUB/5fHriBD2mcdhIZQ1xJaEIeaF9OAT7Ra5/PzOTXenhEAIc35bzk5nkIfVF
	DEePvq2X9iG/iBzUZ8DtnLgY6eUn3VdW7GvbP1Szk2fTE4aNMhcAAyNm+bOOcMMFTl/y
	5JUqp8fTg2vVpGtn7epGn3AxrAkUtipkDzg3/2Y8X3tSCQrKo0ENVsY4Xpm7STizYGQp
	utGfpYPlUucq/1rRMbsWuhvnfpbZC32DC5VKgazhDE8vzH2bQ7REJHUKrcye23+Ub2JQ
	3UK2ImolvgwY50Te0vFKuz+YIVjTWB7bHQLgQDv3/WMRdWJLi/+beiY9yNQtpPAg7PJ9
	g4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r1g73/lbr3zLMFInBRcaYkY3daDX/c8u2606Ed+ZZlc=;
	b=bjCYv/0iuNfVmK0nclUGjgRR8VueRnFsH86uNIMZcgW6QSQAJfU/hnsPYpLVDv2jMx
	/L4MHkqIeOp3RQ8FU2N/QmOVDQTeeVCEbTJRgH1AklqT111QGJTvFfpSJyWSBNgKaKro
	PC7ZkPKTgOiv7RIK9kpoIYhUkv6lN6XnnE+0SzmHqIIroWm1UUs0pknRCWIa9n68Vugj
	gO2EzqXPCuCzPg2DEpoeg7NrwAsLcax6eCfVWuLLbiArDAIx+UfChtGAKpOMt++/5ZLM
	UnXbpw7LaKVOxrYdrS406W+UL+zmXe9gE+rg45M7iNxk3DmxW+PakFg8YpKctGoS1E/e
	E1YA==
X-Gm-Message-State: APjAAAUkhzIvx4tWqUIAkH2b4G7swLjocjzxLQa0GFKm4HCJPwkelBwL
	idbPI1mLxX/rd4MeKQL3d4SmeKLM
X-Google-Smtp-Source: APXvYqyuY9eRba28+VNGX7tpj4LjaSVb2iXiPUYxyknaI7lpPAaz9RVYDwZwI0rA7CTWvnQbxRYtHQ==
X-Received: by 2002:a62:18d8:: with SMTP id 207mr23878174pfy.15.1574525926567; 
	Sat, 23 Nov 2019 08:18:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id u7sm2647804pjx.19.2019.11.23.08.18.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:18:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:18:38 -0800
Message-Id: <1574525924-20765-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [zeus][PATCH 1/7] opkg: Add upstream fixes for empty packages
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
X-List-Received-Date: Sat, 23 Nov 2019 16:18:45 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

An ipk with a zero size data.tar file caused opkg to crash with a
double free abort. Add the upstream fixes for this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/opkg/opkg/open_inner.patch   | 46 ++++++++++++++++++
 meta/recipes-devtools/opkg/opkg/opkg_archive.patch | 54 ++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.4.1.bb           |  2 +
 3 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/open_inner.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/opkg_archive.patch

diff --git a/meta/recipes-devtools/opkg/opkg/open_inner.patch b/meta/recipes-devtools/opkg/opkg/open_inner.patch
new file mode 100644
index 0000000..278e099
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/open_inner.patch
@@ -0,0 +1,46 @@
+From alejandro.delcastillo@ni.com Wed Nov 20 22:35:02 2019
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+To: <opkg-devel@googlegroups.com>, <richard.purdie@linuxfoundation.org>
+CC: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Subject: [opkg][PATCH 2/2] open_inner: add support for empty payloads
+Date: Wed, 20 Nov 2019 16:34:48 -0600
+Message-ID: <20191120223448.26522-3-alejandro.delcastillo@ni.com>
+X-Mailer: git-send-email 2.22.0
+In-Reply-To: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
+References: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
+MIME-Version: 1.0
+Content-Type: text/plain
+Content-Transfer-Encoding: 8bit
+
+Support for empty compressed payloads need to be explicitly enabled on
+libarchive.
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+
+Upstream-Status: Backport
+---
+ libopkg/opkg_archive.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
+index 0e9ccea..f19cece 100644
+--- a/libopkg/opkg_archive.c
++++ b/libopkg/opkg_archive.c
+@@ -618,6 +618,13 @@ static struct archive *open_inner(struct archive *outer)
+         goto err_cleanup;
+     }
+ 
++    r = archive_read_support_format_empty(inner);
++    if (r != ARCHIVE_OK) {
++        opkg_msg(ERROR, "Empty format not supported: %s\n",
++                 archive_error_string(inner));
++        goto err_cleanup;
++    }
++
+     r = archive_read_open(inner, data, NULL, inner_read, inner_close);
+     if (r != ARCHIVE_OK) {
+         opkg_msg(ERROR, "Failed to open inner archive: %s\n",
+-- 
+2.22.0
+
+
diff --git a/meta/recipes-devtools/opkg/opkg/opkg_archive.patch b/meta/recipes-devtools/opkg/opkg/opkg_archive.patch
new file mode 100644
index 0000000..3e1ebae
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/opkg_archive.patch
@@ -0,0 +1,54 @@
+From alejandro.delcastillo@ni.com Wed Nov 20 22:35:01 2019
+Return-Path: <richard.purdie+caf_=rpurdie=rpsys.net@linuxfoundation.org>
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+To: <opkg-devel@googlegroups.com>, <richard.purdie@linuxfoundation.org>
+CC: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Subject: [opkg][PATCH 1/2] opkg_archive.c: avoid double free on uncompress
+ error
+Date: Wed, 20 Nov 2019 16:34:47 -0600
+Message-ID: <20191120223448.26522-2-alejandro.delcastillo@ni.com>
+X-Mailer: git-send-email 2.22.0
+In-Reply-To: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
+References: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
+MIME-Version: 1.0
+Content-Type: text/plain
+Content-Transfer-Encoding: 8bit
+
+The open-inner function calls archive_read_open. On error,
+archive_read_open calls inner_close, which also closes the outter
+archive. On error, return NULL directly to avoid double free.
+
+
+Upstream-Status: Backport
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+---
+ libopkg/opkg_archive.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
+index 3d87db1..0e9ccea 100644
+--- a/libopkg/opkg_archive.c
++++ b/libopkg/opkg_archive.c
+@@ -622,7 +622,7 @@ static struct archive *open_inner(struct archive *outer)
+     if (r != ARCHIVE_OK) {
+         opkg_msg(ERROR, "Failed to open inner archive: %s\n",
+                  archive_error_string(inner));
+-        goto err_cleanup;
++        return NULL;
+     }
+ 
+     return inner;
+@@ -683,7 +683,7 @@ static struct archive *extract_outer(const char *filename, const char *arname)
+ 
+     inner = open_inner(outer);
+     if (!inner)
+-        goto err_cleanup;
++        return NULL;
+ 
+     return inner;
+ 
+-- 
+2.22.0
+
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.1.bb b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
index 104f07f..1cd7dca 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
@@ -14,6 +14,8 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://opkg_archive.patch \
+           file://open_inner.patch \
            file://run-ptest \
 "
 
-- 
2.7.4


