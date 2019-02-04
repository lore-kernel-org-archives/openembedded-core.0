Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id B2F907C28A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 10:06:07 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id h15so10712278edb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 02:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TCqrd93oNzvPrqr17WcA3gt5pxYPCZCC3lX31RtZSBI=;
	b=KxlCEfwJMKxp03ueOfiKEeOVuWDtGV1b98j0jQyTSBNIQZYfA53sRV5ffK7FhHndv2
	zjSl+LpeLE2nWB8H+6lQXz/+Eeinfqk1G8qyzee3SAL7wlRq0RPE3GxG69R9Bfom9tp5
	m8n+3wKB8ocufeRV7g6IdWK3qPcrRut3YE97iKmjHlpUXt1e+GLHW+Cr9o2afhF1Gvlq
	zmsRg8aOa1nY3hZqLjbpTVpUqbGH6kOAj/gApPIvwKvg80ogLm46tgWs2tbKi3YxpA6v
	P/XWvRYiYZvZfqwC3BoRMFIe/ORnabx9Cg4VQq2RdsEd8pDNw45v+vKfJICtu/2maCJb
	GpUg==
X-Gm-Message-State: AJcUukcoZyD8BwmXU1IJw0k3x43W2gk8kiflwnU8c92rxMomR/bzGt8h
	Z90siv8jin8juQeRqODupC5ZLQdi
X-Google-Smtp-Source: ALg8bN5kgdYYS1F1een9jNTB8soXOAXx+EN2WhK30bX9SjOe7q4d9k1c+KUbe36JJxjtdcAn1JhoEA==
X-Received: by 2002:a05:6402:1816:: with SMTP id
	g22mr51388837edy.191.1549274768147; 
	Mon, 04 Feb 2019 02:06:08 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	p36sm4102358edc.78.2019.02.04.02.06.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 02:06:07 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 10:05:50 +0000
Message-Id: <20190204100552.25880-10-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190204100552.25880-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190204100552.25880-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v5 09/11] util-linux: move /etc/default/mountall into -mount subpackage
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
X-List-Received-Date: Mon, 04 Feb 2019 10:06:08 -0000
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
index 2577d0b1ae..49f6ad3f16 100644
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
@@ -104,10 +104,13 @@ PACKAGECONFIG[pylibmount] = "--with-python=3 --enable-pylibmount,--without-pytho
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


