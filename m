Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCAAEC112B
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 01:51:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11145.1771897911202110775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 17:51:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fymFEnB4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6515bcc28d=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O1W1t4439974
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=epon+EDkS6wzhJCJo/tl
	B2nclZSSHySzX+b9fRbkYlk=; b=fymFEnB4I/GERL4jbBXL0BiVBPNB/qjvn6xg
	5BXfD2rChdLY0GMpAx1p4B+7eVEWL1+GFWVAI25/MXVTwahV5LHgimPR9YdrCchY
	opVTBRvd0tMTG6ww2u9SUFqTKMkq3iuQaFn+2xxxIOoP7O7NhDid3SahFdK6tlC/
	eOtgBMY8xWBb4mxQG8wxti8O1gWtiuu1HKJK2oKzRmsyWYEwckSlYref/CoA6Uyd
	qIz3Hlc+B/5s9NRT7NkAOFydU9nmfX5ccdDT0uybzlUiBSuKtopm3AIicsSPLaym
	XKPSTrpQB905AVs/9lE3oeD9QO28JW7bFOj8OrTNKC6zcIxGmA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf3p4akfj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:51:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMTHsvU1fKHhYVYWgxNgtmyOl3/uvHn/MUXswD/6AIIKaxIPoyWcHx5t4ZUknv6MssbkUUdirzer8ZiwESQIjiU9resEhd6ZHBdxqHtoXW0wZa1t7QIMGQNnDUzH9xNp2aH7n6WrrhylD3NyY1SIKRD7H3+NTpfwg4D9+hfFnKQWw2Xj7+48rZeaJlH8W0+1VH32FxFwZf2lumOgBo8HHFyqQERBSdY482SfEhPLrZk+Eg5zOFACGP04pATR+1XlWNqPsziH2pxhOZXnxTK95gCQCadFzNcLslHSP/EPYpRULM9XLDseMKW7gdjyS9MUN6QLkAL7w1WLy4hc2Q5/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epon+EDkS6wzhJCJo/tlB2nclZSSHySzX+b9fRbkYlk=;
 b=RifJIjEu5OyL76P+ZqMOPEfH2jvfLFWjAxOjZSEs1hpTX+po6TVsDYRaRrLQ+45lg4xUTPI4aWnuz7p8dHfpfdHiclObmg6xrE9WGTklxvTEnqQpGtZbtXbht2LWQjkxijIEbYEfql6Bk0u+C06HlVCMllQonY9fpJPCuEnLpGfZ7jZMp1TauWkwg1R2YINIqzXxLDgs2fgrwGcxaMJmpRRI16+hvNgqnz1LQs/KlwPvyshoPsksamx5JZB6dsVR4ituAGIGmvC5TEV4y3H2Jsg/pxW/JKJVGbK2Gju0Gvz+4gVgxRHbNEc5+Avs3fpMtDotVHj9ujeyCv/CKRlBAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA4PR11MB9393.namprd11.prod.outlook.com (2603:10b6:208:569::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Tue, 24 Feb
 2026 01:51:48 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 01:51:47 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ruby: upgrade from 3.4.7 to 4.0.1
Date: Tue, 24 Feb 2026 09:51:17 +0800
Message-Id: <20260224015117.3338374-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0059.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::12) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA4PR11MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: 94239d4d-0977-41ae-22e5-08de7347456e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WowcnWcjTQqrsIannYkylwbqjsiB/uqCs9NIucJP3BrzpY2iNN6fU5FOxyyQ?=
 =?us-ascii?Q?S7UFcfwWkyFhrhO3RGGKe8w3ijxYqolfPqbMbQmTF+fPhMW+hwa5AisknPx/?=
 =?us-ascii?Q?BlDpaSYmkZdrtW3N8PsD2mW9PCy9ksD3jipwMARayj0UZ2kKmcUVab0Z3Tz+?=
 =?us-ascii?Q?ekM/51+nEAqyPlsj5IHPlmUPvRryKG0YM16Zigk01Hcl5BoDAMO/pZ4rUOob?=
 =?us-ascii?Q?Ttc8YQG0aJfluM0+CpLtvMryD11+6nymSWktq4nHuNO1QJpxOi7XZhoKrhFG?=
 =?us-ascii?Q?mJhOOGXIDr0a+3gEgOx+xFX0tYvvtYr2yoO9k9cdywVGZyGXwBitdIXyk+Rw?=
 =?us-ascii?Q?SFZnqzHqb0+IUH8/n9mpzeFIcen+hl1Y6uzCErLvJOjIhBxNMBXiE0ZpXsQw?=
 =?us-ascii?Q?XPLJLHKE5ByDd2r+74G2mSYO+299d+7dyJ61Dw3r2y5aBb+bZ2AMOQCUiQkS?=
 =?us-ascii?Q?DYwh+Xboj0LmGr6bdYvWktLgORkgYD69GhNjLcxCh5OAplDcwxBmvU+IRg3W?=
 =?us-ascii?Q?Njrc75GubiZbFAjjgHCy9BB4ZPSTPvuaXQSSQM3BNaqSXJdw0fpAzq5VPXcc?=
 =?us-ascii?Q?PlDS0k5JfQz3Z87xcwIBSk9jJYarRzx99XNr14dt0FH7173E4pwuLgaPtF0s?=
 =?us-ascii?Q?Gm+9rNKD+peBngHKoMzSX64WOSe+4pIrnYxR3RG/dBrH23CRkQr59PPsqQJL?=
 =?us-ascii?Q?hMOILYkGBFm3aOmUelLcTD7NHsig7SQ5AR7O65T7z8h9eO46ldbYVcGRLIB4?=
 =?us-ascii?Q?iTv4NvnKLatO34m0VTWsWOcTfJWTPy5DNp35oQf4WzpQyriuxX5cNodohAEV?=
 =?us-ascii?Q?DF864rq6LXFJU6XQHR1PZFzC4i3moGnSqH+9VIW9OBb9VxzHdENPdfAOH3g7?=
 =?us-ascii?Q?aP9cahamYE7BqbiVB/c0hK/dz/NzVRIqvIESM5MEggRp9avMcwIgYJvg0WV+?=
 =?us-ascii?Q?Rvdt7PtxCO92FCQAwRMfH6gz8mUuCVNXIGRkecKhSWEppAHaonDB5e9ECB+v?=
 =?us-ascii?Q?/YXGuuKp1G41wZQ2/6RuMLIziBc5emylHOubrknwFfAKSSMIQb5Bee8JVLb0?=
 =?us-ascii?Q?+gh/G6ihZfGd2eogbbpTiH24Zt4neJKaWRJaINU8Wb5DzAzcwg/onQw+pciA?=
 =?us-ascii?Q?xf2H4MkeY2jhEv6nnPAhVvxsTZoabJk4CwdTyPlGtLHcyp/+bGEMLGJnqAhT?=
 =?us-ascii?Q?P8tWUxOKLYmCwaaOiE6RdS9ZU3RWLk8+v3tU2mZh8CSxphit/aLXN/wJipAQ?=
 =?us-ascii?Q?Y4FoX4fPbxStoEuJjBSH+yKpHtc/xie79XKehTCeptBKf+V05TBNF8qiWtrf?=
 =?us-ascii?Q?n66MjsXdj8yZuRE7XHYUT6ZtU6SePyywg3+3GzOFGiNBNhJOoZnqVUyIXdH4?=
 =?us-ascii?Q?y1XMJEErIwLNtzjTrJeIHe2+vlgeQ0j9mLIR3CSBtPMeym34SXQ4YgmV+beu?=
 =?us-ascii?Q?6CvbwD4P8c8b4hknelmv2GBZCh24yBbhPblQLsjBl+WZzPq7LL8Q/3ClAtZe?=
 =?us-ascii?Q?WYh4hLS/+3z61cnhCqfXlBi5VJ3KzluEvrN2G/24CnrcXSo7mEZA2KqU6Tfs?=
 =?us-ascii?Q?KphPKmm+6uR1k2LxbGUKqHSBbBR0wELN5bvXd/wG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MQT9wAdY9gRqAa1+5vsGPlBofkCR+pg7SuUh3XWJlXGelQDLcfwrhfCfew+1?=
 =?us-ascii?Q?wE/YBQI97s3fuqp5Kk/KsGCciZuKhwF/uYMSaOUCjJUeaeFpt2S/oQdWXkpt?=
 =?us-ascii?Q?i+uUhUB4TFLNK9iT3DrSrKvpA6S57FuqSc7kn5SXv657oADas0axgvhV/++3?=
 =?us-ascii?Q?+NJh81ZBGA9NWVZwthin7MCK6p54CDcBKWi/fxOlrtvf0+wVPzLB3GASB+n/?=
 =?us-ascii?Q?Yb7xhX6uq+23OyxKbqa1dPOkphIAY1wrqZAeO9LbuiAgkXp8A7gisXtcO61N?=
 =?us-ascii?Q?dip87sXL4Pxb6j/pzJSYTYUVscbo8bc4GvARhfS8pqsACFq8MGLAhy0IZnwt?=
 =?us-ascii?Q?ng54MypyTNAHzbQDw1sgffOYPJ0tadyC/RGRYTMJh+KRVhVzUp3N7FPPHanZ?=
 =?us-ascii?Q?aBJ2hetpp2mM3FvlOEdMpvm1m5DRM3oQCTZml1VxSxk+7yXpvX9lgZUvYPMI?=
 =?us-ascii?Q?zefurlLaemI2gVIW5P6zh2H+1EZnumQr58Tct1Vw2z1YUyJfh9iIjQtN2Psx?=
 =?us-ascii?Q?7CarhOviaJPv29RzlVTQOmDvL20kIwva+OiPoTIgn/ISKCtZum60vlL/7trR?=
 =?us-ascii?Q?qUs52c8VJfjUxwf8TscNVu9ZnpiSgGnCVONrxHS5NodYz+d8tqfmXmry1IP8?=
 =?us-ascii?Q?2zfO3C3BLTuNFfZ+BSBZZBrSXi0OClOgpVfFLcm3fO+Uz8uotGW7VJp299RF?=
 =?us-ascii?Q?Syog7IJOTB1aldv5cl+nQg2sp0ym32/sMNKghVb0OL9CIZFooxxEWGJrUkCf?=
 =?us-ascii?Q?YektdVPjeY8nmruToioXYsGKkhvH9bMuCXhkemut8zCX+FObtLUaONfKRbGr?=
 =?us-ascii?Q?gghHIScdHfhqWYqdIWSXbGJYQ+6hNi7kL67LsTERNBjCynG7LyDjUH/wwTgN?=
 =?us-ascii?Q?fiDIUXy+4PqpHPgyR+cPPi+HROpLqA5Iq5be5EkOMmza+RFtLnuKVrwgJI1+?=
 =?us-ascii?Q?t7koiKNsmpYAKvngDWY9lKxy5hI23AiBr4nEzpT9G7hKkIu3iLFAlk8Fn3Q5?=
 =?us-ascii?Q?Ol9PrIH7UlUFLBOG++CA97KZbwTEsVX/E1ML3gWY/6LXQ0p+Wml5Pve9FH42?=
 =?us-ascii?Q?4aNf7bmq1rFLd9tQzlc/OEfVDUj0veJ4tdb+Yv3mVFEk6ix/3oTWXMlpGd2t?=
 =?us-ascii?Q?oJxiP3BKo/hekEKIwzsRLz028p7jCVoOLh1bNiJPaaIBk++ZxNeClor0t6ai?=
 =?us-ascii?Q?D+Ovjvi96qPSC8FnUxOeNZfrqOfMh9g8YanNAvfc9q5zB1450bye8hGXgEsQ?=
 =?us-ascii?Q?AiHsAjdxiQKzp/IcCfyNh1nGXOzeOdVmVpoxPsCHWKb9FQQ7WHL7NM4AeYFd?=
 =?us-ascii?Q?Y29L2xyv0p0JoTUvejFUfsMs8Awm9GPPgfOQS0htFNniE2Iq9HTejCjSvtcf?=
 =?us-ascii?Q?8/beqnj74arNMLdG6rfmZLCEraW7OJGLEUqtIOM83tvRBg9MR1hElgjIpSqO?=
 =?us-ascii?Q?Pikm+r0KsB6yeN454lBkaxp4r0SXCWhBJFhbFIIqYL4dtUVHL/neL0t7DbqC?=
 =?us-ascii?Q?mrs9I6ESMZV4PuR1q5IjgdwDm+bvaltV6MkfteWM0pbtDpcT5xlAamLlLFge?=
 =?us-ascii?Q?lHja2FXoU66UXRUh8lT4NHu5KglIw8yFEvd24TX1yCtrGBGv35hcvj2VQTkv?=
 =?us-ascii?Q?pE5gUqIGLvMXBbPlCFxXMC/zCFnOYxL+dJZT9npTNBfYE9x/tuYFwz+1IKyi?=
 =?us-ascii?Q?PEeLjvSmTPimSLBTCkffxiH8VT9CPkqvO8XUpfkEXgIHTVmThi+iqFxlORnH?=
 =?us-ascii?Q?7t2MflHwYjKGKOuL8PWtZmDBmhA8bn4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94239d4d-0977-41ae-22e5-08de7347456e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 01:51:47.9425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JU7U8GRyAZw6iHAqBxYMc/+iVfdNms24Q6FkckXicdCxmsvbhzd54RbLBYLyQXRN0byv8EH0J/l02QBFwwo3XOM2o9sMLgWghdMkYlkHTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9393
