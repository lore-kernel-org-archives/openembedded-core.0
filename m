Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 79E6260167
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2014 17:20:19 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z10so7211073ead.34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2014 09:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UFIT6v1k9CEuUJK98U10IbFAKlKLomRQdn7wD9a0OOk=;
	b=DysMTWLc9DF+wCuSkplVJ75YhiigQpJCbMZwSxolFMMbn0HCMzyJoE/n77SVLG4cRv
	lrqfI2bmjB5XZRSNBLsaMzD/aZK5mR3U2ANgMHP6dz9nLD7bpRzjrMbHjRZkzHfqGd+8
	mq1efoW79JeoKnWM67I9wDTQEdguCOh0yHDSHCQcI/XKKP6vx+aMHoL9+JiWbDnWqkNK
	OI7RSc7WQ70ufkWrmkbx3f9RG8O+zPsQEnEnDHDkixzmCWOXYHVTJFTFZPi9XIKgWCpk
	Ozldw5efe2u8SVIuKSp/GTHayaOuymezAbzDghU64zfTCDFQTtP9mrtaMcxkV2QivXK3
	aSIg==
X-Received: by 10.14.53.14 with SMTP id f14mr3929365eec.105.1388856018650;
	Sat, 04 Jan 2014 09:20:18 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	n1sm155077140eep.20.2014.01.04.09.20.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Jan 2014 09:20:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2014 18:20:20 +0100
Message-Id: <1388856020-7274-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [PATCH] python: explicitly disable bluetooth.h check
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
X-List-Received-Date: Sat, 04 Jan 2014 17:20:19 -0000

* bluetooth.h is autodetected from sysroot and influences 2 python files:
  /usr/include/python2.7/pyconfig-32.h
  /usr/lib/python2.7/lib-dynload/_socket.so
* it doesn't link with bluez, so it wasn't detected by
  test-dependencies.sh, but still causes undeterministic builds and
  should be fixed
* we can use PACKAGECONFIG, but I don't expect many people to use bt
  support in python-socket

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/python/python.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 4991b97..5a07665 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -26,5 +26,6 @@ EXTRA_OECONF = "\
   --with-signal-module \
   --enable-shared \
   --enable-ipv6=${@base_contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)} \
+  ac_cv_header_bluetooth_bluetooth_h=no ac_cv_header_bluetooth_h=no \
   ${PYTHONLSBOPTS} \
 "
-- 
1.8.4.3


