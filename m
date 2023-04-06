Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F98C761A6
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 14:19:45 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.159531.1680790784395228820
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 07:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=c5cF/8E/;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id n19so22698107wms.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 07:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680790782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFMC2JfPZXz/o7zeVUBfjoMdUQkVczXC48R61x4pDIs=;
        b=c5cF/8E/n8b/2ZHdmyzdqaXFILkbpcEv9kwQo9N4HYLx4RzAHEpPCRXS49uKZSkqY/
         HNAy1w5bhNAJB4e3OaHS07/w2vM8UN/MgQq2XvJJ8wCgUWV+CKEoESOIFUWGyRffebrj
         QEAvwCA+0BIB8EfO+70uykwirq0fURGM2bO8v2c7N9p7NJqBNEp5W6xCdT+wxVBI9yuR
         TqCdCxzTyTkNXzXobBeS+X+FPy1axhOalmnTAXsEQfBvRw8JDgAu4GJBXe+bUmf5gm23
         9XAcy2Y2K/6UyvuisKS79IJhWqft4XwJ69eS9MqMxTRMo8u2MJf1fKngXMx8S0zk1aIO
         LqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680790782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFMC2JfPZXz/o7zeVUBfjoMdUQkVczXC48R61x4pDIs=;
        b=LXZUjVCrMHNhbn9PJup9T0SR8T6fE1dqByEYLxauxzWyngqopmfif6QjWpgd3hpbbi
         UGgXPROv5XUha2leB34DLCbs1Yfypndx2lA9acOi0TSM0yydoqr3QaCyKKI+gO10koeS
         sirdHo6/XD6M+EpuXtBkSJCp0trId3P1G37+TWpy/bxyB835BT+xIMLOL6x27zL/LP5z
         XcGiRFJyhjn4XvAtuUNZENw5K+oyGacDQv+UrRx2kt6n4P90iL0F2LAUvcP1+ty9NwWk
         2CdYhGvzflDtLq5wAsj70eHLeZEAgpeYXlzFk8/Xq9gDq6ZJ9HfxLs7PxyuZsUdQveTL
         MzOA==
X-Gm-Message-State: AAQBX9dKJE+2Mm97UPGoigIzyu4Agvi+AI+zD2zpf3bomwaXp3e3NzU1
	1DRPulXLCdnwzEGMaL0EnnhnZBoGpmus4G4Q52M=
X-Google-Smtp-Source: AKy350axHrhiEIizYskTr0LTRK15WVcGG19BkofLwOk9CYIxtCkUouTmXJbvrp/lcos+xA3tEZqBZg==
X-Received: by 2002:a05:600c:220c:b0:3dc:557f:6129 with SMTP id z12-20020a05600c220c00b003dc557f6129mr7600535wml.2.1680790782609;
        Thu, 06 Apr 2023 07:19:42 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id k23-20020a05600c0b5700b003ee44b2effasm1748331wmr.12.2023.04.06.07.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 07:19:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Frank WOLFF <frank.wolff@smile.fr>
Subject: [PATCH 2/2] cve-extra-exclusion: ignore disputed CVE-2023-23005
Date: Thu,  6 Apr 2023 16:19:23 +0200
Message-Id: <20230406141923.419980-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230406141923.419980-1-yoann.congal@smile.fr>
References: <20230406141923.419980-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 14:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179776

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Frank WOLFF <frank.wolff@smile.fr>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 0b89598501..439d569f7d 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -485,6 +485,16 @@ CVE_CHECK_IGNORE += "CVE-2023-1281"
 # Backported in version v6.1.13 747ca7c8a0c7bce004709143d1cd6596b79b1deb
 CVE_CHECK_IGNORE += "CVE-2023-1513"
 
+# https://nvd.nist.gov/vuln/detail/CVE-2023-23005
+# Introduced in version v6.1 7b88bda3761b95856cf97822efe8281c8100067b
+# Patched in kernel since v6.2 4a625ceee8a0ab0273534cb6b432ce6b331db5ee
+# But, the CVE is disputed:
+# > NOTE: this is disputed by third parties because there are no realistic cases
+# > in which a user can cause the alloc_memory_type error case to be reached.
+# See: https://bugzilla.suse.com/show_bug.cgi?id=1208844#c2
+# We can safely ignore it.
+CVE_CHECK_IGNORE += "CVE-2023-23005"
+
 # https://nvd.nist.gov/vuln/detail/CVE-2023-28466
 # Introduced in version v4.13 3c4d7559159bfe1e3b94df3a657b2cda3a34e218
 # Patched in kernel since v6.3-rc2 49c47cc21b5b7a3d8deb18fc57b0aa2ab1286962
-- 
2.30.2


