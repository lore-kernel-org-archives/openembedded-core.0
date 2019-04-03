Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 353397D277
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 11:54:59 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r4so20912971wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 04:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yAW7L4s0mCb5Vg6c0zyMLyfYgpmczixbvVKxuJ6A1fE=;
	b=hoIWMRuqGRASGxszILet76rtqdfl+Xqa93t/XVS5Fbe4iEJc0G131TjFwAKiYoAYk+
	0ALWwr367UUgFS9Sp5eX7JHI6hrCddrFhSDvor1cbCl0JkmluE2+7GPq3kfzibeaRsE8
	q4f4OouJAJUzyuG215R2ZZiFILE6myLO//bzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yAW7L4s0mCb5Vg6c0zyMLyfYgpmczixbvVKxuJ6A1fE=;
	b=aINWJxxM5HLv8VUrhaDBW87nwCi04OaT0okmMx8h40rrnnUfZCySsAJMej44cVy+eQ
	JpGYh5TCsG1X66EzV+XXO0/tJO8LMZVRCKqVn71G8xin2IzcXI/18HWLsOknKxadL4c0
	fh/P82azliJ9S4w91XOaP1axKuCHBz0DGkqb9aXQehSDpAurIgKWYiC+THpEyi7Cebiz
	fpMwkVHTfUCFJwH46jkHPfUWROfUsDPQm091l+1ou0Jtc4EqVgBSIz6GdytUcxJKtpK0
	2ythTljJ0FgJG1L8gePud+gdWmjlmcVYpwF1cDPWMXN5U3uXnwyYWX/dLIzkzzBvI7kS
	ZC9Q==
X-Gm-Message-State: APjAAAV1XErogUNx41Zdtl5Ep6V0faIHrm759pNGmWwS9qycNRlJej5Z
	nrzCBwLcQ/heptClimrOKGZrNuZxNmaiig==
X-Google-Smtp-Source: APXvYqwyhtQzU01PspdCO2LB2UvEwXGD53Gezujzj1zD8/g3Y8UIR8gJcdrSJ8phQNCTN8yTAuM7og==
X-Received: by 2002:adf:ed8a:: with SMTP id c10mr2653667wro.40.1554292499616; 
	Wed, 03 Apr 2019 04:54:59 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x205sm12631025wmg.9.2019.04.03.04.54.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 04:54:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 12:54:58 +0100
Message-Id: <20190403115458.28172-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] wic/engine: Add missing newline
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
X-List-Received-Date: Wed, 03 Apr 2019 11:54:59 -0000
Content-Transfer-Encoding: 8bit

On some hosts the wic.Wic2.test_wic_cp_ext selftest was failing as files weren't
being copied into the rootfs with "wic cp". This was due to a bug added by:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=89d4a8df074598cfb3a76e41db7c45d845afd961

where there should be a second newline added at the end of the expression due
to the difference in the way echo -e and printf behave.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/wic/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index ea600d2854e..ab33fa6042e 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -338,7 +338,7 @@ class Disk:
     def copy(self, src, pnum, path):
         """Copy partition image into wic image."""
         if self.partitions[pnum].fstype.startswith('ext'):
-            cmd = "printf 'cd {}\nwrite {} {}' | {} -w {}".\
+            cmd = "printf 'cd {}\nwrite {} {}\n' | {} -w {}".\
                       format(path, src, os.path.basename(src),
                              self.debugfs, self._get_part_image(pnum))
         else: # fat
-- 
2.20.1


