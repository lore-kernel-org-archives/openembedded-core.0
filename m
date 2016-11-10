Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF1271A66
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 12:18:55 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id c13so187925564lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 04:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=8VMG3IeYkZzjGSUe2CMyhvXMrXDGS2YC/RqgfutQYFw=;
	b=vAVIvY4HzjOsm8Q3XgtWxkgIrnQekmKKkFDGubIYj95yDj6ZvI11Di6PC/Wbp9A84G
	Gu87DCpTqwBfi/BA5qnhJGL8VlWy1h37m83llPZdoqQU2BwqC8p0tthw/iJXquZkMR1P
	GFbCtA7eO4Y+7/PQedhmeruKnHw3hGSURpXRDiayDT/e7KGtqyy+rXJaSZt7Z3ofOmhe
	Onog3hLR66mLyuGR4Xcb3oSVPrYwwcVIPW4UqW/3c1H/f8SZ6HfyqiBE5NzUq7kUWq5n
	IgHfPxkjmOLwycYruLobdSHvht7QX31hoiM0WfDWzHTCoI7AXHPDUJRuvfXSzbhUpRR1
	Hcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=8VMG3IeYkZzjGSUe2CMyhvXMrXDGS2YC/RqgfutQYFw=;
	b=U/i6zjjjQH3H2U6YPFdkYcnZ28SNfou7bphkgXUXOSITuQuyjm+93IZ8+JQ4OZWUpO
	eok+kr7nv5uf+PG/OxL5MIHwHwcl18Gylx0GjuFseO81CUG3PcQxWsvPhQ+CtZ75zXGt
	mUB/vN32ptYtrrh400Wc58x1wR/pC/ZaXVVHupVFDrPVzZ0yQiQMLD4XTt+ZoQzQwu8c
	PUZqAwYELQKizrGzbXzCpqGgDpq/NwaEAezKXJeYNJJOJuGF9AnqOXoEF3zsEec6fq4+
	sYgrb7E/JkOPxWU/ZoW4I0Td00i3FlxMJ4lJgQJeSKPDQSamjHF1DPsWGSs+uig9Nc2/
	lu9w==
X-Gm-Message-State: ABUngvcdkyRJAJsf+N1eXmm8s7zfVabK9rQtBbq681sdKjxcFNfPl7h//1H4lyHV7NqAcQ==
X-Received: by 10.25.23.228 with SMTP id 97mr2187377lfx.167.1478780336040;
	Thu, 10 Nov 2016 04:18:56 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id g5sm934563lfe.47.2016.11.10.04.18.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 04:18:55 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 13:18:38 +0100
Message-Id: <5bfce95dc5376ad48a6fd0aa6c9a64c3e3b0ba3b.1478779674.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 07/10] wic: selftest: avoid COMPATIBLE_HOST issues
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
X-List-Received-Date: Thu, 10 Nov 2016 12:18:55 -0000

wic tests will unconditionally attempt to build syslinux and add
configuration options that may not be compatible with current machine.

Resolve this by consulting TARGET_ARCH first and performing
configuration changes or recipe builds for targets that are known to be
compatible.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index faac11e21643e4c32a83b649b6ae986fead498f1..60e31de5825c84fca21d4dbe946e5cc7af8df511 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -41,15 +41,21 @@ class Wic(oeSelfTest):
 
     def setUpLocal(self):
         """This code is executed before each test method."""
-        self.write_config('IMAGE_FSTYPES += " hddimg"\n'
-                          'MACHINE_FEATURES_append = " efi"\n')
+        targetarch = get_bb_var('TARGET_ARCH', 'core-image-minimal')
+        if 'x86' in targetarch:
+            self.write_config('IMAGE_FSTYPES += " hddimg"\n'
+                              'MACHINE_FEATURES_append = " efi"\n')
 
         # Do this here instead of in setUpClass as the base setUp does some
         # clean up which can result in the native tools built earlier in
         # setUpClass being unavailable.
         if not Wic.image_is_ready:
-            bitbake('syslinux syslinux-native parted-native gptfdisk-native '
-                    'dosfstools-native mtools-native bmap-tools-native')
+            tools = 'parted-native gptfdisk-native ' \
+                    'dosfstools-native mtools-native bmap-tools-native'
+            if 'x86' in targetarch:
+                tools += 'syslinux syslinux-native'
+            bitbake(tools)
+
             bitbake('core-image-minimal')
             Wic.image_is_ready = True
 
-- 
2.5.0


