Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9174A616FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 17:46:08 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id g21so1838456qtq.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 09:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4ya7RTRW9xzemtjkDKDi0u6aGjOy9H8UEoUYzQGRUG4=;
	b=J33HVMxwD3+mIKmbKIaFFWGZvM61tKyBW9/kKcSCC7sqPlcuaGTrdYiZirEdjly3Ai
	Ik/FHTtKaM9ww/KTwhgqA0cp24DzzspFpBfN7qH6fQCGLsUNagdknTQSnrLdIPvt01BH
	oeXJP65unW6lmD8/e0BqYqHUSueaUuXrEOFXEr3Zbci10blaQSGmOi4tou8qLxoAf88W
	YOmuuXcrhgeach5tQSpOu44EUuH0wVDK8jOGsWCl6AVE3+KVzOUKNAs+bE6b2DuUwVqm
	H/fClqPcHWFUPMVvJzjenkTMsqpfRTN6jgcypEqyiRBwRlaontSgl/l7MFKneZ3UH0qv
	DP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4ya7RTRW9xzemtjkDKDi0u6aGjOy9H8UEoUYzQGRUG4=;
	b=UUXI+vZhEfNeAcDssHz1KU89ge6mvzXc8/thtGsD37ve4HYVuZo2GzydKxzn8s9TnJ
	uk1RL23GeBIL4uZnRbRa2DThy+UzTBqTOky2FTpFvglRhyYrMQHDO2ZJctONtG7aE/tb
	FfmPzTjUN3GztxwAV07SMgjJMdlMJwF0A34Vx0+er+e2pzG3Er7k6Eg8pFuFctFAn2qK
	FGgjmLA/2+tpzz9MCSNztUNAjazsS3fZM7Yc7lelnNY/wcPhN6R402GqOqpKlvRCge4n
	J4bk9twDEG1rI0U9FrriK1nmmi2c7NcyiCH6owAfZQbZRK3JEFuhAgVbETSjRZwAssm5
	v3yA==
X-Gm-Message-State: APjAAAVLPeKKcaLTcCepZT+Rtj7vMWH8iBYjPyrbPeadsKlcJgyft+BD
	Lf3XMGJvAMyVFBiGN7qzoOo=
X-Google-Smtp-Source: APXvYqxDE3FDqt6l+K7etiyjKEXd/sQmYjDBuwf57xQaHLEBH4wFiJAuRp5veuPDgcom/Q14AxehdQ==
X-Received: by 2002:aed:33e2:: with SMTP id v89mr33161086qtd.162.1582307169428;
	Fri, 21 Feb 2020 09:46:09 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	g17sm1855153qtq.29.2020.02.21.09.46.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 09:46:08 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 21 Feb 2020 12:45:57 -0500
Message-Id: <dc9db6d0065f142c8af01ec188fb0446174f029d.1582306887.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1582306887.git.bruce.ashfield@gmail.com>
References: <cover.1582306887.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] devsrc: fix objtool generation for v5.4+
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
X-List-Received-Date: Fri, 21 Feb 2020 17:46:08 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@xilinx.com>

commit 6ec14aa7a58a1c2fb303692f8cb1ff82d9abd10a [objtool: Silence build output]
was added to -stable in v5.4.19.

This change was meant to ensure that build output was truly silent when required.
But the trailing "cd -" in the tools script was ensuring that a success return
code was always returned from the sync script. As such, some missing files for
x86 were being masked.

We add those files to ensure that objtool can be regenerated as required

Signed-off-by: Bruce Ashfield <bruce.ashfield@xilinx.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 2fa4be67cc..2888236628 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -200,6 +200,7 @@ do_install() {
 	    cp -a --parents arch/x86/tools/relocs.c $kerneldir/build/
 	    cp -a --parents arch/x86/tools/relocs_common.c $kerneldir/build/
 	    cp -a --parents arch/x86/tools/relocs.h $kerneldir/build/
+	    cp -a --parents arch/x86/tools/gen-insn-attr-x86.awk $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/x86/purgatory/purgatory.c $kerneldir/build/
 
 	    # 4.18 + have unified the purgatory files, so we ignore any errors if
@@ -215,6 +216,10 @@ do_install() {
 	    cp -a --parents arch/x86/boot/string.c $kerneldir/build/
 	    cp -a --parents arch/x86/boot/compressed/string.c $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/x86/boot/ctype.h $kerneldir/build/
+
+	    # objtool requires these files
+	    cp -a --parents arch/x86/lib/inat.c $kerneldir/build/ 2>/dev/null || :
+	    cp -a --parents arch/x86/lib/insn.c $kerneldir/build/ 2>/dev/null || :
 	fi
 
 	if [ "${ARCH}" = "mips" ]; then
-- 
2.19.1


