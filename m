Return-Path: <ola.redell@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB23871AC2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 18:18:58 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id k62so9783367lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 10:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Y/MHci7mF1foGn+JxYAZWT2WQ/t3zSMkfjgon8fa148=;
	b=Ok8jbXgrSO6UUuG4J7y8Tfp4TNWAlzFxxNNCEw47Mz1TFgYU0wliCcju+FrUEJRCD1
	hJrqit08carmgaQSIJu54WZTesQINvZFWJB5MvpVTxg5unq8kkAidRKtTEz/2eNcDcQR
	Sf8sbCvDLGq5nEfRjmYuXcc5Wjw1thb40d+2UVfU6ZFg6QxL1OPUZkAB3oxfBVuGt6dt
	JG+ETvMUsOjM1sItpY2kEiADP3bKSdQ5d4uUZztwmM/quxxKfsKfsp/te8QZvR8Lc07h
	lgmjnWBTwtykp0Rw+O46baBkw7w+OWcNdcTXRBeNNAGzXHWlxD0IcUraCZHf0nd1Fqa0
	wzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y/MHci7mF1foGn+JxYAZWT2WQ/t3zSMkfjgon8fa148=;
	b=ZU7aoHsxkLjYON60nBRZEsUH7Jhm1LCMfFtItN6mFenZVa/dRkIQzwrSUzZ5atNBgC
	5l2SMUrd+VgK8zeVTlzw9/HXoJhWAvvAclxGaEHGuRvItyejIh4JXL9+/1Csg2bbgsU8
	17SKgxZbbGMsCdPKrKzQXqeUEb/pgu0OTcOP7aRd8OL283VISBmgXBMP90RkMUln7fZJ
	6j5aKNtmVXTZJnYxNZVO2gkXfdqPLlOl7b8gdl1itOBOGaj7Xi9zU2wv70UOcGrCVPON
	6UnRDBVSgZoULgATgKRqdAKjMLKnbtVr15521c+V8CN6fPoz1IORdhVSSt3bVciS+Z9q
	4P0A==
X-Gm-Message-State: AIkVDXLmP8yzLN6gYBvmwQUuG4EPXrisudgOPq+w1lKK0eJtIc3nd3AL/eImC58S/21QJA==
X-Received: by 10.46.74.10 with SMTP id x10mr30581307lja.8.1483985937881;
	Mon, 09 Jan 2017 10:18:57 -0800 (PST)
Received: from thinny.lan (81-230-13-64-no94.tbcn.telia.com. [81.230.13.64])
	by smtp.gmail.com with ESMTPSA id
	v26sm2840140ljb.14.2017.01.09.10.18.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jan 2017 10:18:57 -0800 (PST)
From: ola.redell@gmail.com
X-Google-Original-From: ola.redell@retotech.se
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 19:18:30 +0100
Message-Id: <1483985910-20693-1-git-send-email-ola.redell@retotech.se>
X-Mailer: git-send-email 1.9.1
Subject: [jethro][PATCH] kernel.bbclass: use correct path in postrm's call to update-alternatives
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
X-List-Received-Date: Mon, 09 Jan 2017 18:18:58 -0000

From: Ola Redell <ola.redell@retotech.se>

The postrm script for the kernel-image package needs the same path
when calling 'update-alternatives --remove', as the one given to
'update-alternatives --install' in the postinst script. Without this
change, the postrm script fails to remove the alternative.

This applies to [jethro], [master] already has a fix for this.

Signed-off-by: Ola Redell <ola.redell@retotech.se>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5e8b6cf..0db621e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -390,7 +390,7 @@ pkg_postinst_kernel-image () {
 }
 
 pkg_postrm_kernel-image () {
-	update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
+	update-alternatives --remove ${KERNEL_IMAGETYPE} /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
 }
 
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
-- 
1.9.1


