Return-Path: <quic_ericsmit@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4318ED3F295
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 20:26:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.31614.1729283206971961606
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 13:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=ZHPOWkVN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_ericsmit@quicinc.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IAB2LL017422
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 20:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=YYNy435pYZTLyy9B2Oanuo/FaV2SmgS5AcuD3FZXu3E=; b=ZH
	POWkVNdlaUcAa5K360iGOt/CYix06DOlI7bAOMW7aYLw85afzbyKM6s4FnmWpr9x
	sNXWj3be4omM9SuYWBg/3klajANbFLLooQnexYzLJl1rEOAjb5ywfK/Fl70bbgx3
	P/M0Ou4Dtyn6xYeTdAjsb2CzINUpAHSB1B/R6PG9Y/0Sxvx2tVL7LVTdWhh3lY9/
	7brtTsnULwmPGTknaPqqIHDMOYhh3Mt9PHzopwPxoX2tCkrMYsCjIwRWkFg16/a/
	I6I52d55c1IHA+CJ8gO9vOYcdxquqDLGfIp2bF4b9Dxp0Xs7y8HS8Xg2IlX7ke9y
	wweI1bvMNk2jMOJbOXaA==
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazlp17011027.outbound.protection.outlook.com [40.93.6.27])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b0rx59gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 20:26:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jm1UtalZXpSaWYEwGlQE5frVVzH9/F2rFQv+dSWC3NJ4Hh6r0xAczuVFFItH1eCITSV0IlcZoyC36Rg2trEl2hcZUp5637+VutFS1gguObxUnjDZwssxbbNxDDS7Zs3ZmI1iMWeo5E7+486eNPnLBr5HjFI3PXCnt6/0U4jE1P3hUx/l2CX6qEDkk+HO5AmLeWPstPc4RiG6VU11KzM2DGPGVX6YADOXIV43e6FCspmTrIxq7QtHwup1OUEApFZly/LR3xzHreim94wAus+WLWJ9+GrLTLzuBG+MP0VMeprRNBS4IWG8nJ8E6eF4EP1D7paRmVtFS8BuZQhTfyc9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYNy435pYZTLyy9B2Oanuo/FaV2SmgS5AcuD3FZXu3E=;
 b=juv1u7lgnwLqqH2qFavx4B9q71RoSRTONdjs8+x98qhMfPjYrmLneaC+1X7FN2SkcgLIR/r7lyEhuj1Y55EqKwMfPP33wJ8x9UlQbD4yNJyvd+2gvBN67kEGOQUBtBfnTbejBqvbzQoA0wLpDtlIhVN63tc1iSGDGxfrcWXU9JI1VXFo7S1UsuW95E9g1EzuM9+/oftsB2Khl6FbIhoL+rDH33nCIKhCy/H9XuTAai7XgPzwn1c7dbKuB+1NTUt/iX55BMaLNcNQgzMXBtZfPdC1YunVaZn21sExVmeDx2VNR+ZjipEr41XYyypDStJ2g4KoSYctKbFLwhQdaZanzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SA3PR02MB10115.namprd02.prod.outlook.com
 (2603:10b6:806:398::21) by IA3PR02MB10565.namprd02.prod.outlook.com
 (2603:10b6:208:537::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 20:26:42 +0000
Received: from SA3PR02MB10115.namprd02.prod.outlook.com
 ([fe80::7d60:bda1:e5db:49f5]) by SA3PR02MB10115.namprd02.prod.outlook.com
 ([fe80::7d60:bda1:e5db:49f5%3]) with mapi id 15.20.8048.017; Fri, 18 Oct 2024
 20:26:42 +0000
From: "Eric Smith (QUIC)" <quic_ericsmit@quicinc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: systemctl native script does not support WantedBy=%i.target
Thread-Topic: systemctl native script does not support WantedBy=%i.target
Thread-Index: Adsg8RI/kOool4q/QyqbXbFV04hMeg==
Date: Fri, 18 Oct 2024 20:26:41 +0000
Message-ID: 
 <SA3PR02MB1011516224B1A7952145A6609C1402@SA3PR02MB10115.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR02MB10115:EE_|IA3PR02MB10565:EE_
x-ms-office365-filtering-correlation-id: 882f16fb-bad3-4fb8-d9bc-08dcefb32d65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?MgSjJQl5fuDXehafzFp8fMHzh3OE3FRTnwQ8HVpBafDRXrcUK1f3nSwySvfK?=
 =?us-ascii?Q?yeaTc5qATWA4HlQUA1Sy6b+CujBbJu4QeshUw2WJ6+NR6OdGaEaunvXiMmix?=
 =?us-ascii?Q?H2P4CPUFM0Yc+KrXOwyytfGo908ILIVM1hcpywmqljbvN5xXsS/fnsIBOss5?=
 =?us-ascii?Q?u6QLvjMY/Xv4Z3f51rQakhyD2K3FFjixx+vDUd1iy0O4oibo7f4UQX7IlIGT?=
 =?us-ascii?Q?yiErL3iQPKatOUerkU4OmS9l5noC+wBYkAWowKccTscSsMnV19bZEr9Uuddv?=
 =?us-ascii?Q?VfCjYrObgPZV8HT0aSkUN4/fxwGpJjDG4M+9kuZjWKDHfOxAnNs/p3r0zz6+?=
 =?us-ascii?Q?Ys+Yw1TpJoIS7YYoFLYIEUjw3fU2/E8OLbd32cBMn7AgDb/9IEWa+fjhI7w+?=
 =?us-ascii?Q?NLJFl585AAwnupegeHzHK2gQ/9QFLcwOFGDSGCmBZQTr1NLnqrn0kuzlO7A+?=
 =?us-ascii?Q?2T5MCeCkDORqXbDhjZFbYXK88LZcf9Rs9xw2lg4C+2POIdIF7AO/+px+1l/r?=
 =?us-ascii?Q?Hta3Tzmc4qC5lQRA7U4a9nPXNV6V2eeMCKpZJjeSpyBF0AJ40e0P2E8rlwEj?=
 =?us-ascii?Q?oTsOptk0JjLpPjo7TjAu1DTAbguk49z8x1Zo3/oGrmWkp2WeVk4170qpOIcv?=
 =?us-ascii?Q?ipk280YpHIa4pFyQ/VJ56Oh/VHP7JarY5pqvVroR62KAnQLsYFzw1QZEFG0A?=
 =?us-ascii?Q?DB8FfT91zUymr4llIxETThKY1l+BOKqsBPKh6sof6cX8yaaodo2fXdF8/4Fc?=
 =?us-ascii?Q?h7cmMAtenJUsKB+D+G21qvCneeUXhWgPRvn+bxY3rK0o1JcFcqtamUx3eOVZ?=
 =?us-ascii?Q?cOJF2tR2KPIRfRq/pJtQzK2iQnusQ6TFS75tpOlhOphqNFAF+VuYaXG9odxA?=
 =?us-ascii?Q?UMQ/mLswH8Gf4a5eE6uVN1RzjgxXvfwtCcP4+utC+RELtpt/UocewYmgPLn6?=
 =?us-ascii?Q?JeW9n2N/EaDFtHr5Bj0oTa9vysu9iVdmp7/+Xo5MXgtVeN6H7qE8Hay782PB?=
 =?us-ascii?Q?1I+9cwUH+nuzyOviQ4Jz1uEbTaGvQHPvQfCySWQJjkenUMmkmvFjXgmsApXM?=
 =?us-ascii?Q?xoOoNKfu+TfPGssPiyNz6f47X6QP4UqRtDj7pjHumuQuaqOQMd3/T7VphM58?=
 =?us-ascii?Q?LwVsKQPUOQMHd1i7FqVTKKe5RUIoYtlt90mrDQ6tR9t/d6TDV5z9b+EpiVk6?=
 =?us-ascii?Q?HBVOvbGDCO4IwrIfLgWx+GNfM4w2TKERGaL5EuRGNqTQ0U+LOcQxtiQ1jevJ?=
 =?us-ascii?Q?Z20dB2g3jJit2iYzFY6TCVabQQ2Gnm/mS1uPIXZmTCxf0nPEdJfwLeHNL9PZ?=
 =?us-ascii?Q?XEMCtz66q79S/X8+a3aJ0Plr?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR02MB10115.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?lhdPmUWGBI8QwoNElhJgrxOUWecyoGizJWeeuOSOW6C9Nssw7y8zd7lBPpTX?=
 =?us-ascii?Q?B/3ujwymeqnWhz4+lkacP6nYmpcEUXd7QDHxUhXWGz3BgJj2DN4w5c+XqtD8?=
 =?us-ascii?Q?bMf1ZVUhfATkW1ndyYvj1q8MuIl1AFPEH3Vbe8e734EXxgbNhKAFt4kUStY5?=
 =?us-ascii?Q?Qq2y1cMtrr0TTll2gLHumR/NE2cTALxBTTgPB1m077nP4Lb5XumS2eEcXH3g?=
 =?us-ascii?Q?GLIG8Gw7aRjY+Zyl9xr1ANTLbrgfvjOp9BMbJfVeb9eqR5n7LRetjpWAIWYq?=
 =?us-ascii?Q?YeAGUiHA+PpXG3hUXkGKsJWAcPrU12Cc6sJG/+MLesEmo7oxTLbK14OhsN8e?=
 =?us-ascii?Q?u8FHTL51lSdHviJrf+EhkjTl5PW/RPTO7t9EiQSMmz2zkYaukul523XObb0X?=
 =?us-ascii?Q?C6+hLe2MfbifL1tEwJL5y5uJ6d3ZkL7icO+oOY13zpavNFFn+9PC17ad9X58?=
 =?us-ascii?Q?QiAbQn/bCJF/b7Ij7W6n9IY8OMhO1qdC3FWzsF1BFMQlVFGLsNTrNDKdlXyY?=
 =?us-ascii?Q?Bm0Yoxq5qeMzvYrDb6nC0m7flZJH+GVCXwwxfzWWQu6va22l7bGt1OgrBOfJ?=
 =?us-ascii?Q?EuGUrqCDSSroP3x176nJ4Hs6CZOPP2NNYw2ER7vBurMTVHFmRfFDokQJm8U5?=
 =?us-ascii?Q?pQk7NAoIjYlMLOu5FLsskst0+iQZn4j7P6scxE/Pdo7Atw8zwW4N56yn9HB7?=
 =?us-ascii?Q?VKKC7imnjAT7dVJOtODgODOFB6l+ByKUuisOGA6tr8u/yX+j5r+R377M7ysJ?=
 =?us-ascii?Q?LOliBhiAJDk+ScZwba1rPRrvnC2xUL0ZFz5fjSAtZC/PqifI0hIOGNF9kzhL?=
 =?us-ascii?Q?mtxlbzkN4ru3EUFxJB/sHkWx4/e8GglJ1zwAZx8loQl4+ySdtVNOcnd632hz?=
 =?us-ascii?Q?qRMT/TTswJcpHbeY5Vx+GOMgm2sK0KK0SCsUSzPEbBoJakiCIDBkze1a9zXM?=
 =?us-ascii?Q?uLfxlzisUBrmdVxKVGQvY2rTk7pkjPVCOUHP0JljTGnbfAJj/x9RX6W1k6mH?=
 =?us-ascii?Q?fyWTO34kPeHiDjAFAJvKrSHzCtCNgFEshp3DvelhJ8YSdzgL5LQ0OnPFjEEW?=
 =?us-ascii?Q?rPBfUasqklDNLLvb5K1YZ1jq/W7oyNMNvJAMHnBU2HVHe7V2ou7DJK0n3E3x?=
 =?us-ascii?Q?g8jSfjtEiRfN5TJnM6cTPQHKhYCA6xamPy/7+HoGyltLeXE5Ulabf+WbV7qM?=
 =?us-ascii?Q?YPyuLwszs7vSwdzJauY1HZT/vaOTyXmW/2kgsmHX3K+oyRANjzCfg9g2e7xE?=
 =?us-ascii?Q?PiQTipYmw4m4e1xcLKKPipaSe1cnGOL4kQTqxL6XHG/ULqxos6LMFB5NnfGW?=
 =?us-ascii?Q?vUVoE03IM+sr5/TQB4NaQHgKPHGmxc/t8m+WOVhP2Ls5PnpXqbL6xXD0IMPz?=
 =?us-ascii?Q?8GVigIMBpbJ9GQ5ToDIKMXiScMH3JzxVYgl/TR0yd4WIi1egzTU0LLo+vmk3?=
 =?us-ascii?Q?Da/iJk64UGSG/EtDb7YSZ3BhuiaFjCVzJiI+jeMSVQgKSBcuEiU0nib4WcUQ?=
 =?us-ascii?Q?jL93EOkLxliFSWriGtJgLGulsfkkI/f9qO3HDH1pdascnBPovEsRG2RdCfat?=
 =?us-ascii?Q?o8kbNuo0hXM6LEyr6J6PT27o1K7p48m1LQC/zukv?=
Content-Type: multipart/alternative;
	boundary="_000_SA3PR02MB1011516224B1A7952145A6609C1402SA3PR02MB10115na_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	usnX7/O4tacXGh7o1g9k74faULBVMiP4YDyFQaf1f71tSQ9JgJUprP6ZhFMOqxDheOrHiEwROXvB1klvGp+/g73+CvuP42khBxGFluGy0UGC57ZrxhpMZldFpjbnn+KL7ocGBWL2a9NbwT3b2WCDIPTedHRIjF3bvciq057FSW1Fi6qYUtieM24ZXDcar5K7UXRWJdBHmtWNwoBnQ5R1oo0uVQ7OnBlGnEzIcwAfOeBTp1TfNy/VEOrDQR3bfaXASE25Xys0TDO02y0QUDSy9fYDrDSGZw0c7vnn1DF/uKby0wwhOc/GBFgs8BAbzDf90LJsw72ECTh+d3hvE+Va7i8NLyTT+hKOa4vEDDLUFzR2v7ow9cNWflg4nc+JMM50jFiu8R2A/7dq87OY7AUjLLxqipHhBhJHRwgQEZ8oLvscP8YOZwN4ew7b7sz7FNCvQQdR1bjmzJU2LOURsemPQL2+9nz6eZjo9GujQy0y0NmJM6yui0zfkrR8pLk+EhyxS1OZvnb6PLYTIXNVVde/+4lEUGpdw0dlzND6T4n1UC6DfQ6r+fHoOwZAQJXq+rgoiwTkE/fZIQV1JvZ2tIw8Lvl/O5l9tfikoO/6ZkgrWmK0Af7bsjoMUIa17cFAvlXy
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR02MB10115.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882f16fb-bad3-4fb8-d9bc-08dcefb32d65
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 20:26:41.9553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tGeNcniZsDCQdQKsFZpfvV0FfYxbV8G3C6U6on8Q83MkRydAU/7OIvfhlQ202GxWkM02KFdEv7fEKLj6lYY5EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR02MB10565
X-Proofpoint-GUID: yCZVlVA5EAiuuuc3TA9VohO5djd5nw2Q
X-Proofpoint-ORIG-GUID: yCZVlVA5EAiuuuc3TA9VohO5djd5nw2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=852 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 20:26:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206071

--_000_SA3PR02MB1011516224B1A7952145A6609C1402SA3PR02MB10115na_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello openembedded-core developers,

We are using systemd service files that use instance name to configure thei=
r WantedBy dependency. The names of the services could be abc@multi-user.se=
rvice or abc@basic.service - the abc@.service is a template systemd service=
 that reference the instance using "%i" in the [Install] section.

[Install]
WantedBy=3D%i.target

The expected behavior is that, when enabling abc@multi-user.service, Wanted=
By=3D%i.target is replaced as WantedBy=3Dmulti-user.target because the abc@=
multi-user.service's instance name is "multi-user". And the enable script w=
ould then create a symlink from /etc/systemd/system/multi-user.target.wants=
/abc@multi-user.service -> /usr/lib/systemd/system/abc@.service

However, when using openembedded-core's native systemctl script for enablin=
g abc@multi-user.service during a yocto build, the %i is not replaced.

Currently, for Yocto's systemctl script to replace the "%i" with instance, =
the first character after WantedBy=3D must not be a "%" character. The rege=
x used is in openembedded-core/meta/recipes-core/systemd/systemd-systemctl/=
systemctl at master * openembedded/openembedded-core * GitHub<https://githu=
b.com/openembedded/openembedded-core/blob/master/meta/recipes-core/systemd/=
systemd-systemctl/systemctl#L205> (pasting the github mirror link because t=
he normal git repo is inaccessible at my end currently).

