Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9AFA57E051
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:12:10 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id e15so14808622wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SNQxXDkfkm8tZeKBQZ/TP9mRogF1EMjRp1xdnNM/+Qg=;
	b=Wl1ELRyvT+35utMG3rfZpRwR9WB2Wv9eMgenVV2f7qlEAP8zdR6YhNQn8/EtWQq8t1
	AsqrrpUr3BmY4v4/T/CLluAMAKww9BSHpeWEFNWv8D/3VUcMN1x5MDO734J7ttOVUsIk
	GGJi3mQpb8u2hX6bVQFBmNcmSJl5yl0L8W3/sj909IhlVfGFPrXa2fTKdBYCdWO7Nkyz
	eNtqCc2qbXWzW6I25DkOJEAFl64fdoAlIVYmS3h9Pd0TprXdHUMPRxI+pBLFot2PHJUQ
	fOUjJEaCz+ImcaHrzl4chicfQS9ApVgXA+SQ7ptc6Qfu8enuY+GL4WPJT2cvOIFCLDqO
	Giqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SNQxXDkfkm8tZeKBQZ/TP9mRogF1EMjRp1xdnNM/+Qg=;
	b=fD/FxKJRrDu967ntyfwxIZIoZdgs4X7MwaowZqxTXHwYb3KWzG0sgFYCzoq/cPxqfk
	b4jU3wJ2JzFQpQog0la3kGK8ZPI/3cjyCn0jcbOkcJv8gnb43eDODUBg5V9kRPJyOhnl
	yHII2jH5FImxwAz0dKOl9nblJLlQ9lXn2B9iia3Mgs+kWHeD8BqPZ9K14j5E3UDO6CmM
	LKICyht0fcNn2547BgvP0mlMiGP73DgdEubHwA9fNRmQrWyr0CrHfZM/mW+NEx/HVmoY
	c8Jc9Jkv+xCgYt7M4BPmQFbrytU0R7Z9oBZJxbMG/kK1RNPZgkU/WiOwLbGVbhZkcUOb
	fCSA==
X-Gm-Message-State: APjAAAX9gLubSRgJyYQkJEWoJYYo4xkrmAoz/nb84rRy+jFBoMG/G1LB
	n6YS367chktkC/9b8JAB/roQrh9t
X-Google-Smtp-Source: APXvYqzpGs8b2vXnMZCjNiRQBsxRocx52r79/kqUcoyU5bknwriaXPCzLeI61+fpu7yBym1EJb6btw==
X-Received: by 2002:a5d:4647:: with SMTP id j7mr10810392wrs.280.1558361531157; 
	Mon, 20 May 2019 07:12:11 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.12.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:12:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:22 +0200
Message-Id: <20190520141125.10805-39-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Cc: Tom Rini <trini@konsulko.com>
Subject: [PATCH 39/42] vim: Rework things so vim adds features not vim-tiny removes
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
X-List-Received-Date: Mon, 20 May 2019 14:12:10 -0000

From: Tom Rini <trini@konsulko.com>

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
index 139e626e444..e4c26d23f69 100644
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
index f5c74684bfa..433f2334482 100644
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
index baaaacc0b77..60946a181f4 100644
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
2.17.1