X-Authority-Analysis: v=2.4 cv=V4xwEOni c=1 sm=1 tr=0 ts=699d0436 cx=c_pps
 a=DKBbczBT0NfZzOMt9NccUg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=w2PP7KgtAAAA:8 a=t7CeM3EgAAAA:8 a=xNf9USuDAAAA:8 a=cd34Doh_AAAA:8
 a=cETuxoCwAAAA:8 a=v12xRLZ1AAAA:8 a=asUJ-9hBcST0swh35H8A:9
 a=CDB6uwv3NW-08_pL9N3q:22 a=FdTzh2GWekK77mhwV6Dw:22 a=DGTqSDpDppWLBvRNt63D:22
 a=tb6VMGFFq-HsUJGUQiVL:22 a=AgWhkyGJzIdW_ONjbm8h:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAxNCBTYWx0ZWRfX9l14DVe8fKoI
 xraBIpfzm8FIKtNQXt1G7wQaJ8xsOFZNz/5RVNWrpV4B2zX3Qa58bY691BiNlCw3t3KCPKKnH73
 iiRrDO+DSXyQFGa3eMvXzmeqnPrYjW/u/4hvDQs1XdTUBj+RHUXMTAKK/EerwumQFMpd0UfQMPK
 HncevBu3rZNRm37Swv9i5PKJ3sY0A1P2R4JQJeI7gS5EtV06EyfN8EHOMAHW9AZAdSmqBFSfBPb
 EeOJDgALRdbGQ6eGd6V+K3B92a1vqvtr+tpBaqYarnGKgfK43wA1USUpQcuomVqi89iu6Np+NFE
 dTxFGp4F0mXnSVaVjNc3ESRUdKBHlFGcpvOdk898MBs99if8F/x7SjsVRICGu0KqYwM9fjDPEMm
 ZeO9nV6Zmx23sU9K/tltG9Xh1JCOMkPB2K+KlUsHF3pFVnlz5qZSPx4Gtd1Lz4YWUr0ALs5DCHi
 Lx/5odM4ZRZBWjQDouA==
