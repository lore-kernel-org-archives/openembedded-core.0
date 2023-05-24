Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EAFC7EE29
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 03:11:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.823.1684897859762552527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 20:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=Lde+bFfA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=45082ad12b=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34O1j2n4000542
	for <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 20:10:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=wOgg0Kh2d6O2fFcJnnetQOOvTKwkEQ7Eq/i2/eauONs=;
 b=Lde+bFfA7L8jHReSyQ7TrsM2DeN2dpOBbxWzuztfPtWAFHLKfH+n7/sBSQxl1wzPB8pT
 LjHVwzw0x7AXBkLa0f35xkB6TitgUBVL7kFhHNhj3JxA8FlxmX/vUE2XJ4Hu0L8WY3ss
 zp9UotakDAQRtD/SwtsGx5CSFc61p75OBj2QPeDKYr6kln1jIq8O6fzqLvIxAOaUayFQ
 8itMlIV4eYnFYezHfsnJXXbzgclXU+Z2giWXDlTl901tRO2bD48A919ZGt5FxuRlt+Tl
 L/Mpqb9WnjMq0AK5LhblhK8uea0riy7RxTIT3iEADd7+bM5+ARuHHDj2kcWitgKnDqHA ZA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpsg1kdh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 20:10:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dc2wZt79v1SMYYEa9ckkyn7759F26fUfeG6SHJ3bn2so2sOgCX9JZEpFMPaRm+fmYA+aCgGMbjpi991Tal3plVo2HpOKLAHRgkixBLlq7xGn6ylsC53LfxrLXMsQqxmtQbLANksZVadlu1m8O8Lj/AoqGn/tTdLq2AmXK2rmRqQ38NrqByIkEr1qGLsah1rk+6Ecx9pyO6tISU7/wsZLWlyNZbKaOA/Iettb0PZSuqr1qm2ilibq8y1609vW3KgRtzvjfqdqrTn9Jf4WKGLEl1Zxe8MNrqBroGaCb7XNlYSmlY5gHOg3vUSXfWS1wdJsqL3ztMYQgQn+s5CTzkfJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOgg0Kh2d6O2fFcJnnetQOOvTKwkEQ7Eq/i2/eauONs=;
 b=dTg7VgPu7GQ3gK4cSWbvpar3mgPg29Z8FCeLofxfVz502ADpwtImciBuR5onguuBUO8ZNtEMxUN9dH99UELcMwakuP8Hcp2fhKCBZsc4wd659UG2oNT1qF9stR8Q5DbEGmvpDNGI/WGDBk26ZPN+p4bGtxkR96TTbiZFp5xeKobdCRUZqHPU9Lv6PlcphS6T2WCviqA5TRwHelbjXnEKyl+hmp8q9Rke6O8LQ7sjvnPLaRiK8YfXBTesUqflD9xNliha5/P0fLKgUKmCT0kXInNzUmEUGuDL42rWhRZFtmTdiFMKO8/h5q/pHWJ75rjU7VP6226G8cRGDq/D9PCEiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Wed, 24 May 2023 03:10:55 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::61aa:b66e:fce4:b592]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::61aa:b66e:fce4:b592%5]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 03:10:54 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][PATCH] go: update 1.20.1 -> 1.20.4
