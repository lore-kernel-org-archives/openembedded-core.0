Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1A6E278422
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Sep 2017 00:58:31 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id g65so1114224pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 17:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Lp2EIylXXpoRxhLMtBb9Ibjb7zsp4fuESVzRwixtzQ4=;
	b=rX8EzfF2owK1i7ZcTZn5WFufKWttnZrFRHAnwHaUG3PDrBFXQlDSfa02aWNu3R08D4
	h7NBuzJeXQPa1pLHfOE8n1ucU5qSbxPuR/RqIbMns+esPdciiaeEYnQLjmujDen1dVRe
	2O1t1nGz0U13qKCnP7cHSoNlxQ8y1TXkoy54ZP8e2ayY0e3SDaErOxB+nlyNo5PhRMzg
	dcFn+jDXyEMv3GyyYEUTlgfTyoBCKf/iOjVxjt1t2wBGrYbO6qoNW5C3v2FLq0YA7UZ/
	bclcYOG2HoLb3sKByNXQWeXuqMToqCjsL3dv3sL3f1LRzeTrm1esEMuNedTQKu8iBKnv
	9aUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Lp2EIylXXpoRxhLMtBb9Ibjb7zsp4fuESVzRwixtzQ4=;
	b=TAfVEXQbB7UFcDauxqRTZK2p4pL0niQyAK+TN1zxWHlvHVtpgtGv2nX0wLiSXNKKZk
	DkbmQuANcyaHPWRyS88vcpWypWiMyq9gTsDCqjPj/oIjNWAtvqVwKCzkwHSeu118eme/
	ZbxMnEJjH1qewMVJaQfN4bOqxtR3C1WvaxUAySbPfG5VhcLhYdYo20mcivLpXX2nRGje
	4rlVenLvVbSmGz3Z5ct49ZAc/Z6EwY+qzdUR7cNTN6nfsc6NXX1nKVqlJuIMWDf4vC9c
	qYDuyu0g7e9oujQeVHkVKSNCzwHlBeNKfXqg/gRSCr14u9v3ZOu43RkB7pDwnkrSOWyv
	7HZQ==
X-Gm-Message-State: AHPjjUiQEsghK781Ldyr6SGDARgiTRyHYdK84X6T/ZGFBpq/j+0qSzdY
	necgLtiVaw/a3hcE3LYIs2vCkg==
X-Google-Smtp-Source: AOwi7QDC0ZNLmQ4CFB6DqFKspPxICbUquI0rSBtoaS2akHLMQ43oSO/C5sw9SOYeEaEuB0w7hsmOpQ==
X-Received: by 10.84.234.140 with SMTP id n12mr724193plk.209.1506128313128;
	Fri, 22 Sep 2017 17:58:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	b66sm1151521pfe.165.2017.09.22.17.58.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 17:58:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Sep 2017 17:58:20 -0700
Message-Id: <20170923005823.10278-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH 1/4] goarch.bbclass: fixups for Go mips32 support
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
X-List-Received-Date: Sat, 23 Sep 2017 00:58:32 -0000

From: Matt Madison <matt@madison.systems>

* Fix the regular expression in the mips test

* Flag as incompatible any mips32 tunes for n32 ABI
  or soft-float, as go does not support them.

* Replace mips32r2 tune with mips32r1. Go only supports
  mips32r1, which is a strict subset of r2.  Adjusting
  this tune is not ideal, but is hopefully a temporary
  measure until more complete mips32 ISA coverage
  arrives upstream.

[YOCTO #12108]

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/goarch.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 8b95c5fe94..9ed562d5ab 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -43,10 +43,14 @@ def go_map_arch(a, d):
         return 'mips64le'
     elif re.match('mips64*', a):
         return 'mips64'
-    elif re.match('mipsel*', a):
-        return 'mipsle'
-    elif re.match('mips*', a):
-        return 'mips'
+    elif re.match('mips.*', a):
+        tf = d.getVar('TUNE_FEATURES').split()
+        if 'fpu-hard' in tf and 'n32' not in tf:
+            if 'mips32r2' in tf:
+                newtf = [t for t in tf if t != 'mips32r2']
+                newtf.append('mips32')
+                d.setVar('TUNE_FEATURES', ' '.join(newtf))
+            return 'mips' if 'bigendian' in tf else 'mipsle'
     elif re.match('p(pc|owerpc)(64)', a):
         return 'ppc64'
     elif re.match('p(pc|owerpc)(64el)', a):
-- 
2.14.1