X-Proofpoint-GUID: essI-Ed3ah_xWQOaQWytoTXDCCjaLWDF
X-Proofpoint-ORIG-GUID: essI-Ed3ah_xWQOaQWytoTXDCCjaLWDF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:51:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231728

License-Update: Add license BSL-1.0 and Apache-2.0

COPYING - Add Cross-links between Japanese and English pages
LEGAL - Update LEGAL for JSON vendored sources

Refer:
[1] https://github.com/ruby/ruby/commit/e652af18816ffe0b85109b8de0827349bf03f16d
[2] https://github.com/ruby/ruby/commit/d5fbff50c7ff880ae71b8a8ae9aad976c69bea73

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...doc-build-reproducible-documentation.patch | 30 ++++++-----
 .../0006-Make-gemspecs-reproducible.patch     | 52 +++++++++++--------
 .../ruby/{ruby_3.4.7.bb => ruby_4.0.1.bb}     | 11 ++--
 3 files changed, 51 insertions(+), 42 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.4.7.bb => ruby_4.0.1.bb} (93%)

diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index 90b2aee7ea..f0be3e4af6 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 2e140fea6c275f3258893d2da2480027b16efb92 Mon Sep 17 00:00:00 2001
+From 278d02b08f513b288f31648bc5ec5c47ecb61686 Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
@@ -9,29 +9,33 @@ Upstream-Status: Backport [debian]
 
 Signed-off-by: Antonio Terceiro <terceiro@debian.org>
 Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
