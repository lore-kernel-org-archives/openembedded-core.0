Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03ACCCA472
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 12:47:03 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.17789.1759841218085321265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 05:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GZrNSSxK;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3fa528f127fso4690673f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 05:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759841216; x=1760446016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPn4MSevijL2eg8BwtYSRrTk/4ZLpi7TFaXtwygHfPQ=;
        b=GZrNSSxKQzYOihelVbS1pX+J1ozay3btN21Is1vS+wmXYpvt2mhTYqYWvd7L37Yvh8
         KoikNDGhMsPXduimQSyl7bXafd5Ofi8gmtdyLl6AFOVDGwoImlIWVZE2LIMIVmnWxfsa
         ovnmOPvZDpzQLRklxVLa7iRDiDkyPz/Fkk2gUaslTt1C8G+PdUOqdBpv2iDF06tCBZB/
         JCevZ4Tp6pSWT8s35L5NhwnRFXHENTc5UM0JfdXEJPQThLOIdf5Rx0n867x6sXqpwrxI
         BjuBwdn8nB1RtOasWw+qe+HFIrvG+PindO5t1sw5SAgDxyvI9UXTHIZ/q+2AOB31je56
         zXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759841216; x=1760446016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPn4MSevijL2eg8BwtYSRrTk/4ZLpi7TFaXtwygHfPQ=;
        b=I/Ap4ArOlgYKwlJJ31hALh26oqmtNjmkQh1EvbyadnJulpFSnk0TnnnFlRtcfFxogB
         bEKje8epHHq+PgMjRzBz16r0QKdIvEDnD8zpHgiCsQByXXBH6voDb9yluOiFxsAQWLU9
         5eBHJUm8CvljhvJ+iVIkKiekvZ6n6hqb9BkF6MQbxOwsrOD1i1m+Iy/PAn56lRklE8UH
         jxK46D3mPpj54e6igREhxaSq+UiudzpDN08WOJbQMnVx809+YxNv9IAgG9kC2WgAX54O
         wvGyqFbth+9/Yfhg6pd7OtF77B/k7waZXj2jgIc3TNGo3ij+cI02rk9l1cWCJJHMAcjA
         KGJA==
X-Gm-Message-State: AOJu0YwNIFxvJgSkgi0wI9ARH14v8CuxIRIIEoiP07cr74w1QHu4z2as
	8WiqMFX3WtcL6dotKsXvwUDa2Fd2mFpIceDO7MKXqb9jUIkDMnCzYX+dS9u8Uw==
X-Gm-Gg: ASbGnculORKXzjVtiyqFibOgQ3EUlslp9l1pxv7xxG6SI4TtZKIVDA88huW4iHauRRo
	ripfGA1G/aDi+8UyD3h5IrO7Si7e7IMxpm+HlVfHr0UxiXMflR5kgfBFvIBhDQaxxLwyx+D7V4g
	XVO4mxxHXRtsueXztzKPFLD2w4Xtd28MHUUbqkYkGkNHJtPlm9Iucdf73gsAmEjxVtdEauwXV8r
	+TCJtL969ajVqOIxrPMUz9rjL95nbfEcmljbFr7yqmRKj4Eh6g/3M7A/ubwmQkcMC0RdpmJeFnl
	sM4kR3eVpsSLevhyRxzZ3pTjsi4tK0aXH9t3o9KNF8f4u3m3Te/aQQQoENLiEbxRqmPBIxAYi9c
	Mv5ukjkfUCaq5qy86Sdx8yz196Q9nFfw3+4XiknMGRhvJ9nnjgGYBtqI6LZF1R7PkWXjj87dhAM
	MBjz9Ex+4yXyN8NFx6CYR7t0RGlmAWIc88IJff3Kh3WiJuCs6KXelr+jpnhUPz2O/+Xh83kRAFz
	Q0ujHkbdQ==
X-Google-Smtp-Source: AGHT+IFrQhP6S431fM1RW8MXbadDRqY/E1XsWtCjzBxxoklY27LVuA8ZhCzQOAYpAuMrE50pOvnY+w==
X-Received: by 2002:a05:6000:24c4:b0:3f4:ad3f:7c35 with SMTP id ffacd0b85a97d-42582a0534bmr1975669f8f.27.1759841216077;
        Tue, 07 Oct 2025 05:46:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e7234f547sm222707325e9.9.2025.10.07.05.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 05:46:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] runqemu: ensure that bitbake environment is either returned, or an exception is raised
Date: Tue,  7 Oct 2025 14:46:51 +0200
Message-Id: <20251007124652.259629-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251007124652.259629-1-alex.kanavin@gmail.com>
References: <20251007124652.259629-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 12:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224532

From: Alexander Kanavin <alex@linutronix.de>

This eliminates the other remaining code path where environment getter
returns 'nothing'. This and the previous patch were tested in a-full,
and no errors occurred [1], which means the code paths that make
use of the function returning nothing are never actually executed
and can be cleaned up (in the following patch).

The rationale is that if environment getter cannot obtain the environment,
it should report that and not sweep the issue under the carpet;
it's up to the caller to handle that situation, or make pre-emptive
checks that avoid calling the environment getter when it is bound to fail.

[1] https://lists.openembedded.org/g/openembedded-core/message/223651

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/runqemu | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c28980e6163..1e8406e1194 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1745,11 +1745,7 @@ to your build configuration.
                 cmd = 'MACHINE=%s bitbake -e %s %s' % (mach, multiconfig, target)
             else:
                 cmd = 'bitbake -e %s %s' % (multiconfig, target)
-            try:
-                return subprocess.check_output(cmd, shell=True).decode('utf-8')
-            except subprocess.CalledProcessError as err:
-                logger.warning("Couldn't run '%s' to gather environment information, giving up with 'bitbake -e':\n%s" % (cmd, err.output.decode('utf-8')))
-                return ''
+            return subprocess.check_output(cmd, shell=True).decode('utf-8')
 
 
     def load_bitbake_env(self, mach=None, target=None):
-- 
2.39.5


