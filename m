Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474DEC43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 16:27:16 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.8226.1655224034596559089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 09:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GgyXEqUL;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 r123-20020a1c2b81000000b0039c1439c33cso5087386wmr.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 09:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QzRvlz9JijjwlneafvCuwNCBGok9U8JjkboeIiOGo+s=;
        b=GgyXEqULAlh1+BxKkh3Ypl8uHP+q6rE6ApboNkkm1Z/3UtcgdlXkGMiirnigHbbUmj
         7Qoa1kNkMASlHnCM+XAR/EHrKr54tfMIHerpfjtZpOVg3dpfqnhz1oLJ7cZqbjCpZuqq
         UsS+e+GMC8HTf//5tGKCXv2iJmHVEQFNJf72ODyXduZWBAtptZQ6FKUIY1YVpbfam6YQ
         D9iPF7o8fJrv/Y2aQOwRKDwYhZG7w7A2e2Ganx/QW/MC73ZKontUq+ffLferdgk83jY4
         EcYwT/hAHkGEHrgoxf1C0gvJdmTrgCoTR9G5lajQ36cQSpJ6uXtO1f/9R5CmzloxHq8L
         UQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QzRvlz9JijjwlneafvCuwNCBGok9U8JjkboeIiOGo+s=;
        b=oZnVVfcLzswxyfVXwe44smTWic+ANodA6Q1W3soFWmmhREUd3rJnwSoKc+nJ1r6qXb
         Hj5zj/WviVQJTeNFCe7G0x7dveYKTmVFdSxnNNObfD/snVEylKYyj326W/7KR/MnszEK
         JVgBIiq7W6z/RlvDs9aoFDdvoVbXbRdTk4rk2z2ah7oOeDj0nMWx44MeFSP8VCXIwMCE
         J/kER+C0IpQqcfF7Mq9oknhHpvknnnxnsRCcpSh/caUZjyGMuZi/yP+0XJuM8/TWaynW
         m7YoioWDHjrDgBzM0D1WiOfX55nDYSnZGn12laug2sahVJCq5U6B7rRB9sCTZ0d9gdIN
         YttA==
X-Gm-Message-State: AOAM530a7Kv0ymA8PBftIxfO1LIIlzI3um84BbHV7ZfiO841MpK5/wpq
	QCOGBx87QPrLpmZEVzqpN+V/tODIMztuqg==
X-Google-Smtp-Source: 
 ABdhPJwA7THdxE1KRn4F8242eiZF1kowfd58gO0J2dxXDxVhmLuHVq8UMULQ0MHKedpMflbIRrKjkg==
X-Received: by 2002:a1c:2504:0:b0:397:288c:c58b with SMTP id
 l4-20020a1c2504000000b00397288cc58bmr4997847wml.53.1655224032856;
        Tue, 14 Jun 2022 09:27:12 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 i20-20020a1c5414000000b0039c41686421sm17410691wmb.17.2022.06.14.09.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 09:27:12 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	daiane.angolini@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v4 2/2] archiver: don't use machine variables in
 shared recipes
Date: Tue, 14 Jun 2022 17:24:38 +0100
Message-Id: <20220614162435.202899-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220614162435.202899-1-jose.quaresma@foundries.io>
References: <20220614162435.202899-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 16:27:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166904

When using multiconfig with the same TMP folder we can have
races because the shared recipes like gcc-source run twice.

ARCHIVER_OUTDIR = ${ARCHIVER_TOPDIR}/${TARGET_SYS}/${PF}/
which includes TARGET_SYS and between the two different MACHINE values,
this changes  from 'arm-poky-linux-gnueabi' to 'aarch64-poky-linux'.
This leads to the task running twice, once for each multiconfig.

To solve this we need to store the shared output in a common place
for all machines and in this way the stamps will be the same for each
machine so the gcc-source will on run once regardless of the machine used.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

 v2: replace "bb.error" with "bb.fatal"
 v3: instead of failing make it more resilient
 v4: fixes the stamps

 meta/classes/archiver.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 8d026067f4..33070cd17f 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -55,9 +55,10 @@ ARCHIVER_MODE[compression] ?= "xz"
 
 DEPLOY_DIR_SRC ?= "${DEPLOY_DIR}/sources"
 ARCHIVER_TOPDIR ?= "${WORKDIR}/archiver-sources"
-ARCHIVER_OUTDIR = "${ARCHIVER_TOPDIR}/${TARGET_SYS}/${PF}/"
+ARCHIVER_ARCH = "${TARGET_SYS}"
+ARCHIVER_OUTDIR = "${ARCHIVER_TOPDIR}/${ARCHIVER_ARCH}/${PF}/"
 ARCHIVER_RPMTOPDIR ?= "${WORKDIR}/deploy-sources-rpm"
-ARCHIVER_RPMOUTDIR = "${ARCHIVER_RPMTOPDIR}/${TARGET_SYS}/${PF}/"
+ARCHIVER_RPMOUTDIR = "${ARCHIVER_RPMTOPDIR}/${ARCHIVER_ARCH}/${PF}/"
 ARCHIVER_WORKDIR = "${WORKDIR}/archiver-work/"
 
 # When producing a combined mirror directory, allow duplicates for the case
@@ -101,6 +102,10 @@ python () {
         bb.debug(1, 'archiver: %s is excluded, covered by gcc-source' % pn)
         return
 
+    # TARGET_SYS in ARCHIVER_ARCH will break the stamp for gcc-source in multiconfig
+    if pn.startswith('gcc-source'):
+        d.setVar('ARCHIVER_ARCH', "allarch")
+
     def hasTask(task):
         return bool(d.getVarFlag(task, "task", False)) and not bool(d.getVarFlag(task, "noexec", False))
 
-- 
2.36.1


