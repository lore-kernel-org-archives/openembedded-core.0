Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5962FC25B76
	for <webhook@archiver.kernel.org>; Sat,  8 Jun 2024 03:58:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.104.1717819097057144407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 20:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6889680c14=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4583qiSO010767
	for <openembedded-core@lists.openembedded.org>; Sat, 8 Jun 2024 03:58:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yme9601dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 08 Jun 2024 03:58:16 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4583wFcL017823
	for <openembedded-core@lists.openembedded.org>; Sat, 8 Jun 2024 03:58:15 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yme9601dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Jun 2024 03:58:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L871LC2UZaVEOQVmTqVt6QqKO5L6pOzst7KBGhE4aDcBvy8OjqUok1taQO9htulZVu06drOM3iR7NPhXcjsOaiveeiqFnY0sZydDECPyqQUaYo6olaWmo4v9JsbclFgQlUOIoeS+1nH9miMwJeSmUizLbiESePFsdrfCsZov1dV35sNWCTGjIXyOZUZ62BgUJd79HDDgKXxpklTEYI8BkDXCSayS9AGRut7sCShZmLhDHewQdTy1/8HXidqZG/1w1/8/zGLyBiGC2gqFacvbD4acZPGnX+UcOgKA2ar5PGQSzgnPett7RqxKZXI6f/8NNLVKppDGXgMHHX3ubeNlNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wcaBWjo2ZEl5nrr9H/wsNvB1UhgA6A6m3kWB2o+7xs=;
 b=IZiHHZibSE6FhH6vGz1LEPfjNzubMrvdipZnKTtUyFzrjs4X4VE0U0pDFfcAs0GstynYNHD2IQbaoXDIL9eNSJCVGgUFwsckeXQTspmamXCmzuAzv1sJn+lnrTHXt/g9oK/8s7xD08ys1u3O1e67UeELq65tDrIA+X/IT183EISygfdV9fA/F17NQ+6as//bKuXGz3ij8QSI8L97RgxEjqACJshBxTThZkVG06tacNVqu6UcMqHWSn6cNt0VAnO+mf2UcIt6it7XLYyiWXWXvAJm4TG6Zp7mPtzA99MFf6sO7yxHjKY0m34otVhKdHlPn+HIn2HhEGsleg4ITyJqdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB7953.namprd11.prod.outlook.com (2603:10b6:208:40d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Sat, 8 Jun
 2024 03:58:12 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7633.036; Sat, 8 Jun 2024
 03:58:12 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 1/2] coreutils: split out coreutils-getlimits
Thread-Topic: [OE-core][PATCH 1/2] coreutils: split out coreutils-getlimits
Thread-Index: AQHauAvrr6OpDiBe8ESoHWLmXtKWGLG8TomAgAAAn5CAABOHAIAA2hug
Date: Sat, 8 Jun 2024 03:58:11 +0000
Message-ID: 
 <CO6PR11MB5602F5C5DF57B9C661BE7727EDC42@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20240606122013.145187-1-Qi.Chen@windriver.com>
 <F1C4FA48-6A4A-4471-8AE2-1C1E3AC20A97@arm.com>
 <CO6PR11MB5602F9E6285EBA317395BB3BEDFB2@CO6PR11MB5602.namprd11.prod.outlook.com>
 <ED5C1C84-D389-451F-8D9A-242D4C7928FF@arm.com>