+
+rebase to version 4.0.1
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- lib/rdoc/generator/json_index.rb | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ .bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb | 2 ++
+ 1 file changed, 2 insertions(+)
 
-diff --git a/lib/rdoc/generator/json_index.rb b/lib/rdoc/generator/json_index.rb
-index 065caa4..cfa1f33 100644
---- a/lib/rdoc/generator/json_index.rb
-+++ b/lib/rdoc/generator/json_index.rb
-@@ -176,7 +176,7 @@ class RDoc::Generator::JsonIndex
-     debug_msg "Writing gzipped search index to %s" % outfile
+diff --git a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb b/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
+index 065caa4..a76c202 100644
+--- a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
++++ b/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
+@@ -177,6 +177,7 @@ class RDoc::Generator::JsonIndex
  
      Zlib::GzipWriter.open(outfile) do |gz|
--      gz.mtime = File.mtime(search_index_file)
+       gz.mtime = File.mtime(search_index_file)
 +      gz.mtime = -1
        gz.orig_name = search_index_file.basename.to_s
        gz.write search_index
        gz.close
-@@ -194,7 +194,7 @@ class RDoc::Generator::JsonIndex
-         debug_msg "Writing gzipped file to %s" % outfile
+@@ -195,6 +196,7 @@ class RDoc::Generator::JsonIndex
  
          Zlib::GzipWriter.open(outfile) do |gz|
