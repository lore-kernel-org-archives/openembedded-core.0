Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9F3F478953
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 20:29:16 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id y8-v6so5819073pll.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 12:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q6XuKUWYIr6aiR3lunuR2PCPIsemOpoNvOj+65PuSNE=;
	b=okYLQ5SXMfSj+AUf/Yn5o7Plw714yehzDyrpwRvNEkDLY87zgiUT/dZbFf/8IvtL2T
	CXcVPF9Jl1BKEHFqHxcqYlMIqlPq22Qna6uf9pxcWBIPddnn933nh9G0VS0kVe2p27ZJ
	rm8Tg4ReVbElPsPYVyEDx7fAOvMB0uCqVNVFobaSBLtrgiX+4uZJUeh4gFo4UJZBHpRz
	bNjHyOlWYX1ULfwYMRZEWWJS3I1QiGFVECGvOwlTyKr11kOQlvYxJMbGbyUKF+voSEHd
	d7E5/SgL1q7JjeR7hJ+ChwFOt/cS9YrgqFuywc8AMqde8AEES6PN2gt6P1J8QJ/yvA1G
	HeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q6XuKUWYIr6aiR3lunuR2PCPIsemOpoNvOj+65PuSNE=;
	b=j2S6VsE8PtfzXKDKYK1Ml/OoseDqhdRflsbCCOqnTQfu2RNCgRXdMfFw3U0aKhcz1a
	FisERBG7Ok8n6HcaQIdVTc28+TE+qCUEIBGGgJ8/+RKgmNiTINd93odBRAGDnhOJLy33
	m+yar/x/qd1R8q0sUtSrX0mUbSq6LVWHI5JWl+CE9TWrMbaIvZaHupzVWNmaA371zQMK
	HIcFt6sKjh+VtM5c4z987G0Yn/2xi1Lu1aTyK9EdhtlczD6wVy2BV29OgsGHRT9HKYgv
	OS2mjIa6pl5RN7Eq2rYNsRLaVWZOJDWHPKsjMtMJWvKyIPOXTJG+0KTxKQhE2NywYNRZ
	NrZg==
X-Gm-Message-State: APf1xPCdBzVZj7eiQn2OAkjJWUqaYoBbLSZOv3sxxN9e+zclNMt7zfro
	auOezIIfOzD297T4GWgKbTTf/g==
X-Google-Smtp-Source: AG47ELskR7cVM2wwsWEkfpweYLm5xXpy3aC+MiYVpe0RW4BJ2AMj5zmJNwr1c7QJya/LfnvHoCmY3w==
X-Received: by 2002:a17:902:243:: with SMTP id
	61-v6mr28919116plc.202.1520627357354; 
	Fri, 09 Mar 2018 12:29:17 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	v12sm3628643pgs.21.2018.03.09.12.29.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Mar 2018 12:29:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 12:29:06 -0800
Message-Id: <ac48930cb6d938a724b82db8b40d6f5ff186dc59.1520627244.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <cover.1520627244.git.raj.khem@gmail.com>
References: <cover.1520627244.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] liburcu: Explicitly add pthread options to cflags
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
X-List-Received-Date: Fri, 09 Mar 2018 20:29:16 -0000

Some architectures e.g. riscv gcc does not add -D_REENTRANT
when enabling pthreads. Help it here by adding these options
while gcc gets fixed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/liburcu/liburcu_0.10.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/liburcu/liburcu_0.10.1.bb b/meta/recipes-support/liburcu/liburcu_0.10.1.bb
index 0c8cd3571a..459c04a7a1 100644
--- a/meta/recipes-support/liburcu/liburcu_0.10.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.10.1.bb
@@ -15,3 +15,5 @@ SRC_URI[sha256sum] = "9c09220be4435dc27fcd22d291707b94b97f159e0c442fbcd60c168f8f
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools
+
+CPPFLAGS_append_riscv64  = " -pthread -D_REENTRANT"
-- 
2.16.2


