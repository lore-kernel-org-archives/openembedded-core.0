Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8C44660B5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 14:09:46 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n10so4901822wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 06:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X/blAi8NP3mEWvxHutY3QeGyA1Snb4sAtLmShnD2pnE=;
	b=Nd77ta1ignhGvR70bFyh1dRW8Jy/EN+d1uA9QTOvhRVRN/+XnqzZ7Cwvv/amJVeT4m
	hGvxBksNhsjrb92oeAyvjMt/dtY8efKLivbfFE+5/0xv1ooovp7XNL2zGoP3cuWN2MEv
	qLknWYgZZ57HUfSwftMO7mUjaL1KZzn04ULFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X/blAi8NP3mEWvxHutY3QeGyA1Snb4sAtLmShnD2pnE=;
	b=LhHBJ08GHj020g1GGyoxv6ssqMVJ/hEUMovy3Mc7QRopiYZZr6uHb6gm581QySYCN9
	KtMlyI/5+sDBXk0mMIKvUZQ6e/b5q7ZIL+qjAqZrwh2AJT87R9gJkh3wRAyDG7sy+4VS
	B9H93SMKNVqjHvUMGI0nHRcDgkN5ZLK5hprydFTDPpcJPo9WuK0N64g//TnTbQZgmIIc
	0nEtP5HJOiW1kUm+hA7XvqjkfnPF659GBARtZENn62MaNeq7+2ez2NJRoEZngEtvNpdw
	/VbpvCMtRiFlqkec2VR76cA7EDLj3s0+B8eoSktqHNAAvvYVEnPf3hD35EQsjSITuXog
	ZNqA==
X-Gm-Message-State: APjAAAUGIqrM9uRh/fcbmUkZDzTtPRn4TBHBduwW/xOUh9Pm2711sen0
	u3t8GMvN86PeKmqCsRBh0RQOwjA9QdA=
X-Google-Smtp-Source: APXvYqxsThVx+3Wg8CBfPDCfU4EqXgbwb9fqZ28pqto3CCna5NjmRfXhoOorIz+EqJhfMrGixgsp5g==
X-Received: by 2002:a5d:61d1:: with SMTP id q17mr22377093wrv.156.1581602986501;
	Thu, 13 Feb 2020 06:09:46 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u23sm3149452wmu.14.2020.02.13.06.09.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 06:09:45 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 14:09:41 +0000
Message-Id: <20200213140941.18270-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] package_ipk: Minor import tweak + ensure packages regenerated
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
X-List-Received-Date: Thu, 13 Feb 2020 14:09:46 -0000
Content-Transfer-Encoding: 8bit

The recent opkg-utils change didn't update all the packages since its
marked as ABISAFE (and has to be due to update-alternatives).

Fix a minor import issue to avoid multiple imports of glob which
also causes packages to re-generate.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_ipk.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 4f23977032f..25d1ab725ad 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -45,6 +45,7 @@ def ipk_write_pkg(pkg, d):
     import subprocess
     import textwrap
     import collections
+    import glob
 
     def cleanupcontrol(root):
         for p in ['CONTROL', 'DEBIAN']:
@@ -101,8 +102,7 @@ def ipk_write_pkg(pkg, d):
         bb.utils.mkdirhier(pkgoutdir)
         os.chdir(root)
         cleanupcontrol(root)
-        from glob import glob
-        g = glob('*')
+        g = glob.glob('*')
         if not g and localdata.getVar('ALLOW_EMPTY', False) != "1":
             bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV'), localdata.getVar('PKGR')))
             return
-- 
2.20.1