This is faulty behavior from my perspective. Systemd.unit<https://www.freed=
esktop.org/software/systemd/man/latest/systemd.unit.html#Specifiers> man pa=
ge does not mention any restriction prohibiting "%i" as the first pattern a=
fter WantedBy=3D, and systemd's systemctl program currently allows WantedBy=
=3D%i.target.

Thank you,
Eric Smith

--_000_SA3PR02MB1011516224B1A7952145A6609C1402SA3PR02MB10115na_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello openembedded-core developers,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are using systemd service files that use instance=
 name to configure their WantedBy dependency. The names of the services cou=
ld be abc@multi-user.service or abc@basic.service &#8211; the abc@.service =
is a template systemd service that reference
 the instance using &#8220;%i&#8221; in the [Install] section.<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">[Install]<o:p></o:p></p>
<p class=3D"MsoNormal">WantedBy=3D%i.target<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The expected behavior is that, when enabling abc@mul=
ti-user.service, WantedBy=3D%i.target is replaced as WantedBy=3Dmulti-user.=
target because the abc@multi-user.service&#8217;s instance name is &#8220;m=
ulti-user&#8221;. And the enable script would then create
 a symlink from /etc/systemd/system/multi-user.target.wants/abc@multi-user.=
service -&gt; /usr/lib/systemd/system/abc@.service
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">However, when using openembedded-core&#8217;s native=
 systemctl script for enabling abc@multi-user.service during a yocto build,=
 the %i is not replaced.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Currently, for Yocto&#8217;s systemctl script to rep=
lace the &#8220;%i&#8221; with instance, the first character after WantedBy=
=3D must not be a &#8220;%&#8221; character. The regex used is in
<a href=3D"https://github.com/openembedded/openembedded-core/blob/master/me=
ta/recipes-core/systemd/systemd-systemctl/systemctl#L205">
openembedded-core/meta/recipes-core/systemd/systemd-systemctl/systemctl at =
master &middot; openembedded/openembedded-core &middot; GitHub</a> (pasting=
 the github mirror link because the normal git repo is inaccessible at my e=
nd currently).<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is faulty behavior from my perspective. <a href=
=3D"https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.ht=
ml#Specifiers">
Systemd.unit</a> man page does not mention any restriction prohibiting &#82=
20;%i&#8221; as the first pattern after WantedBy=3D, and systemd&#8217;s sy=
stemctl program currently allows WantedBy=3D%i.target.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">Thank you,<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">Eric Smith<o:p></=
o:p></span></p>
</div>
</body>
</html>

--_000_SA3PR02MB1011516224B1A7952145A6609C1402SA3PR02MB10115na_--

