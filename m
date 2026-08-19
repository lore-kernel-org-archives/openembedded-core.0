Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7244DC5DF8A
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:58:02 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10415.1787155075964962457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pggjDasX;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so949194f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155074; x=1787759874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Un7AFWwkfD3uHgfQNJNU1JqBF33xYlC0BuNAJ1xv21w=;
        b=pggjDasXKUrQFGsO9sT9GBJlYThGwJ3L6KrR8NphYhaeuIQ0Is+MW0TBRnkNHgcBBQ
         7I2qQ8xLKhlC56HvUg3wiPfkW2GN3X+RfajcHnYjRhNHrRonkzEdXq/G2hodwq7JBh5p
         yHO/Zt6ab8pfeKi+aaOCnxETWAwVEabpq8umQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155074; x=1787759874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Un7AFWwkfD3uHgfQNJNU1JqBF33xYlC0BuNAJ1xv21w=;
        b=D9e9QV0HybkF+hUt1MB0iY1kGiikYX9RY7KPVgGbcRMzwY8Q9aKk7ygVVqWEgoxrfu
         PcA/QedaNOTHcE2OKi33xN2eYYIcdZnMC7r5N4g2y0MdQN+3glW1bN2bE5nVL/H3yul2
         F8ftjZBUmZ04kabdy58WbGgz7IOAl085U7997oTy4sZSeqE+7IsVwNiK/2Aq7Sdv3fAE
         fehED2NjL9DhleS6aR5Ysa1D6Z9kCKXx1BRIrC8oMqfpF+rZnwtQGMit2Q3J/wei2Ym2
         Ym557uJxPxyMc/M92itCS5dXVS3ob7NZNcVe7AdmcYEBJ+xTWI7KlJE6c/eZKx2U9Vbh
         Mm8Q==
X-Gm-Message-State: AFuF++l3l1E+liIYVUNhZXF3AW17b6DGN8ip3iwPR/yL3UdvCvqSd9Wh
	92zFCNHuD/DAYBo+epwGs0mrVqtKCQf1Uj/vjOfqeh3sK/GkgjYEsfpvE8nCY+2/hOhBKWt0cTu
	M1Be+1cM=
X-Gm-Gg: AR+sD117qbbWaojzCM4dOr3wTCcmwYc1rj6JTJQOInPolgBBStZg1WXpPFJg+1k3gpz
	mVtDGykqQ+POFk47LszHR610s9K/tplHKVc3/lLb5QhUrsXjp8LF/M3jqIApVs2SCaDVvoJtpJ3
	U094LoiPhlvBnC7fyWFiTnySOnJfaJ+kaJRzGAloyYMHdCd+QJ3iwhVVi0OAqnLlH6kJBZJ9/PN
	6WXgzLo9svCELbMVGAyGgJbOQwMW3iXIAX/53Uq2a0FUJFgh8njyM7Ze4KcSkDBu3/UwQh1E5yM
	SIOJeoSyq5e+1E3LuWVSdWOOV9P6DiELdOKWX98NJixd0oxynOm662ouVvtS4FdoXpKl4YuUnEq
	HOxMIZjiA+Z3GAMZMiNdKx5yukmRO4nwXWCWBF978xUp2Nqvo+ijOBHi71bKchRMgeWdrpvus4r
	EcR6aJDFJWhZQ+5vZiabeVnrKkGoPMAJ63+gpzEUKB+Fkf42bMjh/xeHhuwvlHTCnJA/dP0HBDK
	DPJW5xMO8NmNcjnrWA0bxGmmyjUqSwNNa4aJw01Iv0PbXy7ilxVNF/fCfU1fE3Iq34BClJpnA1F
	d5wbrpIQ/8PZqOyXI6yfqyENGdZOs2hWmzUHXnRT
X-Received: by 2002:a05:6000:4b0a:b0:481:5f3c:39d4 with SMTP id ffacd0b85a97d-482b1e84439mr11461399f8f.1.1787155074155;
        Wed, 19 Aug 2026 08:57:54 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:53 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/37] flex: update CVE_PRODUCT
Date: Wed, 19 Aug 2026 17:56:58 +0200
Message-ID: <b28a4e5fca085e9aa38af3e368af62b0cafba2f6.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243763

From: Marta Rybczynska <rybczynska@gmail.com>

NVD uses westes:flex for recent CVEs in flex, based on the GitHub repo

(From OE-Core rev: 711e2864b17db92ee1f6b9cfaaa16c7a20ec8331)

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8bb6aa4b4acb16c59b66aa55b33053e3e8749e72)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-devtools/flex/flex_2.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 52543b6e021..e424aa58e8f 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -83,4 +83,4 @@ do_install_ptest() {
 do_install_ptest[vardepsexclude] += "UNINATIVE_LOADER"
 
 # Not Apache Flex, or Adobe Flex, or IBM Flex.
-CVE_PRODUCT = "flex_project:flex"
+CVE_PRODUCT = "flex_project:flex westes:flex"

