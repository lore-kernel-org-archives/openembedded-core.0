Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 694736011A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 13:00:40 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id q13so22329084wre.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 06:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+li2hcEdCoLW2q1B8Occr9WYoXPn4/QrMYT/rqFt86o=;
	b=MCPZGP5aP0aUkuUcvwzWKx82sWKVbM7eUH3qv5fTmnxT65acmMsMqdcvex7oM+i1Jb
	0Bd0emHK77C6/fgM8x0R6kAK7MlT8p0QkooRTURDpb+KxFFDr5Dvuu3WFMarXX85S7+q
	YOFRap13Ic7MBgVAGWlwE31uEGwiu2lSLQfjtuEeJ+ralrg78ZXeLfilB899+tsx8UT8
	nb53BoHSUF6ZDQjE77hYvIhetMZC2zpOarK3B53zq9uRH0fnQcKYMed5DQ2xqK3u5StA
	1pL67AUOfLWgxRb8kiydZWM/Y1AtPpAthLIf079gSJEs2cjkKVTqGF7Dq5iWaxszG5CZ
	jn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+li2hcEdCoLW2q1B8Occr9WYoXPn4/QrMYT/rqFt86o=;
	b=frCFZG7ndc5o3Tw9dRfkskTeHSzvTj3VqNdtOsM+yi9I8l4EoZ+1fvbzNLSc9CiKPa
	ESvnq/e4QDsWmOsh3ulQ27lJVm+yx7vIAU5acxNoTyXjSYjJwFNZopKKYILz/zxyBSOD
	P5EeIT87wkRmq1WC8zguVCcE6mJkxz42jq1xWFakw4O1e6j/sga1AbMpggcyQqezCUzU
	yvqXWF8fBQGGUHqmaY2yWk/brP8rMC1+RfIO9NKIBQpRx6rU745UpL+RWYsv4QYExBQ+
	W8fP2QjfiV87J/siLFYmr6OCPZoExR/yJNqcVnFH30/v/+P25/llC18Kc/p2sw9SKehJ
	XCdQ==
X-Gm-Message-State: ALQs6tCTA/6KlQlycudmUZ3sB+ldb9L002CaikMyP7l8+6QjkyEUKh4n
	SUP1xLu2AtFJ7ndoKMm+Xm3XHdgy
X-Google-Smtp-Source: AIpwx495wtSz9cAYW+WvwYs+yk86psPJMJidBXROgA+E/QGDQj7SKzrDc+DzxQJLZdCmRUQ0Fkbjag==
X-Received: by 10.80.149.212 with SMTP id x20mr32742021eda.258.1523883641541; 
	Mon, 16 Apr 2018 06:00:41 -0700 (PDT)
Received: from localhost.localdomain ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id o6sm3422518edj.31.2018.04.16.06.00.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Apr 2018 06:00:40 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Google-Original-From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2018 15:00:19 +0200
Message-Id: <20180416130021.4428-2-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20180416130021.4428-1-koen.kooi@linaro.org>
References: <20180416130021.4428-1-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH v2 2/4] libcap: fix (base_)libdir usage
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
X-List-Received-Date: Mon, 16 Apr 2018 13:00:41 -0000

The recipe wants to install libs into base_libdir, but uses "basename $libdir" to derive that. That breaks in a multiarch setup. Use the proper variable and remove the inline python usage.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-support/libcap/libcap_2.25.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap/libcap_2.25.bb b/meta/recipes-support/libcap/libcap_2.25.bb
index d619a2e..47ecf34 100644
--- a/meta/recipes-support/libcap/libcap_2.25.bb
+++ b/meta/recipes-support/libcap/libcap_2.25.bb
@@ -32,7 +32,7 @@ PACKAGECONFIG[pam] = "PAM_CAP=yes,PAM_CAP=no,libpam"
 
 EXTRA_OEMAKE = " \
   INDENT=  \
-  lib=${@os.path.basename('${libdir}')} \
+  lib='${base_libdir}' \
   RAISE_SETFCAP=no \
   DYNAMIC=yes \
   BUILD_GPERF=yes \
-- 
2.9.5


