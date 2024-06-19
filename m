Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD76C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:17:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16487.1718788648441168943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6900491da8=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J7uhUj006696
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:17:28 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yujayrdba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXIHtVOBUr2hX+lIa15Z+kcjE0UGRu42YrtVPIieL2cFkUtPAQpsNgfjigXqSBY2+G+wjIPzJbvpiap7MFQqA6GT52hqKKACab49AkZni73KIaDzZtj4h2/7HYKIIHx0YCy2kOtzOe608mHTjuDSyc7mR7fgA/3A47NdXFk7NcVnUyKv6oa/g1paMVITptErfjxYUyGMLjVANFFxwMuvUQdwj3HbwrU0jiTVz+wog0ctmiKF0xjERAINDVKMx3sLYsnowuSgNdeNdia74KWZ0oQg4UqXiRQhfaHctQ4SB/Dh9O6A/JszNlFaGGnr0QWGITpMjuNndVgYZIG8bEX56g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysG2TmcRJtrjyCziD84+A3AyMRmKbApPC/Fkeu6hxTY=;
 b=RKIVx2y1Laq8hW9YarrFMLtq+ijZx54r9M0yP0cQ0F4j7LIvm3lYCXUNr9lHcLexV3EfaRqGYpdu3waplIDnnDLtJxv5MeUKq9fAq1RuqhAc9wHYzM0Q3VPDi5PfpOxDvU5gqw3kS9TB5N7iHwqLRS+nu76NhiIibWBeMC9l7jWtnofCTo6+xuH6F7EgZBggyBqZuMEP2UX7Eo1t7ILsCe9ev4/vTQwAWQEVbd2qPcpk3siz/1cpmntKtq2udfZJaR+aZJ+Cn6SRD2s+jvvxSk9Zup9fnfEqkrTC3BnPX73FSxShEoIGgxtLZrEtkS6gJqcxL8s+aJbZgO3gZEYceQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4572.namprd11.prod.outlook.com (2603:10b6:303:5e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 09:17:24 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 09:17:24 +0000
From: mingli.yu@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] acl: Fix nfs ptest failure
Date: Wed, 19 Jun 2024 17:17:03 +0800
Message-Id: <20240619091703.1410186-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=utf-8
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|MW3PR11MB4572:EE_
X-MS-Office365-Filtering-Correlation-Id: aec84850-22a7-4c27-9715-08dc9040a169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|1800799021|52116011|366013|376011|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T1NadHFrbUVWZitxS1FJNy9KUHhJdlNJVE5YeUYvU2ZzbDdwR0JkWWViYXND?=
 =?utf-8?B?ZFpBdko5cS9mZlJGSnQ4ZDFoUW54REtUYzBlam1IalN3K3NwbmRFbVVORU5U?=
 =?utf-8?B?T0o4OTJtV214eTg0WVM5NE11MmpyczZLQWM4VGw2RUZ4bEpBZFN6eFByZEtT?=
 =?utf-8?B?ZkRHMG94RTN3OFhMK3JnOGUrSFlpb3BSdVBLNkN4TmhCYzhxdVhsZFN3dnhL?=
 =?utf-8?B?bzhObFRCajFEOHNFVXNHV3M1dU55NGozalUwblVPWUFxZUN0QXZmSFlFTU9N?=
 =?utf-8?B?b1F4b3Q2V2poOHdUL042WDkwQ1pGejZYTlJ6ZjJwT0JEM1kreXZ6aE5PYU1Z?=
 =?utf-8?B?ZDgyYy9vbmhWcVJWTk55R21hNjdRUUxsZU1yN1VrNlZYeExzcm9KTmJielpT?=
 =?utf-8?B?YzdvVUovTTZ1ZTlHV3p2ME15THRjTVJJZXBmRkdQYjVmRzFpN1p3ZUtBeTBi?=
 =?utf-8?B?ZkhPZkNydXIrSEFmbS9qbEJ6eThBUStKZDdaVUdtYmFFR0Z6ZUFOSXBRVFg3?=
 =?utf-8?B?R3pXS1hrNU51UnNXRm11aXB5Uk56b3RsdlpUaFNFSzRHUmxCZE9uU0VNbm9L?=
 =?utf-8?B?UGNPdzNhdHhYSS85U1BYN1EwMmMzelI0ZFgzYzdyeTNLK3FxTHJobE1jQmNs?=
 =?utf-8?B?SFJEOEl4MWIrbm92bU9CQlh4bFdTUzNwYzZOMitCWHVheEJBTGtKM1VoMGxF?=
 =?utf-8?B?N0VpRnRhVVpIbUE0UStKSU5tYUswU2lTQTRjMi9MMFRieTJzMjduMGxnTldp?=
 =?utf-8?B?d0s3QVIvbE1xMnpzODk1eW8xODVRU2tuZUlzTmIrVUkyMFZ6eWV6aitTaVZP?=
 =?utf-8?B?VUpqTmRKa00yMi9sTllPOVU0S1h2SzdtTmM0dUI3bnNoVGtTOFlDVDNCODNY?=
 =?utf-8?B?WTJNQWFHamEvcWJWR1FJYnNKNzB0SWZSUGR0S3d0THlNMU0zNUJCaUVOVXlC?=
 =?utf-8?B?S1pGT0tyVGlRSmJYaHcxdEdkM3lIaVk0VHdoQk45L21XckhDSTJpanpsZysy?=
 =?utf-8?B?NlN3cFRBRkJwRFZwZUV1WmtXWWJRWFdLWXV3VE1mR3VTdmthaE5SL1poR0RP?=
 =?utf-8?B?MDhtOHNGRmJ4N1BTS1ZPYzFkWlpMeGVDRjg1QWJuTEZGcHRQSUNnOFpYeWE2?=
 =?utf-8?B?dVdCVFVJZkVJZndWQWxvRlFGT1pEUjFLdUc4SnVKMEJqTXhGUVhEZmQxd3hk?=
 =?utf-8?B?Q1dESUZ5clgxNk1aMnh1dkMvZTlPY0F0N21SR1BvQ1FWaFRCeGh2MmpnMzZD?=
 =?utf-8?B?VHRqWUNaSWlSN0pxUkg3Risza2JJdnNBZVB5RkZIZENBbHFPSUlpcVA4OGF6?=
 =?utf-8?B?bG03blVDQVVIeHgzZ21kTGMwWW1lVllwVGF0b2xCUmcxYVppd0RpbkVudEtO?=
 =?utf-8?B?VnVNN1EwTFZmdlh3TTNTY1lvejdMa3FvZmxCTDdoUjFKaEhzRTQ4S0kzNEZt?=
 =?utf-8?B?bVZEcHBxUGFkWmc1Mm1PaTZHVklQZGRkekdSdG10a3NTTnJ3amNhL1hScG1p?=
 =?utf-8?B?RmNXOWZ6VS93T3l6d1VJSEg0Y2J4R1gyNTBxTGIvYlFXMXQzd1dXOVhaeEMy?=
 =?utf-8?B?Y1U3S2FFTnE5elk3RE53bXZwYkFubjViVFNKbEExVWhxNzhmbzZOUTZSOHpR?=
 =?utf-8?B?WGRQdHRBcCtDRVBZemw3dG9oVWtYLzZHR3FXOU5RTmwwbk1ySU0wVTVweGND?=
 =?utf-8?B?bkxtdUJEb2ZOald6QjlxUUI2SUZ2dWl4QS9DR1EvbUpjR0pBcHM3UG1iRW1P?=
 =?utf-8?Q?+d+f6iesyxVvR9BkLqtDyAKpR6JurFwfhu3SNGY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(52116011)(366013)(376011)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZnppaFAzZmUza2J0dytqYlU2S2psQnV6cnI5ZDJHMGNTQ21POTVyaUt3Nloy?=
 =?utf-8?B?TWNycjQ4OEFhOEl0WVJENWwxTU1wajBpeHFzS3VGendSaXhzelVkUzBWVnAw?=
 =?utf-8?B?dVJqWTJ1RHpBM0Jic2p0THlXZ1ZtdmFGWDdJaWFrWUdwMHNjZlBXYnJpVDlq?=
 =?utf-8?B?SlpUb3haMWEwcGl4Mkc1dzNhNm8rZWNpRXE4eGU2UjN6a0U3MG1nMEU3ZGxv?=
 =?utf-8?B?MkR5UlF1S1JURHRFdzhzUVh4eFIrd05FUTA2aVdPSllvc1M1OXgwcFU5czZk?=
 =?utf-8?B?ZDVJY0o2OGlZQ0JJeTFYUXlLQzVmc1JpL1VkbVFHQ0xCUXBINHZiTHVYOUhC?=
 =?utf-8?B?Qnk2aTlmcmxJYmQxR3Q5cTFiN09nQ0FNcFl3RW5qZGc1MERCZS92RXo5Tm43?=
 =?utf-8?B?L1dIWGQ0T0c0Y1UvTmttZi9HMUt2UjJkeGo1MUp0MmhVcEF6d0VjZnBKY2hN?=
 =?utf-8?B?TjV0QjJlYWRuVWFYbG0xMVN2RWxyUFNXMHd6NUpCQ0MvdlNSWnpCZWtMeFZ2?=
 =?utf-8?B?VHN5b1dUQk9qNWtGVU51bWt4MU1uZGU3YnNaRGRYODZVTHgxam5Gc1FZN1hx?=
 =?utf-8?B?bnNHTXV2dlZHOW5QbXNHK0FqdGIvSWV6T1JPRC9uRHhCVEEwbGZZZkhZcVNx?=
 =?utf-8?B?bWZaVWVvbGdiOVZUNkw3UkVYNmpNVjlrM0xXY29tNUpDeEdibEhFNnN5Rmpj?=
 =?utf-8?B?VllnWXlTVlhtVi9mY1NCQnV3NFBYc3NpOWt2cnE5UTg4aU9xcXptVkZUUFhr?=
 =?utf-8?B?cnp1WE1BWXRRVGJhQXgvTi9sL01TZmtZT2RYY3FaUkNPTStqbC9zbitYVXVm?=
 =?utf-8?B?SzVoVC9KV2pBKzRzMnNiSU04cWl3WitsL25yeVIyWnFwUEFLaHJtS2lFUnVj?=
 =?utf-8?B?YXp5cGVBYS85RDUzODBtcDhFL3I2OW13QUJQeFJtRVovTTI2bHJqUXAwYjFD?=
 =?utf-8?B?Ym9vS2p5WUtJS2Q2N0lma1l4cHlJMDIvV29zb0JpZmltVllISHNwOVExekVF?=
 =?utf-8?B?Z01tS2ZMRDNlZDdWay8wV2tXSWt3WVpTTVJMdEdGYzN5ZVMydkg5SDBsMGp1?=
 =?utf-8?B?dW9MYUg1STlPVjJOZzlOZG83aUxNRStic3NqNDVxTlNHc1VBT2tBRFoxSHZh?=
 =?utf-8?B?L0pFZjdEMXBaVzNVbUVDWjVHa2djQmozWi80Zm9jbTNvM0E0WXlzOUZyY1hi?=
 =?utf-8?B?VEdhL0VzU09WK3RCd3Z4MWRJNCsvT08yMDFmNnpWckNCbmRiYm5yd3FnRG4r?=
 =?utf-8?B?THpCZE5sVTA5ZXB4aHZaUVVyeE5LSFJHc3ZYclFTZDZCb3l2MlZPZzk5T1Ry?=
 =?utf-8?B?bXE1eVdydHV0eUdxOUhqZU9XY0NVL1ZIUkRaaG9COHdxUEF1QVE3eDZNeWFL?=
 =?utf-8?B?ZlhWNmt6NFo2dGVpTnFrOWw3aUZpTFBFNWg5THlqNWZLTU9DSk44QmErT0RE?=
 =?utf-8?B?eGs3M3N4T2t1bjU3ejNzVS9HcThVV2F5WGxFWitUL2xZdEFpQ0wyOEVLOEht?=
 =?utf-8?B?am1NOCtJUGNnQlJHaDJIM2RIWS84N3h6eEtsOVJtTFV6OWFsQkhSa2svbzFC?=
 =?utf-8?B?aTNNVW55YVdHZTlHYXFnUjhub0ZxYzVZT0hyL3EyUzR0ZWE2YXl6b3JkSWdR?=
 =?utf-8?B?bDRLVnZWcjAzMW0vTEYyaVIvSFRmYjdYUW5ORk9EdWo5aWkvZjdxRmJnQit1?=
 =?utf-8?B?eVpCTXg1ekF1K0ErbDJpMnRmL1RhTjcvbkEyZ1V1RzY4NUo0Q3FKajRTZkhx?=
 =?utf-8?B?OVJhcFppVFRoMlNiTHF3NyswOVkwbGpQWlM1VDJucU9uN3JHaGhjbFdFZ2JM?=
 =?utf-8?B?YXhqMG14OHlSdlBjT0dKRHN5QnVYWkpjSTBLVURDZ0c1enpsNzNlVFlrK2ls?=
 =?utf-8?B?RnhuUXNzNEJKRWh1aWJxQVhYTHhKdGVMb1dVeWI1RHlOOHFlbE5GZ29laHlK?=
 =?utf-8?B?QWJQZUJlbXJYTDE3dVZrczJtR3VhUmFEN0JBZGJpNUVhNGhTQ3FzbTArVkxW?=
 =?utf-8?B?UTR0Rzhzak9PQURXODBZa1pVSXhTMHQxQkpPa1lJRXh1c0hXdDlqYmxIdnNr?=
 =?utf-8?B?ckQyd3l0SFhCd3JTMVJLMnFNb0tNbWowV2U2aUt3L0lBVnlxcDZ5T1hSazJ6?=
 =?utf-8?Q?cJlcnl9rvs5+0olu5eKqQQAVE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec84850-22a7-4c27-9715-08dc9040a169
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 09:17:24.2898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5u7q+N7CUX0Womv50xBgf8Wxe+3p7S6QRJZRByCHnuNF+oyIcvLM73HmPx7P9MnCsu6KExLePNDsDU4VYx/mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4572
X-Proofpoint-GUID: b83jLTWR_qRSh7TbgurQMEYAcQII7u3S
X-Proofpoint-ORIG-GUID: b83jLTWR_qRSh7TbgurQMEYAcQII7u3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011 impostorscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406190068
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45J7uhUj006696
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200902

