Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9EFEB595D
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 03:22:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10562.1770780149086298274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 19:22:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XKOlfFLy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6502c0ebeb=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B2mG7R3911786
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 19:22:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=eKfu8EnT/88sB3L2iYzO
	zk/AJUxjZqiOVCApKMVVH/0=; b=XKOlfFLy6zcoWAPcLosdhDdx2ko+NHHY+b19
	8MryXi5A39X0G3k7MwhkBEMK9LiYtYvwL76CTWZKLbxXaE3QQouN33aa9bN4Ju4O
	X6CQEk58jVu8Qf7kYDde6kJx1Dl7VIo5Bq9UtOo1bGFCAWyyFLkp7tBqT2Ea7mdo
	Igv6pIUUhzz/79MOys1Y51gOBKfq+I+z0gr0ErB5b8nNwSqmF1Gcqhkka5od5KVi
	qAWqpyxi8Jpv5iEIZAgtgUsPjPTOHEtMYdJ4EDr7a0vtpkNYcQbJlk86XDC5qmST
	WAHv5TyZAdDlKNwofGgLD2NqGSC1S0GQuRBgAPudhtT1VjxZpg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010058.outbound.protection.outlook.com [52.101.46.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4v01q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 19:22:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqDR1thOzaxiDzs4EkePx6JiuPx2NYY0hoJ8LAg1mXIELXwPSntRsxyZSryyfkNv3lEoWFbdL9X2tJwBWdyMLqDMGuGKi9DbEvCE/N186k+I7PevEJHbeQAn/xY6iFmbPimXG/oeVCEUL3kRdAXOLkrLFGJzZ6qVenBCBBJWUHKAJJKbp8q8sIIzGlBmSP9/jeO5cmkqWLtK7fs7IUabc8kEA5n4E/H7gw49WXgVjM6LVljBS3znjeY7x0TPu5u65RizZNsM04gQK8WVhMfBQ1eEM3+r6CcWk11SwtJz4GfgyRi0zoArZ2KlaiM242PRpgLaCLEaT2+BZmhm5VgKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKfu8EnT/88sB3L2iYzOzk/AJUxjZqiOVCApKMVVH/0=;
 b=AOpC008sTO5TOMsz7Ubs5Umv8Opm1cie7ixmlK52tuoF4km8jv6oei9pZbSn7QVAsoRQHFuOFqdG6UJjFq7ZyegOf+h1jwxSDrp/1bp9LVoj/6uHMPSwDXC4komARoH0waQrRYwephDiRmIERCxvuB+Y49uVikHf+S7IzUikc3Mg/3qRJVMZ0N+FnoEPRZSRz95wIhBychhCtlOEjq1n+DgxtHLDNHjhUE8kZ53l4B96aHgkfVBVserjdPUDWBw05CSoyHGlz+lUtUf95GzhTzGXuaEcdSwT/4o/5m78xmUSw+XtLjQjnnjCPHAxi52TqDKXXTwbgXi+uBShvoBS4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 03:22:25 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 03:22:25 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libx11-compose-data: upgrade 1.8.4 -> 1.8.12
Date: Wed, 11 Feb 2026 11:22:13 +0800
Message-Id: <20260211032213.1551294-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW4PR11MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: ea92f7a3-660f-43dc-fed1-08de691cc6ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/VkX462kuKObqBgrym5P6zaCnh2Z45OO+fHFWpHX1TCyp/iMDhVkE76/pni5?=
 =?us-ascii?Q?9A/6tRN9GnZfANL44ksn3M8kFvkXZDIsE35rq6GsRUoMsBJcqKov+4jNfolY?=
 =?us-ascii?Q?0dx0wzrn/dYN9zRODJNX+sWZoq7YmprwykLaSG3W8htS4wWF5dLkqBOeO/RP?=
 =?us-ascii?Q?J1jcQfkxp4AigTQsRi/jYvRpOyQpw3kJeUw2lOZWM8QL2o66Ixb7xEzMoRii?=
 =?us-ascii?Q?/sjO3X5c/Vm9symcmptVVG2f2E5QKkRv9j8BstaYsm/vh7sIQPsDVIdlk9gz?=
 =?us-ascii?Q?bnlZffOCg5Z4UCQtD89C8N04qKkGmzToaX4ip78ZXMmlR5efz+l1TgDKyIxe?=
 =?us-ascii?Q?qCjsmzNT3BXaJAk5jcWnWNb/MdyG8bF5DHA+srr0UKc4JxaSbtvFXNBo24rR?=
 =?us-ascii?Q?xQGmSv5x0bqyIqhjeozVApatOf3lNJmfkuHHtPBO+jcQEEd3Vs8mSdSuGEkY?=
 =?us-ascii?Q?DR7Pkj/HX+5IUBTPE6DbSgAckFohMNageaSlU5xxkAMGzn8X2G/wWaWujiJf?=
 =?us-ascii?Q?XZVbelR8P3hJMthpjPqtTii897OJiQ4S7dNOYeWKetwlHKmtJIwff1PjMLcb?=
 =?us-ascii?Q?cPY17/f0pn+kIPQOXvLvznOnTxzXyzBOF29am1vbf/xwTOz3gS9/Obc5116+?=
 =?us-ascii?Q?jCEiuWpNODu3DQk+plPTKQdlOM8Hmmk8h1NSf0U2oPEB3TJfsll5lwJISHuS?=
 =?us-ascii?Q?z0iWLPhhA+GDQJG9cN8l+vthAjqnAyVKsQISS8JjwYx4pbijG+kD+lA7IYmR?=
 =?us-ascii?Q?dF4FXdDvUOwli09HJg3PasqKty8jcZf/sX6oMh7Rop81+dABMyRj82MiC8ii?=
 =?us-ascii?Q?3Ayh1ixQtUJyi9Xua/LDKhbXxDyAB2tQv0klVsVXW+n8B+76AMTa7amhS831?=
 =?us-ascii?Q?d6ro0xN7LPdO3RBe9Cktmha4HO5vTPheQwSxt6/MZWM2iMgnXEvE7riM6wDT?=
 =?us-ascii?Q?IHV6+OEUVabEn1yozXNTLBg4vvlZVInHsI+6v0IEv+jRjoX4pmc8jDPmYnI1?=
 =?us-ascii?Q?sd/YLTQosY8FfVn5hCI/QnLy8lmKSIrcCSXCgt2TmcadkrxPn2DE8GhEGYgN?=
 =?us-ascii?Q?RNauhHLQnegjWKCH5RE6TLWCultfFD9I01UwyRvzzRbA9kGgMFkBLLB60Uli?=
 =?us-ascii?Q?KZLhRidOFy8AJWjKLoAW2GmTSB0uXHgwkG5vpvPjtgKpDw9Hp5pRNwKG67vq?=
 =?us-ascii?Q?8jSEzkSIZJ+f5VGYReFFw9rNJC6RySVqOyiZDS6bAW9EPpEcq2ewxLX8WVND?=
 =?us-ascii?Q?T1kkr8Meix4C5eak7jfqBFN5GUCQsy4kcc1yOB/newtT8HWW3iSpwxMr01fB?=
 =?us-ascii?Q?iX8B1o8XZ0uAyO2ANNqMJBqGcVBdKnLInXky/Dqio5yaAFUEjjoiP4H6lnNr?=
 =?us-ascii?Q?jKMCCJ2T+1lnCSXbueOdChaRXUY73maxC6yEPAjqlPy8/OGL31x06hNv/Z+1?=
 =?us-ascii?Q?6FXZUHhJ1moneIVUXCGeHOLuc0iRkgaZEJnXrUGhdPau/KtpPqUi7P8x+1Um?=
 =?us-ascii?Q?EqDVto6IHoWvTUTZnv7uLRYqiALNbZ/hAGTxyB5p+xOH30lDM4xLX/OYNue+?=
 =?us-ascii?Q?gh644sSeXU1dN3znWsyt8AF0RowMILZv5DOke/T/O7QADxBq/RkAsQh0KGqc?=
 =?us-ascii?Q?6kvrIRZ+Nq8klAr7xAVr7Mg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IyZ9doFpvMOUGK5ZevF1pbtESg4AnJehqYjrQQdRphzube3Foyf26AKWU8bH?=
 =?us-ascii?Q?6i3G5/TxxDESxY98+6nVSOd6yvmvwd3nPgf8aOEriv8AyJXMWRkpL2WwMyCU?=
 =?us-ascii?Q?6nwFWW4u17XWJtfC0FhUNuNcxwm7iLarbMSkw3n58VWTMNZ1ooW0O3R/rCx7?=
 =?us-ascii?Q?Qvlw/MBZylRRx02FlclZe7fMGZpUGwzrq7ZLvylofdi3Q95NmclvbTiFGzXC?=
 =?us-ascii?Q?C64a6EMIh7DqCcFfHaMBsmeeXoY6oXy+2T/Xo+uZPb2DmN6p66Djxpi98a8j?=
 =?us-ascii?Q?x4fuaGoAOkZHXkW7MetOgvW2s5TPWkNsJepaJOsBYpWPKj86ScVHBju+90gu?=
 =?us-ascii?Q?U0dTrmx2TUJxPk7piNx+2UijkETTS18zB1dAGyhyznKULM0/BOILm6V1IDac?=
 =?us-ascii?Q?xHTICrm/clhhmx/kSDiLf8xA9QXg/V/8Nd/7RVnhcT7s9ZmbeUNvbPTMpyr+?=
 =?us-ascii?Q?MZgCVsLq2p/D1XKRM7Sx2+cha/vad7BVovlKPg49aBkfe3ifqWVaCLIOHVgg?=
 =?us-ascii?Q?+1O0TFvbmW/HnnfgLfdFw5NX4Ih7/v9tl7Qh21283djK4VRMdXqY1iClX2E9?=
 =?us-ascii?Q?4iEZ8a912FUOaAsBD6hq4o9a6wRYHeX036d8uvazbENss7gROTxdxA7O9w+q?=
 =?us-ascii?Q?tu6D5ci4f4Oy+ZaXlK1bpNU8u8baMTVLBzKnhDQr6sDUslpUlPmeV5wgwEhs?=
 =?us-ascii?Q?oZknCituIZPLc7BgVve3RbxDm44L5n7Vxwb5TKm+Deh1y8tL8hQEmhLVJ73e?=
 =?us-ascii?Q?6QQ7baUUkg77vU7VDQNe+RxLcOiuoT8ua5MXCwMIaASDbrKGta2+4htlhXTe?=
 =?us-ascii?Q?9vUIrGcbIMNfQju/yg6y589LdEOTQzA7ta69sCuvBh+2c7i/xtUR3PTU6iq7?=
 =?us-ascii?Q?hPJfzH/o318qMTOmZPgE5d70plprctm4xTlBuwA6e1MWGs9jeHlz5sTjerh4?=
 =?us-ascii?Q?H5urYh4c1HwdFMGBXjcM5lN7YI/V2I19i6YMgs4HqBa6ZN7NeOivNILd4yHi?=
 =?us-ascii?Q?1oNni4xqc/IeL+HBazVekMyAJbLT5axsnhaRO3UPcwur44j58S7u3p6XeVmz?=
 =?us-ascii?Q?72Mum5OH8kh8ESw+9AP4WupUIVVLNLNb0xpfLSwf5sbS0ObGQEzcUDat7IyF?=
 =?us-ascii?Q?x3tSLbAg+j7lVIe6zGHodZJ8dm1ieW3m7DsJBJU4zocqH96jncIZ6qz347/x?=
 =?us-ascii?Q?LOKK1GNRe4Z5C2BuiskIKUNw+eso6yHm7hzanKMHkpsmORX9yuGwndj8blF4?=
 =?us-ascii?Q?37WG34L5qGhz1MkESXQex5iB6yf6x8uDedIuufnDOSo35/52ltYzt/wJUtLK?=
 =?us-ascii?Q?0bO+7GxijCB+hkQaj0YvMauFYc7SBM+/DaGDl1dYAivl7Wv3ZIFcpVhX2uIu?=
 =?us-ascii?Q?lVKHbIYuiDxEdnTVPjECpoBkr5YDtO0TggegVQDLdkC9RhUKBE1C9NzxCiiP?=
 =?us-ascii?Q?g4PlISmI1eOvDp3/aYKAOEsdxlQ0ZVO5E5+2BPpwL14UhHmbXKqosJqFRnB/?=
 =?us-ascii?Q?qG6VYjE9G1kRCpxcCShrqeJh7N5gqZtHOwEUeIMsjc27Ud55gZD5jwXcR5C+?=
 =?us-ascii?Q?2YDA1gRwmdMwnnIPJybGRzDJIv4ot6JL8wxEgTaYngyrz6e3EtCFYiVVVOAP?=
 =?us-ascii?Q?rGmof9yaBaN66+0xP+NxnZkLRrrzgB8Obl1Q+bSOnWYMukI1BjxsHm58X47u?=
 =?us-ascii?Q?bpvTUNdu4LgVNKwbKGqiWutQZ0nQRKsXYArYfpCAQxAGYmjUB8N1dgYHZJKl?=
 =?us-ascii?Q?z5c1E/bImPiwpTbsZtuEO8Gc7lZJcGc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea92f7a3-660f-43dc-fed1-08de691cc6ff
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 03:22:25.3882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLcRsnplGNWtEm3oxEy0ctlcRr02Xuej9Pdaz6dLGq89IJLJwRfPSpwdNUmD1Xll9o+7P/+T5ZTC/pfij5z1591vOyTanwEsk+KJgla0lQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7164
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=698bf5f4 cx=c_pps
 a=ixAZ6W2pdOuc7GYTaWtIWQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8
 a=m8ToADvmAAAA:8 a=0Ir95BGpiy2BngerpPcA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=FdTzh2GWekK77mhwV6Dw:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: yNFcctKqJDtz1wtFSqAorvORu2KOBklH
X-Proofpoint-GUID: yNFcctKqJDtz1wtFSqAorvORu2KOBklH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAyNSBTYWx0ZWRfX/8SomvQ+6TuX
 yKch4gqkQJI7EIihy/6zzc4+MLmRoLdpvhjwV3IAiddzAx9Pg2DOVz2Z9Qf07/nISWafOG381e4
 2Zevlxo7J9/GM4a6DFC7/8jYOcN+mD2PLa7vHCKGGGnsWSOt69gmoSIeXBnf6noT31EAtcNYhND
 MSbyw7xULVYMLx+S3hiGB/s5HnIWewCwtX11HuJNOw0rX/5X1izFgNCmHVawN8H6fRbr8iNzY2t
 E5EhOy6vgxnAwRgg5LXxELlauht4SlRSknFSZkhG3U7dToWE2FK6ZjaN0PhKLIVDberOCJVItTt
 jI8xnWp7kBbTh1p/XoTRbw9A53FXYseCa3su9xE9Bu5099m5hRmZ/o17SzXd528F2db8Go3iXBy
 GcpEcsMM92fF6YN09LTQQSw9dZam8kwVK6YhKgz4YE3J0oJzgLb/k40TKsGcvx1f1ilBjABDgd7
 6gBrT54m1f9JTMnihSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 03:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230958

From: Zhang Peng <peng.zhang1.cn@windriver.com>

- upgrade libx11-compose-data to 1.8.12 as it is part of libx11, and
  libx11 already upgrade to 1.8.12
- refresh the patch 0001-Drop-x11-dependencies.patch

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../0001-Drop-x11-dependencies.patch          | 19 ++++++++++---------
 ...1.8.4.bb => libx11-compose-data_1.8.12.bb} |  2 +-
 2 files changed, 11 insertions(+), 10 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11-compose-data_1.8.4.bb => libx11-compose-data_1.8.12.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch b/meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch
index 61af98d95e..d6c4b1ac52 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data/0001-Drop-x11-dependencies.patch
@@ -1,4 +1,4 @@
-From e1f9b0b531c6ddb11a85c0664051e2e4efc589fb Mon Sep 17 00:00:00 2001
+From 2e31c7045a8ced15972c7ff53d3720a713f11af3 Mon Sep 17 00:00:00 2001
 From: Ming Liu <ming.liu@toradex.com>
 Date: Sun, 5 May 2019 11:55:14 +0200
 Subject: [PATCH] Drop x11 dependencies
@@ -10,12 +10,16 @@ Signed-off-by: Ming Liu <ming.liu@toradex.com>
 Rebase for version 1.8.3.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Rebase for version 1.8.12.
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
 ---
  configure.ac | 44 --------------------------------------------
  1 file changed, 44 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 33d0102..50e2d93 100644
+index c3f23e2..ce8af3e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -76,27 +76,8 @@ fi
@@ -44,9 +48,9 @@ index 33d0102..50e2d93 100644
 -XTRANS_CONNECTION_FLAGS
 -
  # Check for dlopen
- AC_MSG_CHECKING([if run-time linking is supported])
  AC_SEARCH_LIBS(dlopen,[dl svld])
-@@ -255,30 +236,6 @@ AC_SUBST(USE_THREAD_LIBS)
+ if test "x$ac_cv_search_dlopen" != xno; then
+@@ -248,30 +229,6 @@ AC_SUBST(USE_THREAD_LIBS)
  
  AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL, 1, [poll() function is available])], )
  
