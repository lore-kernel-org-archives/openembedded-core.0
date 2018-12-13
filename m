Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id A6EA27469B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:22 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id w7so1635118pgp.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KN0e0+ZcJM0nXTKJ2qSpLtVlLOSxyrQkuZqrsOWsJmw=;
	b=nEjLsgDJ9mtGqtayULk2Rcd6OgkMUZOlQJv45eF6YrAjppPvM4RB77IQjEidbyM2Ji
	NBdlHKuPZS67dCaAq8KHGWEbD2DAZ/tmKni91Z55e5G89bWjywbBswifJnQLOVeKOHb7
	gNK0eo45E9k0gvpsN3qT8PXJSI+u4DX1ShqmfCrSFzg11TlmAVFC5+yXEFeUoG2LE668
	TYyq/ehIloWpG4aVWulX7uzDL1kntFQ4pCUobSawXdrext1XKxliRnCHp06zol5Ghtum
	0Y1p6EkREc4CFBFezQMn5lI54qZPkdwP/TSHfP5gTkIoiw5rVHqxx2bcDaG5V1LGnJtN
	u93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KN0e0+ZcJM0nXTKJ2qSpLtVlLOSxyrQkuZqrsOWsJmw=;
	b=VYvnRBBBDKNH4CczDPHsW7rEwHqRmtL5RhF3ZhUhANjojqF6d+Mw5+HMfLBaUXJyqx
	m0Hi3J7LR8ahYowKRZXDOUNLUw6RJCyx+qQKdlNV0TZs0B3eYGFNDMndKTBZTxfiAPtj
	7xTeTo/F9sgK8ZpzoIwEXMwPyUBD3uw2JMyosHJuuxYeNUE5fbaIauJS/b9KkUTEjXRy
	BoZt6GRR+AGwz7beMeOVWq2lVpkhOb8s7MDmTnKtQVH/V6UBkqDv7YQVoghIus8al8CZ
	Y2XiU3OHpn2xDoC+AKQdPhIBaDT6W0RVAQouQbl7+ZVxaqB0urqXPIwPTQabpmzFlGDs
	a/xQ==
X-Gm-Message-State: AA+aEWZSmj95LBW2Evt+yiNqhBJmrpzffXPiGj0DmBLCpPBr8KJACGRM
	JT717v1/SEg8L2wmsFgjnylu+y6Y
X-Google-Smtp-Source: AFSGD/XHq4qplaTie3KPzN5YBndb6QjO/zZPlIWsjkw0deVLJo+W1lw/j6CgOVVEsiAPrmcWy2HTkQ==
X-Received: by 2002:a63:4c04:: with SMTP id z4mr425962pga.312.1544737163613;
	Thu, 13 Dec 2018 13:39:23 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:27 -0800
Message-Id: <236cd6c0c289dca77905aec1ff7be5c0c39a087d.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 19/45] oeqa/selftest/esdk: run selftest inside workdir not /tmp
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:23 -0000

From: Ross Burton <ross.burton@intel.com>

We've seen issues with rootfs size calculations and we've seen systems
like opensuse which have btrfs mounted on /tmp causing selftest failures.

(From OE-Core rev: 61be3cd748d1b7321a1fc4cfe84efa9b26a6aee0)

(From OE-Core rev: d936faabfb29ea377d74e77332a2a91603747ac7)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/eSDK.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
index d03188f..14f75d8 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -70,11 +70,12 @@ CORE_IMAGE_EXTRA_INSTALL = "perl"
     @classmethod
     def setUpClass(cls):
         super(oeSDKExtSelfTest, cls).setUpClass()
-        cls.tmpdir_eSDKQA = tempfile.mkdtemp(prefix='eSDKQA')
+        cls.image = 'core-image-minimal'
 
-        sstate_dir = get_bb_var('SSTATE_DIR')
+        bb_vars = get_bb_vars(['SSTATE_DIR', 'WORKDIR'], cls.image)
+        cls.tmpdirobj = tempfile.TemporaryDirectory(prefix="selftest-esdk-", dir=bb_vars["WORKDIR"])
+        cls.tmpdir_eSDKQA = cls.tempdirobj.name
 
-        cls.image = 'core-image-minimal'
         oeSDKExtSelfTest.generate_eSDK(cls.image)
 
         # Install eSDK
@@ -87,14 +88,14 @@ CORE_IMAGE_EXTRA_INSTALL = "perl"
         sstate_config="""
 SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
 SSTATE_MIRRORS =  "file://.* file://%s/PATH"
-            """ % sstate_dir
+            """ % bb_vars["SSTATE_DIR"]
         with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
             f.write(sstate_config)
 
     @classmethod
     def tearDownClass(cls):
-        shutil.rmtree(cls.tmpdir_eSDKQA, ignore_errors=True)
-        super(oeSDKExtSelfTest, cls).tearDownClass()
+        cls.tmpdirobj.cleanup()
+        super().tearDownClass()
 
     @OETestID(1602)
     def test_install_libraries_headers(self):
-- 
2.7.4


