Return-Path: <tom.rini@gmail.com>
Received: from mail-yw1-f52.google.com (mail-yw1-f52.google.com
	[209.85.161.52])
	by mail.openembedded.org (Postfix) with ESMTP id E54D47D533
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 18:34:17 +0000 (UTC)
Received: by mail-yw1-f52.google.com with SMTP id 186so4106112ywo.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 11:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xkoBFZeIhmCZXGzn9wTIXpDWkOZ29md7zClP6CEX0dg=;
	b=tJq7CeTF0TnN8KPIfea+fFpKaslz0qjJ4uBBxbEYsTGJ+Q8tnQkh+lAuxE1F3THwvX
	Uz5nFLoFmDlvat9ncfcC/CxhBmaJQ0EOx7zvmlbP0ijZ0WWHobfdKnV5Z2DXEwx0DFM2
	PckzaHBbfK3TByL7P0K282bIjfJjA3tJbRe7XrSFy0O8KUq7/LCmORGoy+jTFIIr9dWh
	4ww/WTsoYX8WbpbrQUKphvMuqUZsZNWyMIHd7LRnaS2KBaqdC5P2BkiwY1uUX9+8IVNP
	2pMpPyzbpfL0N9cqMwM5gCBpl1ZylZSa4tkzG8zwMXqBjsw/c7d287gSZ+DIFmylOH4+
	Ao5Q==
X-Gm-Message-State: APjAAAUEwbhzxHHoX6QdPQ0Rqk3Qk8a3cgGjsmq++TLcV4di/3AODmRq
	UAzw+iMxFEviKuysiJdfYOeKMGs=
X-Google-Smtp-Source: APXvYqzEy7DybmdEPr+GUOlnRcuhxhM2/VXqHGT1hqCsdt9nBKnIl8KZE3SQ/MTlGnQjwiMjW54bXA==
X-Received: by 2002:a0d:eb89:: with SMTP id
	u131mr18331318ywe.190.1558204458582; 
	Sat, 18 May 2019 11:34:18 -0700 (PDT)
Received: from bill-the-cat.local (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	t203sm5556388ywt.6.2019.05.18.11.34.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 May 2019 11:34:17 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 May 2019 14:34:13 -0400
Message-Id: <1558204453-8142-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20190517135309.116495-1-alex.kanavin@gmail.com>
References: <20190517135309.116495-1-alex.kanavin@gmail.com>
Subject: [PATCH] vim: Rework things so vim adds features not vim-tiny removes
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
X-List-Received-Date: Sat, 18 May 2019 18:34:18 -0000

Now that we have a common inc file for both vim and vim-tiny move a few
bits of logic out of vim.inc and in to vim_$VER.bb so that vim adds
things rather than vim-tiny removes them.

Suggested-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/recipes-support/vim/vim-tiny_8.1.1240.bb | 3 ---
 meta/recipes-support/vim/vim.inc              | 8 +-------
 meta/recipes-support/vim/vim_8.1.1240.bb      | 9 +++++++++
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
index 139e626e4444..e4c26d23f69d 100644
--- a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
+++ b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
@@ -2,9 +2,6 @@ require vim.inc
 
 SUMMARY += " (with tiny features)"
 
-PROVIDES_remove = "xxd"
-ALTERNATIVE_${PN}_remove = "xxd"
-
 PACKAGECONFIG += "tiny"
 
 do_install() {
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index f5c74684bfa7..433f23344826 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -1,7 +1,6 @@
 SUMMARY = "Vi IMproved - enhanced vi editor"
 SECTION = "console/utils"
 
-PROVIDES = "xxd"
 DEPENDS = "ncurses gettext-native"
 # vimdiff doesn't like busybox diff
 RSUGGESTS_${PN} = "diffutils"
@@ -52,7 +51,6 @@ PACKAGECONFIG += " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
 "
-PACKAGECONFIG_class-native = ""
 
 PACKAGECONFIG[gtkgui] = "--enable-gui=gtk2,--enable-gui=no,gtk+,"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
@@ -130,12 +128,8 @@ RDEPENDS_${BPN} = "ncurses-terminfo-base"
 # Recommend that runtime data is installed along with vim
 RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
 
-ALTERNATIVE_${PN} = "vi vim xxd"
+ALTERNATIVE_${PN} = "vi vim"
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
 ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
 ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
-ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
-ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/vim/vim_8.1.1240.bb b/meta/recipes-support/vim/vim_8.1.1240.bb
index baaaacc0b77f..60946a181f42 100644
--- a/meta/recipes-support/vim/vim_8.1.1240.bb
+++ b/meta/recipes-support/vim/vim_8.1.1240.bb
@@ -1 +1,10 @@
 require vim.inc
+
+PROVIDES = "xxd"
+
+PACKAGECONFIG_class-native = ""
+BBCLASSEXTEND = "native"
+
+ALTERNATIVE_${PN}_append = " xxd"
+ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
+ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
-- 
2.7.4


