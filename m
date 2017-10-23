Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6F8EF60557
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 08:09:06 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m72so7755662wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 01:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/amgPKimfaZgcZoGVODO7TGbi9dOHHIvq6iO6f53UMo=;
	b=eOzrjRfjcrxOSIPHj6coXI0rmwvXapP5LayAihlIO641ojJ752vcI/NizvAglff3fc
	kwze0oD9XGNxnbeNmBYmFUTQDXyv3FgyrcwUxZDAFoK+ZeKBylJSDdrEHV8nmzHrQzWM
	H6EDfgoqP+YO+qEpK7LSimSamKlCOidv8WZrSW0aBey5Idbx7AAxCo+OWBoPO1KPMHoP
	Hiw9j/6dqlLrGnYvAjmO+rXHEDGmoENsSh8utMACnu7mzLt78v2cNT9wks7w0U1pjYrX
	cehn9uNG9Y0Z2tKw19Cd3v9MT/A7a+KzMcTLd43UlOj+2XSYCezzgzMPxGgJnncvCiki
	qxoQ==
X-Gm-Message-State: AMCzsaW/sr0smsJlLNEpFuRXuRlZwsfPccLz0zSgvhnj61zcPo9CMiXi
	apq2wllFtwRm2692XjJ0izi9r72h
X-Google-Smtp-Source: ABhQp+QFq46fZRKcDICbaEHE0DtkMUhNTiJ4wK61aj0XQwzWbwafmY/qKrH0nu/EX/htu1RLhio2JA==
X-Received: by 10.80.136.49 with SMTP id b46mr10993336edb.238.1508746146856;
	Mon, 23 Oct 2017 01:09:06 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	f27sm5489702edj.82.2017.10.23.01.09.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Oct 2017 01:09:06 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Oct 2017 09:09:05 +0100
Message-Id: <20171023080905.18242-1-git@andred.net>
X-Mailer: git-send-email 2.15.0.rc1
MIME-Version: 1.0
Subject: [pyro][PATCH] valgrind: enable on mips soft-float
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
X-List-Received-Date: Mon, 23 Oct 2017 08:09:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Valgrind support for mips soft-float hosts has been fixed
in the 3.12 [1] and 3.13 [2] releases, so let's start
building it on those, too.

[1] https://sourceware.org/git/?p=valgrind.git;a=commit;h=8f0070d31daea6f0ed18f8fe69498a67530bfcbb
[2] https://sourceware.org/git/?p=valgrind.git;a=commit;h=3172936d63da4b6257099bc05aee5793978269cb

Signed-off-by: André Draszik <adraszik@tycoint.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>

(cherry picked from commit 82dbad6aa1390668aa86d28c8a3125b68d6072fa)
Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
index 62a96354cd..4f8cd3f52e 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
@@ -41,9 +41,7 @@ COMPATIBLE_HOST_armv6 = 'null'
 COMPATIBLE_HOST_linux-gnux32 = 'null'
 
 # Disable for some MIPS variants
-COMPATIBLE_HOST_mipsarcho32 = "${@bb.utils.contains("TARGET_FPU", "soft", "null", ".*-linux", d)}"
 COMPATIBLE_HOST_mipsarchn32 = 'null'
-COMPATIBLE_HOST_mipsarchn64 = "${@bb.utils.contains("TARGET_FPU", "soft", "null", ".*-linux", d)}"
 COMPATIBLE_HOST_mipsarchr6 = 'null'
 
 inherit autotools ptest
-- 
2.15.0.rc1


