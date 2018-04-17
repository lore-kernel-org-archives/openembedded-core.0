Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4367E6059F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 00:43:57 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id n14-v6so7170879lfe.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 17:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=R2KNEtrpGlthLehzxTMa7ng4kkCVuOusToDT5UieId8=;
	b=NTAsmTwjkG1vOeZW92qyd7aN8qEycJIzoGU6vKixHi7DK2exGozh8jU7YwM00zPfOH
	Ptl8+HWKN9wzmkQVH5T+zuHIE+I2GzJlM4SoECIwNMOqIGMVrQkrG7GWB6t/Q1H2yKcv
	1f1Z/zb5j/KbxbDIVDcloo7ADOD6JUIteDA2KOounRHpDQSunIzd+GQ7/bkVG5LDCpqu
	uPp/hQr7g0mMQQh0h0soYMZ0G/5DXyK7lKw1wFfO9Md1RopxciHBfmDS0GvN/Ml4PjuD
	JHags3K6ZtOug42GRL5URjyojn0a9r3xeVBOl+q2ELkjsJSaExIr3gT4VXKDXK0yyK0O
	hyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=R2KNEtrpGlthLehzxTMa7ng4kkCVuOusToDT5UieId8=;
	b=SsDkS+thMbIrroKQUzIWQnrJO8aFyzKJgi78uuagYBx2+1YjLU8lA4401hiN+5KjJ6
	dnm1COvLVmskNhw0Y62oiEEuG8U9AxYcqjsXVyJ3NJNvGHWCQWpJH3HzaKbKAfp7uJAH
	SE2xVKY7TUYgqu9wMv8rk+fyWtfgWxThxMpkG+vaHq5QaCZAqy+vbBU1VcugQGhgIXQv
	/kVYUJYqrraODm4wtCNfdeO4zpvqkOJUDT67AMIDXKI5HtqqZ96lwUCea6H09c4x7rTn
	1ywfuwaiv1+/oFcaIcUk4SIy/GFjvgsWRUjSLpfrTlK7Lz/QeelgC6ZHpMa9g6JamDId
	43tQ==
X-Gm-Message-State: ALQs6tDSvTGyloMLgjWjXX4xbaORlQ5FvJA1q2k6kal1lb3VHZskZNmn
	KeEbqirgD0JFZ7tDdm6Mj2iOjQ==
X-Google-Smtp-Source: AIpwx48+J0bpPlGDJ/FS3ROTRmwiup1G+6VnkXd5EioL4YSFxyzZr2RqLFQtR4zgIWCdggso7n90TA==
X-Received: by 10.46.155.79 with SMTP id o15mr519365ljj.49.1523925838299;
	Mon, 16 Apr 2018 17:43:58 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan (d83-183-77-184.cust.tele2.se.
	[83.183.77.184]) by smtp.gmail.com with ESMTPSA id
	i27-v6sm1306448lfb.41.2018.04.16.17.43.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Apr 2018 17:43:51 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2018 02:43:44 +0200
Message-Id: <1523925824-2492-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH V3] externalsrc.bbclass: introduce INHIBIT_SRCTREE_FILE_CHECKSUMS
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
X-List-Received-Date: Tue, 17 Apr 2018 00:43:58 -0000

From: Ming Liu <liu.ming50@gmail.com>

It defaults to be '0', but it allows the developers to choose not add
file-checksums to do_compile for the entire source tree, by setting to
'1'.

We need this because we have a huge project with 100G bytes source
files, and we do not want them to be added to file-checksums variable
flag.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/externalsrc.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index c9f5cf7..2b83193 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -26,6 +26,7 @@
 
 SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
 EXTERNALSRC_SYMLINKS ?= "oe-workdir:${WORKDIR} oe-logs:${T}"
+INHIBIT_SRCTREE_FILE_CHECKSUMS ?= "0"
 
 python () {
     externalsrc = d.getVar('EXTERNALSRC')
@@ -212,7 +213,7 @@ def srctree_hash_files(d, srcdir=None):
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
         ret = oe_hash_file + ':True'
-    else:
+    elif not d.getVar('INHIBIT_SRCTREE_FILE_CHECKSUMS'):
         ret = s_dir + '/*:True'
     return ret
 
-- 
2.7.4


