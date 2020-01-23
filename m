Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id CBB427FE04
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 17:34:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b6so4092627wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 09:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2uV9ykLOTVHLYD8NbsP/Ox8JhtGiPSi+iTOcd4qbxjU=;
	b=HiOk2GVyh9UMCTOErZarCdWaEVzx46YAylHjVtitcQtHtLPgDxVWpkwvTuI5EdAytD
	yYIUzZCP8QJHvw9+lnO1wSXGssO3RdAonRa7bgxxvWarYYPY5pcKgDK5OYydYcJ8T/vA
	LacCdiHNXI2YTP6wR185FBfD/b5u1KkpIHzzZi/ziCXxf6Uk1LoGuZQpZ8FllmvBIFoQ
	N3Qv8PKi5oAZd1U3eMp+ln6LzCbRfPuACPjuQMzm//s3ktaC+VWOd/I80+5D4MTySiJ3
	u868BcFVWnAHpXX0rQorDJa0kIyZViX+30YiKpxYQ8HXAwdItSKpTsByO330OHW3hcwv
	SzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2uV9ykLOTVHLYD8NbsP/Ox8JhtGiPSi+iTOcd4qbxjU=;
	b=GsQ0zA7vXh1NPbk7eLxa04mPKNEbfhUTRFjffWQzxFsIIkJIvgmoRQFO8uJ1qZIJKX
	LALWXH+offc24SK3RsB6cHp1ekJggBheBw2fjftl9ir6y9zGN1KVC/JudpokdEGxgDS2
	g7U+HCWl7UTraq0/DYBKR20GUFaZ96CSZscPobjx0R/A1YyHkA9GAUTu1Cthg9lhTuCU
	F3g/ZkAfGJBbshPP7Ro2FgFo2k8Jo2yNp/CLJDgQwLmEn6e0rIFsDC3l/Kjmnkx4WAGc
	Mlxne/K8QOD8+ALzeiCjHKSzMLDUZ+gBUKRAkGmn3kE7ltJmpqQo1CGH4bnK/KMeww8Z
	Nu7Q==
X-Gm-Message-State: APjAAAUDWBQKKJAsA8kcYaKKo2FZs8QvjgWP5REe8e9By/T2MeHy9M9l
	PRcyAZU+Qtj0oSPIO0Vy0OkZxXda
X-Google-Smtp-Source: APXvYqzH7kzulxKFJy6+tPCzDNUvphwK9rbcy6HS2IJsduQ4bsGmUB5oQ76gH26KLPgw6QkRVUWAsA==
X-Received: by 2002:a5d:50ce:: with SMTP id f14mr19759646wrt.254.1579800863232;
	Thu, 23 Jan 2020 09:34:23 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	e18sm3774439wrr.95.2020.01.23.09.34.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 09:34:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 18:34:15 +0100
Message-Id: <20200123173416.112832-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123173416.112832-1-alex.kanavin@gmail.com>
References: <20200123173416.112832-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/5] mdadm: correctly set up testing location for ptests
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
X-List-Received-Date: Thu, 23 Jan 2020 17:34:23 -0000

1. Do not clutter /, create a special-purpose dir
2. Clean up the dir after tests are done (if this is not
performed, disk will overflow later in ptesting).
3. Fix up more locations in ptests to use the dir.

Upstream default /var/tmp is not suitable as it is not
big enough (mdadm needs about 500 Mb)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/mdadm/files/run-ptest | 3 +++
 meta/recipes-extended/mdadm/mdadm_4.1.bb    | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/files/run-ptest b/meta/recipes-extended/mdadm/files/run-ptest
index e4a9c2b08b9..7959c055ad5 100644
--- a/meta/recipes-extended/mdadm/files/run-ptest
+++ b/meta/recipes-extended/mdadm/files/run-ptest
@@ -1,4 +1,7 @@
 #!/bin/sh
 
+mkdir -p /mdadm-testing-dir
 # make the test continue to execute even one fail
 ./test --keep-going
+
+rm -rf /mdadm-testing-dir/*
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 64f519e7502..40c5273e005 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -75,7 +75,8 @@ do_compile_ptest() {
 do_install_ptest() {
 	cp -R --no-dereference --preserve=mode,links -v ${S}/tests ${D}${PTEST_PATH}/tests
 	cp ${S}/test ${D}${PTEST_PATH}
-	sed -e 's!sleep 0.*!sleep 1!g; s!/var/tmp!/!g' -i ${D}${PTEST_PATH}/test
+	sed -e 's!sleep 0.*!sleep 1!g; s!/var/tmp!/mdadm-testing-dir!g' -i ${D}${PTEST_PATH}/test
+	sed -e 's!/var/tmp!/mdadm-testing-dir!g' -i ${D}${PTEST_PATH}/tests/*
         sed -i -e '/echo -ne "$_script... "/d' \
                -e 's/echo "succeeded"/echo -e "PASS: $_script"/g' \
                -e '/save_log fail/N; /_fail=1/i\\t\t\techo -ne "FAIL: $_script"' \
-- 
2.17.1


