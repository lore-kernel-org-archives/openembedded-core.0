Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 488B4719A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 03:25:24 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id f144so1197677pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 19:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=from:mime-version:content-transfer-encoding:date:subject:message-id
	:cc:to; bh=mm7A4i5aaVO3yEAKDrP4aok/co56RTyrzKbWLpYZ6Ic=;
	b=X0ZzEXCigBhME1tL//xV1/nSExswIaypBntLB+GCpZ6nBbiD3EOondVsSPNpi/KUQH
	k4xb1KAiPeBvFzr1yOtwTGlJPPezGRyECKXBCvhr41oGBKErWsyX9b80ko9hL3J+w8Bx
	nq2ziWs7BxfdxVgLnG/N1IAItmkyeYjs4qu3RrGRjbA+4zRLwtQidk37+ZiYwnAI2lUN
	vfcHEnEbrpgXH5flAd7Eh60zNTwlQMOmyups3WWdIvVNyYIsMKO9bdgHO2QOhVnmNT3k
	IMzzAoRIV/86h5pK7oMeRIO7zk8VcOUqnUGP2zZr1/EPmItu6O03yRaYzXBy1vSqh7rk
	XHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:content-transfer-encoding:date
	:subject:message-id:cc:to;
	bh=mm7A4i5aaVO3yEAKDrP4aok/co56RTyrzKbWLpYZ6Ic=;
	b=Xz+P0JfHlV8t0ACGrFHyjkudO9/WsA+yOb3IShVyf3le4tBIG5ZezYpMIxc8uxK36m
	UKuPCerQsmSwnTc28Y3uE/C9h1ym/XhIgwaufoMTzfMspdAE3wmyOEkTIAidZLo7qPL9
	6hevarUiO3sISr2KL4oTorg9uICYHjPxdmZMJwwKvKNZ6tKN+pQCKjjqzzi+uhvUq5lt
	CcCgxlL9DwC9IQ6FREK7PebeVGLW2R+x/gLPOpufzjevBbdGrX6pQijWj8JNUs5LVrAp
	ydDkTLxVmcum0yCK1oxNBn1LMZan/HZRbBE8GdpSGW3a0V+AsQcgkgpVhyajyMsHVTuK
	s3VQ==
X-Gm-Message-State: AIkVDXIV97m1utm5yhiaQpuoX09F7nPg0JlDniNVHV+PgfcVi/HT4ge+b3S9zB631pPJ9g==
X-Received: by 10.99.158.18 with SMTP id s18mr14858287pgd.88.1484191525040;
	Wed, 11 Jan 2017 19:25:25 -0800 (PST)
Received: from [127.0.1.1] ([121.222.109.132])
	by smtp.gmail.com with ESMTPSA id
	l63sm16827843pfl.83.2017.01.11.19.25.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jan 2017 19:25:24 -0800 (PST)
From: Nathan Rossi <nathan@nathanrossi.com>
MIME-Version: 1.0
Date: Thu, 12 Jan 2017 13:24:36 +1000
Message-Id: <20170112032436.7717-1-nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] kernel-fitimage.bbclass: Check value of UBOOT_SIGN_ENABLE
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
X-List-Received-Date: Thu, 12 Jan 2017 03:25:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Check the value of UBOOT_SIGN_ENABLE, as it is defaulted to "0" which
for matches as True in python due to being a non-empty string.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2: rebase on master
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2934b3a31a..3312bc494f 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -26,7 +26,7 @@ python __anonymous () {
         # Verified boot will sign the fitImage and append the public key to
         # U-boot dtb. We ensure the U-Boot dtb is deployed before assembling
         # the fitImage:
-        if d.getVar('UBOOT_SIGN_ENABLE'):
+        if d.getVar('UBOOT_SIGN_ENABLE') == "1":
             uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_deploy' % uboot_pn)
 }
-- 
2.11.0


