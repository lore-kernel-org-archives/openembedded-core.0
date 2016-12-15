Return-Path: <ross.burton@intel.com>
Received: from mail-wj0-f170.google.com (mail-wj0-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2833F731B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 17:20:57 +0000 (UTC)
Received: by mail-wj0-f170.google.com with SMTP id tk12so72487444wjb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 09:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=wm1Hh/Z25x7N3Q+PAnTWQqcnTTbUzS3m99RLnQC9RFU=;
	b=Dr73tvac8xCmQ/VPGNSekw5cZnG+h+dHPbzDhRwhh9dipE+xCxiq60/JJOV7IF8N7s
	FcglvDpTHVzW+/e02MxoBBlUzpoOYrhbeREkCj9FCNkbS+mfon8B9jC6SLTEpQfG+i9V
	lXi3675k5ovzTEqJ7bHjMRTHekN4g4ZrmnQz2gv9qTJiX3PFWPvfz8DH23nNPyup6gZq
	b8LK0XuJcQHO5L06swYyz840aS6kFZkfXsLbA0Xiu5MOL3zXmE2we8WDCqRagJ2p2QEO
	GhhH9UFqRlsuJ1Gu7phnKmbvOUW0QoU6B0cAftF8LFJqpFLAlNoipGgUoY53hJs0uo9t
	wwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wm1Hh/Z25x7N3Q+PAnTWQqcnTTbUzS3m99RLnQC9RFU=;
	b=UT5CCQC4TNaOuY3Y8kldTzfItQNFplQoZc2sjyB/CESajoGf7KtZBruh6LZG57zU4A
	Mbbwx4YqFpR9yo98AYhrA/VmECUnYbOjhHUN9UNacHC3MD0IhTkxgziklX5Zh8IZljAm
	kKktJKtJdQ1oCKR/g/vIjx8OfCw7/XT+KXMhVXa2YZ58MPBZBqIh9poKzT1/On+OLeZ/
	iSKA/+Z6jXnfwbUETx3kDfGtHFOdNx18JrmjymMkInrjgpcFDylNse48Pxm/wKH20jMw
	At2rSmxbgr8oc4j/uYywhIIELjXX2uSAyxaXkuoGr0Sq5pWEKQDkCiIu+qmnYwBk2mMH
	TD+A==
X-Gm-Message-State: AKaTC00JTmxGzATLPF57ty2lnjV2W6NMgV1tvsB5d9srEclEvNQ5w+St3QH19qmOhowazjp3
X-Received: by 10.194.80.42 with SMTP id o10mr2818856wjx.65.1481822458505;
	Thu, 15 Dec 2016 09:20:58 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id z6sm2935071wjt.24.2016.12.15.09.20.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Dec 2016 09:20:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 17:20:55 +0000
Message-Id: <1481822455-17217-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] lib/oe/package_manager: bail if createrepo can't be found
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
X-List-Received-Date: Thu, 15 Dec 2016 17:20:59 -0000

If createrepo isn't found then the errors later are mysterious, so explicitly
check and error out early if it isn't there.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/package_manager.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index bb45869..e557473 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -164,7 +164,11 @@ class RpmIndexer(Indexer):
 
         archs = archs.union(set(sdk_pkg_archs))
 
-        rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
+        rpm_createrepo = bb.utils.which(os.environ['PATH'], "createrepo")
+        if not rpm_createrepo:
+            bb.error("Cannot rebuild index as createrepo was not found in %s" % os.environ['PATH'])
+            return
+
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
             signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
         else:
-- 
2.8.1


