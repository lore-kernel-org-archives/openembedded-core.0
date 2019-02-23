Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 35C187CC14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 13:45:12 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l5so5250855wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 05:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CNHHFeyvbwwD7HgiQ/9PRWcPtB3jq0gMWRwSbZZiKzs=;
	b=KmPonAjErZi2wDiRUgwVxF7uJpUx5/s3fCqKfgmKwJjHRb1K2lpyHnhktZieHIQY2H
	4nIiypjPH0O/RPUIQXErZvEzuP+mGWTyJt7lxyNNo5YQf2QL/ESjoKK6GUhqWW0SfrzI
	CIPsrih1g/rQak1NJ/ZJpxDzc+kkQcy4EtilY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CNHHFeyvbwwD7HgiQ/9PRWcPtB3jq0gMWRwSbZZiKzs=;
	b=WZCDXWLFxEnIXWMOxxcMVrVgO8k+eJ6SiU6zP2Rae23hPFbOtRV/suX9hUqy21RXpc
	r5Hs1EaHCRpMxuCdq22kHMBkKR2o5YpZQVV9kGez6fb1DkO7tSogRWMfMf8xVTTGZLUk
	F/qel7lP7nsfbdwwtUMVxpxZPKQ4iIvIAClAgj9LUiql+VT1Dlfq1GouCy2d6ZJO20mo
	M50E/AKKJhHi5qIYXYPSFTsGAdjqfsFYOpU6Im4wnq6kbO4xK5hZVVwf8C3syKgJJtbq
	hbfQLjf3kjXJzAlkPuoxNy/7EQdG/pxrKDGDwg0ldZvhDAHxYJ1VS8ylQJF2A2sg0For
	5mrA==
X-Gm-Message-State: AHQUAuakX4H2Nl9idjYqhdfZAVNKsRkqJQ9mNWBmwsHeXQV2o9H+oO71
	koa2Vpo+Sa2UCMIhEzAbdMnpuwnFR/g=
X-Google-Smtp-Source: AHgI3IZ/CGGYZc3QOQs0+G45ucqEYXPmiLC5RotMLBujHLeQ9wjNCXEPJyY+85vZ43WUtjDvRDDgGQ==
X-Received: by 2002:adf:9b11:: with SMTP id b17mr6670146wrc.168.1550929512635; 
	Sat, 23 Feb 2019 05:45:12 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y5sm8001869wrd.97.2019.02.23.05.45.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Feb 2019 05:45:12 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Feb 2019 13:45:11 +0000
Message-Id: <20190223134511.15287-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] staging: Fix staging_populate_sysroot_dir native corruption
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
X-List-Received-Date: Sat, 23 Feb 2019 13:45:12 -0000
Content-Transfer-Encoding: 8bit

bitbake gdk-pixbuf gdk-pixbuf-native
bitbake build-sysroots -c build_target_sysroot

can lead to tracebacks as gdk-pixbuf-native is being installed into the
target sysroot. The issue is that the x86_64 (common BUILD_ARCH) sysroot
components directory can contain a mix of native and target artefacts.

Differentiate by the "-native" in the recipe names. Should also trim
down the size of the sysroot used in eSDK.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 84e13bab592..2ef45092235 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -198,6 +198,10 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
             if manifest.endswith("-initial.populate_sysroot"):
                 # skip glibc-initial and libgcc-initial due to file overlap
                 continue
+            if not native and manifest.endswith("-native.populate_sysroot"):
+                continue
+            if native and not manifest.endswith("-native.populate_sysroot"):
+                continue
             tmanifest = targetdir + "/" + os.path.basename(manifest)
             if os.path.exists(tmanifest):
                 continue
-- 
2.20.1


