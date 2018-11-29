Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A899D6D577
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 12:17:47 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j10so1677622wru.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 04:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=uFPTCUVhcdS6PHOWHC+fkKwSe8XLpIHlx+cARqkhMOM=;
	b=UVlDhsdEgx1g2voXw2U7+tunLlODELpiuwnYPAou/w1PV50eMy+s1soXpF9LuTQL3w
	Yq2SlmkwUNnT9cmZSKMQeRaii47D+qIrFKK+EiJuxXa6xayiZ69aN4QX64QOauheC/ry
	RGEsK+uZb1onWHvFiypBgHsPRiTDXbKC1KKUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uFPTCUVhcdS6PHOWHC+fkKwSe8XLpIHlx+cARqkhMOM=;
	b=rpXltD6bQ4OpmMshBQLEqsUon2zFjoCyA78ekWVcw0lO+NOKCMUaEJDVo3q/PfS+op
	R/fwTO39/bz1ZA+iMjUTGk3oxuNW5DdkYRc6Gq/gjrIr0TKJ/cm1t/NgQf2dmZEyx2kh
	RVyHZ1T3FQVzUF30GaZsevGT55/anLUGhNJwNA8UN0zMiJalbjJFeuGdVeRkuBqeMZ6T
	YDcsTGlqoWAQHcpRgxNtQeMzySkgxRBkHaKxqg5ry16kAx0AB1yNk9PvAQvM1RJrqL32
	Z7udPAKJX1UCGFxoTti10Fq39wD2ikCh45WVfDkeTp/iZ418E4h0fli4f11G9tGtW5fm
	IELw==
X-Gm-Message-State: AA+aEWYIMRL98okOxE6Kq/fwcZCHkeECEyBKv8cg6o/A/PQSpAER1QRp
	40cPqOQ+6fiv0JEpQHJHGMOsvuk4cp4=
X-Google-Smtp-Source: AFSGD/VOIJWSiiqIpLbq4770GNqYVgQIldU1XuKJ7WZEIaarr7GKqL2LOSYIqB4i/SFFpF5Lqjtmkw==
X-Received: by 2002:a5d:6aca:: with SMTP id u10mr1180798wrw.310.1543493868131; 
	Thu, 29 Nov 2018 04:17:48 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 5sm2717625wmw.8.2018.11.29.04.17.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Nov 2018 04:17:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 12:17:42 +0000
Message-Id: <20181129121744.10052-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181129121744.10052-1-richard.purdie@linuxfoundation.org>
References: <20181129121744.10052-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/5] oeqa/selftest/buildoptions: Ensure diskmon tests run consistently
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
X-List-Received-Date: Thu, 29 Nov 2018 12:17:48 -0000
Content-Transfer-Encoding: 8bit

Heartbeat events default to once a second and we need to ensure we have
enough time in the task to see them.

Add a nostamp delay task 5s long so we can have a consistently timed
task which doesn't need cleanup or have unneeded dependencies. This
ensures we should deterministically see the disk moinitor events
regardless of the state of the build. This is done in a way which
doesn't corrupt build state or need cleanup and is efficient.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/recipes-test/delay/delay.bb    | 12 ++++++++++++
 meta/lib/oeqa/selftest/cases/buildoptions.py |  6 +++---
 2 files changed, 15 insertions(+), 3 deletions(-)
 create mode 100644 meta-selftest/recipes-test/delay/delay.bb

diff --git a/meta-selftest/recipes-test/delay/delay.bb b/meta-selftest/recipes-test/delay/delay.bb
new file mode 100644
index 00000000000..f92d3d99e28
--- /dev/null
+++ b/meta-selftest/recipes-test/delay/delay.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Recipe with a fixed delay task"
+DESCRIPTION = "Contains a delay task to be used to for testing."
+LICENSE = "MIT"
+
+INHIBIT_DEFAULT_DEPS = "1"
+EXCLUDE_FROM_WORLD = "1"
+
+do_delay() {
+	sleep 5
+}
+do_delay[nostamp] = "1"
+addtask delay
\ No newline at end of file
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index c3c90a0b0dc..f234bac0510 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -59,15 +59,15 @@ class DiskMonTest(OESelftestTestCase):
     @OETestID(277)
     def test_stoptask_behavior(self):
         self.write_config('BB_DISKMON_DIRS = "STOPTASKS,${TMPDIR},100000G,100K"')
-        res = bitbake("m4", ignore_status = True)
+        res = bitbake("delay -c delay", ignore_status = True)
         self.assertTrue('ERROR: No new tasks can be executed since the disk space monitor action is "STOPTASKS"!' in res.output, msg = "Tasks should have stopped. Disk monitor is set to STOPTASK: %s" % res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_config('BB_DISKMON_DIRS = "ABORT,${TMPDIR},100000G,100K"')
-        res = bitbake("m4", ignore_status = True)
+        res = bitbake("delay -c delay", ignore_status = True)
         self.assertTrue('ERROR: Immediately abort since the disk space monitor action is "ABORT"!' in res.output, "Tasks should have been aborted immediatelly. Disk monitor is set to ABORT: %s" % res.output)
         self.assertEqual(res.status, 1, msg = "bitbake reported exit code %s. It should have been 1. Bitbake output: %s" % (str(res.status), res.output))
         self.write_config('BB_DISKMON_DIRS = "WARN,${TMPDIR},100000G,100K"')
-        res = bitbake("m4")
+        res = bitbake("delay -c delay")
         self.assertTrue('WARNING: The free space' in res.output, msg = "A warning should have been displayed for disk monitor is set to WARN: %s" %res.output)
 
 class SanityOptionsTest(OESelftestTestCase):
-- 
2.19.1


