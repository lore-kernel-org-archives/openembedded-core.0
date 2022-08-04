Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5499DC25B0C
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:58:15 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.694.1659653887993754044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qd6Ky8M2;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id bz13so937478qtb.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=H8cOAWGqui7wicOTsYhNt8ra+43+aViylN+P8153j6s=;
        b=qd6Ky8M2rY0+SWeYUV88J+r+ejHFxuQ1AOV+wzzQTBpQbPFGJJYOXM5kXTUtXrlL/t
         1dMpEjpiQr/6weUu4NjRSUcX28Hqpr+31zJXGOIoFdzTdkAO/oAcLrSQ5xZxNZK+OVxa
         PIdb1nfmpuHUaybe8Pv1CFy9lmmh2JE36x41AYW6ojmW/X63oOnOczLwdlXg0roAZ+LP
         P9u68ccSJktZpfX3HhqwkkMR+E7kQB5SoG41At46kQNr2rnPCMAWqECRWU6FilXQ44UE
         4B0UrMNxedstQ5awPgEYJAelO9qGlSUl7cfa6Rfif6WrSzEmRn6WPjChzSVz8wNFWo/e
         EKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=H8cOAWGqui7wicOTsYhNt8ra+43+aViylN+P8153j6s=;
        b=WzrQ7S6poR1iTLuYWc+zjLkcQO3xpw9vwzGMpMhWJO5uWnLM7Ghgzzsdf70P3lFyGI
         5sa4QuGY9SkczBNWNABHBl6xaNye/3U/sLP8xmpzG/h2e1FYYRDgutM+OyTxSnUqDDNr
         Q30lOW7Cag+w9G61ifKL//eIGLgztD4bVnnpUv5W5wqqN2+ftpAxnpM9I6VtjDOf76VT
         nHiwRwOaLt9fhCybpkMk9PmV7tvSjhQT1A0UvDQXetm+6YIPB5N1vb9F6ZVcE1JS3qt6
         rOq6jLw56uUenkwug2GwY/PAhkRkYFx7wip370HLM6jCuUbl39GbC2HYrWAfHnOC/qjZ
         uomQ==
X-Gm-Message-State: ACgBeo1Afwa2blJp1An/AqhuyLCtlwUjOmIQkt1l7zCZZU584oqOvfR8
	Y/eKEmFPLvj8RIEsdkQJgfpicEMyDAZyUg==
X-Google-Smtp-Source: 
 AA6agR5PwzSXkiSmwgqsAnqEd8Y1no7r/4ey+kLRhB9ai9JedWjQCFE9luj1JtTUVhgGXnpx5kItkQ==
X-Received: by 2002:ac8:5882:0:b0:31e:e175:8351 with SMTP id
 t2-20020ac85882000000b0031ee1758351mr3687984qta.71.1659653886992;
        Thu, 04 Aug 2022 15:58:06 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bl38-20020a05620a1aa600b006b8df80471csm1500818qkb.119.2022.08.04.15.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:58:06 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/13] kernel-devsrc: support arm v5.19+ on target build
Date: Thu,  4 Aug 2022 18:57:44 -0400
Message-Id: 
 <002c31d6add77e1002fb1ccd4050ce826a654170.1659653543.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1659653543.git.bruce.ashfield@gmail.com>
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 22:58:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168871

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Adding two new tools required for 'scripts prepare' on arch arm
and arm64.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index f8f717199c..165589bf36 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -180,9 +180,16 @@ do_install() {
             cp -a --parents arch/arm64/tools/gen-cpucaps.awk $kerneldir/build/ 2>/dev/null || :
             cp -a --parents arch/arm64/tools/cpucaps $kerneldir/build/ 2>/dev/null || :
 
+            # 5.19+
+            cp -a --parents arch/arm64/tools/gen-sysreg.awk $kerneldir/build/   2>/dev/null || :
+            cp -a --parents arch/arm64/tools/sysreg $kerneldir/build/   2>/dev/null || :
+
             if [ -e $kerneldir/build/arch/arm64/tools/gen-cpucaps.awk ]; then
                  sed -i -e "s,#!.*awk.*,#!${USRBINPATH}/env awk," $kerneldir/build/arch/arm64/tools/gen-cpucaps.awk
             fi
+            if [ -e $kerneldir/build/arch/arm64/tools/gen-sysreg.awk ]; then
+                 sed -i -e "s,#!.*awk.*,#!${USRBINPATH}/env awk," $kerneldir/build/arch/arm64/tools/gen-sysreg.awk
+            fi
 	fi
 
 	if [ "${ARCH}" = "powerpc" ]; then
@@ -210,6 +217,9 @@ do_install() {
 	    cp -a --parents arch/arm/tools/gen-mach-types $kerneldir/build/
 	    cp -a --parents arch/arm/tools/mach-types $kerneldir/build/
 
+	    # 5.19+
+	    cp -a --parents arch/arm/tools/gen-sysreg.awk $kerneldir/build/	2>/dev/null || :
+
 	    # ARM syscall table tools only exist for kernels v4.10 or later
             SYSCALL_TOOLS=$(find arch/arm/tools -name "syscall*")
             if [ -n "$SYSCALL_TOOLS" ] ; then
-- 
2.19.1


