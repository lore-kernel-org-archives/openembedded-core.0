Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id AD01760CA9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 22:20:42 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m15so10531729pgv.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 15:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6L82qHe+E29T9PAgVGWc4jnSP+RkyFplJkqKOMRXlik=;
	b=LdzG6HcIv0sWyAxl/9mRvvHY9wTt+icLhaQeaJPcBHb3uGHC9PSXMC0506EgqpgBPp
	BDqXjyyZC96hoz1CHhj/ggeZcMPaa2Y5pIl5Cz7b3+ijaFA7xYBOVGA1eHAJTlVjhW8E
	DifqYjstvW675Z6da5emmnskbDKhELUoLPtajbwbV+tsRqeOXl2X/OpkFuHxf62II9Lx
	MGSMZ9wuQ+gao19nN9z35hQqWzbQVnvP6dfl9BS98nFn00OS6v7BydmiYr4RHTHw6yEd
	DK+bpc91KVyGuU1/4WyxbgQZQoQutIx8dvZZrm3cgf6P7xn4ndFOU1ilgljl54BnqQQe
	XWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6L82qHe+E29T9PAgVGWc4jnSP+RkyFplJkqKOMRXlik=;
	b=WKMqFM2xbbi1QWm+90gS5WBu+cGai180pjY89ijrdEmXu0i6owQms8Hk9+ZXapI93/
	249+QL1JU4lyqql6CKLIi/S/01b21YKGjR/UMk4SoGvk0HVJf26DwZMeb0+dFE6r8nWY
	dnh0ylj6f8n2UjEVKuaMoOnamYX55ADb1d9OcIDha4q0fYfeFmYq5qeDFBaUYx3Wc4DX
	+AzFRTaPxTmAv7gUW7FWyAnWtty/PKPdI6lx5J7TGgnMaCZXf2B/aQXJNSUemjaHwSS8
	o3qliv4gOstZfeVHyT+dyFgGsPGkgByegSzFgUGvvghTSO/h4OMWoLAHufJXSNiQDtG1
	qoiw==
X-Gm-Message-State: ANhLgQ0AL2dN1tEcQPJMnXDPvKQk/Sjks+NaVO53CtUPMOa4p5R/fRIM
	hCcYBAaoaHhHvPoaMJsTRHOWfSZIro4=
X-Google-Smtp-Source: ADFU+vuzaTaUdlaxFB/yudosfAigKeCpXiHw/xXWgUZsoF0gS5e/2IRxVZSln7woyTNmG4i706ezNg==
X-Received: by 2002:a62:1b05:: with SMTP id b5mr1816942pfb.281.1584397243243; 
	Mon, 16 Mar 2020 15:20:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::593])
	by smtp.gmail.com with ESMTPSA id
	w128sm464722pgb.55.2020.03.16.15.20.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Mar 2020 15:20:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2020 15:20:56 -0700
Message-Id: <20200316222056.2674295-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Ross Burton <ross.burton@intel.com>
Subject: [PATCH] gcc-target: Use --with-arch=native for target gcc
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
X-List-Received-Date: Mon, 16 Mar 2020 22:20:42 -0000
Content-Transfer-Encoding: 8bit

This should help gcc detect and use target ISA on x86_64 machines when
-march is not used on cmdline

[YOCTO #139]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 7cf819272f..aa274bb936 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -19,6 +19,7 @@ EXTRA_OECONF_append_armv6 = " --with-arch=armv6${ARMFPARCHEXT}"
 EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a${ARMFPARCHEXT}"
 EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve${ARMFPARCHEXT}"
 EXTRA_OECONF_append_arc = " --with-cpu=${TUNE_PKGARCH}"
+EXTRA_OECONF_append_x86-64 = " --with-arch=native"
 
 # libcc1 requres gcc_cv_objdump when cross build, but gcc_cv_objdump is
 # set in subdir gcc, so subdir libcc1 can't use it, export it here to
-- 
2.25.1


