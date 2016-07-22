Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE6E6067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 14:03:33 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id o80so68111593wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 07:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=afqlEKjydHARC4gDRAv+pm8S7ydmnBI730563FNzLwo=;
	b=wy87/bi0ibzlv9CL3piHS/2a8b+QGxXHJIni3bPzYy+q/u2qkvbj9ueRlyWDlasPzz
	gg5EwQZFgbfHj5KH/avH05/nyKkJXdlnccx5yc0JLnG2a19HvtrUck4wDD5BEVM1CEpu
	d4wxvzUarH9kz8hra0HA/e895IcVtEMNU/xF0RSg+AWT5yvPcAuP02MkcBKkcO5UwdBq
	hORB0p+sCU2GRxLSrvgeVJeGSQeTt1S+ho+JmTyOXB+WVSI3PDeWphNcbYGjwUSSKdO5
	kIi7ErR2hSn0blaIUB6kx6pca8Z6ssCYeOlDwGBa8pX3AFBh0GfDEV7bJlkOuA3teUkp
	dIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=afqlEKjydHARC4gDRAv+pm8S7ydmnBI730563FNzLwo=;
	b=EMkFESr3X9o89zyxRA/YY31aYPTV1z+D6zrMHe22/Ag7Pv2s3RQk5O70q5McF8t4HB
	VyxPHNi1f18Lmi4ZmQ4wucb3XvQAe+RmqdUOUd5P+0q4zV7hMJu24LVvTLDibAkzdl0E
	ac7NYx2ffhNrVnlqrQfOZw8PUlQRW2G9oz/zf2QhhdinJEVXhxZKj8KTNOijbreedVHs
	suCAXwGrJ8xe8rgZblZEbcN/wb5R+0Ei7IU3EV0k3I9w4P7scgburek1Wo8J63D3uowu
	5eZFpm72067erEndbN90X7V76k3PtXoMmS2kSLrBI/u34caH7WkxT/MCsDBQi2aDo2Vy
	HjEw==
X-Gm-Message-State: ALyK8tLWxNwqNksm0am9oF68aS9XUZ5mHHz6oHLsCIzm9eoIhAPTIEzdNWYUj0RFvE+JHtgK
X-Received: by 10.28.191.14 with SMTP id p14mr24629768wmf.39.1469196212784;
	Fri, 22 Jul 2016 07:03:32 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	n131sm9696947wmd.3.2016.07.22.07.03.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jul 2016 07:03:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2016 15:03:30 +0100
Message-Id: <1469196210-29675-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] lib/oeqa/decorators: handle broken links when creating new symlink
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
X-List-Received-Date: Fri, 22 Jul 2016 14:03:34 -0000

When checking if a link exists before creating it, use os.path.lexists() as
otherwise os.path.exists() on a broken link will return False.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/utils/decorators.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 0b23565..615fd95 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -190,7 +190,7 @@ def LogResults(original_class):
             local_log.results("Testcase "+str(test_case)+": PASSED")
 
         # Create symlink to the current log
-        if os.path.exists(linkfile):
+        if os.path.lexists(linkfile):
             os.remove(linkfile)
         os.symlink(logfile, linkfile)
 
-- 
2.8.1


