Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6BB187FC00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:24 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t2so334238wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RhYDhKo4nFT+oVxHVY+Lka5oUmPRaS/L4udbboI9QxE=;
	b=Bw/tcNiYwMeb1HwcQhuoiVnQStTP2Yr7IP4BaWNGa7vTzYDIA8Ny9jB9emk/+O7ZHo
	5aVl7R5qrVpgjbmrtaC6PenN/79v04/MwP0IbxE+8Liu9/CDbOMXEWYDnDMISC+U27Up
	3ViU2LmGUsDHbr/jmMsEW0mRuaeDVd6phV8W/U14WGuCfKVzooZKq5heiXWrczVfW6Q+
	bGieiAc3bOUwlYfNJJq7Bf/E/S3IDqfB5kM9IrgAjLFq42Fx1m2wMZvs0gyYXV0kI1XG
	X/ipqSd7ysOzoCTQu8GqWrZbQzns1Kwf454rCvtjRVvaRjQzUOfABBwAm2HHWTU2k36s
	Y0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RhYDhKo4nFT+oVxHVY+Lka5oUmPRaS/L4udbboI9QxE=;
	b=R4gH8PlIk8FDJMgaNnpdTW8iHSOk2W1YZsIY2w+OfPVgtiduY9HYBXtpIQHyDFAoVj
	WMjMmW2CGs5/tmYeUQNPKnGHdkLgyfMEwC8y1kKCT+n2JQmUiLVsCPh3tpoJzaWKclfU
	FFcLu4CZOxhhRBW8E1lSWNkiVoWShfguEOp9imybbmES3cUdrEdD7jWvslBO29F8Gwjn
	6tYkcWkMjjj7iFtct4VJMtgwmVLvvFgxVgeg4kZwdfIEvZbZwjfoeNUhfYE2ibjrzNyg
	fmbnq2AyL0AvkraMLYzwS/QHP59qeY0Wz37OqAhpVfxxgAlEcOdOum3dzLgfaJTSXYb/
	k2EA==
X-Gm-Message-State: APjAAAW9eTd8k6NagdGOaV4BvTedO4NM+PprcPDLotxtH/lbcVxBgCjo
	05oESSbaTOhcXZx9/2IMzfsDv8g2
X-Google-Smtp-Source: APXvYqyrJ3MHSAaok7rT9m3Gru3nAtIdKSX2jOWrEb+y75LlvpJKeIlpp8lWqwb2yBg/Bra0MYL4Ww==
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr568282wrw.370.1579541124958;
	Mon, 20 Jan 2020 09:25:24 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:24:49 +0100
Message-Id: <20200120172510.22648-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/24] python3: correctly process ptest output with sed
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:24 -0000

Particularly:

[ERROR|FAIL] was matching characters rather than strings.

Using (ERROR|FAIL) requires -r option.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python3/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/run-ptest b/meta/recipes-devtools/python/python3/run-ptest
index 3e45d3918cb..405b07f4959 100644
--- a/meta/recipes-devtools/python/python3/run-ptest
+++ b/meta/recipes-devtools/python/python3/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-python3 -m test -v | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
+python3 -m test -v | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
-- 
2.17.1


