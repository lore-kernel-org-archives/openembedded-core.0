Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD726BA81
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 09:40:40 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w7-v6so21365177wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 01:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4ph23p4zwOdRO+ESYNzSY7jbBnSwJ9w6M8VDsbdGWl4=;
	b=fBYOxSuNG/R7fWwAO2X8TpB5GO6i+pecpvUM4UMfNfQ/jWZNtabmZPtQLnfVTQ/Acb
	VxDPQvVKF3ILghmVL47+zHMekpogE9bI2+GEYh2PVwmTX61BO/nN/VOJYf4e58U2nR9z
	DiANS2FHk9RF4T0jCXepR9j4bT0QJjUA6nKF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4ph23p4zwOdRO+ESYNzSY7jbBnSwJ9w6M8VDsbdGWl4=;
	b=dx/Ydv0+4mxmxdeix/Vn5oW9as4aZ2DTsJrL8115d0cihlnzmfFyszNKl0jtx2mik9
	JSAK1CPa4+XCU0kEa3QJ+JoMcpJ9/ssu3oALgiOCsMKsy5AMOBJLxV3WyECpgmYgaToF
	lLsAp7IY4D7sSUrXxvKSCA6+4QpqlDK23urbdRcYEUjb2HH4plko2tA/HQtgREoRVX8s
	b/cwRKmGpGrKaVS5EApBdKqs6JIpjMezU/0V9wW1vS8usCT4Mu9pOKTV+pzmBXEZHnhL
	BH6qIVfdQWrBfF3cGDz69u3++Ckl7j2Fg/x1RgihyMeHbMYyRQWBo/CR0SPh+/eOFxAq
	bWgw==
X-Gm-Message-State: AGRZ1gJcMaIs+dv+yzbSuOOEtMzY2Hw+VnCkEkTyx0gMjZ1MLF401Xb+
	PjKyMOlAx2Ux7pQhNlmqGwlN5OToHUA=
X-Google-Smtp-Source: AJdET5fqTZ6xoia63VGIftihZjWzSLbhSztqQbY+a3KpRAH6HimCkx5ibpdJ8aQ3wo9FAP7V15yQBA==
X-Received: by 2002:a1c:9a4c:: with SMTP id c73mr1363146wme.35.1542361240705; 
	Fri, 16 Nov 2018 01:40:40 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o27-v6sm24554039wro.24.2018.11.16.01.40.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 01:40:40 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2018 09:40:35 +0000
Message-Id: <20181116094037.4220-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181116094037.4220-1-richard.purdie@linuxfoundation.org>
References: <20181116094037.4220-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/5] testimage/testsdk/selftest: Avoid platform.distro_identifier deprecation warnings
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
X-List-Received-Date: Fri, 16 Nov 2018 09:40:40 -0000

Use our own lsb function instead as used elsewhere by the codebase.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testimage.bbclass    | 2 +-
 meta/classes/testsdk.bbclass      | 2 +-
 meta/lib/oeqa/selftest/context.py | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 914c9b36c8e..ded72048bcc 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -133,7 +133,7 @@ def get_testimage_configuration(d, test_type, machine):
                     'IMAGE_BASENAME': d.getVar("IMAGE_BASENAME"),
                     'IMAGE_PKGTYPE': d.getVar("IMAGE_PKGTYPE"),
                     'STARTTIME': d.getVar("DATETIME"),
-                    'HOST_DISTRO': ('-'.join(platform.linux_distribution())).replace(' ', '-'),
+                    'HOST_DISTRO': oe.lsb.distro_identifier().replace(' ', '-'),
                     'LAYERS': get_layers(d.getVar("BBLAYERS"))}
     return configuration
 get_testimage_configuration[vardepsexclude] = "DATETIME"
diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 5b9bf7b2624..458c3f40b04 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -23,7 +23,7 @@ def get_sdk_configuration(d, test_type):
                     'IMAGE_BASENAME': d.getVar("IMAGE_BASENAME"),
                     'IMAGE_PKGTYPE': d.getVar("IMAGE_PKGTYPE"),
                     'STARTTIME': d.getVar("DATETIME"),
-                    'HOST_DISTRO': ('-'.join(platform.linux_distribution())).replace(' ', '-'),
+                    'HOST_DISTRO': oe.lsb.distro_identifier().replace(' ', '-'),
                     'LAYERS': get_layers(d.getVar("BBLAYERS"))}
     return configuration
 get_sdk_configuration[vardepsexclude] = "DATETIME"
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 4509e0f63d4..dab72688299 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -11,6 +11,7 @@ from shutil import copyfile
 from random import choice
 
 import oeqa
+import oe
 
 from oeqa.core.context import OETestContext, OETestContextExecutor
 from oeqa.core.exception import OEQAPreRun, OEQATestNotFound
@@ -218,7 +219,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         configuration = {'TEST_TYPE': 'oeselftest',
                         'STARTTIME': args.test_start_time,
                         'MACHINE': self.tc.td["MACHINE"],
-                        'HOST_DISTRO': ('-'.join(platform.linux_distribution())).replace(' ', '-'),
+                        'HOST_DISTRO': oe.lsb.distro_identifier().replace(' ', '-'),
                         'HOST_NAME': metadata['hostname'],
                         'LAYERS': metadata['layers']}
         return configuration
-- 
2.17.1


