Return-Path: <victor.kamensky@linaro.org>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id C12CE608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 16:15:06 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id uo5so3477856pbc.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 09:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zaDuiSXP7J9KhDZtZnKC9MrG2n1lIgIye8qvVBeDFPo=;
	b=hMcdUZXIuK2c4MmWp/UYl6kRq1iNYNOlYMuCLdQzlk5UcuQ5UpmX3dBXg7lKnSvRtb
	NnBQpLZd5zze4xC3FxIVIprBaewN66aE7WAvR9XqYnglmUu/JhNNEKftGpEjDkl1BBgx
	7lhyVAT5mhv0De4xR9pxRNYxbs8v//8Kewjk2pP2YW2W2KzSnid7XNZ9/Ghpja9840zi
	Z6hXWKbMwDde2nMFwOSlEENLJmIKsQajrq2MRnw79sMnJKb7d7SP3FuTWfgKkY7WcYDv
	EEbU4p+OMQLfHgx/Mtlr2grSjw16unfAPWXz6fQgc8eStHIzeEYUn7S5ASeoVCx1ywft
	R2rQ==
X-Gm-Message-State: ALoCoQlw1qbQhBWFTfGEOGzBFYaTfrkdgi3vG6AgweHi1eGnPCD263SIbVkhYZpJECToiji8L1Uk
X-Received: by 10.67.23.36 with SMTP id hx4mr7057973pad.54.1375978507503;
	Thu, 08 Aug 2013 09:15:07 -0700 (PDT)
Received: from kamensky-w530.cisco.com.com (128-107-239-234.cisco.com.
	[128.107.239.234])
	by mx.google.com with ESMTPSA id 7sm17339991paf.22.2013.08.08.09.15.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 08 Aug 2013 09:15:06 -0700 (PDT)
From: Victor Kamensky <victor.kamensky@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 09:14:29 -0700
Message-Id: <1375978469-15252-2-git-send-email-victor.kamensky@linaro.org>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1375978469-15252-1-git-send-email-victor.kamensky@linaro.org>
References: <1375978469-15252-1-git-send-email-victor.kamensky@linaro.org>
Cc: patches@linaro.org
Subject: [PATCH 1/1] systemtap: fix build failure on host system with dyninst installed
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
X-List-Received-Date: Thu, 08 Aug 2013 16:15:06 -0000

On host system where dyninst installed (i.e Fedora 18 with SystemTap)
builds fails with the error from do_qa_configure "This autoconf log
indicates errors, it looked at host include and/or library paths
while determining system capabilities." Problematic config.log
indicates inclusion of /usr/include/dyninst/dyntypes.h

Fix for now - disable dyninst in oe builds

Signed-off-by: Victor Kamensky <victor.kamensky@linaro.org>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 9bba5a9..4f60f6b 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -13,7 +13,7 @@ RDEPENDS_${PN}_class-nativesdk += "python-native"
 PR = "r1"
 
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
-            --without-nss --without-avahi \
+            --without-nss --without-avahi --without-dyninst \
             --disable-server --disable-grapher "
 
 STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"
-- 
1.8.1.4


