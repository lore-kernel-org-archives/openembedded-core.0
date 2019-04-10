Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 299A37D93A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:26 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q1so2936851wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nkdpCtmMPSjNV1jnIsiL1XcAqkXeRm+aaYkAiBk2Iy0=;
	b=IZZfRQpk3MRI9nkQAwCMOpskSq88iSNERviI/gVHlumdnc9/mZ5MXAUq6l2C2cysHH
	mdHJjNL/2vakgQzNyFtnM7OO1gky2d66jj5Kv+SJzIXE8Ws+iJTEa8Dxetwv2m0x/vH/
	+y7IeknxXtTPg45QffdZe0BFo3TEJyYDHkDGm5e91gTeBr/1Mfm+DONv6xZ8eA71IMYY
	Z1JmFA2z8GIlXYsb38R0mxUQaKDIS0Wh2v8vTjqwHYW3PUAhxKJwfLdDssjwOL10WpGa
	xSxUvVJ3ZSZ64I13JfoF2hvHEZBXUbzV5Tj8PYzcAF6QKkUPuvfKklb4VnwVrWp+uxnE
	oAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nkdpCtmMPSjNV1jnIsiL1XcAqkXeRm+aaYkAiBk2Iy0=;
	b=Wesw8cz9vAiqaD/vdPfVG03LY/Uqxm0p4cdTpXB6uUASdLhhLqHPICyOwdgUj3zvIc
	13q6MtZjDDtoQWb0jeGIyBClmjkx4TZGL+JJIqRmrkiQn4LT8KZFjOYh7SxKFqqKJWVh
	V/m13/ax24ZkS66/Lj/DYCSHJ8lwmxXTzCqWdIwaTeR0iAYlYAK/nna+7l7zfPrxWbQP
	FsElcZ/jnfbtGex1o8ybg1PZLGdH1bnnxkXviKI1SjaNWblN7pUK3Xb+Fs8upbnx26ji
	NlMeGick91CbXGtNTy0hcHLJiQjsf3lY5jsJU8jDrl6ja/ePuzww4/WHZm5NufDmYzZI
	n84Q==
X-Gm-Message-State: APjAAAV9gkR5knz7iRdDUbPqXtw20z5x9u86uqnYyReycTUr+JepROKe
	0Degx9QsUZyy3rkTalIiuNspYLOZpgU=
X-Google-Smtp-Source: APXvYqxQVdwFVAwdrCpwgJRypZv/xQtB6gXklBWMA56qfnBrVH1xN+e+nMOnE/t54WHzoI/EGFMbgA==
X-Received: by 2002:adf:fe41:: with SMTP id m1mr27716749wrs.220.1554901946852; 
	Wed, 10 Apr 2019 06:12:26 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:39 +0530
Message-Id: <5ae49260180adc0070287db01c01a0820ce99ad3.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 20/33] pkgdata.py: avoid target-sdk-dummy-provides to mess things up
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:26 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Sometimes we meet the following failure for the test_lookup_recipe
test case.

  AssertionError: 'zlib\nbusybox is in the RPROVIDES of target-sdk-provid[32 chars]ummy' != 'zlib\nbusybox'
    zlib
  + busybox- busybox is in the RPROVIDES of target-sdk-provides-dummy:
  - target-sdk-provides-dummy

This is because target-sdk-provides-dummy rprovides busybox.

So clean things up to avoid failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/pkgdata.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index 0b4caf1..9911765 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -13,6 +13,7 @@ class OePkgdataUtilTests(OESelftestTestCase):
         super(OePkgdataUtilTests, cls).setUpClass()
         # Ensure we have the right data in pkgdata
         cls.logger.info('Running bitbake to generate pkgdata')
+        bitbake('target-sdk-provides-dummy -c clean')
         bitbake('busybox zlib m4')
 
     @OETestID(1203)
-- 
2.7.4


