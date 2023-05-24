Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FDAC77B7C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 06:56:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3016.1684911375590884940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 23:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=ow6xsz71;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=45082ad12b=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34O5mlJe013317
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 06:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=wOgg0Kh2d6O2fFcJnnetQOOvTKwkEQ7Eq/i2/eauONs=;
 b=ow6xsz71BUp9H4DZEdgEZ0Sn8Nca4Vr5j2lI7wXf0n2QJhF2KzERzV8GIleqrIHrFDwU
 Bje2oGVtSoUv2A1aBYYmJVZJAWzByCRue5STm4XC+cpJPg5Tu+bw7LbPIq3WoBTZ0MRU
 3jx+GHnLGMpRSrLMQJoIauObe+ayqCBS47mTbGaT7telv/v88vu+NpJbXC9kUW6J767L
 8a3VDbY2cU/Ahffn+YVMem819J80FI1xOmsQHuZ5YC/PqVrtLIXvPVakxnKNlIp2AbvE
 5oDYp7+laYg/BjgRuIu0kG3agZqwaCIK3YbERIuQQVrahk6ryqcQO2MAxnXSGkBOCkIi Jw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpn67kmgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 06:56:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0nwIyKk+mVyVx9kyBIkg8iMGY0Ts2WSebIixH8lbWEZyUSDB3f+p97bInjkBL1bgMDOEzD4pvaxlAOBIxYOQnTnOTUF41ocBVg1p3Tbu619EiCbfiCw+cBh6kE9XAeVwy4nyu6mB9SRADI2Ij56xo/Hu5gGAW8JleuQvpH/K7dJMt3UjJhfSOCtegHO1IUOoYjKswk06ycCnloF+TR5B07mDm/YBV/ZHf48FgzXqIdbqSnSmP9W8xoBnumG2zRJ2KMrK+iEVyK5Qm7t1VrQM0zgT3YWq8GpClatMj3uKCeuHX/8bC8KjZAZAr9x+ezjIlCdmpFmhjBV0PLYHZ5H0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOgg0Kh2d6O2fFcJnnetQOOvTKwkEQ7Eq/i2/eauONs=;
 b=ZXP5OTjk3DLjjmcIQlDayBXUMcp3vpx8PT3AyJZSutRmkjHgXLGTKG8GBXV+f78tCBh3U+G4Xa+nnLrp6hL4y//nIhtpcaMOJSJYgxckWoiX4kVUomedGaRGusZTUWT7lIBKRKwO7EDWXwqyliLFmsqFcyIUyTXyvx1E+hi8zw/u1yDmaBhZJ69d7Hw5YlTXH0prqMBeYOLvX38lPbzL6dSu0GuF1IP+/KgLsKO3q7zI4+lwZBh9pfZu+4UxBXARk2EKtqC44967f6+KNb2QXl8P7UT45lvTYgae9AX0yYEnLWK42PlDYazEAHeB9xy8VQ/UzfmKHY/HVD2Pvmgiug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 PH7PR11MB6548.namprd11.prod.outlook.com (2603:10b6:510:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 06:56:09 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::61aa:b66e:fce4:b592]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::61aa:b66e:fce4:b592%5]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 06:56:08 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] go: update 1.20.1 -> 1.20.4
