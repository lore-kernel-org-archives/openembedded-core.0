Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7236CAC59B
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:51:48 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.41402.1757580698485813361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=InRXIj3L;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45cb5492350so3182475e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 01:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757580697; x=1758185497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SbNp6CkLdbGlrDh9FBocyJC/CW8JElALGenhGfsbqY=;
        b=InRXIj3LckQBWBRApCzvhvuIy3b+pnGCmhUwR3KDjZHeUx4wGVAv3ReyP3/Tq9sfu8
         npeguk10cH5uSEtNB0RsdDmdIQEK6PBBnv8Uch9r575VpCJ2DdLxVQ395aXDXgvZ64nM
         xJT5RloWFHGpASBfOJ4U+Jt1y3wr1e8msJ+bLtDYKQihwJZRs+xvgpMf2gVr0TGJtPsi
         /GxLO+NNOYPlRZntS7aus3eVZT3nNb15hV0A7AZnYpOCBAJGKYDUIP9TaZ5SM0DLbl04
         B6hoogzfIH81LI1KpW+hJJ4zC9FZKXOcBsFqQJEkpY1sfdauffgB3AcWaOyUpRR/Sg+d
         0vgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580697; x=1758185497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SbNp6CkLdbGlrDh9FBocyJC/CW8JElALGenhGfsbqY=;
        b=macxYDLdNVdrpf4cR/6wllkqIcbs5czkhBuO2Qf+cf0ZwH5grWfMKXMfydTavIEaVl
         K8Jb6KdbjkBn76hwLoTKjm9wwAKR3hokF5BoTJ7WbQtQ8p6IMylq7foYgJi6Fadztpwj
         S16eJcxQ665p+sWMcxiCalKgLUliQud/QR3xVrUNKhsIWOOJjP0jgaP86CyEn1GhNbSm
         Yjg2mKnwiYR2fwQE3QKVjwkjvbRMA3yqXT8dHAN22njdparDg1/Zz/mtJgUZJxUGJ6DL
         8FVlUCiV+CVkvAqdpl5bpe4T+N4zwON6g1B8XzRBJUx6M0K8hdjqa2uCfoeyIZPPfgrh
         Y//w==
X-Gm-Message-State: AOJu0YxPv+BgiMz0SgvSBHPwx1nPU4h1unBriYrtbHEW8E5NsHs9zvJY
	BAY11gBGlo+IrZGYokG4qKKTEk5Tl4hftI1J0YVmxZzzjXjeDL08uX7x01sjyg==
X-Gm-Gg: ASbGncsunejKFJAnX3g0BxesOCKWL2WOhj0kxW4SWxFqPNKjadlfw81DLSpRzvHPwHD
	s4gOcQAxtNjgl3JZ3Eu0SYJDCobpMA5jhXGQOBfhenAaEx8mdGLuApYemo7Ccrap7eC+llujHFD
	HKSGi1v+yF0A8DHVX0KRQLB1b6KSBBFXD/wITK8DPW+j/NPvZYI5mLYaVhc9uBPMM8Uw8PQ9CkS
	bmlJKYE+fduyowLkBBaaiHrRFywUg09GaP7szpkoGBq/1F3iKJrsA8Oq0KSoCTNah15RxsA5wEL
	Py0JVZ/p1Ct0cfPkgZSq9CINVorckNemygcvplqbvYJ+75L/g4t7pNjCjom9GJ9CXlwGzpWuGqB
	hSG7Cj90KYv4W1UXjJLz+ks/dvbD+zntL0DxNHiOmo2QBZPTWGUR0rmMZng+lb/7zIdxwFRcoJE
	KT6CBYfKEJMfcWsodVr+tJWrB+cKA/qks2xABSy7OhOqin3auYP2LkoAtURKFsaQFdjsT1
X-Google-Smtp-Source: AGHT+IHBnRz/6/XvdBw6P0ZiftLHUaJIGlZbSUuwBqZtH+Cqy8hbDfX6RibgohuxtAQvPzF13KTzdw==
X-Received: by 2002:a05:600c:5303:b0:45d:d5e2:f683 with SMTP id 5b1f17b1804b1-45de078d428mr162288895e9.25.1757580696796;
        Thu, 11 Sep 2025 01:51:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b2f4esm19382005e9.17.2025.09.11.01.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:51:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/16] pypi.bbclass: add / to UPSTREAM_CHECK_URI value
Date: Thu, 11 Sep 2025 10:51:12 +0200
Message-Id: <20250911085123.1551425-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911085123.1551425-1-alex.kanavin@gmail.com>
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223252

From: Alexander Kanavin <alex@linutronix.de>

This avoid an unnecessary 301 redirect and is matching the spec:
https://packaging.python.org/en/latest/specifications/simple-repository-api/#project-detail

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.bbclass
index eb30004a0fc..1372d85e8d4 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -51,7 +51,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE ?= "${@pypi_normalize(d)}"
 # https://packaging.python.org/en/latest/specifications/simple-repository-api/
 #
 # NOTE: All URLs for the simple API MUST request canonical normalized URLs per the spec
-UPSTREAM_CHECK_URI ?= "https://pypi.org/simple/${@pypi_normalize(d)}"
+UPSTREAM_CHECK_URI ?= "https://pypi.org/simple/${@pypi_normalize(d)}/"
 UPSTREAM_CHECK_REGEX ?= "${UPSTREAM_CHECK_PYPI_PACKAGE}-(?P<pver>(\d+[\.\-_]*)+).(tar\.gz|tgz|zip|tar\.bz2)"
 
 CVE_PRODUCT ?= "python:${PYPI_PACKAGE}"
-- 
2.39.5