From: Mingli Yu <mingli.yu@windriver.com>

* The date such as "Jun 13" should take 2 columns, so the expected check
item "test/sub2" should the column 9.
 # ls test/sub2 -dl
 drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2

  Corret the check item to fix the below failure in the test/nfsacl.test.
  [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}' -- fa=
iled
  drwxr-xr-x 07:23                      !=3D drwxr-xr-x test/sub2
  -rw-r--r-- 07:23                      !=3D -rw-r--r-- test/sub2/blah

* Use the abosulte path otherwise we won't find the expected file blah.

* The calls to getgrnam_r would always fail because the size of the
buffer was smaller than the minimum (170000) specified in the test
implementations of getgrnam_r and getpwnam_r.  Use test_get*_match direct=
ly
because getpwnam and getgrnam should never fail on ERANGE.

This commit fixes the following failure in the test/nfs/nfs-dir.test test=
:

[16] $ su bin -- failed
su: user bin does not exist           !=3D ~

 # ./run-ptest
PASS: test/cp.test
PASS: test/getfacl-lfs.test
PASS: test/getfacl-noacl.test
PASS: test/getfacl-recursive.test
PASS: test/malformed-restore.test
PASS: test/misc.test
PASS: test/sbits-restore.test
PASS: test/setfacl-X.test
PASS: test/utf8-filenames.test
PASS: test/root/getfacl.test
PASS: test/root/permissions.test
PASS: test/root/restore.test
PASS: test/root/setfacl.test
PASS: test/nfs/nfsacl.test
PASS: test/nfs/nfs-dir.test
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Testsuite summary for acl 2.3.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
 # TOTAL: 15
 # PASS:  15
 # SKIP:  0
 # XFAIL: 0
 # FAIL:  0
 # XPASS: 0
 # ERROR: 0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-test-Unify-the-nfs-test-output.patch | 40 +++++++++++
 ...s-nfs-dir.test-Use-the-abosulte-path.patch | 46 +++++++++++++
 ...s-nfsacl.test-Correct-the-check-item.patch | 51 ++++++++++++++
 ...0001-tests-fix-getpwnam-and-getgrnam.patch | 67 +++++++++++++++++++
 meta/recipes-support/attr/acl/run-ptest       |  1 +
 meta/recipes-support/attr/acl_2.3.2.bb        |  4 ++
 6 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-support/attr/acl/0001-test-Unify-the-nfs=
