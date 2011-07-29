Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QmqYV-0006qG-7S
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 19:08:59 +0200
Received: by fxg11 with SMTP id 11so2757169fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2011 10:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=QhA9Kxph0lurmaqmcAafWsJyp5teqS3Ma7Wp9BkYlWY=;
	b=c7k5f6MiQity7lxeyt9AF868g2xmnzBxRFvx2WVFQo+iuTjXl/z+W0LMLJDmCrTesm
	nIA8IlCdSjFu4UF9uIZC1AB8U3Nv7RedY12U+5qbCAt7UDfVZTdJtFj8s/1eXkDrL6TX
	PGst+TyMJp+HJBNjCxX9M7gV1MMriq+Ow+KOM=
Received: by 10.223.83.15 with SMTP id d15mr2086636fal.105.1311959082694;
	Fri, 29 Jul 2011 10:04:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q5sm1201884fah.6.2011.07.29.10.04.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jul 2011 10:04:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2011 19:04:33 +0200
Message-Id: <1311959073-16925-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <20110729163912.GN15286@jama.jama.net>
References: <20110729163912.GN15286@jama.jama.net>
Subject: [PATCH] feature-arm-thumb: respect ARM_INSTRUCTION_SET
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
X-List-Received-Date: Fri, 29 Jul 2011 17:08:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../conf/machine/include/arm/feature-arm-thumb.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index b580168..e7d392e 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -5,7 +5,8 @@
 # but requires more instructions (140% for 70% smaller code) so may be
 # slower.
 TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "-mthumb", "-mno-thumb", d)}"
+ARM_THUMB_M_OPT = "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "${ARM_THUMB_M_OPT}", d)}"
 OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
 
 # Note armv7 will hit on armv7a as well
-- 
1.7.6



