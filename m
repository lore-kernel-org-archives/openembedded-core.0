Return-Path: <koen.kooi@linaro.org>
Received: from mail-bk0-f52.google.com (mail-bk0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 961E66C742
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:31:34 +0000 (UTC)
Received: by mail-bk0-f52.google.com with SMTP id e11so330021bkh.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:31:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XNDRJ5xpe/tWiUtzW1NYYUt4nq8eVSbTAKw3DTaeiuI=;
	b=iZT8QzYw+iPbUY/ZpBHvyBpVRbHl8/ILBv8h96e1duptY9o8d6zz7zBJw1PiipMBxV
	RrQ8wmIALoRplav4CS6eBxs1lXeRGCMdldOT0RUyz4xID5POAy/GWSl2S0GmeEUBA7eH
	N4PH4owYPh9W4dXYpi6ZwIF0CT9wn9ssThuo+0rRjGHzgpFGXT1SOo4bQpwd/bHkmRlg
	1BIAtwQ3WLTN7IpBh4Vl6Q35MRIQMwscz7uuW8G78C572k8RI0senI1I3+pEWJX8mNJs
	f/tvIBKz1w8PkcgmhyCd0Q0xt7O6NvUm8L+cGQlt6lHm4YuIZ7uvkNEhXiPWZZVsE1oh
	r7Ew==
X-Gm-Message-State: ALoCoQmC0665rzSERBHgvEW9QH3/6wIL+F9fxAGRRbpvW552vngeviFAD2z1nr1rMeiMuv8ZM6XW
X-Received: by 10.205.92.201 with SMTP id br9mr139461bkc.138.1390480294631;
	Thu, 23 Jan 2014 04:31:34 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id bf8sm8990710bkb.14.2014.01.23.04.31.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 04:31:34 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2014 13:31:26 +0100
Message-Id: <1390480286-17368-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] scons bbclass: enable parallel make
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
X-List-Received-Date: Thu, 23 Jan 2014 12:31:35 -0000

Scons supports -jX parallel make, so let's use that. A small scale test of a few recipes shows no failures!

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/classes/scons.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index a07a366..fc0f26b 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -3,7 +3,7 @@ DEPENDS += "python-scons-native"
 EXTRA_OESCONS ?= ""
 
 scons_do_compile() {
-        ${STAGING_BINDIR_NATIVE}/scons PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
+        ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
         bbfatal "scons build execution failed."
 }
 
-- 
1.8.4.2


