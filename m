Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C7FE078629
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 00:40:19 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y206so8065578wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 17:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YkJHeM1zuXeMpcs0Nv/5wioMUa8Ulc9lo3wx1vrnFPk=;
	b=qmnnWckACc8sVV33NhKfYRSHd0g4JiYdO8RaDj8ULWNegig1tfeL4qDoC4fNZ95CUp
	BaEkbwhUXBN++mF1gSve0ksiSTeNTslKuTeNuNvjyszZf9oIHuCsCvxoWCASnqFLPqjZ
	fyZxWsU3EYs8s7pDoZui8BZJMJYC3Nb9QmJXAArzdpYUZmpx60uIMuoPYXEeTsC4q+Pl
	b0TzpiqvFHkw6UTW8rZgfRGbHjkd+1powRxIucYuiJbm4Qxtd7EoT1vWRjPAjeCu69Gx
	LwXPjwpNfKBwnYVXbO7563QYEEOyOl8yt7ykaRSVMcJ3tgJhMuXaGUum0C5/zKNZloQA
	wFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YkJHeM1zuXeMpcs0Nv/5wioMUa8Ulc9lo3wx1vrnFPk=;
	b=KVmjSN73TdCbbvWNiEQEsoZLvToHhu3DvYkowZjOt+QiOJxGhEAdlXofXK1lnVu/w/
	Jj7j92nNF6Dc7X7xGOUy7xciQs+ayjQGHPSHeWFwhcvPsNj+/T/zEtDDRAIDcduCuR6Y
	AWzywfokuxR7id5xSMDTf9BjGIjIYJ+clqkNZgc1WEVUPAfQhbFz+/T1Cgn+In+vXjge
	tJdMbktWkrETsrNx6RHr9t05hy7Kpn1wzcEKRKCnPFaI+Zv1LtfDS5dg1ncKmklLNb0b
	e99Qa1T/4V/wkCLXfsvRFYv44qlQ3zUI5cpQglew9tttgZLZ7d2PEL6rKgyDuM9KbVNN
	gffw==
X-Gm-Message-State: AHYfb5hS9djcsLfFAhFh6Fi2tT86txlO6n6eG42ZwyiZcrXP0IAR42r+
	FIIO4WoCkb36oFnj
X-Received: by 10.28.193.203 with SMTP id r194mr200370wmf.85.1502498420626;
	Fri, 11 Aug 2017 17:40:20 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l29sm1791962wre.46.2017.08.11.17.40.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 17:40:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 02:41:44 +0200
Message-Id: <20170812004145.12654-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170812004145.12654-1-Martin.Jansa@gmail.com>
References: <20170812004145.12654-1-Martin.Jansa@gmail.com>
Subject: [PATCH][morty 4/5] icecc.bbclass: prevent nativesdk builds depending on target specific KERNEL_CC
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
X-List-Received-Date: Sat, 12 Aug 2017 00:40:20 -0000

* without this we cause nativesdk-linux-libc-headers to depend
  on target specific KERNEL_CC (through icecc_get_tool ->
  icecc_is_kernel -> KERNEL_CC -> HOST_CC_KERNEL_ARCH ->
  TARGET_CC_KERNEL_ARCH -> TUNE_FEATURES(thumb) as shown by
  bitbake-diffsigs:

  OE qemux86@ ~/build/oe-core $ ls /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemu*/*sdk*/*/*do_configure.sigdata*
  /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemuarm/x86_64-nativesdk-oesdk-linux/nativesdk-linux-libc-headers/4.10-r0.do_configure.sigdata.3a9a423878d56524e0ee8e42eba1804f
  /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemux86/x86_64-nativesdk-oesdk-linux/nativesdk-linux-libc-headers/4.10-r0.do_configure.sigdata.401071dbaa88903ece37d35a47965ff2

  OE qemux86@ ~/build/oe-core $ bitbake-diffsigs /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemu*/*sdk*/*/*do_configure.sigdata*
  basehash changed from 39774238b66763c598153132e87a2c1a to aa2d66e770bf533e312536eb0a401c4c
  Variable TARGET_CC_KERNEL_ARCH value changed from '${@bb.utils.contains('TUNE_FEATURES', 'thumb', '-mno-thumb-interwork-marm', '', d)} TUNE_FEATURES{thumb} = Set' to ''

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index a837894150..c572571515 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -42,6 +42,7 @@ def icecc_dep_prepend(d):
 
 DEPENDS_prepend += "${@icecc_dep_prepend(d)} "
 
+get_cross_kernel_cc[vardepsexclude] += "KERNEL_CC"
 def get_cross_kernel_cc(bb,d):
     kernel_cc = d.getVar('KERNEL_CC', False)
 
-- 
2.14.0


