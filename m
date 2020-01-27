Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 15E977FD6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 14:19:18 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f129so7241654wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 06:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ImH5cTybEiot2Wyk1yZSJU2Z9l1TMLBratMnesMY3GI=;
	b=nkw0QfjZiaAc6OCilB/+P82BoGpyLunjNo13Lid1ZpZ8iHJeyymdEbI78CLBJZZqw4
	ckOSGcjt9X6rXKAk6BybyljgiEbwoX8y2CklwL/Ign7/C3SxSooX9pbSvc2pnsF2Sy4V
	b1JvINJSv2J+tbf9Q0lMjy+CMZ6pYIV3iBCY1kYpV7rJu/DeU4Rlw6V1UxkDSvkRQeOL
	Jw9GbQurZhdaJ8I/58yfr0XkVK8a+/vkZUC0NIc/+IuEbarKVz9LJouM1rOevANDf3ul
	XJplCE1Y/DWqdl7xxAQt4fmIyv7I1IAPKvnuvm3OCnKLwbEzcORm5ednwVG0wl295uc3
	faBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ImH5cTybEiot2Wyk1yZSJU2Z9l1TMLBratMnesMY3GI=;
	b=GPFuqib30cvDS7jgBSYPvt4ASALoMot0DSV355Tvehtdr/df/efrEJkK5bqZrOPgEt
	Hjiuq2QYV8GPD2GwaTcdm77d3Luntt2F5wlhkh4pzdAkg7fmcvBAT6/i1LY9NXz7Kral
	bHYw3xLGS78K/wPtTLxDxrqK7XFdNY9SMR/fKRJKjZKcJAJ9zgbqWpu/xkFZZDdaxkcA
	Xbs9vMwSRxfow3/u6DO4RfRN7svPAEVrflVwRDWSbRoDH/0sCScfMg+uEotOjCtSfcoe
	Zpl33lj3fgqsyPlx7pd+VWDhqW65RZpY6G2hYdKdiwf1mojNM4m83gw5KugRDC8kb5Yv
	FKrQ==
X-Gm-Message-State: APjAAAWe9EoSGmq1HRdMdxkAbGd/hCRVMNx10Blrs1N6CIN/KgHCvlBh
	/lTME7fChnX1wco+QkNVt/T+Id9L
X-Google-Smtp-Source: APXvYqwOvY3nfJpTcs5nQCvCVpSzu2MX5xk9YVIUu9qe1cUGvU95Xp7AL3mtMaM1zvD+kQlqcYgNSg==
X-Received: by 2002:a05:600c:2187:: with SMTP id
	e7mr13932178wme.11.1580134759597; 
	Mon, 27 Jan 2020 06:19:19 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	n1sm20533930wrw.52.2020.01.27.06.19.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 06:19:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 15:19:06 +0100
Message-Id: <20200127141908.84922-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127141908.84922-1-alex.kanavin@gmail.com>
References: <20200127141908.84922-1-alex.kanavin@gmail.com>
Subject: [PATCH 7/9] core-image-sato-sdk-ptest: use 2G of RAM
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
X-List-Received-Date: Mon, 27 Jan 2020 14:19:19 -0000

Particularly, 1G wasn't enough for lttng-tools ptests as
half of that went to /tmp, and lttng-tools needs more.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index 7490b773d2e..58c257c49fb 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -16,4 +16,5 @@ IMAGE_OVERHEAD_FACTOR = "1.0"
 IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
 
 # ptests need more memory than standard to avoid the OOM killer
-QB_MEM = "-m 1024"
+# also lttng-tools needs /tmp that has at least 1G
+QB_MEM = "-m 2048"
-- 
2.17.1


