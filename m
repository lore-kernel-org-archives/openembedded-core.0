Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6A360124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 20:49:13 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id t2so2919677qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 13:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fcbkJYyemvsjOTkt9+wh2ajnyo2r7jHpD1qZQROW7Js=;
	b=DN+nmbTvK71JK4Xz8og7Mndj9/egPliWZtHD2NHLLbBumthECJjzquZL9Jj74UhaIo
	OQnqW7F/6nLs22hHgaPVyz090N0fs+YznsAQfVk0KBPEXC151Qo/4m801HVW8D/HG0Aq
	6HQfK1vRFJpTpRjvIqbf94FpGo4+o86sZbyiSUy50nGBw7EBhaP7sBuny2sYVw2k4hvx
	qREI7dQDPBb15JW9LR11dMESgpT5TVx4FPO5Dhv/gHdB+PQyfx6XHo+BLvPvDFTQ3OfF
	blpNFYxmHpj/lXHS8uuzI/or8HISqu5m9chsbZFSn9xTDFUsTNDQPWW4u0RfciOgfAgZ
	oAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fcbkJYyemvsjOTkt9+wh2ajnyo2r7jHpD1qZQROW7Js=;
	b=FOOwFtj7hZdmr1jz4mBC8LzMuVypoWt+XEuOiq4VVyquu4wRszFeRdMaoUk9BnoREZ
	H0ZL/1FdMK7xATpI2H3oWkP/jmaJmBTNiY91WJVoGj7ExROxk2plXSs3ZFrjlro7FmAK
	Ajn9cGxTrxRaOXkPlg4wkHzWXRlkYeHy5uFEQrRQUMYIAX6aSYmkjmjKLfQbJFvjjCZE
	kPsomTD9ug/Y1w2xjgj4E0TL6KCDFj+qA4jctFqGOxAvZegp8tSClj91N2WrOIQ78oJm
	kCL+zGccMUGDo3SNi5Ju3jNOd6+XKeTMz/ewydSaMMrgW2eleDxBWsHoMjPB1N9mDnmV
	USyg==
X-Gm-Message-State: ALyK8tLFjOOKwfmPY5K9eazwGb/5tBWhYrXJLu2L6XRjEdO9PFLD3j8ap4pbevZvUyMm4Q==
X-Received: by 10.55.77.4 with SMTP id a4mr316684qkb.198.1467406153771;
	Fri, 01 Jul 2016 13:49:13 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id u1sm1859020qtu.43.2016.07.01.13.49.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jul 2016 13:49:12 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 13:49:09 -0700
Message-Id: <1467406149-16571-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] service: obey CFLAGS, LDFLAGS
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
X-List-Received-Date: Fri, 01 Jul 2016 20:49:13 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-skeleton/recipes-skeleton/service/service_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-skeleton/service/service_0.1.bb b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
index c5cd7a9..6416618 100644
--- a/meta-skeleton/recipes-skeleton/service/service_0.1.bb
+++ b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
@@ -9,7 +9,7 @@ SRC_URI = "file://skeleton \
 	   "
 
 do_compile () {
-	${CC} ${WORKDIR}/skeleton_test.c -o ${WORKDIR}/skeleton-test
+	${CC} ${CFLAGS} ${LDFLAGS} ${WORKDIR}/skeleton_test.c -o ${WORKDIR}/skeleton-test
 }
 
 do_install () {
-- 
2.8.0


