Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qe0-f47.google.com (mail-qe0-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3939A6AE7C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 18:46:40 +0000 (UTC)
Received: by mail-qe0-f47.google.com with SMTP id b10so676592qen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 11:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=SRnLiGYjw57Es4+NO8941uXenfcQuSB8wbxSK8/Sk/w=;
	b=GCD/fxsXAsftjeNyDlEH0gjSG5A09JMAnjfcuEz/ZLnk8rRHxcSSAMZ38s+510ddtV
	Ci2v0bQgNghL0l3xXM3/wEbwyGFgswHbGVmPvM/zZnqZEdknsnBJq9Kpyh6+0iOITlMT
	gw1FKmiCWzslfwtP/isdB21UFv1jPHItSIFLVOULQZb3IMonc7iGhksR8QcAe8mGXhnH
	+kytTFZaAYkGjNkieyrXoORB+KD2nyyDF40td9mdoLUPV6OErxIr9tEocUpBxnpK2Ksg
	fsnDwbZHR7FVyl92POQKcvHtfpHcs/YNvgQznyjaW1jCUpdnZJEuQPGLyBBrIu2obcJf
	oLPg==
X-Received: by 10.224.46.202 with SMTP id k10mr20993543qaf.63.1376592400317;
	Thu, 15 Aug 2013 11:46:40 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id e8sm477539qai.1.2013.08.15.11.46.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 11:46:39 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Aug 2013 15:46:22 -0300
Message-Id: <1376592382-5034-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 1/2] default-distrovars.inc: Add 'DISTRO_FEATURES_DEFAULT' variable
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
X-List-Received-Date: Thu, 15 Aug 2013 18:46:41 -0000

When making distributions based on the default distro-less config, it
is useful to be able to reuse the default DISTRO_FEATURES options
without the need of duplication. The new variable,
DISTRO_FEATURES_DEFAULT, allow this reuse and customization.

So distros can include 'default-distrovars.inc' and use:

,----[ Use example ]
| DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} myfeature"
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v3:
- Cc oe-core

Changes in v2:
- new patch

 meta/conf/distro/include/default-distrovars.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 45f00ce..d275525 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -9,6 +9,7 @@ LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
 ENABLE_BINARY_LOCALE_GENERATION ?= "1"
 LOCALE_UTF8_ONLY ?= "0"
 
+DISTRO_FEATURES_DEFAULT ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
 DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
 					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
 					libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales libc-locale-code \
@@ -17,7 +18,7 @@ DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-b
 					libc-posix-wchar-io"
 DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
 DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
-DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 ${DISTRO_FEATURES_LIBC}"
+DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
 
 IMAGE_FEATURES ?= ""
 
-- 
1.8.4.rc1


