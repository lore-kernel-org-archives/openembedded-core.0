Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76ECC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 13:19:58 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web08.25127.1659964796044757972
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 06:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=igdLYKin;
 spf=pass (domain: gmail.com, ip: 209.85.160.53,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-10ea30a098bso10474143fac.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 06:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NJOUIXI2Fn2GQteAo25bzPC2N5X2UEKn62Cf+xNNovU=;
        b=igdLYKinbQdUcdszJSHCS/pEz7jk0hR40VwuWA/UeDiXqRHBXHcklEbtL8lz3uh4VW
         PZd3U28mpS1XxS4Z+X/eGp1Idf8104LmO6bUduAnoRgg6irfgMSMDeZmg+9Fv1AipNOB
         NVFr+b8M0W0O9uiJwjFealUwdVh4S7QMlGRUwL/TS/I3/wAKLrRsBWcrOD/Oov1dUVHR
         PN6Jv489sTD1LoNbWiMJbOQTP+zTAkoF692n/jqac+K4bn2xV5HuOR2uzlMugItbkQfC
         j0jTY9gm420gkpmVFCo7IK5EgY8rt3uYJTDR7BeIXIw8pvUD45oYCnL3odCS1aybZT29
         L3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NJOUIXI2Fn2GQteAo25bzPC2N5X2UEKn62Cf+xNNovU=;
        b=fxDiGFEFWUwsy1qTyxctz9YT5hPiCXnstD/zUdnoNROygNTKZZwrpi6qUud6da/OVS
         qtMW4LhjwzCj2x0Vb+8fsFlrqFThb5i/lkNqhDWY51Y+3n2fzerw2qM4GHOf3ZqPVVwP
         aMNH+Bt8BmT8vmLKZZlxx22er9j8cExygyqmlYw1UFhxdN8uaRr+YwC0B7TAA30HRiMB
         kImskdjqQ9JrerSwfdbBcgue5ZPFnUpdOXqRqXsrAsO1mzwpgigfFlPLXAtnlhaY4AiS
         J/O5khYx7/Al6efoxKVvWEYwdrsfQBiLxbygfccnTwGPrA1Lk18w0dmzkU6OCRDmAWTE
         C/Rw==
X-Gm-Message-State: ACgBeo2lFkJzD6yPLBUvcCIPzmt6MNob+5B+uvABstd9OhTTfPU0Geqa
	yTCSn8A1ngO3B8cLIlxSUY0rLN0JdtA=
X-Google-Smtp-Source: 
 AA6agR5JGSH33CWaAiMttH+HSdQZFcWvT5zH5u3GqhB3BKnFk13vcFgKQQnC8RMH07hK4Tm+gKOUAQ==
X-Received: by 2002:a05:6870:c141:b0:10d:ab80:8006 with SMTP id
 g1-20020a056870c14100b0010dab808006mr12301102oad.87.1659964795026;
        Mon, 08 Aug 2022 06:19:55 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 s23-20020a056808009700b00342e4388468sm853442oic.10.2022.08.08.06.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 06:19:54 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: luca.ceresoli@bootlin.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/sanity: De-golf regex
Date: Mon,  8 Aug 2022 08:19:51 -0500
Message-Id: <20220808131951.2029559-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 13:19:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169085

The regex to match github or gitlab was unnecessarily shortened, which
prevented them from showing up when grepping.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 37e10ad850..b66926f540 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1335,7 +1335,7 @@ def unpack_check_src_uri(pn, d):
         oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
 
     for url in d.getVar("SRC_URI").split():
-        if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url):
+        if re.search(r"(github|gitlab)\.com/.+/.+/archive/.+", url):
             oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
 
 python do_qa_unpack() {
-- 
2.33.0


