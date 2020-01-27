Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5A61B7FD42
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 14:19:14 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d16so11487867wre.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 06:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2uV9ykLOTVHLYD8NbsP/Ox8JhtGiPSi+iTOcd4qbxjU=;
	b=R25qjkuQchn/GmLv0akobL4m+LSeI7xgB7JEGeZO7oVBQcvyS5K5jzhoc0mlSfPOqK
	gSskkWariBo7kmA9H9S0XwWLRh8pB3Xcb4HYYStE5BxbGTju65Xour14QdkuwKfMb2gG
	UYw47R+//LFRCKVrohrBvoi+lJe4GPomdaQZhR54HTlXFEhCfQxNKGZOwsY6Z+OsyriV
	npkH3fGGJq6cTkU4p1WaqzuSXn0j02gNGemPPCHp8CZoCAjJetliQkhbDhcXc/6hGec+
	yTRk4Zwg149qbqNeTitOsSGjaOWdFw9etfX4385WFhWYuxR31TquOGizTtE7aAbEw0xL
	uDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2uV9ykLOTVHLYD8NbsP/Ox8JhtGiPSi+iTOcd4qbxjU=;
	b=cielYNX9KkhnF1icgI0ba+56swC7P1W9qkV16N0RDTkXcjGG3u9JQn2/JwaINBdBlN
	pOyHqW2RjtktZ9Q24qyrXnBMn843JyGUSTrEq0O8JuVktI5igcZgEoU/IzMlbC0lbEP7
	AyAk3ht/X1mwtaK4Jm5HIBBhRAviUOebceZfgIuHSuy3tsavzDAQZiZ0+C7vb19Zek/z
	qDscIpA9qBUrtvN2BLJPt6fYyK126h3rB4AWCvj4JGvzpJIg3Nx8GQs/XrjzDfPEw55H
	B1G494GcBDrF0s/FofVfmLcTBBtpQHmLRGOWijUwyIFsKXxLZd7i2omyVOkYZ3jmGHI5
	UzJQ==
X-Gm-Message-State: APjAAAVe3GMmMbS8FP9OgZMjpNlbVwe05wQEJl39vAYBcj7CRhZDj3oy
	256nHJDU60Hv1STcHb/ZrRJ6bK/J
X-Google-Smtp-Source: APXvYqwIkny/bObACyLEdzJqqfdswItw+RdoiohMKw2EavG36S7pA11bl7CkbWfEVSw04DBppOiUTA==
X-Received: by 2002:a5d:4281:: with SMTP id k1mr21678952wrq.72.1580134754667; 
	Mon, 27 Jan 2020 06:19:14 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	n1sm20533930wrw.52.2020.01.27.06.19.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 06:19:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 15:19:02 +0100
Message-Id: <20200127141908.84922-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127141908.84922-1-alex.kanavin@gmail.com>
References: <20200127141908.84922-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/9] mdadm: correctly set up testing location for ptests
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
X-List-Received-Date: Mon, 27 Jan 2020 14:19:14 -0000

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