Date: Wed, 24 May 2023 02:55:48 -0400
Message-Id: <20230524065548.3044226-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: MN2PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:208:236::26) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|PH7PR11MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a0ca31-2c31-4dd8-e6d6-08db5c23f38b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9SAG7bVeWX8awCIUJAs/1YQfBDu68GezWXN4bMzp1Yra+iPJ3dEDloHlwE9/0gBj7j4iHEkxulmHjB6/o5xPz0/SmH0ZdLFk2oqeM7vnuEN867ZKU7UgUBxQCKv5zw6QiTI1q/UXnlP63dVJ0fq56/bpH/1Z97vkz2s7l5AwGIVx6fsilv/SzA4dSfD0JuMrcMNFvLBdB+B4x3qMpWE4LYavPzmYS6n0h4iPGtC3FpHFTf9zcepx1QKE4mdz60BsEU+bRHPKG6T6lAQ+QxEhcgjfZfSI//W2B2gU4CY7tjbPV0LzJylokl/ky3Nnk9OEB3PmMoSW2j+lWEQvLdBSscc5DE5zpnYpbrSYnwYPp8AOE+gLa19PaJWx/mn4vPXr4VIYNrJsNlTv3sFJOZf4o/VoYmH4R+4WH6mHbA/VKgYYYOhIYI6zIXwq1JCAyZeoV/xyR3KxShIkxU/CQBvdXKVwfLtE7xnYJDZeFT1nZANxGrgs5/B1wElQhg+d3TklzGwiF0gS6gKIgx3/7RK+Rq1reJzThtbdSMYGMheVhwDE3OnBwMAynwYEN5TFRZydL6ecHpkrbmG/6pPom5tCf2zWJP7PhzgLwpwVCrAWxn2oFF4lXhcg8MUbX4uUyc4uELYsRQpRoAsoHNq3/OQXJA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(376002)(39850400004)(396003)(136003)(451199021)(38350700002)(41300700001)(38100700002)(6486002)(52116002)(316002)(84970400001)(66476007)(66556008)(6916009)(6666004)(66946007)(966005)(8936002)(8676002)(86362001)(19627235002)(478600001)(5660300002)(44832011)(83380400001)(1076003)(26005)(6512007)(6506007)(2906002)(186003)(30864003)(36756003)(15650500001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dFd0OFk0VWt5d2dkSmJJTHk2c0s1Tm93Z29aaGREU01KNDh4QkpoTllrSjJl?=
 =?utf-8?B?YnZjcWpZYjBCTFEvbTZFKzZFaitpSTVWaC92Q1ZkTUlDOUZkbjJPd2VsWHF4?=
 =?utf-8?B?NER4Y3dSTml3dDBDL3U1L3A3Qmh6RTlqY0dmTm5tMkpsWXBBMU82U25aQmRa?=
 =?utf-8?B?Z25vQVFBMTE4Q0hTenROUlV2czBpMnhObXQ3SHJCMWRIVVIrdHA4NCsxTis4?=
 =?utf-8?B?aW5veDROWVFONDd2K0hPc1E3OTdjcnFHTjhISmswVUkrYndTazdmTWRYNXo5?=
 =?utf-8?B?UTREWERPQ0Z4S1V0UEtzSnMzYVhvVFpXWDQ4S1dvZTJyRzFmWlRpYmtkbC9m?=
 =?utf-8?B?TXNPZW9LWWN6elVIRDRGdmZGMTVMeHRqTDUwaU56WDJnZnMramY1MWNUNHhF?=
 =?utf-8?B?REdIS1VFVTdEZjRvZDBSSU1uUXhMSjVOcUo3aFdlQThaY2RPOXdybGNCVmJZ?=
 =?utf-8?B?alVGR0RZOU1TaEV1SUt2M0tGUjJLbDRLVG1mY2JiYzI4S3FTaGNpR2hUaTBS?=
 =?utf-8?B?MEFmNEJUOWJsVnJFdG1LY0VabWxlSzA0YUtjSzRMUjRSN0p4NmwranZjV0tW?=
 =?utf-8?B?bUZ5ZDNadXBjOEhMcEdmelcvZGVVU2t2Q2ozS1hJQ3RhaVhwM29CRzZIdktY?=
 =?utf-8?B?cjIvUnR2VkpPTzNOMjRKRllvTnFBblFFWXNqS1ZVT1FjRTRZWUFydlU5d3M4?=
 =?utf-8?B?TW1GY3FENmx0U1VhT29Da2R6YXJ2aThVQXp0aFExUGdYWStpYlRnQ2lvUFJz?=
 =?utf-8?B?UTUzTmhmQVRRTjNzQk5mNU82N3p5RVY0dytnaENDYmNUU296VjZ4MUpzNnRa?=
 =?utf-8?B?VFhxdmpsWTFLcC9sN3F2UWhRQUpnQm1QYUJseW9hSXNIckNaZDV5cE53aksx?=
 =?utf-8?B?UzlqZml2OVpOTkw5V2s4bVJuUzUxUHdxOTRyQVNmOWdPWEgyaks1ckE1dVd6?=
 =?utf-8?B?ekpRRTJqMHI4Z1dyREc5ZVFpUzJLb2kzS1VManMzaENYT0V2VVAvWW9lVGJY?=
 =?utf-8?B?OHJSaHFBOFM3RkJxUjBNSWVjeWFZN1VPWU5vZ3gxSFFGVGlpS0kzbzRJdVFK?=
 =?utf-8?B?N280aUtRbElSdzBjdTk0K0owcmRZeXFGc3cwTVBoZ2M0Nk1TVjJFQVFEN3ZC?=
 =?utf-8?B?NlRnQzJlem9MWnNldzRIZTBFbjl1MHhLNy9UZnNYOTYzZk11eFowMXVjcXgv?=
 =?utf-8?B?cnJXbUxNd3g1U2lWd0FLa2s1SjZuNVFhMkIwTUNXT05GZGZXNnJwR3EyK2JR?=
 =?utf-8?B?aGQyRVVVYzNlV3RXOXpPN1N3M2JwejkvS3FJTDNMSGVCSHdKZXNmSjAxYWtO?=
 =?utf-8?B?UGNVRDF5ZWRTR09JVGF1OGJpeUVyR1FSQitSSS9aTlBVQWlybzZnM09RQ05J?=
 =?utf-8?B?UW04VXRjb0JlenFsSWNMZ1VVK2hIZnNpelEveUJES3ZIL2lobGtDZDk3aERV?=
 =?utf-8?B?emw3UkI1SlZYMWdqUXVEeXJyMVpkUzZhTDNxeCs3dEs3M0N5NEhINGlXVnpw?=
 =?utf-8?B?S0NtcXpUVTY5eDcwSEp4eWtYWjB2eGhMWDJMaTNWTGFCR0xuaWF6WnBpWkd0?=
 =?utf-8?B?ZjVSUHRnWVhpZWVBdVNLUzZDYzlEYVRYRDRiQ29tR1dWRmNkdUNDem1ucE1D?=
 =?utf-8?B?SUtDcWx0OHRuY0hkd3hHQmF2dnB0M2VhSndJWE1zbzBSUzFWd2VMNXo5TnZt?=
 =?utf-8?B?N0QzbVFvVzF2Kys2RVBIRnBHVDJoM3hubEFjVU9TeFJjcnlNNHdEaEovMWx4?=
 =?utf-8?B?YlMxQzRtS25BRTFYdDVUQnJwb2JXRDNpaDB5aFNkS1hzdkxzMmVzQlYyNHNQ?=
 =?utf-8?B?enBzYWZtYXBsNExJSXYrRzlnbDNjNDRlSUkxRzVzK203eGg0VnFROGhFZ2xl?=
 =?utf-8?B?ejlVSWZXYjBjemNYRkQ0U2tEK0YxS1ppQzVKNy9TQWpTRjcwVUpjcHN3R0Ex?=
 =?utf-8?B?a2FQY2R5K1RnVTlnTnRNdmNqd3VFZmRGaXgwYkozQ2Q2Vk5pMVI2OW03OHZG?=
 =?utf-8?B?ZE5haTRlOEZKd1RLYndpZjhDN1Y1dE1qUWg5WllqYjlvUFk3b1JJandxUElO?=
 =?utf-8?B?U2ErYnRUUEgyMHMvSlovMHNwRTdSOEZSRHVBRHlhWEhHT3RVUHE5a3g2VmNG?=
 =?utf-8?B?UWZoZTZqaUt6eGxOT2MxRVpYaFd4dTdkaVZUMkpFSVpMTDRKeWxId2p3NjdS?=
 =?utf-8?B?Rnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a0ca31-2c31-4dd8-e6d6-08db5c23f38b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 06:56:08.5374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cd6S1xcaXruuzlQroCHTigN0yOVOHhcTUKM0zdDqmRAZsA1iu1J/8p2zHQUG13sVhX5meJj34lmugjTds7Qv/oTwvFNriBBD3GkjN/ZtKm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6548