In-Reply-To: <ED5C1C84-D389-451F-8D9A-242D4C7928FF@arm.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|IA0PR11MB7953:EE_
x-ms-office365-filtering-correlation-id: 2773b0b4-b74d-4d95-1028-08dc876f3762
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?TZlOh/a2QCbSIqTbgGzVZeNAtfY6oyLJDxVClg7k6duG4ax0y5AkPWfJCSxx?=
 =?us-ascii?Q?q4s+wKbuMCPb/uqkaMJtkD/ArPrXV8RwGBTKy3jRSkkLmE0hi6rYZNaiYrXI?=
 =?us-ascii?Q?9wcimxlE0BBxJrN8a40RVZXHRffq1wgdr2NLkEW32aFjjPO5dHe1qGAZQam+?=
 =?us-ascii?Q?7UxpLVQwl4L3NMcb8tjk+935jTEgKZa/9wDNOqV38GpYCFvxSp+6u1pM/Yko?=
 =?us-ascii?Q?1ENO6Jo+ZdNLHyDwk8MAj2zg7Lvi5UBP0xDSEw1f87pdqnMqaw74uFcrM5PJ?=
 =?us-ascii?Q?WhBo9pYKZKVkduPQEDG6PJ6Mb3O3X71UW/U+2aGOGL3mWLnUylQg3uQ0YrXD?=
 =?us-ascii?Q?/nBMB42H9zuwPkH0qX/uCvVTMoeFHgzqTHVqlFH4KVhXrZ6FoDExvqItv6VO?=
 =?us-ascii?Q?YZtzYDSCwG23bLM0jqCFHcAy3sDtUb0MHnOvI9ubtJjmopS2FBcGAnT8qnTV?=
 =?us-ascii?Q?c6vHLnUG43CvPu+s+xcSORG0PBjVxHT/1jknIB9ls2KWJvZd6mQ16BiMDI37?=
 =?us-ascii?Q?IBxDdXZCihjdasGzF8BipgN9FmHaUY7Yhk5ONY2PVSVo+vCgIVZFZb3L0lAn?=
 =?us-ascii?Q?moS0h0n0QPdWpQqZ2POw5WaDil2tTTfMLxmMuK/Tq/9t9cBTFH3CFzqnLoHX?=
 =?us-ascii?Q?7n7qWnswIrqtz07dEdVXdl79fG+QnY7TboltgUwgl4HKF/72qancKyIdUhvs?=
 =?us-ascii?Q?wPZ2lgHaVDvVSsCkM785xE/h8f72NLSrvMvzgkiyA+SunsVq7o8zLRz4BCBa?=
 =?us-ascii?Q?LPs8OT/lMw4AR/J3eGLjK9zmqNuCcoAmKM/C0TV2iyorz3rY3MRr+ULfIA+x?=
 =?us-ascii?Q?L8b+P3xn7dsy/zWbCBS541MOcQmdYAorcS7pxJxRPJNw7JbdumqyzLvGni9/?=
 =?us-ascii?Q?u9k3sG7Z01x6gP8CXyM4TAruzBd7zeI77/Bu1Eet0/hN0eTZJdblGkpcoCo7?=
 =?us-ascii?Q?Q37K8K8rvxPIW8WKAj1YQJcI5k4Ynj/KzFDVaLnY7Rw1E2xiOM9DpaivEUdb?=
 =?us-ascii?Q?UtKrOZQmfkx5d0u/vnmrsZ9eITrAbzcUzcQfAbQVkhE0BMskn23pvP1YDIk+?=
 =?us-ascii?Q?+XYm26Ybh6Z1/LFFDFn03MYrcNLG2WLTXCqGDOB1Z9CHfMden6ywx9M/Mq7O?=
 =?us-ascii?Q?D1GRM7Eq2Hh16L6d3D6J4MNhvTjTAmi7VpRJ6v+zejHFRiDr1vl9i6Pdyz3E?=
 =?us-ascii?Q?EJ4MuPuOTbie6/VFLTTXXZG1KDJB0BTq7WRwyJPoFcBLeam4p5GcM2tm+Fx1?=
 =?us-ascii?Q?f6G2NohAEAwMn7moO8aKpjLTI7LtIRmvyCWanTsLe4dVy2cCqif270PAk4jH?=
 =?us-ascii?Q?Dwal1L56EPqChGG/8bIJHQSrmvgf6itKs4vDuGE0Mq2M5UyNYu2HZ9wKjdNP?=
 =?us-ascii?Q?SyNIyBQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?eT4nk6jmsv7bJfSxXjaDmvs/Enw34AS3rvUDqcCkM7zwyeLxFBBISfuMcmCC?=
 =?us-ascii?Q?N5936qfS91vTHryRrdpkfXKMWEk3iI12EdLT7kTMNOfAcy4rN+0OKStfFqx0?=
 =?us-ascii?Q?JvDAdN901Ky28NBdeBZmYfT9YzZ0RcVdI6VLvJRqEJeY26cX5Hcdqz2mfO2e?=
 =?us-ascii?Q?TJGloUOqvCvam+HTz7dOCgEf02pG5wKh35ZxHW6DNc/VQcSRGRM3iBkz+zND?=
 =?us-ascii?Q?Ei4mVRt8uTlWdYeyjg8Rqe6Z1BSDefUCFzGTTZ+g2ByQrdkh32DflviRRhc0?=
 =?us-ascii?Q?LDudBuWRaH7Rl82q6YZ96QhL5iUA3YLk3CSaj1aGQ49HSH403SqQbEg3dZAi?=
 =?us-ascii?Q?gdYKT8tbF2Awdg6X6+5YJadk93NBmAm2uV81fZ/RRgh4w5Z92NR/xLuY3zMT?=
 =?us-ascii?Q?5dk6p8gcyNAIfg19HvLqQPCQ+fEX0fpqxLyEDTVy7fH0NOs2MYFnoeoKX698?=
 =?us-ascii?Q?y2az/pM4hbHj7/uKoHooLDfI06Fd/R5cBnhLRewqahJc3mPNk/F7Ebfq1QPc?=
 =?us-ascii?Q?+HHeKGbPWoNddrY1EmPbUtODcNOS5UlNlCt4wEcQrKM6nLgmDLBN44MqlMXM?=
 =?us-ascii?Q?bjN1hrxRMM0YAB5BC9riVvKZbFyV+Ui/Wv+W61QfNBlTZNA/MXgqZXztriuO?=
 =?us-ascii?Q?6fc0xlVpdAzkaztm19ofMdDD+hw0GfVezsvWs86sfSEDkVQEI2QfcR9JP9Au?=
 =?us-ascii?Q?vZGAT1kOHf2+UhbKz1t3Z9CKYQm57Hpb6G6c0WeOliHbPCVumsag3rovH1SP?=
 =?us-ascii?Q?WZ76Zxg8SiFmftxLsQJdwJ2U9yOIuKpE4BFNU/lqXDxcWhqRswjkPn98DCOz?=
 =?us-ascii?Q?PZ7RCCgWTdyN0qOAu0H/AHS6tGBKg6pls9uA7puuHTV8kMtxjWXtB5yruhJF?=
 =?us-ascii?Q?R/ZB+SZ0wnuhVzxyDgF/xov6mcCWjUuQmIXNN5C6Qe++BmrpWVJH/8zpIcWh?=
 =?us-ascii?Q?noP8/mFAMcnrvUj6TmoqHysCrphWkLETo/y95n0q0qck+MAPwkGy+bla9by+?=
 =?us-ascii?Q?UjQjO6hidai9btEpM4PNB7yB+zP/Q4fkLmKtMJ/8/z1TkdjWIriL3K2T847K?=
 =?us-ascii?Q?DRVZOMjf1hpczK/LX0x01OQP/lojWzQIOnGusRxf34zYW2InvteG3D7Fv8qU?=
 =?us-ascii?Q?yPN5T2pkp1I0pdxa5My96SIGyKqcjE+7dMJz0uEGgbTMS5h8UQ20fg55YPuM?=
 =?us-ascii?Q?TgFPJT01fmsmxeDE0KS6sGXwe5ZkGuZeBS2lwSGvyE2IMRIwuAetsJmwanbc?=
 =?us-ascii?Q?jvk+jPECfOvSN/Ont2u1fUmIR/p/o6F76X4iTAPfVa+1k1akogYPmC+2wm1y?=
 =?us-ascii?Q?osKfBxWTug3F66bDG3OwPYg6+Va1GDM9yxFLSpAaCsHDF1nLyZcFmXothVKK?=
 =?us-ascii?Q?d1kMwfe04S42/3P/Bf3nc/K7Ur7X6iV6JoDzEjyg/FKjvbDDBCinrngj9BR9?=
 =?us-ascii?Q?btmJERZAcA/W+TOdDXUBqljMbamBaDZ3E6fHgT1CYOhZWzu1HG/IpIYoolRK?=
 =?us-ascii?Q?21gQVKUl0BCEm+WzkDXk7wVOnuQuUhrMSn5B89oSS3F+fNP+8JmZep8j6LfU?=
 =?us-ascii?Q?8K+T492tF6OTOvJTOXvSmgGRxQvXixXYk4LWCtFQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2773b0b4-b74d-4d95-1028-08dc876f3762
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2024 03:58:11.9527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XICFXsCMRzGYuhd4tdUNrZ9SUg5sf+TnmoEUqL4LKckfirGe2H6RoAMOA2cwzRXoQGp1iCwVbZTBPSEVPrFK5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7953
X-Proofpoint-GUID: -QiBvP7H6ju6PSenUCzwRV3fKg4UPgCU
X-Proofpoint-ORIG-GUID: HzXYYFxvD6-4wBFF2YWL141NkFm42Tkh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_16,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406080027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jun 2024 03:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200450

For OE, the finduitls package before 4.10.0 does not require getlimits to r=
un its ptest. But for the new 4.10.0 version, its test cases need getlimits=
.

For other distros, I'm not sure if they have similar mechanisms like ptest =
and I'm not sure if they have met this problem. I just checked debian:lates=
t and its finduitls package is of version 4.9.0. So chances are that they h=
aven't met this problem or that their build system will not reveal such pro=
blem to them.

Regards,
Qi

-----Original Message-----
From: Ross Burton <Ross.Burton@arm.com>=20
Sent: Friday, June 7, 2024 10:46 PM
To: Chen, Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 1/2] coreutils: split out coreutils-getlimits

On 7 Jun 2024, at 14:41, Chen Qi via lists.openembedded.org <Qi.Chen=3Dwind=
river.com@lists.openembedded.org> wrote:
>=20
> Because unlike other commands, getlimits is a noinst_PROGRAM. It's expect=
ed to be used by its tests only. I checked Ubuntu, Debian and Fedora, none =
of them provides getlimits. So if not for the ptest packages, we would not =
be using this command either.

So if nobody installs it, how does anyone else run the findutils test suite=
?

Ross

