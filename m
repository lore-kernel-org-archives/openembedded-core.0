Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30992C04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 08:11:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.55184.1716192665563051702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 01:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5870edb5a7=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K8AKcO020739
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 08:11:04 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y75rb8v13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 08:11:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLvcT27etMFPrXsWGTNZKLQliUaPF8SWi5MPdorqCllcTLOa33idvWqI9cI8kNWiREhklejnddk8HFq/I25yfxiXPrUFGqMt51UJqbdcaBhwPdItStR+LC9SUM6ksyfqHju8QRYQVWI6sfBxzFr+NqkQlnxbrpsecCs/NZaSAMZnok6HKMmH9QAX0isekua4h6BdaL9lbZpTuHYrVrIpEaUMi0/l91ZPUWdGUNWJJioCjgSHe7x94ZHLESv9Vd3i41zqhvAJEMNq3JxNqbDHi1GKWKsy0tY9/7PKTyiOuKhRbF9Qg4WbWGQ587FMwToGXBw3w665iWCFPZZOHEksIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPIbSekaCvWujINFtTb/BCY05cPHDFwaY1sbwph4I/0=;
 b=EwBZ5zJeGaDLtMZnVPAWfGkre1XM+fWq1SPtLO294vJyhTcGTQivc/A8O+E63WGQ93Bmp+TlkP6XIClIXfrd6sZ3jZFCYLLUL9+irtYWVZrrCe7P/8bonW9giN5VcnkNvYs8F/cTO1+RKyXoSATv7aLM9qXzcvAncaIPFHE9y5PKt6VerDxY1quM6ZM9qHnd3vO6tRoxzXGi/M9DSpKX22L6eIhn0VDAS12pghfrcfCQkQ+F69dPTNc9Y5pQv9hZ7chzxv1oHr7JXtK1Xpf+jUW8CggbPwXQW5Ksx4YFyXz+pl1YnQ1ZkHPrYuFuscSI83Z+tnH3Uun8w4+EcG30Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB4882.namprd11.prod.outlook.com (2603:10b6:303:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 08:11:03 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7544.052; Mon, 20 May 2024
 08:11:03 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 5/6] cups: upgrade from 2.4.7 to 2.4.8
