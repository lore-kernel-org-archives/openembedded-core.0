Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id D07DF6D2B1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 22:34:41 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so3074222eaj.20
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 15:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vczp8qycCvyNY8xV9WQkFmf0OBS9J2/5IcV5unMF1Jg=;
	b=nDcmXVrBmmGhtcQRcr+uuBa33grB38fxF4GPWabpfae2BTtJDSvNzPagzzQobR2+JR
	iBbYbc3B33VzhrDzkD+i6RE7Ayg8oJ3zzAmIbKL1p+XpSsQhnlLt3Tec2uy3P3ev3oxm
	mhNBJSq4y2YZ/m5K1ZoLyl+CDVXabVTESiUgyG0brkEoQrruRUbZkSV1rktX2daYQZ0L
	WSlm3EOJqEIcYeY5VaHXwqUSYvVIkSKpk3lmbNo8yrEDVYY8zXnPBmkj6NCnxCOjdbQI
	gxIt3B2YFFCBcXQULp7sQolitAxmvEJ6VuG+Ja85PIL3zq/DV29Q/iELkIWtG3WMQKoe
	G7rg==
X-Received: by 10.14.241.141 with SMTP id g13mr81511eer.75.1382308483464;
	Sun, 20 Oct 2013 15:34:43 -0700 (PDT)
Received: from mizar.localdomain
	(host218-209-dynamic.16-79-r.retail.telecomitalia.it.
	[79.16.209.218])
	by mx.google.com with ESMTPSA id j7sm35752601eeo.15.2013.10.20.15.34.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Oct 2013 15:34:43 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2013 00:34:23 +0200
Message-Id: <4d3b92857fd4980bd0dc3bfeacdd57378c042168.1382307169.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1382307169.git.andrea.adami@gmail.com>
References: <cover.1382307169.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1382307169.git.andrea.adami@gmail.com>
References: <cover.1382307169.git.andrea.adami@gmail.com>
Subject: [PATCH 5/5] image_types.bbclass: add JFFS2_PADDING variable
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
X-List-Received-Date: Sun, 20 Oct 2013 22:34:42 -0000

Defaulting to '--pad', meaning to pad until the end of the erasesector.

Allow machine.conf to override the value without redeclaring
EXTRA_IMAGECMD_jffs2.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/image_types.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 372420d..c5bacd8 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -210,9 +210,10 @@ EXTRA_IMAGECMD = ""
 
 inherit siteinfo
 JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
+JFFS2_PADDING ?= "--pad"
 JFFS2_ERASEBLOCK ?= "0x40000"
 JFFS2_NOCLEANMARKERS ?= "--no-cleanmarkers"
-EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} ${JFFS2_NOCLEANMARKERS}"
+EXTRA_IMAGECMD_jffs2 ?= "${JFFS2_PADDING} ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} ${JFFS2_NOCLEANMARKERS}"
 EXTRA_IMAGECMD_sum.jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} ${JFFS2_NOCLEANMARKERS}"
 
 # Change these if you want default mkfs behavior (i.e. create minimal inode number)
-- 
1.8.1.5


