Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id CC38C72914
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 17:25:23 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id i13so3553528qae.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 09:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=RHUC8vs4vfFJ/P5b7Rgos4tHfzgv2vRrjYDHuSShvQc=;
	b=Je97lxdRfKPc8kTVzIv40ricqwCHJoZCmRCSsXw0hMJ3j+bkYP6W2BRH783PJaBGLH
	x2Sx0Au6uJNNxtaQd+bxvQEw2ggRiKTJpXbSbGxcDAhTC7oXMWvVWUmTaRPGdRuJbGIZ
	ZVlh9d0oFoWUI2ThgyirBYnwUBUblq/c31fEHXoPfCwB6F65L1uEuJXm7S4YTMWfljAf
	/KeyJJIFJPkAuIobGn2NtPI6vXS9IKEZmxJGGCrehNvrBP+Wn+SVQ9oh2c0mIcwxOak7
	GmSmIMXhr2s4Lf62qhhTVJKb/PpklYdOPyD5+8lAyWW+rNrsg5SCzgsLsBa8ad/hRv1V
	5onA==
X-Received: by 10.224.51.11 with SMTP id b11mr6528387qag.43.1420651524124;
	Wed, 07 Jan 2015 09:25:24 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id r9sm1799364qak.2.2015.01.07.09.25.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 09:25:22 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id EBDE61CA798EF; Wed,  7 Jan 2015 15:25:19 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  7 Jan 2015 15:25:19 -0200
Message-Id: <1420651519-25240-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1420651519-25240-1-git-send-email-otavio@ossystems.com.br>
References: <1420651519-25240-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/3] kernel.bbclass: When linux/version.h exists, copy it
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
X-List-Received-Date: Wed, 07 Jan 2015 17:25:26 -0000

Old Linux kernel versions rely on linux/version.h for modules; this
needs to be published for external modules to use. Copy it when
available.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/kernel.bbclass | 4 ++++
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
2.1.4


