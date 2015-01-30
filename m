Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id EC6D66AC15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 17:31:28 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id k48so28396956wev.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 09:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hsMfKZgzkgCxtZoAXX4QGEwdeWinSEyvdLRpdGE6syQ=;
	b=BB3yoUwAjXPGrqYPtjvJ0P/dc65PDtpXZz5t9ngZdWdalYzL3gomd49IjzLLg9hrfc
	7yaW3L78wbpb1JO9G3ebC4ZW5DVZAVK0Hj3yE1jk1nBIat1s74LrSMqISq5Q0mn4ZhWs
	oiScuwDdhvR5hm7KYgJvMFiglJt4uZFc1ZeLOor1q2ahFiYPzS1P7NKK4X6i1fwvpuwq
	DZ6zliMcW8sl7flyPaNcJ5Qx5URzyRgMygiZNjKS0sbgBJSGaZiaVaDHOBuOYl6VN5oK
	EeDLeuXK130DUEEhmKVe3H8VndbyOXeTUtZ6X0Bp2D6zPG2SHdXUyrje195pfJwuq9U+
	FXRA==
X-Gm-Message-State: ALoCoQnVWXHn99cshsALsWbzAmaDXcaje8JTTtUN3jgzviMvT3g90Vve2wwABGvd9PBOt1DOxXQ9
X-Received: by 10.194.7.103 with SMTP id i7mr13957461wja.53.1422639089712;
	Fri, 30 Jan 2015 09:31:29 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id fq10sm6991526wib.3.2015.01.30.09.31.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jan 2015 09:31:28 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jan 2015 17:29:37 +0000
Message-Id: <1422638978-1419-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] bitbake.conf: don't remove WARN_QA and ERROR_QA from hashes
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
X-List-Received-Date: Fri, 30 Jan 2015 17:31:36 -0000

Changing WARN_QA and ERROR_QA should cause do_package_qa to re-execute, so
removing them from the sstate hashes is harmful.

They were added back when sanity testing was part of packaging and this was the
lesser evil, compared to changing sanity tests causing a re-package of
everything.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b5b54b7..907ed1e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -774,7 +774,7 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
     PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE LICENSE_PATH SDKPKGSUFFIX \
-    WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR"
+    WORKDIR STAMPCLEAN PKGDATA_DIR"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED"
-- 
1.7.10.4