-test-output.patch
 create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.t=
est-Use-the-abosulte-path.patch
 create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.te=
st-Correct-the-check-item.patch
 create mode 100644 meta/recipes-support/attr/acl/0001-tests-fix-getpwnam=
-and-getgrnam.patch

diff --git a/meta/recipes-support/attr/acl/0001-test-Unify-the-nfs-test-o=
utput.patch b/meta/recipes-support/attr/acl/0001-test-Unify-the-nfs-test-=
output.patch
new file mode 100644
index 0000000000..723e6cdca8
--- /dev/null
+++ b/meta/recipes-support/attr/acl/0001-test-Unify-the-nfs-test-output.p=
atch
@@ -0,0 +1,40 @@
+From db81973228be2b143fdba0e3d959c016122bc29e Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 19 Jun 2024 14:05:44 +0800
+Subject: [PATCH] test: Unify the nfs test output
+
+The nfs tests will be put into XPASS/XFAIL category as it defined in
+XFAIL_TESTS target, group all the test only in TESTS target as we prefer
+use PASS/FAIL/SKIP to indicate the result.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ test/Makemodule.am | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/test/Makemodule.am b/test/Makemodule.am
+index cffe732..609953b 100644
+--- a/test/Makemodule.am
++++ b/test/Makemodule.am
+@@ -1,6 +1,3 @@
+-XFAIL_TESTS =3D \
+-	test/nfs/nfsacl.test \
+-	test/nfs/nfs-dir.test
+ TESTS =3D \
+ 	test/cp.test \
+ 	test/getfacl-lfs.test \
+@@ -15,7 +12,8 @@ TESTS =3D \
+ 	test/root/permissions.test \
+ 	test/root/restore.test \
+ 	test/root/setfacl.test \
+-	$(XFAIL_TESTS)
++	test/nfs/nfsacl.test \
++	test/nfs/nfs-dir.test
+=20
+ EXTRA_DIST +=3D \
+ 	test/make-tree \
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use=
-the-abosulte-path.patch b/meta/recipes-support/attr/acl/0001-test-nfs-nf=
s-dir.test-Use-the-abosulte-path.patch
new file mode 100644
index 0000000000..c48ee9f820
--- /dev/null
+++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the-ab=
osulte-path.patch
@@ -0,0 +1,46 @@
+From e87562e4e03450e380bd1ce8e11c561e8f9653d2 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 17 Jun 2024 11:22:21 +0800
+Subject: [PATCH] test/nfs/nfs-dir.test: Use the abosulte path
+
+Use the abosulte path otherwise we won't find the expected file blah.
+
+Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-de=
vel/2024-06/msg00001.html]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ test/nfs/nfs-dir.test | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/test/nfs/nfs-dir.test b/test/nfs/nfs-dir.test
+index 33e5f5f..7216a6e 100644
+--- a/test/nfs/nfs-dir.test
++++ b/test/nfs/nfs-dir.test
+@@ -14,7 +14,7 @@ EXPORT_PATH =3D> the path that is mounted at the worki=
ng directory.
+ 	Make sure the file can be accessed before.
+=20
+ 	$ su bin
+-	$ cat test/blah
++	$ cat %{EXPORT_PATH}/test/blah
+ 	> blah
+=20
+ 	Set up a situation that triggers the bug.
+@@ -36,12 +36,12 @@ EXPORT_PATH =3D> the path that is mounted at the wor=
king directory.
+ 	fail with "Stale NFS file handle" or "Input/output error".
+=20
+ 	$ su bin
+-	$ cat test/blah
++	$ cat %{EXPORT_PATH}/test/blah
+ 	> blah
+ 	$ sleep 3
+-	$ cat test/blah
++	$ cat %{EXPORT_PATH}/test/blah
+ 	> blah
+-	$ cat test/blah
++	$ cat %{EXPORT_PATH}/test/blah
+ 	> blah
+=20
+ 	Clean up.
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Corr=
ect-the-check-item.patch b/meta/recipes-support/attr/acl/0001-test-nfs-nf=
sacl.test-Correct-the-check-item.patch
new file mode 100644
index 0000000000..f990ca4a31
--- /dev/null
+++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-the=
-check-item.patch
@@ -0,0 +1,51 @@
+From dfc6328f02821f9c6703f764ec6f53cf81daaab6 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 17 Jun 2024 11:00:43 +0800
+Subject: [PATCH] test/nfs/nfsacl.test: Correct the check item
+
+The date such as "Jun 13" should take 2 columns, so the expected check
+item "test/sub2" should the column 9.
+ # ls test/sub2 -dl
+drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
+
+Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-de=
vel/2024-06/msg00002.html]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ test/nfs/nfsacl.test | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/test/nfs/nfsacl.test b/test/nfs/nfsacl.test
+index 4f37322..dfcc323 100644
+--- a/test/nfs/nfsacl.test
++++ b/test/nfs/nfsacl.test
+@@ -8,7 +8,7 @@ The test should be run on an NFS export mount with ACL s=
upport.
+ 	$ echo blah > test/sub/blah
+=20
+ 	$ cp -rp test/sub test/sub2
+-	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
++	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
+ 	> drwxr-xr-x test/sub2
+ 	> -rw-r--r-- test/sub2/blah
+=20
+@@ -23,7 +23,7 @@ The test should be run on an NFS export mount with ACL=
 support.
