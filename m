Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368E0C0219B
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 07:30:33 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.34520.1738827031943783495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 23:30:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PsWCFobD;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30762598511so6001791fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 23:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738827030; x=1739431830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E86CcozagmLsYaKrTI35C23FsWAcVJRx2zN2PM6uAWY=;
        b=PsWCFobDoKHxZpuS1sJTua6bE5O1LJ+uJ8B9B4uBTugbj3Dv4VdSOejdKZF8iIV4T5
         ID0nDobr45WK1Ndrlvz+DhH7zvgfsaojLMKx/CxhX4QuZVsa2F+vxHu/XgiNthAlrjIS
         cIiEQ/3i9P7dFaYQ6QEJORaJIqHIpR8pQS3EoWYFbqRry/VnQbIUy3Qx69ABSXOJiiEZ
         uprZHVlsH10sJza575wS78bDAx0oJZ3+262NIPBPK7IZOA9yBAAdOkYsyJrwoEwytoo4
         /rg8s5iqP9xgeDw/aRpnVCPaJSIx1amxzn43agx4F2qbAYD+eT4fwXfNzn6tM2+vHhdt
         6/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738827030; x=1739431830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E86CcozagmLsYaKrTI35C23FsWAcVJRx2zN2PM6uAWY=;
        b=tFyZihUXT0bmImSZ3uAhYs+jkio+Xa30W6y0l1IHbmsEt5zt/LFCn5FhfSHDOajVQW
         b5stBZMt3EV3pWdXPWwb3b7xhQzG5av8XhLjOwCIktEoUYviftQqK2h9yUrOoDcDa3wI
         n4h2pIzs9gw2Mhr8QCaBwKg3BfxhGGW730s8innGuzfWK5E4uwU1cMGbLVcV5WhA5uqo
         N++Y3J9rBU5A3zbtO+a1Wf4+M30PpFlWlDoB9O0WoO7c4vwOAsIY0Hn+dq+VFjOZ3FA/
         OEtLBDLU1v3B1Wi/ipxYVDPQ4j9fSiUuFjhYjl1imwQFTevBlTD/N8OWKTJklvRAXipt
         mSmg==
X-Gm-Message-State: AOJu0YxZa86OXtfuTEJxu6/bcdJdXf/v+zTU6c/iddIUf8MAU/4+62kY
	eZE1FY039W8eIE0PxDhSbf2GEq1ki07RzV5VILEt578e11jK+8QCcmLZJb9sj7tDpZrVYK/fWzB
	NULc=
X-Gm-Gg: ASbGncvh1deoTbf16onvcm0CLXCpX073MvNhrwOWpKnepJlCccLvVPQOmxhHTIb1CjK
	YlJ5Q/Pgd7iFNJhOPg/d09LuCaDo3EPTSHhy0KZ0XS5tIuonn/SyklYmVTyOqEYUfzNvAg3eHZU
	9oH9cuSHK0Edwaubi5de2lT7xLGlWCj+M2zQ90jD0lMYMO04w5Eirz6/QLbdtOS7S8/Qm1+JKrS
	aeSuG5BtE4r6hoUDV60WvahJ2E4vMj8pZBRcOnVJqRcJR1GqcqMJl1uE1yKeJHH4hBZGAM4lrUR
	siZIex9VOiRoVVD19tvPUd9DDci4uRNTlEWwn/hn0rG2ruVtclxQMZqVd5zu
X-Google-Smtp-Source: AGHT+IH2N63EE94YdEwnU6b8eCRsM9omNK0Y0HRsxp5zNW9JQDvuM+qgLQsb81qmY+EoIdr7wIW1ug==
X-Received: by 2002:a2e:bccc:0:b0:300:2a48:fb63 with SMTP id 38308e7fff4ca-307cf2fd6d5mr19837221fa.6.1738827029235;
        Wed, 05 Feb 2025 23:30:29 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a67c9sm654781fa.48.2025.02.05.23.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:30:27 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 2/3] uki.bbclass: capture ukify command stdout and stderr
Date: Thu,  6 Feb 2025 09:30:12 +0200
Message-ID: <20250206073013.1280187-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206073013.1280187-1-mikko.rapeli@linaro.org>
References: <20250206073013.1280187-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 07:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210905

ukify tool can show important warnings and even errors
if it fails so capture the logs.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/uki.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index 92f690526d..ccda042ab4 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -190,6 +190,7 @@ python do_uki() {
 
     # Run the ukify command
     bb.debug(2, "uki: running command: %s" % (ukify_cmd))
-    bb.process.run(ukify_cmd, shell=True)
+    out, err = bb.process.run(ukify_cmd, shell=True)
+    bb.debug(2, "%s\n%s" % (out, err))
 }
 addtask uki after do_rootfs before do_deploy do_image_complete do_image_wic
-- 
2.43.0


