Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9A305744E4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 15:36:47 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id s13-v6so8096364wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 08:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=h1jk04CR3QdAbLUd16aH/KKQZNDnemItmD+MOX8EugU=;
	b=D7iGfDYDp3uDXrSdXV7Jj6srQ2EWBRS+qc8bGR+x/v7SO8ykUuTbg2zG75/IzCbe79
	9B44/S7GeG63HKmCo45sOtfg3TEyNXnjlhiJ96Hp4KVLZN+FK5Cd/7uRqkzczTg4/+ug
	+pZtpJF5kZorUKFJ9SobGxtqjLBxgn6LnHuRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=h1jk04CR3QdAbLUd16aH/KKQZNDnemItmD+MOX8EugU=;
	b=ITmkYKBKBVMbw2lW2bkIAGKyYbVPBnY3Ca7/TgjBh0LKKgYOtTA0weTe22fbVA2jf7
	WP/noPfMRz3lUeWZIR2U/B/OIQqL5ZDJS2u0ScU8GtHqLQP2QiNKpCFOay3slqbIpwUB
	4R1pICOvQ2KRr3zwD2d8tayozNTZsdrzu1Du6uxDaFUuu/czmNNuFQnjoInBlgAgC3Mp
	jmj5FK4DTF62uJkHVtulITk85LdrGsER2mmJOW6h+/WiXK6+wnWccroGjlaTOSRIhdH6
	izL0HoR81SiCVA++cYodYm2O7mE88JTbgpJCFWJHUpJGfPDF5ZJAl5kxfD23CHxiy6S4
	zWfQ==
X-Gm-Message-State: AOUpUlGaGEFB0SWJl2JylfWiBdcnj0gcC7TYycadm9gcHph20PY6HaV/
	2YVjxSDr8ynC+fgp0uTnXZ0KVit99pY=
X-Google-Smtp-Source: AAOMgpeN2+354yFCvWQv02CZgr7CistVVWSzUm0t7HB+5j/S8CoA+8CiYV3FclI9J0BCWMI92470SQ==
X-Received: by 2002:a1c:4405:: with SMTP id r5-v6mr7391603wma.4.1531669007984; 
	Sun, 15 Jul 2018 08:36:47 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z9-v6sm54571558wre.49.2018.07.15.08.36.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 08:36:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jul 2018 16:36:32 +0100
Message-Id: <20180715153641.21029-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
References: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 03/12] oqqa/selftest/lic_checksum: Avoid cache reparse
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
X-List-Received-Date: Sun, 15 Jul 2018 15:36:48 -0000

By having a consistent config for the test, a second reparse is avoided
and the test runs slightly faster.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/lic_checksum.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/lic_checksum.py b/meta/lib/oeqa/selftest/cases/lic_checksum.py
index 37407157c1e..f992b3736e4 100644
--- a/meta/lib/oeqa/selftest/cases/lic_checksum.py
+++ b/meta/lib/oeqa/selftest/cases/lic_checksum.py
@@ -19,6 +19,8 @@ class LicenseTests(OESelftestTestCase):
         os.close(lic_file)
         self.track_for_cleanup(lic_path)
 
+        self.write_config("INHERIT_remove = \"report-error\"")
+
         self.write_recipeinc('emptytest', """
 INHIBIT_DEFAULT_DEPS = "1"
 LIC_FILES_CHKSUM = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
@@ -29,7 +31,6 @@ SRC_URI = "file://%s;md5=d41d8cd98f00b204e9800998ecf8427e"
         with open(lic_path, "w") as f:
             f.write("data")
 
-        self.write_config("INHERIT_remove = \"report-error\"")
         result = bitbake(bitbake_cmd, ignore_status=True)
         if error_msg not in result.output:
             raise AssertionError(result.output)
-- 
2.17.1


