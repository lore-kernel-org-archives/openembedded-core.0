Return-Path: <rwoodsmall@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0D613731D4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 03:58:32 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id 190so104170302iow.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 20:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NSvP6vpusUtn0KGnEVBapvTXKzo4QoeVm1OUzVcFZOE=;
	b=NYPuqMNfukbsAIsCV4ZYjuHtiQxvJzuyc8ynWW17+7Up2Q6XKo0+gdOR+XEQeZAHdh
	DjgeNAfTvwuXpzc2jAOY7qihx5PdHVACF67R40pzZENtKlBksep1RXi2adVgRLbBsWa3
	VNjvMJ6xSwoVaIVbYicikPYqaRYRS/Z63+vESf/PiCxHAL3y/qCabQQrHzch8Vjyo+QA
	6ezEL3aX2Ix8Gy0CpI1rbpG/p4DR7rT/cgOPuf42oJH/YSqNSZKaa1lKe9FCZ/75lvE6
	Qa2hvfHmn0sfjkh30ZRChHs/2t9LB41dr2nULqgNAzn5/vGHssySr3Vt9d/IHU371pnC
	QHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NSvP6vpusUtn0KGnEVBapvTXKzo4QoeVm1OUzVcFZOE=;
	b=QUl0rhvxvG52VP80Y/CkG4046trnwcYnfTFhlUf0/VzwSZR51jXjl24+TCtpJrcJ9e
	COYGYsHLc62VjneLpXPkPZxlFCvULQT2xhAnOiGAr9FOqvjgkmOfPy4953MDzPaxfCOK
	GkAGqlUjbes5MeoI2Ntz58ae0reKb55JR/kxEU/JvRhIqXvGmxhbBtRN6cewkoN48xG2
	FBUKvoJtz+tjyyUQ8bKLQYcTfNN7/w3Jq3RFU0FxlCTl7Irv5Ks5vK8xfPdvm/m5lcqK
	cVQqPzulzdmI2KIpNgDcyClIBvv6eXIyetpUNqEagjKw7GmjP18tvhVmipYGLHdECuYw
	V09w==
X-Gm-Message-State: AOPr4FXMqIqiyM3NR1uXYhVLpdhDJlrJB599qD/kmYKfQJ07wCPryJ6lP+nFroxA9jZ6tg==
X-Received: by 10.107.146.134 with SMTP id u128mr21562869iod.189.1462507113311;
	Thu, 05 May 2016 20:58:33 -0700 (PDT)
Received: from ip-192-168-130-158.compute.local
	(71-14-83-136.dhcp.stls.mo.charter.com. [71.14.83.136])
	by smtp.gmail.com with ESMTPSA id yb2sm3260109igc.9.2016.05.05.20.58.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 May 2016 20:58:32 -0700 (PDT)
From: ryan woodsmall <rwoodsmall@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 May 2016 03:58:28 +0000
Message-Id: <1462507108-17945-1-git-send-email-rwoodsmall@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] Make static lib builds (DISABLE_STATIC) configurable from local.conf
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
X-List-Received-Date: Fri, 06 May 2016 03:58:33 -0000

Static libraries are mostly usable in very small embedded systems.
The addiiton of musl-libc support allows very small "single binary" systems,
and static linking allows no shared lib deps on these types of builds.

Signed-off-by: ryan woodsmall <rwoodsmall@gmail.com>
---
 meta/conf/distro/include/no-static-libs.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index 13a7918..83472d5 100644
--- a/meta/conf/distro/include/no-static-libs.inc
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -1,4 +1,4 @@
-DISABLE_STATIC = " --disable-static"
+DISABLE_STATIC ?= " --disable-static"
 
 # qemu aborts on unrecognised option
 DISABLE_STATIC_pn-qemu = ""
@@ -32,4 +32,4 @@ DISABLE_STATIC_pn-libusb1-native = ""
 
 EXTRA_OECONF_append = "${DISABLE_STATIC}"
 
-EXTRA_OECMAKE_append_pn-libical = "-DSHARED_ONLY=True"
+EXTRA_OECMAKE_append_pn-libical ?= "-DSHARED_ONLY=True"
-- 
2.6.4


