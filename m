Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCABCAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 19:16:14 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.31])
 by mx.groups.io with SMTP id smtpd.web11.14.1758654971229058455
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 12:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=G/X9cxTd;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.93.196.31, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/utKWrS4xjrq8TthLgB6Y/QZZf+qllo2b7Q4zxFKg9U2sid6ourmbkX+vmyvlRf2N2MenU3fAoRXwzh06uJff4vESB6L+VyNwKkDkqKHB7gNC+fcu82uRi6BbzHRaMyuF5hY8lODgG3C3H9rl3eXbZU98wB4dUHNrkM0lrOzoFLIGB4eIQNgMP/G3SGTYQEsVmAY78rc2EF2ugMcXEtvq10ahip/KOlv/7DDpVrPTR2LoRpj8EONRiUABBGKuHnE+zVTt2JQxwgEDA/11otrZYeF9p4WDgdvpIFSfw46mFQo0h/A8a76jOBeAHW62JOpp9xrFxwO1c1K79BeLJdTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXxtY8/7tvyzFBJBJ093rRAAW+dj0TKJr4s8WVsbIq8=;
 b=xh9IIAVFdGZZmeIdfFHVhDHIFk7Kn1G3ByKt/MSvQA0dSVIH8Be+rzwFzs6NAHl6/7V62M3rIHjmiFl/J7O6c2UQxk3TwXy5e4qxnRTcej4MFSAERuoV3GQkvpUNlfbseJD9SNns54BnEGdcL4PLEpvH06yKqqpvyGoPKOjwWtiAtfmFd6mMmnhJqvSju6p1RJssi6P4E7Uurn8UNm/InQpNtSnLCyCSHawc6K0InB2ZjGUKg53HlaHq775u8zYNrG0X4+Rf67E4V6OmR+B8Nu52zYBMBYkRhxX6W3Y0S5zbNetyp0fXzAujzrb/cdbbp58aTXhJCFVU1UBLxeJ2kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXxtY8/7tvyzFBJBJ093rRAAW+dj0TKJr4s8WVsbIq8=;
 b=G/X9cxTdGIz3Q2wwUoTxtAZYV0N0J/eRyVpOuXRtHne7b3cv0qULei4SOBr5OMgc0zOySPCi9+BHnAoGpVkbmMJKy7QyRoSFkBKeiGv7aYoqlJWxt/FGOsOEKbgX9cmse3H94Qpjigpj/ze1Cki2Xj5QzCRn/jnFq37WjUxjLpo/C2csftosPZI39DBlIp4zgF2CjZc4Gek6wTyblM5EuUsQwJOwXPR7a96wvsUj3m2q/qL+gHPS5r8IAt4jAXvraJdnzk7sP0KVTa1Q3PNBT2xtd1gOwEsa5xi9tI5SoD188kQeJxRmGNQx7pB5GHK7DOGGgbnJp3zPcv+7XAk83w==
