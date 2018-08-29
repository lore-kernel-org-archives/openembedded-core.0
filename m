Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id ABC8E793BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 14:43:54 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id f4-v6so4136448edq.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 07:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0Y6oYAEl8Y3wEx5ZlZwhNKV+DWZWT/0Z2O9oQFpSHao=;
	b=fJU7BJLn9bR7tTNpfYczU4yEVenlvON1Cshnud2qhnhKmUZfKZB5ZgC5EfSA0Cx5Vr
	nXHxSsUnqULa/+kNs4ies0YDcMBQ98cVbyYpJaw13NeezU/Cl/VnT755zlZnnDccKx/F
	ZVI/hKDlPTeRcGnDOMBBjjs7nOhvIMITj5MK+8Nb63SbTC4ZXGQb8UC3quorNUSskN7h
	fS+890pxVeqAa2jwBda4zrHGhEGVUSeu9Lx7r2XNQAhh1ZCV9YYwbap2mRhDhnuqQHig
	LeY+33HKoXHpNSfByKdq4c8uyhub2Es4Qh8LexHIKOeNnw7ye7O3dFVFUZ5nix1hFvwe
	7Jlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0Y6oYAEl8Y3wEx5ZlZwhNKV+DWZWT/0Z2O9oQFpSHao=;
	b=QHJdIwNcSXieqQC2udlHM/oNCU4WX+asl8tx3INSiMLZkqFU/nBSP/Racr6cMHL2jI
	IcV5kCbXyd16WrS1wZZKEQh9+MwBq/Af3OzsJ++4btQFLdP/loXVl19NqAZJqfpNLY0y
	8OVEJRemuknnTNDQWpHPH0M9++gneJ30euX/ZEiiWC/JWOnSilcr0C9laJs/ZLS6tbRL
	w9nRGw51SqhxFgE7poISEqNGOHp7ml5qqZIj8N5SFSx1WDfbuQ0XvrOqUZ2VXhzTfUT4
	rUqEdKU0ob4uSo8jA0JQz0Z62HrxjbeGtLQfQeFAijNAHE5EkwxMEPVbfKgyDrpEZIgL
	9X7A==
X-Gm-Message-State: APzg51DMY30YOpGY3P93id4aSpHHrx1A9ldAP7h0Dc1ODBmb8w3sT+mc
	oRcVlbp2Z0TmSEUTtcpHkwVLJ9wK
X-Google-Smtp-Source: ANB0VdYMUswXjCb1qxMpqwQSnyUAoAo6NrqbuAcMLpGK+tO6q6vMTHdzi8mu3Hxxg/cnsw2I4yMv9Q==
X-Received: by 2002:a50:d512:: with SMTP id
	u18-v6mr2853870edi.291.1535553835039; 
	Wed, 29 Aug 2018 07:43:55 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	a19-v6sm3203217edd.69.2018.08.29.07.43.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Aug 2018 07:43:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 16:43:47 +0200
Message-Id: <1535553827-23904-1-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [RFC] openssl: do not tweak so names, use PRIVATE_LIBS instead
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
X-List-Received-Date: Wed, 29 Aug 2018 14:43:55 -0000

The tweaking was not sufficient to prevent package dependency issues,
but there is a standard mechanism to do exactly that kind of prevention
which I wasn't aware of.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
index 1917c33..3f4e19f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
@@ -149,14 +149,10 @@ do_install_append_class-nativesdk () {
 
 do_install_ptest () {
 	cp -r * ${D}${PTEST_PATH}
-
-	# Putting .so files in ptest package will mess up the dependencies of the main openssl package
-	# so we rename them to .so.ptest and patch the test accordingly
-	mv ${D}${PTEST_PATH}/libcrypto.so ${D}${PTEST_PATH}/libcrypto.so.ptest
-	mv ${D}${PTEST_PATH}/libssl.so ${D}${PTEST_PATH}/libssl.so.ptest
-	sed -i 's/$target{shared_extension_simple}/".so.ptest"/' ${D}${PTEST_PATH}/test/recipes/90-test_shlibload.t
 }
 
+PRIVATE_LIBS_${PN}-ptest = "libcrypto.so.1.1 libssl.so.1.1"
+
 # Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
 # package RRECOMMENDS on this package. This will enable the configuration
 # file to be installed for both the openssl-bin package and the libcrypto
-- 
2.7.4


