Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C17C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 10:16:07 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.119])
 by mx.groups.io with SMTP id smtpd.web11.3976.1742465758838724127
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 03:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=15sdmsFI;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.72.119, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Anbv+ufBjUXR/N3yW+vB/XBGnZ9TMVhDi/Pu3pL7+xI67Sqn9TtcVH/Y3TdaousS8kOLmOeuknpv+jLstya4/0od8oK8VuX5Hwmxpctbns4gl5QqFjKaLIJ0bQgasM3sE2+UdwFVKnWzAZoK8BCBXXcltssDEFjlXb+M1tX/cBsFIk1GO/Mrp9BOb3vUCiDEF+JgSlOvMWSaSf3Uyz49pvdQmIxYeiCCLc9JRH0XL/I6H4k3vg0V/Lasfz9p8BRt7dfk6JZXQ1oCUjuE59h4UqCw0GPrqKN/hLi07Eigt2UugN/xGkxngIJ7ckTLpKjvZSa60KAjFOVzvp5vpaC9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r25q3Y/R3jOW1SKPd0BzvdnC+pK0IK4K/tNEMDg1DBc=;
 b=fZIcgX+iWTISjVNzIR26EUxhOzk96YE2333kctu6bo5vNmDlP8KXBybP8uyBEfl0qMbezjGl7km7UxxWLFeL8GVSwP8F87SGUG24SWBnv+B67K0iHfN2KufUk85CKSpcGh/LuhpSor9pC4mda8MNGfpjDBFKcPpfywIUs9qbp7SPiBVokOBOUqEP8gnAYplLvbOZaPWtP0kYFs6mBESYowiepBhoY6gP0mdmwAPbBFiNAAw3geff1k+D4C/0lbuDr8UAQ3kKjxrphFqa+LhLveAXKLPZVGl0a4RZ7p638iXLrH9Etf9e1RUu+rlegNRrhBZvxsR+YQECiPDE/XhsPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r25q3Y/R3jOW1SKPd0BzvdnC+pK0IK4K/tNEMDg1DBc=;
 b=15sdmsFIycy0xO3LScH9fgB8qqUt0x6oQ9p8GEAtJnQy80ihwaFh2WAWfAOR6ZgVDU7KrucMX3q+uyzFwtMMJDiTdgIyxAqw/HyRfhOdz/cCjuJrk4HWcjqmuC75iNnfe+pSOJkPyWwoz8ndrybX5by4LAfTXMlL5ApEUb1aHHDt+FZpcfY/oHIRP4VDBBwcjEjc0UJ0Ez+knSdscQzEpaF2H71nvssWv6wNnaU/fhqNHHrIZ8iMoqcE+tj5QMyrH7M1MsThlW5fVQGFuPhGVW5O6Rbz0hZELaSFYdyGjGQPZL7CsJHFyJD6v2ICPRK2Z3eZKEg/m0/dI7ZWZvheHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9533.eurprd06.prod.outlook.com (2603:10a6:150:1b4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Thu, 20 Mar
 2025 10:15:55 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 10:15:55 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: changhyeok.bae@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] iproute2: Add iptables PACKAGECONFIG knob
