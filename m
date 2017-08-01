Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2710978275
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 13:55:45 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 72so2598687pfl.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 06:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=G9uL0VIL5lA73Xc6xYTkXyqp8uV1m5qim/IDiq6ILUo=;
	b=pFlUwocbJ0z8r7sMHintY8MdcSFTjs7u3cvpx2OjIAiPG1uGin8l/JOCAGDNMiBstc
	AQGUp5NCxL4Y7i6+A6AEBR98+IEdiMVH81LlSfolzTfpM0TQNQ+R39xKj/EzZuG0kkYV
	FT+LOKYq3uL7RkKr/4MNQUo+TKGd6ojMs2M2TvAUhUPgYxTm5W4AMlRRNw5PhransxX2
	zqRCfW2SDUBVikRuVn59aZGzsY34MMog0IXCh8CXalYtcIXAPjML9+GNV8guyYAQYNDp
	fkysCH+lEh1UQbhOhs3/fXCqqAbwhc5s65ijL/GxpkY0a3aI+U6ZvaexAr5YtVG3N019
	HWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G9uL0VIL5lA73Xc6xYTkXyqp8uV1m5qim/IDiq6ILUo=;
	b=WgxEoILo7up2AvIDihNcVioKUXXoFY9m69QHTU9sk3JQJRXq0Jq0eMTl/+xz63MMLx
	mhXaO7RFcrpwMTXns4AVgpKiHHcX0PCZRGhu2UxlaQ3kqbQWuEFUi2HDazZahkb29f+i
	o2J6JmSUApWDs0I7h9XuMXFS5mHAtiqZ6RDQoeNV82iRh4i6VvH8h5fcBHZj/iM6EOaS
	NmHGQg1TbPAdyeXW+aQxc9JNQ2hoA4nCWMeW4EqZ5OXS4h/aEW4dRD+lJ+tAEKmwCm7g
	C3+oRjr5JYb9Ube6Ijxnc8kJt8LV9nCdKTO/3cXsYBNvwGOknea0tIu53+BN8iqk1nHi
	A6xg==
X-Gm-Message-State: AIVw113+etdtnHksCyTGjwpicxnlmrSSOlcC0qSuQPHrf7vkkMwdpUyC
	73ZZ1dwR07saQAFD
X-Received: by 10.99.116.91 with SMTP id e27mr19819741pgn.269.1501595746973;
	Tue, 01 Aug 2017 06:55:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	o29sm57189986pfa.60.2017.08.01.06.55.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 06:55:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Aug 2017 06:55:27 -0700
Message-Id: <20170801135530.33531-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH 1/4] musl: Drop the protected symbol optimization at configure time
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
X-List-Received-Date: Tue, 01 Aug 2017 13:55:46 -0000

lld and gold can not handle it and treat it wrong

Fixes

[YOCTO #11689]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 53a8ba196a..93e3535c8d 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -36,6 +36,7 @@ CONFIGUREOPTS = " \
     --libdir=${libdir} \
     --includedir=${includedir} \
     --syslibdir=${base_libdir} \
+    --disable-visibility \
 "
 
 do_configure() {
-- 
2.13.3


