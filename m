Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1696C6D3A7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 17:22:02 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id hn9so2541999wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2013 09:22:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xogCJRe+avFrrsPS6CtIxqlzRT2m0pElurGNTlJTOxM=;
	b=S8cz9NyPNho4785klJMAWzzTjdbJMpkkmUiYe0MeEDoH0Ind6pOuGx9zlSMDgDb4+5
	dETER37ZeDdj2OkMAPzjcatYQd0uoPno0Xd8GOj24MB/39snss5hoDfU7liy+AeTdPfI
	2q/FuCW47K8zW4EWX7QOhLHrHqrjamIMYFUlwLVWagx5ZlNHEW0+ToGVcMSUH+L9KLwG
	zWI/GYETn1dGEQcgI1c0QOn+m/fyVDhjS8QkQpieL+8wHO82X/HexIsvVz9v4l3mtLZ3
	xJcbDE7+4XBLfa+gvo8h365Ts7HlA2pvNByZftppHPTi9GP4spNE1/tJgMUKzdVOquHB
	Qp5w==
X-Gm-Message-State: ALoCoQkX50Bu8IOzw392Hnl2FBwSyYt9hHkk2gIbO0pV0d493kyR/4FaGrYwYVOot7QoK9T+1u4c
X-Received: by 10.180.189.49 with SMTP id gf17mr3427695wic.23.1386091322176;
	Tue, 03 Dec 2013 09:22:02 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id je17sm7278191wic.4.2013.12.03.09.21.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Dec 2013 09:22:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Dec 2013 17:21:57 +0000
Message-Id: <1386091317-11014-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] ptest: ensure do_install_ptest_base task runs in fakeroot context
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
X-List-Received-Date: Tue, 03 Dec 2013 17:22:03 -0000

As this task is installing files into $D it needs to run inside pseudo so that
special permissions and owners are preserved.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/ptest.bbclass |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 508ea9a..06dddf7 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -53,3 +53,8 @@ do_install_ptest_base[cleandirs] = "${D}${PTEST_PATH}"
 addtask configure_ptest_base after do_configure before do_compile
 addtask compile_ptest_base   after do_compile   before do_install
 addtask install_ptest_base   after do_install   before do_package
+
+python () {
+    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
+        d.setVarFlag('do_install_ptest_base', 'fakeroot', 1)
+}
-- 
1.7.10.4


