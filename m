Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DFE677765F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 08:49:07 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v190so12488952wme.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 00:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vqqKucfEv7fARepltpKfT36z5RjMzVoHA/7bhfZzIeI=;
	b=A+qPcnTAth31Zl6WDChTeQ/dhXMknpNnoCRlwoTRlWbPOyqM/3GjkPNViz4+4tTTY9
	xZ4yzMFJ9kzKHvAsPbzNFJ5z0S55DnA90ZI2mPDymCDaMyi6ki/HZE+jHEEvpVeCYHDe
	R0mis9cVR8dZSGV53xGpWPB8tsdclGquxUoo3aDovBOeGJk4v2rxW4g2hcm0khSh2OU3
	jhjCQKhdQO1ANsHHsCl4n+DOG5enB05rRZfbYiGAwOz46C8KYOChJxeCF5YYy90d9Gpt
	Dm2orymULkurK4D2NyC4NJeH7slnF351CvIPIULBJxZixBESv/+qJeJWaJWftZpICARF
	OKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vqqKucfEv7fARepltpKfT36z5RjMzVoHA/7bhfZzIeI=;
	b=eiHXVyF/eHZBmeIyyCAL9MRw6Svi5ONvNqy7IjhiaGt/YweDw/SlkB7Br/u9BxKfTa
	cP8cSYR32OVXYDpXwkiFFQEVhTr4IMN9EciyrJL4pC/2RKiH3C7LIqTnMw+acrfIZH+u
	oJ/MM5QI5Mbn1jVduOEd5cM9MI2J0CUmB/6cM0mGFh6B8HjhkPTJTKRzqed014BD+1UB
	+LXfT/dVlyDGsYVgLYZznpwiG3lJEWwxjuzxv9WPoqn5+JrHvZdo57OpwY0kJ4Ok6PwZ
	/oRmlfPBaprZWSSfdC3RKj/7W+DDx8wBv7RNSqrALJcAD1twUxJS/nNb7ENVRler5Gbf
	/nsw==
X-Gm-Message-State: AMke39lp8eamshgrrOiMqjVH9EREFp4edFmGJoO8gu9hKOVASqHmG6R7k281x/JQx+P25w==
X-Received: by 10.28.178.84 with SMTP id b81mr13672455wmf.83.1488790148948;
	Mon, 06 Mar 2017 00:49:08 -0800 (PST)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id r6sm13929708wmd.4.2017.03.06.00.49.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 00:49:08 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 06 Mar 2017 09:49:06 +0100
Message-ID: <3374968.1gDCVPrebl@crde-port-20.cahors.local>
MIME-Version: 1.0
Subject: [PATCH] openssl: Fix symlink creation
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
X-List-Received-Date: Mon, 06 Mar 2017 08:49:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

Ping

----------  Forwarded Message  ----------

Subject: [PATCH] openssl: Fix symlink creation
Date: lundi 23 janvier 2017, 14:59:16 CET
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
CC: David Vincent <freesilicon@gmail.com>

Symlinking the openssl configuration file at install time results in
errors when overriding it using an external package which also provides
openssl-conf. This should be done as a postinstall task for such
packages.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-
connectivity/openssl/openssl.inc
index 5cca019e1d..696b564cdd 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -201,7 +201,6 @@ do_install () {
 	   ${D}${sysconfdir}/ssl/
 	ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl/certs
 	ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl/private
-	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl/openssl.cnf
 }
 
 do_install_ptest () {
@@ -245,4 +244,16 @@ do_install_append_class-native() {
 	    OPENSSL_ENGINES=${libdir}/ssl/engines
 }
 
+pkg_postinst_openssl-conf () {
+#!/bin/sh
+if [ -e $D${libdir}/ssl/openssl.cnf ]; then
+	rm -f $D${libdir}/ssl/openssl.cnf
+fi
+
+# If openssl-conf is installed before openssl, we must ensure that the 
symlink
+# destination exists
+mkdir -p $D${libdir}/ssl/
+ln -s ${sysconfdir}/ssl/openssl.cnf $D${libdir}/ssl/openssl.cnf
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


-----------------------------------------