+ 	>
+=20
+ 	$ cp -rp test/sub test/sub2
+-	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
++	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
+ 	> drwxrwxr-x+ test/sub2
+ 	> -rw-r--r-- test/sub2/blah
+=20
+@@ -31,7 +31,7 @@ The test should be run on an NFS export mount with ACL=
 support.
+=20
+ 	$ setfacl -m u:daemon:rw test/sub/blah
+ 	$ cp -rp test/sub test/sub2
+-	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
++	$ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
+ 	> drwxrwxr-x+ test/sub2
+ 	> -rw-rw-r--+ test/sub2/blah
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-ge=
tgrnam.patch b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-=
getgrnam.patch
new file mode 100644
index 0000000000..2fea254fec
--- /dev/null
+++ b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrnam.=
patch
@@ -0,0 +1,67 @@
+From 6398d3fe7a766b4e3cd15bb77fd0f15f7dba52b2 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Luk=3DC3=3DA1=3DC5=3DA1=3D20Zaoral?=3D <lzaoral@redhat=
.com>
+Date: Wed, 19 Jun 2024 11:11:30 +0800
+Subject: [PATCH] tests: fix getpwnam and getgrnam
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The calls to these functions would always fail because the size of the b=
uffer
+was smaller than the minimum (170000) specified in the test implementati=
ons
+of getgrnam_r and getpwnam_r.  Use test_get*_match directly because getp=
wnam
+and getgrnam should never fail on ERANGE.
+
+This commit fixes the following failure in the test/root/restore.test te=
st:
+
+[21] $ chown bin passwd -- failed
+chown: invalid user: =E2=80=98bin=E2=80=99        !=3D ~
+
+Fixes: 3737f000d3f17cd283f51eeacac21a71a3472053 ("use thread-safe getpwn=
am_r
+and getgrnam_r")
+
+Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl-de=
vel/2024-06/msg00000.html]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ test/test_group.c  | 2 +-
+ test/test_passwd.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/test/test_group.c b/test/test_group.c
+index 96dd612..42d6b07 100644
+--- a/test/test_group.c
++++ b/test/test_group.c
+@@ -136,7 +136,7 @@ struct group *getgrnam(const char *name)
+ 	static struct group grp;
+ 	struct group *result;
+=20
+-	(void) getgrnam_r(name, &grp, buf, sizeof(buf), &result);
++	(void) test_getgr_match(&grp, buf, sizeof buf, &result, match_name, na=
me);
+ 	return result;
+ }
+=20
+diff --git a/test/test_passwd.c b/test/test_passwd.c
+index 9428bf8..97f2673 100644
+--- a/test/test_passwd.c
++++ b/test/test_passwd.c
+@@ -119,7 +119,7 @@ int getpwnam_r(const char *name, struct passwd *pwd,=
 char *buf, size_t buflen,
+ 		*result =3D NULL;
+ 		return ERANGE;
+ 	}
+-	last_buflen =3D- 1;
++	last_buflen =3D -1;
+=20
+ 	return test_getpw_match(pwd, buf, buflen, result, match_name, name);
+ }
+@@ -131,7 +131,7 @@ struct passwd *getpwnam(const char *name)
+ 	static struct passwd pwd;
+ 	struct passwd *result;
+=20
+-	(void) getpwnam_r(name, &pwd, buf, sizeof(buf), &result);
++	(void) test_getpw_match(&pwd, buf, sizeof(buf), &result, match_name, n=
ame);
+ 	return result;
+ }
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-suppo=
rt/attr/acl/run-ptest
index 3af75c84fe..7d88cc8484 100644
--- a/meta/recipes-support/attr/acl/run-ptest
+++ b/meta/recipes-support/attr/acl/run-ptest
@@ -6,6 +6,7 @@
=20
 mkdir -p /tmp/acl-ptest/test
 cp test/test.* /tmp/acl-ptest/test
+export EXPORT_PATH=3D"/tmp/acl-ptest/test"
=20
 set +e
 make test-suite.log
diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-suppor=
t/attr/acl_2.3.2.bb
index 6178473873..536ad27de7 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.3.2.bb
@@ -19,6 +19,10 @@ SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
            file://run-ptest \
            file://0001-tests-do-not-hardcode-the-build-path-into-a-helpe=
r-l.patch \
            file://0001-test-patch-out-failing-bits.patch \
+           file://0001-test-nfs-nfsacl.test-Correct-the-check-item.patch=
 \
+           file://0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.patch=
 \
+           file://0001-tests-fix-getpwnam-and-getgrnam.patch \
+           file://0001-test-Unify-the-nfs-test-output.patch \
            "
=20
 SRC_URI[sha256sum] =3D "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73de520=
5bac0bf6058a2f7c"
--=20
2.34.1