Date: Thu, 20 Mar 2025 10:15:27 +0000
Message-ID: <20250320101527.2213628-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00004525.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::346) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9533:EE_
X-MS-Office365-Filtering-Correlation-Id: dd842ae5-5e00-4397-8398-08dd679833be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QWABfbin3modwR0y+obN3TBF5ta9UNmc69J/0f/PTNJHj/QLG+jGM8vxV9Id?=
 =?us-ascii?Q?Brj87Nuqda2q4eIxBy1tJFOpO8p+FKPpqvNVZG5TRI82EF9z+MZ621y4dbQ3?=
 =?us-ascii?Q?3ng/kFOoUogajVQ3UsLr4HTzTCYI+9oKFr8cIspm+YOU6b7lzwadmH9zoW8O?=
 =?us-ascii?Q?xjrr5al1k13Mt3c6tL9xMZ/Z86rF/3DV2NY4FKkCsY8f+JIfViEQJgVjhZG8?=
 =?us-ascii?Q?hQq9UldoTShpT9qq2UTcGXDuH+dFh2we2mFoWXJZa+nhObW5W/whmGgQrGPK?=
 =?us-ascii?Q?NZcW+mYOk2tkTtgA070Idpz9NlM9urlnwQNkEzqp3AfOQtG9sms4701+dkUC?=
 =?us-ascii?Q?mzhvCXjpd88zoIq3PwJqIu4rvIePP2dav+WGDpEMXBM6fRuEVO+fEUmmRxZ5?=
 =?us-ascii?Q?x4ixNYHz11Bg4G9tiD7xfDWoJQo4Nahv+zpGuw0EyfYKI5S1JIfLbnvH8El6?=
 =?us-ascii?Q?XKRcESP3QDWDfqmUoC4xS6faELbD1P4OWxdIUyXpu39daMmz91meWOdeEoc1?=
 =?us-ascii?Q?xQGuCVDwVNIeZ9YGk4ScMZlUpQkqX7Th1qptRs3VCCO5p8kvmwJDAOUkoNQe?=
 =?us-ascii?Q?LTIA+4r52whW9NgAQftsdfdcyXLYSmb3WICXcwob+5WKr1upa5tCpwYqupPo?=
 =?us-ascii?Q?KfLSHWC4ppxXz6q7KVX7EXJdOZLSIRPmnZNVwUNGBhml6z1WfClhG3lBhsXw?=
 =?us-ascii?Q?CjSwRz0PbeWKTaPWhg2z+uK1KOi/xTue95SeVLbf2bAnR+SHIpSUjv37HWy1?=
 =?us-ascii?Q?vb28Bzn1G5+spI3dWxI3bPPKJAtKuYZlrkD9y729NzMtGAb1bbRPPxm7q2zS?=
 =?us-ascii?Q?tiv+EU+rP8ynk0WAz/SA0zJC66IRPhXSJAQsaUBmLuUO2If+6hQfiwuZP//o?=
 =?us-ascii?Q?9BBMLQpG8SeEr0kVZ5zwFW+61ZS27d2Wi8qierUXYPtjjTAEQX+47aMWDKI+?=
 =?us-ascii?Q?Nbj5D+aXAMkwkoEICM1BQ9tAfYjIO3IUmMymMIvtlI+3PTMf6qkahPjjJEoQ?=
 =?us-ascii?Q?cN2mZZCfdXHTXiwB7nvr8LLsZYWiQhbiHsg9kdqe1ppRa3w0ujnTWUvgWYrY?=
 =?us-ascii?Q?wIUOS44qllSfITQwN0bLv4TuJi1MRmsXB0HOpZmnZEz+FPXteUIYpGEu48EY?=
 =?us-ascii?Q?0X9OaJqZDhTNULaM7bo2Ed6/Jx1cqbdFCJiSUsXcPB5dUHYR9LSi+4lRG0Xm?=
 =?us-ascii?Q?obG+Ua+Y+6I6nRAAnZqm0mTsJong5GGoMQ+lVc0x0q5cfyfzbKYLQvt6nAez?=
 =?us-ascii?Q?Tkwl77kCCAUf6+bYl8LOgwqyXDX34mPImGGpSIjNAclFY6en3xpZP1E27cqg?=
 =?us-ascii?Q?fr5c4B28U/sLr0+EYxyUBatjReGHTtZxaZPl11nHZPAkAucX3DE/TjJ+xyb/?=
 =?us-ascii?Q?vY6LFrJe0QzJGebKh2I5btuzuZ+djPCGPjwWdqhIpIeTprtRdbeFsYwiOsmP?=
 =?us-ascii?Q?A6LWqIHL8wPjOWrG92Sl3G6iRCyocN6w?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T5XYNGem+uQpjt/IYny/qmTRGTsIfxOKyycOfsmy0LTITFX4yYQyIIMi7pGl?=
 =?us-ascii?Q?ulq0Ka+Iyn9+Is0GmRKic/GeS7ajXFrSQLl/oUNO6JVu/+dpsrT17em7gYJV?=
 =?us-ascii?Q?qJHIreqTbJs2R5ZL/MVgLb4ARqlyDjAMDsQF8dD0jtCbdUo+5l4H8oVb5J81?=
 =?us-ascii?Q?GHnvosFkdVKy51h0Melw5ebbrmMLM2orwAfeHG5Tfnbwh+0u0j26ahV7jpFo?=
 =?us-ascii?Q?/1ur7Yd1jAUdcYXLih7WB4rGpYzlQMFw79thZCzBpqfnXEVUs5p5oPvpqNi8?=
 =?us-ascii?Q?GOmowNVwNzePP0xqtdtyMzZ87WcSYCpASifJUv36QiunCMpYm/l4PPccyK4u?=
 =?us-ascii?Q?gjjMquRnHq8f9fQZtv4SCUik5rL4pxoFHGFw8KVsQz+QyRlg7CbiybYTbTrG?=
 =?us-ascii?Q?SplfsiBcXCYjQ8r6g2HbMbxtvr1Jy5Y4kCNkr5MX2vdY6qtO7hfM+Mrab35B?=
 =?us-ascii?Q?vL2Wbzxc4qS0CHZtSQZI4uy4DrCznH16HK99e6XnH9GowBmzSMq79X9/f04J?=
 =?us-ascii?Q?WBfLGAY4Uplr4kMI/00GrQ/GApOwjYaCIppDDBfFfNhLNsxFZaf0sH85CFO3?=
 =?us-ascii?Q?rjgqsoH7IocXr8A7YmG6wekug9n/UEghP3eJGCtg8JMJ+vnVucl+RrYJMSd4?=
 =?us-ascii?Q?nzyubzRK1K+aldQvX0tdlwx02I1bl7vYU6xLqUw4Hx994DuwoMu67dhFoxnm?=
 =?us-ascii?Q?2Irc032jHr6o18r6rOteAdo62NKqKXoLCWGrNp0Z7V2HNYF68sGqpa6/lLYB?=
 =?us-ascii?Q?TwvLShSI4gnSHmKO+lfb0yc2FKJ+z71yENubCs3eb50IEW3AfyCLengTbvXq?=
 =?us-ascii?Q?e6OJla6GGJx+VeMg9W4+eDDVhhtXOchvzg8ktKnXRcfvrkHraqak8cPU+Taa?=
 =?us-ascii?Q?Wh5sRpaypL1YXR/rHGBn+yc0Oua1RhJe6aZmTYoY6bpMKaOksmiJy08pNDJ+?=
 =?us-ascii?Q?PXWhLhqkfFOhJl3appI6ccIWZeIW9qJRGvdRTdyrRWgSUvjJRSzzF1/isANm?=
 =?us-ascii?Q?clpqiomimfftE4vQBAb8CfnsmOAaPDOOeoGS50aaLPR+20JNZLRltHCvb46X?=
 =?us-ascii?Q?jChueTSkXnuan7QTrKkWkLwsVA5eI054nJbFQO7iJ70H1UkTnF6EFNFldyTL?=
 =?us-ascii?Q?r0ebYZhewTfPQC+SxNpqjhcjiZ46AJF6t3iH2RRwCP1EZJs8IviAAaVe2UXY?=
 =?us-ascii?Q?Xbh1XzvXfTu/fGViwkbVuZfzQyP3DR6XB+zjJmNI3VEXlQfAF1kJ4L95p1Tr?=
 =?us-ascii?Q?ILf/O7HtFlR6RfdrRK9/iL5IAPJXpMkWq04FvESE5gRgAsF5/rexD7JJEaid?=
 =?us-ascii?Q?4Zfgq+FEZ70nUtRenDsLVG5u+ovaWGjPMlN3xr12KIMLFDTz3cLusIANcVUU?=
 =?us-ascii?Q?wOI/xqlki2ChBcdEPSlBJ22gj6SD34hkjVwIJhTKbbeL5tSIuu70MlarOk89?=
 =?us-ascii?Q?ACFfoqrCnjX82ZtYG0L2jqYGEruMiT/bjm9jufQNSEQWlyOUfqpCd5k18mdM?=
 =?us-ascii?Q?CD7SC7UlNe978anQBvIEGYORFcyq3YB6Ai1PE/Crh44NVC2D32iwR7UVFRM3?=
 =?us-ascii?Q?IOIZhOjb/LJa3KLktclpRR/+SxnvDcTYvfku27Rfg6JCIA07zevY3mlfIIhj?=
 =?us-ascii?Q?dg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd842ae5-5e00-4397-8398-08dd679833be
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 10:15:55.8561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wiSGO3eBCg5gpFGN1yEdkm+GPrFYmKbRb+c1/8dwgfbnm5oEzn3k8sbeuYMA6SXoyYx+pMJXkmouN4jFDy6Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9533
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 10:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213379

