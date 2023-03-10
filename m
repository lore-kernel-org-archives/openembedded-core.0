Return-Path: <romuald.jeanne@st.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B203EC6FA99
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 10:36:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
 by mx.groups.io with SMTP id smtpd.web11.16118.1678444589304478586
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 02:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@st.com header.s=stmicroelectronics header.b=bBQEfBdj;
 spf=pass (domain: st.com, ip: 185.132.182.106, mailfrom: prvs=1433ed1667=romuald.jeanne@st.com)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32A71gkp007160
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 11:36:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=uBGll9eD1ALr/jsRLUDPxyGj0uHl1yH82a/NNEKr66M=;
 b=bBQEfBdjYsNXlXticAZvYM2VN6W03FQuP+eV6FQOt46zMYQfo+4b8ZqEJ6Tu92AVlyMx
 eue3CKY5aZNAWdm/rz1tukx9d6b8Swvf8HBCB1z+ohewOJ+ve90GW7AirVMUl1JQI7eh
 TysGpX+MQKrXfAr2wgo9lYZxrhKw3iVYjDkkmf0MPUoxPl9ba2LwZEsp3J7mtQK8wzv6
 OISwLuRxp06vcmZtRVQFnc4E+L5JFFAqES4kw/5ngaY3isiTsKu9feOMu/18nZ6ehZ3j
 X0IPne+rsJOIgMUMv6GNckvOJthPGltrHM/sZw1hx7pxG3yoKjwHVKfB6EvPhqqy0vHd KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3p6ffcthe7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 11:36:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A38410002A
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 11:36:24 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A2FFE211F0D
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 11:36:24 +0100 (CET)
Received: from localhost (10.201.23.79) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 10 Mar
 2023 11:36:24 +0100
From: <romuald.jeanne@st.com>
To: <openembedded-core@lists.openembedded.org>
CC: Romuald Jeanne <romuald.jeanne@st.com>
Subject: [PATCH] image_types: fix multiubi var init
Date: Fri, 10 Mar 2023 11:36:21 +0100
Message-ID: <20230310103621.2933-1-romuald.jeanne@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.79]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_03,2023-03-09_01,2023-02-09_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 10:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178328

From: Romuald Jeanne <romuald.jeanne@st.com>

Make sure to expand all MKUBIFS_ARGS_<label> and UBINIZE_ARGS_<label> vars
in 'do_image_multiubi' task to use them to init the local 'mkubifs_args'
and 'ubinize_args' vars.

See [YOCTO #15065]

Signed-off-by: Romuald JEANNE <romuald.jeanne@st.com>
---
 meta/classes-recipe/image_types.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 764e6a5574..24948e05e3 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -208,7 +208,10 @@ multiubi_mkfs() {
 	fi
 }
 
+MULTIUBI_ARGS = "MKUBIFS_ARGS UBINIZE_ARGS"
+
 IMAGE_CMD:multiubi () {
+	${@' '.join(['%s_%s="%s";' % (arg, name, d.getVar('%s_%s' % (arg, name))) for arg in d.getVar('MULTIUBI_ARGS').split() for name in d.getVar('MULTIUBI_BUILD').split()])}
 	# Split MKUBIFS_ARGS_<name> and UBINIZE_ARGS_<name>
 	for name in ${MULTIUBI_BUILD}; do
 		eval local mkubifs_args=\"\$MKUBIFS_ARGS_${name}\"
-- 
2.17.1


