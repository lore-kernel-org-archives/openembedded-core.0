Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3EF7E73D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 03:31:47 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id hh10so736851pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 20:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JPGiKpwnud/ZPHuwNXGxpAkBzBqESkrMdZezGS+3nQE=;
	b=o667heqYK7FvyPO8759owItPVz7XdNHNKCIe8CYDfTeJyUutdjCyaTAHQwQDVrJ3GC
	VAiPyd6m4p4E8fEWpbG4IcAVEXnGx8sG0+JVzZalBiPZNQ8twAcm8iva39lgVOFMy9Q8
	jDsiVpGCvfdbQruJfss8npQQHUwletoplEXIhsrf/avPdIEhfiNP2DXPh4ljMZVOpbvN
	s0lUG71c3Q8r6Ii4W2Jj29dpKdkaZ1R/29a3vs8GDpDbICpb21qMN2FIhZkImyo+SPB1
	rP+J6lISs/PA36H7GWO4aOqhuRucikRLdNet2vivJyV1U0wXtXSTCFV3kEqd/vyDkBEL
	6wVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JPGiKpwnud/ZPHuwNXGxpAkBzBqESkrMdZezGS+3nQE=;
	b=L4uYca35NiPt/82DPesVwOapiWMHqx9C6ZaGZ8++30hHu8/lVdAlW3XVq2kLf0PQuX
	6nR5YL893Wre1KQm3rTrP4njCakcJdWN0EjisoxO+MdZhkJEfsRoDJ6O0dQFdSSFBaF2
	pir5DtbHiA88dkBtCYNUxqW/pL6DHHgkQKuMIwB/1TLGfwKPSNZm514UhKcXdvAJ5Hn6
	lBmMqC1qBWMBEIiVvGvKmbMRNN64Wf8BJXeBuCmD1MIig3UceJVylxeopG2CgHby1I3w
	G3nqOFST9iYgKFbhG0E9vgO4PMH255Wufb11v2prhpjHjH7S6GtLOf1GF3/J2oakbodJ
	kFLA==
X-Gm-Message-State: AEkoousPqrhSgGkjnnjOOSct2AVBZmtRM30bXa1QV0zWBnTjUiRf0blMzfDhr2iByUsOqw==
X-Received: by 10.66.78.5 with SMTP id x5mr23231875paw.108.1470972708509;
	Thu, 11 Aug 2016 20:31:48 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id o2sm8464184pfg.10.2016.08.11.20.31.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Aug 2016 20:31:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 20:31:14 -0700
Message-Id: <20160812033115.2546-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [PATCH 1/2] ffmpeg: Pas CC and CXX to configure
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
X-List-Received-Date: Fri, 12 Aug 2016 03:31:48 -0000

This helps in compiling it with with toolchain coming from
a sstate server where its built using a different build time
sysroot.

Secondly, also helps compiling with non-gcc ( clang ) compiler

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.1.bb
index b8acb61..8c4fed5 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.1.bb
@@ -76,6 +76,8 @@ EXTRA_OECONF = " \
     --cross-prefix=${TARGET_PREFIX} \
     \
     --ld="${CCLD}" \
+    --cc="${CC}" \
+    --cxx="${CXX}" \
     --arch=${TARGET_ARCH} \
     --target-os="linux" \
     --enable-cross-compile \
-- 
2.9.2


