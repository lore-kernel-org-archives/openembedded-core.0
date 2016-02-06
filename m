Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0E09B77280
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:34 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 71so1869537pfv.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=QuBFcvlreci0MfqmWkUKIdHJm10FZIIlbiT/kmBFJXY=;
	b=bDXXPk3HVTQC/U8HXvjUK6l1s7TMe+oTS2oB7C0zFPGiiQ3J8v7uA17zM/QT/7d3c+
	4w8s/uKNv4afaTUpgRsZNbCk8ajUmTHCnsIqxqAmF+Y9uNoRxYhZLNk9F9XhXKAOwKLN
	sIYqVTicA4nJSv/bQlTedYxMnJkXboQyEko7aUyqy+OU+JdlFzlVFe5fOXVCZKZAmQI5
	lETag5Y/Y8a6/ggMzXKEzF3cQ59p6U9fKOFHmacruBjIEjXD7eN8sS1BbCMBh5Lzqomd
	vlRC7YFbgsAg1KIa4nKZ8RPB5P1LcAbdGhXtthWfmuHUeBJasyfrkVtjUIPvtoHIWK1e
	NY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=QuBFcvlreci0MfqmWkUKIdHJm10FZIIlbiT/kmBFJXY=;
	b=gojeu6W/ghFeZsIhXtFH2Tt5t3/JNLB6xsGQrN73LDg4YlX6O9kAAmG4wwgF60XvJL
	gip21cn/+V0SrVYFy0fFW1XpfwPSuKag7WtiM7kY6GR488B+ePUJBmIAkAUo4BDGftSK
	Yo5r1xjOaFMzI29RLRF7X2Ht1LQ0rPhBFAcaZJJwkqQRVH54v/NfgVAKu4kzfMmBLaV6
	2jWuBFTYe75a+qeQLAyb13gxZSF4qyfTz2Tk7ZKXGmR30vzTzUSt7SAEBDfZnb34kTcv
	SWKvVai2ys6875ioQ16bk9KtgqeqtWXEs85SjmzfD2Bdy+fSN9wzVT+wYEh1b56bLHgc
	jjpA==
X-Gm-Message-State: AG10YOTDhYpXlR2orpOr6BBrMAlMWfFrBIOeJz9WELdE9LFHL/IRLSvK8Hl1ex5DcUJgVw==
X-Received: by 10.98.89.4 with SMTP id n4mr30385422pfb.81.1454800535111;
	Sat, 06 Feb 2016 15:15:35 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:53 -0800
Message-Id: <cb9c6d727df7a313294540b13458c4abfba188de.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 12/21] qemu: Security fix CVE-2015-8345
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:34 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8345 Qemu: net: eepro100: infinite loop in processing command block list

(From OE-Core rev: 99ffcd66895e4ba064542a1797057e45ec4d3220)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2015-8345.patch | 73 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.2.0.bb           |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-8345.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2015-8345.patch b/meta/recipes-devtools/qemu/qemu/CVE-2015-8345.patch
new file mode 100644
index 0000000..310b458
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2015-8345.patch
@@ -0,0 +1,73 @@
+From 00837731d254908a841d69298a4f9f077babaf24 Mon Sep 17 00:00:00 2001
+From: Stefan Weil <sw@weilnetz.de>
+Date: Fri, 20 Nov 2015 08:42:33 +0100
+Subject: [PATCH] eepro100: Prevent two endless loops
+
+http://lists.nongnu.org/archive/html/qemu-devel/2015-11/msg04592.html
+shows an example how an endless loop in function action_command can
+be achieved.
+
+During my code review, I noticed a 2nd case which can result in an
+endless loop.
+
+Reported-by: Qinghao Tang <luodalongde@gmail.com>
+Signed-off-by: Stefan Weil <sw@weilnetz.de>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport
+
+http://git.qemu.org/?p=qemu.git;a=commit;h=00837731d254908a841d69298a4f9f077babaf24
+
+CVE: CVE-2015-8345
+[Yocto # 9013]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/net/eepro100.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
+index 60333b7..685a478 100644
+--- a/hw/net/eepro100.c
++++ b/hw/net/eepro100.c
+@@ -774,6 +774,11 @@ static void tx_command(EEPRO100State *s)
+ #if 0
+         uint16_t tx_buffer_el = lduw_le_pci_dma(&s->dev, tbd_address + 6);
+ #endif
++        if (tx_buffer_size == 0) {
++            /* Prevent an endless loop. */
++            logout("loop in %s:%u\n", __FILE__, __LINE__);
++            break;
++        }
+         tbd_address += 8;
+         TRACE(RXTX, logout
+             ("TBD (simplified mode): buffer address 0x%08x, size 0x%04x\n",
+@@ -855,6 +860,10 @@ static void set_multicast_list(EEPRO100State *s)
+ 
+ static void action_command(EEPRO100State *s)
+ {
++    /* The loop below won't stop if it gets special handcrafted data.
++       Therefore we limit the number of iterations. */
++    unsigned max_loop_count = 16;
++
+     for (;;) {
+         bool bit_el;
+         bool bit_s;
+@@ -870,6 +879,13 @@ static void action_command(EEPRO100State *s)
+ #if 0
+         bool bit_sf = ((s->tx.command & COMMAND_SF) != 0);
+ #endif
++
++        if (max_loop_count-- == 0) {
++            /* Prevent an endless loop. */
++            logout("loop in %s:%u\n", __FILE__, __LINE__);
++            break;
++        }
++
+         s->cu_offset = s->tx.link;
+         TRACE(OTHER,
+               logout("val=(cu start), status=0x%04x, command=0x%04x, link=0x%08x\n",
+-- 
+2.3.5
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.2.0.bb b/meta/recipes-devtools/qemu/qemu_2.2.0.bb
index 950917e..72fda62 100644
--- a/meta/recipes-devtools/qemu/qemu_2.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.2.0.bb
@@ -23,6 +23,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://CVE-2015-8504.patch \
             file://CVE-2015-7504.patch \
             file://CVE-2015-7512.patch \
+            file://CVE-2015-8345.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f7a5e2da22d057eb838a91da7aff43c8"
-- 
2.3.5


