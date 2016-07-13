Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1F3DB6067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 14:36:16 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id i5so72521868wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 07:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JUSjmmF1yoNg+l9mGpihxsboXiW39i3qnSrl2UYbECo=;
	b=AaxupoffOmtGTx76Huucs4itJ2k1Qq7WWTRQnZbFUg3kJW5BzEic4zCc1HkO74NKNT
	f43/EkrriXrYEyWN27nrBp9kBDpDah5U+teqd0gU07JqiAYiQ+l6jVrG4Tkbe4NsTOxe
	5Omy0LYNvzFstRzlK/vsHZAeHjLHRcIDvgycliJ7RK7ficyRidXMX8x6bHG0YIQ94EaQ
	k5FYETlnCs+txAQab1iqRz8uKWmYOphx7oC/1E5EEwxO5CicGItMaUvYVQRfc6FBDY7Q
	u7VWdVMDWGqqHpMj80c4jfHx2405ugGWGmZVkJouVtBxBBQouzYiy0lnM4u6fV2Awuse
	c+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JUSjmmF1yoNg+l9mGpihxsboXiW39i3qnSrl2UYbECo=;
	b=M2d3qlheplrCFzAxVA1rg2Mlhh5dstvmS7FYzaUZBaeoBC+Zb995DZ46trJMXRuxsd
	X8ic7LysY05Tx/OtcFbYrzot1FivbaVBa8JfKLYBPuz8dKtj9NqpxYjwPO65RT1vJnCc
	jRXqyCtc8CxvweQc5bYvJkhk+wseLejychiWwoFaYkzrWmY8uIzt1/67FugD4LQHIOPq
	ij0T/rBUP1hL4aAnmJhQQayS8L9IvrUKwR1mF6/kk1+YZE9QPXHWn/BPdAd/Z+Eg+ejn
	Zv8e1DnbaocuKCCGFW5nRLbhGVOjXjF9aNCvu4aDs68+/6xcCKyg14ds2AqGAaVq5n+V
	CY0Q==
X-Gm-Message-State: ALyK8tLlZ+WQ4UqBw3PNy50FyZujE+LUIzKPcGVqCR1u9el7L7RtOxb0afiTBGyLEqEkSVCU
X-Received: by 10.194.5.97 with SMTP id r1mr1420511wjr.36.1468420576891;
	Wed, 13 Jul 2016 07:36:16 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	d80sm9041144wmd.14.2016.07.13.07.36.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Jul 2016 07:36:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2016 15:36:14 +0100
Message-Id: <1468420574-13115-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] oe/lib/package: handle shlibs files disappearing
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
X-List-Received-Date: Wed, 13 Jul 2016 14:36:17 -0000

During a parallel build it's possible for unrelated shlib files to be removed if
the recipe they came from is about to be rebuilt.  They can't be involved in the
dependency chains as otherwise they wouldn't be removed, so just silently handle
files disappearing.

[ YOCTO #8555 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/package.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index faa0ab2..02642f2 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -114,7 +114,12 @@ def read_shlib_providers(d):
             m = list_re.match(file)
             if m:
                 dep_pkg = m.group(1)
-                fd = open(os.path.join(dir, file))
+                try:
+                    fd = open(os.path.join(dir, file))
+                except IOError:
+                    # During a build unrelated shlib files may be deleted, so
+                    # handle files disappearing between the listdirs and open.
+                    continue
                 lines = fd.readlines()
                 fd.close()
                 for l in lines:
-- 
2.8.1


