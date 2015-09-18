Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 704757680B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 12:13:30 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so29752146wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 05:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Bp2AwVxmRm4oIA/4d41RynnwcxmzvuulUIeFVi26YNM=;
	b=Mm5Xn+l7VEREGUOpLrJFdn8Bf73J6y9HiSI6l8l05bOitjzm0g02o0gDHutGWPbBdE
	9XtR2yx39ZgQhzRP264xsjz0cuPTqFY3czMgOprhw7QlhD5orqtPUDklDU8FOOoZlWez
	37EB7CSe7wJyWFik3b7UDzuoHOLgZf0KZhKwu4txW0KYs6GBNRxnM8cH9sWj6hSt2hl5
	LbLwc7oqKP50Q7Yr5FPOV1DwHXBkGTOZhduUa0VOotxwp+V3uwmpftLzpQOYPqqSvt4Z
	cTGpmoHIyE7aUlw3eafHomKgqhrWxekwSVzT2IYm+QA1ioBbl0E7eHIU6J5i2Cwpu0A8
	ZXXg==
X-Received: by 10.180.105.196 with SMTP id go4mr15266222wib.36.1442578410379; 
	Fri, 18 Sep 2015 05:13:30 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jf3sm15266539wic.8.2015.09.18.05.13.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 05:13:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 14:13:47 +0200
Message-Id: <1442578427-27210-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1442578427-27210-1-git-send-email-Martin.Jansa@gmail.com>
References: <1442578427-27210-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][fido 2/2] autotools.bbclass: mkdir ${B} -> mkdir -p ${B}
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
X-List-Received-Date: Fri, 18 Sep 2015 12:13:30 -0000

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
index f213e89..24a0114 100644
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


