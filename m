Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id ED34579029
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 17:32:06 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q8-v6so13033074wmq.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 10:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=N55vn2Kl4RTKwyGh14kIqNVhvLtkJZV7Fz0ZFxE/vrc=;
	b=aiZiBlrBn9adCFNq857dp2qIwKr65oloFVrTiSrevt56Le8GKwENDLYUHm/psMoqOb
	jxF0oIgdw4kFJe9tgFQi+dgRf7ou1+HuHfpHOAW0JmtayovDmjETeIcAQDgqO+Rup7T8
	fb8R52I1BEpcSwz6tBz46pnYo6gc5Hqb7t6JM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=N55vn2Kl4RTKwyGh14kIqNVhvLtkJZV7Fz0ZFxE/vrc=;
	b=LGKdcVA3wKPgD3CzDwLsZ2YQ4I4GuWo+X3BfAIUo9RNkwMvQDgbzzLDZHYBY8VlUFa
	HvgvHR3TchhZ2dzLj8lTy35i1V/iv+0wh9cQJu34I4Pv12m4oepP5oPBm9+RTJshS0an
	VrI9zagBYFAEbddfoOzPu83CExmTcVTQTgY9MSQ8zM4BDKti06vXmYYC7uH7SiKRoj4Q
	QdOm+0eazTrMLMIpBI9uUuvuN4EJoYWbv8VSUsDBCf25rZos2Dzk/xFBUDovzmjddY54
	lSrDA4GLDr//JPrm5vhAh0RFRpeTfvLpXELHTvVrudvR3vAQDKGxItiC2djJVXG043ti
	U+hw==
X-Gm-Message-State: AOUpUlEjZ11C06vTGg+PZ9sCC9UKri5npacjDQKZ5Se9hXDDNG3MfRtE
	eW7W+FS9F3h2KyjdbFrOwSE5dLXHpDQ=
X-Google-Smtp-Source: AA+uWPwN4QATbBPG0056IjYGuF/pw3++HVVonHkGCKbEItCXVokc8H4NcYdla7sYaJ27AvvP6agsRQ==
X-Received: by 2002:a1c:a401:: with SMTP id
	n1-v6mr12167291wme.125.1534267927220; 
	Tue, 14 Aug 2018 10:32:07 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t70-v6sm14519462wmt.30.2018.08.14.10.32.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 10:32:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 18:31:59 +0100
Message-Id: <20180814173201.6723-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180814173201.6723-1-richard.purdie@linuxfoundation.org>
References: <20180814173201.6723-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/6] selftest: Replace bitbake -p with bitbake -e
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
X-List-Received-Date: Tue, 14 Aug 2018 17:32:07 -0000

Parsing all the recipes is annoying when trying to re-execute oe-selftest
and also unnecessary as its really just a sanity check. When the tests were
originally being developed the guard was useful but less so now.

Replace it with bitbake -e which is fast and checks the basic configuration
is valid.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/context.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 3a70f9e77b0..c78947e200b 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -201,8 +201,8 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
 
         _add_layer_libs()
 
-        self.tc.logger.info("Running bitbake -p")
-        runCmd("bitbake -p")
+        self.tc.logger.info("Running bitbake -e to test the configuration is valid/parsable")
+        runCmd("bitbake -e")
 
     def _internal_run(self, logger, args):
         self.module_paths = self._get_cases_paths(
-- 
2.17.1


