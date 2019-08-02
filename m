Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id EE5A47D6B4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 15:22:25 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id p74so68322734wme.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 08:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=uvJ67W8o075E/YrVZ1pGi/442rNO85b1Ygy/SJCi3ug=;
	b=M05HuLrvsrnGCERT22MJZZ1bTKZ4rZPZGGyeIAceKCQubX4ZBF6kPKUobaUVOhe4oR
	E6YbtMlDVYJsqfUjbQ5r40CWsO10ILc/s/a/ePTU5T41Anj44pt+RyRvjjtB/Fs00+w7
	bH/7jSr3fYFuRO11/1EDrCugd/pwPKaFkm3VQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uvJ67W8o075E/YrVZ1pGi/442rNO85b1Ygy/SJCi3ug=;
	b=hPopesChTT+Zf94zQRre4WQm/WFhAb0Sv/YVLipBDgcc2LXBqugnPnno/6SB6CsVhO
	3qHMZJyS3M28XenkUmlyt5ma1TuLcZ9yeCH4r6KLKjcwMXSry9svPVPThj/A28cEC/Yj
	LQW8tMbmzcS7oTO/JIC73VZNSJOsPsQICfP7k5KQvNACCr8jfsAXsIQnIJRJ5bGijBQJ
	wdJyVsjlx8BcErh786uhQWRPdX3nCjixLsWUMiwltfcleH/FVorTXw3aCna7CuImV+cf
	fqqsx3jrsZxVoatspyxX91IDM209zVNkY2GGZWxB58NK4WU8NG/OOsUz6WfnJejRG8at
	VfCw==
X-Gm-Message-State: APjAAAXrtv0KdQMZWJtjPvl6wYbyLnisqfC+bgydv8SjvsxTrlWOXCBj
	PMJmJtOBbOB212M2GQn34ae5INxinPQ=
X-Google-Smtp-Source: APXvYqwqeQC3lbNt/UAI3odfYMNnNo96bNwOP6eYo2wFlgMyCfHTWmn2jQrv37wEm2u1FvL46/8X5w==
X-Received: by 2002:a1c:343:: with SMTP id 64mr5190486wmd.116.1564759346346;
	Fri, 02 Aug 2019 08:22:26 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r4sm46734991wrq.82.2019.08.02.08.22.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 08:22:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 16:22:18 +0100
Message-Id: <20190802152220.16954-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802152220.16954-1-richard.purdie@linuxfoundation.org>
References: <20190802152220.16954-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 6/8] sstatesig: Update to handle BB_HASHSERVE
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
X-List-Received-Date: Fri, 02 Aug 2019 15:22:26 -0000
Content-Transfer-Encoding: 8bit

Update the code to handle BB_HASHSERV, an autostarted bitbake internal hash
equivalency server suited to local developer usage.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf   | 2 +-
 meta/lib/oe/sstatesig.py | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 140f45b895b..ddcac09c5c7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -885,7 +885,7 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR BUILD_ARCH SSTATE_PKGARCH \
     BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_SERVER SSTATE_HASHEQUIV_REPORT_TASKDATA \
-    SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR"
+    SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index f1a5af69c5e..3f926e3e515 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -271,9 +271,13 @@ class SignatureGeneratorOEEquivHash(bb.siggen.SignatureGeneratorUniHashMixIn, Si
 
     def init_rundepcheck(self, data):
         super().init_rundepcheck(data)
-        self.server = data.getVar('SSTATE_HASHEQUIV_SERVER')
+        autostart = data.getVar('BB_HASHSERVE')
+        if autostart:
+            self.server = "http://" + autostart
+        else:
+            self.server = data.getVar('SSTATE_HASHEQUIV_SERVER')
         if not self.server:
-            bb.fatal("OEEquivHash requires SSTATE_HASHEQUIV_SERVER to be set")
+            bb.fatal("OEEquivHash requires SSTATE_HASHEQUIV_SERVER or BB_HASHSERVE to be set")
         self.method = data.getVar('SSTATE_HASHEQUIV_METHOD')
         if not self.method:
             bb.fatal("OEEquivHash requires SSTATE_HASHEQUIV_METHOD to be set")
-- 
2.20.1


