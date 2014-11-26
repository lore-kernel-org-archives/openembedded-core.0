Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0A38272333
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 16:22:43 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id g10so3066581pdj.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 08:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=DlO1lm+GVHevht601DMfOaawo0N7bJM376mYQb9jskE=;
	b=BHIy7QOjEtJ60hH0772CrPa6vwJ9w4LVggcOvZSPCOAFTWQpU5kHGb8wa9Y1JT+iUC
	ha7l/3XDPs5m90GmKmb3aaEiQ3aNh7HlhXTmJrnBxCKBPD4UaC5aO+Huy4U8Y+tjDfKK
	E7N3RMQxZ5YXt1RHT+GumWxCPl76R3bmIOzfIIgJEGJikbJDbdpljP8QjV4GogDXQvId
	81Rj5olAEx/IiITqEqOWcBsk6qb2LaEP+NUM6WaSR6x1XAbzuK2fHtaySrJRxILlkxuQ
	GVKcyqP4gXbLpcgLqi1AqyVc3q9s/+bcH64rKmr67je4SJ/32uo1DCpF/70akbZduzZi
	/vRg==
X-Received: by 10.70.96.145 with SMTP id ds17mr31196538pdb.88.1417018964406;
	Wed, 26 Nov 2014 08:22:44 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id qn1sm4736673pdb.42.2014.11.26.08.22.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Nov 2014 08:22:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 08:22:14 -0800
Message-Id: <ae8fbbe4bd999ce8d2391fe2872ff4bc9574f8c8.1417018567.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
References: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
In-Reply-To: <cover.1417018567.git.akuster808@gmail.com>
References: <cover.1417018567.git.akuster808@gmail.com>
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH 10/11] xkeyboard-config: Inherit gettext
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
X-List-Received-Date: Wed, 26 Nov 2014 16:22:44 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

In a GPLv3-free build we have two different versions of gettext in sysroot due
to GPLv3 restrictions. In this case we need gettext-native too so we can have
the needed macros and avoid errors like:
"error: possibly undefined macro: AM_GNU_GETTEXT"

The needed dependency is added by gettext class which is prefered because it
takes care of NLS flags too.

(From OE-Core rev: 23d8a4d64e9ff126d6460a69e6d086b1c86e87a9)

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb
index 61e3847..adac0ee 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.12.bb
@@ -23,7 +23,7 @@ EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
 
 FILES_${PN} += "${datadir}/X11/xkb"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gettext
 
 do_install_append () {
     install -d ${D}${datadir}/X11/xkb/compiled
-- 
1.9.1