--          gz.mtime = File.mtime(dest)
+           gz.mtime = File.mtime(dest)
 +          gz.mtime = -1
            gz.orig_name = dest.basename.to_s
            gz.write data
            gz.close
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index e2c80e2f6f..aac2bc1502 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 2f3d8359ffd1ab07d578c1e991180bc31dc7d143 Mon Sep 17 00:00:00 2001
+From 4d25e9ce0b2795009dd066d7959cf51c4292a343 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -7,18 +7,21 @@ Without an explicit date, they will get the current date and make the
 build unreproducible
 
 Upstream-Status: Backport [debian]
+
+Rebase to version 4.0.1
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- .bundle/gems/bigdecimal-3.1.8/bigdecimal.gemspec | 1 +
- ext/fiddle/fiddle.gemspec                        | 1 +
+ .bundle/gems/bigdecimal-4.0.1/bigdecimal.gemspec | 1 +
+ .bundle/gems/fiddle-1.1.8/fiddle.gemspec         | 1 +
+ .bundle/gems/rdoc-7.0.3/rdoc.gemspec             | 1 +
  ext/io/console/io-console.gemspec                | 1 +
  lib/ipaddr.gemspec                               | 1 +
- lib/rdoc/rdoc.gemspec                            | 1 +
  5 files changed, 5 insertions(+)
 
-diff --git a/.bundle/gems/bigdecimal-3.1.8/bigdecimal.gemspec b/.bundle/gems/bigdecimal-3.1.8/bigdecimal.gemspec
+diff --git a/.bundle/gems/bigdecimal-4.0.1/bigdecimal.gemspec b/.bundle/gems/bigdecimal-4.0.1/bigdecimal.gemspec
 index b6ef8fd..596b8bb 100644
---- a/.bundle/gems/bigdecimal-3.1.8/bigdecimal.gemspec
-+++ b/.bundle/gems/bigdecimal-3.1.8/bigdecimal.gemspec
+--- a/.bundle/gems/bigdecimal-4.0.1/bigdecimal.gemspec
++++ b/.bundle/gems/bigdecimal-4.0.1/bigdecimal.gemspec
 @@ -14,6 +14,7 @@ Gem::Specification.new do |s|
    s.name          = name
    s.version       = source_version
@@ -27,10 +30,10 @@ index b6ef8fd..596b8bb 100644
    s.email         = ["mrkn@mrkn.jp"]
  
    s.summary       = "Arbitrary-precision decimal floating-point number library."
-diff --git a/ext/fiddle/fiddle.gemspec b/ext/fiddle/fiddle.gemspec
+diff --git a/.bundle/gems/fiddle-1.1.8/fiddle.gemspec b/.bundle/gems/fiddle-1.1.8/fiddle.gemspec
 index 0092f52..f77c224 100644
---- a/ext/fiddle/fiddle.gemspec
-+++ b/ext/fiddle/fiddle.gemspec
+--- a/.bundle/gems/fiddle-1.1.8/fiddle.gemspec
++++ b/.bundle/gems/fiddle-1.1.8/fiddle.gemspec
 @@ -8,6 +8,7 @@ end
  Gem::Specification.new do |spec|
    spec.name          = "fiddle"
