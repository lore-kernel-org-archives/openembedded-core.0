Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0B56071F23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 11:55:54 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id k11so14203200wes.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 03:55:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rvwfC/LHghvgVL4nZ+wWETD1+uhM8kzGPkFYA+dIxQw=;
	b=XQPwkW8aKw0TbSgxoGaD/a9Fw+jWg64sG3wBieh+dsQ9Wjggkxy1bvvNXTmC3QeztH
	whkJjnT0LRd8c/uaAuUercCsUzRCsTLzStcfjuk4OEKd3ikRht/plVsKxG26gOBCLAEq
	KJqsTiFwuNNGkkGo8WsuskMMavZdG1qlvkXkOrQz3jaRTcBF33n/nPkWSHVLi0jCPGqN
	4GXGY+TB1oq3cGvtGKY2d3U2FdnpY48x6iJtxj+0ES6cJXDqLEfemH9sirgjrAB8CQgV
	PGljjw5nxjcErHt1j7zO88jL+0Keq7ZsrZlR6Zkz+ZSlt6XvSIBJ5tuw0AhNsF4SZIuD
	1eiA==
X-Gm-Message-State: ALoCoQn8Cg+P+rB585pdQ+OWvmESzzqRewzqNeMcWBK0vV/RCalnpDIe+fkxLTgMoYjseG/4p1fD
X-Received: by 10.194.203.234 with SMTP id kt10mr17755229wjc.88.1421322954182; 
	Thu, 15 Jan 2015 03:55:54 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id vh8sm1798509wjc.12.2015.01.15.03.55.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 03:55:53 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2015 11:54:14 +0000
Message-Id: <1421322860-12652-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1421322860-12652-1-git-send-email-ross.burton@intel.com>
References: <1421322860-12652-1-git-send-email-ross.burton@intel.com>
Cc: dvhart@linux.intel.com, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/8] kernel.bbclass: When linux/version.h exists, copy it
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
X-List-Received-Date: Thu, 15 Jan 2015 11:55:58 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Old Linux kernel versions rely on linux/version.h for modules; this
needs to be published for external modules to use. Copy it when
available.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/kernel.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 88356b1..78c8c7c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -252,6 +252,10 @@ kernel_do_install() {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+	if [ -e include/linux/version.h ]; then
+		mkdir -p $kerneldir/include/linux
+		cp include/linux/version.h $kerneldir/include/linux/version.h
+	fi
 
 	# As of Linux kernel version 3.0.1, the clean target removes
 	# arch/powerpc/lib/crtsavres.o which is present in
-- 
1.7.10.4


