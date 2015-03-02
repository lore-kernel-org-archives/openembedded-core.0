Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF8D73872
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 22:28:20 +0000 (UTC)
Received: by widem10 with SMTP id em10so18571613wid.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2015 14:28:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=s3veB03ZY9fTK4rQMz4TFYhi5aUnqn/6b5yQF3hF7aU=;
	b=ONoRUoKMUjkqkm+avr6xWjmLFpVj9moU2fepQyVHclF3EqLC28yH492kJGkqgqr6Un
	dF6ebQEZ44pr1CKVtU80H35Vr4pm4gYfNqNMGNowOmlDEs8vCtJsgDxwYAKNlKM1cqPe
	9CCKBOi+zmmKb9GzoCRdxFeXbidUcXgSdMHrHB7x0un5z016anERJX6q+MpHR5W0gDse
	J735O3Ef2nQU1MAdOTd26UiIEK8hYy2JCEphiqkWag6oZXyeAqrB5y3DwamY4sS6rc3L
	SNzJNn9tC3PWmuIpOGCtXbHlB0yBIQoeJZErS2QwgHM7iQoaYNjmAfx8joOZRVhgBbsH
	xMDw==
X-Gm-Message-State: ALoCoQkZdLn2JzwotYQiFaznLX8/KEPBjGlZJF9IToZjQXr3U7ip5cOHfHnMTR7UUYVt4e7w2/W3
X-Received: by 10.194.179.194 with SMTP id di2mr62258460wjc.4.1425335301937;
	Mon, 02 Mar 2015 14:28:21 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	dm6sm17891276wib.22.2015.03.02.14.28.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Mar 2015 14:28:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2015 22:25:52 +0000
Message-Id: <1425335152-16233-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gstreamer1.0-plugins-bad: disable Yadif on X32
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
X-List-Received-Date: Mon, 02 Mar 2015 22:28:25 -0000

Yadif generates bad assembler when the x32 tune is enabled:

gst/yadif/yadif_template.c:244: Error: `(%edx,%r11)' is not a valid base/index expression

This should be fixed upstream but until then we can disable the Yadif
plugin if x32 is enabled.

[ YOCTO #7385 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 69a15a2..e2752af 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -127,6 +127,7 @@ EXTRA_OECONF += " \
     --disable-xvid \
     --disable-zbar \
     ${GSTREAMER_1_0_ORC} \
+    ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--disable-yadif", "", d)} \
     "
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.10.4


