Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 34938770CA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 13:31:04 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id k184so10134337wme.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jun 2016 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9Vsm+xR91H4IsqwP1GGF0R5+8tMP/0Vl+1LA29C1wPk=;
	b=ZTiP7FpA3+jyXLhCPEoYRcs2plm9/WIMHD/ZxlXtJh0V0UP8FymBtzypq2U/06YfZ4
	G7DbZ2B9ydkTAO/KR3uuuTnKZwhZtNh6PXuFmb8QdO5UaTEnfFPaAWJd4fddgDtBhjpG
	RgrLUby6GILkuzdC7FgKPHVvAxxUYLHXbQrGln/JuIefnDIioMajT2m0+icksb/R03gm
	1aCgMXHTdOBqHch5JC3tWeo3nGvKYxuyvVVSyyRvwZf9dAYI2+grv/jnI+riqlxWUcQR
	6Lo1LaLEnohmW/q3x+wYWZjE3WkC0nDQlmU8e3wq0RYbQ6aZcUDgSRa/5U9/6uUEWZ3N
	/Q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9Vsm+xR91H4IsqwP1GGF0R5+8tMP/0Vl+1LA29C1wPk=;
	b=I/h6oULj447mcCu9PWFTT26Rs/uSUl+AX49HfJwzJR2xaoNyn6ogERvc59UaQAkmup
	xNlEyeQvUSTMMGvbGy6mK3ze6y3Z0C9xFF9GCil9bRwIsTygbk/tofZUjEM9K2zESuX7
	ONH9mRsJYg0HrfiExxegF3o4mpGnpMGMlDi1w672GR5H/0s14bK9FdxQQZ2sIVhH62Uh
	chgwIUsrI8c+8ymU9KtlzB9xDrR8F0pcL6PYjOxiTV8x/qDNkkK90QFqG0Ijy49miqY7
	7z9ZZEET58Rsqv3wWRtv93S6SEWod1SRNTj2AY6TKZ8K6vqKXlwkPxeJSgUH0MM+4z1N
	xGXw==
X-Gm-Message-State: ALyK8tLrDmUiUVsz+7xClRa7jUWYnQXfmjIo6LStgbPK6rLvlENz3RGEV1PPM40YhgOzOw==
X-Received: by 10.28.225.132 with SMTP id y126mr11416431wmg.64.1465219865096; 
	Mon, 06 Jun 2016 06:31:05 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	a199sm1285707wma.2.2016.06.06.06.31.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Jun 2016 06:31:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 15:31:07 +0200
Message-Id: <20160606133107.20415-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.3
Subject: [PATCH] rm_work: exclude all kernel recipes
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
X-List-Received-Date: Mon, 06 Jun 2016 13:31:05 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* otherwise kernel is rebuilt every single time and often it fails when
  building external modules

[YOCTO #9352]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/rm_work.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index c647d88..3ebf095 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -119,6 +119,8 @@ rm_work_rootfs () {
 rm_work_rootfs[cleandirs] = "${WORKDIR}/rootfs"
 
 python () {
+    if bb.data.inherits_class('kernel', d):
+        d.appendVar("RM_WORK_EXCLUDE", ' ' + d.getVar("PN", True))
     # If the recipe name is in the RM_WORK_EXCLUDE, skip the recipe.
     excludes = (d.getVar("RM_WORK_EXCLUDE", True) or "").split()
     pn = d.getVar("PN", True)
-- 
2.8.3