Received: from SJ0PR13CA0220.namprd13.prod.outlook.com (2603:10b6:a03:2c1::15)
 by BN3PR12MB9569.namprd12.prod.outlook.com (2603:10b6:408:2ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 19:16:06 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::d7) by SJ0PR13CA0220.outlook.office365.com
 (2603:10b6:a03:2c1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9 via Frontend Transport; Tue,
 23 Sep 2025 19:16:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 19:16:06 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.59; Tue, 23 Sep 2025 13:15:33 -0600
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>, Chris Laplante <chris.laplante@agilent.com>
Subject: [scarthgap][PATCH] util-linux: use ${B} instead of ${WORKDIR}/build, to fix building under devtool
Date: Tue, 23 Sep 2025 15:15:21 -0400
Message-ID: <20250923191521.1297729-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|BN3PR12MB9569:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c745bae-cf1c-4f30-5cf5-08ddfad5a54b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+9/Kt02/w3WnfosnSUaEHoeW21FByrxZ2VfVrnqitoJU0Nm6q7wEFFJSV8Ut?=
 =?us-ascii?Q?Q06wmoBXYdeBwJ1GYzMEdkS3cQKdux+cpqDE/khLwbRt9FYn0SjYXGYXVnMN?=
 =?us-ascii?Q?LV+rKwTgzPzVbYV1G2tJhtwdRQCZwhIQKwwlqFgyLDS4ZzAK5JfV5id5A/BZ?=
 =?us-ascii?Q?3X7Y5iR8Zbl8tcI3cD94qOc1kzGA3FqF6XAC2yN1EHVpdt1lN1j7BkJsUwUI?=
 =?us-ascii?Q?I8lRN9aQIHTSbL+O1fhjAk2fMSP0h8xjjWa+9Ws3zvx3PCxYJK4qnftKbfz1?=
 =?us-ascii?Q?J0kFmw/uNSzHzojELjxuv+xbTH6eorWJAJO4SzYI0OktASCSJzOrRdl8/A+X?=
 =?us-ascii?Q?OBcQzV1oJGasrONHQROSBuIoSWvVr9Fepy1/y33TN2+WcFxr34Bwrqs0hvNL?=
 =?us-ascii?Q?O9+Tgw89hhxbirjjvTuSSkNr3MBkTeGVkx5CQ8QSW5O35UBwWsaYGi1nI42e?=
 =?us-ascii?Q?3butf/t+821cR1sF6Bdidk7GqRO+CEFaHk977y6UHOnYqqrK7QAShwXoUkLk?=
 =?us-ascii?Q?fSfKMWUiuqtdN8gCwKdQ6+dXwqF+C2V5jlESnurNLTQf1ErFhDdAeoZ9DBdy?=
 =?us-ascii?Q?EbiMLN8m8dURgi4QWFgbM6D0WLAyDHyE3aUG4Wu3rEvpHr80o9IJo6JJaFbF?=
 =?us-ascii?Q?lJJs5EgoEWxX4kVPJzNX2nugZdFd7Ta+sMcOsS7qwoDlLacUoFGmpF2JNP32?=
 =?us-ascii?Q?P4Qe3lpcpCjADDqeqByN3lBzAzJ9gH688nxJjmHj0iUYrzFAUEsYipeLiOup?=
 =?us-ascii?Q?VNl71Vbci0RK7hKH5MQOvjc7e0SSdIEdi+Usq63vvdVWuywPQfz9oHBqRfPt?=
 =?us-ascii?Q?bFGzJRU52uwRc/WXHiQRjJ2Xa2o8lCArIV0JTqETnV51omvvcAk5tyPs2kbH?=
 =?us-ascii?Q?Ixh3IKrbGA4w85td0NGcFrKDRSkXE5yU5efZFEUQq5a2cO6KG04Ph7QWBjko?=
 =?us-ascii?Q?yPbyClZPWA+rQz9ueSuVvHmQmva87tKclUIpFzJYx/AuC9vs6pQBXFGzNN4Q?=
 =?us-ascii?Q?X2Q51VSZGmjxk2O+KrShi081DcgMvkxcHrcw8XoZyGvDQV3gBxkCKx1n5Ec1?=
 =?us-ascii?Q?9inxEPOE9WMEnP2FqvmdozxkJbxbsizbt8gY0NCZfbCE92k0PR1XjimaaGYf?=
 =?us-ascii?Q?v7PS3pT+ZnQlEF01tWkYSitGu66CEwMtDWiiEiYjA8/gjZ0LtGI7tmLNDLSw?=
 =?us-ascii?Q?++WvdmLTOAe5OpAYhpYWlGgFSJu5NZG0HsNKqDnVfpUrduMtD+sFRwKmlAHP?=
 =?us-ascii?Q?lwfOYGVanuXkUPBdZwdo1MPd8xQSD6WkwZ3G2Pa/8HVtsjnx3is45ovEpHb4?=
 =?us-ascii?Q?Vjkg7PosqUci0n0EGpHAwyQ1HRl7ealOXwvQliy7dKo6+G03v0c7jMn1ptEP?=
 =?us-ascii?Q?9Eu0CzitC4jGdwuxIClc2upybCenEF/ivpYogX8gsL3wR1U84PjLZnpvDgyS?=
 =?us-ascii?Q?UepjE8tidNCuYtapdY4RxPBuZ5LI3yoBfo1iQhSWGFSA1KOHC2EoWURZ6EmE?=
 =?us-ascii?Q?gQ3OisO6B5iD4oBhffBR1z//IeELTCHtV6uA?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 19:16:06.2816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c745bae-cf1c-4f30-5cf5-08ddfad5a54b
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9569
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 19:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223926

From: Chris Laplante <chris.laplante@agilent.com>

This change already exists on master, but it was made as part of the
larger migration to ${UNPACKDIR} and is not cherry-pickable.

See: d73595df696 (recipes: Update WORKDIR references to UNPACKDIR)

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/recipes-core/util-linux/util-linux_2.39.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/recip=
es-core/util-linux/util-linux_2.39.3.bb
index 79ddf2d115d..12c504e0a29 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
@@ -329,7 +329,7 @@ do_install_ptest() {
     cp ${S}/tests/*.sh ${D}${PTEST_PATH}/tests/
     cp -pR ${S}/tests/expected ${D}${PTEST_PATH}/tests/expected
     cp -pR ${S}/tests/ts ${D}${PTEST_PATH}/tests/
-    cp ${WORKDIR}/build/config.h ${D}${PTEST_PATH}
+    cp ${B}/config.h ${D}${PTEST_PATH}
=20
     sed -i 's|@base_sbindir@|${base_sbindir}|g' ${D}${PTEST_PATH}/run-ptes=
t
=20
--=20
2.43.0


