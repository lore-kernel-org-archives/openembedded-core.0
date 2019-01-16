Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4B06C492
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:01:12 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id s17so2400760ybp.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YSElZM1DI+Y7+4JWz/9qwbqBj0HE+LfDWysx4NRMpzc=;
	b=KJWCFkx9TvAF+CXUo6v6fPhVWW2wyQltC49NT0OcsSwoKZMm4/UvEi1SOZbXH1PdpL
	DnUzNwGYjo+YNWQ+IOrCsgqHYKGNtOdj94hxqk7nZxBdWosYyGH8Die5wf0jS641R/fz
	oRPniLkOUcIksCv1laA+CcL/BFRES5JwGg/o3XNWQojekvaVYkPEWVrkNKUXBVO9L5Zh
	p9IxZZO55+NlvMT7OVdbLHsREuM+EWhI+7fdVaVxjVvZSeW+M0tAj/RyDWhM7jeN+A8q
	+1SoXjtTnQLSKL8hKnT4eZzLJF+Xi533HvnPYTF5oBYzc37wEcjypR1BNaox4ZZDTjys
	hMWw==
X-Gm-Message-State: AJcUukdZ42khAWRZVL4avs8a45bI5hYFV/cWwcqbluWCzk5nv/c1Wx0y
	SVoeoR0Ttt+AlBid1upM236ld379
X-Google-Smtp-Source: ALg8bN6Ls13Xqer4R8P/5o5M30OJoWzgmiX4yWkQqszN6UW43nurLJ2cOgB3J+y3wM/YBIx+iTJX7g==
X-Received: by 2002:a25:bfc3:: with SMTP id q3mr6973328ybm.420.1547640073358; 
	Wed, 16 Jan 2019 04:01:13 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	o124sm2169655ywe.75.2019.01.16.04.01.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:01:12 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:00:49 +0000
Message-Id: <20190116120051.12182-14-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116120051.12182-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116120051.12182-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3 13/15] util-linux: move /etc/default/mountall into -mount subpackage
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
X-List-Received-Date: Wed, 16 Jan 2019 12:01:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

This should probably be there and now the main package is a real
meta-package only.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 000db880a1..47264028f2 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -44,19 +44,19 @@ python util_linux_binpackages () {
     do_split_packages(d, root='${base_sbindir}',
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
-                      hook=pkg_hook, extra_depends='', prepend=True)
+                      hook=pkg_hook, extra_depends='')
     do_split_packages(d, root='${base_bindir}',
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
-                      hook=pkg_hook, extra_depends='', prepend=True)
+                      hook=pkg_hook, extra_depends='')
     do_split_packages(d, root='${sbindir}',
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
-                      hook=pkg_hook, extra_depends='', prepend=True)
+                      hook=pkg_hook, extra_depends='')
     do_split_packages(d, root='${bindir}',
                       file_regex=r'(.*)', output_pattern='${PN}-%s',
                       description='${PN} %s',
-                      hook=pkg_hook, extra_depends='', prepend=True)
+                      hook=pkg_hook, extra_depends='')
 }
 
 # we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
@@ -92,11 +92,14 @@ PACKAGECONFIG[pylibmount] = "--with-python=3 --enable-pylibmount,--without-pytho
 # Readline support
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN} = ""
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
 FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
 
 FILES_${PN}-last = "${bindir}/lastb"
+FILES_${PN}-mount = "${sysconfdir}/default/mountall"
 FILES_util-linux-runuser = "${sysconfdir}/pam.d/runuser*"
 FILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
 CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
-- 
2.20.1


