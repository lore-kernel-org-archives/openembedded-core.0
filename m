Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id B54E57F502
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 14:45:16 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id q64so3779111ljb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nukYNcpoan+OpInGE43yqeD0jIoV1BTqqkNf33J0CVc=;
	b=cN00o60/hd6jgrpsQ/j3OYkyH+pOI2U8nDGid/OXs++kRB7GFaRWuEjewp3+5QA5ZY
	OjPLjyJTMjAIFA9Fgt56LBTKRm3f3atsJYVu8uCVwRliJ1+a51b7P66n82K7ymDq+NTy
	DZr6Dr4OV90wMLT3+ZYKFc2P/SAJOwrSddpA9G8n3Tqem9nm6QPZSX5wj4DKFL0p2QRW
	wbayKJSpbXMwtR1b6SOSu3bVbrnduWt6hytB49vAR9Jb1rBlU5cZ9Lf0Pw+7KNh8FBKJ
	ekLw7doG5JIzlQ+jicy3uLuci0xqNMRi6SCBJKcJ1AyzL/NaBEpOLCuE57qAqoxQJphF
	c9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nukYNcpoan+OpInGE43yqeD0jIoV1BTqqkNf33J0CVc=;
	b=t1tD5etSpO4mMnEyfPMwQJsicNXwAmkAd8SrG2+nnvMXmXI8r+ALE1/nagh9im9lmt
	I3kbLDgekf3SJx5RhMNxrWd29Qtk5IMdz6ZEJt5Tah4nGLnawKiETchFes8ZD3APpkkb
	BqkpQeLXYCa+o5sSyiXoNuXbJW7kfkNArvouqF8Z9ANeY8CyyaJ/iaP9X1sZVKgJoGyn
	7wdyD7TzmaG7nKsP+FDZrd6UrRQGaMcwmIcMXMJMiLVOrq2y80eB+vKFpQtOA7OV6mhZ
	yOmZrwHvZkAOsaS0EyuDRrU/jhJ1/je0gKErnFLSRu8H3vLaBxL21CE5kvw2vKc+mfgM
	eltQ==
X-Gm-Message-State: APjAAAUMPR87LqJYPZhb2h4Au/KebOmkpmuGtFfFdT7OF9dwT1vcnBv/
	wuJPu9qgfS5THdJ9d6l0K/klkcPv
X-Google-Smtp-Source: APXvYqwMi6zWVY370XjXKp06Qxy6SB57PRX+3D3YEOlM5+9C3XlGGVj79NdIQ/wICxQz+beUI7gTfw==
X-Received: by 2002:a2e:720e:: with SMTP id n14mr1597837ljc.63.1568731516871; 
	Tue, 17 Sep 2019 07:45:16 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id a14sm479022lfg.74.2019.09.17.07.45.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 07:45:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 16:45:06 +0200
Message-Id: <20190917144506.43003-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917144506.43003-1-alex.kanavin@gmail.com>
References: <20190917144506.43003-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/4] strace: add a timeout for running ptests
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
X-List-Received-Date: Tue, 17 Sep 2019 14:45:17 -0000

5.2 kernel has introduced a significant performance regression
where some of the tests take many minutes to complete (where
previously it was seconds). While we're getting to the bottom
of the issue and working with upstream to resove it, this
change allows tests to proceed instead of getting stuck and
eventually timing out.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13506

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/strace/strace/run-ptest | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-devtools/strace/strace/run-ptest
index 8070d831799..2fed984e901 100755
--- a/meta/recipes-devtools/strace/strace/run-ptest
+++ b/meta/recipes-devtools/strace/strace/run-ptest
@@ -1,2 +1,3 @@
 #!/bin/sh
+export TIMEOUT_DURATION=30
 make -B -C tests -k test-suite.log
-- 
2.17.1