X-Proofpoint-GUID: 0P5IiOBLfLcy7U6T0_idXdIV1t9grf5J
X-Proofpoint-ORIG-GUID: 0P5IiOBLfLcy7U6T0_idXdIV1t9grf5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_02,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240059
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34O5mlJe013317
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 06:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181660

Update go to latest 1.20.x release.

Removed patches contained in new version:
  - 0010-cmd-compile-re-compile-instantiated-generic-methods-.patch
  - CVE-2023-24532.patch
  - CVE-2023-24537.patch

go.git$ git log --oneline go1.20.1..go1.20.4
324c3ace2d (tag: go1.20.4) [release-branch.go1.20] go1.20.4
337dd75343 [release-branch.go1.20] html/template: emit filterFailsafe for=
 empty unquoted attr value
4a28cad666 [release-branch.go1.20] html/template: handle all JS whitespac=
e characters
090590fdcc [release-branch.go1.20] html/template: disallow angle brackets=
 in CSS values
25b4f40625 [release-branch.go1.20] Revert "net/http: FileServer method ch=
eck + minimal OPTIONS implementation"
484535e67b cmd/compile/internal/importer,go/internal/gcimporter: use the =
'go' command from build.Default.GOROOT in lookupGorootExport
813a811d33 [release-branch.go1.20] crypto/tls: fix PSK binder calculation
ee42d468f5 [release-branch.go1.20] cmd/compile: fix reproducible build of=
 aliased generic types
446493f5b8 [release-branch.go1.20] cmd/compile: remove broken LEA "optimi=
zation"
0684cecad5 [release-branch.go1.20] cmd/compile: use correct type for byte=
swaps on multi-byte stores
ecf7e00db8 [release-branch.go1.20] syscall: restore original NOFILE rlimi=
t in child process
1dbbac7d79 [release-branch.go1.20] cmd/compile: fix ir.StaticValue for OR=
ANGE
99001c460e [release-branch.go1.20] cmd/compile: don't set range expr key/=
value type if already set
dcc9bdf380 [release-branch.go1.20] crypto/subtle: don't cast to *uintptr =
when word size is 0
5c7c20e262 [release-branch.go1.20] html/template,mime/multipart: document=
 new GODEBUG settings
7c47a6b157 (tag: go1.20.3) [release-branch.go1.20] go1.20.3
20374d1d75 [release-branch.go1.20] html/template: disallow actions in JS =
template literals
e7c4b07ecf [release-branch.go1.20] go/scanner: reject large line and colu=
mn numbers in //line directives
bf8c7c575c [release-branch.go1.20] mime/multipart: limit parsed mime mess=
age sizes
ec18f62df5 [release-branch.go1.20] net/textproto, mime/multipart: improve=
 accounting of non-file data
ea6b5a64dd [release-branch.go1.20] mime/multipart: avoid excessive copy b=
uffer allocations in ReadForm
3991f6c41c [release-branch.go1.20] net/textproto: avoid overpredicting th=
e number of MIME header keys
9a164d1c41 [release-branch.go1.20] cmd/internal/obj/ppc64: fix incorrect =
base reg causing segv
8dce4ca8df [release-branch.go1.20] cmd/compile: don't assume pointer of a=
 slice is non-nil
94c02a3cc4 [release-branch.go1.20] cmd/compile: re-compile instantiated g=
eneric methods in linkshared mode
65fa8a6931 [release-branch.go1.20] time: fix timezone lookup logic for no=
n-DST zones
b52a6963bf [release-branch.go1.20] cmd/link/internal/arm: fix off-by-1 in=
 trampoline reachability computation
3ff6dbdf5b [release-branch.go1.20] cmd/go,cmd/link: prefer external linki=
ng when strange cgo flags seen
fa42da156a [release-branch.go1.20] cmd/link: use label symbols for Duff's=
 devices on darwin/arm64
