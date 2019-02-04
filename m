Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA717C208
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 10:06:00 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id a20so10693613edc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 02:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eF688Xbmt6T4E3f49Gy12DRUw6SbwXllg9NRcVUKbbY=;
	b=VCa17uZabya6Nti16Fmk4q/gofgvB9K26nNfXxMS67PKNjNUZLXjmjs+uee/jB0mgW
	PZ3OkCuPPwJgtPhg0go7jZ9eGbBnY3OTYIBcWY7aQ6knMqmTILshNpcj/uQJzpuvpbVC
	QJKffq/2tPWjL2PLmksciMqVi33pQzXIdDzd5UHqcpjB3wHjNiHlUkhufTctSZytZrPN
	qtTR+6Tw+nY3tzsjKurZH0bTcYpOlIPoYlom1r4m21PdITL5LVaxU/XyR+gOPtD89rDP
	+7ulhvWFbmryMwRwFBRJx0RxsJBUgu5+DUVx8jwy7EIpcmWcnatMynbXTfElH+KjUpb9
	RiMw==
X-Gm-Message-State: AJcUukc0YeUEM65HSZ+LOew10BPExetq0FbDZtQeWgR/Bhj15NebgUfc
	vXD4aYW39y/Hl7xvt1oHGMtYna9v
X-Google-Smtp-Source: ALg8bN4xDqjPDuScNB/jB5vsshePPaUZRWxVZSt1L4dEeilt3KmVLsX6/aYjtmIP87hnz5D+3q/pVg==
X-Received: by 2002:a50:a086:: with SMTP id 6mr49048297edo.88.1549274761490;
	Mon, 04 Feb 2019 02:06:01 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	p36sm4102358edc.78.2019.02.04.02.06.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 02:06:00 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 10:05:45 +0000
Message-Id: <20190204100552.25880-5-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190204100552.25880-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190204100552.25880-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v5 04/11] util-linux: one package per binary (pt 1b: symlinks)
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
X-List-Received-Date: Mon, 04 Feb 2019 10:06:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Some of the binaries have symlinks. Add them to the
package owning the binary they are pointing to.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index b8b3298239..bc693a41b4 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -52,6 +52,28 @@ python util_linux_binpackages () {
                           file_regex=r'(.*)', output_pattern='${PN}-%s',
                           description='${PN} %s',
                           hook=pkg_hook, extra_depends='', prepend=True)
+
+    # There are some symlinks for some binaries which we have ignored
+    # above. Add them to the package owning the binary they are
+    # pointing to
+    extras = {}
+    dvar = d.getVar('PKGD')
+    for root in [ '${base_sbindir}' ]:
+        root = d.expand(root)
+        for walkroot, dirs, files in os.walk(dvar + root):
+            for f in files:
+                file = os.path.join(walkroot, f)
+                if not os.path.islink(file):
+                    continue
+
+                pkg = os.path.basename(os.readlink(file))
+                extras[pkg] = extras.get(pkg, '') + ' ' + file.replace(dvar, '', 1)
+
+    pn = d.getVar('PN')
+    for pkg, links in extras.items():
+        of = d.getVar('FILES_' + pn + '-' + pkg)
+        links = of + links
+        d.setVar('FILES_' + pn + '-' + pkg, links)
 }
 
 # we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
-- 
2.20.1


