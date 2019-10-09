Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id A4B2A6C132
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 11:20:04 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b24so2123659wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2019 04:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UKm0eOXY0XzA5fQqJdld1bqIl6sQwKb5JzaoQSDeSNU=;
	b=pBc1y4J1fpCl/y7w4xmyIM0sHMITNlhgHh3TdaD57l74javQsHd5alEA/Y1Cfibax+
	+lfFnZ3bnc+yCdCc73Ipp9PSDM6B6KiDhzibZO4haGbD0SXGaWTlDwaOaoKk7kR4k//i
	UqzP/guxyNbjQZ0nLp0s9ml2Ij5Udxq6qcHAqa6fHd1rvTHKMvpWU7tdbDzHL/jahOtX
	JjsSovRIG+vRV5K6bfRnv/yF+ikewFKx0Y63cQ4uBcIpKLKG21MOiV3m6kvKjVL1IBXn
	DRkYxrrDku2bP2xrPpAnLtwFOhDu/T/IoEZxJ9cyxNk03nCpHhoPKiF+2KJrGrDwPRA0
	kvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UKm0eOXY0XzA5fQqJdld1bqIl6sQwKb5JzaoQSDeSNU=;
	b=gimO9OEIcvQGx/V6OiF0JYHNbj8gjz6pTiT13WzpN+j9sG1iNn8J3d8gzywxNonE8S
	3oM1YCjtV6WVrLs0pg0yAu/UTnNZYn8i1wNuQxDUDoKeoTpVdCOS4Ou/Odry3IxQd1xj
	0bZmTgCWKgEpEbR+zLu/4FIefTh7hqzygfnacp+Zhha1EM5sWSJ4h3sMxlXj0mp8i0G1
	Q7J0LRw76+l56CfCEOBtl0YRfocWeUklZibuN2cU0LGlhS8ZWad5Ws4u2vrD0lCxYfGD
	9LmZv+EQQaekCvlZv5yB9L+pjCj0fK0zEjrET7bKoP3jcSRUX/26Ph8uyWdu7rSuVUgL
	k/OQ==
X-Gm-Message-State: APjAAAU77Qdh/FMdJwT9RSdCqKdTZMYg7DuKCbL7wtjNHgycd9CMoub4
	RULdn4Zwt7ig44kA7QicX7q596fDK/0=
X-Google-Smtp-Source: APXvYqzGZWelHoK6/EyCCs6tuQnM61gWQgETUtHLsFG25ELOPktsDcg+4Yf7hp23lbEv9hdYgkdpOg==
X-Received: by 2002:a1c:f011:: with SMTP id a17mr2154709wmb.18.1570620005042; 
	Wed, 09 Oct 2019 04:20:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id n8sm2346579wma.7.2019.10.09.04.20.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 04:20:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Oct 2019 12:20:01 +0100
Message-Id: <20191009112001.27050-1-ross.burton@intel.com>
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
X-List-Received-Date: Wed, 09 Oct 2019 11:20:04 -0000
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


