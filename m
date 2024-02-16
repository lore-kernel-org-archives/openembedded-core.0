Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC12C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 13:12:40 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.18426.1708089150153462903
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 05:12:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YYw7yFI2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41242d2f73cso4195685e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 05:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708089148; x=1708693948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kF7nyulRFWwy5gs758g5+yOUz+XvDbzVRBq60vi/lfc=;
        b=YYw7yFI2ZVsmwsxOVzfydRJ6FlGrX22RItrSZym/C2ZswLsdeJjfXf4M8yvy8F5Udb
         ZxEBvu793AKnJQXpKNYXTLN3SrjtMzbiQNbWRtHCKqvdDTFrCI2135NfnxIqXPuV3ziQ
         cWhHwb5ZBYktNQg8p9p6kxlV+Sdq8x5NbPerI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708089148; x=1708693948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kF7nyulRFWwy5gs758g5+yOUz+XvDbzVRBq60vi/lfc=;
        b=mcCPRM6t9W8dNfQu6h24MB7ktXkCxNDXVzDORFASJ8oXL328U2CQUBhuzrPqbTxBw1
         VKVV3AFwuMlKan6kaEM/3x+wEdTCWaoAJzO8sCsUX6v1VXez3P8/zjMehms3IbxNXA3r
         YHXXBF1rIhZo79J9ChFe/0ifUHXKXscZf5IlQ59QQr1IdD29l9aZOapIiqO5DK3FqML4
         Ze+80M5CvFHVUS5NbP9rWZNRVR/tvGy6LcZMxvFnXpb9X6WvE3Z7dsSFhr8g9+mbPd1U
         Pw4jh0zTpzkR9lVItDLNlftC1pkGOL9zEWcsSQB0CF290qq/CoLKZrUkKbzJXSnvFj12
         1Obw==
X-Gm-Message-State: AOJu0Yyw+QkQJuR/7ToerpKWjD0ioAMUuLdPUSt255W4+Jt39iVTjf0o
	dYBa50Te24KFIHA8wZwm83Ijj3hv0NEebFQgAwK8mYZZ0VH0N5K2Hd2Vr3EeME9dFcU4xtrgPuh
	3
X-Google-Smtp-Source: AGHT+IFB5MB33ITFqz9MG8qPFfIsnmeYR11AfpQNLcbK2eUQ8QQYCGLldmHPdzRZhsH6DMeGDaO6Ig==
X-Received: by 2002:a05:600c:5490:b0:412:1f3f:db39 with SMTP id iv16-20020a05600c549000b004121f3fdb39mr3348393wmb.32.1708089147901;
        Fri, 16 Feb 2024 05:12:27 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fd13:6695:6348:c567])
        by smtp.gmail.com with ESMTPSA id p17-20020a05600c469100b004120b4c57c9sm2364501wmo.4.2024.02.16.05.12.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 05:12:27 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-devsrc: Improve vdso-offsets handling
Date: Fri, 16 Feb 2024 13:12:26 +0000
Message-Id: <20240216131226.124806-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 13:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195764

Fix:

kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/modules/6.6.15-yocto-standard/build/include/generated/.compat_vdso-offsets.h.cmd in package kernel-devsrc contains reference to TMPDIR [buildpaths]

by adding to the list of files we do this with. Also drop the
conditional since rm -f handles this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 55cac1fc817..fafab475f3f 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -130,13 +130,10 @@ do_install() {
         # breaks workflows.
         cp -a --parents include/generated/autoconf.h $kerneldir/build 2>/dev/null || :
 
-        if [ -e $kerneldir/include/generated/.vdso-offsets.h.cmd ] ||
-             [ -e $kerneldir/build/include/generated/.vdso-offsets.h.cmd ] ||
-             [ -e $kerneldir/build/include/generated/.vdso32-offsets.h.cmd ] ; then
-            rm -f $kerneldir/include/generated/.vdso-offsets.h.cmd
-            rm -f $kerneldir/build/include/generated/.vdso-offsets.h.cmd
-            rm -f $kerneldir/build/include/generated/.vdso32-offsets.h.cmd
-        fi
+        rm -f $kerneldir/include/generated/.vdso-offsets.h.cmd
+        rm -f $kerneldir/build/include/generated/.vdso-offsets.h.cmd
+        rm -f $kerneldir/build/include/generated/.compat_vdso-offsets.h.cmd
+        rm -f $kerneldir/build/include/generated/.vdso32-offsets.h.cmd
     )
 
     # now grab the chunks from the source tree that we need
-- 
2.40.1


