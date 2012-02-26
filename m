Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1Yzw-0007VH-Lg
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 08:58:24 +0100
Received: by eaae1 with SMTP id e1so159520eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 23:50:00 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.96.11 as permitted sender) client-ip=10.14.96.11; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.96.11 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.96.11])
	by 10.14.96.11 with SMTP id q11mr5188895eef.98.1330242600101 (num_hops
	= 1); Sat, 25 Feb 2012 23:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=bAGxpX9CaFJ50smPGaSU1XI32915VKuE/q1EiFh3jwk=;
	b=q3rTHgnB7S0Yq82Uj+f2q7e3Fb8hrMsrd9ZIUv00cxrdAXwQrjFM4QXPKMYGiT1ZiE
	2VDmQjw7LRK2vn8rlonM0wtCZBvuXApDsUhtsvC40oWFBCwjBFLBaJkQylrg5tmhfGsr
	M1fIzJ3jwem3Wr1dCDa+8IZnXH6AF4agWJUso=
Received: by 10.14.96.11 with SMTP id q11mr3952104eef.98.1330242600033;
	Sat, 25 Feb 2012 23:50:00 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u9sm41699660eem.11.2012.02.25.23.49.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 25 Feb 2012 23:49:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2012 08:49:41 +0100
Message-Id: <f88bff815fdeb404bb9a51efbf1b03862ef6dda0.1330242184.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <85003f1e060b6a4406bdde5c48fb9a09bea2ee05.1330242184.git.Martin.Jansa@gmail.com>
References: <85003f1e060b6a4406bdde5c48fb9a09bea2ee05.1330242184.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330242184.git.Martin.Jansa@gmail.com>
References: <cover.1330242184.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 2/5] bitbake.conf: remove TARGET_ARCH from in SDKPATH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Feb 2012 07:58:24 -0000

* SDKPATH shouldn't depend on TARGET_ARCH as discused here:
  http://lists.linuxtogo.org/pipermail/openembedded-core/2012-February/018222.html
* introduce SDK_NAME_PREFIX so that distributions can overwrite only
  this instead of whole SDK_NAME

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 55daa9e..f2666cb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -360,8 +360,13 @@ DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 
 PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
 
-SDK_NAME = "oecore-${SDK_ARCH}-${TARGET_ARCH}"
-SDKPATH = "/usr/local/${SDK_NAME}"
+##################################################################
+# SDK variables, 
+##################################################################
+
+SDK_NAME_PREFIX = "oecore"
+SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TARGET_ARCH}"
+SDKPATH = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
 SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 
 ##################################################################
-- 
1.7.8.4



