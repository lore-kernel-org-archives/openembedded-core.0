Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8F6C171A76
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 16:05:53 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id a197so132651339wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 08:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=cyQ/4ziOe6/QZtuWoDPjh7ucEH06NK4bVPcuRMmL00A=;
	b=zb45ehOJiiwMSB37v4V/RL0wlaC7tj6KE6H89q3uxtV69TqrXo741IL+kuOdkFlSsk
	JtLLQEoOq4xkzrupvLIeevLjwwJ3Tgo4rY7tx5Ghb/9BtLDYe3+hPxgZuGox61juyclH
	1paoGE0mpRVXjeU68miVIiUFxRdgtjWt5fL+gDCXSjghfjVik8cYqvHicvvAmXCo2Th0
	hfhbze/akUwcpqx0HMwFravVAr7fQPDi6WuloyWMeOCGSQR/SlxZh4/J1xaNDd2+xMxe
	/mrHd9wy6omSm/TRdmA57Ri2cZzj6OZFg7mnx6tguWgZFe7JEHfAPMZLJLiY9tgOlMxZ
	b+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cyQ/4ziOe6/QZtuWoDPjh7ucEH06NK4bVPcuRMmL00A=;
	b=qF/2jayTCCfvFqStPUdmIr2Ym2yQaXsQ8/pjHKh6Ws6Vj7YYZLyrVBdyUg/zuXxYz/
	slQvPGgroGI+/9xok9c7TmoWb8MNmT7F/LriBx1ecFTyJ9A5I+DzDYQnzcP7tJaIK38H
	sZLyKJVr05+zmqs/3KGC8EChdzXeI18fzmC7uPrD4TQ1AD01eIZRBS/sgwp/TwISA1xA
	cPsqgp85a6skl14Jhtg8AHKfhE4GJ9a2tdR12s1QH32Rzpr4VJ44UtW7H7We+QCUXgOO
	lvH10cBPwc/Sg5HpBCYohtdvS0Cc0gx78fENwvkpklEqw15dHgQtcwbmioH7f38alzne
	1Rjw==
X-Gm-Message-State: AIkVDXIsMTLzrxB3QT1lWDdJf7bh0Wo+svl8UpWbt3t0TQtZ2+a0nKLoTcZC3CJ/qK36FfLL
X-Received: by 10.28.135.3 with SMTP id j3mr2234266wmd.96.1484064353145;
	Tue, 10 Jan 2017 08:05:53 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	di9sm3958074wjc.37.2017.01.10.08.05.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jan 2017 08:05:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 16:05:48 +0000
Message-Id: <1484064348-22446-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1484064348-22446-1-git-send-email-ross.burton@intel.com>
References: <1484064348-22446-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] rootfs: don't put /usr/lib/ssl and /etc into debugfs
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
X-List-Received-Date: Tue, 10 Jan 2017 16:05:54 -0000

The /etc and /usr/lib/ssl directories were only put into the opkg-generated
debugfs because of a bug in opkg which means that a conffile has to exist if
we're running 'opkg status'.  This is now fixed, so the workaround can be
reverted.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index d9a4730..274ddb8 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -952,7 +952,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-        self._setup_dbg_rootfs(['/etc', '/var/lib/opkg', '/usr/lib/ssl'])
+        self._setup_dbg_rootfs(['/var/lib/opkg'])
 
         execute_pre_post_process(self.d, opkg_post_process_cmds)
 
-- 
2.8.1


