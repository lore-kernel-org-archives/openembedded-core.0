Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F82D6D220
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 13:44:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42248.1766065484030387462
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 05:44:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WtQbCBA7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44473d6ac5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIDRxMC1442875
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 13:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ZCFpiAAmKQbQ2Mdo9sPB
	qDBejDIJji4U66OuGdgqPoE=; b=WtQbCBA7VTAHgdNWeRarjp1b/KiizHIdkrdV
	T5RZj16Jw271eU2419UJl0eUHjLoPfKmEn68AbffxU7wDjLWl06H0DNcSWmod6oc
	rTsn0/RIdHtdwNxdNQ+375TojDPcUTHbjmKI85qP94h8lUjv7ppr9o1Gerk1nWzZ
	LR/ES7NoefloJkcQJ09dtUR8a/2hb6cl7IxFY+Bn+lIf2GlcC42d/W5ItdnyVhAS
	n+SOiH3kTYYV0b1PwbZu/ae2YyLCn5nXP+LGd1rR792m1s5YEkN2gKzom59GUhsa
	suwd9y7/wffDsotAtG7imTE+fIEy3NLFFP6aYT520qT7Jvykyw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013050.outbound.protection.outlook.com [40.93.196.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0bt130-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 13:44:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KP2yp89+WfGM61eYODRLO7BvXsL3WcfuKX1RefGtzEq5XoKsWGJd8O0J4NAA2qswLQgKJsfVi4JabykCnc+ROFyNZcoIkWxL7Krg68zi2qqcIrEjXwNqdkOMnHeMEwh4rSgJsQmosRoJd83M+Hw/fMmdpthDahBi1URbbfQ4HGIg2gcZbucJKqs5GotHBOAfCPByQW/yXTZGhW43o+BKpJhk1WYCa4I0Dl0OJESw+TQdSobgEErdDrUZBh8JCXfXC6OAFcOPM+XoZoI5lIiYlwOwwuUZb5kn2s8JlO4KxnItpXrTlqReVg+jVJyDhwVTyd0IKXgwUPaH06RyU+Rthw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCFpiAAmKQbQ2Mdo9sPBqDBejDIJji4U66OuGdgqPoE=;
 b=muDUDd4+S1V4m8QLPpuwA0wyp1hze/oHdur4LOT79gOwArGBQi3mDwN3/RLWbxaYMVWGxfonMZjqqfwmeDwT2IyunGODEmjctD2XfOVlNE5IlW2hN+5kgJ3rcg7us72909LS9c5rBPcg78NlY7Ey7zU+XEb3f/aPCHRukHrFeNifAUq379oo55uvyu2rtQkiDbcLpM/O4K8DbOtdyR5elO1S0UVO/WLTmmEE7J+oA19ndstQA6+cayY7oBtFhvSpqcY19EytD8DYF4Z0iYXwjGjvyI0xJi4EzPN1/FeBsC56+7HgxQjVagZJpaVyjNWxRW9/S4SI57lX8Q2a/2IRvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB8516.namprd11.prod.outlook.com (2603:10b6:a03:56c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.7; Thu, 18 Dec 2025 13:44:40 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 13:44:40 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3 V2] kea: fix creating runtime directory in service files
Date: Thu, 18 Dec 2025 21:44:24 +0800
Message-Id: <20251218134426.4187527-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0174.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae90465-dfd5-48fb-491a-08de3e3b97c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eURvLfsQBINl+vriiMIcZBtfc58KYtORYCBi14BS+1x+tKL5vlCnYSsP4gqf?=
 =?us-ascii?Q?TVZo3oY9OccLGKa/Yq7ek/Mr+M2FMhro8L4bonVnppx7Bqo+tiLy7MEJxQgj?=
 =?us-ascii?Q?z3zvWrq+XIq4xcEV56WgSo7f/P8Rwr4xLy1/IDoe3yhatGh57rZmSkhzzvsL?=
 =?us-ascii?Q?yxNHxmoJHyt/5vUcxXxMeSKZLsKKZVxZJknPyshO78JFjpef5VscyNEIL6ik?=
 =?us-ascii?Q?bzTn5cX5ScH2znQcg4P7Yw11ZvBswGNphjxdJf63F6drlK5miZEkCci2EocP?=
 =?us-ascii?Q?fhsJGLODyhr827rUHRU10L5RvPOVHiyPYYR6bEyPLUa3u53epvnyC+9hAAG9?=
 =?us-ascii?Q?LfTxHBld9vCfGVStbS4S2FsivelqFVRte8Jp73d5EN2ViOjKxbhvn2pNpwtu?=
 =?us-ascii?Q?g8kfoKGL6r6KXLqoGCNNvaIPBXuAGAsPFZTyQCyRHkwvVjTxy+gJHtrXGTV8?=
 =?us-ascii?Q?xX2iHil/r0AKrJE5LedO8ypA8UGJOffesI5akoDnWRno+kcQSS6Mm8joqqiP?=
 =?us-ascii?Q?MQ7p1ezXJiLzbyEq8bSXxV9NI2+bWz0Z7eK2c8Vo1UZz013PE4/2YWaT+21k?=
 =?us-ascii?Q?IngwM/eE/G0Jm1YMnNdAtNIQ9IHVupFIvLqdboicXPzxt8Sxgf5jOdw5deKY?=
 =?us-ascii?Q?h0ZBZTz52xkEyBL3/RJaxBTFY7zvxdWHtLoq+nDD3thpQNd2lS0QPmvy9MT8?=
 =?us-ascii?Q?JWQrG3RJi9AkOZlZfSFfijCfhi8gWvmRjvgmVQl7tXOU7/uXp8Pgo7xhiu7H?=
 =?us-ascii?Q?ia5j3R9WA4EmfTRYohIpOkGV5KWaAJnZoGVNMqLA2dWkH5V+J7euTWTnseSp?=
 =?us-ascii?Q?rvn0hRvWIqlP9dO1UgOzJvrKoWS12RrY4zKyhQqbAYSjVOd8bdJqV0BraZDb?=
 =?us-ascii?Q?wqfF+9W2tFc4596bsRJigvojo/Y3GqHTmQ+04x/bcBGL3muksmt9492U29YH?=
 =?us-ascii?Q?bdackipgzG/LV1IK2d+zVc5WCZNZkW6y1IbfXFqlT3Svk9W/R3upvdnUzLZU?=
 =?us-ascii?Q?65fNfSANNeARk9ewwZ4N26NJYKy2XnxpXw580dfyROdjlRfkLjbXFERzMYvG?=
 =?us-ascii?Q?xHSotJfgR5itEJmEgguOknjk+cc/ZLfTUhx1qmeXL+77g2YeKfAHkjjxkdXG?=
 =?us-ascii?Q?k24wmhWwn/JlIBj9BvwOIiDl8s3lwc6ujmXDDyCPEO1tzBn8AuQeHJ32YSSD?=
 =?us-ascii?Q?YqZWhZ2IQvdoi1VJ7HQV2GrgygY+AFBEoMWEPIH1nW8pv+pLF6DUf508p5oR?=
 =?us-ascii?Q?glA8nAuGySUlNpIPS/FVMD1ZQuN+t+ZflSFB52zG35toD3BEJPMEWqYLJHcN?=
 =?us-ascii?Q?/Nhc0OBx18nOyl7cXe9QIXjbdFHXbTIgUExhlMnfFR21oAqCVCB1faTBBN7i?=
 =?us-ascii?Q?M7ico1DmtFGPK9Fmuo1Fn1jlyp7kpJovx2wsmGjz5YLwtWaqQ+MOFn8RM0OR?=
 =?us-ascii?Q?1alQJocGXYSJMhcFbNaphkbbIWmyV4gRQ85IEHYJON4Xh4aPht6tnN2t48LR?=
 =?us-ascii?Q?QbQ5rx9VepD7bTWuDQEan/JFCKaHv0701rZn?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iJQRR5wTbET4dXyvG3+0BmhEntE8ewP8J5h1bS74FHUF54p5bkc/p00qg5fT?=
 =?us-ascii?Q?ZIIoLb/UCwK5yKd+DKYvL2/o+CrAxt6K/t+MClkiEtAbQ8UsMAuStxKYUYoo?=
 =?us-ascii?Q?kSxtxnZLInod0i+DYwZWs/KHpQkppynHBIGkuIOI/tqJxbBuTYvDdafmOAzs?=
 =?us-ascii?Q?1eb2mdZVQ0owpLnno61z5KXVmunx/jmJyG+/X7nsJBZX/gEnzNiKmAdO690k?=
 =?us-ascii?Q?vTY0fed35RbtZy6XTpAXYn0WBzt/eAB8tDB6x6oUamgOB+VzrWuY4in0JtDY?=
 =?us-ascii?Q?2kV8ESesUh/YMgCRsL/jrRlUQeTgS7izMpr3xzQz2XILDJl/zhwy/yjbWfVd?=
 =?us-ascii?Q?/IMppIBi6QSY/9osNqStODs8xsQXLBzi2pXNqpulu5V2aNrA0KuCAYm7FIt0?=
 =?us-ascii?Q?hdVsxsOe9CGxkltO9Sb1TLjr+xvO9WLJG6U2fzUSs22yxWtbthUUKJf8ddiY?=
 =?us-ascii?Q?u3oDp2clFmO2FkkNULQPcFuzvhhEo1jdLY1pdiMQ9om+ml/n7oEYA6sdYwuf?=
 =?us-ascii?Q?8bBDcCJzer2dCJ+jlzkTObp9pqmKq5y1KmeDbD4uqN5soXXlRXKmrb7M5y5D?=
 =?us-ascii?Q?OOUfA3fHcYJjcf01He5VHCVvrLxnkGVmJG2o3SUAUx6/r77CnN7B8soT2Vq0?=
 =?us-ascii?Q?md3yZPdDyR+QwhFugREgK2uM7VaIB6x97iKIMoFTJ4VALpd2fMIEVv55QG/z?=
 =?us-ascii?Q?6DxEz0+zco4IcUq3MI9fkM8B1aXdr16LJ5wgTNdqMXv6JUbzURRfYQwEUt3U?=
 =?us-ascii?Q?uSdHlVR2q4Owj5tSjMgXUq9qrzndUqeM/EmkMkSp8Sgxm2reiG4o9H9egMiY?=
 =?us-ascii?Q?OpSW6jDcKAZcMtIN2H245B+mJ4XpfyP4c1OBOSm9u6D1e0Qxt2GlvBX8nxQP?=
 =?us-ascii?Q?mz9qCpK+VPYwWFWyh8RYM/Ck4rV2BC9qaJzLZal+Oq9uOpuyNE9o7izdXynK?=
 =?us-ascii?Q?0C6owwd1869uq5xt35rF1BR2aFoo6bOKUUOLFgflJPyJYB7j27YzdGCzuYR/?=
 =?us-ascii?Q?383ifwvL29QD2PdbvS3GztwZE9y1CHyzgLkWeq6SZtwNPT5VhPvQfvQldryi?=
 =?us-ascii?Q?oMwZJGvpAKsxtjiYFxEMhpcAmOVyLoYfnNu93PquMvj/6HH1gQdUCnqlsWla?=
 =?us-ascii?Q?/WqnTpd/UETxwHy49hV1XgF2GV7eytA/CvOKL4cgwwFCGPWh26Bp7hlFZdUJ?=
 =?us-ascii?Q?UqlGhx7LCYab9gQRNHRYp2+hbCpDPcCebr0VDkQRqtZ7izjg5f5lmzTYZWHD?=
 =?us-ascii?Q?mhZRqhvruUyXEET+Ih2oyb3HD2FtgC3osco9TXyUiM4E8mz1Qj6RMxmJ1Kfv?=
 =?us-ascii?Q?tgqvWyWh+O5dmCWd7zOviMQV1BG6QHcP94/wv8ECY+QFmiMFjaY6bSqCqjx2?=
 =?us-ascii?Q?bFlCMj5TmJ3gi4HEQwfrRC/UM502VtUhtH0ZuX7bimtTUR0PqqHxVwO2HGuE?=
 =?us-ascii?Q?weUiOBknFJbFm7pCH2cS+7zzsKLKGS9vlm+00BNtWQIjxBukXpO265XrWm5t?=
 =?us-ascii?Q?n7LaXswjQHIfuUX3teSG8yUeaxyDi5FxOQUT4yVR5gPMog7OPYK/T60eO8hs?=
 =?us-ascii?Q?IWjYOaOzaBpyHFtuiFbMawqg9A/92NRIEDXoFZYK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae90465-dfd5-48fb-491a-08de3e3b97c3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 13:44:40.5104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0q5gGNYOG3mU5pMr2vZPEwA55awySSsNzgPBjxczlMyN9DO35dQHkPkCFQVnAmhU2bHkj5FRfxpB2+aw56bKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8516
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExMyBTYWx0ZWRfX924YESY3ugPj
 u/JVvXD7Vw+4wUF9LzexEPAUPr1DSahfYFwnRB0tRoMIZbgDXSYhHaXcIhvbWeKHMmna6pNipJu
 vCRCDcch3HnfmA+RpstLS/Ac6hTkIBe9mmlw+WJ5AFeJdjKSyjtjSqnUBGRhBfJh6kpNMUoKaP4
 IAkdKNmuQ8hpy2GZMpPKrV84waFCV9RMEe8IvnFne18vohK3FZh0ktMo38m5N/vJZA9ddhMJl7M
 Q4G1Aw5W4SPbh2i9mJIJQIKqdmzcvKprWCUCR81HPUK95bAozFOkRLIpgDmcKF1d9OFVQdWCOxD
 kOczX8sEjJjK2IyvK64hzEbLZso5AglnbVJhYfH9TdbDfi+XRr4MR2BnAz0ySBlunm20a3WCrrJ
 R9wt0OINyhMMedA4DDLEjUqZg9Z7SA==
X-Proofpoint-ORIG-GUID: ZVqqw4vc_HNtZNTc-huvgVqLbhl7DbsD
X-Proofpoint-GUID: ZVqqw4vc_HNtZNTc-huvgVqLbhl7DbsD
X-Authority-Analysis: v=2.4 cv=C+HkCAP+ c=1 sm=1 tr=0 ts=6944054a cx=c_pps
 a=TdY+Vr9RQ+qa4geS/iuwdA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=IofoVH794e086RA8f1UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 13:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228122

Create runtime and state directories using RuntimeDirectory and
StateDirectory in systemd service files, rather than creating
them via ExecStartPre.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../kea/files/kea-dhcp-ddns.service                  |  7 +++++--
 .../recipes-connectivity/kea/files/kea-dhcp4.service |  8 +++++---
 .../recipes-connectivity/kea/files/kea-dhcp6.service |  8 +++++---
 meta/recipes-connectivity/kea/kea_3.0.1.bb           | 12 +++++++-----
 4 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
index aec6446f0e..feef7e0b6e 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
@@ -5,8 +5,11 @@ After=network-online.target
 After=time-sync.target
 
 [Service]
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
+RuntimeDirectory=kea
+RuntimeDirectoryMode=0750
+RuntimeDirectoryPreserve=yes
+StateDirectory=kea
+StateDirectoryMode=0750
 ExecStart=@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddns.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4.service b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
index a2ed4edb59..ce1256cf26 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp4.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
@@ -5,9 +5,11 @@ After=network-online.target
 After=time-sync.target
 
 [Service]
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
+RuntimeDirectory=kea
+RuntimeDirectoryMode=0750
+RuntimeDirectoryPreserve=yes
+StateDirectory=kea
+StateDirectoryMode=0750
 ExecStart=@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6.service b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
index ed6e017d0c..6123a8ad58 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp6.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
@@ -5,9 +5,11 @@ After=network-online.target
 After=time-sync.target
 
 [Service]
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
+RuntimeDirectory=kea
+RuntimeDirectoryMode=0750
+RuntimeDirectoryPreserve=yes
+StateDirectory=kea
+StateDirectoryMode=0750
 ExecStart=@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
index 8729b1162e..1be557c79a 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -74,13 +74,15 @@ do_install:append() {
            ${D}${sbindir}/kea-admin
     rm -rf ${D}${datadir}/${BPN}/meson-info
     rm -rf ${D}${runtimedir}
+    rm -rf ${D}${localstatedir}
 }
 
-do_install:append() {
-    rm -rf "${D}${localstatedir}"
-}
-
-CONFFILES:${PN} = "${sysconfdir}/kea/keactrl.conf"
+CONFFILES:${PN} = "${sysconfdir}/kea/keactrl.conf \
+                   ${sysconfdir}/kea/kea-ctrl-agent.conf \
+                   ${sysconfdir}/kea/kea-dhcp-ddns.conf \
+                   ${sysconfdir}/kea/kea-dhcp4.conf \
+                   ${sysconfdir}/kea/kea-dhcp6.conf \
+                  "
 
 PACKAGES =+ "${PN}-python"
 FILES:${PN}-python = "${nonarch_libdir}/python*/site-packages/*"
-- 
2.34.1


