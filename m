Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id BB1DB6C3B1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 11:01:54 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b9so2370339wrs.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2019 04:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UKm0eOXY0XzA5fQqJdld1bqIl6sQwKb5JzaoQSDeSNU=;
	b=lFUBbnap9djOzexAXG8zy9kYE4RpDxeYdH/wJSN3i+zens3tHLTZHZoGbJ9SghWU+a
	JOvzbyctG2R9d8jLgSbeVlVQoewuufZV94yy1OVko0YXIpsYLqntIXqKldPwfKeK3R3L
	yE2MiZhy62XI3qu9bnCkWH/AZYgmNBfXWZs2vQ0jO5f2qDUh6ayqDhwSUAeR0jmoVflz
	V2soYu4KCrNHNMuyis1qDF8osH2DITeiBnQQBQ9KMrxIslxvs/IoBhpkCfdFp4/lwjqR
	B9yWu0eraKVnfH4bxyiponITYSLCoJTdaaa1hCuiEzRfELkmIENbjVUgOdGe89G0VIuz
	sYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UKm0eOXY0XzA5fQqJdld1bqIl6sQwKb5JzaoQSDeSNU=;
	b=fPAMpW7v5zv2HY4Ty5RYOJrYAuFX47d4YuseExUdrnmWwSzcC+lnsq+12uUTuHWyrk
	ihdTCviyytI70mXQjeX959tC9uDWti/wcNdUXg+P12gp3/c34lij5SaIsQi7gXo/NViF
	gFdlTPgJdO7YhVXGl3tjKypMddoVJeg8PlH3jvtznPqjcGVcEiBEE6xBm+CJm0RuUQa+
	bsZNDCAxNzig7PrcK22E101lIp6wNbPlidEvViym60dLUzVjKRyQD1XbrbSQf4C+BV11
	HP0D03+BtbqPP1Zk6vC4CUKVrvSvZ+IiE48I07TP+SzZdsi3zVrLzfMdACfii2VzQwF4
	p0ZQ==
X-Gm-Message-State: APjAAAXOJs3QiCuhVi6zx7pT1vAFNPDZDWasJyg1+KorvtVYIW0wyLLj
	93xVIJ4zYmgSNTAdtP1htMxWfJhhulM=
X-Google-Smtp-Source: APXvYqz6kMRI9QCWSFmv948qnKpre8YHhzATP+sFI15NtGPHo2vX/s2e0LH4HxoQU0kML19hdpmiEA==
X-Received: by 2002:adf:f50a:: with SMTP id q10mr2279520wro.157.1570618915147; 
	Wed, 09 Oct 2019 04:01:55 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	w17sm1660777wmi.30.2019.10.09.04.01.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 04:01:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Oct 2019 12:01:51 +0100
Message-Id: <20191009110151.25071-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/selftest/imagefeatures: improve test_hypervisor_fmts
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
X-List-Received-Date: Wed, 09 Oct 2019 11:01:55 -0000
Content-Transfer-Encoding: 8bit

If this test fails then the output doesn't help in any meaningful way, so
improve the test to output the unparsable JSON and display unexpected output.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 8213d63e375..cf2a42aab5c 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -161,8 +161,12 @@ class ImageFeatures(OESelftestTestCase):
             sysroot = get_bb_var('STAGING_DIR_NATIVE', 'core-image-minimal')
             result = runCmd('qemu-img info --output json %s' % image_path,
                             native_sysroot=sysroot)
-            self.assertTrue(json.loads(result.output).get('format') == itype,
-                            msg="Could not parse '%s'" % result.output)
+            try:
+                data = json.loads(result.output)
+                self.assertEqual(data.get('format'), itype,
+                                 msg="Unexpected format in '%s'" % (result.output))
+            except json.decoder.JSONDecodeError:
+                self.fail("Could not parse '%ss'" % result.output)
 
     def test_long_chain_conversion(self):
         """
-- 
2.20.1


