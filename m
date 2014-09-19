Return-Path: <fahad.usman@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB05605BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 04:07:24 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id z12so1790586wgg.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 21:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VSXb5yFRHDa8/sv9DbMC9Vz+LZtH1SEejyv9S1W1m/U=;
	b=unNRsGg+Z5th0zcS5Xc22JAjKZye5d+JOgdGxVbwcuSWXujRAHk+bnV6APzZ9cl06i
	klvLVFskakRDU5t4cCnW8uUznfhrVjYPxTXn08QJiZ9e8+NKWSOQzVDQWZaTLBKfezx3
	yzG+nq70F4Xb+SYlGGPbStAht1sWN1sYMBBV3l8b5y6ggTGIMrBaqFRMohQ1b/p/Bv72
	fBdpGeN6Z8E9FEmA2iavdLIy6kRJ6XygLnnuBw/yQEA+sW4NIE4FjSXBTnWnJU9IKLO4
	GNnJV18llvN2NIiQsFy3joDWQmGuUI7v6XWH4cjXIUhUtJbThYmMLG8tb8Wmwlg2rF/I
	0DAg==
X-Received: by 10.194.23.8 with SMTP id i8mr9258347wjf.104.1411099645460;
	Thu, 18 Sep 2014 21:07:25 -0700 (PDT)
Received: from svr-pkl-eng-06.pkl.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id v20sm662695wib.4.2014.09.18.21.07.23
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Sep 2014 21:07:24 -0700 (PDT)
From: Fahad Usman <fahad.usman@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Sep 2014 09:06:03 +0500
Message-Id: <1411099563-29139-1-git-send-email-fahad.usman@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] sysklogd: set INHIBIT_UPDATERCD_BBCLASS if 'sysvinit' not in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 19 Sep 2014 04:07:33 -0000

We need to set INHIBIT_UPDATERCD_BBCLASS to "1" if 'sysvinit' is not
present in DISTRO_FEATURES so that any un-necessary package dependencies
are not added by update-rc.d.bbclass

Signed-off-by: Fahad Usman <fahad.usman@gmail.com>
---
 meta/recipes-extended/sysklogd/sysklogd.inc |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index bcf8aa7..3cbbdfd 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -56,3 +56,8 @@ pkg_prerm_${PN} () {
 	fi
 	fi
 }
+
+python __anonymous() {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
-- 
1.7.9.5


