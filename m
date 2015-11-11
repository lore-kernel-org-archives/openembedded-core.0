Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id CE4E377184
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 17:41:54 +0000 (UTC)
Received: by pasz6 with SMTP id z6so37962556pas.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 09:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=//Cm86QHOBg8vWBwjjWtjUXJMLm0E/veWf9VwqgX0C0=;
	b=Q6zAhfWqUYd2VrJeM6zGbdczASlJBAWs4RVRMRd6UR2H9eSCtVKV0FAIwoi5Zjcd7T
	RTZJ1gBac5zedMjCHbf9p84eH2nTZdmpXubQYCR1dEKTGksnGziRnq20BInoBJpuRMFU
	ior5eIUdI337YETrjypj2pmdAxSx2AXKuDYiQ9zMszp0FlzvIIt4IKS1zlK1qlsJ6pZ+
	DSwOzAAJNWQwn6Ra7lHrDHkDqoCCtLgwdQHzHXzhXsDXZWxOv+86E0ePpComTT093156
	zC5kxYfVcjXK+uMO0Y+yzu3odCZGpVSW41K8o1OCb9KrnWDPrkTMPGgRQsMtnT0TVHzo
	AnXg==
X-Received: by 10.68.216.36 with SMTP id on4mr16505654pbc.12.1447263714905;
	Wed, 11 Nov 2015 09:41:54 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	v17sm10395426pbs.69.2015.11.11.09.41.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Nov 2015 09:41:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 09:41:47 -0800
Message-Id: <1447263707-27696-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1447263707-27696-1-git-send-email-akuster808@gmail.com>
References: <1447263707-27696-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 2/2] ldsoconf: allow extension via local.conf
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
X-List-Received-Date: Wed, 11 Nov 2015 17:41:54 -0000

From: Armin Kuster <akuster@mvista.com>

this allows extending ldconfig search path from local.conf

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/classes/image-ldconfig.bbclass | 6 ++++++
 meta/conf/bitbake.conf              | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/meta/classes/image-ldconfig.bbclass b/meta/classes/image-ldconfig.bbclass
index e9946da..ce10673 100644
--- a/meta/classes/image-ldconfig.bbclass
+++ b/meta/classes/image-ldconfig.bbclass
@@ -11,6 +11,12 @@ ld_so_conf() {
 
     rm -f ${STAGING_DIR_NATIVE}${sysconfdir_native}/ld.so.conf
 
+    # dump addition lib possible defined in local.conf
+    for file in ${LDSOCONF};
+    do
+        echo ${file} >> ${STAGING_LDSO_CONF_DIR}/ld.so.conf
+    done
+
     # save lib dirs as defined in recipes
     for file in `find ${STAGING_LDSO_CONF_DIR}/*/* -name "ld.so.conf"`;
     do
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f0471f4..1f78c49 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -815,4 +815,7 @@ MULTILIB_VARIANTS ??= ""
 # 
 # ldconfig stuff
 #
+EXTRA_LDSOCONF ??= ""
+LDSOCONF = "/lib /lib64 /usr/lib /usr/lib64"
+LSSOCONF += "${EXTRA_LDSOCONF}"
 STAGING_LDSO_CONF_DIR = "${TMPDIR}/work-shared/ldconfig"
-- 
2.3.5


