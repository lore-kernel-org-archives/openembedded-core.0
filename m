Return-Path: <liu.ming50@gmail.com>
Received: from mail-lb0-f196.google.com (mail-lb0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 43A8160132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 14:20:06 +0000 (UTC)
Received: by mail-lb0-f196.google.com with SMTP id bc4so1181672lbc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 07:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RE77cEtXCUXeW44P59EsoEZEjoZ5jG0ASYS5JJqOhLo=;
	b=HY7aM9GDT8B2cQjquQkyX6e+PUO6JbpQM5oZGpTm2qVfiNKPkcOQDjC8Ty4GOP6XU/
	yKrf6fLk9adIMzTGt1Z3bMEmMH89nq4u0EbEA8tiraGXKGOL8fmEPKE0c9oICKgvhwRl
	iLjP+4gPjWel0IerK8yZWT593WWoqqXbBOG3DAKeuttX43aPoELR5ER+3gqauWNtyR+d
	Z7Lgzo69czPHkz3YBg59+xLCDATpiZuGmNbCPcEIUK1H+NM012ZKgUQwzo4x6H0+pS8C
	aMgm1tVPRqEuUuhHCkglCj/d7JcyuU2PgPXXxrPyhEd4Ngi6DKFUDNK5LYd2xRQv0jFJ
	I0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RE77cEtXCUXeW44P59EsoEZEjoZ5jG0ASYS5JJqOhLo=;
	b=jYVjVBpKxyqYd6Ldr7madOF4My2yD3nNji4HfBvGMJmYEQuLQ7wBQVTl+ydJpWWddO
	MVl4ZXc/nQP5IMJwafHxYjnYN1YhJEO79Sb1PhmeL71l/iSSy01X9T0CaSBvH1tVDhim
	Vs8bTmKjlOaRTp3LB2oiH9gTb+uJxxVTQfSHF9xeKCPHUUx6dD5fMAK1Hzrb4GS7f4vq
	kcvnjRZRGe/Uy6mqWwe6O+KRUEMwQ7eGy1gSebYJpnQKPVM5iebOWM2G25IN/UNlqT7a
	8j+3NCCnVw2dtnIkYs7xChcw5ehIltEhBGNTC9AlY6TarZPHkwZHjtEYCvJ2a1tCHMiY
	0d0Q==
X-Gm-Message-State: AD7BkJJXNFxtILQzJB489CJuIXUXnugwvcIlfmkd0iRH/0OlJl2kfT172Jfccc5xCy8cag==
X-Received: by 10.112.14.102 with SMTP id o6mr1331507lbc.87.1458742806591;
	Wed, 23 Mar 2016 07:20:06 -0700 (PDT)
Received: from localhost.localdomain (m77-218-253-198.cust.tele2.se.
	[77.218.253.198])
	by smtp.gmail.com with ESMTPSA id m64sm437283lfd.36.2016.03.23.07.20.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 07:20:05 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 15:19:58 +0100
Message-Id: <1458742798-9890-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Peter Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH v1] libmad: avoid using legacy _thumb overrides
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
X-List-Received-Date: Wed, 23 Mar 2016 14:20:08 -0000

From: Peter Liu <peter.x.liu@external.atlascopco.com>

_thumb had been dropped from overrides since commit 351443d7:
[ feature-arm-thumb.inc: drop legacy _thumb and _thumb-interwork over-rides ]

Change to set EXTRA_OECONF_append by checking ARM_INSTRUCTION_SET instead.

[YOCTO #9323]

Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
index 9e08b16..4c15db2 100644
--- a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -27,7 +27,7 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "-enable-speed --enable-shared"
 # The ASO's don't take any account of thumb...
-EXTRA_OECONF_append_thumb = " --disable-aso --enable-fpm=default"
+EXTRA_OECONF_append = " ${@['', '--disable-aso --enable-fpm=default'][d.getVar('ARM_INSTRUCTION_SET', True) == 'thumb']}"
 EXTRA_OECONF_append_arm = " --enable-fpm=arm"
 
 do_configure_prepend () {
-- 
1.9.1


