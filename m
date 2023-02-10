Return-Path: <dzagorui@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166B1C05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 17:30:27 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.web10.22806.1676050222408502148
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Feb 2023 09:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=hYKBGPCb;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1192; q=dns/txt; s=iport;
  t=1676050222; x=1677259822;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gzC62INdnn1L7ZW0C4Yl/zo3nbG3CNpLgq+z3ruh9gc=;
  b=hYKBGPCboHeYomWMr6KRR/SotzAWr1r073t1g6MzXfm2AEQyASrJrBSl
   lm9Z2mnwXSeeC8QpRFVayg3nhmHlRwt7CtH7ZAzretVRV9YDwS3knDql2
   7edUru2i5pjZ5mTp3CckzZNLmY6cFyAeORYkq/CzalimA9dQdccj+Hr8K
   4=;
X-IPAS-Result: =?us-ascii?q?A0DXAQADf+ZjmI9dJa1agliDNlU+RpNNn2mBJQNWDwEBA?=
 =?us-ascii?q?Q0BATUPBAEBijYCJTYHDgECBAEBAQEDAgMBAQEBAQEDAQEFAQEBAgEHBBQBA?=
 =?us-ascii?q?QEBAQEBAR4ZBQ4QJ4VoDYcOAYFTRIJ+AYMiA64ggiyBAYRymmeBZ4FAi2eFR?=
 =?us-ascii?q?SccgUlEgRWBGIJQhRGFcgSCKJM/gTZ3gSQOTHiBCQIJAhFzgRkIaIIBAwkDB?=
 =?us-ascii?q?wVJQAMLGA1QEyw1FiQGPwYCDx82BgMJAwIhS20vEhIFAwsVKkcECDYFBk8RA?=
 =?us-ascii?q?ggPEg8sQw5CNzQTBoEGCw4RA1BDGW0EggoKVpdNghZ7E0xTKMRdhACLYJR4G?=
 =?us-ascii?q?jKpLgEtlyWjBD+EKwIEBgUCFoFpDSaBWzMaCBsVgyIJSRkPjjmCNJEGRDE7A?=
 =?us-ascii?q?gcLAQEDCYwpAQE?=
IronPort-Data: A9a23:TNkVr6NL7fulrnnvrR3Wl8FynXyQoLVcMsEvi/4bfWQNrUok0WFVz
 TMcWjjUb/eJYWDze94lao7gpxgP75CGndI2SHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCcaphyFBcwnz/1WlTbhSEUOZqgG/ytV4YoBggrHVU/EH140Uo58wIEqtcAbeaRUlvlV
 eza+6UzCHf9s9KjGjtJg04rgEoHUMXa4Fv0jHRnDRx4lAO2e00uMX4qDfrZw00U7WVjNrXSq
 +7rlNlV945ClvsnIovNfr3TKiXmTlNOVOSDoiI+ZkSsvvRNjn0J9LkHL6ZAU0t4sgiqrcEsw
 9J2tYPlHG/FPoWU8AgcewNTHyc7Nqpc9fqYZ3O+qseUiUbBdhMAwd03UxpwZtJeq70xWD0Vn
 RAbAGhlghSri/C/z7WhV+hEjcU4J86tN4Qa0p1l5WyGUKd5HcibK0nMzYYF9zkzopFjJqbbW
 tgoYyNfaSSHWgIabz/7D7pnzLv32RETaQZwr0qYo6cy6WXfwAF9lbPqKtf9ft2RWd4TmV6Vo
 G/D9Wn1DhwWctuFxlK4HmmEnOTDm2bwX5gfUeL+/f9xi1rVzWsWYPELabeliaiCrFGCQI4DE
 UA7wxcNn7lv/0uQTsaoCnVUv0W4lhIbXtNRFcgz5weM1rfY7m6l6o4sE2IphDsO6ZNeeNA66
 rOat4i2WmE34dV5XVrYp+jE92rjUcQABTZaPXdscOcT3zX0TGgOYv/nVN1vFuu+icf4XG62y
 DGRpy94jLIW5SLq60lZ1Q6f695PjsGZJuLQ2ukxdjj0hu+eTNX8D7FEEXCBsZ59wH+xFzFtR
 kQslcmE9/wpBpqQjiGLS+hlNOj3uKvUbmKA2gY3Q8lJG9GRF5iLIN44DNZWeRkBDyr4UWSBj
 LL74FkIv8YDYBNGk4cmOtnZ5zsWIVjITIS5Ca+8gitmaZlqfwjP5zB1eUOVxAjQfLsEz8kC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eFwnEgWmziMLa0XOjz6i9JyklbPF+dcWLZPB8hkhJ65TPL9q
 IgGbpLSmk0BD4UToED/qOYuELzDFlBjbbieliCdXrPrztZOcI35N8Ls/A==
IronPort-HdrOrdr: A9a23:PdQ1jK+wobWzrIlNaqpuk+DNI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcK67WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0WMnqAeQfxEXMYVmpM
 JdT5Q=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.97,287,1669075200"; 
   d="scan'208";a="57597400"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
  by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 10 Feb 2023 17:30:00 +0000
Received: from sjc-ads-9103.cisco.com (sjc-ads-9103.cisco.com [10.30.208.113])
	by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 31AHU00u027937
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 17:30:00 GMT
Received: by sjc-ads-9103.cisco.com (Postfix, from userid 487941)
	id C2BBECC1293; Fri, 10 Feb 2023 09:29:59 -0800 (PST)
From: Denys Zagorui <dzagorui@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-devsrc: powerpc: add missed dependency for modules_prepare
Date: Fri, 10 Feb 2023 17:29:58 +0000
Message-Id: <20230210172958.3201956-1-dzagorui@cisco.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.208.113, sjc-ads-9103.cisco.com
X-Outbound-Node: rcdn-core-7.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 17:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176997

There is an issue during 'make modules_prepare' execution for PPC_85xx:

arch/powerpc/kernel/asm-offsets.c:58:10: fatal error: head_booke.h: No such file or directory
   58 | #include "head_booke.h"
      |          ^~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.build:118: arch/powerpc/kernel/asm-offsets.s] Error 1

asm-offests.c has dependency on head_booke.h so add it to kernel-devsrc package

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 253b8d307d..683f182c43 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -215,6 +215,7 @@ do_install() {
 
 	    # v6,1+
 	    cp -a --parents arch/powerpc/kernel/asm-offsets.c $kerneldir/build/ 2>/dev/null || :
+	    cp -a --parents arch/powerpc/kernel/head_booke.h $kerneldir/build/ 2>/dev/null || :
 	fi
 	if [ "${ARCH}" = "riscv" ]; then
             cp -a --parents arch/riscv/kernel/vdso/*gettimeofday.* $kerneldir/build/
-- 
2.28.0


