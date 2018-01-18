Return-Path: <3X19gWggJAHgZiepneuvsWuik.Yki@flex--dmitriyz.bounces.google.com>
Received: from mail-ot0-f202.google.com (mail-ot0-f202.google.com
	[74.125.82.202])
	by mail.openembedded.org (Postfix) with ESMTP id C4D6A787D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 08:48:29 +0000 (UTC)
Received: by mail-ot0-f202.google.com with SMTP id 95so5013227otl.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 00:48:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc;
	bh=TBEcSeQDTTV2xcTKc4dGGkgF0noNejp7BubC3R7pTPs=;
	b=Gwt5edZXgXO5TeF3GJrI+Yccpg5NyOcXqfmV6seLjENFzHMctg/25YdxDb2A+hgJ4c
	zjhRthgAol+4vDW8CuxxCWhE4bdJMfwWMHj/JZDBk/bl6FWPDfKx5oQxq0oaBAnT2mEJ
	602oXD10rku+/o9hTwlQJJWCI0GpmiKeJMbEcymKhYaqwyLk7kHGpwBgb2C/MsgjIg7M
	1Gc7FnCmKESkIBL/9t46QzYAQpYdtixm4aiUigUx1ge7VUY5m7szUZ6GoMelxAlOXAz7
	ddtUOnfRjYoKDtAAWnzgkUBHxBD+PUei5puOY8DwMkrRI8HksVPCYV6rZmqlErJGc/6X
	NMPQ==
X-Gm-Message-State: AKwxyte1tcNkm/zv80JaO4rsxLMDXZ02odGYFF3W/4BMLajI0GWkUs+G
	EQu4DGDwYMB6Ifl5XfdCHpRbV1NOtRLVFFrQiDF5oRDrIpKZ94mswM7t0Xxk98FqKV+IgyrK/9k
	EuJYszdwUukcHqwQhxoZesIMEvKn4gc8kvf4AJ3wYJofhmdIfvYRcA2COK42f4nFR4HxHywFHfX
	KjL/3cNLQ4dByo/A==
X-Google-Smtp-Source: ACJfBotAZ5Gas+DHgkrmFSnjnAhqPxv4nDP7kuGPDzDsVq9PDgOR0X/znDWzMs0sIinT4jjS6JpvVDH9NhSn7A==
MIME-Version: 1.0
X-Received: by 10.157.12.221 with SMTP id o29mr2601048otd.46.1516265311042;
	Thu, 18 Jan 2018 00:48:31 -0800 (PST)
Date: Thu, 18 Jan 2018 00:48:26 -0800
Message-Id: <20180118084826.102791-1-dmitriyz@waymo.com>
X-Mailer: git-send-email 2.16.0.rc1.238.g530d649a79-goog
From: Dima Zavin <dmitriyz@waymo.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pigz: specify that we runtime-provide gzip
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
X-List-Received-Date: Thu, 18 Jan 2018 08:48:29 -0000
Content-Type: text/plain; charset="UTF-8"

Without this, nativesdk-texinfo fails to build with messages about
nothing rproviding nativesdk-gzip. That gets pulled in
when we add "compress_doc" to INHERIT in a distro.

Signed-off-by: Dima Zavin <dmitriyz@waymo.com>
---

Not sure if this is the best way to fix the problem, or if I properly
diagnosed it, but this seems to fix it.

 meta/recipes-extended/pigz/pigz.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/pigz/pigz.inc b/meta/recipes-extended/pigz/pigz.inc
index 978f905329..01b41dddff 100644
--- a/meta/recipes-extended/pigz/pigz.inc
+++ b/meta/recipes-extended/pigz/pigz.inc
@@ -8,6 +8,7 @@ SECTION = "console/utils"
 LICENSE = "Zlib & Apache-2.0"
 
 PROVIDES_class-native += "gzip-native"
+RPROVIDES_${PN} = "gzip"
 
 DEPENDS = "zlib"
 
-- 
2.16.0.rc1.238.g530d649a79-goog


