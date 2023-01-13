Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5ACC54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 14:57:16 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.88823.1673621829622126789
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 06:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=diOFSdm7;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id bs20so21322542wrb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 06:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5AZROxZr6yBCGxtVHmib0SaIprk9wKk7Kt/25/6FmI=;
        b=diOFSdm78wOr8/lx6DGX+dLZ8YJaIxoN9tf4qWP9F0oVNJBtg3wvNn8Drl2yyFpizH
         ggu5ZO9osve7P2QBdf/e8+j+2a9IpzE6arZrv/10J+9mfZ/VZKrhL93hDdyNhtY4/p0p
         ZpSX/ZPp1PNGpsrl1MEly93b30pNw+oYqx4ujhUlyrfEZv//06nCs78OQuDrH5VrWP8A
         Vgk7yjlsM5JMXWOE6I88BYiTC0lZr7AZ5laM6WIcJvbh50YQ17e7Sc/oGJtwI0+2ESuv
         28mLGZ1HkMtaI5sVU6x+zmHE/p7gYzcR8R0/QY/212uN/wsJUta0qE/IEYAvfbv0KGxM
         nAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5AZROxZr6yBCGxtVHmib0SaIprk9wKk7Kt/25/6FmI=;
        b=rskGHq77ceJDjH7nJ3VQ5JMIHZifDKqqrsDEneD75ySUgIqvyiIONEslSAhoLiTyDB
         KRxtieE+NSjt+yp/yvcPUA9lku/g1sA16eelQrtqt2IqaO2z95Dd6TtGUhxT0OLGfwpp
         8CFqABtbwmhTmcbdWAUTXYgWnqmzf4awHHVW2j58dJpsyA5rSBVbyoa++uRJsrM8/Ez/
         VG7lhVvmIVMeO0NELKv1qYyPfHxyrekGkgXU36BehlK08ll1m++eU4LpoKhtTUdYHXdW
         kRyA6E8KDhAkjQgqXweI4aUsj599IUBq8TZSc8uoCYTWaUsDfHfH+rMYMrV/ZnJqN2ql
         W3pQ==
X-Gm-Message-State: AFqh2koOzvQsjKq1DT3eoDZFINZg+5G2vIA3OnR4WMkbMZSe18DFhfQg
	Qa3la5Gta1qpV/8hQwOPgS0Tw9Bgses=
X-Google-Smtp-Source: AMrXdXs4oC9cdffpVwvPipsdD+ne1CsRDu7CtRE0w822TJ06yeHm22tnxGTONlnmLtsSM2kuZInE8Q==
X-Received: by 2002:adf:ff8a:0:b0:2bd:db1c:8e15 with SMTP id j10-20020adfff8a000000b002bddb1c8e15mr3463102wrr.51.1673621828070;
        Fri, 13 Jan 2023 06:57:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d20-20020adfa354000000b002bc50ba3d06sm15808417wrb.9.2023.01.13.06.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:57:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/7] webkitgtk: submit a patch upstream
Date: Fri, 13 Jan 2023 15:56:57 +0100
Message-Id: <20230113145700.2773771-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230113145700.2773771-1-alex@linutronix.de>
References: <20230113145700.2773771-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 14:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175831

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-When-building-introspection-files-do-not-quote-CFLAG.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch
index 4ef0dbfe2f..2dab00a075 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-do-not-quote-CFLAG.patch
@@ -31,7 +31,7 @@ Traceback (most recent call last):
     raise DistutilsExecError(
 distutils.errors.DistutilsExecError: command '/srv/work/alex/poky/build-64-alt/tmp/work/core2-64-poky-linux/webkitgtk/2.36.0-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc' failed with exit code 1
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/8290]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 
 
-- 
2.30.2


