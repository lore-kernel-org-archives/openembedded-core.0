Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C39C47092
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.86])
 by mx.groups.io with SMTP id smtpd.web10.7803.1649747428108022886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 00:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=vGNGqRDX;
 spf=pass (domain: outlook.com, ip: 40.92.73.86,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsyuEKz/VhO57MCAGVmEJSLKKscn1dNi8Z6tjIytXMrgkfmWy20WuceSmc+Oo2HgThudBP0IyhH8llFUUEKOp5uniWs9b8Jqrn+lRvDvaZEqhRIPuOnoaWWVCcuVOqXWOu5qoOb17KO2YixNZKy/WvXx3JWMlPVXfxroJVW4AZGnOKNi7prcwIDysNnpGbBEbp8mFX1uWvmp+4KVLumAtJ/94qAo5db002j5Im4UuFspsaQdqNf8j5WfSdhfaWkR6oZBkGx5r0BLYWhD3JjmjkSMIexcuoSX3ji5rXX9tb31+SGx8vhx1ID84Q3cX23B7q5XZj/EJOv3hRtHnkR8bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDlrBeU60ZbpIcke2MEoh0FlMZnMJEF2cooIhmk/iRw=;
 b=b+f32J/BN5PMnaOFDvYkKj/Wc88Yr/dXgND0aenkW8KfM4tXhdZsqdQmeWq56cmKg6zFZNyYBG1zLsUqUbvBisp0AUHknZh+CEQgzzEpeCVScoGtYhzheDN7d4g/Y3zZEHtAYUCs/ECNBOqN00QLeH/I8Oh1Qxo4i3r9AufGozB0KX6afQyFkDdte8fVp1wAcb29UsUXVLsHHE1en/k3+INA4BjZ6LacljUXK0XwHiMNAfVudovE1fPCML+wrk/2eIzYj+SZlS4oTBOlZoy1UdMsQuf6oVN3KHPfvTeLiVudw4TJyrVKydgXc+bURnvVhVI1mwEYBc92H7wnCpVBLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDlrBeU60ZbpIcke2MEoh0FlMZnMJEF2cooIhmk/iRw=;
 b=vGNGqRDXmcnQIkr3UDw7COfIaSTdhnD5miRyN7Ocbu3tO6pyotRM9l1KKMMtHS7sHv2xr3wC8slsi8WqD4mXu2ZiOVuhq1iM+F56n7rk8FE1ZEqJbq8jp+GmeFmuMxq6fTdTjYcZBoRG4m8P+VKq6OG1icjqwHAr4/EAe7vz1Pe+lxfOcI0Cw2l2Ok4pqB9keUYPqei7xA2KHRN4JGsasHNAE3Gwsi4slNGI14XhgDvsPq8EIhGNMd9Y4XFWINmwwuMQh8dnG5TkK6+1KNBzSbATE7Frlev2hZ6QZQWC5uvT6Xts+VjU940ki8onSLt3glZWfuwOtM9rvhsk82tWBQ==
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com (2603:10a6:3:f4::15)
 by AM6PR09MB2440.eurprd09.prod.outlook.com (2603:10a6:20b:47::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 07:10:25 +0000
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37]) by HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37%10]) with mapi id 15.20.5144.030; Tue, 12 Apr
 2022 07:10:25 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 4/4] libcap: add pam_cap license
Date: Tue, 12 Apr 2022 09:09:56 +0200
Message-ID: 
 <HE1PR0902MB180188D93D61C68AC2F96236A8ED9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412070956.1117150-1-kweihmann@outlook.com>
References: <20220412070956.1117150-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [4+9t9q07oSoUjFhfVsIqpaYnw+nesvEjVUt/FlhXAH2AThKRyfA7SZ4uSYjq9oki]
X-ClientProxiedBy: AM5PR0601CA0083.eurprd06.prod.outlook.com
 (2603:10a6:206::48) To HE1PR0902MB1801.eurprd09.prod.outlook.com
 (2603:10a6:3:f4::15)