5c7cc468a8 [release-branch.go1.20] Revert "cmd/compile: enable address fo=
lding for global symbols of shared library"
b852f39511 [release-branch.go1.20] cmd/go: avoid running slow tests on no=
n-longtest builders
4df95d5145 [release-branch.go1.20] internal/testpty: fix error handling
aee9a19c55 (tag: go1.20.2) [release-branch.go1.20] go1.20.2
26eeaec89c [release-branch.go1.20] cmd/compile: relax overly strict asser=
tion
9629fa1874 [release-branch.go1.20] crypto/x509: fix broken tests
3243f93747 [release-branch.go1.20] crypto/x509: fix system root tests + d=
arwin intermediate handling
d2d0ee2049 [release-branch.go1.20] syscall: fix invalid unsafe.Pointer co=
nversion on Windows
230765a11a [release-branch.go1.20] net: delete TestTCPSelfConnect
bdd86bda09 [release-branch.go1.20] crypto/x509: fix ParsePKCS8PrivateKey =
comment
aef8a8cd42 [release-branch.go1.20] syscall: Faccessat: check for CAP_DAC_=
OVERRIDE on Linux
ef793801f8 [release-branch.go1.20] crypto/internal/bigmod: flag amd64 ass=
embly as noescape
aaace6dda7 [release-branch.go1.20] crypto/ecdh: explicitly reject mismatc=
hed curves in ECDH
0f4483cfdc [release-branch.go1.20] cmd/compile/internal/noder: correct po=
sitions for synthetic closures
1362737f50 [release-branch.go1.20] cmd/link: better fix for arm32 trampge=
n problem with duff routines
602eeaab38 [release-branch.go1.20] crypto/internal/nistec: reduce P-256 s=
calar
ac556f35a2 [release-branch.go1.20] cmd/internal/cov: fix misuse of bufio.=
Reader.Read in read helper
1acd39cc92 [release-branch.go1.20] Revert "internal/poll: drop redundant =
ENOSYS in CopyFileRange"
7b398b1ff7 [release-branch.go1.20] runtime: check for overflow in sweep a=
ssist
2d01f3695b [release-branch.go1.20] cmd/compile: fix wrong escape analysis=
 for go/defer generic calls
965e9ba0fb [release-branch.go1.20] cmd/compile: disable inline static ini=
t optimization
85ded85b78 [release-branch.go1.20] runtime: fix signature for linked func=
tions
828b05cc64 [release-branch.go1.20] all: update vendored golang.org/x/net

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../go/{go-1.20.1.inc =3D> go-1.20.4.inc}       |   5 +-
 ...e_1.20.1.bb =3D> go-binary-native_1.20.4.bb} |   6 +-
 ..._1.20.1.bb =3D> go-cross-canadian_1.20.4.bb} |   0
 ...{go-cross_1.20.1.bb =3D> go-cross_1.20.4.bb} |   0
 ...osssdk_1.20.1.bb =3D> go-crosssdk_1.20.4.bb} |   0
 ...o-native_1.20.1.bb =3D> go-native_1.20.4.bb} |   0
 ...runtime_1.20.1.bb =3D> go-runtime_1.20.4.bb} |   0
 ...ompile-instantiated-generic-methods-.patch |  90 --------
 .../go/go/CVE-2023-24532.patch                | 208 ------------------
 .../go/go/CVE-2023-24537.patch                |  89 --------
 .../go/{go_1.20.1.bb =3D> go_1.20.4.bb}         |   0
 11 files changed, 4 insertions(+), 394 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.1.inc =3D> go-1.20.4.inc} (77%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.1.bb =3D> go-bina=
ry-native_1.20.4.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.1.bb =3D> go-cro=
ss-canadian_1.20.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.1.bb =3D> go-cross_1.20.4=
.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.1.bb =3D> go-crosssdk_=
1.20.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.1.bb =3D> go-native_1.20=
.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.1.bb =3D> go-runtime_1.=
20.4.bb} (100%)
 delete mode 100644 meta/recipes-devtools/go/go/0010-cmd-compile-re-compi=
le-instantiated-generic-methods-.patch
 delete mode 100644 meta/recipes-devtools/go/go/CVE-2023-24532.patch
 delete mode 100644 meta/recipes-devtools/go/go/CVE-2023-24537.patch
 rename meta/recipes-devtools/go/{go_1.20.1.bb =3D> go_1.20.4.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.1.inc b/meta/recipes-devtoo=
ls/go/go-1.20.4.inc
similarity index 77%
rename from meta/recipes-devtools/go/go-1.20.1.inc
rename to meta/recipes-devtools/go/go-1.20.4.inc
index 179f0e29eb..05bc168e0c 100644
--- a/meta/recipes-devtools/go/go-1.20.1.inc
+++ b/meta/recipes-devtools/go/go-1.20.4.inc
@@ -14,8 +14,5 @@ SRC_URI +=3D "\
     file://0007-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.pat=
ch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
-    file://0010-cmd-compile-re-compile-instantiated-generic-methods-.pat=
ch \
-    file://CVE-2023-24532.patch \
-    file://CVE-2023-24537.patch \
 "
-SRC_URI[main.sha256sum] =3D "b5c1a3af52c385a6d1c76aed5361cf26459023980d0=
320de7658bae3915831a2"
+SRC_URI[main.sha256sum] =3D "9f34ace128764b7a3a4b238b805856cc1b2184304df=
9e5690825b0710f4202d6"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.1.bb b/meta/r=
ecipes-devtools/go/go-binary-native_1.20.4.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.1.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.4.bb
index 239334552a..87ce8a558f 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.1.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.4.bb
@@ -9,9 +9,9 @@ PROVIDES =3D "go-native"
=20
 # Checksums available at https://go.dev/dl/
 SRC_URI =3D "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOAR=
CH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] =3D "000a5b1fca4f75895f78befeb2eecf10b=
fff3c428597f3f1e69133b63b911b02"
-SRC_URI[go_linux_arm64.sha256sum] =3D "5e5e2926733595e6f3c5b5ad1089afac1=
1c1490351855e87849d0e7702b1ec2e"
-SRC_URI[go_linux_ppc64le.sha256sum] =3D "85cfd4b89b48c94030783b6e9e619e3=
5557862358b846064636361421d0b0c52"
+SRC_URI[go_linux_amd64.sha256sum] =3D "698ef3243972a51ddb4028e4a1ac63dc6=
d60821bf18e59a807e051fee0a385bd"
+SRC_URI[go_linux_arm64.sha256sum] =3D "105889992ee4b1d40c7c108555222ca70=
ae43fccb42e20fbf1eebb822f5e72c6"
+SRC_URI[go_linux_ppc64le.sha256sum] =3D "8c6f44b96c2719c90eebabe2dd866f9=
c39538648f7897a212cac448587e9a408"
=20
 UPSTREAM_CHECK_URI =3D "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.1.bb b/meta/=
