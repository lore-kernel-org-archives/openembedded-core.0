Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4452165E79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 18:07:55 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so3288169eek.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 11:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=kTi0PhoE6Qruki8nHZT/QOMG6yJqV/yY3lpNhT+Y5U8=;
	b=E9iGbap80YzRP3Gja7gRKkUCrSXfXvh/r+7a/F6a3KxuqFOWAmrwQ77GARR1T31eab
	YBKbzmAJXOFlC6uqvb8I8LHQ5Cg33+7VwFhSdbxaoNesX4KlBqQ9Ed2n4ho56rq07pNy
	dSl+YcStLpCN50evgZpKTsHXRqEMF2RF/4mAt/qnGpqicPFUD2ss/UVXvoAfEHIoLCUx
	JximJuCDHzw3adpuVuEpJU75GV3Kmkgt7USiSrv+vWtMlUoFMTz07cr+JSleWHnRgzJL
	2ztLbhhFyu92RCVihE/dfPALiCyU3f3xVG46D5ZwMZe6JpHSbXlVFXhX0YVn6ANBWhnW
	GyWg==
X-Received: by 10.14.87.201 with SMTP id y49mr5180871eee.62.1397153276727;
	Thu, 10 Apr 2014 11:07:56 -0700 (PDT)
Received: from localhost.localdomain (ip-176-198-252-199.unitymediagroup.de.
	[176.198.252.199]) by mx.google.com with ESMTPSA id
	m42sm11594102eex.21.2014.04.10.11.07.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Apr 2014 11:07:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Apr 2014 20:07:48 +0200
Message-Id: <1397153268-24491-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] shadow: fix building systemd with useradd-staticids.bbclass enabled
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
X-List-Received-Date: Thu, 10 Apr 2014 18:08:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| groupadd: 'systemd-journal-gateway' is not a valid group name

Without useradd-staticids enabled, group 'systemd-journal-gateway' is created
by useradd and that seems not to care for GROUP_NAME_MAX_LENGTH which has 16 by
default.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-extended/shadow/shadow.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index d6bf73b..a4e9634 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -60,6 +60,7 @@ inherit autotools gettext
 EXTRA_OECONF += "--without-audit \
                  --without-libcrack \
                  --without-selinux \
+                 --with-group-name-max-length=24 \
                  ${NSCDOPT}"
 
 NSCDOPT = ""
-- 
1.8.3.1