iproute2 detects presence of iptables during building and can also
be built without it. Add PACKAGECONFIG option which allows user to
optionally leave it out, and enable it by default to keep current
recipe behavior.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb b/meta/r=
ecipes-connectivity/iproute2/iproute2_6.13.0.bb
index f2ed381132..0f37eaa7b3 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.13.0.bb
@@ -9,7 +9,7 @@ LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c50=
a \
                     "
=20
-DEPENDS =3D "flex-native bison-native iptables libcap"
+DEPENDS =3D "flex-native bison-native libcap"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-libnetlink.h-add-missing-include-for-htobe6=
4.patch \
@@ -19,10 +19,11 @@ SRC_URI[sha256sum] =3D "a43aa43338d882b44d01e549f3f105a=
92ae9feea32a82fae45a88e7a49
=20
 inherit update-alternatives bash-completion pkgconfig
=20
-PACKAGECONFIG ??=3D "tipc elf devlink"
+PACKAGECONFIG ??=3D "tipc elf devlink iptables"
 PACKAGECONFIG[tipc] =3D ",,libmnl,"
 PACKAGECONFIG[elf] =3D ",,elfutils,"
 PACKAGECONFIG[devlink] =3D ",,libmnl,"
+PACKAGECONFIG[iptables] =3D ",,iptables"
 PACKAGECONFIG[rdma] =3D ",,libmnl,"
 PACKAGECONFIG[selinux] =3D ",,libselinux"
=20
--=20
2.39.5


