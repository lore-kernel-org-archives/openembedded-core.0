Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A25ECCFA1E
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 13:10:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9000.1762348203508820503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 05:10:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ecwlvDNO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34043e1a29=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A54o3lM2097893
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Nov 2025 13:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JqZ3ZElWcTKGtHIohARrNdAm5NNDujE5YqD9s9vyxSA=; b=
	ecwlvDNOaTflawcLuBxVJr1ot2unnY9LmjvKR32ZsjCQzHxifSESMXYjzJQ7FpNn
	42VLvf7fJOjrnJzfajUsL/BiUVbSYm/pg/OE+EBZu9XWvtdaSebolWFHdY/zxG+R
	DTqu+vScBYNbwzXz/tXa2LnxOFjQfYe1XdaK88a/vMmYSR9zFhBHiDku9ZF1CoMD
	sKGSOQKnFC3goZOuZ+1VWxQ3SvISImghu6enLaiJpafXTlsVE940AgCM4q2AhzA5
	dBqfGNFkUcDGCTc+PuNNlxp7abXOgHcIhc71jTO3PJ6j40FSKjGEVyQkv/3FG0PT
	zmx61xu664gmLgKmbp24NQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010008.outbound.protection.outlook.com [52.101.85.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7war8gbp-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 13:10:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7gfWamLRZM2mpvXImU3rV8lQkUsKAQX8bwKPhCKvA5B454pzImofoEcOJYVMdqw+DTlGBj9kHN8uY7+rFm/KEgL33jlMXlwYGj5TXP2+608dDnXO+TzzWLmQnWhvVB+rKW8PciORW+ZZpktF8gk8p3tYfMV0Ir5+l7ChlucWdONb8KddkONCeQ0C8SvX0Wd0s1QRZNFy7fgRazgNkXbvxJzu4cb3oVcNtU9CQsFOv3VETVc7vMmTQjV/UM1o8yu5XAR7vLW7mEQHIZjktDm43QBQuB7Oj0/XzyymGBql2FtmCEnAj5DoIJV51MRvwLj5X+odJ2bO28Zip3xOvVl+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqZ3ZElWcTKGtHIohARrNdAm5NNDujE5YqD9s9vyxSA=;
 b=WeIkX6vUEX8bgAujKhtcdo4eRCZWJsYE+0QB2dTndK2sOVpIpnGR3brl9t860uYjsxrpXfXIGGa3bkdL5WZ/ad2Sh3/iZOJ+x2GFmAVVHGNQThqNDGrawBC2FTkMuDB0losYfXMknMNgVhbbuPqRZVJvVHvZh1Mw9NIoLEG5Ekq40jIFyWNACXq0bLEu25xVcFZ2FW1vHXMvMxfuTL9f1rrkAh4D7u+fSC4/E0XJNfdWHxQDNFBVB7iZfou+G3pwymQHBsPUi8ucswQJI4Fl4Qu/u8StQE6wN0tIbi7ezHCoUQluFLsimDWbbiuEOws25eSQk0QeN8wlCFfTQFiMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 5 Nov
 2025 13:10:00 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 13:10:00 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
Subject: [PATCH RFC v2 8/8] kernel-devsrc: copying rust-kernel soucre to $kerneldir/build
Date: Wed,  5 Nov 2025 05:09:42 -0800
Message-ID: <20251105130942.833204-9-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:a03:117::14) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 664e1e1e-0a11-45f6-2b56-08de1c6ca004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tJHL9m2i2wRijMVmLOp84r/tntagTZ4CxQJW7uy4uMHBji49qO4ZND83m6zf?=
 =?us-ascii?Q?cnVvTQT05bU8zanSKumRIUsRopVWE+EecqsUaGJdvrDyVdcRLZYvMO2uokeq?=
 =?us-ascii?Q?LWj9mkO3uYZ2FTtUP1sniZrF1xmQ886xe7EeGW1PAW6drHFRQZmrsoOhsy+5?=
 =?us-ascii?Q?5den038Qed3XITdCgjpkubBrfz/qGiHfMI3PQBbUpksvwBdTUxO6p5eFP61l?=
 =?us-ascii?Q?qsvzzrckd12+vaJ+aV2EJf4JX95l8r2wi0xD/CgJYk/p8oRvUqGSTCfKfZ1a?=
 =?us-ascii?Q?WVHMlhsv71JxLqT9FUQ39qgU4vcAaH2Xcswe9oukhzqUNxpFO71rPuAChgkV?=
 =?us-ascii?Q?YYtosQy/uiEhyqTJiZzQo3x083x+suBcN3O4gaNvS/WsCJREjqoe+rffpFtD?=
 =?us-ascii?Q?pDuDmB74D5Uu6XgwDH54aEjQrH8yxXLTfsww4SpABsEBfs8HVOnHQ/hRuWdQ?=
 =?us-ascii?Q?3HtsTEzFJmq6hpaHewO5jWtc1y+9htgPzK2HmETjZsMdkKZczqF+DpDTxQzs?=
 =?us-ascii?Q?OJQBPd7rlWcsXiuibVmmjXHwYrrn2VRc7q30blEt5s1JcLTziNcrS6zngfQn?=
 =?us-ascii?Q?Sx2IXdjgqUpyw4JNhrhQ0nYvs7cj+W2mxkCO5wGiDJr4OOMmGxE/d8xMi4YA?=
 =?us-ascii?Q?NNBrGnzEhug/ZCB8fm82pTrEkKdTO3cbpXfYD14JbLzBGTHtpZ2+3HxlCYXM?=
 =?us-ascii?Q?llsXETLhuxhMbq9GmT5UK0LXKzcIqsqHf4NaMiNcBy5bBCh1RJAMtzVf2+i0?=
 =?us-ascii?Q?LvWOJk3706iYvoxI+rA6FsDvsKTiDWVHv2AjGl7vCXw1+BzQBjjR/C6l6XsL?=
 =?us-ascii?Q?dKRkKjX6yaynFUC+gc4N3HTeOYWzZDcA5W06NBmdXqySWj8UdFSKGojkuus0?=
 =?us-ascii?Q?PKTHepwh3Hj2GesQ7+o46JdmQrumGsxOhMCcemALn24Kd5RDdRfEEtQqRuTN?=
 =?us-ascii?Q?giVjbobKHogGbW4mYevik1U88Uz5f8L+E8S/tzhuq0xcIjDNmvVsl/ObzcnQ?=
 =?us-ascii?Q?MzQvQ7CtrRoY0pE6v48oZCw0um8Tya9p315l/zeH5JK9DsNhqoiyYPqt33+n?=
 =?us-ascii?Q?XFcPSGBfUv+03xep/mEH6muT47OVhCXBw0g40gQfDRN03ybKNB2HGIgRwSqF?=
 =?us-ascii?Q?eVME5a2Dbpp1IgUAg1Fe1VwEp+fVA4C0aDkhHHRbl54buIVRD0DwUZarmP57?=
 =?us-ascii?Q?odYWqF86Tjg7D9hplP8OC/rMMKjEr+Rhc4wtxhMkUnuN7ZUiz7cRFFj1F9Bk?=
 =?us-ascii?Q?wKW7v5phrZw3JSXbRvhPvGqvKNUnBhn8PTTlvm1g3NiZMRU5/SZPmeoaMbNI?=
 =?us-ascii?Q?6th/RqCPdTmt0JZK/BTyT4GOybpTVoCPitR1F2Unc1Hj4KvWIDnKQf2Rvs6N?=
 =?us-ascii?Q?TVyS29mC0b0gqDICrwhWHAI57Oz6YwEF8y+M2s51yQtKLTC5Ioz0o295RfLj?=
 =?us-ascii?Q?g/vXNvIE7uoh7HFid5hQxC8kTHCQjzFNTXI3mzOLFFT7zc9nxhC83WBBwXaX?=
 =?us-ascii?Q?gpO2Ax/KjEHBn8KTNUOdpt4fK895s/1Zl7O4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s4ewKfX1swpu6UqXTPu9/fj/uRW6aHlbBpqVy+crQdlmRWHjK/uIkQCuLxUe?=
 =?us-ascii?Q?Ez5fEw67sJb9p4JAVZUgheYnKrOMrbNtHq24f/cObOje/DC5G/aoyDZiTlRQ?=
 =?us-ascii?Q?p6vL9va7632KuqGGc0cDYYAktlMmDuJnoVaYg+jn81CSRYe6+Yu/E3n4tU1x?=
 =?us-ascii?Q?uSyatQoNefquD2urlxQ549PtjEvvM2Iir9pBcbZC3rtLS4b7KwJu2no3bi+Z?=
 =?us-ascii?Q?yL5p8L1hNb8vM1DUuK/16/3/zmih1exo6b+Szjcym4yfmPbhyUTDWivOe3Kf?=
 =?us-ascii?Q?X5+lawsYRk8MWK+EqumSi1L3LwM+v4kfgocYUBL2zcCWJE2R8t4oAU7SPW5Y?=
 =?us-ascii?Q?Rr64Ns0OiWb4MoNuZMQ+7bcgneVpV1wyzaAJmkgNi/BG/+qIIW0c1UAgyEnD?=
 =?us-ascii?Q?S2UXOiRQEnM/t73Fh5UpbjI1UP/9mwukld3fPoqY2un0b5Lt41iADbLh7BBt?=
 =?us-ascii?Q?IyIjMUsjYAiC90yKAUVgwOwtMcRChi/vuyJ/8G0VKM/xl+ae8jr5rpMRih0s?=
 =?us-ascii?Q?1nhEdZ8rUQsDoLCWOKEdz0FFLxcyu5gqI9vOknGW5By+3QiT1Sm1iV31bmQ+?=
 =?us-ascii?Q?saGv0J00WgQaJI9Ut6wgtHG71BK8PrUaTyfjJe06IHxJ7160Z3CGDX6MnQKm?=
 =?us-ascii?Q?Lv2Imvr8CHv9ehLozLYcKnNWmYfcJ0rVIzV7uTw511MMbD6gFBrQ4PBoCJ2r?=
 =?us-ascii?Q?TprdDMl8Z+rlgFo7kB2rlHxlf8RhfuYZdh1twEjAMe9/8baI5H79w0CSnwpZ?=
 =?us-ascii?Q?WuJDK83aqF0mFBYFUxHiokO9A7xwfE36wlnfkTW/PKVEmPORAlT0MLwITGjP?=
 =?us-ascii?Q?sqgFQl4szVhZGa6kwhPeHKmSf3ta01q7Egl1UkTfK1Ov/6vwyjmfRHLaRRkv?=
 =?us-ascii?Q?syVYH+erGf1DANi+WlnsLbHF1OWzwKTYBRQ/d6pkiHFy8/DHXGfENL3Rp3yK?=
 =?us-ascii?Q?lVbAM9cuJaY3Og3fiePOFQsE/tYQcFNPqBcw2zg0+t/mohazU2Di8JEQtfyO?=
 =?us-ascii?Q?unYGTOK8xUF6x5mD8/YDTORWI3xf+t34Ca7KF2Pkm39E/EiO01mpB9uB00p8?=
 =?us-ascii?Q?EqnCzaBtJALrOULDoApjDaM0/EgV2Z8cjIudbnY8xUhThkdL8pRaLSQnfs10?=
 =?us-ascii?Q?VOrS125d3DvaKVnKCdLHkvMxcVwI5xphz7us9vzbN/13eF0pg88+L/WmHdWM?=
 =?us-ascii?Q?BNSDw4DBJUyhwThj9tYO+NL/0NbX1GRUz/6TlnDGeCcrRqxL6m24BYMWDQEd?=
 =?us-ascii?Q?qpHg43mZOKJKzw6FyeEPxkX616dHc1RYzvqcuena5TRflytA2t5wDJ1CqABp?=
 =?us-ascii?Q?3rY+aj8koifCngVrMY2u5CtVmlPcfEfKqByZKAToq94eLEU5ijUQ0XDKKKvw?=
 =?us-ascii?Q?ctcasq/Zhjz7waJSbdk1x7/JgwvDUTmT/Iam6h3YeFQxYN7U7tudnWL/1Beg?=
 =?us-ascii?Q?HDBKgqb4RNqm08dOrfoswEavny5XAlIPAwQpI2HFf6tprSeZxy8zulUT35NK?=
 =?us-ascii?Q?Q3UaBaB1rqH+2LfnnYjL3luhrU3jGksaqbmfjLFqBfVjU97qiW07Q24BNKTc?=
 =?us-ascii?Q?J1ZGpin34uKAQjnBZTRUyUcF769uag5JocK9Guf2JVPAEk5KL35g+0U2Ao22?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 664e1e1e-0a11-45f6-2b56-08de1c6ca004
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 13:10:00.1298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHbHsO9zT6d7K4WYAuInkwPjBHq3H8I56EId66T2InPJr8A5xtV31wbLJg2OBBiL2miv+2+QhIaxSaN2ZS1hjmIhvEXVZEuzqEud+0A2eco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=UYJciaSN c=1 sm=1 tr=0 ts=690b4caa cx=c_pps
 a=WNBGq+kRZA72juK154DUDw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=PVi3edU6geBfKTWHhYUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA5OSBTYWx0ZWRfXwM5VSLIKsDTF
 5br4fV7T3hQt4yaO3EVBy/63qrxwl+M5NwKGR+JiifvwlaERxa8OZ3NHj8+yyoH1ijaNl8m5rhI
 6RWrNhMnGo5rJklrXvQ9eTFioViNFUyRsLXFpBr4OHx79ePjZUzvZRwq/I8JpoavMbGiFhQT/VX
 e04BXeTprXJvc52G56ZB6Uhk6bgb9ZCgOJSoxnWj2+uCbfWc81NQPmUdzbrnr7Un9UNWv0orQ/K
 zyVKheSj1ey9ZE9z6nLcb39GHrw0zHXK3rj4BNCeF2jvsOaVMkuskGVQsBFidIYaNFMKAYfmMJF
 cuft98yiWsT+adYAxguE38/h1eADTnyVDiMhJYNV1kARP2g1AgTzQxkfWV7jwLE69vquCmtl7nK
 j9bklRamzcUONclL32tI02q/JRXYRw==
X-Proofpoint-GUID: EwCYp6nYl7p7QiPOW-hMRhBE_pVvZEcG
X-Proofpoint-ORIG-GUID: NBqV7vdAm5hC8F01XDJVrhoSleQES8Wy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_05,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 13:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225765

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In sdk while running make prepare in kernel-source directory after rust
enabling rust config. it will throw erros since only makefile is present
in rust kernel souces.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 411c99ba30..b4bc9eaac2 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -140,6 +140,10 @@ do_install() {
 
         cp -a scripts $kerneldir/build
 
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+            cp -a rust ${kerneldir}/build
+        fi
+
         # for v6.1+ (otherwise we are missing multiple default targets)
         cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
 
-- 
2.49.0


