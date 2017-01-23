Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 31829605FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 11:12:29 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id r185so63330872ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 03:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ZyoKbAQu/rB7j3oeu7jRYubDSoanm6H1LdoqLiLuc3I=;
	b=jZxWQlAJyRUuNJHeTjmhRWtemX4oHcotSYtoH0xabVbphg2hkIAIaYaTdJVaJdNIsM
	J8AIlzW95QrjWLCPC8ZrWT3lAmb779Zm3cR+KAkSS/YTl07cJdYgYmucU8fecV5ODBtC
	SaKPv3G3iXhfcfYyqjo1heffGhn/hhTXZ3e5kXEJFa0+HkNOvbWLpFgyH1tUaPDIBljk
	RN5gbbnN1yTzrp1cNNtJj7bcXUwEd9Y6eOQx4XqO1TPlUopV1a+YE/zbK0r+MuK5DKl1
	0FrOz+27FGkA1X7i1iKQFuYdvBRU4HXSzyeK8+++iTAPe4jsfyY3SXu7u2PwCWFgTpMj
	qmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZyoKbAQu/rB7j3oeu7jRYubDSoanm6H1LdoqLiLuc3I=;
	b=oYOjs+1ljUNfErSWO2jYNs7gkuyw0TKUlPrSU4sNTxinPybGu7j4+OjngzzlnET1rP
	ejDhBWWXVZIMOfZvfiNtzZP2W/LRqIDs/kAZi9Popc5sqS+Eh7XC1QsZY61aoUPPzjmC
	gmlj09NKtMzA9C6WckvD5zm0e85Rb3y4r8FH6tq4uEoFG9wWhTTnfDJqUIQ7sNB/rsMa
	uFE7wFzPhusDaJCZK1P/wOZ4WYU0vg3iVr8OGvRiaCIFy5eZwFTS6YI6CP1ZInH61DlI
	vdNQIV40I027YHPWwbokekjDJRrYKZxw98uTulDd8FfrrdNg81Lm9YxtoKqhHbbtBx2t
	BK2w==
X-Gm-Message-State: AIkVDXIXmi5eRpP1Yjm8PJmhpMdpybAOj5DbkB9qRPVOipTE39b0byN1eUgXbumlweuX6rrt
X-Received: by 10.36.53.78 with SMTP id k75mr14765529ita.45.1485169949902;
	Mon, 23 Jan 2017 03:12:29 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8FC12.dip0.t-ipconnect.de.
	[93.232.252.18]) by smtp.gmail.com with ESMTPSA id
	z125sm9389271iod.23.2017.01.23.03.12.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 03:12:28 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 12:12:21 +0100
Message-Id: <20170123111221.10509-1-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] runqemu: more verbose error message about missing qemuboot.conf
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
X-List-Received-Date: Mon, 23 Jan 2017 11:12:30 -0000

When invoking "runqemu" with a mistyped image or architecture name,
the resulting error message is about the missing qemuboot.conf,
without any indication about the root cause:

 $ runqemu core-image-mimimal ext4 intel-corei7-64
 runqemu - INFO - Assuming MACHINE = intel-corei7-64
 runqemu - INFO - Running MACHINE=intel-corei7-64 bitbake -e...
 runqemu - INFO - MACHINE: intel-corei7-64
 runqemu - INFO - DEPLOY_DIR_IMAGE: /fast/build/refkit/intel-corei7-64/tmp-glibc/deploy/images/intel-corei7-64
 Traceback (most recent call last):
   File "/work/openembedded-core/scripts/runqemu", line 1095, in <module>
     ret = main()
   File "/work/openembedded-core/scripts/runqemu", line 1082, in main
     config.read_qemuboot()
   File "/work/openembedded-core/scripts/runqemu", line 643, in read_qemuboot
     raise Exception("Failed to find <image>.qemuboot.conf!")
 Exception: Failed to find <image>.qemuboot.conf!

Including the name of the actual file the scripts expects to find plus
adding some hints what to check for might help. The error now is:

 $ runqemu core-image-mimimal ext4 intel-corei7-64
 ...
 Exception: Failed to find <image>.qemuboot.conf = .../tmp-glibc/deploy/images/intel-corei7-64/core-image-mimimal-intel-corei7-64.qemuboot.conf (wrong image name or BSP does not support running under qemu?).

The comment about the BSP is included because that would be the real
reason why the file might be missing.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 10947bb3edc..eaf38384a5b 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -640,7 +640,7 @@ class BaseConfig(object):
             return
 
         if not os.path.exists(self.qemuboot):
-            raise Exception("Failed to find <image>.qemuboot.conf!")
+            raise Exception("Failed to find <image>.qemuboot.conf = %s (wrong image name or BSP does not support running under qemu?)." % self.qemuboot)
 
         logger.info('CONFFILE: %s' % self.qemuboot)
 
-- 
2.11.0