X-Microsoft-Original-Message-ID: 
 <20220412070956.1117150-4-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83e72d6b-19e2-486b-e89a-08da1c5383b7
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtzE2Fvbynuuzx2l2moGfThkuuGD7DOwE0hbLUmUSkh0ADHBS/AzSKEsjiisDpvSgsoxFjGnVoWB0Nvzn0iTimDm0UqOx+XFV25+53NMPXvF8ZVFjlf5czG87L1O1iLHRh1v0JJ+GJbNDn8px+NB8yZdUnjy6eDGefsgUoJ0uFWFfUsMujnSAVktO2E2CN8V8jNtffJsdfkFYUqxTRoDJNbajSa2dlMjyWqUOyTuvo8J5O9tuaMoWeOxj3pT6kEAVJpAZzST6JHcUkhjIIIsMZmzoVodW2+SqTIzzfa0ebIiUt47zObWXFDG0u6PU2T64+Z0EQLsmj8STqIPjA9+3FDFeH9cE9V0CUNSa3tgZZ/8Rpp8E6T6JqNMXLY/vqPIClgJ8ObASSRp0aLG9nBZvXsSXY0TbEBFnHtY/BYYA9SHyo9m/cs+DwfKQCPLNzCCHQ6Ms4JjEkyO7OISbR0Nu2Gvef5BGIAWFksMIv0cXet92cNIN1F0veEoGMqdr5gWcPP8ILUPr0Y9nCt0cHlshTfzsCgSRCipK43UAiibZ4OHKkYbR2vrrZzGKWyKTfIv8/nvddD38at+H50Hrj5Oag5shk+NXQjpIQ9Kaxu1/ILha4vi72umIr0Dampb5INas5xz2b4VhbpRzztJS6jWlw4d6Jr6VUL5vIErDJ+jiDBKAzb/0Wrj9764ZSCgreKPZYtfhPQ8VsJlQieIVbGr7+wRQaZti+voRd4h7MQqotN6xw==
X-MS-TrafficTypeDiagnostic: AM6PR09MB2440:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rPF7zyuJDMwLupX9liNW2LjHm2VJpmc/koH7WcREsyQZeZU0vUSIuYl/KDq8n34i5DuicGuKxYk17RHqJavrFA415xuuB5yvN8Inb7SOzTors6rS5gBARe/LY9bjOFYZwkvCb33kdPgKL3O4Y4XayHw9EVKioKYy+9sLdxaE74YXK1pb/DbNUQTxV+HF1bHUcgcpkq6wywEpguKkcR7obW7BD1BPirtDz/ibTKk0Sus9gfCtdEz6X67UnSYT7fdb+y4s6gqpc+la88sHcRXBOia+QoWirKGiP74iAvaUi8+2zfZWbK9RWvd6znl9lu2pICD62IeYH5f74vzYfWx6p3aet9psbnXjQVBcj52OJhkF0+LbENmgBwqdLW+1dbTp+7O2wPLUFDD5Zpqbrj7UAnjM+UgTSbxh6vj46QKk+iH8iEryitz58BGFmflnhv+aLKuB4Fk8SgRvnDBlom1nAkWsedL4ToW3Z4Imff4u3KBFMIEYVxw5o7y1QWOW7zTP9+uCF2hIy2xw2se7iJOzcoV/VHhGrJwjAh7Dzs8jd4/GLuq+UJNcU3g7ZPDToTlsugsKFlj7fk5kbdODVkL44X6HMny90hIgt5aAQgra6kQ+z37Bdrpgn5Pi9OKTIlJ6
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eld4tUnL2K0YeMGIPqKhCg1ZkWZbxCFHvmz73f3V6X9ne+/qNz4s6rG1vRkH?=
 =?us-ascii?Q?Mj6YRdI35OvNLEp3QRjxrT/pz7R0SBORfgRGOpcJGC50/uFxbC0kVe9kIlpd?=
 =?us-ascii?Q?/AHSrn6oK/FUC6bq5p4Fab+lHfHVpTt+qLCyOEeLecRO1hL8M4ys9iwSDeMV?=
 =?us-ascii?Q?9nYGzzml2Rfo9fu8e7oQkUYjHdPh6Ml3VN9YSixDB5WNlAg/D0/8OcJHLemO?=
 =?us-ascii?Q?eVX8/BT1NbBuEbMcJv+ETAhCTlrB4BpSXUM9M4PKOwcaTa+D1z9OZW4F+fKW?=
 =?us-ascii?Q?SaWXVkSxnOcadEq3GOGAEH2m1PwcQ4Yn5xbRzv7fGZ5sEaX6tVgJdttqP6hG?=
 =?us-ascii?Q?tyZkK2La9EcZj/6ta5FBohbPyxKTDGqulUDZI6yNk/7zkPLuTppFvaEEheoj?=
 =?us-ascii?Q?4FOT9DLH5W4ng1FY533SeBrb3BhOH5Ujx5vAUj2WcO3EZx7zldDs3Zu7emiF?=
 =?us-ascii?Q?4PO1plPdvbEy+sxliCO28v6g0d5KCRnCERh5eDLOAqGaC3mKNq5wd1NZMz1P?=
 =?us-ascii?Q?XDhkDQbzQ2BqCZvTDnveX4hfI5qenhm7CsgwwlVlqDBkoeEO6golaf0vp8nl?=
 =?us-ascii?Q?l51TLs45LnxGhBEO+MaP5hGLEOuN9QSuFFM29TquAHL79lOc1bakFw5cY8y0?=
 =?us-ascii?Q?rXN1pl21C+5uzhr+7hXp0E4+m52o+QURNXUWphbXOhg23yMPEeOjhVhmq+Qn?=
 =?us-ascii?Q?lWryRY911Ax+ii7Fp7Tu+UunFEmtCjboPc1vX3x2MnWeTE/gjFmcaGShzGvu?=
 =?us-ascii?Q?nPa2/violjYmOYC27ksS8Irt26IwudKBAX49jvzwAuLe1cuaGbmf7O+FgEwq?=
 =?us-ascii?Q?/WJTvffityfaZ/Qr6RroQn9tEgkUJqrNAlbK4a0ABStMBy4CEHzX6mmjxOY1?=
 =?us-ascii?Q?k1WtKjacODWrEJieP8fsux3eNM+A1dCCU0SHRHzGgLF1zYmzxryPgTz1JZHu?=
 =?us-ascii?Q?WiypGL0mozCWcWE5UrciGB5Tj1U5xkSqBzC14bQjCu3+FLyzyeQz+/NBIsmb?=
 =?us-ascii?Q?VWEUVeV6xLCjfjgDpmPKBZBBKqaHnnmkvzw6QruQe6/6YJ/V9s8hMdKn5wJV?=
 =?us-ascii?Q?LYTyT20i//BvderGsD1cFHuIj/eBMyCHY6qwMZ2EI+Z5KGYD9qTJJPfw4aCQ?=
 =?us-ascii?Q?+OQ7gbmgC7tMWyA1L/sKsD7+2Iib1pWfxJro97nLwvxuglIBNZ1q6kEVr5do?=
 =?us-ascii?Q?D+vFncjtWDtWSC3Zt+UC6+Cz1yoK4S8aMkvRFpjc8zDRspt9TByk9V6RXG7K?=
 =?us-ascii?Q?yRj4fkx8K5lGq/mRDfK6/HmwQ+H74KIVqhEJdrTDck0H1Koe1pUnvkzt0PUX?=
 =?us-ascii?Q?ScLhNCzs8mOh7CHUc6juHaH6MqoMQHrb/ghaSFMWAVLzHILnFGY3hiUhi5vY?=
 =?us-ascii?Q?k0S7ifqqaQyllqJXWtYJszt/bKiYVI2AsMb8jUUHnPbK8YW3zxuUf1MR9G7a?=
 =?us-ascii?Q?cZTdk8yQheq+w6V5Atmbs4VEz6+2TW0RH8HJYS1J0fEa6eEzU2HFjoEtWgDB?=
 =?us-ascii?Q?I9Fmyj2K1yYqTPQ=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 83e72d6b-19e2-486b-e89a-08da1c5383b7
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0902MB1801.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 07:10:25.0483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR09MB2440
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164258

