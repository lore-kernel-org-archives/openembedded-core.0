Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2D574B5D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 10:53:17 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id j5-v6so3660050wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 03:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=XgoD9p9N6QZOevU95K9lHopAAOjFwcOAIydLBDstRhE=;
	b=AzPueOyyDA+hevGXaKTOv5D9xJRBspRPU+Q2rQ+w/JdWL9drzo2Tx8qJxEK4bZr02+
	V/MKdehtvYzD0mpJPMM3Gtbu0VR8w7WKd/HDX83h4SJu122TLI7qYMVzhoo2UCFsxRhI
	XYbGOzuJ9hwpAJqgmsEn823NbK4AlIzx+GXhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XgoD9p9N6QZOevU95K9lHopAAOjFwcOAIydLBDstRhE=;
	b=NmkKCtCPiksNNWLLHzIvLFEyAVnB3rbFGOeBJON3iahrDLBhHU8oui8BQo+Kew3Cn5
	fQlxC+lff/erC3Gm0PruOUJWicqNgxC4J2oYn6O8bfN0lrZX+ax2zBeNdLWhaqoAZM0d
	fbA4vstUWAOrTV/+ZCPUnlqvlOlLN8DOsx1vopAB9WIG1eg2Nn0JXV7s6UXfBVpFaULE
	msII+gZYlGomzqz6Vt+ziWTgu0/ZdGFh8SsbS4Rr3qP+ddzEFeasgTneQUIk1osTgYxo
	gdCqzU/QubTwl3SSLj7EutOo8y+BNnMtQpVxqJxPKpS9elu6xbZyPa4Axx+cneCYLdcL
	8ZHw==
X-Gm-Message-State: AOUpUlGSjRyFWRUlOEReb4QD1yMPqQkzXSu5nTwfmUrFl6cKPQUGOT1D
	fLRi8NjgFfjFXhAUkuQTdj9pz2vqvuO+YA==
X-Google-Smtp-Source: AAOMgpdNxgPH8VMEQqnfM6J/M7Kf1uHhIBO6693+FyhtgFKUXlbzZxNaBr53kMLn5Nh5jnFX8vTC4A==
X-Received: by 2002:adf:e287:: with SMTP id
	v7-v6mr11863946wri.139.1532429598112; 
	Tue, 24 Jul 2018 03:53:18 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e10-v6sm2037488wmh.19.2018.07.24.03.53.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jul 2018 03:53:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2018 11:53:11 +0100
Message-Id: <20180724105316.2085-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/6] selftest/wic: Improve error message got test_fixed_size
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
X-List-Received-Date: Tue, 24 Jul 2018 10:53:17 -0000

Currently this can fail with a message like 127 != 0 which is unhelpful.

If we remove the ignore_status=False, the debugging from runCmd is much
more helpful printing status.output.

Also remove the now unneeded exit code check.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index ba4d3be7a86..6793efb62e9 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -695,9 +695,7 @@ class Wic2(WicTestCase):
 
         # verify partition size with wic
         res = runCmd("parted -m %s unit mib p 2>/dev/null" % wicimg,
-                     ignore_status=True,
                      native_sysroot=self.native_sysroot)
-        self.assertEqual(0, res.status)
 
         # parse parted output which looks like this:
         # BYT;\n
-- 
2.17.1


