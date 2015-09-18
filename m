Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id BA2F67702E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 12:15:01 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so29806143wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 05:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=W/Mhg/kvAC7LL5/JdXJ/IZFD9HUH9XS89RVxwf429Ic=;
	b=f0vtR+GKhHK7osyuZZWwLl0kJuYTtRaTlZSSfKtSwKlV6TNpx5t5XEEcC8gXXYEzev
	Fv1ar9CBLwh8QwyLIFyKvwdVplYcJBsaAQurkoFCZJU3zT4vdbQzeeBKVUC/hVt6NNMG
	4V3aYmR+C6HIUQAMUJGez+CFkX0Zf8uqfEbpZuP0YN6+5Rb7CJxu8X0RG3Su9H6is9LB
	gxR7S7Z0x/EBYsgGypDYTc8aeqiKoIRl8NaNzQmqq94vJx0RB5Qc2kPikrA6bGgsrByh
	y84zOR6n2qXfYfSvNkWhdmz5Ktbk4zYvaMLsuhrnls6XCqC3epOHCOQfJWWi1NGTAmdg
	Q6gg==
X-Received: by 10.180.11.212 with SMTP id s20mr15776055wib.40.1442578501321;
	Fri, 18 Sep 2015 05:15:01 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id pk7sm8614073wjb.2.2015.09.18.05.15.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 05:15:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 14:15:20 +0200
Message-Id: <1442578520-28019-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1442578520-28019-1-git-send-email-Martin.Jansa@gmail.com>
References: <1442578520-28019-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][dizzy 2/2] autotools.bbclass: mkdir ${B} -> mkdir -p ${B}
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
X-List-Received-Date: Fri, 18 Sep 2015 12:15:05 -0000

From: Robert Yang <liezhi.yang@windriver.com>

${B} is the default cwd of tasks, so there might be race issues such as:
| mkdir: cannot create directory `${B}': File exists
[snip]
NOTE: recipe perf-1.0-r9: task do_configure: Failed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index b5f4516..dbe5e91 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -105,7 +105,7 @@ autotools_preconfigure() {
 			if [ "${S}" != "${B}" ]; then
 				echo "Previously configured separate build directory detected, cleaning ${B}"
 				rm -rf ${B}
-				mkdir ${B}
+				mkdir -p ${B}
 			else
 				# At least remove the .la files since automake won't automatically
 				# regenerate them even if CFLAGS/LDFLAGS are different
-- 
2.5.1


