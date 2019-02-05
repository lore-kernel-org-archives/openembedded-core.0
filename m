Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2C1187C0D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:32:51 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id h50so1665792ede.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cESuIPwbewEjzyRL+z3NcdSyE4mDSPgJHOKuJwSZkw0=;
	b=PvCXOqGYxJ4XoN1HV5xE6quQQ30W6YtHxfXAJcKZVR20LPWRfpmYq3/Zs9ZJlZhpZn
	AUXI+uUc5CUZTyy716B9BZX+I+94GGtS+tYFZbIpzl1FQEDauIF0yKhANnDGJN4U4dFV
	sprZUbb3YZtb6YhH2buKli29g8KaX7dkxr3ZqxM9YVGPmsEz1nQEaJbGJur7MRcViVQQ
	ahcHnMGucMvvjzf6dg7KKlVuBgTGPHHpIAajJAhWrcyx4GugEYB0GSABKO1o94K/aN45
	PA4ZODCvLymBlsjP30U8b0KeA0Sp/qJ8iwbelzarGKC0iuqEV6hOd8oDn9J/PnsjIgXP
	jTfg==
X-Gm-Message-State: AHQUAuZ77TgQowysmXRko0BRdKpBDvLhtAXlx87mdvHPjrnMbrl1UiHP
	uct4Ybph7PXbPuhdJ/XMhdLh//28
X-Google-Smtp-Source: AHgI3IbTFAF5CdRAAI1sVEwPWWoT4gLuRZB8Xw+9J+POzvUN4ncl2gHGEb1Ie0fnImkdX3YBdqBIsA==
X-Received: by 2002:a17:906:8597:: with SMTP id
	v23mr1694147ejx.208.1549333971786; 
	Mon, 04 Feb 2019 18:32:51 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	d7-v6sm2703682ejd.13.2019.02.04.18.32.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:32:51 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 02:32:34 +0000
Message-Id: <20190205023241.29707-7-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205023241.29707-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190205023241.29707-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v6 06/13] util-linux: one package per binary (pt 1b: symlinks)
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
X-List-Received-Date: Tue, 05 Feb 2019 02:32:52 -0000
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
index a81045251b..a250db94aa 100644
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


