Return-Path: <freesilicon@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6495577B38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 07:38:54 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id l43so42511534wre.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 00:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AbdnwPpfuqsPuWDfnYqhG/gv01TjfGTL171IRYE+OXs=;
	b=vYV7eYWJuL66jVJOpsd2LV+mtrGKixIELx7xyg7h7k0xSZxZJWPJ++5CUweInD1iZz
	s1rzNb+W+uVUrvOCWpiGBeJevECJeLApF+A8Z6mo4cfh62x7vZAgOmijaDTG3R+IAcxB
	6Ehu6WR2PBPwSAqjNe/YU58UulP2S6+NTL1uxa/6nt8AIcNXpQfpLCaw1lFCA1xlnujn
	4imOlQu2LDOyTsqoW53XjSp8W1MKEfpzbZmqpetBBH7FnPQO1n4SkwDUJcPy7lwsIv80
	9Kh/xR58iwDP1Hd4r94sDD0bl0lKZr6RqxsKyKLTXx/7TqbIHR4H0d85ZILgy17whw/C
	/7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AbdnwPpfuqsPuWDfnYqhG/gv01TjfGTL171IRYE+OXs=;
	b=XF+3+ypldcdlMGaoVvNs59V6fvk28UmHk03/s0ygjasQIKzp/LO49J8v8ZnNe1Hko7
	Gy4Z6Nhdk05/d91eqNrsyIGXWeVT7sIM0DheB94okwB5pr5J6OvaPR1RjOzaz9XxQYv0
	+wScNJHjNfwWqn8yazcZx2QVugPz2OpNus+2esYPQXSw4F6x21JonZ6grmHuj2f4P5Fy
	3Yq5DfTvABQPjP0c2m8YPuaPSgM1lmotTpE5Sj9Crf9ujA02asE5wEeDiHAvC0/yMEg9
	ggoEdMuBiTF3cVd6RVIQnb/OSawncXHA3d02HwGgtt5PQEar4o1Ge+CdoaBoj9MQOucO
	ZVRg==
X-Gm-Message-State: AFeK/H2j6ZqZKk3KciTB0LlRbIHlf1qCKOKBpHM7MXjgycoXCyMakbjU5V4z5vJ+Q2bgDw==
X-Received: by 10.28.150.194 with SMTP id y185mr8014987wmd.92.1490600334978;
	Mon, 27 Mar 2017 00:38:54 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id 35sm13687727wrn.9.2017.03.27.00.38.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Mar 2017 00:38:54 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 09:37:47 +0200
Message-Id: <20170327073747.22770-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] ifupdown: Fix initscript
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
X-List-Received-Date: Mon, 27 Mar 2017 07:38:54 -0000

ifupdown does not provide an initscript so this recipe should not
inherit update-rc.d class. Instead, we rely on init-ifupdown recipe to
startup networking.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/recipes-core/ifupdown/ifupdown_0.8.16.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
index eb8426cb97..5654528ae8 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
@@ -16,7 +16,7 @@ SRCREV = "11b9f99f7ecc7052497e6786156cfed531f11823"
 S = "${WORKDIR}/git"
 
 
-inherit update-rc.d update-alternatives
+inherit update-alternatives
 
 do_compile () {
 	chmod a+rx *.pl *.sh
@@ -44,6 +44,3 @@ ALTERNATIVE_${PN} = "ifup ifdown"
 
 ALTERNATIVE_LINK_NAME[ifup] = "${base_sbindir}/ifup"
 ALTERNATIVE_LINK_NAME[ifdown] = "${base_sbindir}/ifdown"
-
-INITSCRIPT_NAME = "ifup"
-INITSCRIPT_PARAMS = "start 39 S . stop 39 0 6 1 ."
-- 
2.12.0


