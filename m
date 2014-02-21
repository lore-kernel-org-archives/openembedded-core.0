Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 85AB66EE43
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 04:37:54 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id bj1so2896068pad.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 20:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rpl9st3YGzoaLu62SIBD9pTGGhDKs8wg30bAPHK3cZU=;
	b=dBOMk7xJ1g2ic/DKz8HdTPxPqUjjipQHEyyaHxcdk0mAg7IsSNYpJtyTjgG1lCWMzQ
	XLEhiF6oDOyTw+ZvwSzYiN1PR18Q+btwnKnWOhoIV2vb7c5ayoEYgfcN0wgBjyTcdhlv
	DBgpMKIWvj73/t4NR0k/MbvUqtPT0Ti9t+Tp/qx2lwBzHzSsFlwNguNLy0DzzrkmnKXM
	MoFVUBIVlGEu/6W4NWXWbs0vMEh6mfx4Io8zBciXC46CDFjQJR8ZUq2S7hxcFbqpJVSf
	x3FlA1k5fhVDGTaghHShVjerwQX/aswrFNYZCj35xCNLtnhwO7Q9zQv5j/Ix/dNoDt3M
	y50Q==
X-Received: by 10.66.163.2 with SMTP id ye2mr6577208pab.110.1392957475619;
	Thu, 20 Feb 2014 20:37:55 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id cz3sm16780635pbc.9.2014.02.20.20.37.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Feb 2014 20:37:54 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2014 15:42:17 +1100
Message-Id: <1392957737-959-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.5.4
Subject: [PATCH] systemd: fix console-kit-log-system-start.service startup
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
X-List-Received-Date: Fri, 21 Feb 2014 04:37:56 -0000

console-kit-log-system-start.service fails to to start if the
/var/log/ConsoleKit directory does not exist. Normally it is created
automatically but as we mount a tmpfs at /var/log, we need to add
a tmpfiles.d entry to create it.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd/00-create-volatile.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
index 9ffa88e..dc6b462 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -4,4 +4,5 @@
 
 
 d		/var/volatile/log		-	-	-	-
+d		/var/volatile/log/ConsoleKit		-	-	-	-
 d		/var/volatile/tmp		-	-	-	-
-- 
1.8.5.4


