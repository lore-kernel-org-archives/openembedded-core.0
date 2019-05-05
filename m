Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 71ABB7D716
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 05:23:34 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id o25so611114wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 22:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dHlf2jLguBWbaJVEihR2B5+x4sZWbFkUvgAbLyYkcxY=;
	b=GCLCRYULjF3qwvQdQh3+/UJ+WkOCZScFXxJlN3KL0r4O5XY46PictxfVI7/MVCwKQs
	QY+T4LzoGswmaDZAzhx6N+RNu2MPC6kuLHDcmZQB1H7KIUbIR/r825Ztx/IJBikXfFXF
	opMoukYCK8s4mMCVpeOHsWtsrAzGjPYdqKNMMEukbKRGfVbmrik1vM2cneEifjjL0rE5
	fDdZws/YnWkmZOUsVoBoh6qJMbtcwRzTZO55RyzGhI8sn1rlygA6RHffPXC/NIkbihE1
	nL7Uv5PyIxDVPRjqc4PyASczZnDaJJdORJKqZhJQ66/mz+n2IrsDjPqeCPPm2XPDO+vi
	2K6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dHlf2jLguBWbaJVEihR2B5+x4sZWbFkUvgAbLyYkcxY=;
	b=Xn/ChQsSAjSMr1+P2+DhJNfXNDLoDKdfZPJI1qCzabagqst3PfYEbAPwqXUVqv6aq/
	QEqtyQCALRs3byGExoouRLqc+IDHg/2M6BdANB3+bwCaj8d7pn67Zj5Ga2ZVkMbLyMfZ
	9i9lZi5pcYYGqeQTDrc9Emnm0D0Q9+YkRTei3rJI3VDRHGkKiNX11Q9Uws9N3FVx4E6X
	PfCROSYZy1O7bsfQcOx5Fp3iRArzseSEnJ8KJCJ8nLL4uRaHYZMYVc2X1QxNqlU+5q21
	V5M+CQoEPoJfhX/0530+0EM34nQiNYZUGSzzH83mZmVrFzlATyDq51JsvuZl/AGvc93s
	KAxw==
X-Gm-Message-State: APjAAAWzAO2vzg171NPs3ZDWIAACNvY/GyYd54YKJ7wr8Wa5Zzck59KQ
	QXp4XmDrcUkDpjmQmnCVOK5Mxv2o
X-Google-Smtp-Source: APXvYqzd/n+hZseER/Gld+bSthdzVCnV11u+aBQl5do3yeZSJTF7Sw4r215atmNi1PS5g3ug1q2nLQ==
X-Received: by 2002:a1c:eb07:: with SMTP id j7mr11727169wmh.138.1557033814959; 
	Sat, 04 May 2019 22:23:34 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	z5sm13323163wre.70.2019.05.04.22.23.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 May 2019 22:23:34 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 May 2019 06:23:32 +0100
Message-Id: <20190505052332.21840-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] go: Exclude vcs files when installing deps
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
X-List-Received-Date: Sun, 05 May 2019 05:23:34 -0000

Because our clones use the host git, on (say) Ubuntu 18.04, the local
git directories acquire perl scripts such as fsmonitor-watchman.sample.
During packaging, this leads to failures:

  ERROR: go-hsperfdata-1.0.3+gitAUTOINC+b58598ac84-r0 do_package_qa: QA Issue: /usr/lib/go/pkg/dep/sources/https---github.com-nsf-termbox--go/.git/hooks/fsmonitor-watchman.sample contained in package go-hsperfdata-staticdev requires /usr/bin/perl, but no providers found in RDEPENDS_go-hsperfdata-staticdev? [file-rdeps]
  ERROR: go-hsperfdata-1.0.3+gitAUTOINC+b58598ac84-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
  ERROR: go-hsperfdata-1.0.3+gitAUTOINC+b58598ac84-r0 do_package_qa:
  ERROR: go-hsperfdata-1.0.3+gitAUTOINC+b58598ac84-r0 do_package_qa: Function failed: do_package_qa

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 7f5e8b99bfc7..b6d9372c5696 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -130,7 +130,7 @@ go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
 	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
 		tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
-	tar -C ${B} -cf - pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
+	tar -C ${B} -cf - --exclude-vcs pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
 
 	if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
 		install -d ${D}${bindir}
-- 
2.17.1


