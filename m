Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.4792.1594242489705940062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=JXhPeB0S;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=z9mr=at=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B2BjM2FfMzhF
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 23:08:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594242487;
	bh=250IHcFwipRK3P4aVHra4KwxlrxudRzL9Z0QandQKCA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JXhPeB0Sj3kfPe1kJeaHp46EFKp5zKn0mSKYGMN5GtRGY8H08ovefGRU9vUx5qun5
	 4C1LrtnSvPRj1mpCEVF4wFJxrYb1efUrUM0Vqa/vVmlcEvXsrq5libwtd+30HhYNLA
	 bPUC+F1Nvqt3q4nO3OOIlfWmjNoz1IVkO0Iuqqnq+K3L7wbIYtrsSGxnxyZAZWbUYd
	 oP6b46uY5WWFcV+FnYIfzfMefgGq8SY7J8hJmt7YceVqDl6N5OSm2zWoyPlfCdIV/y
	 1IKleFJYtxIWbLXvHZogyNkBH4tDNR86LmOlpj/h3Zu7Rf66xwslwWyAW18V5eRq+/
	 a3ObWKnHDDbyMi7ovLIE8Jc/tCfnlv1Rzc4aRzeoyGjzQmumKohWVMr5UJA6kklQVd
	 y9zDP1OYmrNuUXKDzPGJFMGHP54casBZDIlE8v3NO0H/aZ1RzXV4Rn7pzuzhURZ8u/
	 9ya6g097k9/LETZjdU/w5sNJ6nQY7KGhaxxydmNZzs9EQWupPe1/grPapHbzRR4qJY
	 XCzmu0mCqW6oQhu563CBbc09SHu1xSmcZHxvE+mXV4OBENZzWFXbkou1K2wWdh/fXj
	 FPKAdrGMFIDQEpGzN6hgrV1n+PCCHHZsaeXQabkUUHh2U2qKTj8LB0zRxPRBGALNgM
	 gJ9qo1ZUVfhXoY/4f2wkxOEE=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH 10/19] vim: _FORTIFY_SOURCE=2 be gone
Date: Thu,  9 Jul 2020 00:07:52 +0300
Message-Id: <20200708210801.5553-10-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708210801.5553-1-bunk@stusta.de>
References: <20200708210801.5553-1-bunk@stusta.de>

From: Joe Slater <joe.slater@windriver.com>

vim will abort in many places with this setting.  Replace
it with the benign _FORTIFY_SOURCE=1.

(From OE-Core rev: d9de155f6452f916edd3131addd0c2eebaf4d639)

Signed-off-by: Joe Slater <joe.slater@windriver.com>
(cherry picked from commit 18129cbaeddb3278efe9963718556e3765f06c1e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/vim/vim_8.1.1518.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/vim/vim_8.1.1518.bb b/meta/recipes-support/vim/vim_8.1.1518.bb
index 60946a181f..709b6ddb55 100644
--- a/meta/recipes-support/vim/vim_8.1.1518.bb
+++ b/meta/recipes-support/vim/vim_8.1.1518.bb
@@ -8,3 +8,8 @@ BBCLASSEXTEND = "native"
 ALTERNATIVE_${PN}_append = " xxd"
 ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
 ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
+
+# We override the default in security_flags.inc because vim (not vim-tiny!) will abort
+# in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
+#
+lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"
-- 
2.17.1