Date: Tue, 23 May 2023 23:10:32 -0400
Message-Id: <20230524031032.1543421-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: MN2PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:208:15e::22) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|SA0PR11MB4735:EE_
X-MS-Office365-Filtering-Correlation-Id: 928ec106-5a10-4a21-ce48-08db5c047c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9o+4kXpuvJValc2kHIzxlNcCAE1hNdcdBTRdSJc7vXma8zW1d9wbyJRTP6LLgpQazzWAo2WUEGBRkKSiFAmqbPAriXW6qOv0TVKFWfpP8kZo0c5yBxGwpRSyjYj3cbEUt0YCBtFdSfLA454J/2eVupskzF4ZcvuqfLoJ00eoOPol+30YdogNoVyxj7RJPsjZZKizktqKzegq59LXGDaeeaNljk8C0o/puNFZGQQJVq6VpePZ9YYYy5FUt64+Mp2WrT6RqTxaGLLVMIGBy8R+CkuG/NVV7HQFZRnZuMBaq1X45LRCYBAGRY2hiJFoBjxKAiMQmHRok38Nq3YFUK2gZU+lwR+MSOOFKpXkeSms91izQ6I4IGiuu+jHYT7OQJOkWw/k6mVqq7wf9agL8j66NvNbYVptcdpBs6zrEynh03V/pebChxCsN6LTg2EZgsUgxrkWWeK2QDdDc8RmTLBbfOSnDQNBvVZpIBbJpcAOpwCx0uQwln+ky/SGDGFFH4p761x+QRUIWjLR8ZNUyyDW7DgmuLcN9hHLiU7FEiQJaTet1rib3HTx4lOmciWhEFCE0yyN8AY5nuvpDqvTj4DTTEK0D1ToWNR6Z/COsHF4IegwNniM3tUd+B0K52Hr+qwn4aEm7ppZVcZzlrrj8Y0XFA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(376002)(366004)(396003)(346002)(451199021)(8936002)(38100700002)(19627235002)(38350700002)(66556008)(66476007)(84970400001)(66946007)(478600001)(86362001)(6916009)(316002)(6666004)(41300700001)(83380400001)(6486002)(52116002)(2616005)(186003)(36756003)(30864003)(44832011)(2906002)(15650500001)(966005)(6506007)(6512007)(1076003)(5660300002)(26005)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SlZMRERKa3NHSTlQSk9Ma2d1M3hmb3VMTm1jU2F6Q0lray9OVnNPcXVRbFJh?=
 =?utf-8?B?WUorV2NIaDRBS2ZHSkVTOWNPS3hwTG5ueEdPdTdKY1c0NmtoVzd5V1pnMTFo?=
 =?utf-8?B?clVxZ0pVRDQ3QlI1QlBaeXJ1Yyt1TFFJdWpwS2R5ZTRXaDlDWm5PT2Q0TzVH?=
 =?utf-8?B?VFFFYmN4RG8za0pDUWFDV0t1SFN6c1Z3ME1tYi9LeUhpakk3dlZ6dDRobWtK?=
 =?utf-8?B?N1dzQ21XWG85N0U0M1F4SG8wVnJFVzJNYUkrcUt6SWVzMWNSN0NSeThxY3dH?=
 =?utf-8?B?Q3RkSkNkd0U3U2cxdjBnWXdySzlPUnVQb1FZT1hJaFY4TmpBZWdZazZDb3FQ?=
 =?utf-8?B?WldoOHVHRTR3Ykk4TWc4dHR1YzZ2aWtaR3F0SmZPaVNXRUFreEJ6Q2s0MjNq?=
 =?utf-8?B?TnU5UHdFL2UvL0FEUEMxcG41VzlLZTFweW1Sa09TRjdJVWIrM0IxK2p3eWZh?=
 =?utf-8?B?Y2lHL0xmWEQ5Rnp2dmtwOXpYTGFoL3FoQ2hhbmVuVkV4a0V0N0tEVFBmekZm?=
 =?utf-8?B?cHI1Z3F6R09GSS8vUmdWZHlJZWV6R2Q2U1V5QmQ1dmR0RXV6Y01qcnBhU1lZ?=
 =?utf-8?B?aU51WGlxMWJmZEpNOUpOSTJ4dEFPMU1KVUVuZkduYlZMYnpOUGcwUXRTM2ta?=
 =?utf-8?B?QWRUdFFjTVNGWGNnK0ZVd1VaV3MyZ0JNMk1STDJwbWtBYU9CQUtTdlluOTc3?=
 =?utf-8?B?UXdyNGJTZFhycDBXdnBDbVFnMHovZzFrYlp3WGhTSXA1N2J6eWhTNzRIdzl4?=
 =?utf-8?B?bFg0MWR2aHhZblRoeUhtSTgwTU5zM205QjF1cUh4R1E1R3pya3dGWkJyeW83?=
 =?utf-8?B?OU1hOGIyVURGazVVNy9qWVZHcnFkSTRGNmkrYUUrdEphaDVMUGQwWm5XNFVv?=
 =?utf-8?B?K2VoNUNWOXBJZmpURW5kdnFCdG9ZaFEzQmJYRUw0Z1p0OFdRaUVpeGZubk1W?=
 =?utf-8?B?dHVjaW9meEhtSEJtQy9rNUFhL2xab0xmRC9vR2dpUkdVTm9KczQ0VkpYSllS?=
 =?utf-8?B?dTlCdXBtV2NPeVpLNGY2U3ErZndRQkZ3dmpmRGVUckt4V0ZwbUhMemVCaE5n?=
 =?utf-8?B?Tm9VYWswL1hPY2VJbHJSWjAvSUxlK0F4dEc0d1FId0RvRWZ5dit0ZnVid3U5?=
 =?utf-8?B?NlFzN1k2NDR1OE9xUW16bEdGRkRzTW5PdCsyS1FoVnoyZTB4R1cySjBWamtP?=
 =?utf-8?B?anpLOWpsc05WdG1GVTFOM2Zoa0F5bkNVVnRweHFzVEY2cnJmSkJRamJaSitq?=
 =?utf-8?B?NWlpL3BEMGxCM0ZpL1V3RWgrSXFLa1pXMER5ZXR2cG9aV2lzYWgra05EWXNN?=
 =?utf-8?B?eUl4b3M3WGJtRmxtQTlib2JjMitDUEVlaDV0a2QvNXlLMmN4UzF1THFQWkNz?=
 =?utf-8?B?a3JNT3hBS05wVWFVUDRmd29ZcS8zaC9lRHovUWM4ZVRkSVl4Tnhhek83aERZ?=
 =?utf-8?B?LzBFYnB1RjlaTS9OVTV3a3NDbkRFbXdqcFBQc3pINHZ1dTYxWFd5NGUwQWhx?=
 =?utf-8?B?ZjY2SGVNQjhhNUJheXM5Lyt4dFdnT29xeUh1d1NPTFY5cGRnczIxdGJkQjRt?=
 =?utf-8?B?Z1pVaDZ2Wjh3Ym9Ia0llMUVudnR0ZmFmZGJpMTBaZ05PeWowWVFReDA4UXpU?=
 =?utf-8?B?bmYvWjNBcUFmQk5FSTN2elUrZzNaU2R0c0I4eEZTLzV0WkN1dWpENDlQYzR4?=
 =?utf-8?B?QUkyNEYxNWlKUHpQMXBlR3Q3ZGFUWlR4UVVSaFhiN3ozMEMzbjRkR2lmMndE?=
 =?utf-8?B?VTRibDlQMWxEenk5UmhjeXVML1hqNTZMODgrQThzQUtxLzd3V0dpNXBTSlJJ?=
 =?utf-8?B?ZER5ZXM5anZlQktYbzdzMENTUU5YNW5tdVNMNm9rZXRYZjVXL3crK2J6Zjhj?=
 =?utf-8?B?ejZXS3lURUpZb3dxN2pLTkNhNWdaTm90VEErdDdwSk9TbHJaWGU2Z3o3ME5i?=
 =?utf-8?B?WXUyTE4vZ2V3M3ozZzFCRGNDYjdkSFN3MGV1TkcxMDZkTTI0VWZEd0F5VGNB?=
 =?utf-8?B?MDFOUm9UclBtNjQ3VkxwSG1CRTFaQXdjVURXVUZXemlvczR5ZU9Sa0tUcmpF?=
 =?utf-8?B?STBhU3FTRXhvU3p6dTQyZXhuTFlNdjk2R0FrN3hteWlXd1B2ZHdYZVZOYnA2?=
 =?utf-8?B?cmIxZWN4OUZHTnhHRERXK3F4UU4xOTlYN25Td3FnenlnSENQeHdpcGRNMzVn?=
 =?utf-8?B?QWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928ec106-5a10-4a21-ce48-08db5c047c91
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 03:10:54.4966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AE67FfU3za/jPkCrdn3krGZfdDLRxbwDWqO4xlowBLUJggupi/q/V8LbFb/IqzKi80OIuWdGw7sG1nVxKTpkLm7QB/zQgvrb8sObfSw26z0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4735
X-Proofpoint-GUID: JxnKH4ihmTlZqumNI_zmpprK9_gzuAS9
X-Proofpoint-ORIG-GUID: JxnKH4ihmTlZqumNI_zmpprK9_gzuAS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_16,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240025
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34O1j2n4000542
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 03:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181656

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


