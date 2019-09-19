Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6E38D7FDAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 15:50:56 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p7so5181406wmp.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 08:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J7vifQ11wcYeFPmFebDntTNYFJWOtNe5fIrmE+VVLvE=;
	b=LC19H+PzyrKt+81e+N8oiEiwlzRdZ2vHeuijKkvBuo0aGmMmD/lHAtrc3QlMCQmGZC
	zWKYeGA105pgZctBdhWTOGViZHQWjGyH8Nx+BnYDWkD/7g1lQFxmIlgr4iZtQoYUW4N3
	GRqcJVNnHGHxczDvq7yEMbZiIqOpJo0HKGTRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J7vifQ11wcYeFPmFebDntTNYFJWOtNe5fIrmE+VVLvE=;
	b=dMqXK68OohH2QZnUd8Umd7ipU4l2YU885ZAwrO8QMWTCEaTEv+Ji2qLwSRnNZe/8bM
	SoXjRgCc4mc5DHKajxsUmNMlVwQVertlxZ178Qquw12eUfwVSrt9Zkn5qgvQakiXBsXP
	vWJxNP0Q9dBgW+rB5bS9Io71ysGuVadJzV2yG02aKLIBaIodXohu9QAAFbyBALB2H5W9
	7ovtHn3FTuQ9MT3EZVafJIJasiAL7rOWkEe679qfGiO3X/RPtQUZJN+BwvTaR4CSYgDb
	8kD1YycMZjEFPqo20PorzK2tHDRwm2c4i7p90+lwXoI9piK11uII5iI+S5IURmqUsZCR
	otRw==
X-Gm-Message-State: APjAAAUTuAe9skorpBcNBVqpWitTEtusKcxCWKCLcyJ89EoUtxTlwS2y
	YYRvLxKKsCRA7V66pGMTQt0xyzJd6bs=
X-Google-Smtp-Source: APXvYqxaYRY7ppTdOqFzu7kq8Owq9p+lSDFXeYDLlIdBPabtj1ulAXH2Cobuu85HoVLN8CB8q7n0Ug==
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr3351142wml.157.1568908256807; 
	Thu, 19 Sep 2019 08:50:56 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o22sm17379982wra.96.2019.09.19.08.50.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Sep 2019 08:50:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2019 16:50:55 +0100
Message-Id: <20190919155055.28655-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/concurrenttest: Use ionice to delete build directories
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
X-List-Received-Date: Thu, 19 Sep 2019 15:50:56 -0000
Content-Transfer-Encoding: 8bit

Autobuilder type infrastructure can benefit from deletion of certain files as
background IO due to the way Linux filesystem priority works.

We have problems where build directories as part of oe-selftest being
delete starves the running tasks of IO to the point builds take much
longer to compelte.

Having this option of running the deletion at "idle" helps a lot with
that. Use the new option added to bb.utils.prunedir().

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index fa6fa34b0e1..6293cf94ec5 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -216,7 +216,7 @@ def removebuilddir(d):
     while delay and os.path.exists(d + "/bitbake.lock"):
         time.sleep(1)
         delay = delay - 1
-    bb.utils.prunedir(d)
+    bb.utils.prunedir(d, ionice=True)
 
 def fork_for_tests(concurrency_num, suite):
     result = []
-- 
2.20.1


