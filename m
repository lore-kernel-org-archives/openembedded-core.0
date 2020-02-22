Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 61E146174E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 22:09:33 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a6so5551954wme.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 14:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kmhpQsmTWZw/bXO0Z1ZZTiEsxltDYZmNvXUc/IZjUak=;
	b=OsvlL6jP+74thbWn/hzoiRkHYzcrNqjyIeDqGhX/SMIBl+0u9s66ujBoRmL5KAjjLa
	q+79SSquZLuio4fVlaFj7nOCG1YdqP91llnrWCJNSQ+uc6eiJloibHJFfjiDOC6p587U
	qNRFAZCDqrU5N1TtlK27fYxfMsk9EuzFzI87wJzb+1xCcmLyV3BZEionYiieCa+SfaU/
	yjKHDn3qvQ6+GVpUfPAMxy8T1ITBaH4dt7OAFoDURi/dE/OqJ0tOD5MTqIrZ4McLRFQV
	REwpRIuYuRzOi7wf+2d/mduJ/To0re6qv0N/VzMKY6a5MZtlTPqFCF7POup2jXx3k9K4
	Wbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kmhpQsmTWZw/bXO0Z1ZZTiEsxltDYZmNvXUc/IZjUak=;
	b=asmXfKZWlkb0YmQWZH2XJw6JOm7pp1CYVF2z/8jiUhv8zktmIwIlo4zh6Y+RUJHjM6
	lY8HTRCSMxVB8PqIlV/vLNb40EQH2yj2hvyKhwZaUJo+7meZSzZjiVKji9hcE/tJTjIy
	Kr12cDhjibsmDT47RgGKrvmh1GRX6cFRBd17Rht3Tzwmx9X+hdnreL9DtYNrD+LSCxiu
	meZ00Y6t7V+JwEtWkgvjL4FtO+KhBDs+PAAd+xaO4OsbxodTrRVJb59Duc2zAxhbje4a
	cFYugZh7pXahfYk9024W76aQ3JjwLk8KZUGYNU86FdWkAyOJQMukXR8siaeK3TKv9wjN
	8/7Q==
X-Gm-Message-State: APjAAAWY8Bmx67Chufm8SJHXQuLgS2+dbDZISVpymlurUl8qiBiuBa55
	F0UK2md2TAmkTNEeLtKm9sAUiUwL
X-Google-Smtp-Source: APXvYqxC69aERngpL4jXdgkisiW52Nqgs3/6mi45mqgTiDv9a1LtR5Sm2UfO/lwhb58/5mP5NgxRUQ==
X-Received: by 2002:a1c:720a:: with SMTP id n10mr11932632wmc.103.1582409373760;
	Sat, 22 Feb 2020 14:09:33 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id e8sm3729734wrr.69.2020.02.22.14.09.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 22 Feb 2020 14:09:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Feb 2020 23:09:08 +0100
Message-Id: <20200222220909.12019-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200222220909.12019-1-alex.kanavin@gmail.com>
References: <20200222220909.12019-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] mdadm: fix more ptests
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
X-List-Received-Date: Sat, 22 Feb 2020 22:09:33 -0000
Content-Transfer-Encoding: 8bit

Particularly:
1. set $dir, so supplementary utilities can be found
2. disable integrity checks as they take more time than any other test

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/mdadm/files/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/files/run-ptest b/meta/recipes-extended/mdadm/files/run-ptest
index 7959c055ad..fae8071d43 100644
--- a/meta/recipes-extended/mdadm/files/run-ptest
+++ b/meta/recipes-extended/mdadm/files/run-ptest
@@ -2,6 +2,6 @@
 
 mkdir -p /mdadm-testing-dir
 # make the test continue to execute even one fail
-./test --keep-going
+dir=. ./test --keep-going --disable-integrity
 
 rm -rf /mdadm-testing-dir/*
-- 
2.25.0


