Return-Path: <tim.blechmann@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id E0CC57E58B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2019 02:47:24 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id y91so28581512ede.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 19:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AXiKFxzkIL4W30Myb7FnADGSX7XqslPwfK121SqM44A=;
	b=EYOHCVCreh0WZeoXORW+4Dq2KRpv9jCDyWbMASAw3ro9kQanzgWuwrOJGah0sdAQ53
	NwfP9967nJN8KUGcleDA71D18rW1li/GzXt4nQ5uwx+KrmAUWUANfjbb+A6QsySZeNGU
	SpMcu+GGZWF9+XA9Dd30Fp71or2kIr5xYpgk2iXZrB8uTC6jSO4Lennqg6IWUkgEckHS
	1MMKUWVONKjDU2Fbf8vOTTiR41CklWXdB57PgxztedppdRwTWLi8T1RUeOD017D1G/QB
	KXTWdgEhTiftZd5G8aNbyrBuubn+aTuu40rF4szParaBjAGsR7metR/nI4wTacPoKVXd
	V9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AXiKFxzkIL4W30Myb7FnADGSX7XqslPwfK121SqM44A=;
	b=X/wVdWS2tv9Q5hwQbOpoAkndg6RhkgVobqxn0HNjIdCjIh2FdLU1FLWuk/B0ytrwLd
	25M4uWFvAzSSfBbiMbGLQNs0m9gvvzGhhxyX4EuNTVc0lqWj9+ZXwo8P73cjsh6cRA2e
	reUq5KvtRCg5A+cmAVXST8W/Ad/TdqgSG6aegAevIkcDUYo2/uzP5ZabH96ZgAyZnl2h
	YM+AYFwL+bMtgzA8nXyhylNGWxXU5qp8Eax/gVO3zWQnyVtXawUZ53gZyylyZH/rCMgN
	A8P0J1YaocFnF7GimZFvAhxZIY0iLd+DkK+dUf/hpRMTkqx8HjUW/ppdsc/zbE/A+3JO
	v1CQ==
X-Gm-Message-State: APjAAAVhL0aF2Q4nx7pvGiKH59AWRh2S6Cm3/9GHNs4CLjMRRBLVeolP
	Aeb6qht2DQAff7rggCxMRV4dfwnK8G8=
X-Google-Smtp-Source: APXvYqy9EKbIxhFcBHlyZZZRGZJRJFMeiao2AzcFOzb77b4w3m78VhKYuIHnMuTVDBTFVa3ZpukllA==
X-Received: by 2002:a50:852c:: with SMTP id 41mr38526587edr.201.1568429245132; 
	Fri, 13 Sep 2019 19:47:25 -0700 (PDT)
Received: from localhost.localdomain ([115.132.198.120])
	by smtp.gmail.com with ESMTPSA id y29sm5022779edd.7.2019.09.13.19.47.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Sep 2019 19:47:24 -0700 (PDT)
From: Tim Blechmann <tim.blechmann@gmail.com>
X-Google-Original-From: Tim Blechmann <tim@klingt.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Sep 2019 10:47:09 +0800
Message-Id: <20190914024709.94477-1-tim@klingt.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Tim Blechmann <tim.blechmann@gmail.com>, Tim Blechmann <tim@klingt.org>
Subject: [PATCH] icecc: blacklist pixman
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
X-List-Received-Date: Sat, 14 Sep 2019 02:47:25 -0000
Content-Transfer-Encoding: 8bit

From: Tim Blechmann <tim.blechmann@gmail.com>

pixman declares prng_state as `omp threadprivate`, causing linker errors:
prng_state: TLS reference mismatches non-TLS reference

Signed-off-by: Tim Blechmann <tim@klingt.org>
---
 meta/classes/icecc.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 1a4b4ab526..cb10317b3d 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -73,12 +73,15 @@ ICECC_ENV_DEBUG ??= ""
 #
 # libgcc-initial - fails with CPP sanity check error if host sysroot contains
 #                  cross gcc built for another target tune/variant
+# pixman - prng_state: TLS reference mismatches non-TLS reference, possibly due to
+#          pragma omp threadprivate(prng_state)
 # systemtap - _HelperSDT.c undefs macros and uses the identifiers in macros emitting
 #             inline assembly
 # target-sdk-provides-dummy - ${HOST_PREFIX} is empty which triggers the "NULL
 #                             prefix" error.
 ICECC_SYSTEM_PACKAGE_BL += "\
     libgcc-initial \
+    pixman \
     systemtap \
     target-sdk-provides-dummy \
     "
-- 
2.23.0


