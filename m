Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC9FE7719C
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 00:23:29 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.28113.1736641406019040270
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jan 2025 16:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CleLXQCB;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so2601178f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jan 2025 16:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736641404; x=1737246204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVqRKlG3oT993T/82qeH+/U8F2rVr9qNn+bF94eHZ5k=;
        b=CleLXQCBe/NVwq6GGnrCdWo06NpYID+H0QzsmZaGC+Qq7IHqGAt13zTXaE7z7R/ymD
         U6++9HTNvdlr/4vnG7sLJmkznaLKa/sJJcbs6MeK3hYocq+zFK1WLDpboaKpUXzk2uqe
         nTFqiIpSNoW6FOkHM25BTTHGqh7GG6s1/iZaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736641404; x=1737246204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVqRKlG3oT993T/82qeH+/U8F2rVr9qNn+bF94eHZ5k=;
        b=emJ0GvZbuOqrV0J+dl9VwPMUn9Rl/KBPig6lXGD4f1To57XdoD6dp5155Ad3NC3a4X
         sJFEBuaRtP47P5A5G806JTk5paYLcf9R6fRtKNGDtLyizpg1MM1C0r7wYBoL0UfaO+je
         fwp9yDozimOttjXnbeXwICpY7iKTh2bMXzKSMkBKdFN8UC762U/Pv85IQqPNI4oetVEL
         /2XKUKHdpzv4ny8koDWreEB+rvNYZTHtTu+Y24b0w4T2/Y/NUz44Hnbt5Xn7V2bs+ppB
         mAdBdHXAJAAEolE+SYlttqnVxD+VWgln6tH0eZSwUeOe9R4GSonnnp5TdCj4WmZgC8Yq
         ThQg==
X-Gm-Message-State: AOJu0Yw4O323onOluTY/+oe3eFOte8e9ni62YJPGORlrz16ghAB5EEso
	5aEojRVevqCqdc08jaX2XtuzNwasckBR9xdO9vKQdJuGvs82bpcHWAJA4s4rhFR2rjSmD+eKrmJ
	YEDB8RA==
X-Gm-Gg: ASbGncsacxQ/psQGIG1S4HV4Xu95lvyPEZbdu3EDVO25DIeujgoeUcCltEfrimZa9El
	qUpn+hV2xLnL+DAEyTOv+7QlBSBziq7MTP0GZehA9YD8ZFWSsbo0j6umkFnE2xHZarlsgIaMVuA
	dsAm1fsyL9foiOMsBn8ItZd7hKAjay+yLyclb3v46Dk/fzPemUAK9JBudQraWn6Z/dmzlEgDAhs
	ZfJfebza7DTRzmsn5wZRJ0SSBqMb+0BzpGSlOuaFKEhModMHy5JIaGbCuKC1kHfgzcMoRjmXbV0
	Ol5gKMliu4nebUY7zrokFcuoIrEY5H8WgqHzcyPdOZDNIpAxP+Cv7O07/GczFoQ=
X-Google-Smtp-Source: AGHT+IEkgboAhn1WumID1hq2bkwcWKzJbOMSsbh1Ek6u7BIqcBqboGAhFBXQz2s9Jx3o0Cdpu07SQQ==
X-Received: by 2002:a5d:47c3:0:b0:386:3329:6a04 with SMTP id ffacd0b85a97d-38a8732c076mr15330474f8f.39.1736641403798;
        Sat, 11 Jan 2025 16:23:23 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef000bdfc82d7e16362a9.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:bdfc:82d7:e163:62a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e3840bfsm8511048f8f.39.2025.01.11.16.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 16:23:23 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/2] selftest/reproducible: Print full log path on failure
Date: Sun, 12 Jan 2025 01:23:09 +0100
Message-Id: <20250112002310.4045706-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 00:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209674

From: Yoann Congal <yoann.congal@smile.fr>

Printed message looks like this:
2025-01-12 00:40:08,326 - oe-selftest - ERROR - reproducibleA build failed. Trying to compute built packages differences but the test will fail.
2025-01-12 00:40:08,326 - oe-selftest - INFO - Failure log for reproducibleA will be copied to <snip>/oe-reproducible-20250112-mza9w940/bitbake-reproducibleA.log

Fixes [YOCTO #15655] (first half).

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index ee6f8cbdc2..9597d76697 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -318,7 +318,9 @@ class ReproducibleTests(OESelftestTestCase):
                 self.logger.error('%s build failed. Trying to compute built packages differences but the test will fail.' % name)
                 fails.append("Bitbake %s failure" % name)
                 if self.save_results:
-                    self.copy_file(variables["BB_CONSOLELOG"], os.path.join(save_dir, "bitbake-%s.log" % name))
+                    failure_log_path = os.path.join(save_dir, "bitbake-%s.log" % name)
+                    self.logger.info('Failure log for %s will be copied to %s'% (name, failure_log_path))
+                    self.copy_file(variables["BB_CONSOLELOG"], failure_log_path)
             vars_list[i] = variables
 
         vars_A, vars_B = vars_list

