Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 67F817F893
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 15:47:52 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id b17so19448054wmj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 07:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ANYP6ytlNicAz8Z5iht48mGQkNsTN0ubY4hlFoP4QtE=;
	b=SVsTKCoYrgp9pv7dxe+jStFX8TS9em+UbrQ9MK8vIYg5t5dlEaaMjOFecgSYHdJxKE
	MZPNZ2mNMqJ2/Ty6Iio8Co0bDtA17qIYRjWGDQLhwynt4AK9qQ3Y82BoiohwAeNWGqez
	HA7zz1x+otq/YxSi7wX+TDzviw305sh6FpGl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ANYP6ytlNicAz8Z5iht48mGQkNsTN0ubY4hlFoP4QtE=;
	b=bLn4eO09f+zrK0CglMBfGtcbGaT2M9hqSHSHvhhrpOnKuoGroQiBaO0g2OriCqiCFu
	4w4q11woRy4XZbWQS5CSe7Y7nsRkMz+x+S69g0xEcvdoKlo5YMB1VNXw2yOpOZ96J+6k
	BmRcXAO/HEcMtcLFhN9eoakNT560vv/6eyLO7bx/17rR/bxNalt7CNuyLPGEhW31EXEc
	Li20QRWop7/dC8adaZkzvYxP/x8mjwx27Ic/2llQ+PiY66Bo0LQhDOEMK/LrHj+KbbYe
	JS6XP9Ips2bY9kLy/UIZnuTOPsQ1wnGtLc018IGJyxak48dBtLJ6pYwoabJL99KSTRoe
	cJqg==
X-Gm-Message-State: APjAAAWbhvSi54AhQ0btqD0H0GPM96CVvLPL72wRTXlJuZKHkyajgP0R
	WVYgp3C5hCEdrUcd2W/FxcXBWTjZUYE=
X-Google-Smtp-Source: APXvYqy83ZMZIfMb4CC2Asu0uways5McFahECAd1z5rVOMeItmJ2RgImmLtVK/Jc+U+Y5Zc0aykGww==
X-Received: by 2002:a1c:ed16:: with SMTP id l22mr29530414wmh.151.1574092072798;
	Mon, 18 Nov 2019 07:47:52 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w13sm22893031wrm.8.2019.11.18.07.47.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 07:47:52 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 15:47:49 +0000
Message-Id: <20191118154750.5282-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] oeqa/devtool: Avoid unbound variable errors
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
X-List-Received-Date: Mon, 18 Nov 2019 15:47:52 -0000
Content-Transfer-Encoding: 8bit

inherits can be unset resulting in:

UnboundLocalError: local variable 'inherits' referenced before assignment

which can mask real errors. Avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 3a25da2033b..f4b303bd1c7 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -137,6 +137,7 @@ class DevtoolBase(OESelftestTestCase):
         with open(recipefile, 'r') as f:
             invar = None
             invalue = None
+            inherits = set()
             for line in f:
                 var = None
                 if invar:
@@ -158,7 +159,7 @@ class DevtoolBase(OESelftestTestCase):
                         invar = var
                         continue
                 elif line.startswith('inherit '):
-                    inherits = line.split()[1:]
+                    inherits.update(line.split()[1:])
 
                 if var and var in checkvars:
                     needvalue = checkvars.pop(var)
-- 
2.20.1


