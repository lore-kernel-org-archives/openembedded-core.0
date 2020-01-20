Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C24957FCC5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:34 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q10so254215wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pF27wiJz+Py42mJK6mmBqHduDEUkrfA3oyBzDlPIS1c=;
	b=VhFVYULw0FQtz6pixeWadhdai0xGeCU7OA1PEtOLcLI4gLhAPPg/A3pgu2F/iB8Ut1
	NaGo6zRMCm9xPozYrS8p4wPFGlUdjwnd0wFcLlyF9NE8kLhuoKXjzsHaLAHE3dZgDMVa
	hCCc7CAuVcgdHuJOpdNASKYRLIttR9uKrDr2S0TakeQSio/QRmA5RSwlPPsEObFpTvvR
	XZao7Myf9e+Nx3AmGDIV4kz4NYkKowbxFSb9jJpSc04O+wcjxU57PUaaqZ7HX4sLclX8
	vVwXgZARBA0tWaZg0JuRxijQji0wNLZPIc5MekVrXqBwz5dXbJF2ICpe3er/28lDQUCu
	MTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pF27wiJz+Py42mJK6mmBqHduDEUkrfA3oyBzDlPIS1c=;
	b=t+sAOZnlEz4r/f86AKcosHBNIhctAVOtah3bYy8zZ0kKc80Aqf0QETvcWyKSEF8LN1
	qSbQgWdM4/KLgwIrqkdWuA/UHPlQLaZroK5mmG3g8Pc+O4OUdfHCZPZ/zs9WnXkmFdSn
	iB+k9d9Mz6fPy4+CbEPZhn9TS/Nb1wCPZ0kVtQAG+zP4vjLpqYL2ijUPE6qZc72ggprD
	gWKXDDcNu+195h8qPGCWOijOJrpXFc5fidcFLaevtP8pLwFgJsG0qmP58fzy+OwJQCyB
	JJW1+zMVVOdsytrKu7Ch2vYU55OZ+tHiTbG2me6I/c8/QmEp4q3whlUZgbP+O1lDoOeS
	BkbQ==
X-Gm-Message-State: APjAAAWdJzQb5nVEZn2Kkwf6Haqkz7u8OIPHf5kuONJ6fDzf+YDG1mXU
	65jRHYJaRW7XbJYBuxAlbhRZxKVm
X-Google-Smtp-Source: APXvYqwokVkWq2CsagWNWRQNjB0A3sqhqQJlY4ChyW//TySW+MZsOypJz8v4a+NZt8QwQ+9Mot8jfg==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr511321wrj.261.1579541135318; 
	Mon, 20 Jan 2020 09:25:35 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:24:59 +0100
Message-Id: <20200120172510.22648-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/24] parted: fix more ptests
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:35 -0000

Particularly parted is getting confused by udev's automounter
mounting things in background.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/parted/files/run-ptest | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/parted/files/run-ptest b/meta/recipes-extended/parted/files/run-ptest
index b57c29400ab..f39c478ce6a 100644
--- a/meta/recipes-extended/parted/files/run-ptest
+++ b/meta/recipes-extended/parted/files/run-ptest
@@ -1,3 +1,5 @@
 #!/bin/sh
 
+echo /dev/sda1 >> /etc/udev/mount.blacklist.d/parted-tmp
 make -C tests test-suite.log
+rm /etc/udev/mount.blacklist.d/parted-tmp
-- 
2.17.1