If libcap is compiled with pam in PACKAGECONFIG
additional one additional license text becomes effective,
add that as a conditional

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-support/libcap/libcap_2.63.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap/libcap_2.63.bb b/meta/recipes-supp=
ort/libcap/libcap_2.63.bb
index f3133f9ded..aed1f0a510 100644
--- a/meta/recipes-support/libcap/libcap_2.63.bb
+++ b/meta/recipes-support/libcap/libcap_2.63.bb
@@ -5,7 +5,11 @@ users, without giving them full root permissions."
 HOMEPAGE =3D "http://sites.google.com/site/fullycapable/"
 # no specific GPL version required
 LICENSE =3D "BSD-3-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://License;md5=3De2370ba375efe9e1a095c26d37e483b=
8"
+LIC_FILES_CHKSUM_PAM =3D "file://pam_cap/License;md5=3D0ad4c9c052b9719ee4f=
ce1bfc7c7dee4"
+LIC_FILES_CHKSUM =3D "\
+	file://License;md5=3De2370ba375efe9e1a095c26d37e483b8 \
+	${@oe.utils.ifelse('pam' in (d.getVar('PACKAGECONFIG') or '').split(), '$=
{LIC_FILES_CHKSUM_PAM}', '')} \
+"
=20
 DEPENDS =3D "hostperl-runtime-native gperf-native"
=20
--=20
2.25.1


