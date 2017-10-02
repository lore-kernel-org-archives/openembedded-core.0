Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 58A0471AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 05:25:51 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l10so23711wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Oct 2017 22:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1mfgGGBWka7oZRZKGUXjX5bD54XB07y/oJjxGjPU0NQ=;
	b=BRZdaVC5DEmHxnot8LGUkvCXcwZ/YR6HdOuANX6r0jRl7zmvHpcGGEB0mJlDAJ9GTg
	v8TT3/LrgCS4dNPXAckaWkbngPgYY/1imLKmbSWsPjCnLMmDcf05U+yFziSQW7S1NpOS
	UNE3pWBwAXvvbmJuUajq9/nFGa7Qvns42BE5LK04Lg9p+q1HMU+msBaSgD6aYKp/+Gur
	NfQg7Qf9eApD/d4HDloAxdeWz77iP7JpVhQjMnGoCX9isQfHrmjW4feue4q9nHaqyj9e
	NdpzEjzGVuvbXzO5C4IyzeLpi1QthMDW19TF1PFDLZ6ZK1h4KdAZhGL/GaNMeVpeOkFj
	pvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1mfgGGBWka7oZRZKGUXjX5bD54XB07y/oJjxGjPU0NQ=;
	b=UKFrnYukkZEpMfxpgjUYfcJRnjWF5kJdeMT+o7Sn6N+zj4tLlzhAIl77gFsKNzrV7T
	MXE6H19UA441p+8a71vr8ipyD9NEzcOQVZp3V5dqLVoSjTQ+0recNXIcMaKfE0YWv7sQ
	gC/DA99qr7xsKyYFGRjOmpG4GwPS8c+O4ckgZiQfouyWCvZFjzaX4VBLEpd3Y+QrBtzp
	G3UhZemPxHqGPoKqyGmv/p0pCm0OSwgzKcxO3SnPmb2aWvWWHn/ErQs84G2zw968uuhu
	d4VuOCVn3cAETqNs3GET3ItCcHBTWYqDsZQGG7lJf4BL640fnkvHnl2EsJIzGcUzYQIQ
	gsnQ==
X-Gm-Message-State: AHPjjUiHIdxoTb2j38S9F8CDBTHiLI5RpUbMyM2HWIm4d7347OrNVO9p
	/vTLhvZVHezo8poAIXBk1Z4rKuIY
X-Google-Smtp-Source: AOwi7QAW07F0EJ2pglNewADMEpl3NCnVJmgU1kShQ8JXhT97QRhj/UmY8+axcV0W5guXKPSC254OSg==
X-Received: by 10.80.163.186 with SMTP id s55mr18875509edb.3.1506921952522;
	Sun, 01 Oct 2017 22:25:52 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.38.60]) by smtp.gmail.com with ESMTPSA id
	h45sm9147683eda.92.2017.10.01.22.25.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Oct 2017 22:25:52 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Oct 2017 07:25:41 +0200
Message-Id: <1506921942-8189-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] libsolv: fix a kernel-devsrc installation issue
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
X-List-Received-Date: Mon, 02 Oct 2017 05:25:52 -0000

From: Ming Liu <liu.ming50@gmail.com>

This patch aims to fix a kernel-devsrc rpm installation failure on
target, I had sent the patch to libsolv upstream, but its maintainers
rejected it with the reason:
...
we probably want to sync these values with RPM code...
...

I am not a rpm expert, would somebody please comment on this? Is this a
issue also should be addressed in rpm?

Ming Liu (1):
  libsolv: fix a kernel-devsrc installation issue

 ....c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch | 35 ++++++++++++++++++++++
 meta/recipes-extended/libsolv/libsolv_0.6.28.bb    |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-repo_rpmdb.c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch

-- 
2.7.4


