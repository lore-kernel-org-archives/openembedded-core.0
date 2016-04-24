Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id C45616612C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2016 16:52:55 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id f74so69186836qge.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2016 09:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OPf9VmucYJZyi0RGFhkINpF3EZKPpLmB+gywkyYnaZc=;
	b=yFdwPpCnfWx5tbfj4AN0lregADqtcGR3N9+3QECzfGkO90nVxhLedNkm7qkH4O65DH
	NOWjbMwoOL12BaMgKuXXoiS5wT2+9o1gttwyXfky3KJtMcL4GXSFuYrsVxQgkfi7JAk0
	rFlZEObt7TQjB6LK0+smoxV7F5RMCLoFgRGFnhgA52jjQyM7tjnTj6myJZcWBYKjj829
	Z+navHPWbGqV1EJxxSdmDAN2qPvNPAreVCuf0zvYiCZqSu8gX1vrpJl/H7FuOjuNNHRX
	1bniGQP++B6RvIVJ7hlqjIXTwbvV+4VMVKJQx1Daq7CK0QP112RAV0FOyaD6uI9wwwqO
	uOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OPf9VmucYJZyi0RGFhkINpF3EZKPpLmB+gywkyYnaZc=;
	b=AgTFAWfNWJxP4jHZRxexUyExHwiJMrftEcGkbaNXw8R696+XWsBMCqe+7y+N8VmObS
	tioel4+kAnF7DTzwJVVRVI9CDIP4CN05eTCNnf99itKMipF2Nbk8H/7/EJFEqzXWiHgS
	GxLSF6FYWtGucO7rh3tzl4hawrMVyZQNnmp+2sSXWF0qSiskmHrt3eZF47DwfbkDCOxU
	BN3bm77V+aiArXaJtaij01zrqyP1A0jIoh9weZzLzhinT7+KkqHhZKWJcin/qB6oc9y5
	SR8BmuLPlKK/+F9PKXEMYz5lzhJrKxe8n29mziReUs9rpf5NbJpg/i8BGYIBJyr3pAe2
	oX3g==
X-Gm-Message-State: AOPr4FWN94RytMm4Z69bPvKVJS0Q1ONkSk+eADmHEPOH7f0yX+NItn8aLiOb39ILsgyuSw==
X-Received: by 10.140.171.65 with SMTP id r62mr13070158qhr.45.1461516776125;
	Sun, 24 Apr 2016 09:52:56 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	p143sm1203407qke.38.2016.04.24.09.52.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Apr 2016 09:52:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Apr 2016 16:52:48 +0000
Message-Id: <1461516768-29868-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH V2] systemd: Create missing sysusers offline
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
X-List-Received-Date: Sun, 24 Apr 2016 16:52:58 -0000

Some system users which are needed by systemd components were missing
create these users knobbed with relevant packageconfig

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes from v1->v2:
 -Create systemd-journal-remote
 -Create systemd-journal-upload

 meta/recipes-core/systemd/systemd_229.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index c23c749..cf34921 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -319,10 +319,16 @@ PACKAGES =+ "\
 SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfmt', '', d)}"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
-USERADD_PACKAGES = "${PN}"
+USERADD_PACKAGES = "${PN} ${PN}-extra-utils"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-gateway;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-remote;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '--system -d / -M --shell /bin/nologin systemd-journal-upload;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
+USERADD_PARAM_${PN}-extra-utils += "--system -d / -M --shell /bin/nologin systemd-bus-proxy"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 
-- 
1.9.1


