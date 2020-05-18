Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.850.1589820574469569337
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=eB6iLIAa;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id n11so5084768pgl.9
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=60fI6ucoeMqMrWyIhCahgMiXusn2BS5gZKlJKS8prAQ=;
        b=eB6iLIAaJkZaXe0IsChaDOcjIs22qArEu68oQYK0QJoih1VNwM5KAJQCg2Iq9/Fxgg
         Zx1GRQ8KY5Q+rl1sA+z+eUuZxz+AmFJv9UJGcbLrN+Yxy1n5lXfY5n1B7s+PXzSRTyEV
         I/CNq2v+A2D1wmipPlkncbM9OjDU1JHiOB3iH/0Usf7+kj5gLnih2gPTsOqPL39ecqfj
         /SR5Dk5dR/BmaIcPpsLJMnKFksHmSDUdJ3x8PuB2PAEqxCX6fnawcGaGW1XRo5vEpHmi
         jzDf0vCng6fhlcUM7SUDejKAx/rF87LrNHFePHmP0Dcc1GtnIF/lkgIA5WjS+RiwqwTn
         yn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=60fI6ucoeMqMrWyIhCahgMiXusn2BS5gZKlJKS8prAQ=;
        b=XGFIsMnWiOcSLA0mpd1YCwOvv+nfOI9pbcSxY9wtgzVpxPOY5EEHba7p7Zp/F2iQze
         8Qu7oooeZ18hpjv56dd5CWuqJB56PkFmPgqHuDApCWc9LmOLffE7K1Pq5/La5TQVoC/M
         B9H8QPXUNneF/7I8grDFl7DKTYxwYTT3hkf75ajiP3LYLBFFb7KWgapFrLPMN0MpA6xX
         EiHfyj9NhD2VSoMeQZj7H1A7O0S5JpAGJA3WBDx5CBaqfyrSWPodBecCNCPoSxPYLDjs
         dnnfNxCyfrJV3lh4sQhnv7Bd5yclxw2C4kuRFdUIHN2e0U36wVK2unbERkvfLk5fCJhM
         nL5A==
X-Gm-Message-State: AOAM530plkTcDGtaemj96aACuKujMRiYC5szz2wKEgiPAMfiKkHQLgoM
	pPvWumjhci8MxnV0qnfFA52HSys5KbvN8g==
X-Google-Smtp-Source: ABdhPJwtscCAqY9u4IoeDnnSex/ph84jFt20rUSs1xK+lWTXUT7nd70b5mYRweomJmt265iw/DVmjQ==
X-Received: by 2002:a63:1c50:: with SMTP id c16mr15366069pgm.255.1589820573519;
        Mon, 18 May 2020 09:49:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/19] bitbake.conf: Prevent git from detecting parent repo in recipe
Date: Mon, 18 May 2020 06:48:31 -1000
Message-Id: <02ecf3e2a98a614805f6f2574c2bf14162192d01.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Prevents git commands run in a recipe from moving up past ${WORKDIR}
when searching for a .git directory, and thus prevents them from
detecting the parent OE-core .git directory. Fixes several
reproducibility issues where recipes would use the OE-core version as
the recipe version due to git walking up the tree.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4b544a22cd..bdade79abe 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -718,6 +718,10 @@ export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
 export PKG_CONFIG_SYSTEM_LIBRARY_PATH = "${base_libdir}:${libdir}"
 export PKG_CONFIG_SYSTEM_INCLUDE_PATH = "${includedir}"
 
+# Don't allow git to chdir up past WORKDIR so that it doesn't detect the OE
+# repository when building a recipe
+export GIT_CEILING_DIRECTORIES = "${WORKDIR}"
+
 ###
 ### Config file processing
 ###
@@ -878,7 +882,7 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR BUILD_ARCH SSTATE_PKGARCH \
     BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
-    SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE"
+    SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
-- 
2.17.1

