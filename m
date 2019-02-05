Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 31FCD71BB9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 02:32:57 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id o10so1615921edt.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 18:32:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gKtxaomwijjQahCaLdgV44gojliTYSZKi/Y70JJX/AM=;
	b=VYfMpUmnuMyGQpm3/uYfiUewGQvNcJoMI27VWCMR1n+A7xpId6Q6g+LP4nbVolD1ug
	YPKVRJQufswujWkSwfQfB7/5/sQy7nZ+743Yd0vmmsP20uxgGIeyev4u/BokhHYgkzu/
	VJqrQNmjCqoludSDhbpkiMg1ipe1YzsNqWlpkVraQFnkRlH/lnl/Sk6u5vQ048zI2zUR
	b5B/ZaAWVJT0sEuyjydU5t7rWV0PP0taxbXY89u02CU61uemkW1OizG88ReFCdRRpre3
	BLVD5D1Ma7avMSX5D67XGSyKcOS6o1dWB7IgtigweW+E3GGzPVebqwPdmQi0R8YXiy+F
	b9QA==
X-Gm-Message-State: AHQUAubCzrKiRv7+ZPY7ZEMZxZsakDHYCbM2roEAWj/G7fq9MxKSfCXO
	9e6ZL2Q/1CJAd4rxTiqk4xo+5wvE
X-Google-Smtp-Source: AHgI3IamYkf8ELynVEGsY99+KylXOsNgArUSX6nt5qD0sALBhvoyx7Kx82B4iBnEijWEO1yGyYikgA==
X-Received: by 2002:a50:ad0b:: with SMTP id y11mr1829563edc.113.1549333977649; 
	Mon, 04 Feb 2019 18:32:57 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	d7-v6sm2703682ejd.13.2019.02.04.18.32.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 18:32:56 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 02:32:39 +0000
Message-Id: <20190205023241.29707-12-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205023241.29707-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190205023241.29707-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v6 11/13] util-linux: move /etc/default/mountall into -mount subpackage
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
X-List-Received-Date: Tue, 05 Feb 2019 02:32:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

This should probably be there and now the main package is a real
meta-package only.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 5e40698644..bbb28c3da0 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -46,7 +46,7 @@ python util_linux_binpackages () {
         do_split_packages(d, root=dir,
                           file_regex=r'(.*)', output_pattern='${PN}-%s',
                           description='${PN} %s',
-                          hook=pkg_hook, extra_depends='', prepend=True)
+                          hook=pkg_hook, extra_depends='')
 
     # There are some symlinks for some binaries which we have ignored
     # above. Add them to the package owning the binary they are
@@ -110,10 +110,13 @@ PACKAGECONFIG[pylibmount] = "--with-python=3 --enable-pylibmount,--without-pytho
 # Readline support
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN} = ""
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
 FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
 
+FILES_${PN}-mount = "${sysconfdir}/default/mountall"
 FILES_util-linux-runuser = "${sysconfdir}/pam.d/runuser*"
 FILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
 CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
-- 
2.20.1


