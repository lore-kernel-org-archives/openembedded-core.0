Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1DBDB76DBB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 22:42:59 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id p63so139880587wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 14:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=HspYazgxgSJ4KwUoD+qUSLk6EW1Alevli/mB8RfV3QM=;
	b=tm7qTXr3uudauJxHaBeT1vhxk/KPC+/MDSvTRVqe2EmaKqxQM+ljZSZFLyUSED7RVq
	/cGN6F+iQImksogfZULv7j0fmC78twb/QthrMI5ovj3pFBVihLZFKFs+EXouv79rZpNl
	RViQVF7CA4mbaP1R7Fd5MUPJYNrHW2AR823y3yZ+CJ9lOdhMX672udVFNXDI/8Q7y9iN
	OuR7IK9RvzCXcl3AlkZfVAN5kNiGXQlBWsPKLU3Jg7NyPmAJniswCZ5wNpHVEg8/zopd
	3i5SbpvMalpWrBt+yz/PtKl8LGmApzLOtCxyrMw36JDfLHhWPOD/mJRUFehqeJrVElEr
	g5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HspYazgxgSJ4KwUoD+qUSLk6EW1Alevli/mB8RfV3QM=;
	b=SSyUZemecmFKaLtEh1mtkWFOj88Ywdwpemka2CcCD7b5e7PTOtVZBw/eDD68h9zdoK
	fHD9KjRCo2j7RovHKEbgkgTIf22EIELUtSi6Rs15dcQegaT9GFdHv/8kIU7QrzDltpxa
	pUitCXAuw/XZTkPwY6o7+0idjaM4kpkgC6HmUZfqzUjaBgWlcv+C1xQv84ZhcUEpXXeK
	CQdaZYB+QRiVzRxkC/CB3NDkpfntje6eCLOR0a82Ev1ps86o9GNcytyALe7vnK0Ak5DD
	Kd+jzOLGqfaKgUCrv3OUkBSEyiZsCB+ELkJRta17js2eYOtr+ayGLP25ZhMPDA8+H3zd
	ea5Q==
X-Gm-Message-State: AG10YOTGLCzvpgd22MTGksoRljICTNkNJEFAeB5tJJAp+uLXwTfy74+WFan5bNG3rVgexMbQ
X-Received: by 10.28.63.200 with SMTP id m191mr104129wma.21.1454452980123;
	Tue, 02 Feb 2016 14:43:00 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id i2sm3464816wjx.42.2016.02.02.14.42.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 14:42:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 22:42:57 +0000
Message-Id: <1454452977-18844-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] piglit: don't use /tmp to write generated sources to
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
X-List-Received-Date: Tue, 02 Feb 2016 22:43:00 -0000

If there are multiple builds on the same machine then piglit writing it's
generated sources to /tmp will race.  Instead, export TEMP to tell the tempfile
module to use a temporary directory under ${B}.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index e0bd1fe..4858652 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -18,6 +18,12 @@ inherit cmake pythonnative distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
+# The built scripts go into the temporary directory according to tempfile
+# (typically /tmp) which can race if multiple builds happen on the same machine,
+# so tell it to use a directory in ${B} to avoid overwriting.
+export TEMP = "${B}/temp/"
+do_compile[dirs] =+ "${B}/temp/"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 
-- 
2.7.0


