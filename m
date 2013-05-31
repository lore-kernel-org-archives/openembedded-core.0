Return-Path: <kergoth@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0B96A4E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 02:26:36 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id v19so1996608obq.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 19:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=nXIMB8hrjXI1l3vhWEe8ETYkiNmJsoAiNaBpKP+E85s=;
	b=OatESe/QQOEXLVoreL3JlcNfNF+owizeifRclL6S/3fOJvwvYssGkmWt9QWCk/ri3V
	tTbFfTN3VxazWwd6/cUGd2Y/9vVFwJnLMqHx4cyYMp0ZKmRU6RnBKUuBFeRHhg3y1cDq
	EWv5jJo7G+atqvgch4MXil9Xe4Y5oTY3nlMCD9D8d9X3OLRqqMOWB9X3UxWm8FmtPrpR
	8O82D0kcDXGD5B1JAGlR78+ecl7M4piEWwBcEYJz6oL+eS3cnN5hSWqyM27sfR/4ou78
	xKvjxvKV3Rw3iC3S2Dr/yNgFgxwznkBqfGTnzMauYoGzL55GPv1j2p1OeCR5jDm8HmVv
	zi6Q==
X-Received: by 10.60.161.68 with SMTP id xq4mr5301202oeb.8.1369967197186;
	Thu, 30 May 2013 19:26:37 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id sa2sm14397164oeb.1.2013.05.30.19.26.35
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 19:26:36 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 19:26:28 -0700
Message-Id: <7f7e2e1e4896b4d459bb6252e84377afbfde7e19.1369967097.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1369967097.git.chris_larson@mentor.com>
References: <cover.1369967097.git.chris_larson@mentor.com>
In-Reply-To: <cover.1369967097.git.chris_larson@mentor.com>
References: <cover.1369967097.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/5] portmap: obey 'tcp-wrappers' PACKAGECONFIG
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
X-List-Received-Date: Fri, 31 May 2013 02:26:36 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-connectivity/portmap/portmap_6.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/portmap/portmap_6.0.bb b/meta/recipes-connectivity/portmap/portmap_6.0.bb
index 07aa360..2ec6981 100644
--- a/meta/recipes-connectivity/portmap/portmap_6.0.bb
+++ b/meta/recipes-connectivity/portmap/portmap_6.0.bb
@@ -1,6 +1,5 @@
 require portmap.inc
 
-DEPENDS += "tcp-wrappers"
 PR = "r7"
 
 SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/portmap-6.0.tgz \
@@ -13,8 +12,12 @@ SRC_URI[sha256sum] = "02c820d39f3e6e729d1bea3287a2d8a6c684f1006fb9612f97dcad4a28
 
 S = "${WORKDIR}/${BPN}_${PV}/"
 
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[tcp-wrappers] = ",,tcp-wrappers"
+
 CPPFLAGS += "-DFACILITY=LOG_DAEMON -DENABLE_DNS -DHOSTS_ACCESS"
 CFLAGS += "-Wall -Wstrict-prototypes -fPIC"
+EXTRA_OEMAKE += "'NO_TCP_WRAPPER=${@base_contains('PACKAGECONFIG', 'tcp-wrappers', '', '1', d)}'"
 
 fakeroot do_install() {
     install -d ${D}${mandir}/man8/ ${D}${base_sbindir} ${D}${sysconfdir}/init.d
-- 
1.8.3