@@ -55,7 +59,7 @@ index 33d0102..50e2d93 100644
 -#
 -AC_MSG_CHECKING([keysym definitions])
 -AC_ARG_WITH([keysymdefdir],
--        [AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h (defaults to xproto include dir)])],
+-        [AS_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h (defaults to xproto include dir)])],
 -        [KEYSYMDEFDIR=$withval],
 -        [KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11])
 -
@@ -77,7 +81,7 @@ index 33d0102..50e2d93 100644
  AC_ARG_ENABLE(xcms,
                AS_HELP_STRING([--disable-xcms],
                  [Disable Xlib support for CMS *EXPERIMENTAL*]),
-@@ -358,7 +315,6 @@ X11_LIBDIR="${libdir}/X11"
+@@ -351,7 +308,6 @@ X11_LIBDIR="${libdir}/X11"
  AX_DEFINE_DIR(X11_LIBDIR, X11_LIBDIR, [Location of libX11 library data])
  AC_SUBST(X11_LIBDIR)
  
@@ -85,6 +89,3 @@ index 33d0102..50e2d93 100644
  X11_CFLAGS="$X11_CFLAGS $XTHREAD_CFLAGS"
  
  #
--- 
-2.7.4
-
diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.4.bb b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.12.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.4.bb
rename to meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.12.bb
index 4286e0ccb1..562a8cbf16 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.12.bb
@@ -11,7 +11,7 @@ XORG_PN = "libX11"
 SRC_URI += "file://0001-Drop-x11-dependencies.patch \
            "
 
-SRC_URI[sha256sum] = "c9a287a5aefa9804ce3cfafcf516fe96ed3f7e8e45c0e2ee59e84c86757df518"
+SRC_URI[sha256sum] = "fa026f9bb0124f4d6c808f9aef4057aad65e7b35d8ff43951cef0abe06bb9a9a"
 
 REQUIRED_DISTRO_FEATURES = ""
 CONFLICT_DISTRO_FEATURES = "x11"
-- 
2.34.1


