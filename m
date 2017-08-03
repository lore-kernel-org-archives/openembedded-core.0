Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id CFBB7606CA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Aug 2017 08:39:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x64so1324033wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Aug 2017 01:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Y3AsNc79dvYOPzxDg2OT6lRqGBFpuZKSTqYgHZ6Pb+g=;
	b=Z/FXZnoEnZgVz9mo3dwk/KscaqGubeKrLkxLIhWb4kJDPtlfzDSNy4lGibymGNYF5H
	Z0EqeM9KDiwpjxzge47nVRm0d2iocVWo4uxtc8+kqdLE5IpZpajWYFMwlZc+9KypGwJj
	xkGh7s2L9S0OM1WXzS7L6MwXRAuP5Oat3P7UY+B0ZO0OJTwXtdyvBkJWxxQnpBBlP9Ri
	XkB9D9qS8cYJJKB9sYHMTr6qXMkBOyM7ddi4o/Kuo+YO0Ma81T663yvK+D2VN/CmLcTL
	BwyxYaB6r8QiR3OM5JG/3063uUIdQTyMjZaIkV7rAIVTEXNVilajvpd+xWRHNp1zF/b7
	uyHw==
X-Gm-Message-State: AIVw111d8QNvLQ9qU55pDKiYUokNTXDj0a2oJO7uKVyqwUlMTh7Cx5cY
	5K29GXgpb9ve3UwaPzw=
X-Received: by 10.80.178.37 with SMTP id o34mr1117110edd.201.1501749586208;
	Thu, 03 Aug 2017 01:39:46 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id a53sm753747eda.41.2017.08.03.01.39.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 01:39:44 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Aug 2017 09:39:43 +0100
Message-Id: <20170803083943.13991-1-git@andred.net>
X-Mailer: git-send-email 2.13.2
MIME-Version: 1.0
Subject: [PATCH] valgrind: enable on mips soft-float
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
X-List-Received-Date: Thu, 03 Aug 2017 08:39:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Valgrind support for mips soft-float hosts has been fixed
in the 3.12 [1] and 3.13 [2] releases, so let's start
building it on those, too.

[1] https://sourceware.org/git/?p=valgrind.git;a=commit;h=8f0070d31daea6f0ed18f8fe69498a67530bfcbb
[2] https://sourceware.org/git/?p=valgrind.git;a=commit;h=3172936d63da4b6257099bc05aee5793978269cb

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.13.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
index e1ff29a312..a5c49431a5 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
@@ -53,9 +53,7 @@ COMPATIBLE_HOST_armv6 = 'null'
 COMPATIBLE_HOST_linux-gnux32 = 'null'
 
 # Disable for some MIPS variants
-COMPATIBLE_HOST_mipsarcho32 = "${@bb.utils.contains("TARGET_FPU", "soft", "null", ".*-linux", d)}"
 COMPATIBLE_HOST_mipsarchn32 = 'null'
-COMPATIBLE_HOST_mipsarchn64 = "${@bb.utils.contains("TARGET_FPU", "soft", "null", ".*-linux", d)}"
 COMPATIBLE_HOST_mipsarchr6 = 'null'
 
 inherit autotools ptest
-- 
2.13.2