@@ -39,6 +42,18 @@ index 0092f52..f77c224 100644
    spec.authors       = ["Aaron Patterson", "SHIBATA Hiroshi"]
    spec.email         = ["aaron@tenderlovemaking.com", "hsbt@ruby-lang.org"]
  
+diff --git a/.bundle/gems/rdoc-7.0.3/rdoc.gemspec b/.bundle/gems/rdoc-7.0.3/rdoc.gemspec
+index ada9341..5871ec2 100644
+--- a/.bundle/gems/rdoc-7.0.3/rdoc.gemspec
++++ b/.bundle/gems/rdoc-7.0.3/rdoc.gemspec
+@@ -7,6 +7,7 @@ end
+ 
+ Gem::Specification.new do |s|
+   s.name = "rdoc"
++  s.date = RUBY_RELEASE_DATE
+   s.version = RDoc::VERSION
+ 
+   s.authors = [
 diff --git a/ext/io/console/io-console.gemspec b/ext/io/console/io-console.gemspec
 index 0a19992..4a80529 100644
 --- a/ext/io/console/io-console.gemspec
@@ -52,7 +67,7 @@ index 0a19992..4a80529 100644
    s.email = "nobu@ruby-lang.org"
    s.description = "add console capabilities to IO instances."
 diff --git a/lib/ipaddr.gemspec b/lib/ipaddr.gemspec
-index 5719f83..fe76260 100644
+index cabc916..f9581b8 100644
 --- a/lib/ipaddr.gemspec
 +++ b/lib/ipaddr.gemspec
 @@ -18,6 +18,7 @@ end
@@ -63,15 +78,6 @@ index 5719f83..fe76260 100644
    spec.authors       = ["Akinori MUSHA", "Hajimu UMEMOTO"]
    spec.email         = ["knu@idaemons.org", "ume@mahoroba.org"]
  
-diff --git a/lib/rdoc/rdoc.gemspec b/lib/rdoc/rdoc.gemspec
-index 47f4802..cf0b5f7 100644
---- a/lib/rdoc/rdoc.gemspec
-+++ b/lib/rdoc/rdoc.gemspec
-@@ -7,6 +7,7 @@ end
- 
- Gem::Specification.new do |s|
-   s.name = "rdoc"
-+  s.date = RUBY_RELEASE_DATE
-   s.version = RDoc::VERSION
- 
-   s.authors = [
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.4.7.bb b/meta/recipes-devtools/ruby/ruby_4.0.1.bb
similarity index 93%
rename from meta/recipes-devtools/ruby/ruby_3.4.7.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.1.bb
index 2fbcfd1f1b..13d4a1b4ef 100644
--- a/meta/recipes-devtools/ruby/ruby_3.4.7.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.1.bb
@@ -6,11 +6,11 @@ It is simple, straight-forward, and extensible. \
 "
 HOMEPAGE = "http://www.ruby-lang.org/"
 SECTION = "devel/ruby"
-LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
+LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT | BSL-1.0 | Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7674b1080a488809841b13eb57ffb719 \
                     file://BSDL;md5=8b50bc6de8f586dc66790ba11d064d75 \
                     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LEGAL;md5=cb14358b7821c054ae14128885170204 \
+                    file://LEGAL;md5=8c128bc6252da28f51e60e72b5512478 \
                     "
 
 DEPENDS = "zlib openssl libyaml libffi"
@@ -49,7 +49,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "23815a6d095696f7919090fdc3e2f9459b2c83d57224b2e446ce1f5f7333ef36"
+SRC_URI[sha256sum] = "3924be2d05db30f4e35f859bf028be85f4b7dd01714142fd823e4af5de2faf9d"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
@@ -104,8 +104,7 @@ do_install_ptest () {
     install -D ${S}/tool/test/runner.rb ${D}${PTEST_PATH}/tool/test/runner.rb
     cp -r ${S}/tool/lib ${D}${PTEST_PATH}/tool/
     mkdir -p ${D}${PTEST_PATH}/lib
-    cp -r ${S}/lib/did_you_mean ${S}/lib/rdoc ${D}${PTEST_PATH}/lib
-    cp ${D}${libdir}/ruby/${SHRT_VER}.0/rdoc.rb ${D}${PTEST_PATH}/lib
+    cp -r ${S}/lib/did_you_mean ${D}${PTEST_PATH}/lib
     cp ${D}${libdir}/ruby/${SHRT_VER}.0/did_you_mean.rb ${D}${PTEST_PATH}/lib    
 
     # install test-binaries
-- 
2.34.1


