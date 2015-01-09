Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 886897169F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 16:43:32 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q58so8951846wes.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jan 2015 08:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GmBo9DKeZ9jWevybYmWvy4Kx6vLB7bcoR1nPr6xdKb4=;
	b=DMw9/TEnooKzYRUiD+A+yWZTq+I1E933hBeGVrRoa59qlA9/TKbEppFdQo1MRGzfnQ
	J1x4UBKn/ANMDvmwqEeaou/XnqbWK+EEoS7lW9c4eGD4okZbsABKGWaBt/Iixm32X4EZ
	Gf8MJVwI+hFqaFfsXdrzj6x5l9gzFNUeVoqO15XsJt3tR7QxTicCC8IdIVfmGlZvlUF/
	TENLtuFSDq/Y24+MEKni9tkIHaisvvGnCWIrMFE/8/7LJiEeLmJccD1o+YYzqccq+g7O
	BFBXvE5iJNX08+xRBPY/+8zeKFMvh3zk1c7lHaeyY6RJFcVfk0qPchgVicXYMuXLLq6O
	efUA==
X-Gm-Message-State: ALoCoQnsPEFSecgRElo+bMKi7IiPq13VLOSi3R7g3XYnYKj2DEIoHv5f5THaB7kHqooWJjzeqOJH
X-Received: by 10.194.85.17 with SMTP id d17mr32961975wjz.61.1420821812457;
	Fri, 09 Jan 2015 08:43:32 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id e4sm10601233wjw.48.2015.01.09.08.43.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jan 2015 08:43:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jan 2015 16:42:17 +0000
Message-Id: <1420821737-16680-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] socat: forcibly disable use of libbsd
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
X-List-Received-Date: Fri, 09 Jan 2015 16:43:35 -0000

Socat will look for openpty() in BSD headers before Linux headers, so if libbsd
is present at configure time then that will be used.  We don't need to depend on
libbsd though, and leaving it floating can cause build errors, so tell configure
that the libbsd header isn't present.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/socat/socat_1.7.2.4.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.4.bb b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
index f4461de..9e43e16 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
@@ -27,6 +27,7 @@ EXTRA_AUTORECONF += "--exclude=autoheader"
 EXTRA_OECONF += "ac_cv_have_z_modifier=yes sc_cv_sys_crdly_shift=9 \
         sc_cv_sys_tabdly_shift=11 sc_cv_sys_csize_shift=4 \
         ac_cv_ispeed_offset=13 \
+        ac_cv_header_bsd_libutil_h=no \
 "
 
 PACKAGECONFIG ??= "tcp-wrappers"
-- 
1.7.10.4


