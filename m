Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E66FCAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 07:14:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11040.1758611682202578735
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 00:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MPpIaFuJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13610b8466=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58N5Uudl1677840
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 07:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=zwjtBRhGcySgzcS8H39j
	LdaN6atPzF0sYVYXiyLur0U=; b=MPpIaFuJMApjgP/TDYkzDpHTbC+aAl8LdDwo
	J9+yI5zVcEhIiZg79Y47NV/dQZRISRa2JO/KyvXNdGU7CbtKTfGWwqFh2kjXnkw6
	S1YTG3f0VAIXcPKxjebiIOE4UXhy3dMgvteYzG1jSMcGzqZfKOEdzQKZqJb/zt23
	7B6IBeXhx68Z6fKQpDwmUepXR8BzGyR7DQPQvnNFIXDhF5xKybwBFxTapZH/k176
	RmwEIyKsfuewjYUvhhb6GA/KMzHk0qcEmyEhCOHKmc/J5I1MC0rfoKsIMJsnLVCC
	RQQ/MDK3Mg7vOVo5fo/J52BKdvN3il5GWAzKf88Ejg0IzAmotw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012037.outbound.protection.outlook.com [52.101.43.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499k89as79-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 07:14:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYjdIe6iJW8XqH27Zq/HpXc6YE6bJjuTDTHpu2OUvRE1IJG7vUHglA+Ed7aH2adXA2P2LSYfuu2IHLd23V+D8T0iNwDqV2mH+Ao+uVshei8u3bAQDyk/1K4fqYrMU1Of260BdaiodR0KJzRlZGhJj8wpp0i7VPclojkw/JZCYWOwko2BQb86qlt7KMigxXq8ygEG9PRuxgJ8O399QtsMJQckIiA22IX7dSxy/rdu93ok4gBsbOEkhA5kldLbHn4cLUWEe7JFZanZkmzz8pTZkdFI0ODmGWnl9Re9eNm2xwZ64AdxvtixZi6NaZbYu0HgfC3RyIPtOal9ZZvUnyovgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwjtBRhGcySgzcS8H39jLdaN6atPzF0sYVYXiyLur0U=;
 b=BMrgcR98j0EttBVmF41/iYweMtdn9XEMby7a8JAw0wwAegCad7XXsSz6qlcx85VybpHR8WFm5egYO+1IufQzsQqVB2dfBs6wWNWBPO7/eiJ4EbRdF/TIrk7SV5COrK4QinMVqIkLIx/Wc0GTOdNFoMubk9+xZP5WDNhZx15znFbMj0eSULNKK+XgcZWDnj9D7lIRWCDYeKqcB8hC0Kx/TWYvDkNw9sPjnDDCu7CQtlGNtpyc9vtbXRoO9JDKaDpMnJTyaDLE3YeIzWw5hkq02+c7/xnaxM+QF06ffb2ixcw1zy708vCpgdhXeTbdSKhJAs1goppVdtosX6jbsLgRkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA0PR11MB4750.namprd11.prod.outlook.com (2603:10b6:806:9d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.21; Tue, 23 Sep 2025 07:14:38 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 07:14:38 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] tcl8: upgrade 8.6.16 -> 8.6.17
Date: Tue, 23 Sep 2025 15:11:38 +0800
Message-Id: <20250923071138.3313786-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA0PR11MB4750:EE_
X-MS-Office365-Filtering-Correlation-Id: b1729531-5f09-4710-4905-08ddfa7078eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SaRAM+zhMY5RfbuTxg5sUK5WOE877iq3N8xwXSp+c21qM1TBO2h+IS2cVkV+?=
 =?us-ascii?Q?tYd6ZvP4BfclrRkk/IV2W33bH1o528yQQi6Th+TZHAsTD0DbLLns/xd1+96K?=
 =?us-ascii?Q?uTapP0FlA77C/YxpcmiGXxDFIbaFBmQhEVDEpaIlStN44TBOHHwe4vbIt0ce?=
 =?us-ascii?Q?VfKeEiOKoPR822ZSaStNfsvoOqIz9aO1i+kM99bfJXk8YOJLxy2+O2fPYHi8?=
 =?us-ascii?Q?noNQgWm0pYQ6dDme3uoST/rJgF/F3LSVOjwVqIrZWMwrAawbe6BywpdHb9Cz?=
 =?us-ascii?Q?+v+65mKSr+Jrufxt6bRgNrbkwRMxy8SZDJkg4NEbyYaXZ4EgKolMP9C6DEyT?=
 =?us-ascii?Q?Wuz4RpJV/mmrJ1KQJMDXYRT4ei0cGdMn1/vhtwVMWvg91oR8sOVI72IdmiOv?=
 =?us-ascii?Q?7CixmpxUJC08mqStw0m3/pONoG0vb19Q09HRci95u8U7nx+uOUE1L+Kdrz7Z?=
 =?us-ascii?Q?u3z59b6q7OpEyT/Zbuv0XV7mOoGP/0XHsUdqkPTayJEf1dGtVsYDGo55zWh9?=
 =?us-ascii?Q?9qY9yj4I9ouy9DkD/NbZOZBYh3h3QGa9EPZCbo9CLqXE+YaQX09pa/HmWgln?=
 =?us-ascii?Q?F94RWRnE4Qes/6J8rwxCLY+yvzZHgpj+RhH+ZzcUUaQ8JWVoYjYlahTsOmJ/?=
 =?us-ascii?Q?JlULoOiZ0fVPgBhUXih20ndDJ1+gd5JP6/otKxP1nklBhQjKfdhQJQF3ZaFZ?=
 =?us-ascii?Q?kYBNrhjkPV6MSvHbzzzhHv6pTgyGMFq9RowIvlvZ9wfwuQQLliIOFnrr5/Fu?=
 =?us-ascii?Q?o1jSiQ/6GRTB8HB5rO91HVVxmHQHK+9+uz2ujMQNNjkTUW/SdFlpZfD2BITQ?=
 =?us-ascii?Q?0oO5rNRAFK6gzlgMoS7Hpi05Rv8C7QeySIUXfoRcbiDyMgvs/qW6HpsoZ33Q?=
 =?us-ascii?Q?iepU38ek/369DO2O23dzXUirA3Soj0hJtfa0vW0yV2oBtkT9r61UQYB7Pnl2?=
 =?us-ascii?Q?1+gug40Wl1F2cBIytEKkh0p5VTTM+WmMB8wS9qxWkj3vFqugKjOoZYQmDbAr?=
 =?us-ascii?Q?+9wTEs1ACq/DFp1y+59KrNE1iSPnV0IOk5BvNhhC4TkI5iXnUD3rCcIcL/2x?=
 =?us-ascii?Q?rXclVK443r/UBQXN2Y5jjVCILguBW05TBD8FoXDxLmoBSqqbKA4BXfKV/Y2/?=
 =?us-ascii?Q?Te7svbqyaYw4fv/ItPjn5OlvVgECyVxhN1aR5iDcoepTJRNccJEKHbd7QAoT?=
 =?us-ascii?Q?dysEb8jRPmgmivqGMuWZqdA+CTfxUzNlpxllZYMdte1j6fJXmjGjbXW/p0Ip?=
 =?us-ascii?Q?V4rtVH7a14dU37tvRcHWQW9rPGE4IObnmVhW7g75yvNy9JcTE/AER+GZmkeW?=
 =?us-ascii?Q?7/uibkMvFM3ZFIRrTbrDkH0ZDtvY9soQb5FczCj6/qlHmAZxFUFcvQ8+HjdG?=
 =?us-ascii?Q?vi35wqZ+nuxg3Ui9sZkKjSWTUOGNXWDd7oqva7HDxpCAyqErtce2Z00hbtNh?=
 =?us-ascii?Q?LydcumaYlA0JClxmJzyi+tAyqS1+yXc7IDna3FgCbMIqBZapma86FA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5Atrx2QWEMjns2ZRJgK/dBUeHNQtnYUTMMKmex563woe5tagXRo3gvD5D/0R?=
 =?us-ascii?Q?oLFZG+75DNDKqxgj+yc1Rf7EHB1OiJtw5ZTyNJ07aDUjeeb29CyLaWvSLlYB?=
 =?us-ascii?Q?rTMqfmL72fjzpfMWN4yDdvCIbzi0xmL4IjFlzEvaDZaTRqnU5KQs/hBR2sGb?=
 =?us-ascii?Q?2WGWZt4TznC0ehCLENx1ZqWQyjdlMkPLlDDPOsxAmON3Vfv8E3/887sL+BK2?=
 =?us-ascii?Q?e6tc4iyKoCJAwC6FN2WymlXxxXttfQHZq94DKHvQID3EVl+6ssY5hduOapTo?=
 =?us-ascii?Q?OBmdwM1NPMhu4q65oxB1rQpr7QxULGYD2e3GzowS+ntlKgodoKEaFViIAOKf?=
 =?us-ascii?Q?TE7oeJYObNlrWUUHjsA2ezKbsoqoL8uRzq45cOxOqiBoKDO4o1SypqGVC5GU?=
 =?us-ascii?Q?jCFdd7CwV3CBoDMJxjJcfCT//LIw87Gi62mhIypOnWtTyym1XM9HGAQNnpa4?=
 =?us-ascii?Q?VPz44BPK1q8EG6KvUUfAr+ECxqw66O4VJZpwsxqKk3Waqj6uNXe2PQGWxwth?=
 =?us-ascii?Q?Z1T6W+zU+4mYoBtJszT222wStffqp2CO9UAnlTbXsgk6NQMzOeJS8nQq5Zny?=
 =?us-ascii?Q?h0vs6ZPxNfne9IX5pF7nc9gttFnVTJLiupZzhQ6GBXr13jE0VUUoH1fYvUlV?=
 =?us-ascii?Q?hVPmB4Nr2s7yTSTjNgJgj2Pfv3st8Dr8r6FFxbAbjfKK6EVrFNJAVXgNcv8T?=
 =?us-ascii?Q?FImY7ry9qt+ZPL8DQ9Sdh4SaNxOwBHYJJ871Jv8aGIzvETHGy772kHgH2M/8?=
 =?us-ascii?Q?4r0fR2XqMDo74bw5n1bCnHRMIf1RU/bzs4tR3kp76dZXWIwN+UyCkK3043KN?=
 =?us-ascii?Q?6AsW1TzCXWokROBdiWu1DMv5qb5jzUCnfEc1ec6QfOyrhL9AjbWaGXdRdygt?=
 =?us-ascii?Q?M2wQQkNSOQv4D90D+jZN5c7paHkeRyIiv0Z33PQ+qaYEWDVljLTAzgydwhWt?=
 =?us-ascii?Q?UoBdPkoyMTVeGZMQhOzGth3X1cnNHx4Zdy96efg0xv2u/wvNiNZsUE4e+Kie?=
 =?us-ascii?Q?jz13BnvR+UuVtDoDEql4JAZnW8FqKjx42UjR+6hMgc0GIpAp3sVLJmU3ZyX9?=
 =?us-ascii?Q?MLg8hRqpzkiSwf/JX+vwNfDBVw47oLd5w6y59zhQm9lIcZWSmpaPWNlK3706?=
 =?us-ascii?Q?4sLkNs4eeagsV/2BQJ7F7ICC6Ltpu/iMI0dD6FjmEw0iKhUZHPI72OsEy6Cd?=
 =?us-ascii?Q?tpq31x78OCUcnj87xcqk8Cf46iQNVO1mVipmLbC/RdVZeLcCqmZt5Ogcmw7E?=
 =?us-ascii?Q?/S9YX8Cc2w060eKn1GUKERj+q1r+e9HYKN/9Tok49bAiT2XcASHvk/zLPfhj?=
 =?us-ascii?Q?iyKKDfNip006UXcVtPgb1J14t1orKY1Cv0wZ1k5NsDDcgj83mTT4fnYzuyHg?=
 =?us-ascii?Q?gj9UZlRHJBslQo+/VI2izQUkP3Pbfo8AIYVEvV+ewaVhuV++y3ArmC7SrtX2?=
 =?us-ascii?Q?6vB0mtx72H2PgVnaGY2qjV7nBVT6pict0v2acknNjqs+2BL/czhLaO8iXY3S?=
 =?us-ascii?Q?JNepOvmcW+lW4rskmC8/F5RxgO5ZrLUEewl6VDEqCDkzY0HhgJ/KtUr8BQxc?=
 =?us-ascii?Q?pJLCQNrNOEpRy2yNSg2tWc0FnGsZqpCWA2LKvXhS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1729531-5f09-4710-4905-08ddfa7078eb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 07:14:38.3319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruo6Qn7QZV9+I6q7csseA7mn9iajZueIcqEDPOV+w9QxPboX1QoqeLyHWXa/NYAJf5tvxX/1xPpmSnXgKUku5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4750
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDA2NiBTYWx0ZWRfX7IHzw4p73wee
 8HPyaQElzs9tuestOgoHCdrEi0lMog2lfzFIhJ3wP9knH4H2l3e8rn9fDv4NCNTXqdSIhrT4ntG
 nkgM/bepQyKHOhFZbS358Xg/59SzzXvdZcMgbrhIylNC0ng2u4ThVqYBxz+aEmytg92WycI6Q6B
 87sjWkPa0QuBwWFqVfjfcK1+pDmXR/S8k76MhXHi8SKDOHKfkC2QAmlps7SabNw2y+Gy5PDxOh5
 Ee3pRyjaI0VRfCQHnuZYgp/g4t/tSuCEdqshvVVIOJFDHCYMLCWGTWkNSJ3XW3zzP3kq/kuPros
 IAU1KaUHb43uRZ7H48K9XvAXoWhRIljghJBQALL7mcXlfMpSovvfBb+9C44kcs=
X-Authority-Analysis: v=2.4 cv=YZS95xRf c=1 sm=1 tr=0 ts=68d248e1 cx=c_pps
 a=ZegHLSctVnYqdC7w6owYpw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8
 a=7CQSdrXTAAAA:8 a=hLqKH8poeKjM9CXXpecA:9 a=Q4dU0akvcKVpfco8:21
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 3X4TdxJyyeyj0S5Iomj0MNNjXIIWysHv
X-Proofpoint-ORIG-GUID: 3X4TdxJyyeyj0S5Iomj0MNNjXIIWysHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 07:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223866

ChangeLog:
  2024-12-16 (bug) [63449c] [namespace children] doesn't match non-glob
             patterns below the global namespace
  2025-01-06 (bug) [fc3509] Better error-message than "interpreter uses
             an incompatible stubs mechanism"
  2025-01-19 tzdata updated to Olson's tzdata2025a
  2025-01-28 (bug) [4f0b57] Win: [exec] now works on App Execution
             Aliases.
  2025-01-28 (bug) [4e2c8b] Win: [auto_execok] handles larger set of
             shell commands.
  2025-03-06 (bug) [ba68d1] errorline from [interp eval], interp-26.9
  2025-03-23 tzdata updated to Olson's tzdata2025b
  2025-04-11 (bug) [fd8341] Tcl_InitStubs compatibility for 9.1, better
             error-handling
  2025-05-05 (bug) [42d14c] Fix scan with long mantissa. Ex.: scan
             "1.[string repeat 1 191]e-321" %g
  2025-06-18 (bug) [4f338b] add missing Tcl_CloseEx docs
  2025-06-24 (bug) [ecf35c] Correct nested handling of return option
             -options
  2025-06-25 (bug) [ecafd8] Euro/Tail-sign missing from cp864 encoding
  2025-07-03 (bug) [6b0f77] gcc 14 breaks configure test for bigendian
             leading to broken floating point
  2025-07-16 (bug) [c9f052] prevent overflow crash in Tcl_SplitList().
  2025-07-21 (bug) [61c01e] Flawed ref counts in filesystem
             implementation for Windows led to use-after-free
  2025-08-12 (new) dde => 1.4.5
  2025-08-12 (bug) [992f94] avoid misaligned pointers in macOS file
             attribute functions

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---

v2 change: fix ptest failure

 ...ric-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch | 6 +++---
 meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch  | 8 ++++----
 .../tcltk8/tcl8/fix_non_native_build_issue.patch          | 4 ++--
 meta/recipes-devtools/tcltk8/tcl8/interp.patch            | 6 +++---
 meta/recipes-devtools/tcltk8/tcl8/run-ptest               | 2 ++
 meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch    | 4 ++--
 .../tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch   | 4 ++--
 .../tcltk8/{tcl8_8.6.16.bb => tcl8_8.6.17.bb}             | 2 +-
 8 files changed, 19 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/tcltk8/{tcl8_8.6.16.bb => tcl8_8.6.17.bb} (98%)

diff --git a/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch b/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
index 1859992838..6ba7ff4340 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
@@ -1,4 +1,4 @@
-From ff508f2e6786df697876140f21855ecb92a3ed36 Mon Sep 17 00:00:00 2001
+From 7d404d1827ffb69a2aa7b60c10b435c6f47f7bfb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 18 Aug 2023 12:25:11 +0200
 Subject: [PATCH] generic/tcl.h: use Tcl_WideInt for seconds in Tcl_Time
@@ -19,10 +19,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/generic/tcl.h b/generic/tcl.h
-index 3a4622e..6204c57 100644
+index d8fd70a..ffff4b1 100644
 --- a/generic/tcl.h
 +++ b/generic/tcl.h
-@@ -1418,7 +1418,7 @@ typedef enum {
+@@ -1425,7 +1425,7 @@ typedef enum {
   */
  
  typedef struct Tcl_Time {
diff --git a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
index 6ceb297cea..ad91b9ffb3 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
@@ -1,4 +1,4 @@
-From 8bb8174e13c1c0e3b27fdf96a393f9fb1b7e14be Mon Sep 17 00:00:00 2001
+From bfca2e4ae32ab546f796d9c7ff7cbf542d5b2bfe Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 22 Nov 2022 18:48:27 +0800
 Subject: [PATCH] tcl: update the header location
@@ -26,7 +26,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index c3b75e3..60ed93e 100644
+index 45e7b76..5a46e6a 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
@@ -39,7 +39,7 @@ index c3b75e3..60ed93e 100644
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
 diff --git a/unix/configure.in b/unix/configure.in
-index 8e6726b..2345689 100644
+index 50b3e03..8a33d0c 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
 @@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
@@ -51,7 +51,7 @@ index 8e6726b..2345689 100644
  HTML_DIR='$(DISTDIR)/html'
  
  # Note:  in the following variable, it's important to use the absolute
-@@ -898,7 +898,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+@@ -896,7 +896,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
  TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
  
  # Install time header dir can be set via --includedir
diff --git a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
index 61153878fe..07a1f4d040 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
@@ -1,4 +1,4 @@
-From 3d11e7fd9aba6251974d990286347c06582e87b9 Mon Sep 17 00:00:00 2001
+From ad7847a15163f12c24d8ecb50dffa289876dc830 Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Fri, 13 Aug 2010 12:24:00 -0700
 Subject: [PATCH] tcl: fix a build issue
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index a2f9e21..c3b75e3 100644
+index ab2e7b5..45e7b76 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -723,7 +723,7 @@ tcltest-real:
diff --git a/meta/recipes-devtools/tcltk8/tcl8/interp.patch b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
index aeebb038e3..c6412e7775 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/interp.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
@@ -1,4 +1,4 @@
-From 09049beed723243d092ffaa37939dfe0f2ed6828 Mon Sep 17 00:00:00 2001
+From 2d959d1fdfbd7e020f5177b1a7ff6a08809536ca Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 12 Jul 2021 14:50:13 +0100
 Subject: [PATCH] tcl: fix race in interp.test
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/tests/interp.test b/tests/interp.test
-index 24ffb1b..c6460ad 100644
+index d64fdd4..9931dd1 100644
 --- a/tests/interp.test
 +++ b/tests/interp.test
-@@ -3614,17 +3614,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
+@@ -3651,17 +3651,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
          variable result
          set result [lindex $args 0]
      }
diff --git a/meta/recipes-devtools/tcltk8/tcl8/run-ptest b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
index 687e06fa4b..12921d8cfd 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/run-ptest
+++ b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
@@ -4,6 +4,8 @@
 export TZ="Europe/London"
 export TCL_LIBRARY=@libdir@/tcl8/ptest/library
 export ERROR_ON_FAILURES=1
+export LC_ALL=en_US.UTF-8
+export LANG=en_US.UTF-8
 
 # Some tests are overly strict with timings and fail on loaded systems.
 SKIP=""
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
index 898e8241fc..0f8bd062ac 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
@@ -1,4 +1,4 @@
-From 0d8e567d132e050c5d4a8d8d9257417e0679483c Mon Sep 17 00:00:00 2001
+From 2af07e2d0f0cb9f42ff982ce257e2067dcf1ec77 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 9 Dec 2009 23:59:44 +0000
 Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging function
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index bc743b3..a2f9e21 100644
+index 3efdfec..ab2e7b5 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -812,7 +812,10 @@ install-binaries: binaries
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
index f2a37add7d..12e1937aa1 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
@@ -1,4 +1,4 @@
-From 6e3cbc3600ac474776e92eb9a88abcb74299c321 Mon Sep 17 00:00:00 2001
+From 0b479a0dc845f9926cb40c13d86e55391a89fe98 Mon Sep 17 00:00:00 2001
 From: "Song.Li" <Song.Li@windriver.com>
 Date: Wed, 1 Aug 2012 19:05:51 +0800
 Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit target
@@ -17,7 +17,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unix/configure.in b/unix/configure.in
-index e88ec3c..8e6726b 100644
+index ed07ca5..50b3e03 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
 @@ -774,7 +774,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
similarity index 98%
rename from meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
rename to meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
index 225f04be48..d4bdd71c05 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
@@ -25,7 +25,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://run-ptest \
            file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch \
            "
-SRC_URI[sha256sum] = "3b371386a9a928eecdbf263bcab7d6a531e620ca3fbab4fdeeb3d6a9a56f38e9"
+SRC_URI[sha256sum] = "a1d8cbe44b38beaa29fc2130c4e7b79b8bf02e2bcc028ffefd7a25a2122202a0"
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 
-- 
2.34.1


