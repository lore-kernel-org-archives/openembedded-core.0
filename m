Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36E3D2E9F2
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 13:47:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.51158.1731297152963085273
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Nov 2024 19:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10457aa086=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB3THZk010096
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 03:52:32 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42sxq8hfv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 03:52:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJszN93a28IVwMRbq5etDQtOFTyup/CjHEUqzl3CT3fS6+5+BnriuopsFS3DH2Bv+FTDs0Nj3rLWI+eFbuL3+6kY5mvwGhm2SbND/ZNkoT3POeN22wS68Ui172MY/5fURy33T4YKyJKxGf1pP2XopStHsB6bo7ugYkOoJb40rWOU82IOp0t0yv/j9QmKJDna3loSY39SxQ8qIxz3vMR6O+nNnVdsmidV/BsotvflRPlaGfa+hJn7GVzuELg8ORtRq8GmrRW3Rq92FwU3F6gJe8adwH7kJG5N504OL8OUX/r2KK+PWd1AI3/9dNMVbR30fhQ1Mk4h5u8xpEt2/ttMQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fl2wMqfok3cASuEqq+61baSa43p7CxnAmCbN61H825I=;
 b=nfatgdK6v3WiiSHr79gp5dHUQukmluZ5KGIdCeGHhtYWdmPZG/7xbHGo3gBI4A7ZOPyMWE0TpSobJSdSIfbTI3qBndaDpUW5Gbk0waeWi/WMcDg0WyYfwzyu4JZetPTpGQs5525mEmL5AbDACm59kEWMhDR3TqKzo0UuucEw8rJFSIFJKSk8JUsslgKgebMmSz0IUZk1k0emsoDjWpeeiirBE7Nqn3WNbLuKqF1PB82Nh6CMsfqNHnHVowWrKVcceT5gZWDaLG0qfFF1RZyAgJAGa6mZ2x6RKtK6i805xi2zXivyL/sMr1LGWvxMyjJn61EptUL+vjkg1sJ64w3nkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB3152.namprd11.prod.outlook.com (2603:10b6:805:cd::19)
 by CH3PR11MB8138.namprd11.prod.outlook.com (2603:10b6:610:158::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Mon, 11 Nov
 2024 03:52:29 +0000
Received: from SN6PR11MB3152.namprd11.prod.outlook.com
 ([fe80::b311:7964:52a0:4174]) by SN6PR11MB3152.namprd11.prod.outlook.com
 ([fe80::b311:7964:52a0:4174%4]) with mapi id 15.20.8137.019; Mon, 11 Nov 2024
 03:52:29 +0000
From: "Chen, Libo (CN)" <libo.chen.cn@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rt_bmark.py: fix TypeError
Date: Mon, 11 Nov 2024 11:52:15 +0800
Message-Id: <20241111035215.1633406-1-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: TYCP286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::17) To SN6PR11MB3152.namprd11.prod.outlook.com
 (2603:10b6:805:cd::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3152:EE_|CH3PR11MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c7cc80-2507-4127-e73b-08dd0204439d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BP6Tzi78YEkn3O+cUrL/f4pUdFw9A3x01alDyh3vTW/L1JR4hK2l0Pg1bWTI?=
 =?us-ascii?Q?4S0H8Kt6LfQBNAXdB3tdbde1+KHHwBA1M2BQyVBG4gstp6R/QfK2Oi15/1xD?=
 =?us-ascii?Q?dd6HJX+wKRpABKS1i+tTj1icxCbp3+Mv7OThHVSm2OrWSBXvyLjTxULX2h2H?=
 =?us-ascii?Q?W64RUWI0r78mj2PDN4bQTjOZuatyOwGYJcxeyZOHPgYIsy0OaTki/EAiZs7w?=
 =?us-ascii?Q?qnzirl96NWzbGCDFE6YfyH3Vux85q1vkT5NJojjtn+moOOyXqNDEaZ31D3PJ?=
 =?us-ascii?Q?Hv3lDqvn1fQNQYpkTbLvXuJOrAqEIvGRAV3z6krgFT5x9fXgy7ktvT8pS3Cx?=
 =?us-ascii?Q?XuaEE0jgsLG4v9WdK0F3DAIFG7WZKBPOc/U1B7JlICUxT5UkxqNCAyxQyS8L?=
 =?us-ascii?Q?FVzu6eEcE/3adwdbuF9keeN1ZYKLgKKZT2RwC5dXwsiPcyFo+HktyP+tE8i/?=
 =?us-ascii?Q?4A8KNdcM8XfpMhG/QAbctYUGI6eAMY9DUd68FtfQpWnO9hCyCr+7EdJrBzL3?=
 =?us-ascii?Q?nWnOiDJfrfvlwANSgQ4W3NA1pgGaDuWdQ1RRG+vjevqr8/Tc3Hs08/mQhJbv?=
 =?us-ascii?Q?2PhgAH5MVBNjj0mw+PGNBKV0JrDJ/W1eznJKwpd56txPdxpsJ0JAe4j+nF2W?=
 =?us-ascii?Q?qo6XYLrp1GaqhzxRo/nvtj7LdeWSqT4Po1Swq46HYiEG5tjik7u+sprBnpgj?=
 =?us-ascii?Q?N6J5LRDs0D9SirtwuHzgORUE7z3K8g7R7mTqg6hAEyBx6kLPPNFsqCN7CpPV?=
 =?us-ascii?Q?TwOc+A8o5JjzhNXF3SA01MO1IaqvRGcOO06ABErKyms6aVNuUiZXDJfN9IcJ?=
 =?us-ascii?Q?SEjhWbz+08Znh4kpZ/ZBvM7/MhuQbB7u0bX95flJTTejhzH2os4Jq6b6fnwi?=
 =?us-ascii?Q?QKrAC4s3PuWetKXh8+OiNDKlYkygWhW0aXRb4tWitVhGby7EWeN+i+hyAKxO?=
 =?us-ascii?Q?N5FohfKIf3sryKCk/LBmwePU+9Al4r9Vi6BwWnVVtZGdXlU75T2r/DwvlDXF?=
 =?us-ascii?Q?6/DLDfo4C6r3izTCMnd+a32FRHZDbNzBnQ9j6dJUVnJVXWuzV6ZKEVPhYHBT?=
 =?us-ascii?Q?nbTg25uzxdw1pMLVwtjRlRwmKsAYVnb5pzHswK7zJeSbj++Qit836hjgEPrp?=
 =?us-ascii?Q?Sbzlve1XYilKJPC+K//0Yq60/GqanXTKy8BM4YpzR50OigSbeIkZh14Ug3+d?=
 =?us-ascii?Q?f1uZfwoM4Wp3pMwDB/DkBnRX5n/fekSC/6ylep84ezkeeKaKNS8RqZp7FlUB?=
 =?us-ascii?Q?LlfrSKSr/t2pOCkXCbeuNFHMUrBDaJzsCat+Jc7VmywA6ASnuYe1u510AHmS?=
 =?us-ascii?Q?4CrIlafy0TVz/gJzHhOR1jQ0KmcM74SwPzVSMffU7Nuugg4DIHbjpG3P25XX?=
 =?us-ascii?Q?kEvM2Lc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CKw3kKRWm4vUhfdsXHthVj2TJaunn7eAh7cH+xo7ypWTVC/iP1pnqQtmPkDL?=
 =?us-ascii?Q?4OyOqwLDMSAAZCbay+Ua+syxzMykvJW1Q0CzafCGSMPLB4YAcLfnAVKHaSZw?=
 =?us-ascii?Q?Vyr96o0eDXr3zTOOckIYc84BtDTn+VQugp0Ch2qRuCY+oMwOg02YCOCxUs9p?=
 =?us-ascii?Q?zxQXBPanGXEK+wOZXlP8y92vROq1Cqd8Qr1jlYS3CWYtwdCWR65rrfIe7kha?=
 =?us-ascii?Q?KCj90la+NXNyPosu5QESnVN/UIQ1DgP2RCqDeQjrrkfWCIMmatBXA9DF/qDp?=
 =?us-ascii?Q?zZ2b1g3qLOUSYvYAuN+ZHbU7/ALeQGBeQ80jp++yyFXfC99eSE1TaSlgHDr2?=
 =?us-ascii?Q?d8Pqi6nPYnrS78SiNPoD27EeY8zwMXxscHnl1HtVKQ0n+IwtDKWdZJCZ/kIe?=
 =?us-ascii?Q?zxJj0L1YKEep8pLXp4P89ocBBIua9IPvldwkrpPa8kjmG1bnqIpxLXh6fNfW?=
 =?us-ascii?Q?8zIk6h57v0UlP3CR/wtlxS1V+9zcSLLvpIt+L6akYMjRSkvZ9E1Ry4UIvUb/?=
 =?us-ascii?Q?BbD0jun7WGkTTtC8mnPfrakJOEEqFdT5eB+dH0+9Iu09pcxXzXmY9XEILXj5?=
 =?us-ascii?Q?kYHRz8+MU93vh68utc57h9dPEaoGbYAyVGEOt1yjBtgTqVoBRROgJF08s7xr?=
 =?us-ascii?Q?ltuQnaX1iISGB3Ca8PqsgzQLsAPpWaxshdZZBUfzvbvhfJWDNRfJXnNCO3Us?=
 =?us-ascii?Q?TAi/a/TG76ihTYjeKncbYi7uEg8PX6LNOBysTBehUAhO7haChqGrWKkFlApi?=
 =?us-ascii?Q?edpZ4CAI+5Q6i9w2aFpho7V2Y7zQ0H/3txVMNqNtDiw9Z/Np7gAtECOdxkP7?=
 =?us-ascii?Q?1QZikyzcz99pLE5l5uq2WcOuW/5Fnn1MDk2EzLRC1CU8ZBsG+yD1rhO/2Rnj?=
 =?us-ascii?Q?CxmUZ5JSDTEl6YA5sAnnUpGnNKRA7aN79A+rCrfENmhz29d/RwDT4udJgPuN?=
 =?us-ascii?Q?y6LwVjUk/1AIi6OYrNasrExeU4p14+Y/rvTPzbDSmwa5Cf48f0pgdHpxz6CZ?=
 =?us-ascii?Q?6WSn3kwAinbFzaDLvz6pwFJHNWcj8X4Y6ThNH2usvsL7h/muposl2B0oTBdG?=
 =?us-ascii?Q?ElRZb7shm+rD9W1r2GP+0CXwkIpVNZOHGaiFkVlkMsc5lRDp8kV8Yc41qLTJ?=
 =?us-ascii?Q?tiMtrPBCRtu3XzpVlEjlHHkyF2glvDMXrYGFmk6QDL7gYSQLqeIWdF+NOuOf?=
 =?us-ascii?Q?jki4vo2el0SwwNeRXUxcgk7La38VQsYCJKCgPjQNbTsodGqxXpzGHMUi0GEr?=
 =?us-ascii?Q?LupahVgw8x8K2p/NDYFLQeBc1MUQgRv0AY7ouJbVSoDtzwUzs45czysZlS9G?=
 =?us-ascii?Q?57e3JkabCgu9sh3J5GtijThagTsTF8R1pHuw6qjWQw0qgcpy5IXJBpqgip7S?=
 =?us-ascii?Q?LbBg1n/hse0LroYPohobq+k1g/3EBvTnlBg565NE3gRwIqLOHXB69ba4C2Ln?=
 =?us-ascii?Q?s/uybTyhSUf8mj6J/2oCEpSX7l23MXl4f6wyCN4SbDmPjZvczQKBOkQV6cCY?=
 =?us-ascii?Q?nYVgTQGwPbF7KIS3m50k28yTsNWGUyLA5wkS1oRn7xQyN4maUKwVAA+xmGKL?=
 =?us-ascii?Q?CCKfag0JUuTJLKzQ0EXa8Tnb+WB1BiFGpMLBkBQfYESnW6wPRYeNtTQOR027?=
 =?us-ascii?Q?og=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c7cc80-2507-4127-e73b-08dd0204439d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 03:52:29.6666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQrkYKjPLB3t9qsU3cG/9z8RpkfOZgiXfydaKbceLLvJTRtcZaJXyYkP0MS9sbYRUg4Vc7+ISr8Qeo28SSDZrbStpkD8b9/TlkM21zUJROo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8138
X-Proofpoint-GUID: DXizmmoMNXeBDjDq0tVlInuhCOZP6x3m
X-Proofpoint-ORIG-GUID: DXizmmoMNXeBDjDq0tVlInuhCOZP6x3m
X-Authority-Analysis: v=2.4 cv=Z+m+H2RA c=1 sm=1 tr=0 ts=67317f7f cx=c_pps a=GoGv2RwMe+/7w9MjyR+VRg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=t7tLFSoRaguH63rID_YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_02,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=657 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411110031
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 13:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206957

From: Libo Chen <libo.chen.cn@windriver.com>

Upstream-Status: Inappropriate [oe-core specific]

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 rt_bmark.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rt_bmark.py b/rt_bmark.py
index 2a4eed4..19a617f 100755
--- a/rt_bmark.py
+++ b/rt_bmark.py
@@ -268,7 +268,7 @@ cmd = ("cyclictest",
 rex = re.compile(r"C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+)")
 
 def run_cyclictest_once():
-        res = subprocess.check_output(cmd)
+        res = subprocess.check_output(cmd, encoding='utf-8')
 
         # minlist and maxlist are lists with the extremes for each core
         # avg_cnt is the sum of cycles for all cores
-- 
2.25.1