Date: Mon, 20 May 2024 16:10:39 +0800
Message-Id: <20240520081040.2380736-5-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520081040.2380736-1-Qi.Chen@windriver.com>
References: <20240520081040.2380736-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB4882:EE_
X-MS-Office365-Filtering-Correlation-Id: d50067a2-447f-47ec-3242-08dc78a46429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|376005|52116005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6htrvS9tlYLRHNfs7UZr759T2Ci9M6Gnnm9dbeyiovva4zS8/DMJBFki/peI?=
 =?us-ascii?Q?VirjGWiT4FFLXWRxOTUQVcPHSIVOyZA76rX1fPsLN8xMCpoAZ3bBocKaJ163?=
 =?us-ascii?Q?9K+BRhpwsYMo+QW0q7DNw2yaKdBWjHpshPgxZ/a5PaDQM36a1hXnhGDLXbOd?=
 =?us-ascii?Q?gVmYUtMBFaW8qqdNbSAf5nyDfoWdE/0MJoGQJ2CcRnZ5IqKYPHbxZhlSnYAy?=
 =?us-ascii?Q?UYflblZRQv3xgomAUM1mHEO924NqCX7wAkS/8O6tRwDjK0rFEZT9sw07m6Tt?=
 =?us-ascii?Q?AVEoWxaatxrCeDbd1+KrU7E7lCiYQA+bWitnIaqQm5n4fCoghv8KFQ6LG6sc?=
 =?us-ascii?Q?3lDHlWejXWYKvaAxu4fgMh+E1jceHT3RhuOjFhOPfmEI7+Mkm7kjZVQst129?=
 =?us-ascii?Q?Y6jXBoKA6136jmdJsRMukg+OGMowZEPBN+uu5PUFL0/CaU0UCu8QWlHk64jv?=
 =?us-ascii?Q?hb0dGzp94noO7cB2uSYjNqGO2bgh1chV7mfjUHLjl5yk9oMhv33yAq4lvS0M?=
 =?us-ascii?Q?0YalPsADZaMCVoCX7r+hOWgoo/AZs+jJGl2Bj48FxO/aEdkAKTUbBBB/cCXN?=
 =?us-ascii?Q?KY/oIKX/ZMN/wtIzFcjYX5Prt6SjO+Dcx0O5d0vsm5v0vrrM1LbLHaKfukDX?=
 =?us-ascii?Q?7SEbOHel5oSMVxhA7WDF7ddrKyTwQFDhBTeLApYVxwjuMhftZCGHFW7FzF1p?=
 =?us-ascii?Q?zmE6+pIHgdRxisGsLVW8VvD3D2LYfNYBIHY3hyaspRWvzRzRu4b3TOS5ZUoY?=
 =?us-ascii?Q?jw1Wu0m4EouVWH+DtjftZz2Y3+bew0L2JG5DcaqxpqdaZn9PRZrv+3G/yOvB?=
 =?us-ascii?Q?CxJ3DSLqNYRs72JA3q0DhPXtYZyXTq6UBngQV8xE9TRdgsZ2QSV6FSxMGz1K?=
 =?us-ascii?Q?i+bh+xLtmSQFeRG6MnSCKlFOCoGoi3n+tjwNDed73gYJOwoNVhdrLvuXt+0y?=
 =?us-ascii?Q?Rgzg8mSS5d3LXFUmnHhkzjPgYe/+ibdxOA0x35WMzQVg3YDyHjJSFytXxguV?=
 =?us-ascii?Q?MIlKwK2MPhxjlNlmGOXmUsINirGCTdwinlPOW2K5RYashllQ8+uf2EjiuYwp?=
 =?us-ascii?Q?kbQyAzyKiyzgbsfuZQuPN3odPXA7KQtWWWV8gq0+/0/DUxefmWp7OIXIVle3?=
 =?us-ascii?Q?morMBwox7IM6LU8/w2q63EZSZgMYwvPmgpazdXsrFkAvwDXOknGJ0n3vrBmI?=
 =?us-ascii?Q?PtmN/V24B18dAZczjxtgWagbkFVtspnT/FxpWuXFZcL0lgUNkVSD55xXEgY8?=
 =?us-ascii?Q?aMGcI1AhTW1yDpaHg7OHlMG4ONo8CmDycI0o7SW3Ij/TEHj42fES1hN7M6zC?=
 =?us-ascii?Q?2DBvBjpsj2RVwCOEsI2+5knMsYjQeEBZ32zZ3UCWIcY9Kg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MYGMIxngv+xy1DzeG7WGbHUStze7bJU3GkQLgthYa6LfzrPMiFzWDH7AtfGx?=
 =?us-ascii?Q?WXz02jOL1VcSF7rexTHQJwf3OgkN/ki9YzRVg+a28vj0lb0hyWax+1Dd4zUg?=
 =?us-ascii?Q?ULKiKKSzDqz5YYPnZlBUPRzuJtl0FWveWS4C/PchoZcU51NRhgBA2MKgRFLw?=
 =?us-ascii?Q?svrTjpu7mr9WBKT7wg5NQV1K2jkaGg9iFW568yNzlLozN7MpN5RIkC05otmJ?=
 =?us-ascii?Q?LlRjJevpzBjuZgXLvGm3y1OIP06puVxCRo1gfExG3vNogTu3ymPYlDkwceHW?=
 =?us-ascii?Q?DBd24RNVRdeqqgtVL1wWw2sFolLhewZ2wkjYQkMX39XpAbfNZzwHJiSDgdCs?=
 =?us-ascii?Q?ws2+UYslok8NvrwunrQdTHg+Cv7jnUyHUuShxj6OuLwBlJlbOoea/E50ZE/z?=
 =?us-ascii?Q?Swwq10JKP/O0HBgKv1Fz5f1jHek5gPkQTn3e+MAwheTlOX7f8G17CADtjktz?=
 =?us-ascii?Q?FFuNn4Vo/nJMSST9TfEcA2/IuwxhNvqL+Rv8RUqjFkCx3bF7EXpxiQ1ErZhb?=
 =?us-ascii?Q?rz9aGYCCzbQce9o/YoyRpa2Cs42KNj5dY41MMybJqR7h6y+sGMcWXsuZ/9sj?=
 =?us-ascii?Q?oSkFZBtYUiRpBCZAdOkW+OVavK3M8fG2SgKFSjjlfuH10BEaW+lZWhR5fhH6?=
 =?us-ascii?Q?oV2Qp1MEtkkAQQyAhO7vxfSpDtuCR1W5XEhz7QJ92GbaghqvGbN5wuwUMAfj?=
 =?us-ascii?Q?6ga7FqK/hJzDnZn5oWvXtx9LwPMmSyJ0Ztbn0tPC7wru6iU5TgWfL+N8p2AJ?=
 =?us-ascii?Q?WMB9mSy9l5wnoeig6NlFCOlrEOKp1Ay19DBQLNssfInaGgTJBuMS2MHueQK1?=
 =?us-ascii?Q?gfN6sfe1mSm1XEYHkYJnNi4xudT9zks1JW16uD/JlCiOdS/82BTGvOA1lWEv?=
 =?us-ascii?Q?x27uEVVfltRP8t/2eDh2n48+n1DTPR+Nf0wegiRzX7NXFe6mh5OoqP+qQ3NK?=
 =?us-ascii?Q?LrjpmNA4l5Adylc9jH6ZxnUwcCqis96ZMnMhyrh4XCpX3LPu18OFhKKSV1mW?=
 =?us-ascii?Q?BZuMaeCWbzirvkG/imI/mceeb6T7AhcdTo7lN0BfbvGGc6fnOLyE4QZw/IlQ?=
 =?us-ascii?Q?PrHVOZxeV/LL9oWiOBgFgjEWLYAdlAz6sinHmyMZbxnwivQdWkxbg0zF+xZz?=
 =?us-ascii?Q?GTgUyf/s/vl//EK0lUndBklF0N5Dh2uyNGVrQH/MzAR8j3cO3HXNMAcEOJai?=
 =?us-ascii?Q?YFYzbfYAVjZUSmyK1pWHaVVktMLHoVF5tuUPJBrU+UARUa/5Sc5Ev/bf2g2M?=
 =?us-ascii?Q?AglLEi7K8TESRW3TkQFfIfkKnJIHFSSss/89lbk7iBFaK3ShZOWjkNTv87Iv?=
 =?us-ascii?Q?vRfpFWNQhBPk6bbZJWRh//vuSQp+3RIa7r6PwgeJbg4RSgllSX4zSruw7zvs?=
 =?us-ascii?Q?SJB8oWGPAoJaCL1k6u3Ozr3yypBzgUY3s65pyal8n4Y3w3HCnTcMyNifE6hb?=
 =?us-ascii?Q?53zzicdlVepOX/YXy9TlDRUmiYEtgP2jfo2YKIKhNf0wVvVba2gc9DJ3vRSt?=
 =?us-ascii?Q?uMoHsuA7srTCMlqyt2yc41p/F4RIUR/QSmIoYvmaJrslnZZwNwunpuWWFp6w?=
 =?us-ascii?Q?fQpB19YzTiinpkdq7axkSIGRX242LkRYCojMDNxh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d50067a2-447f-47ec-3242-08dc78a46429
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 08:11:03.3031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hfkzjpx+ufXVUAI0kZP2QfmQ/T6dyNdMPdOXkqYZ83j0gVXgtRE/pzFNT5i5EejhJD2C385f1nRBxOGtgEXJRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4882
X-Proofpoint-ORIG-GUID: 9V1K86n-Xq0Fgxy73qxniPFPa70Gtt58
X-Proofpoint-GUID: 9V1K86n-Xq0Fgxy73qxniPFPa70Gtt58
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_04,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=700
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405200067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 08:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199560

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/{cups_2.4.7.bb => cups_2.4.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cups/{cups_2.4.7.bb => cups_2.4.8.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups_2.4.7.bb b/meta/recipes-extended/cups/cups_2.4.8.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.7.bb
rename to meta/recipes-extended/cups/cups_2.4.8.bb
index f4b0282e4c..c0cddf7e99 100644
--- a/meta/recipes-extended/cups/cups_2.4.7.bb
+++ b/meta/recipes-extended/cups/cups_2.4.8.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "dd54228dd903526428ce7e37961afaed230ad310788141da75cebaa08362cf6c"
+SRC_URI[sha256sum] = "75c326b4ba73975efcc9a25078c4b04cdb4ee333caaad0d0823dbd522c6479a0"
-- 
2.34.1


