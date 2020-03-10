Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D830060706
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 23:28:15 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v9so192761wrf.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 16:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XNu+Ez4YvChnG6RNor17rhIdFvVYfaSjr2QwZAIHhT4=;
	b=CaDd6EdV4Js1QIEUVkanhLt7gcTyvqYpRVll/o2mcZgrma3NNY9onvftLRQT+izWmf
	lGOYjNO63voZryQYoGJ2ahUZbbCllC1nM/nnDYRQLGrRzPeL08y/2venDrnxBBvande/
	EZvl3V+vS+Iz6p6CRHPuI2T7MeO6SW884aYZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XNu+Ez4YvChnG6RNor17rhIdFvVYfaSjr2QwZAIHhT4=;
	b=LFvJpLY3t8Mu7zh1y6mrTn9UyIkOnUWc+zVWWP+Q5l//QYySxMxVK/qgp+5IuDFsx/
	euWwAlqfm3Y1xaDQyRKz7nS1WSws3BUzCU1n7+s3bKn4mLtjXiuaL+JwbmGSA87iHAby
	uPGHVD/C6pgfX1Sreae29LiKoe05I6pCnyeH1/r5CRuinJyTbvYGq2w72KsjHKFIB5yi
	lT/lG4JHv3RNjDBKwLfY8o7mh0Sle2MvO0sy3rwrHSrR21O/eKlYDARjDPs9TtFVFiP/
	Z3STPS3ccyX9WvVBS3NAIGL8COc9gzdG5xPuBPRVFhkjlQ3RgcwM+pnG8CoK6C4/VEDf
	B3YA==
X-Gm-Message-State: ANhLgQ2xbQJrkFhhAQeJWphCj1F3iMY6thxOJRdH5ztTCPMpJ99hSMJ9
	ahp6cpv9S/A3N6gfOFvwTnaVuoDQ1K0=
X-Google-Smtp-Source: ADFU+vvI5BDF+vxkdficQGJOU7N7FPPnvQ0LvubWN8YUWsSYXPGXM9RgIYSQEyYirb/VpSYAX9ilLw==
X-Received: by 2002:a05:6000:18f:: with SMTP id
	p15mr257542wrx.149.1583882895769; 
	Tue, 10 Mar 2020 16:28:15 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c85sm6254460wmd.48.2020.03.10.16.28.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 16:28:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2020 23:28:09 +0000
Message-Id: <20200310232814.48572-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Ross Burton <ross.burton@intel.com>
Subject: [PATCH 1/6] gcc: don't ship build host information in the target gcc-plugins package
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
X-List-Received-Date: Tue, 10 Mar 2020 23:28:16 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

The build host configuration isn't reproducible as it varies depending
on the gcc version of the build host. This information isn't useful on the
target anyway so remove it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 18d078db0af..204f9475fc5 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -179,6 +179,10 @@ do_install () {
 	# Cleanup manpages..
 	rm -rf ${D}${mandir}/man7
 
+	# Don't package details about the build host
+	rm -f ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/auto-build.h
+	rm -f ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/bconfig.h
+
 	cd ${D}${bindir}
 
 	# We care about g++ not c++
-- 
2.25.0