recipes-devtools/go/go-cross-canadian_1.20.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.1.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.4.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.1.bb b/meta/recipes-d=
evtools/go/go-cross_1.20.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.1.bb
rename to meta/recipes-devtools/go/go-cross_1.20.4.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.1.bb b/meta/recipe=
s-devtools/go/go-crosssdk_1.20.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.1.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.4.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.1.bb b/meta/recipes-=
devtools/go/go-native_1.20.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.1.bb
rename to meta/recipes-devtools/go/go-native_1.20.4.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.1.bb b/meta/recipes=
-devtools/go/go-runtime_1.20.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.1.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.4.bb
diff --git a/meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-inst=
antiated-generic-methods-.patch b/meta/recipes-devtools/go/go/0010-cmd-co=
mpile-re-compile-instantiated-generic-methods-.patch
deleted file mode 100644
index f9ac202421..0000000000
--- a/meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instantiate=
d-generic-methods-.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 7a3bb16b43efba73674629eae4369f9004e37f22 Mon Sep 17 00:00:00 2001
-From: Cuong Manh Le <cuong.manhle.vn@gmail.com>
-Date: Sat, 18 Mar 2023 00:53:07 +0700
-Subject: [PATCH] cmd/compile: re-compile instantiated generic methods in
- linkshared mode
-
-For G[T] that was seen and compiled in imported package, it is not added
-to typecheck.Target.Decls, prevent wasting compile time re-creating
-DUPOKS symbols. However, the linker do not support a type symbol
-referencing a method symbol across DSO boundary. That causes unreachable
-sym error when building under -linkshared mode.
-
-To fix it, always re-compile generic methods in linkshared mode.
-
-Fixes #58966
-
-Change-Id: I894b417cfe8234ae1fe809cc975889345df22cef
-Reviewed-on: https://go-review.googlesource.com/c/go/+/477375
-Run-TryBot: Cuong Manh Le <cuong.manhle.vn@gmail.com>
-Reviewed-by: Cherry Mui <cherryyz@google.com>
-Reviewed-by: Matthew Dempsky <mdempsky@google.com>
-TryBot-Result: Gopher Robot <gobot@golang.org>
-
-Upstream-Status: Backport [https://github.com/golang/go/commit/bcd82125f=
85c7c552493e863fa1bb14e6c444557]
-
-Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
----
- misc/cgo/testshared/shared_test.go              |  7 ++++++-
- misc/cgo/testshared/testdata/issue58966/main.go | 15 +++++++++++++++
- src/cmd/compile/internal/noder/unified.go       |  6 +++++-
- 3 files changed, 26 insertions(+), 2 deletions(-)
- create mode 100644 misc/cgo/testshared/testdata/issue58966/main.go
-
-diff --git a/misc/cgo/testshared/shared_test.go b/misc/cgo/testshared/sh=
ared_test.go
-index b14fb1cb3a..03da8f9435 100644
---- a/misc/cgo/testshared/shared_test.go
-+++ b/misc/cgo/testshared/shared_test.go
-@@ -1112,8 +1112,13 @@ func TestStd(t *testing.T) {
- 		t.Skip("skip in short mode")
- 	}
- 	t.Parallel()
-+	tmpDir :=3D t.TempDir()
- 	// Use a temporary pkgdir to not interfere with other tests, and not w=
rite to GOROOT.
- 	// Cannot use goCmd as it runs with cloned GOROOT which is incomplete.
- 	runWithEnv(t, "building std", []string{"GOROOT=3D" + oldGOROOT},
--		filepath.Join(oldGOROOT, "bin", "go"), "install", "-buildmode=3Dshare=
d", "-pkgdir=3D"+t.TempDir(), "std")
-+		filepath.Join(oldGOROOT, "bin", "go"), "install", "-buildmode=3Dshare=
d", "-pkgdir=3D"+tmpDir, "std")
-+
-+	// Issue #58966.
-+	runWithEnv(t, "testing issue #58966", []string{"GOROOT=3D" + oldGOROOT=
},
-+		filepath.Join(oldGOROOT, "bin", "go"), "run", "-linkshared", "-pkgdir=
=3D"+tmpDir, "./issue58966/main.go")
- }
-diff --git a/misc/cgo/testshared/testdata/issue58966/main.go b/misc/cgo/=
testshared/testdata/issue58966/main.go
-new file mode 100644
-index 0000000000..2d923c3607
---- /dev/null
-+++ b/misc/cgo/testshared/testdata/issue58966/main.go
-@@ -0,0 +1,15 @@
-+// Copyright 2023 The Go Authors. All rights reserved.
-+// Use of this source code is governed by a BSD-style
-+// license that can be found in the LICENSE file.
-+
-+package main
-+
-+import "crypto/elliptic"
-+
-+var curve elliptic.Curve
-+
-+func main() {
-+	switch curve {
-+	case elliptic.P224():
-+	}
-+}
-diff --git a/src/cmd/compile/internal/noder/unified.go b/src/cmd/compile=
/internal/noder/unified.go
-index ed97a09302..25136e6aad 100644
---- a/src/cmd/compile/internal/noder/unified.go
-+++ b/src/cmd/compile/internal/noder/unified.go
-@@ -158,7 +158,11 @@ func readBodies(target *ir.Package, duringInlining =
bool) {
- 			// Instantiated generic function: add to Decls for typechecking
- 			// and compilation.
- 			if fn.OClosure =3D=3D nil && len(pri.dict.targs) !=3D 0 {
--				if duringInlining {
-+				// cmd/link does not support a type symbol referencing a method sym=
bol
-+				// across DSO boundary, so force re-compiling methods on a generic =
type
-+				// even it was seen from imported package in linkshared mode, see #=
58966.
-+				canSkipNonGenericMethod :=3D !(base.Ctxt.Flag_linkshared && ir.IsMe=
thod(fn))
-+				if duringInlining && canSkipNonGenericMethod {
- 					inlDecls =3D append(inlDecls, fn)
- 				} else {
- 					target.Decls =3D append(target.Decls, fn)
diff --git a/meta/recipes-devtools/go/go/CVE-2023-24532.patch b/meta/reci=
pes-devtools/go/go/CVE-2023-24532.patch
deleted file mode 100644
index 22f080dbd4..0000000000
--- a/meta/recipes-devtools/go/go/CVE-2023-24532.patch
+++ /dev/null
@@ -1,208 +0,0 @@
-From 602eeaab387f24a4b28c5eccbb50fa934f3bc3c4 Mon Sep 17 00:00:00 2001
-From: Filippo Valsorda <filippo@golang.org>
-Date: Mon, 13 Feb 2023 15:16:27 +0100
-Subject: [PATCH] [release-branch.go1.20] crypto/internal/nistec: reduce =
P-256
- scalar
-
-Unlike the rest of nistec, the P-256 assembly doesn't use complete
-addition formulas, meaning that p256PointAdd[Affine]Asm won't return the
-correct value if the two inputs are equal.
-
-This was (undocumentedly) ignored in the scalar multiplication loops
-because as long as the input point is not the identity and the scalar is
-lower than the order of the group, the addition inputs can't be the same.
-
-As part of the math/big rewrite, we went however from always reducing
-the scalar to only checking its length, under the incorrect assumption
-that the scalar multiplication loop didn't require reduction.
-
-Added a reduction, and while at it added it in P256OrdInverse, too, to
-enforce a universal reduction invariant on p256OrdElement values.
-
-Note that if the input point is the infinity, the code currently still
-relies on undefined behavior, but that's easily tested to behave
-acceptably, and will be addressed in a future CL.
-
-Updates #58647
-Fixes #58720
-Fixes CVE-2023-24532
-
-(Filed with the "safe APIs like complete addition formulas are good" dep=
t.)
-
-Change-Id: I7b2c75238440e6852be2710fad66ff1fdc4e2b24
-Reviewed-on: https://go-review.googlesource.com/c/go/+/471255
-TryBot-Result: Gopher Robot <gobot@golang.org>
-Reviewed-by: Roland Shoemaker <roland@golang.org>
-Run-TryBot: Filippo Valsorda <filippo@golang.org>
-Auto-Submit: Filippo Valsorda <filippo@golang.org>
-Reviewed-by: Damien Neil <dneil@google.com>
-(cherry picked from commit 203e59ad41bd288e1d92b6f617c2f55e70d3c8e3)
-Reviewed-on: https://go-review.googlesource.com/c/go/+/471695
-Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
-Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
-Reviewed-by: Filippo Valsorda <filippo@golang.org>
-Run-TryBot: Roland Shoemaker <roland@golang.org>
-
-CVE: CVE-2023-24532
-Upstream-Status: Backport [602eeaab387f24a4b28c5eccbb50fa934f3bc3c4]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
----
- src/crypto/internal/nistec/nistec_test.go | 81 +++++++++++++++++++++++
- src/crypto/internal/nistec/p256_asm.go    | 17 +++++
- src/crypto/internal/nistec/p256_ordinv.go |  1 +
- 3 files changed, 99 insertions(+)
-
-diff --git a/src/crypto/internal/nistec/nistec_test.go b/src/crypto/inte=
rnal/nistec/nistec_test.go
-index 309f68be16a9f..9103608c18a0f 100644
---- a/src/crypto/internal/nistec/nistec_test.go
-+++ b/src/crypto/internal/nistec/nistec_test.go
-@@ -8,6 +8,7 @@ import (
- 	"bytes"
- 	"crypto/elliptic"
- 	"crypto/internal/nistec"
-+	"fmt"
- 	"internal/testenv"
- 	"math/big"
- 	"math/rand"
-@@ -165,6 +166,86 @@ func testEquivalents[P nistPoint[P]](t *testing.T, =
newPoint func() P, c elliptic
- 	}
- }
-=20
-+func TestScalarMult(t *testing.T) {
-+	t.Run("P224", func(t *testing.T) {
-+		testScalarMult(t, nistec.NewP224Point, elliptic.P224())
-+	})
-+	t.Run("P256", func(t *testing.T) {
-+		testScalarMult(t, nistec.NewP256Point, elliptic.P256())
-+	})
-+	t.Run("P384", func(t *testing.T) {
-+		testScalarMult(t, nistec.NewP384Point, elliptic.P384())
-+	})
-+	t.Run("P521", func(t *testing.T) {
-+		testScalarMult(t, nistec.NewP521Point, elliptic.P521())
-+	})
-+}
-+
-+func testScalarMult[P nistPoint[P]](t *testing.T, newPoint func() P, c =
elliptic.Curve) {
-+	G :=3D newPoint().SetGenerator()
-+	checkScalar :=3D func(t *testing.T, scalar []byte) {
-+		p1, err :=3D newPoint().ScalarBaseMult(scalar)
-+		fatalIfErr(t, err)
-+		p2, err :=3D newPoint().ScalarMult(G, scalar)
-+		fatalIfErr(t, err)
-+		if !bytes.Equal(p1.Bytes(), p2.Bytes()) {
-+			t.Error("[k]G !=3D ScalarBaseMult(k)")
-+		}
-+
-+		d :=3D new(big.Int).SetBytes(scalar)
-+		d.Sub(c.Params().N, d)
-+		d.Mod(d, c.Params().N)
-+		g1, err :=3D newPoint().ScalarBaseMult(d.FillBytes(make([]byte, len(s=
calar))))
-+		fatalIfErr(t, err)
-+		g1.Add(g1, p1)
-+		if !bytes.Equal(g1.Bytes(), newPoint().Bytes()) {
-+			t.Error("[N - k]G + [k]G !=3D =E2=88=9E")
-+		}
-+	}
-+
-+	byteLen :=3D len(c.Params().N.Bytes())
-+	bitLen :=3D c.Params().N.BitLen()
-+	t.Run("0", func(t *testing.T) { checkScalar(t, make([]byte, byteLen)) =
})
-+	t.Run("1", func(t *testing.T) {
-+		checkScalar(t, big.NewInt(1).FillBytes(make([]byte, byteLen)))
-+	})
-+	t.Run("N-1", func(t *testing.T) {
-+		checkScalar(t, new(big.Int).Sub(c.Params().N, big.NewInt(1)).Bytes())
-+	})
-+	t.Run("N", func(t *testing.T) { checkScalar(t, c.Params().N.Bytes()) }=
)
-+	t.Run("N+1", func(t *testing.T) {
-+		checkScalar(t, new(big.Int).Add(c.Params().N, big.NewInt(1)).Bytes())
-+	})
-+	t.Run("all1s", func(t *testing.T) {
-+		s :=3D new(big.Int).Lsh(big.NewInt(1), uint(bitLen))
-+		s.Sub(s, big.NewInt(1))
-+		checkScalar(t, s.Bytes())
-+	})
-+	if testing.Short() {
-+		return
-+	}
-+	for i :=3D 0; i < bitLen; i++ {
-+		t.Run(fmt.Sprintf("1<<%d", i), func(t *testing.T) {
-+			s :=3D new(big.Int).Lsh(big.NewInt(1), uint(i))
-+			checkScalar(t, s.FillBytes(make([]byte, byteLen)))
-+		})
-+	}
-+	// Test N+1...N+32 since they risk overlapping with precomputed table =
values
-+	// in the final additions.
-+	for i :=3D int64(2); i <=3D 32; i++ {
-+		t.Run(fmt.Sprintf("N+%d", i), func(t *testing.T) {
-+			checkScalar(t, new(big.Int).Add(c.Params().N, big.NewInt(i)).Bytes()=
)
-+		})
-+	}
-+}
-+
-+func fatalIfErr(t *testing.T, err error) {
-+	t.Helper()
-+	if err !=3D nil {
-+		t.Fatal(err)
-+	}
-+}
-+
- func BenchmarkScalarMult(b *testing.B) {
- 	b.Run("P224", func(b *testing.B) {
- 		benchmarkScalarMult(b, nistec.NewP224Point().SetGenerator(), 28)
-diff --git a/src/crypto/internal/nistec/p256_asm.go b/src/crypto/interna=
l/nistec/p256_asm.go
-index 6ea161eb49953..99a22b833f028 100644
---- a/src/crypto/internal/nistec/p256_asm.go
-+++ b/src/crypto/internal/nistec/p256_asm.go
-@@ -364,6 +364,21 @@ func p256PointDoubleAsm(res, in *P256Point)
- // Montgomery domain (with R 2=C2=B2=E2=81=B5=E2=81=B6) as four uint64 =
limbs in little-endian order.
- type p256OrdElement [4]uint64
-=20
-+// p256OrdReduce ensures s is in the range [0, ord(G)-1].
-+func p256OrdReduce(s *p256OrdElement) {
-+	// Since 2 * ord(G) > 2=C2=B2=E2=81=B5=E2=81=B6, we can just condition=
ally subtract ord(G),
-+	// keeping the result if it doesn't underflow.
-+	t0, b :=3D bits.Sub64(s[0], 0xf3b9cac2fc632551, 0)
-+	t1, b :=3D bits.Sub64(s[1], 0xbce6faada7179e84, b)
-+	t2, b :=3D bits.Sub64(s[2], 0xffffffffffffffff, b)
-+	t3, b :=3D bits.Sub64(s[3], 0xffffffff00000000, b)
-+	tMask :=3D b - 1 // zero if subtraction underflowed
-+	s[0] ^=3D (t0 ^ s[0]) & tMask
-+	s[1] ^=3D (t1 ^ s[1]) & tMask
-+	s[2] ^=3D (t2 ^ s[2]) & tMask
-+	s[3] ^=3D (t3 ^ s[3]) & tMask
-+}
-+
- // Add sets q =3D p1 + p2, and returns q. The points may overlap.
- func (q *P256Point) Add(r1, r2 *P256Point) *P256Point {
- 	var sum, double P256Point
-@@ -393,6 +408,7 @@ func (r *P256Point) ScalarBaseMult(scalar []byte) (*=
P256Point, error) {
- 	}
- 	scalarReversed :=3D new(p256OrdElement)
- 	p256OrdBigToLittle(scalarReversed, (*[32]byte)(scalar))
-+	p256OrdReduce(scalarReversed)
-=20
- 	r.p256BaseMult(scalarReversed)
- 	return r, nil
-@@ -407,6 +423,7 @@ func (r *P256Point) ScalarMult(q *P256Point, scalar =
[]byte) (*P256Point, error)
- 	}
- 	scalarReversed :=3D new(p256OrdElement)
- 	p256OrdBigToLittle(scalarReversed, (*[32]byte)(scalar))
-+	p256OrdReduce(scalarReversed)
-=20
- 	r.Set(q).p256ScalarMult(scalarReversed)
- 	return r, nil
-diff --git a/src/crypto/internal/nistec/p256_ordinv.go b/src/crypto/inte=
rnal/nistec/p256_ordinv.go
-index 86a7a230bdce8..1274fb7fd3f5c 100644
---- a/src/crypto/internal/nistec/p256_ordinv.go
-+++ b/src/crypto/internal/nistec/p256_ordinv.go
-@@ -25,6 +25,7 @@ func P256OrdInverse(k []byte) ([]byte, error) {
-=20
- 	x :=3D new(p256OrdElement)
- 	p256OrdBigToLittle(x, (*[32]byte)(k))
-+	p256OrdReduce(x)
-=20
- 	// Inversion is implemented as exponentiation by n - 2, per Fermat's l=
ittle theorem.
- 	//
diff --git a/meta/recipes-devtools/go/go/CVE-2023-24537.patch b/meta/reci=
pes-devtools/go/go/CVE-2023-24537.patch
deleted file mode 100644
index 6b5dc2c8d9..0000000000
--- a/meta/recipes-devtools/go/go/CVE-2023-24537.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 110e4fb1c2e3a21631704bbfaf672230b9ba2492 Mon Sep 17 00:00:00 2001
-From: Damien Neil <dneil@google.com>
-Date: Wed, 22 Mar 2023 09:33:22 -0700
-Subject: [PATCH] go/scanner: reject large line and column numbers in //l=
ine
- directives
-
-Setting a large line or column number using a //line directive can cause
-integer overflow even in small source files.
-
-Limit line and column numbers in //line directives to 2^30-1, which
-is small enough to avoid int32 overflow on all reasonbly-sized files.
-
-For #59180
-Fixes CVE-2023-24537
-
-Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private=
/+/1802456
-Reviewed-by: Julie Qiu <julieqiu@google.com>
-Reviewed-by: Roland Shoemaker <bracewell@google.com>
-Run-TryBot: Damien Neil <dneil@google.com>
-Change-Id: I149bf34deca532af7994203fa1e6aca3c890ea14
-Reviewed-on: https://go-review.googlesource.com/c/go/+/482078
-Reviewed-by: Matthew Dempsky <mdempsky@google.com>
-TryBot-Bypass: Michael Knyszek <mknyszek@google.com>
-Run-TryBot: Michael Knyszek <mknyszek@google.com>
-Auto-Submit: Michael Knyszek <mknyszek@google.com>
-
-CVE: CVE-2023-24537
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/go/parser/parser_test.go | 16 ++++++++++++++++
- src/go/scanner/scanner.go    |  7 +++++--
- 2 files changed, 21 insertions(+), 2 deletions(-)
-
-diff --git a/src/go/parser/parser_test.go b/src/go/parser/parser_test.go
-index 153562df75068..22b11a0cc4535 100644
---- a/src/go/parser/parser_test.go
-+++ b/src/go/parser/parser_test.go
-@@ -764,3 +764,19 @@ func TestRangePos(t *testing.T) {
- 		})
- 	}
- }
-+
-+// TestIssue59180 tests that line number overflow doesn't cause an infi=
nite loop.
-+func TestIssue59180(t *testing.T) {
-+	testcases :=3D []string{
-+		"package p\n//line :9223372036854775806\n\n//",
-+		"package p\n//line :1:9223372036854775806\n\n//",
-+		"package p\n//line file:9223372036854775806\n\n//",
-+	}
-+
-+	for _, src :=3D range testcases {
-+		_, err :=3D ParseFile(token.NewFileSet(), "", src, ParseComments)
-+		if err =3D=3D nil {
-+			t.Errorf("ParseFile(%s) succeeded unexpectedly", src)
-+		}
-+	}
-+}
-diff --git a/src/go/scanner/scanner.go b/src/go/scanner/scanner.go
-index 16958d22ce299..0cd9f5901d0bb 100644
---- a/src/go/scanner/scanner.go
-+++ b/src/go/scanner/scanner.go
-@@ -253,13 +253,16 @@ func (s *Scanner) updateLineInfo(next, offs int, t=
ext []byte) {
- 		return
- 	}
-=20
-+	// Put a cap on the maximum size of line and column numbers.
-+	// 30 bits allows for some additional space before wrapping an int32.
-+	const maxLineCol =3D 1<<30 - 1
- 	var line, col int
- 	i2, n2, ok2 :=3D trailingDigits(text[:i-1])
- 	if ok2 {
- 		//line filename:line:col
- 		i, i2 =3D i2, i
- 		line, col =3D n2, n
--		if col =3D=3D 0 {
-+		if col =3D=3D 0 || col > maxLineCol {
- 			s.error(offs+i2, "invalid column number: "+string(text[i2:]))
- 			return
- 		}
-@@ -269,7 +272,7 @@ func (s *Scanner) updateLineInfo(next, offs int, tex=
t []byte) {
- 		line =3D n
- 	}
-=20
--	if line =3D=3D 0 {
-+	if line =3D=3D 0 || line > maxLineCol {
- 		s.error(offs+i, "invalid line number: "+string(text[i:]))
- 		return
- 	}
diff --git a/meta/recipes-devtools/go/go_1.20.1.bb b/meta/recipes-devtool=
s/go/go_1.20.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.1.bb
rename to meta/recipes-devtools/go/go_1.20.4.bb
--=20
2.40.0


