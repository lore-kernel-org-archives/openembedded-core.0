Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62865C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 10:07:17 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.84257.1754042828935531322
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 03:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FGLTQyvc;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-af93381a1d2so83719666b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 03:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754042827; x=1754647627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K1XXAN8B98aBqMMQqyubDfZ25gaEl9chpGxHhkhmoFo=;
        b=FGLTQyvc+dAZlv3N24QlVSPepRKfjLpcb+xuib/Bqii2JLVFQ0oUmXEUmBdjUfr8Zv
         5JFI6BfY8HOloNsJxqHzaql1bJ9DObknrAew70ErkKYAxmcX07q94GebvjNxEG7ti9yh
         geogmYfjBWAWcnAhkZUA/79wXCc2zghJ+0Hiy3Xnnaz9nvWUv6ugpiYVsQU3wYyp8hUR
         RG5IVAjHqZ767IZCWti8cszZksKXitFOwmpscp1uJMJAYZnuxBboJKCgNnf6SYiqRlb6
         TafJe0OPPn8xao7ojvUEiJp5kgW16xBQgtmAGzpnEBv7WJPJdT+9v1FEutxoe5UWU3dS
         7HGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754042827; x=1754647627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1XXAN8B98aBqMMQqyubDfZ25gaEl9chpGxHhkhmoFo=;
        b=dllov7dWbaOZ/MRKmMp4AVfwW+kGC19cqMDnXmjYd5+AcDcVV01/qsjGCScj+YzEN3
         4q81JoCYAMi5cd6SMEQr63EFtOxngSvmrILlHi8TkAmt6arRx+fSUVlrt82X7eNXgmJq
         eurThAmYRcJAY3RKqxVPYMPrLFhMAmmeEKxnE2z04nVCuHuUsdEN7i1chpL/vdkYR2ha
         gVsEMeMw+4e0Wv95ZdMItgHfA4hOXWJBknvNuLtaIg9eDmvQurEvhD6RetGu7fbMPUoW
         lRZtMzVd6PZltuOr5mig2+KQii9E5OOZ8F0PczOzm7KRZ+AftZfegF0o8AyTQ+m3lxT5
         joyQ==
X-Gm-Message-State: AOJu0YzUQC8UpbyMCEotyFWQF+7og8hi/XPojjeVVQDsRF9ekWhjW9Vw
	wmGrju+zSQT/zDakxaJbg3jBOcgJoa5Qzsg3zUJhiU6o9DjlxdvdFr/Xf7mLxQ==
X-Gm-Gg: ASbGncthtqSMBKp93fL6Kp48EADY8bd0cn2KaukOVInF4ZisLj61n4EZ+tGdTab8auu
	O9xrl05KG7iMb5Y3dVOzpJiaZP6+CzXRJDFGOB6vx3Rux81XkFu4HhBUttmGsvyIOS9IRYUCA2X
	m4GuIuycfhygvckH2otMvwq5tGIigijzESpHdK7pbQr1TpSTN8XEFOIR8Ix5nSx3dHysx0oTznt
	MzXiD95JKQWFfjPKoKHmOJpl62Rwop/fhq6S5DGe3HKrDO/F977W7XJS8IGCrPmm3HXwo+68FgU
	DNYCcOHjDJdBVhCOGwti1WwEptCfqTT6/hGSxaMghx7QI/ui688gKwssLv16KR1yy8o2Vs/2MJ+
	/2etHWU/gOXP4vDRquMtaATzSqMK2wuY8jvmfGinmVJXinAs7Rvk8PLR5
X-Google-Smtp-Source: AGHT+IG6PXtjcaedm/0JcUh8xcKULoPCOQpbD+AxR0Wh4pNnLbMKLwBGZNullikEIQAcmVlo37kIPQ==
X-Received: by 2002:a17:907:60c8:b0:ade:43e8:8fa4 with SMTP id a640c23a62f3a-af8fd728cf1mr1308434866b.18.1754042826924;
        Fri, 01 Aug 2025 03:07:06 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af91a0771f9sm264742066b.16.2025.08.01.03.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 03:07:06 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	hprajapati@mvista.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH] libpam: re-add missing libgen include
Date: Fri,  1 Aug 2025 12:07:08 +0200
Message-ID: <20250801100708.2925411-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 10:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221226

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

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../pam/libpam/0002-pam-namespace-rebase.patch                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.patch b/meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.patch
index ff5a8a4946..c57011da0b 100644
--- a/meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.patch
+++ b/meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.patch
@@ -714,7 +714,7 @@ diff --git a/modules/pam_namespace/pam_namespace.h b/modules/pam_namespace/pam_n
 index a991b4c..180e042 100644
 --- a/modules/pam_namespace/pam_namespace.h
 +++ b/modules/pam_namespace/pam_namespace.h
-@@ -44,21 +44,16 @@
+@@ -44,21 +44,17 @@
  #include <stdlib.h>
  #include <errno.h>
  #include <syslog.h>
@@ -728,7 +728,7 @@ index a991b4c..180e042 100644
 -#include <sys/resource.h>
  #include <sys/mount.h>
  #include <sys/wait.h>
--#include <libgen.h>
+ #include <libgen.h>
  #include <fcntl.h>
  #include <sched.h>
  #include <glob.h>

