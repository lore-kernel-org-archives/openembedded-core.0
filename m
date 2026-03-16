Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286C8F46436
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46896.1773653411529118100
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uCUvqG/0;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso36281745e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653409; x=1774258209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPhMAG4JJ/yZAS1ZJoWCwtOMNBV5F4LoMnGyMw/FFKU=;
        b=uCUvqG/0GOfOBRNimXPQY5ylYgCZYT8X+3XSHsSmNQqNC+FxWGTxSaKCN/AG3KdFUn
         /xlzZ8RBXKIVHfk4iQZYnVh85+d38o6vpNqdVN6Nqck/OH7mx0KVaJPx/Q+asiz6hxbH
         1YyCIaNxRhG5K5QBiDFGe1ZSmXu18U5j9A86U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653409; x=1774258209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RPhMAG4JJ/yZAS1ZJoWCwtOMNBV5F4LoMnGyMw/FFKU=;
        b=mTcx5qHc0b2qLaWqWVPkpqj6S7iAgq0eE2MrYiXpvqgIiRcXtTY0S7C8kwK5nOi9py
         c/7BLwX9gD1xKg8JkubAdYDJlNsswwUOhxALMA/hzSqH8PyxnWB+Bgqy7kzWb6lu95+C
         oBzOvgVuPdFE14UaOyFsUv1gDn70ATFfBZxzYHMxGvklSA0vHDowzFHWdt5NNWw/6y0J
         XGAxyJvGaSXU9PswSn1a5pnq/Ux+IFJOn05McmgcwGE7gG5JvFu25xHJZnDBbvUXTW/0
         rfkn96uWficMqwwp/QCXqxmydwC4j5reTbWZDTWs/t8D4JgHe6PCk0rxUst1nBV3dYp7
         /RRQ==
X-Gm-Message-State: AOJu0Yx0RM1+OPuIG6IxfjhJXlyAF1HPRWSHsWpiR9Na9b8mJE+VoVBg
	notIQFe0DHq2P1jQEUc1lNOzSUaHlLP0apIuYhO9gxw6uyee9Lhi26YfcVqK+t976y25EfOhi92
	RIi+f
X-Gm-Gg: ATEYQzzb8ryGW+XEYoHDWQ7uJOWYL60BZYlQ30VRxEpsU5yoZbG6FRLijeTaPvAyfni
	QFLZKH3W+qeJqLAP6p320RsV5LHR/AiJNn9s//WPdfEOYZ/rJ/FXy/RYQPkhvzHtNV5zPW2vRSO
	CsP+ZOGhhZ7fr0mOKibF3ULVnyO1e+2KU/kxls1tTh6pfJPUDirOmrZf17ETxf+DtDsfcM0LwVz
	FX5mbkn8nlOsWG4t4sKXIpMpAgj5hG8u4j7Erisel0ykUp5FY59EkkDmF0s5SncVLQ/bikm/jWJ
	UAazXkCBYXu407R4Pohqm6b0Rd3YHWq+d4jwYxxZua4HA8Mvr3ETjIehyZLts5E6lJyqA8s7RpV
	0uEpRf1+KCvJe3gmutPXYDatCiLiIqmPCy+rKphJq8X2c6OxrwiOimGYe5qPTjms5wI1n6XEcpz
	p4WwjTk/Ff773pN/xIX54hALzv07NQntToewCjNbmofqIMKg9OO68zGr3p77HKGgFeyBJrptks3
	u/2GcGY/kebk0j2t7+L9wIGyDdFfTG4Cw==
X-Received: by 2002:a05:600c:4f54:b0:485:3b5b:eb8 with SMTP id 5b1f17b1804b1-485567052b8mr202110135e9.26.1773653409535;
        Mon, 16 Mar 2026 02:30:09 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/17] libpam: re-add missing libgen include
Date: Mon, 16 Mar 2026 10:28:31 +0100
Message-ID: <f9eb7094020407cdb6d89f089caae5cd41401ba0.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233233

From: Martin Jansa <martin.jansa@gmail.com>

It was added by original commit for CVE-2025-6020-01.patch
https://github.com/linux-pam/linux-pam/commit/475bd60c552b98c7eddb3270b0b4196847c0072e#diff-05f443e6acbe32a148a45648148739bf6f02f13acc5c20c6037bf933223d4d77
but removed here in the rebase, causing:

../../../Linux-PAM-1.5.3/modules/pam_namespace/pam_namespace.c:326:11: error: call to undeclared function 'dirname'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  326 |         parent = dirname(buf);
      |                  ^
../../../Linux-PAM-1.5.3/modules/pam_namespace/pam_namespace.c:326:9: error: incompatible integer to pointer conversion assigning to 'char*' from 'int' [-Wint-conversion]
  326 |         parent = dirname(buf);
      |                ^ ~~~~~~~~~~~~

Backport 6d88a28ac7b6ff61808eb46e5c85dabd17c77f2e from scarthgap.
It's reproducible with clang-18 from kirkstone-clang18 branch of
meta-clang.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch b/meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch
index 4f5f780f9cc..53ae2bd2eef 100644
--- a/meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch
+++ b/meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch
@@ -1528,7 +1528,7 @@ diff --git a/modules/pam_namespace/pam_namespace.h b/modules/pam_namespace/pam_n
 index b51f284..abd570d 100644
 --- a/modules/pam_namespace/pam_namespace.h
 +++ b/modules/pam_namespace/pam_namespace.h
-@@ -44,21 +44,16 @@
+@@ -44,21 +44,17 @@
  #include <stdlib.h>
  #include <errno.h>
  #include <syslog.h>
@@ -1542,7 +1542,7 @@ index b51f284..abd570d 100644
 -#include <sys/resource.h>
  #include <sys/mount.h>
  #include <sys/wait.h>
--#include <libgen.h>
+ #include <libgen.h>
  #include <fcntl.h>
  #include <sched.h>
  #include <glob.h>

