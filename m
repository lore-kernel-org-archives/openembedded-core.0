Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.4641.1594242489605184596
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=ABWpQ5A9;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=z9mr=at=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B2BjK627hz5k
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 23:08:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594242486;
	bh=qR5b7c+fPk/xmeIF8122Ty8LagEOY0FT/GsjsVV9rcc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ABWpQ5A9aMbumFh4Tar8zW3piRNus9Ud5mNl3t+ICtVvqhceSk/oOvppgE/jWINnF
	 pg8W8NbQzyhy3oH2hsyx3Aj956CnU99j8qw7cSWWz5Xl6t8WZHK2FIlwsUAJmIfS4t
	 DbGkliJFhnAE+nT7k9OFLde8fPJ8R5L+9nsXBcSSwyS2UuFAyTrGqIwKLdrItTYNa4
	 GNwTHjYiu91Wy3Bsyc9l4Ks4eV9H3Woi5AOJwwdbvbZw0uKsr/eKSCHiSKBdqkdp2V
	 QOlt4Qi5iQaZ5FoT3WiHAPnQtkugqhLMwJImo506kvRP/KvPiX+NwzJ2iArzsFGaSj
	 3PWe8h/JS0wLsbrCE6vdJs2DbnsJ/yeVw5GHpHZYFWF2oujkaZx5XCJ2evfJcCGsLf
	 X4Mb6s7OS5A+RuJO0M/lfw/6fnLNzPpXQZw0kkk/EZcTHHG/pcAKpdy6/1UO9/TEc7
	 3O+kErWgOfus1yt2u2i/Hq+ZSnA2E/QfglM1jxHz5HyXE+GVcSDURdVxCx6AX5kAbI
	 pPwKD6cCdEKlt5iVTbBM+z1pOUKImbMMLgwV5qZwd+LBumJJZf6iMg/+BdDtzM7efI
	 HvgIAZH8W+vqZ3rXps09RDOgJkoKD56lJcG+D2BqucxpioFO05TM0kDMdXqoA+BaMz
	 mmqnfhvjp02PWdAvIh7Xa6rk=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH 06/19] cve-check: Run it after do_fetch
Date: Thu,  9 Jul 2020 00:07:48 +0300
Message-Id: <20200708210801.5553-6-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708210801.5553-1-bunk@stusta.de>
References: <20200708210801.5553-1-bunk@stusta.de>

From: Khem Raj <raj.khem@gmail.com>

Certain recipes e.g. bash readline ( from meta-gplv2 ) download patches instead of having them in
metadata, this could fail cve_check

ERROR: readline-5.2-r9 do_cve_check: File Not found: qemuarm/build/../downloads/readline52-001

This patch ensures that download is done before running CVE scan, even
though these will be external patches and may not contain CVE tags as it
expects, but it will fix the run failures as seen above

(From OE-Core rev: dbf143d79476e54e8da93101fc16eaedeec88362)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e406fcb6c609a0d2456d7da0d2406d2d9fa52dd2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 2a530a0489..556ac6e67f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -65,7 +65,7 @@ python do_cve_check () {
 
 }
 
-addtask cve_check before do_build
+addtask cve_check before do_build after do_fetch
 do_cve_check[depends] = "cve-update-db-native:do_populate_cve_db"
 do_cve_check[nostamp] = "1"
 
-- 
2.17.1

