Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBDCC4706F
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 03:31:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.22001.1704166304187208679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 19:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=IVtZ2UPb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=173143555b=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4022xpWp009453
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jan 2024 03:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=PPS06212021; bh=K+jPb
	YQjvPWvASYt5t08/MtWFIrgOkJ3Zf8Ddh6JcUc=; b=IVtZ2UPbaIx2YbqUsdFfF
	bFmR2QazvPzn6hC22pfs0vGjYJjVQ6J/7hiGg6mMAlLajT24lAaZISeNcKrNiduk
	7J+APWunaM1+Ke2oDSQBrEiHkS356mKNgcyX2U3w5HQrZmerI0S4okw6bD2GD9ri
	xY0p/l6yW6ydikKGGoROZI2ZzqvqyfnrxN7lucRhX+Gtw+0CaUeGunQV27ovHxzP
	5CqFMzQTdYpDCiEGpvNea5hff3o+dIM1isHoWF0Jxce3L6liWU0uKC7e/O0/01QS
	4qyEBQx9M+rASHXIslGRGOlVCYj2iECDLSTguucAUsoja2uMpaQiNUOJUeJXurCu
	Q==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vaa662d48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 03:31:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwZACXHIXyBSKGP5Tgo6iMsJ9tMpTM1tDP2cXhJT6/MpFCdhXCtUbo09ilhaXRtMy4ooG8Unk9p6WpHLSPUA3mhzySQnQBn056Y/AUOum3rJWxXyp1pUUiRcy4KGhP1GnfUXXiX8JzjrO4DXLoRoQJxBiaDRg0rk5Y0gVju/MICwDJcYjQFI7bZ0rXqMr+7IRDwqpMGwJ21PJ85nzGcOhJ/GLgsvi9f+RpKjwcItdVt6IRGMFMGCi/QNPf/piKnvDvG1HV/kmuMPgaLuWimebDNfvjwszRz9qlzAsnGYcjH1de+dR+vnuBdfhjxIfESAEUizbW3yxxH9ju8P+MMuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+jPbYQjvPWvASYt5t08/MtWFIrgOkJ3Zf8Ddh6JcUc=;
 b=bSXDQkFczcmQCwit1+1mRJgYQ6Q5wcsBQYCfdsoAZ64H/zBwaHNU9+0+FARjSu9Ckw2kKSzoXxZQM5NVatYNWmK4Lqw69jKTYwqHheunWZ0UMgbhR8sHLkmQRosUbDW0OpNsTKQUIdPi6WBJUdqt5MkXl2TDPUKOXAzG+EwxWZY8U/sCL8tx90XE8L6p4G4EwGS7KIOQ69QM00shxFFP8UqdNAt4DR7EXSTVjbfff+0dneOTNO04lOA7B4uPUBI1pRa7Nn6qAl8cnliMyNhtH32RhDZPJ1ynRN43/c3GjXkR9YwLNh66+ccIdDERl94UUbBgZ6TjphfRXscCGmAPPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB8135.namprd11.prod.outlook.com (2603:10b6:8:155::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 03:31:35 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 03:31:34 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] systemd: refresh musl patches for v255.1
Date: Tue,  2 Jan 2024 11:31:19 +0800
Message-Id: <20240102033119.4135738-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2P153CA0016.APCP153.PROD.OUTLOOK.COM (2603:1096::26) To
 CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: b84f5207-eaa4-48fa-3fcb-08dc0b43516f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bicbGynkMKNNbSQ3UwxzxX+nLwTW6VFT1GBmCB87IqHDjNjkkCoOK3DZrcPknEBaeCf38LQjoHb9XQ/Xqul4sEgwGB7XgS83TsT/lIk/SKVSd1eHF/M2paacqRjaiJVrn0Jxq0vvNRf3KcEuo4Ob3MW9Upatr3JfktL7O6vquJrTaHYurpPw4ZN4LCIVElYn7SdEMFeHBs5FqVN8sMiW2WVP192YxdCWrL7eyE0YW+WBKMn+RlSA9cjABvef/Ob8XN6YhiV5mFUB1xfdHbBEvg1u8CPXFBBgfdnbqEWhlemxK1dAv3Oy2HpM4NwogR7+yvcdGKMYDZX7Q0A23b7c9BBJW35g+U6eV0TB0NMNWy37stEL9KxkFJHoy19UdCrxkXnAosd2aYuCNqrPltgifIwiH7wSKo8GOCPRLiq+lEjQskaCjZFKzzl4arMM5eiCnW7+70aogFXRkzpt45hKw9r3hVTCrTN3BgWu3U+67s/5355yxt1y7Wxn0os+VYqpatHzrCYA32d1Qhgdr9AL1+i1jEb0yfQwhMdLcDjQ1Z/4rLlQyHIUJvojgBk3umPuGlIB8VGYmSghTxwNh8hkbOstYVyO5gbDyVp8wjYJiSYbvSI+Hp0TyCHzMTRITXn4lGm5uWbVf47BYtUdO6wb9g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(136003)(366004)(396003)(346002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(41300700001)(83380400001)(26005)(2616005)(1076003)(38100700002)(8676002)(8936002)(316002)(5660300002)(30864003)(2906002)(478600001)(45080400002)(966005)(6666004)(6506007)(6512007)(6916009)(52116002)(66476007)(9686003)(66556008)(66946007)(6486002)(38350700005)(86362001)(36756003)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TDBHVFVVK1h5NVh3NDlNNlNDc2EzWEc0N2p1RE03U3JKd0dETEVZWmNVZmI2?=
 =?utf-8?B?V01XbnAxMkZtQlVJN2pNQlUvS24xTXpLeTk1S0ZBdGZHLytCY295Um5XaklE?=
 =?utf-8?B?Z2d5Q3N3K1Y4TzRieVBQWXU5WWdwRmhEVm9iQmd5RVpaWUZ3cUdQR2lHakky?=
 =?utf-8?B?R0wzaVNSK1hkYldCSTAvMS9kWkVMMUlqVE5WSkVUUi96MkJ2Z1hwTllmQ3Jr?=
 =?utf-8?B?dWpjb0hBL1Rid1NQdjhHcldoclRGNmN2R1Vuc3dSV1puNFNzazBnRE9ZNkh4?=
 =?utf-8?B?L21lVHJzUUNML1h5K0FnQ3IxaFc5dTRZdktjRXI3WUNMMVpoU09LRkZjVnZt?=
 =?utf-8?B?d3BjWWdSTVNuUys2TXhtVW5nZFh3UFFBMGdDTC9aMm1PbnI0ZGRJd0NrSWtC?=
 =?utf-8?B?Y25NYW1zcmh0Tm5PaVdTdENwTEp2VGNFTU5rNUZ1ZytBdHFLd2ZKMjV6eXYr?=
 =?utf-8?B?VWVWUXMxbCtBM1ZXY01RcllRenprM2ZhYTB4ZlUyUFZmeDNyWGFIcEgzdW53?=
 =?utf-8?B?ckVZZkRHaHN5N0hWWlFRYWEybEcrYmJJbW5HLzZKUmpDRHlsSkVpR1ZtS3dI?=
 =?utf-8?B?TFBVczJMaGZsRllBdUlHUUxlUXlOL3VRdmdDN2ZEbEVkblFuc1gwR29TWE9u?=
 =?utf-8?B?UTRCYUNxNTA0dG1EZmg5MmdCTTNoMmxkS2FVTENuMS9HWDZtMTFIT2xUMWFO?=
 =?utf-8?B?Zi9ud3RGNGt2R0ZwRFZNZU5TRGJaSFNrQWYzS0xDMHE1VUxiNDVWNkdObDla?=
 =?utf-8?B?Q2NocVRUeW5sRWZjczQ1bWlJd3RKZDVFcTdRR3RlWklTcjBUUVdsMTdFQVFm?=
 =?utf-8?B?dGNLc25zZ0gyZUNsUDFVU0hab2sxcVRPaVA4UjEyMFJGYzRFdWJwL1dmL3pn?=
 =?utf-8?B?bzhMQS9KWGt5T1phY2dUa3ZWNC94d1VRTlZpMGFPQ0ZnS0I1elFKeUNXTzJr?=
 =?utf-8?B?M3JwQ2d5VkRDbkdoNlMxcjlKTUxUUHdEOFhLVVFjdWx5Zms0SDlhbjFJZVd0?=
 =?utf-8?B?RStHNXFUWmVpTmhNN1lnek1pWUY5VlExdFo3YmFGS1ZrN0ovZ1hHZTh3RzJ4?=
 =?utf-8?B?OGEveGRJMW04aGxSS2ZSTS9UVWhmbVhlTDlaRUFUNnQ2TG1VVURFYkhrUnpa?=
 =?utf-8?B?N3R2QzR4THIxTG9vWTE1Q0F4UlVzbWxFR3E1NSszMkpuK21mMTBxNk40ck5O?=
 =?utf-8?B?azJ2NUJFc2F5cmRxNXo0SFkzNFFIUnExZ0JiWWFEd015NVljUElEREFieVRV?=
 =?utf-8?B?ajBNbDJmK1dPN0RmK3Yzd0hWTis3VWg4UEtWQ3VpSmVKZG01NDdHVVcyRVVo?=
 =?utf-8?B?NDJDdUpDdm9KbE5sbk1OTmllMWZZSHhBaVJqaXZZL1pTamdUM2JpUnp6VHk0?=
 =?utf-8?B?eUdiUDhmY1ZWZFNIMEhrZkFOUm1MZmI3Sk12QXhXUTZPVWpjNXNYaVBoT1Fp?=
 =?utf-8?B?OUZHU08wOWZjTnVWd3F2OHZMcXF3am4vQTJjQUtSTnBiWWRNeEJMdTNlL0Zr?=
 =?utf-8?B?c2lJYmZTUjVEY0tldXFqSlFjeHQxZU5XWGpJTXNncmVVdkRqMGRRK0NhTlhC?=
 =?utf-8?B?WHJqNDFaYzU2R0QxUWZKYm1yNDd2UUwxeUlhejdMWU1zSlhIb2hzc2RKL01j?=
 =?utf-8?B?VnRsdUJmZlUvNGxlOTF6aWtXemlqNTJIMHREZlhyK29uSTFTLytLcHdMMUtU?=
 =?utf-8?B?SEhqWGE4d3pFTWd4SHovOGM0YWFNLzJEbE9pd1M0VndIOFFzR25ycysvY2tW?=
 =?utf-8?B?NVo0YndVWEtTYmxqMkpNSTRVQXg0SjlNYzZuRlVvNGNJYlE1NWlObGZKK25U?=
 =?utf-8?B?aDJxb0QwY0xna0lJTEpUOFAyTWU4TzVIOTMyWFQwaFZEcmJuK0Q2K05CS1lS?=
 =?utf-8?B?T1VPSUcwemhsVTh1MjFsR1dnUE42cW1YV2wwM2lTWDcxS2labC9mSWJqQVlJ?=
 =?utf-8?B?d0Y0Q2pHWHhsTDhqd3V4ejJoNkdhV0M0YWNjbHp5WFZVTTFmQWRCK0Q1d2xZ?=
 =?utf-8?B?TGNQLzZRZVYybXB3U3VxNStCRnliWFFGUHFwQmVUcFJ1c1VPQlp5NmhXaHEz?=
 =?utf-8?B?emdMN01PU0FEbzArYXRkcW4xSTV3SkIvL1Qxek8zYWRQWkRWM0QycFJaWTRQ?=
 =?utf-8?Q?tgMIkZLWEGozcC6qretI6Ioj+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b84f5207-eaa4-48fa-3fcb-08dc0b43516f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 03:31:34.3687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DrwoZpmKwIr8wR31VwUDlbKk2ddlbdsDnw+jWQCus8t3MaTTB3VVqB3ldi+hYyWv77iHCj88bbNXqGjbM+nww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8135
X-Proofpoint-GUID: kvtmunCbwUFt1V6o-NBAQ_OdjaPxN9Ct
X-Proofpoint-ORIG-GUID: kvtmunCbwUFt1V6o-NBAQ_OdjaPxN9Ct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401020025
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4022xpWp009453
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 03:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193195

From: Chen Qi <Qi.Chen@windriver.com>

The current patches are refreshed. A new patch is added:
0022-avoid-missing-LOCK_EX-declaration.patch

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-missing_type.h-add-comparison_fn_t.patch} |  10 +-
 ...-parse_printf_format-implementation.patch} |  27 +-
 ...issing.h-check-for-missing-strndupa.patch} | 157 ++++++-----
 ...B_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} |  19 +-
 ...05-add-missing-FTW_-macros-for-musl.patch} |  10 +-
 ...6-Use-uintmax_t-for-handling-rlim_t.patch} |  23 +-
 ..._SYMLINK_NOFOLLOW-flag-to-faccessat.patch} |  10 +-
 ...atible-basename-for-non-glibc-syste.patch} |  14 +-
 ...ffering-when-writing-to-oom_score_a.patch} |  10 +-
 ...ompliant-strerror_r-from-GNU-specif.patch} |  12 +-
 ...efinition-of-prctl_mm_map-structure.patch} |   8 +-
 ...not-disable-buffer-in-writing-files.patch} | 255 ++++++++++++++----
 ...tch =3D> 0013-Handle-__cpu_mask-usage.patch} |  11 +-
 ...atch =3D> 0014-Handle-missing-gshadow.patch} |  10 +-
 ....h-Define-MIPS-ABI-defines-for-musl.patch} |  10 +-
 ...ss-correct-parameters-to-getdents64.patch} |   6 +-
 ...tch =3D> 0017-Adjust-for-musl-headers.patch} |  92 ++++---
 ...rerror-is-assumed-to-be-GNU-specifi.patch} |  10 +-
 ...til-Make-STRERROR-portable-for-musl.patch} |  17 +-
 ...ke-malloc_trim-conditional-on-glibc.patch} |  18 +-
 ...ared-Do-not-use-malloc_info-on-musl.patch} |  15 +-
 ...22-avoid-missing-LOCK_EX-declaration.patch |  43 +++
 meta/recipes-core/systemd/systemd_255.1.bb    |  43 +--
 23 files changed, 559 insertions(+), 271 deletions(-)
 rename meta/recipes-core/systemd/systemd/{0009-missing_type.h-add-compar=
ison_fn_t.patch =3D> 0001-missing_type.h-add-comparison_fn_t.patch} (89%)
 rename meta/recipes-core/systemd/systemd/{0010-add-fallback-parse_printf=
_format-implementation.patch =3D> 0002-add-fallback-parse_printf_format-i=
mplementation.patch} (93%)
 rename meta/recipes-core/systemd/systemd/{0011-src-basic-missing.h-check=
-for-missing-strndupa.patch =3D> 0003-src-basic-missing.h-check-for-missi=
ng-strndupa.patch} (86%)
 rename meta/recipes-core/systemd/systemd/{0012-don-t-fail-if-GLOB_BRACE-=
and-GLOB_ALTDIRFUNC-is-not-.patch =3D> 0004-don-t-fail-if-GLOB_BRACE-and-=
GLOB_ALTDIRFUNC-is-not-.patch} (90%)
 rename meta/recipes-core/systemd/systemd/{0013-add-missing-FTW_-macros-f=
or-musl.patch =3D> 0005-add-missing-FTW_-macros-for-musl.patch} (84%)
 rename meta/recipes-core/systemd/systemd/{0014-Use-uintmax_t-for-handlin=
g-rlim_t.patch =3D> 0006-Use-uintmax_t-for-handling-rlim_t.patch} (83%)
 rename meta/recipes-core/systemd/systemd/{0016-don-t-pass-AT_SYMLINK_NOF=
OLLOW-flag-to-faccessat.patch =3D> 0007-don-t-pass-AT_SYMLINK_NOFOLLOW-fl=
ag-to-faccessat.patch} (95%)
 rename meta/recipes-core/systemd/systemd/{0017-Define-glibc-compatible-b=
asename-for-non-glibc-syste.patch =3D> 0008-Define-glibc-compatible-basen=
ame-for-non-glibc-syste.patch} (70%)
 rename meta/recipes-core/systemd/systemd/{0018-Do-not-disable-buffering-=
when-writing-to-oom_score_a.patch =3D> 0009-Do-not-disable-buffering-when=
-writing-to-oom_score_a.patch} (82%)
 rename meta/recipes-core/systemd/systemd/{0019-distinguish-XSI-compliant=
-strerror_r-from-GNU-specif.patch =3D> 0010-distinguish-XSI-compliant-str=
error_r-from-GNU-specif.patch} (89%)
 rename meta/recipes-core/systemd/systemd/{0020-avoid-redefinition-of-prc=
tl_mm_map-structure.patch =3D> 0011-avoid-redefinition-of-prctl_mm_map-st=
ructure.patch} (79%)
 rename meta/recipes-core/systemd/systemd/{0021-do-not-disable-buffer-in-=
writing-files.patch =3D> 0012-do-not-disable-buffer-in-writing-files.patc=
h} (55%)
 rename meta/recipes-core/systemd/systemd/{0022-Handle-__cpu_mask-usage.p=
atch =3D> 0013-Handle-__cpu_mask-usage.patch} (83%)
 rename meta/recipes-core/systemd/systemd/{0023-Handle-missing-gshadow.pa=
tch =3D> 0014-Handle-missing-gshadow.patch} (96%)
 rename meta/recipes-core/systemd/systemd/{0024-missing_syscall.h-Define-=
MIPS-ABI-defines-for-musl.patch =3D> 0015-missing_syscall.h-Define-MIPS-A=
BI-defines-for-musl.patch} (84%)
 rename meta/recipes-core/systemd/systemd/{0005-pass-correct-parameters-t=
o-getdents64.patch =3D> 0016-pass-correct-parameters-to-getdents64.patch}=
 (92%)
 rename meta/recipes-core/systemd/systemd/{0001-Adjust-for-musl-headers.p=
atch =3D> 0017-Adjust-for-musl-headers.patch} (89%)
 rename meta/recipes-core/systemd/systemd/{0006-test-bus-error-strerror-i=
s-assumed-to-be-GNU-specifi.patch =3D> 0018-test-bus-error-strerror-is-as=
sumed-to-be-GNU-specifi.patch} (89%)
 rename meta/recipes-core/systemd/systemd/{0003-errno-util-Make-STRERROR-=
portable-for-musl.patch =3D> 0019-errno-util-Make-STRERROR-portable-for-m=
usl.patch} (81%)
 rename meta/recipes-core/systemd/systemd/{0028-sd-event-Make-malloc_trim=
-conditional-on-glibc.patch =3D> 0020-sd-event-Make-malloc_trim-condition=
al-on-glibc.patch} (85%)
 rename meta/recipes-core/systemd/systemd/{0029-shared-Do-not-use-malloc_=
info-on-musl.patch =3D> 0021-shared-Do-not-use-malloc_info-on-musl.patch}=
 (68%)
 create mode 100644 meta/recipes-core/systemd/systemd/0022-avoid-missing-=
LOCK_EX-declaration.patch

diff --git a/meta/recipes-core/systemd/systemd/0009-missing_type.h-add-co=
mparison_fn_t.patch b/meta/recipes-core/systemd/systemd/0001-missing_type=
.h-add-comparison_fn_t.patch
similarity index 89%
rename from meta/recipes-core/systemd/systemd/0009-missing_type.h-add-com=
parison_fn_t.patch
rename to meta/recipes-core/systemd/systemd/0001-missing_type.h-add-compa=
rison_fn_t.patch
index e50b47a5a0..2aa5dee6b5 100644
--- a/meta/recipes-core/systemd/systemd/0009-missing_type.h-add-compariso=
n_fn_t.patch
+++ b/meta/recipes-core/systemd/systemd/0001-missing_type.h-add-compariso=
n_fn_t.patch
@@ -1,7 +1,7 @@
-From 542f999a846dfd49d9373d30fffb2a44168d7b5e Mon Sep 17 00:00:00 2001
+From 01195eb9f7d59139fb45df506ac6b3968c14a57f Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
-Subject: [PATCH] missing_type.h: add comparison_fn_t
+Subject: [PATCH 01/22] missing_type.h: add comparison_fn_t
=20
 Make it work with musl where comparison_fn_t and is not provided.
=20
@@ -33,7 +33,7 @@ index f6233090a9..6c0456349d 100644
 +typedef int (*comparison_fn_t)(const void *, const void *);
 +#endif
 diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
-index f0bf246aa3..33669c7a75 100644
+index 9c818bd747..ef10c8be2c 100644
 --- a/src/basic/sort-util.h
 +++ b/src/basic/sort-util.h
 @@ -4,6 +4,7 @@
@@ -45,7 +45,7 @@ index f0bf246aa3..33669c7a75 100644
  /* This is the same as glibc's internal __compar_d_fn_t type. glibc exp=
orts a public comparison_fn_t, for the
   * external type __compar_fn_t, but doesn't do anything similar for __c=
ompar_d_fn_t. Let's hence do that
 diff --git a/src/libsystemd/sd-journal/catalog.c b/src/libsystemd/sd-jou=
rnal/catalog.c
-index 7527abf636..f33383e57f 100644
+index ae91534198..7f67eea38b 100644
 --- a/src/libsystemd/sd-journal/catalog.c
 +++ b/src/libsystemd/sd-journal/catalog.c
 @@ -28,6 +28,7 @@
@@ -57,5 +57,5 @@ index 7527abf636..f33383e57f 100644
  const char * const catalog_file_dirs[] =3D {
          "/usr/local/lib/systemd/catalog/",
 --=20
-2.39.2
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0010-add-fallback-parse_pr=
intf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0002=
-add-fallback-parse_printf_format-implementation.patch
similarity index 93%
rename from meta/recipes-core/systemd/systemd/0010-add-fallback-parse_pri=
ntf_format-implementation.patch
rename to meta/recipes-core/systemd/systemd/0002-add-fallback-parse_print=
f_format-implementation.patch
index 4143ab4d70..900a931632 100644
--- a/meta/recipes-core/systemd/systemd/0010-add-fallback-parse_printf_fo=
rmat-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0002-add-fallback-parse_printf_fo=
rmat-implementation.patch
@@ -1,7 +1,7 @@
-From 383e85e15f16a46aac925aa439b8b60f58b40aa6 Mon Sep 17 00:00:00 2001
+From 872b72739e62123867ce6c4f82aa37de24cc3f75 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 22 May 2021 20:26:24 +0200
-Subject: [PATCH] add fallback parse_printf_format implementation
+Subject: [PATCH 02/22] add fallback parse_printf_format implementation
=20
 Upstream-Status: Inappropriate [musl specific]
=20
@@ -21,9 +21,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com=
>
  create mode 100644 src/basic/parse-printf-format.c
  create mode 100644 src/basic/parse-printf-format.h
=20
+diff --git a/meson.build b/meson.build
+index 7419e2b0b0..01fd3ffc19 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -781,6 +781,7 @@ endif
+@@ -725,6 +725,7 @@ endif
  foreach header : ['crypt.h',
                    'linux/memfd.h',
                    'linux/vm_sockets.h',
@@ -31,9 +33,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com=
>
                    'sys/auxv.h',
                    'threads.h',
                    'valgrind/memcheck.h',
+diff --git a/src/basic/meson.build b/src/basic/meson.build
+index d7450d8b44..c3e3daf4bd 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -179,6 +179,11 @@ endforeach
+@@ -183,6 +183,11 @@ endforeach
 =20
  basic_sources +=3D generated_gperf_headers
 =20
@@ -45,6 +49,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  ############################################################
 =20
  arch_list =3D [
+diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-fo=
rmat.c
+new file mode 100644
+index 0000000000..49437e5445
 --- /dev/null
 +++ b/src/basic/parse-printf-format.c
 @@ -0,0 +1,273 @@
@@ -321,6 +328,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
 +
 +        return last;
 +}
+diff --git a/src/basic/parse-printf-format.h b/src/basic/parse-printf-fo=
rmat.h
+new file mode 100644
+index 0000000000..47be7522d7
 --- /dev/null
 +++ b/src/basic/parse-printf-format.h
 @@ -0,0 +1,57 @@
@@ -381,6 +391,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
 +size_t parse_printf_format(const char *fmt, size_t n, int *types);
 +
 +#endif /* HAVE_PRINTF_H */
+diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
+index 4e93ac90c9..f9deb6f662 100644
 --- a/src/basic/stdio-util.h
 +++ b/src/basic/stdio-util.h
 @@ -1,12 +1,12 @@
@@ -397,6 +409,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
 =20
  _printf_(3, 4)
  static inline char *snprintf_ok(char *buf, size_t len, const char *form=
at, ...) {
+diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/s=
d-journal/journal-send.c
+index be23b2fe75..69a2eb6404 100644
 --- a/src/libsystemd/sd-journal/journal-send.c
 +++ b/src/libsystemd/sd-journal/journal-send.c
 @@ -2,7 +2,6 @@
@@ -407,7 +421,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
  #include <stddef.h>
  #include <sys/un.h>
  #include <unistd.h>
-@@ -27,6 +26,7 @@
+@@ -28,6 +27,7 @@
  #include "stdio-util.h"
  #include "string-util.h"
  #include "tmpfile-util.h"
@@ -415,3 +429,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
 =20
  #define SNDBUF_SIZE (8*1024*1024)
 =20
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-c=
heck-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0003-=
src-basic-missing.h-check-for-missing-strndupa.patch
similarity index 86%
rename from meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-ch=
eck-for-missing-strndupa.patch
rename to meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-chec=
k-for-missing-strndupa.patch
index ec451cddb7..5595b5bc23 100644
--- a/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-fo=
r-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0003-src-basic-missing.h-check-fo=
r-missing-strndupa.patch
@@ -1,7 +1,7 @@
-From ee5c8b494a3269edd154a0b799a03b39dba2ceb0 Mon Sep 17 00:00:00 2001
+From 87f1d38f40c5fe9cadf2b2de442473e4e5605788 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
-Subject: [PATCH] src/basic/missing.h: check for missing strndupa
+Subject: [PATCH 03/22] src/basic/missing.h: check for missing strndupa
=20
 include missing.h  for definition of strndupa
=20
@@ -18,6 +18,8 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 [Rebased for v247]
 Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
 [Rebased for v254]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[Rebased for v255.1]
 ---
  meson.build                                |  1 +
  src/backlight/backlight.c                  |  1 +
@@ -66,16 +68,17 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft=
.com>
  src/shared/pager.c                         |  1 +
  src/socket-proxy/socket-proxyd.c           |  1 +
  src/test/test-hexdecoct.c                  |  1 +
+ src/udev/udev-builtin-net_id.c             |  1 +
  src/udev/udev-builtin-path_id.c            |  1 +
  src/udev/udev-event.c                      |  1 +
  src/udev/udev-rules.c                      |  1 +
- 50 files changed, 61 insertions(+)
+ 51 files changed, 62 insertions(+)
=20
 diff --git a/meson.build b/meson.build
-index fb96143c37..739b2f7f72 100644
+index 01fd3ffc19..61a872b753 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -595,6 +595,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
+@@ -567,6 +567,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
  endforeach
 =20
  foreach ident : [
@@ -84,10 +87,10 @@ index fb96143c37..739b2f7f72 100644
          ['gettid',            '''#include <sys/types.h>
                                   #include <unistd.h>'''],
 diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
-index e66477f328..2613d1e3f9 100644
+index 5ac9f904a9..99d5122dd7 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
-@@ -19,6 +19,7 @@
+@@ -20,6 +20,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "terminal-util.h"
@@ -96,7 +99,7 @@ index e66477f328..2613d1e3f9 100644
  #define PCI_CLASS_GRAPHICS_CARD 0x30000
 =20
 diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index feda596939..11b4375ed5 100644
+index 18b16ecc0e..d2be79622f 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
 @@ -38,6 +38,7 @@
@@ -105,10 +108,10 @@ index feda596939..11b4375ed5 100644
  #include "xattr-util.h"
 +#include "missing_stdlib.h"
 =20
- static int cg_enumerate_items(const char *controller, const char *path,=
 FILE **_f, const char *item) {
+ static int cg_enumerate_items(const char *controller, const char *path,=
 FILE **ret, const char *item) {
          _cleanup_free_ char *fs =3D NULL;
 diff --git a/src/basic/env-util.c b/src/basic/env-util.c
-index 55ac11a512..7ccb1d7887 100644
+index d3bf73385f..16b17358ca 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
 @@ -19,6 +19,7 @@
@@ -120,7 +123,7 @@ index 55ac11a512..7ccb1d7887 100644
  /* We follow bash for the character set. Different shells have differen=
t rules. */
  #define VALID_BASH_ENV_NAME_CHARS               \
 diff --git a/src/basic/log.c b/src/basic/log.c
-index fc5793139e..515218fca8 100644
+index 1470611a75..9924ec2b9a 100644
 --- a/src/basic/log.c
 +++ b/src/basic/log.c
 @@ -40,6 +40,7 @@
@@ -152,10 +155,10 @@ index 8c76f93eb2..9068bfb4f0 100644
 +  })
 +#endif
 diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
-index 7ad19ee33b..cc1d5e1e5b 100644
+index c770e5ed32..1fd8816cd0 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
-@@ -15,6 +15,7 @@
+@@ -16,6 +16,7 @@
  #include "stat-util.h"
  #include "stdio-util.h"
  #include "user-util.h"
@@ -164,7 +167,7 @@ index 7ad19ee33b..cc1d5e1e5b 100644
  int mkdirat_safe_internal(
                  int dir_fd,
 diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
-index bc74fbef8f..cdb609bb84 100644
+index bf67f7e01a..409f8d8a73 100644
 --- a/src/basic/mountpoint-util.c
 +++ b/src/basic/mountpoint-util.c
 @@ -18,6 +18,7 @@
@@ -176,7 +179,7 @@ index bc74fbef8f..cdb609bb84 100644
  #include "nulstr-util.h"
  #include "parse-util.h"
 diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
-index 3445d31307..d82b4415d9 100644
+index 0430e33e40..f3728de026 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
 @@ -18,6 +18,7 @@
@@ -188,7 +191,7 @@ index 3445d31307..d82b4415d9 100644
  int parse_boolean(const char *v) {
          if (!v)
 diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
-index c99e9d8786..71a917a0b0 100644
+index 4e3d59fc56..726e240df0 100644
 --- a/src/basic/path-lookup.c
 +++ b/src/basic/path-lookup.c
 @@ -16,6 +16,7 @@
@@ -212,7 +215,7 @@ index cab9d0eaea..5f6ca258e9 100644
  static int parse_parts_value_whole(const char *p, const char *symbol) {
          const char *pc, *n;
 diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
-index eea70d8606..ae3abd8402 100644
+index 522d8de1f4..7c129dc0fc 100644
 --- a/src/basic/proc-cmdline.c
 +++ b/src/basic/proc-cmdline.c
 @@ -16,6 +16,7 @@
@@ -224,7 +227,7 @@ index eea70d8606..ae3abd8402 100644
  int proc_cmdline_filter_pid1_args(char **argv, char ***ret) {
          enum {
 diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index bcba5a5208..64a95dd866 100644
+index d7cfcd9105..6cb0ddf575 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
 @@ -12,6 +12,7 @@
@@ -236,7 +239,7 @@ index bcba5a5208..64a95dd866 100644
  int procfs_get_pid_max(uint64_t *ret) {
          _cleanup_free_ char *value =3D NULL;
 diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index b700f364ef..48a26bcec9 100644
+index f9014dc560..1d7840a5b5 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
 @@ -27,6 +27,7 @@
@@ -248,7 +251,7 @@ index b700f364ef..48a26bcec9 100644
  static clockid_t map_clock_id(clockid_t c) {
 =20
 diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
-index 59f02b761a..7496646350 100644
+index 0c0b4f23c7..68fe5ca509 100644
 --- a/src/boot/bless-boot.c
 +++ b/src/boot/bless-boot.c
 @@ -22,6 +22,7 @@
@@ -260,22 +263,22 @@ index 59f02b761a..7496646350 100644
  static char **arg_path =3D NULL;
 =20
 diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
-index b5484eda78..54ed62c790 100644
+index 4237e694c0..05f9d9d9a9 100644
 --- a/src/core/dbus-cgroup.c
 +++ b/src/core/dbus-cgroup.c
-@@ -23,6 +23,7 @@
+@@ -25,6 +25,7 @@
  #include "parse-util.h"
  #include "path-util.h"
  #include "percent-util.h"
 +#include "missing_stdlib.h"
  #include "socket-util.h"
 =20
- BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, task=
s_max_resolve);
+ BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", CGroupTasksMax=
, cgroup_tasks_max_resolve);
 diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
-index f514b8fd12..4febd0d496 100644
+index 4daa1cefd3..2c77901471 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
-@@ -48,6 +48,7 @@
+@@ -42,6 +42,7 @@
  #include "unit-printf.h"
  #include "user-util.h"
  #include "utf8.h"
@@ -284,7 +287,7 @@ index f514b8fd12..4febd0d496 100644
  BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output,=
 ExecOutput);
  static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input=
, ExecInput);
 diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
-index edfa0eb69a..6fd2ec9062 100644
+index d680a64268..e59f48103e 100644
 --- a/src/core/dbus-util.c
 +++ b/src/core/dbus-util.c
 @@ -9,6 +9,7 @@
@@ -296,19 +299,19 @@ index edfa0eb69a..6fd2ec9062 100644
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
 diff --git a/src/core/execute.c b/src/core/execute.c
-index 853e87450f..8ef76de9ab 100644
+index ef0bf88687..bd3da0c401 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -113,6 +113,7 @@
+@@ -72,6 +72,7 @@
  #include "unit-serialize.h"
  #include "user-util.h"
  #include "utmp-wtmp.h"
 +#include "missing_stdlib.h"
 =20
- #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
- #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
+ static bool is_terminal_input(ExecInput i) {
+         return IN_SET(i,
 diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index e843743777..e149807492 100644
+index b8e3f7aadd..8ce8ca68d8 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
 @@ -13,6 +13,7 @@
@@ -320,7 +323,7 @@ index e843743777..e149807492 100644
  #if HAVE_KMOD
  #include "module-util.h"
 diff --git a/src/core/service.c b/src/core/service.c
-index 9ad3c3d995..b112d64919 100644
+index b9eb40c555..268fe7573b 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -45,6 +45,7 @@
@@ -332,7 +335,7 @@ index 9ad3c3d995..b112d64919 100644
  #define service_spawn(...) service_spawn_internal(__func__, __VA_ARGS__=
)
 =20
 diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacu=
um.c
-index c6e201ecf2..ab034475e2 100644
+index 7e0c98cb7d..978a7f5874 100644
 --- a/src/coredump/coredump-vacuum.c
 +++ b/src/coredump/coredump-vacuum.c
 @@ -17,6 +17,7 @@
@@ -344,7 +347,7 @@ index c6e201ecf2..ab034475e2 100644
  #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)        =
   /* 1 MiB */
  #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)=
   /* 4 GiB */
 diff --git a/src/fstab-generator/fstab-generator.c b/src/fstab-generator=
/fstab-generator.c
-index efc553b698..acea922311 100644
+index 016f3baa7f..b1def81313 100644
 --- a/src/fstab-generator/fstab-generator.c
 +++ b/src/fstab-generator/fstab-generator.c
 @@ -37,6 +37,7 @@
@@ -356,10 +359,10 @@ index efc553b698..acea922311 100644
  typedef enum MountPointFlags {
          MOUNT_NOAUTO    =3D 1 << 0,
 diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remo=
te/journal-remote-main.c
-index 7df264fb53..9463a0e9fb 100644
+index da0f20d3ce..f22ce41908 100644
 --- a/src/journal-remote/journal-remote-main.c
 +++ b/src/journal-remote/journal-remote-main.c
-@@ -26,6 +26,7 @@
+@@ -27,6 +27,7 @@
  #include "stat-util.h"
  #include "string-table.h"
  #include "strv.h"
@@ -368,7 +371,7 @@ index 7df264fb53..9463a0e9fb 100644
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
 diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index da0fac548e..c1c043e0e0 100644
+index 7f3dcd56a4..41b7cbaaf1 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
 @@ -77,6 +77,7 @@
@@ -380,7 +383,7 @@ index da0fac548e..c1c043e0e0 100644
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages process=
ed */
 diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus=
/bus-message.c
-index 9719f97c02..75decd9834 100644
+index ff0228081f..9066fcb133 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
 @@ -19,6 +19,7 @@
@@ -392,7 +395,7 @@ index 9719f97c02..75decd9834 100644
  static int message_append_basic(sd_bus_message *m, char type, const voi=
d *p, const void **stored);
  static int message_parse_fields(sd_bus_message *m);
 diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus=
/bus-objects.c
-index 2ad7a9993d..bba72f99f4 100644
+index c25c40ff37..57a5da704f 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -11,6 +11,7 @@
@@ -404,10 +407,10 @@ index 2ad7a9993d..bba72f99f4 100644
  static int node_vtable_get_userdata(
                  sd_bus *bus,
 diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/=
bus-socket.c
-index 64037e4fe0..9b9ce0aaa9 100644
+index 3c59d0d615..746922d46f 100644
 --- a/src/libsystemd/sd-bus/bus-socket.c
 +++ b/src/libsystemd/sd-bus/bus-socket.c
-@@ -28,6 +28,7 @@
+@@ -29,6 +29,7 @@
  #include "string-util.h"
  #include "user-util.h"
  #include "utf8.h"
@@ -416,7 +419,7 @@ index 64037e4fe0..9b9ce0aaa9 100644
  #define SNDBUF_SIZE (8*1024*1024)
 =20
 diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-b=
us.c
-index f6a5e4aa06..b36faa79a3 100644
+index 4a0259f8bb..aaa90d2223 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
 @@ -46,6 +46,7 @@
@@ -428,19 +431,19 @@ index f6a5e4aa06..b36faa79a3 100644
  #define log_debug_bus_message(m)                                       =
  \
          do {                                                           =
  \
 diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd=
/sd-bus/test-bus-benchmark.c
-index 1eb6edd329..d434a3c178 100644
+index d988588de0..458df8df9a 100644
 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
 +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
-@@ -13,6 +13,7 @@
- #include "missing_resource.h"
+@@ -14,6 +14,7 @@
  #include "string-util.h"
+ #include "tests.h"
  #include "time-util.h"
 +#include "missing_stdlib.h"
 =20
  #define MAX_SIZE (2*1024*1024)
 =20
 diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-=
journal/sd-journal.c
-index 9947947ef2..8dc6f93159 100644
+index 6b9ff0a4ed..4a5027ad0f 100644
 --- a/src/libsystemd/sd-journal/sd-journal.c
 +++ b/src/libsystemd/sd-journal/sd-journal.c
 @@ -44,6 +44,7 @@
@@ -452,19 +455,19 @@ index 9947947ef2..8dc6f93159 100644
  #define JOURNAL_FILES_RECHECK_USEC (2 * USEC_PER_SEC)
 =20
 diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
-index ba2fca32c6..e1f9caa13b 100644
+index b8da266e27..4bb8dd9496 100644
 --- a/src/login/pam_systemd.c
 +++ b/src/login/pam_systemd.c
-@@ -34,6 +34,7 @@
- #include "locale-util.h"
+@@ -35,6 +35,7 @@
  #include "login-util.h"
  #include "macro.h"
+ #include "missing_syscall.h"
 +#include "missing_stdlib.h"
  #include "pam-util.h"
  #include "parse-util.h"
  #include "path-util.h"
 diff --git a/src/network/generator/network-generator.c b/src/network/gen=
erator/network-generator.c
-index 1090934bfc..69a77f66e2 100644
+index 48527a2c73..9777fe0561 100644
 --- a/src/network/generator/network-generator.c
 +++ b/src/network/generator/network-generator.c
 @@ -14,6 +14,7 @@
@@ -476,7 +479,7 @@ index 1090934bfc..69a77f66e2 100644
  /*
    # .network
 diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
-index 05bde1c756..aa29587868 100644
+index 161b1c1c70..ba1c459f78 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -16,6 +16,7 @@
@@ -500,7 +503,7 @@ index c64e79bdff..eda26b0b9a 100644
  static void setup_logging_once(void) {
          static pthread_once_t once =3D PTHREAD_ONCE_INIT;
 diff --git a/src/portable/portable.c b/src/portable/portable.c
-index 7811833fac..c6414da91c 100644
+index d4b448a627..bb26623565 100644
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
 @@ -40,6 +40,7 @@
@@ -512,7 +515,7 @@ index 7811833fac..c6414da91c 100644
  /* Markers used in the first line of our 20-portable.conf unit file dro=
p-in to determine, that a) the unit file was
   * dropped there by the portable service logic and b) for which image i=
t was dropped there. */
 diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
-index 2638e985fb..82c903fd66 100644
+index afa537f160..32ccee4ae5 100644
 --- a/src/resolve/resolvectl.c
 +++ b/src/resolve/resolvectl.c
 @@ -48,6 +48,7 @@
@@ -524,7 +527,7 @@ index 2638e985fb..82c903fd66 100644
  static int arg_family =3D AF_UNSPEC;
  static int arg_ifindex =3D 0;
 diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-proper=
ties.c
-index 8b4f66b22e..5926e4c61b 100644
+index 53e5d6b99f..851ecd5644 100644
 --- a/src/shared/bus-get-properties.c
 +++ b/src/shared/bus-get-properties.c
 @@ -4,6 +4,7 @@
@@ -548,10 +551,10 @@ index 8b462b5627..183ce1c18e 100644
  struct CGroupInfo {
          char *cgroup_path;
 diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
-index 1e95e36678..640ee031d5 100644
+index 4ee9706847..30c8084847 100644
 --- a/src/shared/bus-unit-util.c
 +++ b/src/shared/bus-unit-util.c
-@@ -51,6 +51,7 @@
+@@ -50,6 +50,7 @@
  #include "unit-def.h"
  #include "user-util.h"
  #include "utf8.h"
@@ -560,7 +563,7 @@ index 1e95e36678..640ee031d5 100644
  int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
          assert(message);
 diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
-index d09ec5148d..f38a8f7cc1 100644
+index 4123152d93..74f148c8b4 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
 @@ -24,6 +24,7 @@
@@ -572,7 +575,7 @@ index d09ec5148d..f38a8f7cc1 100644
  static int name_owner_change_callback(sd_bus_message *m, void *userdata=
, sd_bus_error *ret_error) {
          sd_event *e =3D ASSERT_PTR(userdata);
 diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
-index 620b156563..5ee5b09186 100644
+index b41c9b06ca..e69050a507 100644
 --- a/src/shared/dns-domain.c
 +++ b/src/shared/dns-domain.c
 @@ -18,6 +18,7 @@
@@ -584,7 +587,7 @@ index 620b156563..5ee5b09186 100644
  int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLab=
elFlags flags) {
          const char *n;
 diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer=
.c
-index d9eabec886..534c6cf7e3 100644
+index 83e9834bbf..74eaae6f5e 100644
 --- a/src/shared/journal-importer.c
 +++ b/src/shared/journal-importer.c
 @@ -16,6 +16,7 @@
@@ -596,7 +599,7 @@ index d9eabec886..534c6cf7e3 100644
  enum {
          IMPORTER_STATE_LINE =3D 0,    /* waiting to read, or reading li=
ne */
 diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
-index b72e516c8d..6e832b74c3 100644
+index a5d04003bd..10392c132d 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
 @@ -41,6 +41,7 @@
@@ -608,7 +611,7 @@ index b72e516c8d..6e832b74c3 100644
  /* up to three lines (each up to 100 characters) or 300 characters, whi=
chever is less */
  #define PRINT_LINE_THRESHOLD 3
 diff --git a/src/shared/pager.c b/src/shared/pager.c
-index 6ed35a3ca9..99d9d36140 100644
+index 19deefab56..6b6d0af1a0 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
 @@ -25,6 +25,7 @@
@@ -620,7 +623,7 @@ index 6ed35a3ca9..99d9d36140 100644
  static pid_t pager_pid =3D 0;
 =20
 diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-=
proxyd.c
-index 821049e667..08a5bdae3d 100644
+index 287fd6c181..8f8d5493da 100644
 --- a/src/socket-proxy/socket-proxyd.c
 +++ b/src/socket-proxy/socket-proxyd.c
 @@ -27,6 +27,7 @@
@@ -632,7 +635,7 @@ index 821049e667..08a5bdae3d 100644
  #define BUFFER_SIZE (256 * 1024)
 =20
 diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
-index 9d71db6ae1..a9938c1e6e 100644
+index f884008660..987e180697 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
 @@ -7,6 +7,7 @@
@@ -643,8 +646,20 @@ index 9d71db6ae1..a9938c1e6e 100644
  #include "tests.h"
 =20
  TEST(hexchar) {
+diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net_=
id.c
+index 91b40088f4..f528a46b8e 100644
+--- a/src/udev/udev-builtin-net_id.c
++++ b/src/udev/udev-builtin-net_id.c
+@@ -39,6 +39,7 @@
+ #include "strv.h"
+ #include "strxcpyx.h"
+ #include "udev-builtin.h"
++#include "missing_stdlib.h"
+=20
+ #define ONBOARD_14BIT_INDEX_MAX ((1U << 14) - 1)
+ #define ONBOARD_16BIT_INDEX_MAX ((1U << 16) - 1)
 diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-pat=
h_id.c
-index 8e4d57ee72..6b4555b4d5 100644
+index 467c9a6ad3..f74dae60af 100644
 --- a/src/udev/udev-builtin-path_id.c
 +++ b/src/udev/udev-builtin-path_id.c
 @@ -24,6 +24,7 @@
@@ -656,22 +671,22 @@ index 8e4d57ee72..6b4555b4d5 100644
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
 diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
-index ec4ad30824..bc40303a46 100644
+index ed22c8b679..19ebe20237 100644
 --- a/src/udev/udev-event.c
 +++ b/src/udev/udev-event.c
-@@ -34,6 +34,7 @@
+@@ -16,6 +16,7 @@
  #include "udev-util.h"
  #include "udev-watch.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
 =20
- typedef struct Spawn {
-         sd_device *device;
+ UdevEvent *udev_event_new(sd_device *dev, usec_t exec_delay_usec, sd_ne=
tlink *rtnl, int log_level) {
+         UdevEvent *event;
 diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index 5bd09a64d1..0ce79f815c 100644
+index 5f12002394..febe345b4c 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
-@@ -35,6 +35,7 @@
+@@ -41,6 +41,7 @@
  #include "udev-util.h"
  #include "user-util.h"
  #include "virt.h"
@@ -680,5 +695,5 @@ index 5bd09a64d1..0ce79f815c 100644
  #define RULES_DIRS ((const char* const*) CONF_PATHS_STRV("udev/rules.d"=
))
 =20
 --=20
-2.39.2
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-fail-if-GLOB_BR=
ACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd=
/0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
similarity index 90%
rename from meta/recipes-core/systemd/systemd/0012-don-t-fail-if-GLOB_BRA=
CE-and-GLOB_ALTDIRFUNC-is-not-.patch
rename to meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE=
-and-GLOB_ALTDIRFUNC-is-not-.patch
index 0d69e8e9cd..15877bea88 100644
--- a/meta/recipes-core/systemd/systemd/0012-don-t-fail-if-GLOB_BRACE-and=
-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0004-don-t-fail-if-GLOB_BRACE-and=
-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,7 +1,8 @@
-From 747ff78ecda6afe01c7eab4d7c27aea6af810c86 Mon Sep 17 00:00:00 2001
+From 5325ab5813617f35f03806ec420829dde7104387 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
-Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not def=
ined
+Subject: [PATCH 04/22] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is n=
ot
+ defined
=20
 If the standard library doesn't provide brace
 expansion users just won't get it.
@@ -23,7 +24,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  3 files changed, 38 insertions(+)
=20
 diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
-index fd60a6eda2..c73edc41ea 100644
+index 802ca8c655..23818a67c6 100644
 --- a/src/basic/glob-util.c
 +++ b/src/basic/glob-util.c
 @@ -12,6 +12,12 @@
@@ -114,7 +115,7 @@ index 9b3e73cce0..3790ba3be5 100644
 =20
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
 diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index 458aed7054..2cf24b38c0 100644
+index 230ec09b97..2cc5f391d7 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
 @@ -73,6 +73,12 @@
@@ -130,9 +131,9 @@ index 458aed7054..2cf24b38c0 100644
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -2355,7 +2361,9 @@ finish:
+@@ -2434,7 +2440,9 @@ finish:
 =20
- static int glob_item(Item *i, action_t action) {
+ static int glob_item(Context *c, Item *i, action_t action) {
          _cleanup_globfree_ glob_t g =3D {
 +#ifdef GLOB_ALTDIRFUNC
                  .gl_opendir =3D (void *(*)(const char *)) opendir_nomod=
,
@@ -140,9 +141,9 @@ index 458aed7054..2cf24b38c0 100644
          };
          int r =3D 0, k;
 =20
-@@ -2375,7 +2383,9 @@ static int glob_item(Item *i, action_t action) {
+@@ -2461,7 +2469,9 @@ static int glob_item_recursively(
+                 fdaction_t action) {
 =20
- static int glob_item_recursively(Item *i, fdaction_t action) {
          _cleanup_globfree_ glob_t g =3D {
 +#ifdef GLOB_ALTDIRFUNC
                  .gl_opendir =3D (void *(*)(const char *)) opendir_nomod=
,
@@ -151,5 +152,5 @@ index 458aed7054..2cf24b38c0 100644
          int r =3D 0, k;
 =20
 --=20
-2.39.2
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0013-add-missing-FTW_-macr=
os-for-musl.patch b/meta/recipes-core/systemd/systemd/0005-add-missing-FT=
W_-macros-for-musl.patch
similarity index 84%
rename from meta/recipes-core/systemd/systemd/0013-add-missing-FTW_-macro=
s-for-musl.patch
rename to meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-=
for-musl.patch
index d6aaadc006..a1dfca22cd 100644
--- a/meta/recipes-core/systemd/systemd/0013-add-missing-FTW_-macros-for-=
musl.patch
+++ b/meta/recipes-core/systemd/systemd/0005-add-missing-FTW_-macros-for-=
musl.patch
@@ -1,7 +1,7 @@
-From efd7b41cf270c7b07ee3b9aec0fedd8e52dd422f Mon Sep 17 00:00:00 2001
+From dad7f897c0de654fa5592fda3e90f874639849f9 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
-Subject: [PATCH] add missing FTW_ macros for musl
+Subject: [PATCH 05/22] add missing FTW_ macros for musl
=20
 This is to avoid build failures like below for musl.
=20
@@ -28,10 +28,10 @@ index 6c0456349d..73a5b90e3c 100644
 +#define FTW_CONTINUE 0
 +#endif
 diff --git a/src/test/test-recurse-dir.c b/src/test/test-recurse-dir.c
-index 2c2120b136..bc60a178a2 100644
+index 8684d064ec..70fc2b5376 100644
 --- a/src/test/test-recurse-dir.c
 +++ b/src/test/test-recurse-dir.c
-@@ -6,6 +6,7 @@
+@@ -8,6 +8,7 @@
  #include "recurse-dir.h"
  #include "strv.h"
  #include "tests.h"
@@ -40,5 +40,5 @@ index 2c2120b136..bc60a178a2 100644
  static char **list_nftw =3D NULL;
 =20
 --=20
-2.39.2
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-han=
dling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t=
-for-handling-rlim_t.patch
similarity index 83%
rename from meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-hand=
ling-rlim_t.patch
rename to meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handli=
ng-rlim_t.patch
index 2071f4fb20..4be14b72ec 100644
--- a/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-handling-r=
lim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Use-uintmax_t-for-handling-r=
lim_t.patch
@@ -1,7 +1,7 @@
-From 60f7d2c62bc3718023df93c01688d3ee1625d64d Mon Sep 17 00:00:00 2001
+From 96e975a2412a20e5f80bd3ab144057d275eb8597 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
-Subject: [PATCH] Use uintmax_t for handling rlim_t
+Subject: [PATCH 06/22] Use uintmax_t for handling rlim_t
=20
 PRIu{32,64} is not right format to represent rlim_t type
 therefore use %ju and typecast the rlim_t variables to
@@ -26,9 +26,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/core/execute.c      |  4 ++--
  3 files changed, 9 insertions(+), 15 deletions(-)
=20
+diff --git a/src/basic/format-util.h b/src/basic/format-util.h
+index 8719df3e29..9becc96066 100644
 --- a/src/basic/format-util.h
 +++ b/src/basic/format-util.h
-@@ -34,13 +34,7 @@ assert_cc(sizeof(gid_t) =3D=3D sizeof(uint32
+@@ -34,13 +34,7 @@ assert_cc(sizeof(gid_t) =3D=3D sizeof(uint32_t));
  #  error Unknown timex member size
  #endif
 =20
@@ -43,9 +45,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 =20
  #if SIZEOF_DEV_T =3D=3D 8
  #  define DEV_FMT "%" PRIu64
+diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
+index c1f0b2b974..61c5412582 100644
 --- a/src/basic/rlimit-util.c
 +++ b/src/basic/rlimit-util.c
-@@ -44,7 +44,7 @@ int setrlimit_closest(int resource, cons
+@@ -44,7 +44,7 @@ int setrlimit_closest(int resource, const struct rlimi=
t *rlim) {
              fixed.rlim_max =3D=3D highest.rlim_max)
                  return 0;
 =20
@@ -54,7 +58,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 =20
          return RET_NERRNO(setrlimit(resource, &fixed));
  }
-@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *r
+@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *rl, char **=
ret) {
          if (rl->rlim_cur >=3D RLIM_INFINITY && rl->rlim_max >=3D RLIM_I=
NFINITY)
                  r =3D free_and_strdup(&s, "infinity");
          else if (rl->rlim_cur >=3D RLIM_INFINITY)
@@ -72,7 +76,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
          if (r < 0)
                  return -ENOMEM;
 =20
-@@ -407,7 +407,7 @@ int rlimit_nofile_safe(void) {
+@@ -422,7 +422,7 @@ int rlimit_nofile_safe(void) {
          rl.rlim_max =3D MIN(rl.rlim_max, (rlim_t) read_nr_open());
          rl.rlim_cur =3D MIN((rlim_t) FD_SETSIZE, rl.rlim_max);
          if (setrlimit(RLIMIT_NOFILE, &rl) < 0)
@@ -81,9 +85,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 =20
          return 1;
  }
+diff --git a/src/core/execute.c b/src/core/execute.c
+index bd3da0c401..df1870fd2f 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -6707,9 +6707,9 @@ void exec_context_dump(const ExecContext
+@@ -1045,9 +1045,9 @@ void exec_context_dump(const ExecContext *c, FILE*=
 f, const char *prefix) {
          for (unsigned i =3D 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
@@ -95,3 +101,6 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
                  }
 =20
          if (c->ioprio_set) {
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0016-don-t-pass-AT_SYMLINK=
_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/000=
7-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
similarity index 95%
rename from meta/recipes-core/systemd/systemd/0016-don-t-pass-AT_SYMLINK_=
NOFOLLOW-flag-to-faccessat.patch
rename to meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NO=
FOLLOW-flag-to-faccessat.patch
index 543fba7cdb..8d6084239e 100644
--- a/meta/recipes-core/systemd/systemd/0016-don-t-pass-AT_SYMLINK_NOFOLL=
OW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-pass-AT_SYMLINK_NOFOLL=
OW-flag-to-faccessat.patch
@@ -1,7 +1,7 @@
-From 26b02348e39fe72b73dd61bba8a0cefb0352717d Mon Sep 17 00:00:00 2001
+From 4842cff4f1329f0b5034b529d56f8ad1f234ac4c Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
-Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
+Subject: [PATCH 07/22] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat(=
)
=20
 Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right
 thing to do and it's not portable (not supported by musl). See:
@@ -31,7 +31,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  2 files changed, 23 insertions(+), 4 deletions(-)
=20
 diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
-index 932d003f19..33215dbf5f 100644
+index 1023ab73ca..c78ff6f27f 100644
 --- a/src/basic/fs-util.h
 +++ b/src/basic/fs-util.h
 @@ -49,8 +49,27 @@ int futimens_opath(int fd, const struct timespec ts[2=
]);
@@ -64,7 +64,7 @@ index 932d003f19..33215dbf5f 100644
  int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid,=
 gid_t gid, mode_t mode);
 =20
 diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index be6dd1654a..2726dc946a 100644
+index 569ef466c3..7ae921a113 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
 @@ -145,7 +145,7 @@ int base_filesystem_create_fd(int fd, const char *ro=
ot, uid_t uid, gid_t gid) {
@@ -95,5 +95,5 @@ index be6dd1654a..2726dc946a 100644
                                  }
 =20
 --=20
-2.39.2
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0017-Define-glibc-compatib=
le-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd=
/0008-Define-glibc-compatible-basename-for-non-glibc-syste.patch
similarity index 70%
rename from meta/recipes-core/systemd/systemd/0017-Define-glibc-compatibl=
e-basename-for-non-glibc-syste.patch
rename to meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-=
basename-for-non-glibc-syste.patch
index 24dd6b0df1..c1a8bb19fe 100644
--- a/meta/recipes-core/systemd/systemd/0017-Define-glibc-compatible-base=
name-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0008-Define-glibc-compatible-base=
name-for-non-glibc-syste.patch
@@ -1,7 +1,8 @@
-From fdc7fb940bb41020271b9db41d5608004efdbde5 Mon Sep 17 00:00:00 2001
+From bab07e779ff23d5593bb118efaaa31b60a6dce87 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
-Subject: [PATCH] Define glibc compatible basename() for non-glibc system=
s
+Subject: [PATCH 08/22] Define glibc compatible basename() for non-glibc
+ systems
=20
 Fixes builds with musl, even though systemd is adamant about
 using non-posix basename implementation, we have a way out
@@ -10,9 +11,11 @@ Upstream-Status: Inappropriate [musl specific]
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/machine/machine-dbus.c | 5 +++++
- 1 file changed, 5 insertions(+)
+ src/basic/string-util.h | 4 ++++
+ 1 file changed, 4 insertions(+)
=20
+diff --git a/src/basic/string-util.h b/src/basic/string-util.h
+index b6d8be3083..0a29036c4c 100644
 --- a/src/basic/string-util.h
 +++ b/src/basic/string-util.h
 @@ -26,6 +26,10 @@
@@ -26,3 +29,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  static inline char* strstr_ptr(const char *haystack, const char *needle=
) {
          if (!haystack || !needle)
                  return NULL;
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0018-Do-not-disable-buffer=
ing-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd=
/0009-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
similarity index 82%
rename from meta/recipes-core/systemd/systemd/0018-Do-not-disable-bufferi=
ng-when-writing-to-oom_score_a.patch
rename to meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering=
-when-writing-to-oom_score_a.patch
index 8162bc2c57..3ff0177ae3 100644
--- a/meta/recipes-core/systemd/systemd/0018-Do-not-disable-buffering-whe=
n-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0009-Do-not-disable-buffering-whe=
n-writing-to-oom_score_a.patch
@@ -1,7 +1,7 @@
-From 32fd0dc67b6df531f0769dbb099dbe8f30c28514 Mon Sep 17 00:00:00 2001
+From 25093c5017725b8577c444dfea0f42ad85b43522 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
-Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
+Subject: [PATCH 09/22] Do not disable buffering when writing to oom_scor=
e_adj
=20
 On musl, disabling buffering when writing to oom_score_adj will
 cause the following error.
@@ -24,10 +24,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 0747c14c1c..8d0c5aae92 100644
+index 201c5596ae..ea51595b6c 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
-@@ -1516,7 +1516,7 @@ int set_oom_score_adjust(int value) {
+@@ -1716,7 +1716,7 @@ int set_oom_score_adjust(int value) {
          xsprintf(t, "%i", value);
 =20
          return write_string_file("/proc/self/oom_score_adj", t,
@@ -37,5 +37,5 @@ index 0747c14c1c..8d0c5aae92 100644
 =20
  int get_oom_score_adjust(int *ret) {
 --=20
-2.39.2
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0019-distinguish-XSI-compl=
iant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd=
/0010-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
similarity index 89%
rename from meta/recipes-core/systemd/systemd/0019-distinguish-XSI-compli=
ant-strerror_r-from-GNU-specif.patch
rename to meta/recipes-core/systemd/systemd/0010-distinguish-XSI-complian=
t-strerror_r-from-GNU-specif.patch
index f6d908f947..cf59ac7d06 100644
--- a/meta/recipes-core/systemd/systemd/0019-distinguish-XSI-compliant-st=
rerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0010-distinguish-XSI-compliant-st=
rerror_r-from-GNU-specif.patch
@@ -1,7 +1,7 @@
-From ed46afcbc6bc1f6277a0a54c3db8cf1b056bca1e Mon Sep 17 00:00:00 2001
+From 2adbe9773cd65c48eec9df96868d4a738927c8d9 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
-Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
+Subject: [PATCH 10/22] distinguish XSI-compliant strerror_r from GNU-spe=
cifi
  strerror_r
=20
 XSI-compliant strerror_r and GNU-specifi strerror_r are different.
@@ -24,7 +24,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  2 files changed, 15 insertions(+), 1 deletion(-)
=20
 diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/b=
us-error.c
-index 413e2dd43f..805e5da0c0 100644
+index 77b2e1a0fd..fdba0e0142 100644
 --- a/src/libsystemd/sd-bus/bus-error.c
 +++ b/src/libsystemd/sd-bus/bus-error.c
 @@ -408,7 +408,12 @@ static void bus_error_strerror(sd_bus_error *e, int=
 error) {
@@ -55,10 +55,10 @@ index 413e2dd43f..805e5da0c0 100644
 =20
  static bool map_ok(const sd_bus_error_map *map) {
 diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/s=
d-journal/journal-send.c
-index 136ebcb153..8a75ba4ecd 100644
+index 69a2eb6404..1561859650 100644
 --- a/src/libsystemd/sd-journal/journal-send.c
 +++ b/src/libsystemd/sd-journal/journal-send.c
-@@ -360,7 +360,12 @@ static int fill_iovec_perror_and_send(const char *m=
essage, int skip, struct iove
+@@ -361,7 +361,12 @@ static int fill_iovec_perror_and_send(const char *m=
essage, int skip, struct iove
                  char* j;
 =20
                  errno =3D 0;
@@ -72,5 +72,5 @@ index 136ebcb153..8a75ba4ecd 100644
                          char error[STRLEN("ERRNO=3D") + DECIMAL_STR_MAX=
(int) + 1];
 =20
 --=20
-2.39.2
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0020-avoid-redefinition-of=
-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0011-av=
oid-redefinition-of-prctl_mm_map-structure.patch
similarity index 79%
rename from meta/recipes-core/systemd/systemd/0020-avoid-redefinition-of-=
prctl_mm_map-structure.patch
rename to meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-pr=
ctl_mm_map-structure.patch
index e5f017347c..e481b2e2e4 100644
--- a/meta/recipes-core/systemd/systemd/0020-avoid-redefinition-of-prctl_=
mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0011-avoid-redefinition-of-prctl_=
mm_map-structure.patch
@@ -1,7 +1,7 @@
-From 277b680d07a178b8278862b60417052d05c1376f Mon Sep 17 00:00:00 2001
+From 49c446cfb78cf74a909bed8c3798b77a5469866a Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
-Subject: [PATCH] avoid redefinition of prctl_mm_map structure
+Subject: [PATCH 11/22] avoid redefinition of prctl_mm_map structure
=20
 Fix the following compile failure:
 error: redefinition of 'struct prctl_mm_map'
@@ -14,7 +14,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 2 insertions(+)
=20
 diff --git a/src/basic/missing_prctl.h b/src/basic/missing_prctl.h
-index ab851306ba..5547cad875 100644
+index 7d9e395c92..88c2d7dfac 100644
 --- a/src/basic/missing_prctl.h
 +++ b/src/basic/missing_prctl.h
 @@ -1,7 +1,9 @@
@@ -28,5 +28,5 @@ index ab851306ba..5547cad875 100644
  /* 58319057b7847667f0c9585b9de0e8932b0fdb08 (4.3) */
  #ifndef PR_CAP_AMBIENT
 --=20
-2.39.2
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer=
-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0012-do-not-d=
isable-buffer-in-writing-files.patch
similarity index 55%
rename from meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-=
in-writing-files.patch
rename to meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in=
-writing-files.patch
index c85087219c..66be79077e 100644
--- a/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-wri=
ting-files.patch
+++ b/meta/recipes-core/systemd/systemd/0012-do-not-disable-buffer-in-wri=
ting-files.patch
@@ -1,7 +1,7 @@
-From aa6e5588e6d01c12e2f101d140cc710ab199df16 Mon Sep 17 00:00:00 2001
+From e4885a8e60f883d9217e26e1db3754c2906aca31 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
-Subject: [PATCH] do not disable buffer in writing files
+Subject: [PATCH 12/22] do not disable buffer in writing files
=20
 Do not disable buffer in writing files, otherwise we get
 failure at boot for musl like below.
@@ -19,6 +19,8 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 [rebased for systemd 254]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[rebased for systemd 255.1]
 ---
  src/basic/cgroup-util.c              | 12 ++++++------
  src/basic/namespace-util.c           |  4 ++--
@@ -34,17 +36,21 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
  src/nspawn/nspawn.c                  |  6 +++---
  src/shared/binfmt-util.c             |  2 +-
  src/shared/cgroup-setup.c            |  4 ++--
- src/shared/coredump-util.c           |  2 +-
- src/shared/sleep-util.c              |  4 ++--
+ src/shared/coredump-util.c           |  4 ++--
+ src/shared/hibernate-util.c          |  4 ++--
  src/shared/smack-util.c              |  2 +-
+ src/shared/watchdog.c                |  2 +-
  src/sleep/sleep.c                    |  4 ++--
+ src/storagetm/storagetm.c            | 24 ++++++++++++------------
  src/udev/udev-rules.c                |  1 -
  src/vconsole/vconsole-setup.c        |  2 +-
- 20 files changed, 36 insertions(+), 37 deletions(-)
+ 22 files changed, 50 insertions(+), 51 deletions(-)
=20
+diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
+index d2be79622f..e65fecb68d 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -400,7 +400,7 @@ int cg_kill_kernel_sigkill(const char *c
+@@ -417,7 +417,7 @@ int cg_kill_kernel_sigkill(const char *path) {
          if (r < 0)
                  return r;
 =20
@@ -53,7 +59,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
 =20
-@@ -806,7 +806,7 @@ int cg_install_release_agent(const char
+@@ -843,7 +843,7 @@ int cg_install_release_agent(const char *controller,=
 const char *agent) {
 =20
          sc =3D strstrip(contents);
          if (isempty(sc)) {
@@ -62,7 +68,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -824,7 +824,7 @@ int cg_install_release_agent(const char
+@@ -861,7 +861,7 @@ int cg_install_release_agent(const char *controller,=
 const char *agent) {
 =20
          sc =3D strstrip(contents);
          if (streq(sc, "0")) {
@@ -71,7 +77,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (r < 0)
                          return r;
 =20
-@@ -851,7 +851,7 @@ int cg_uninstall_release_agent(const cha
+@@ -888,7 +888,7 @@ int cg_uninstall_release_agent(const char *controlle=
r) {
          if (r < 0)
                  return r;
 =20
@@ -80,7 +86,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
 =20
-@@ -861,7 +861,7 @@ int cg_uninstall_release_agent(const cha
+@@ -898,7 +898,7 @@ int cg_uninstall_release_agent(const char *controlle=
r) {
          if (r < 0)
                  return r;
 =20
@@ -89,7 +95,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
 =20
-@@ -1764,7 +1764,7 @@ int cg_set_attribute(const char *control
+@@ -1814,7 +1814,7 @@ int cg_set_attribute(const char *controller, const=
 char *path, const char *attri
          if (r < 0)
                  return r;
 =20
@@ -98,9 +104,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
  }
 =20
  int cg_get_attribute(const char *controller, const char *path, const ch=
ar *attribute, char **ret) {
+diff --git a/src/basic/namespace-util.c b/src/basic/namespace-util.c
+index 2101f617ad..63817bae17 100644
 --- a/src/basic/namespace-util.c
 +++ b/src/basic/namespace-util.c
-@@ -227,12 +227,12 @@ int userns_acquire(const char *uid_map,
+@@ -227,12 +227,12 @@ int userns_acquire(const char *uid_map, const char=
 *gid_map) {
                  freeze();
 =20
          xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
@@ -115,9 +123,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m"=
);
 =20
+diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
+index 6cb0ddf575..247cf9e1d1 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limi
+@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
           * decrease it, as threads-max is the much more relevant sysctl=
. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since=
 PID 0 is not a valid PID */
@@ -133,9 +143,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
          if (r < 0) {
                  uint64_t threads_max;
 =20
+diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
+index b66a6622ae..8d1c93008a 100644
 --- a/src/basic/sysctl-util.c
 +++ b/src/basic/sysctl-util.c
-@@ -58,7 +58,7 @@ int sysctl_write(const char *property, c
+@@ -58,7 +58,7 @@ int sysctl_write(const char *property, const char *val=
ue) {
 =20
          log_debug("Setting '%s' to '%s'", p, value);
 =20
@@ -144,6 +156,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
  }
 =20
  int sysctl_writef(const char *property, const char *format, ...) {
+diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
+index d21f3f79ff..258607cc7e 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
 @@ -30,7 +30,7 @@ static bool arg_unregister =3D false;
@@ -155,7 +169,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
  }
 =20
  static int apply_rule(const char *filename, unsigned line, const char *=
rule) {
-@@ -58,7 +58,7 @@ static int apply_rule(const char *filena
+@@ -58,7 +58,7 @@ static int apply_rule(const char *filename, unsigned l=
ine, const char *rule) {
          if (r >=3D 0)
                  log_debug("%s:%u: Rule '%s' deleted.", filename, line, =
rulename);
 =20
@@ -164,7 +178,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
          if (r < 0)
                  return log_error_errno(r, "%s:%u: Failed to add binary =
format '%s': %m",
                                         filename, line, rulename);
-@@ -244,7 +244,7 @@ static int run(int argc, char *argv[]) {
+@@ -248,7 +248,7 @@ static int run(int argc, char *argv[]) {
                          return r;
 =20
                  /* Flush out all rules */
@@ -173,9 +187,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
                  if (r < 0)
                          log_warning_errno(r, "Failed to flush binfmt_mi=
sc rules, ignoring: %m");
                  else
+diff --git a/src/core/cgroup.c b/src/core/cgroup.c
+index 61ac4df1a6..ea18970196 100644
 --- a/src/core/cgroup.c
 +++ b/src/core/cgroup.c
-@@ -4349,7 +4349,7 @@ int unit_cgroup_freezer_action(Unit *u,
+@@ -4578,7 +4578,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAct=
ion action) {
                          u->freezer_state =3D FREEZER_THAWING;
          }
 =20
@@ -184,9 +200,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
          if (r < 0)
                  return r;
 =20
+diff --git a/src/core/main.c b/src/core/main.c
+index 3f71cc0947..0e5aec3e9e 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1737,7 +1737,7 @@ static void initialize_core_pattern(bool
+@@ -1678,7 +1678,7 @@ static void initialize_core_pattern(bool skip_setu=
p) {
          if (getpid_cached() !=3D 1)
                  return;
 =20
@@ -195,9 +213,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
          if (r < 0)
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys=
/kernel/core_pattern, ignoring: %m",
                                    arg_early_core_pattern);
+diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
+index 7ea902b6f9..1aef2988d0 100644
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
-@@ -319,17 +319,17 @@ int mac_smack_setup(bool *loaded_policy)
+@@ -321,17 +321,17 @@ int mac_smack_setup(bool *loaded_policy) {
          }
 =20
  #if HAVE_SMACK_RUN_LABEL
@@ -219,6 +239,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
          if (r < 0)
                  log_warning_errno(r, "Failed to set SMACK netlabel rule=
 \"127.0.0.1 -CIPSO\": %m");
  #endif
+diff --git a/src/home/homework.c b/src/home/homework.c
+index 066483e342..5f92dd7064 100644
 --- a/src/home/homework.c
 +++ b/src/home/homework.c
 @@ -278,7 +278,7 @@ static void drop_caches_now(void) {
@@ -230,9 +252,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
          if (r < 0)
                  log_warning_errno(r, "Failed to drop caches, ignoring: =
%m");
          else
+diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-de=
vice/sd-device.c
+index 2fbc619a34..09d9591e37 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -2515,7 +2515,7 @@ _public_ int sd_device_set_sysattr_value
+@@ -2516,7 +2516,7 @@ _public_ int sd_device_set_sysattr_value(sd_device=
 *device, const char *sysattr,
          if (!value)
                  return -ENOMEM;
 =20
@@ -241,9 +265,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
          if (r < 0) {
                  /* On failure, clear cache entry, as we do not know how=
 it fails. */
                  device_remove_cached_sysattr_value(device, sysattr);
+diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
+index a5002437c6..b12e6cd9c9 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -122,7 +122,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
+@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_req=
uested, uid_t uid_shift) {
          fn =3D strjoina(tree, cgroup, "/cgroup.procs");
 =20
          sprintf(pid_string, PID_FMT, pid);
@@ -252,9 +278,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
          if (r < 0) {
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index 6ab604d3dc..bbec6b686c 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2774,7 +2774,7 @@ static int reset_audit_loginuid(void) {
+@@ -2688,7 +2688,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
 =20
@@ -263,7 +291,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This =
probably means that your kernel is too\n"
-@@ -4214,7 +4214,7 @@ static int setup_uid_map(
+@@ -4141,7 +4141,7 @@ static int setup_uid_map(
                  return log_oom();
 =20
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
@@ -272,7 +300,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
          if (r < 0)
                  return log_error_errno(r, "Failed to write UID map: %m"=
);
 =20
-@@ -4224,7 +4224,7 @@ static int setup_uid_map(
+@@ -4151,7 +4151,7 @@ static int setup_uid_map(
                  return log_oom();
 =20
          xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
@@ -281,6 +309,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m"=
);
 =20
+diff --git a/src/shared/binfmt-util.c b/src/shared/binfmt-util.c
+index a26175474b..1413a9c72c 100644
 --- a/src/shared/binfmt-util.c
 +++ b/src/shared/binfmt-util.c
 @@ -46,7 +46,7 @@ int disable_binfmt(void) {
@@ -292,18 +322,20 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.=
com>
          if (r < 0)
                  return log_warning_errno(r, "Failed to unregister binfm=
t_misc entries: %m");
 =20
+diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
+index 934a16eaf3..c921ced861 100644
 --- a/src/shared/cgroup-setup.c
 +++ b/src/shared/cgroup-setup.c
-@@ -351,7 +351,7 @@ int cg_attach(const char *controller, co
+@@ -351,7 +351,7 @@ int cg_attach(const char *controller, const char *pa=
th, pid_t pid) {
 =20
          xsprintf(c, PID_FMT "\n", pid);
 =20
 -        r =3D write_string_file(fs, c, WRITE_STRING_FILE_DISABLE_BUFFER=
);
 +        r =3D write_string_file(fs, c, 0);
-         if (r =3D=3D -EOPNOTSUPP && cg_is_threaded(controller, path) > =
0)
+         if (r =3D=3D -EOPNOTSUPP && cg_is_threaded(path) > 0)
                  /* When the threaded mode is used, we cannot read/write=
 the file. Let's return recognizable error. */
                  return -EUCLEAN;
-@@ -964,7 +964,7 @@ int cg_enable_everywhere(
+@@ -966,7 +966,7 @@ int cg_enable_everywhere(
                                          return log_debug_errno(errno, "=
Failed to open cgroup.subtree_control file of %s: %m", p);
                          }
 =20
@@ -312,9 +344,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
                          if (r < 0) {
                                  log_debug_errno(r, "Failed to %s contro=
ller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? =
"enable" : "disable", n, p, fs);
+diff --git a/src/shared/coredump-util.c b/src/shared/coredump-util.c
+index 805503f366..01a7ccb291 100644
 --- a/src/shared/coredump-util.c
 +++ b/src/shared/coredump-util.c
-@@ -163,7 +163,7 @@ int set_coredump_filter(uint64_t value)
+@@ -163,7 +163,7 @@ int set_coredump_filter(uint64_t value) {
          xsprintf(t, "0x%"PRIx64, value);
 =20
          return write_string_file("/proc/self/coredump_filter", t,
@@ -323,9 +357,20 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
  }
 =20
  /* Turn off core dumps but only if we're running outside of a container=
. */
---- a/src/shared/sleep-util.c
-+++ b/src/shared/sleep-util.c
-@@ -1044,7 +1044,7 @@ int write_resume_config(dev_t devno, uin
+@@ -173,7 +173,7 @@ void disable_coredumps(void) {
+         if (detect_container() > 0)
+                 return;
+=20
+-        r =3D write_string_file("/proc/sys/kernel/core_pattern", "|/bin=
/false", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r =3D write_string_file("/proc/sys/kernel/core_pattern", "|/bin=
/false", 0);
+         if (r < 0)
+                 log_debug_errno(r, "Failed to turn off coredumps, ignor=
ing: %m");
+ }
+diff --git a/src/shared/hibernate-util.c b/src/shared/hibernate-util.c
+index 3eb13d48f6..d09b901be1 100644
+--- a/src/shared/hibernate-util.c
++++ b/src/shared/hibernate-util.c
+@@ -481,7 +481,7 @@ int write_resume_config(dev_t devno, uint64_t offset=
, const char *device) {
 =20
          /* We write the offset first since it's safer. Note that this f=
ile is only available in 4.17+, so
           * fail gracefully if it doesn't exist and we're only overwriti=
ng it with 0. */
@@ -334,7 +379,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
          if (r =3D=3D -ENOENT) {
                  if (offset !=3D 0)
                          return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSU=
PP),
-@@ -1060,7 +1060,7 @@ int write_resume_config(dev_t devno, uin
+@@ -497,7 +497,7 @@ int write_resume_config(dev_t devno, uint64_t offset=
, const char *device) {
                  log_debug("Wrote resume_offset=3D%s for device '%s' to =
/sys/power/resume_offset.",
                            offset_str, device);
 =20
@@ -343,9 +388,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
          if (r < 0)
                  return log_error_errno(r,
                                         "Failed to write device '%s' (%s=
) to /sys/power/resume: %m",
+diff --git a/src/shared/smack-util.c b/src/shared/smack-util.c
+index 1f88e724d0..feb18b320a 100644
 --- a/src/shared/smack-util.c
 +++ b/src/shared/smack-util.c
-@@ -113,7 +113,7 @@ int mac_smack_apply_pid(pid_t pid, const
+@@ -113,7 +113,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label=
) {
                  return 0;
 =20
          p =3D procfs_file_alloca(pid, "attr/current");
@@ -354,29 +401,142 @@ Signed-off-by: Scott Murray <scott.murray@konsulko=
.com>
          if (r < 0)
                  return r;
 =20
+diff --git a/src/shared/watchdog.c b/src/shared/watchdog.c
+index 4c1a968718..6faf6806a5 100644
+--- a/src/shared/watchdog.c
++++ b/src/shared/watchdog.c
+@@ -93,7 +93,7 @@ static int set_pretimeout_governor(const char *governo=
r) {
+=20
+         r =3D write_string_file(sys_fn,
+                               governor,
+-                              WRITE_STRING_FILE_DISABLE_BUFFER | WRITE_=
STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
++                              WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRI=
TE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to set pretimeout_gov=
ernor to '%s': %m", governor);
+=20
+diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
+index 21af3e9e52..6d4b84b5d5 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -139,7 +139,7 @@ static int write_mode(char **modes) {
+@@ -137,7 +137,7 @@ static int write_state(int fd, char * const *states)=
 {
+                 if (k < 0)
+                         return RET_GATHER(r, k);
+=20
+-                k =3D write_string_stream(f, *state, WRITE_STRING_FILE_=
DISABLE_BUFFER);
++                k =3D write_string_stream(f, *state, 0);
+                 if (k >=3D 0) {
+                         log_debug("Using sleep state '%s'.", *state);
+                         return 0;
+@@ -155,7 +155,7 @@ static int write_mode(char * const *modes) {
          STRV_FOREACH(mode, modes) {
                  int k;
 =20
 -                k =3D write_string_file("/sys/power/disk", *mode, WRITE=
_STRING_FILE_DISABLE_BUFFER);
 +                k =3D write_string_file("/sys/power/disk", *mode, 0);
-                 if (k >=3D 0)
+                 if (k >=3D 0) {
+                         log_debug("Using sleep disk mode '%s'.", *mode)=
;
                          return 0;
+diff --git a/src/storagetm/storagetm.c b/src/storagetm/storagetm.c
+index ae63baaf79..82eeca479a 100644
+--- a/src/storagetm/storagetm.c
++++ b/src/storagetm/storagetm.c
+@@ -186,7 +186,7 @@ static int nvme_subsystem_unlink(NvmeSubsystem *s) {
+                                         if (!enable_fn)
+                                                 return log_oom();
+=20
+-                                        r =3D write_string_file_at(name=
spaces_fd, enable_fn, "0", WRITE_STRING_FILE_DISABLE_BUFFER);
++                                        r =3D write_string_file_at(name=
spaces_fd, enable_fn, "0", 0);
+                                         if (r < 0)
+                                                 log_warning_errno(r, "F=
ailed to disable namespace '%s' of NVME subsystem '%s', ignoring: %m", e-=
>d_name, s->name);
+=20
+@@ -254,7 +254,7 @@ static int nvme_subsystem_write_metadata(int subsyst=
em_fd, sd_device *device) {
+                 _cleanup_free_ char *truncated =3D strndup(w, 40); /* k=
ernel refuses more than 40 chars (as per nvme spec) */
+=20
+                 /* The default string stored in 'attr_model' is "Linux"=
 btw. */
+-                r =3D write_string_file_at(subsystem_fd, "attr_model", =
truncated, WRITE_STRING_FILE_DISABLE_BUFFER);
++                r =3D write_string_file_at(subsystem_fd, "attr_model", =
truncated, 0);
+                 if (r < 0)
+                         log_warning_errno(r, "Failed to set model of su=
bsystem to '%s', ignoring: %m", w);
+         }
+@@ -268,7 +268,7 @@ static int nvme_subsystem_write_metadata(int subsyst=
em_fd, sd_device *device) {
+                         return log_oom();
 =20
-@@ -160,7 +160,7 @@ static int write_state(FILE **f, char **
-         STRV_FOREACH(state, states) {
-                 int k;
+                  /* The default string stored in 'attr_firmware' is `un=
ame -r` btw, but truncated to 8 chars. */
+-                r =3D write_string_file_at(subsystem_fd, "attr_firmware=
", truncated, WRITE_STRING_FILE_DISABLE_BUFFER);
++                r =3D write_string_file_at(subsystem_fd, "attr_firmware=
", truncated, 0);
+                 if (r < 0)
+                         log_warning_errno(r, "Failed to set model of su=
bsystem to '%s', ignoring: %m", truncated);
+         }
+@@ -295,7 +295,7 @@ static int nvme_subsystem_write_metadata(int subsyst=
em_fd, sd_device *device) {
+                 if (!truncated)
+                         return log_oom();
 =20
--                k =3D write_string_stream(*f, *state, WRITE_STRING_FILE=
_DISABLE_BUFFER);
-+                k =3D write_string_stream(*f, *state, 0);
-                 if (k >=3D 0)
-                         return 0;
-                 log_debug_errno(k, "Failed to write '%s' to /sys/power/=
state: %m", *state);
+-                r =3D write_string_file_at(subsystem_fd, "attr_serial",=
 truncated, WRITE_STRING_FILE_DISABLE_BUFFER);
++                r =3D write_string_file_at(subsystem_fd, "attr_serial",=
 truncated, 0);
+                 if (r < 0)
+                         log_warning_errno(r, "Failed to set serial of s=
ubsystem to '%s', ignoring: %m", truncated);
+         }
+@@ -345,7 +345,7 @@ static int nvme_namespace_write_metadata(int namespa=
ce_fd, sd_device *device, co
+                 id =3D id128_digest(j, l);
+         }
+=20
+-        r =3D write_string_file_at(namespace_fd, "device_uuid", SD_ID12=
8_TO_UUID_STRING(id), WRITE_STRING_FILE_DISABLE_BUFFER);
++        r =3D write_string_file_at(namespace_fd, "device_uuid", SD_ID12=
8_TO_UUID_STRING(id), 0);
+         if (r < 0)
+                 log_warning_errno(r, "Failed to set uuid of namespace t=
o '%s', ignoring: %m", SD_ID128_TO_UUID_STRING(id));
+=20
+@@ -408,7 +408,7 @@ static int nvme_subsystem_add(const char *node, int =
consumed_fd, sd_device *devi
+         if (subsystem_fd < 0)
+                 return log_error_errno(subsystem_fd, "Failed to create =
NVME subsystem '%s': %m", j);
+=20
+-        r =3D write_string_file_at(subsystem_fd, "attr_allow_any_host",=
 "1", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r =3D write_string_file_at(subsystem_fd, "attr_allow_any_host",=
 "1", 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to set 'attr_allow_an=
y_host' flag: %m");
+=20
+@@ -423,11 +423,11 @@ static int nvme_subsystem_add(const char *node, in=
t consumed_fd, sd_device *devi
+=20
+         /* We use /proc/$PID/fd/$FD rather than /proc/self/fd/$FD, beca=
use this string is visible to others
+          * via configfs, and by including the PID it's clear to who the=
 stuff belongs. */
+-        r =3D write_string_file_at(namespace_fd, "device_path", FORMAT_=
PROC_PID_FD_PATH(0, fd), WRITE_STRING_FILE_DISABLE_BUFFER);
++        r =3D write_string_file_at(namespace_fd, "device_path", FORMAT_=
PROC_PID_FD_PATH(0, fd), 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to write 'device_path=
' attribute: %m");
+=20
+-        r =3D write_string_file_at(namespace_fd, "enable", "1", WRITE_S=
TRING_FILE_DISABLE_BUFFER);
++        r =3D write_string_file_at(namespace_fd, "enable", "1", 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to write 'enable' att=
ribute: %m");
+=20
+@@ -557,19 +557,19 @@ static int nvme_port_add_portnr(
+                 return 0;
+         }
+=20
+-        r =3D write_string_file_at(port_fd, "addr_adrfam", af_to_ipv4_i=
pv6(ip_family), WRITE_STRING_FILE_DISABLE_BUFFER);
++        r =3D write_string_file_at(port_fd, "addr_adrfam", af_to_ipv4_i=
pv6(ip_family), 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to set address family=
 on NVME port %" PRIu16 ": %m", portnr);
+=20
+-        r =3D write_string_file_at(port_fd, "addr_trtype", "tcp", WRITE=
_STRING_FILE_DISABLE_BUFFER);
++        r =3D write_string_file_at(port_fd, "addr_trtype", "tcp", 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to set transport type=
 on NVME port %" PRIu16 ": %m", portnr);
+=20
+-        r =3D write_string_file_at(port_fd, "addr_trsvcid", fname, WRIT=
E_STRING_FILE_DISABLE_BUFFER);
++        r =3D write_string_file_at(port_fd, "addr_trsvcid", fname, 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to set IP port on NVM=
E port %" PRIu16 ": %m", portnr);
+=20
+-        r =3D write_string_file_at(port_fd, "addr_traddr", ip_family =3D=
=3D AF_INET6 ? "::" : "0.0.0.0", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r =3D write_string_file_at(port_fd, "addr_traddr", ip_family =3D=
=3D AF_INET6 ? "::" : "0.0.0.0", 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to set IP address on =
NVME port %" PRIu16 ": %m", portnr);
+=20
+diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
+index febe345b4c..a90b610ba1 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
-@@ -2634,7 +2634,6 @@ static int udev_rule_apply_token_to_even
+@@ -2711,7 +2711,6 @@ static int udev_rule_apply_token_to_event(
                  log_event_debug(dev, token, "ATTR '%s' writing '%s'", b=
uf, value);
                  r =3D write_string_file(buf, value,
                                        WRITE_STRING_FILE_VERIFY_ON_FAILU=
RE |
@@ -384,9 +544,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
                                        WRITE_STRING_FILE_AVOID_NEWLINE |
                                        WRITE_STRING_FILE_VERIFY_IGNORE_N=
EWLINE);
                  if (r < 0)
+diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup=
.c
+index 4d82c65f0a..3a3d861b83 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
-@@ -260,7 +260,7 @@ static int toggle_utf8_vc(const char *na
+@@ -261,7 +261,7 @@ static int toggle_utf8_vc(const char *name, int fd, =
bool utf8) {
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
 =20
@@ -395,3 +557,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
          if (r < 0)
                  return log_warning_errno(r, "Failed to %s sysfs UTF-8 f=
lag: %m", enable_disable(utf8));
 =20
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usa=
ge.patch b/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage=
.patch
similarity index 83%
rename from meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usag=
e.patch
rename to meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.=
patch
index 580aff327d..43f75373a6 100644
--- a/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.patc=
h
+++ b/meta/recipes-core/systemd/systemd/0013-Handle-__cpu_mask-usage.patc=
h
@@ -1,7 +1,7 @@
-From a50ec65dbe660421052656dda7499c925005f486 Mon Sep 17 00:00:00 2001
+From 2f90f8463423cfbb7e83fcef42f1071018c3b56e Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
-Subject: [PATCH] Handle __cpu_mask usage
+Subject: [PATCH 13/22] Handle __cpu_mask usage
=20
 Fixes errors:
=20
@@ -23,6 +23,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/test/test-sizeof.c    | 2 +-
  2 files changed, 3 insertions(+), 1 deletion(-)
=20
+diff --git a/src/shared/cpu-set-util.h b/src/shared/cpu-set-util.h
+index 3c63a58826..4c2d4347fc 100644
 --- a/src/shared/cpu-set-util.h
 +++ b/src/shared/cpu-set-util.h
 @@ -6,6 +6,8 @@
@@ -34,6 +36,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  /* This wraps the libc interface with a variable to keep the allocated =
size. */
  typedef struct CPUSet {
          cpu_set_t *set;
+diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
+index ea0c58770e..b65c0bd370 100644
 --- a/src/test/test-sizeof.c
 +++ b/src/test/test-sizeof.c
 @@ -1,6 +1,5 @@
@@ -51,3 +55,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 =20
  /* Print information about various types. Useful when diagnosing
   * gcc diagnostics on an unfamiliar architecture. */
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0023-Handle-missing-gshado=
w.patch b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.p=
atch
similarity index 96%
rename from meta/recipes-core/systemd/systemd/0023-Handle-missing-gshadow=
.patch
rename to meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.p=
atch
index 19ee3ff311..a751e1ba6f 100644
--- a/meta/recipes-core/systemd/systemd/0023-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Handle-missing-gshadow.patch
@@ -1,7 +1,7 @@
-From ebf0f69d8614b8d86a971b97ff0d847d1e5d47c9 Mon Sep 17 00:00:00 2001
+From b7c827bb44edbb6251c9fcdb80aa03982c0e7bf3 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
-Subject: [PATCH] Handle missing gshadow
+Subject: [PATCH 14/22] Handle missing gshadow
=20
 gshadow usage is now present in the userdb code. Mask all uses of it to
 allow compilation on musl
@@ -17,7 +17,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.c=
om>
  3 files changed, 30 insertions(+), 1 deletion(-)
=20
 diff --git a/src/shared/user-record-nss.c b/src/shared/user-record-nss.c
-index 88b8fc2f8f..a819d41bac 100644
+index 414a49331b..1a4e1b628c 100644
 --- a/src/shared/user-record-nss.c
 +++ b/src/shared/user-record-nss.c
 @@ -329,8 +329,10 @@ int nss_group_to_group_record(
@@ -138,7 +138,7 @@ index 22ab04d6ee..4e52e7a911 100644
  #include <shadow.h>
 =20
 diff --git a/src/shared/userdb.c b/src/shared/userdb.c
-index a77eff4407..955e361d3a 100644
+index f60d48ace4..e878199a28 100644
 --- a/src/shared/userdb.c
 +++ b/src/shared/userdb.c
 @@ -1038,13 +1038,15 @@ int groupdb_iterator_get(UserDBIterator *iterato=
r, GroupRecord **ret) {
@@ -169,5 +169,5 @@ index a77eff4407..955e361d3a 100644
                                  return r;
 =20
 --=20
-2.39.2
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0024-missing_syscall.h-Def=
ine-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0=
015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
similarity index 84%
rename from meta/recipes-core/systemd/systemd/0024-missing_syscall.h-Defi=
ne-MIPS-ABI-defines-for-musl.patch
rename to meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define=
-MIPS-ABI-defines-for-musl.patch
index d64cec1585..e112766a9b 100644
--- a/meta/recipes-core/systemd/systemd/0024-missing_syscall.h-Define-MIP=
S-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIP=
S-ABI-defines-for-musl.patch
@@ -1,7 +1,7 @@
-From a2f56a2a6cdd5137bb1e680aa9f6c40540107166 Mon Sep 17 00:00:00 2001
+From 3dc9d9d410bcce54fddfd94f43f7f77f3aa8e281 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 12 Apr 2021 23:44:53 -0700
-Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
+Subject: [PATCH 15/22] missing_syscall.h: Define MIPS ABI defines for mu=
sl
=20
 musl does not define _MIPS_SIM_ABI32, _MIPS_SIM_NABI32, _MIPS_SIM_ABI64
 unlike glibc where these are provided by libc headers, therefore define
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 7 insertions(+)
=20
 diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index 98cd037962..ea6a76c2e2 100644
+index d795efd8f2..d6729d3c1d 100644
 --- a/src/basic/missing_syscall.h
 +++ b/src/basic/missing_syscall.h
 @@ -20,6 +20,12 @@
@@ -33,7 +33,7 @@ index 98cd037962..ea6a76c2e2 100644
  #include "missing_keyctl.h"
  #include "missing_stat.h"
 diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index 2726dc946a..484f63e0b4 100644
+index 7ae921a113..0ef9d1fd39 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
 @@ -20,6 +20,7 @@
@@ -45,5 +45,5 @@ index 2726dc946a..484f63e0b4 100644
  typedef struct BaseFilesystem {
          const char *dir;      /* directory or symlink to create */
 --=20
-2.39.2
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0005-pass-correct-paramete=
rs-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0016-pass-corr=
ect-parameters-to-getdents64.patch
similarity index 92%
rename from meta/recipes-core/systemd/systemd/0005-pass-correct-parameter=
s-to-getdents64.patch
rename to meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-=
to-getdents64.patch
index c634d8ec3d..0be817e62d 100644
--- a/meta/recipes-core/systemd/systemd/0005-pass-correct-parameters-to-g=
etdents64.patch
+++ b/meta/recipes-core/systemd/systemd/0016-pass-correct-parameters-to-g=
etdents64.patch
@@ -1,7 +1,7 @@
-From 17766c64ecc7dedf09ed2d361690fc4eda77bf42 Mon Sep 17 00:00:00 2001
+From 0994b59dba9f248ad31cb7087046dc00b72cb4ea Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 15:15:11 -0800
-Subject: [PATCH] pass correct parameters to getdents64
+Subject: [PATCH 16/22] pass correct parameters to getdents64
=20
 Fixes
 ../git/src/basic/recurse-dir.c:57:40: error: incompatible pointer types =
passing 'uint8_t *' (aka 'unsigned char *') to parameter of type 'struct =
dirent *' [-Werror,-Wincompatible-pointer-types]
@@ -33,5 +33,5 @@ index 5e98b7a5d8..aef065047b 100644
                          return -errno;
                  if (n =3D=3D 0)
 --=20
-2.39.2
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-heade=
rs.patch b/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers=
.patch
similarity index 89%
rename from meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-header=
s.patch
rename to meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.=
patch
index 5e9646c569..4176522a1c 100644
--- a/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patc=
h
+++ b/meta/recipes-core/systemd/systemd/0017-Adjust-for-musl-headers.patc=
h
@@ -1,11 +1,14 @@
-From e5f067cb3dc845dd865e450f4e64077b28feb4c0 Mon Sep 17 00:00:00 2001
+From 3c094d443ca30f19114392fd8ef274af6eabc12d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Jan 2022 22:19:37 -0800
-Subject: [PATCH] Adjust for musl headers
+Subject: [PATCH 17/22] Adjust for musl headers
=20
 Upstream-Status: Inappropriate [musl specific]
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+[Rebased for v255.1]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  src/libsystemd-network/sd-dhcp6-client.c      | 2 +-
  src/network/netdev/bareudp.c                  | 2 +-
@@ -33,7 +36,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/network/netdev/xfrm.c                     | 2 +-
  src/network/networkd-bridge-mdb.c             | 4 ++--
  src/network/networkd-dhcp-common.c            | 3 ++-
- src/network/networkd-dhcp-prefix-delegation.c | 4 ++--
+ src/network/networkd-dhcp-prefix-delegation.c | 3 ++-
  src/network/networkd-dhcp-server.c            | 2 +-
  src/network/networkd-dhcp4.c                  | 2 +-
  src/network/networkd-ipv6ll.c                 | 2 +-
@@ -41,13 +44,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/network/networkd-ndisc.c                  | 2 +-
  src/network/networkd-route.c                  | 8 ++++----
  src/network/networkd-setlink.c                | 2 +-
+ src/network/networkd-sysctl.c                 | 2 +-
  src/shared/linux/ethtool.h                    | 3 ++-
  src/shared/netif-util.c                       | 2 +-
  src/udev/udev-builtin-net_id.c                | 2 +-
- 37 files changed, 44 insertions(+), 42 deletions(-)
+ 38 files changed, 45 insertions(+), 42 deletions(-)
=20
 diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-n=
etwork/sd-dhcp6-client.c
-index 57dd91f81f..2b7f4fa3a7 100644
+index c20367dfc9..b8d4cd8c2a 100644
 --- a/src/libsystemd-network/sd-dhcp6-client.c
 +++ b/src/libsystemd-network/sd-dhcp6-client.c
 @@ -5,7 +5,7 @@
@@ -60,7 +64,7 @@ index 57dd91f81f..2b7f4fa3a7 100644
 =20
  #include "sd-dhcp6-client.h"
 diff --git a/src/network/netdev/bareudp.c b/src/network/netdev/bareudp.c
-index 24d3afb877..f6241b41ee 100644
+index 1df886573b..c8b6714726 100644
 --- a/src/network/netdev/bareudp.c
 +++ b/src/network/netdev/bareudp.c
 @@ -2,7 +2,7 @@
@@ -73,7 +77,7 @@ index 24d3afb877..f6241b41ee 100644
  #include "bareudp.h"
  #include "netlink-util.h"
 diff --git a/src/network/netdev/batadv.c b/src/network/netdev/batadv.c
-index 7e97619657..50fcffcfdf 100644
+index 26da0231d4..2e8002af8c 100644
 --- a/src/network/netdev/batadv.c
 +++ b/src/network/netdev/batadv.c
 @@ -3,7 +3,7 @@
@@ -86,7 +90,7 @@ index 7e97619657..50fcffcfdf 100644
  #include "batadv.h"
  #include "fileio.h"
 diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
-index 601bff0a9c..dfed8d9e54 100644
+index 4d75a0d6bf..985b3197e0 100644
 --- a/src/network/netdev/bond.c
 +++ b/src/network/netdev/bond.c
 @@ -1,7 +1,7 @@
@@ -99,7 +103,7 @@ index 601bff0a9c..dfed8d9e54 100644
  #include "alloc-util.h"
  #include "bond.h"
 diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
-index b65c3b49fc..6875b4fbdb 100644
+index 3e394edadf..f12f667687 100644
 --- a/src/network/netdev/bridge.c
 +++ b/src/network/netdev/bridge.c
 @@ -2,7 +2,7 @@
@@ -124,7 +128,7 @@ index 00df1d2787..77b506b422 100644
  #include "dummy.h"
 =20
 diff --git a/src/network/netdev/geneve.c b/src/network/netdev/geneve.c
-index 777a32d75c..73bfa2b5c1 100644
+index bc655ec7ff..a77e8e17e4 100644
 --- a/src/network/netdev/geneve.c
 +++ b/src/network/netdev/geneve.c
 @@ -2,7 +2,7 @@
@@ -150,7 +154,7 @@ index d7ff44cb9e..e037629ae4 100644
  #include "ifb.h"
 =20
 diff --git a/src/network/netdev/ipoib.c b/src/network/netdev/ipoib.c
-index 5dd9286d57..4036d66dad 100644
+index d5fe299b7b..c9c8002eac 100644
 --- a/src/network/netdev/ipoib.c
 +++ b/src/network/netdev/ipoib.c
 @@ -1,6 +1,6 @@
@@ -162,7 +166,7 @@ index 5dd9286d57..4036d66dad 100644
 =20
  #include "ipoib.h"
 diff --git a/src/network/netdev/ipvlan.c b/src/network/netdev/ipvlan.c
-index 058eadebd7..c470ebb6d7 100644
+index 05d5d010f6..d440f49537 100644
 --- a/src/network/netdev/ipvlan.c
 +++ b/src/network/netdev/ipvlan.c
 @@ -2,7 +2,7 @@
@@ -175,7 +179,7 @@ index 058eadebd7..c470ebb6d7 100644
  #include "conf-parser.h"
  #include "ipvlan.h"
 diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
-index 0da3dd4bd2..eb20f04469 100644
+index 17d6acefb6..679d0984f9 100644
 --- a/src/network/netdev/macsec.c
 +++ b/src/network/netdev/macsec.c
 @@ -1,7 +1,7 @@
@@ -188,7 +192,7 @@ index 0da3dd4bd2..eb20f04469 100644
  #include <linux/if_macsec.h>
  #include <linux/genetlink.h>
 diff --git a/src/network/netdev/macvlan.c b/src/network/netdev/macvlan.c
-index 1114bb0cb1..6c79a219a4 100644
+index 203807e3a5..8ab09a387e 100644
 --- a/src/network/netdev/macvlan.c
 +++ b/src/network/netdev/macvlan.c
 @@ -2,7 +2,7 @@
@@ -201,7 +205,7 @@ index 1114bb0cb1..6c79a219a4 100644
  #include "conf-parser.h"
  #include "macvlan.h"
 diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
-index 038a27c118..67155f0db7 100644
+index 57127a861a..7f787d0b9f 100644
 --- a/src/network/netdev/netdev.c
 +++ b/src/network/netdev/netdev.c
 @@ -2,7 +2,7 @@
@@ -238,7 +242,7 @@ index ff372092e6..eef66811f4 100644
  #include "nlmon.h"
 =20
 diff --git a/src/network/netdev/tunnel.c b/src/network/netdev/tunnel.c
-index 2addfeecaa..954987f26d 100644
+index db84e7cf6e..93d5642962 100644
 --- a/src/network/netdev/tunnel.c
 +++ b/src/network/netdev/tunnel.c
 @@ -2,7 +2,7 @@
@@ -263,7 +267,7 @@ index 380547ee1e..137c1adf8a 100644
  #include "vcan.h"
 =20
 diff --git a/src/network/netdev/veth.c b/src/network/netdev/veth.c
-index fb00e6667f..f52d9ee89a 100644
+index e0f5b4ebb1..8a424ed03d 100644
 --- a/src/network/netdev/veth.c
 +++ b/src/network/netdev/veth.c
 @@ -3,7 +3,7 @@
@@ -276,7 +280,7 @@ index fb00e6667f..f52d9ee89a 100644
 =20
  #include "netlink-util.h"
 diff --git a/src/network/netdev/vlan.c b/src/network/netdev/vlan.c
-index a3d961dac3..386b567a42 100644
+index 2390206993..efec630e30 100644
 --- a/src/network/netdev/vlan.c
 +++ b/src/network/netdev/vlan.c
 @@ -2,7 +2,7 @@
@@ -289,7 +293,7 @@ index a3d961dac3..386b567a42 100644
 =20
  #include "parse-util.h"
 diff --git a/src/network/netdev/vrf.c b/src/network/netdev/vrf.c
-index 05ef3ff13d..825fc4a398 100644
+index b75ec2bcc6..6aeeea640b 100644
 --- a/src/network/netdev/vrf.c
 +++ b/src/network/netdev/vrf.c
 @@ -2,7 +2,7 @@
@@ -302,7 +306,7 @@ index 05ef3ff13d..825fc4a398 100644
  #include "vrf.h"
 =20
 diff --git a/src/network/netdev/vxcan.c b/src/network/netdev/vxcan.c
-index 83269b0707..39c6dbe29c 100644
+index c0343f45b6..f9e718f40b 100644
 --- a/src/network/netdev/vxcan.c
 +++ b/src/network/netdev/vxcan.c
 @@ -1,7 +1,7 @@
@@ -315,7 +319,7 @@ index 83269b0707..39c6dbe29c 100644
  #include "vxcan.h"
 =20
 diff --git a/src/network/netdev/vxlan.c b/src/network/netdev/vxlan.c
-index 589161938a..0ec9625b7a 100644
+index b11fdbbd0d..a971a917f0 100644
 --- a/src/network/netdev/vxlan.c
 +++ b/src/network/netdev/vxlan.c
 @@ -2,7 +2,7 @@
@@ -328,7 +332,7 @@ index 589161938a..0ec9625b7a 100644
  #include "conf-parser.h"
  #include "alloc-util.h"
 diff --git a/src/network/netdev/wireguard.c b/src/network/netdev/wiregua=
rd.c
-index 51e7e02990..fc36c0623a 100644
+index 4c7d837c41..6df6dfb816 100644
 --- a/src/network/netdev/wireguard.c
 +++ b/src/network/netdev/wireguard.c
 @@ -6,7 +6,7 @@
@@ -341,7 +345,7 @@ index 51e7e02990..fc36c0623a 100644
 =20
  #include "sd-resolve.h"
 diff --git a/src/network/netdev/xfrm.c b/src/network/netdev/xfrm.c
-index a961d8fef2..6c1815b257 100644
+index 905bfc0bdf..39e34dbb3b 100644
 --- a/src/network/netdev/xfrm.c
 +++ b/src/network/netdev/xfrm.c
 @@ -1,6 +1,6 @@
@@ -374,7 +378,7 @@ index bd1a9745dc..949d3da029 100644
  #define STATIC_BRIDGE_MDB_ENTRIES_PER_NETWORK_MAX 1024U
 =20
 diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-d=
hcp-common.c
-index ca9a825e7b..8735e261ad 100644
+index 080b15387c..efe8283957 100644
 --- a/src/network/networkd-dhcp-common.c
 +++ b/src/network/networkd-dhcp-common.c
 @@ -1,7 +1,8 @@
@@ -388,18 +392,17 @@ index ca9a825e7b..8735e261ad 100644
  #include "bus-error.h"
  #include "bus-locator.h"
 diff --git a/src/network/networkd-dhcp-prefix-delegation.c b/src/network=
/networkd-dhcp-prefix-delegation.c
-index 66c5e979d9..581b6b8c29 100644
+index af2fe9efcd..511565700f 100644
 --- a/src/network/networkd-dhcp-prefix-delegation.c
 +++ b/src/network/networkd-dhcp-prefix-delegation.c
-@@ -1,7 +1,5 @@
+@@ -1,6 +1,5 @@
  /* SPDX-License-Identifier: LGPL-2.1-or-later */
 =20
 -#include <linux/ipv6_route.h>
--
- #include "sd-dhcp6-client.h"
 =20
+ #include "dhcp6-lease-internal.h"
  #include "hashmap.h"
-@@ -21,6 +19,8 @@
+@@ -20,6 +19,8 @@
  #include "strv.h"
  #include "tunnel.h"
 =20
@@ -409,7 +412,7 @@ index 66c5e979d9..581b6b8c29 100644
          assert(link);
 =20
 diff --git a/src/network/networkd-dhcp-server.c b/src/network/networkd-d=
hcp-server.c
-index 620fbbddc7..c8af20fb34 100644
+index 607fe0053c..9ce4005874 100644
 --- a/src/network/networkd-dhcp-server.c
 +++ b/src/network/networkd-dhcp-server.c
 @@ -1,7 +1,7 @@
@@ -422,7 +425,7 @@ index 620fbbddc7..c8af20fb34 100644
 =20
  #include "sd-dhcp-server.h"
 diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
-index d4b4942173..3d78da5609 100644
+index efbae6d868..1ea2151d50 100644
 --- a/src/network/networkd-dhcp4.c
 +++ b/src/network/networkd-dhcp4.c
 @@ -3,7 +3,7 @@
@@ -448,7 +451,7 @@ index 32229a3fc7..662a345d6e 100644
  #include "in-addr-util.h"
  #include "networkd-address.h"
 diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index 019bef0590..657fc41ae6 100644
+index ee5f0f2c0a..ea5269a2de 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
 @@ -3,7 +3,7 @@
@@ -461,7 +464,7 @@ index 019bef0590..657fc41ae6 100644
  #include <linux/netdevice.h>
  #include <sys/socket.h>
 diff --git a/src/network/networkd-ndisc.c b/src/network/networkd-ndisc.c
-index 99a07e16fc..e51cd81d96 100644
+index ab9eeb13a5..dd96fe7483 100644
 --- a/src/network/networkd-ndisc.c
 +++ b/src/network/networkd-ndisc.c
 @@ -6,7 +6,7 @@
@@ -474,7 +477,7 @@ index 99a07e16fc..e51cd81d96 100644
  #include "sd-ndisc.h"
 =20
 diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index 5214a8ad2c..9dd758daae 100644
+index 7218d799fc..30d5574eae 100644
 --- a/src/network/networkd-route.c
 +++ b/src/network/networkd-route.c
 @@ -1,9 +1,5 @@
@@ -499,7 +502,7 @@ index 5214a8ad2c..9dd758daae 100644
          _cleanup_(route_freep) Route *route =3D NULL;
 =20
 diff --git a/src/network/networkd-setlink.c b/src/network/networkd-setli=
nk.c
-index 541c4b8a72..06ebda8f0f 100644
+index 2298f9ea3a..7d5f87de53 100644
 --- a/src/network/networkd-setlink.c
 +++ b/src/network/networkd-setlink.c
 @@ -2,7 +2,7 @@
@@ -511,8 +514,21 @@ index 541c4b8a72..06ebda8f0f 100644
  #include <linux/if_bridge.h>
 =20
  #include "missing_network.h"
+diff --git a/src/network/networkd-sysctl.c b/src/network/networkd-sysctl=
.c
+index 2b226b2e2a..f12a474e2f 100644
+--- a/src/network/networkd-sysctl.c
++++ b/src/network/networkd-sysctl.c
+@@ -2,7 +2,7 @@
+=20
+ #include <netinet/in.h>
+ #include <linux/if.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+=20
+ #include "missing_network.h"
+ #include "networkd-link.h"
 diff --git a/src/shared/linux/ethtool.h b/src/shared/linux/ethtool.h
-index 1458de3627..d5c2d2e0ac 100644
+index 3d1da515c0..3fca9a4faf 100644
 --- a/src/shared/linux/ethtool.h
 +++ b/src/shared/linux/ethtool.h
 @@ -16,7 +16,8 @@
@@ -539,7 +555,7 @@ index f56c5646c1..5af28ff119 100644
  #include "arphrd-util.h"
  #include "device-util.h"
 diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net_=
id.c
-index a48d5dedf8..31a8bc1b3c 100644
+index f528a46b8e..830318cda5 100644
 --- a/src/udev/udev-builtin-net_id.c
 +++ b/src/udev/udev-builtin-net_id.c
 @@ -18,7 +18,7 @@
@@ -552,5 +568,5 @@ index a48d5dedf8..31a8bc1b3c 100644
  #include <linux/pci_regs.h>
 =20
 --=20
-2.39.2
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0006-test-bus-error-strerr=
or-is-assumed-to-be-GNU-specifi.patch b/meta/recipes-core/systemd/systemd=
/0018-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
similarity index 89%
rename from meta/recipes-core/systemd/systemd/0006-test-bus-error-strerro=
r-is-assumed-to-be-GNU-specifi.patch
rename to meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-=
is-assumed-to-be-GNU-specifi.patch
index 96322e5a56..75f6b9094a 100644
--- a/meta/recipes-core/systemd/systemd/0006-test-bus-error-strerror-is-a=
ssumed-to-be-GNU-specifi.patch
+++ b/meta/recipes-core/systemd/systemd/0018-test-bus-error-strerror-is-a=
ssumed-to-be-GNU-specifi.patch
@@ -1,8 +1,8 @@
-From fa598869cca684c001f3dc23ce2198f5a6169e2a Mon Sep 17 00:00:00 2001
+From be02bd0876a061728661535a709d313e39fe1ac3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Nov 2022 13:31:34 -0800
-Subject: [PATCH] test-bus-error: strerror() is assumed to be GNU specifi=
c
- version mark it so
+Subject: [PATCH 18/22] test-bus-error: strerror() is assumed to be GNU
+ specific version mark it so
=20
 Upstream-Status: Inappropriate [Upstream systemd only supports glibc]
=20
@@ -27,7 +27,7 @@ index a55f3f9856..4123bf3da0 100644
          assert_se(sd_bus_error_get_errno(&error) =3D=3D EBUSY);
          assert_se(sd_bus_error_is_set(&error));
 diff --git a/src/test/test-errno-util.c b/src/test/test-errno-util.c
-index d3d022c33f..74e95c804d 100644
+index 376d532281..967cfd4d67 100644
 --- a/src/test/test-errno-util.c
 +++ b/src/test/test-errno-util.c
 @@ -4,7 +4,7 @@
@@ -48,5 +48,5 @@ index d3d022c33f..74e95c804d 100644
  TEST(PROTECT_ERRNO) {
          errno =3D 12;
 --=20
-2.39.2
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0003-errno-util-Make-STRER=
ROR-portable-for-musl.patch b/meta/recipes-core/systemd/systemd/0019-errn=
o-util-Make-STRERROR-portable-for-musl.patch
similarity index 81%
rename from meta/recipes-core/systemd/systemd/0003-errno-util-Make-STRERR=
OR-portable-for-musl.patch
rename to meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR=
-portable-for-musl.patch
index fcc56a2e65..e038b73678 100644
--- a/meta/recipes-core/systemd/systemd/0003-errno-util-Make-STRERROR-por=
table-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0019-errno-util-Make-STRERROR-por=
table-for-musl.patch
@@ -1,7 +1,7 @@
-From f629a76e0fba300a9d511614160fee38dd4a5e57 Mon Sep 17 00:00:00 2001
+From 46d80840bfe37e67d4f18c37a77751ea1fe63a07 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 23 Jan 2023 23:39:46 -0800
-Subject: [PATCH] errno-util: Make STRERROR portable for musl
+Subject: [PATCH 19/22] errno-util: Make STRERROR portable for musl
=20
 Sadly, systemd has decided to use yet another GNU extention in a macro
 lets make this such that we can use XSI compliant strerror_r() for
@@ -11,20 +11,21 @@ Upstream-Status: Inappropriate [musl specific]
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/basic/errno-util.h | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
+ src/basic/errno-util.h | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
=20
 diff --git a/src/basic/errno-util.h b/src/basic/errno-util.h
-index 091f99c590..eb5c1f9961 100644
+index 27804e6382..274c1c6ef1 100644
 --- a/src/basic/errno-util.h
 +++ b/src/basic/errno-util.h
-@@ -14,8 +14,16 @@
+@@ -15,8 +15,16 @@
   * https://stackoverflow.com/questions/34880638/compound-literal-lifeti=
me-and-if-blocks
   *
   * Note that we use the GNU variant of strerror_r() here. */
 -#define STRERROR(errnum) strerror_r(abs(errnum), (char[ERRNO_BUF_LEN]){=
}, ERRNO_BUF_LEN)
+-
 +static inline const char * STRERROR(int errnum);
-=20
++
 +static inline const char * STRERROR(int errnum) {
 +#ifdef __GLIBC__
 +        return strerror_r(abs(errnum), (char[ERRNO_BUF_LEN]){}, ERRNO_B=
UF_LEN);
@@ -37,5 +38,5 @@ index 091f99c590..eb5c1f9961 100644
   * Note that we can't use ({ =E2=80=A6 }) to define a temporary variabl=
e, so errnum is
   * evaluated twice. */
 --=20
-2.39.2
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0028-sd-event-Make-malloc_=
trim-conditional-on-glibc.patch b/meta/recipes-core/systemd/systemd/0020-=
sd-event-Make-malloc_trim-conditional-on-glibc.patch
similarity index 85%
rename from meta/recipes-core/systemd/systemd/0028-sd-event-Make-malloc_t=
rim-conditional-on-glibc.patch
rename to meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_tri=
m-conditional-on-glibc.patch
index c9ec00012e..b83fffe793 100644
--- a/meta/recipes-core/systemd/systemd/0028-sd-event-Make-malloc_trim-co=
nditional-on-glibc.patch
+++ b/meta/recipes-core/systemd/systemd/0020-sd-event-Make-malloc_trim-co=
nditional-on-glibc.patch
@@ -1,7 +1,7 @@
-From 148645ba8b62f04c7c5ff5907378663f97880f22 Mon Sep 17 00:00:00 2001
+From 9eb4867b4e2dbdb2484ae854022aff97e2f0feb3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Aug 2023 12:06:27 -0700
-Subject: [PATCH 1/4] sd-event: Make malloc_trim() conditional on glibc
+Subject: [PATCH 20/22] sd-event: Make malloc_trim() conditional on glibc
=20
 musl does not have this API
=20
@@ -12,28 +12,28 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/src/libsystemd/sd-event/sd-event.c b/src/libsystemd/sd-even=
t/sd-event.c
-index aba458185b..48c94a7672 100644
+index 288798a0dc..6419a7f216 100644
 --- a/src/libsystemd/sd-event/sd-event.c
 +++ b/src/libsystemd/sd-event/sd-event.c
 @@ -1874,7 +1874,7 @@ _public_ int sd_event_add_exit(
  }
-
+=20
  _public_ int sd_event_trim_memory(void) {
 -        int r;
 +        int r =3D 0;
-
+=20
          /* A default implementation of a memory pressure callback. Simp=
ly releases our own allocation caches
           * and glibc's. This is automatically used when people call sd_=
event_add_memory_pressure() with a
 @@ -1888,7 +1888,9 @@ _public_ int sd_event_trim_memory(void) {
-
+=20
          usec_t before_timestamp =3D now(CLOCK_MONOTONIC);
          hashmap_trim_pools();
 +#ifdef __GLIBC__
          r =3D malloc_trim(0);
 +#endif
          usec_t after_timestamp =3D now(CLOCK_MONOTONIC);
-
+=20
          if (r > 0)
---
-2.41.0
+--=20
+2.34.1
=20
diff --git a/meta/recipes-core/systemd/systemd/0029-shared-Do-not-use-mal=
loc_info-on-musl.patch b/meta/recipes-core/systemd/systemd/0021-shared-Do=
-not-use-malloc_info-on-musl.patch
similarity index 68%
rename from meta/recipes-core/systemd/systemd/0029-shared-Do-not-use-mall=
oc_info-on-musl.patch
rename to meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc=
_info-on-musl.patch
index 8e386551a1..7eff069bb7 100644
--- a/meta/recipes-core/systemd/systemd/0029-shared-Do-not-use-malloc_inf=
o-on-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-shared-Do-not-use-malloc_inf=
o-on-musl.patch
@@ -1,7 +1,7 @@
-From 9430646e72ea5d260ade300038a6d976fecf7da5 Mon Sep 17 00:00:00 2001
+From 502597b9ddd6b145541b23fadca0b1d3ca9f6367 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 2 Aug 2023 12:20:40 -0700
-Subject: [PATCH 4/4] shared: Do not use malloc_info on musl
+Subject: [PATCH 21/22] shared: Do not use malloc_info on musl
=20
 Upstream-Status: Inappropriate [musl-specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
@@ -10,9 +10,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/shared/common-signal.c | 4 ++--
  2 files changed, 5 insertions(+), 4 deletions(-)
=20
+diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
+index 74f148c8b4..2d862a123d 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
-@@ -617,15 +617,16 @@ static int method_dump_memory_state_by_f
+@@ -611,15 +611,16 @@ static int method_dump_memory_state_by_fd(sd_bus_m=
essage *message, void *userdat
          _cleanup_close_ int fd =3D -EBADF;
          size_t dump_size;
          FILE *f;
@@ -31,9 +33,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          if (r < 0)
                  return r;
 =20
+diff --git a/src/shared/common-signal.c b/src/shared/common-signal.c
+index 8e70e365dd..9e782caec9 100644
 --- a/src/shared/common-signal.c
 +++ b/src/shared/common-signal.c
-@@ -65,12 +65,12 @@ int sigrtmin18_handler(sd_event_source *
+@@ -65,12 +65,12 @@ int sigrtmin18_handler(sd_event_source *s, const str=
uct signalfd_siginfo *si, vo
                          log_oom();
                          break;
                  }
@@ -48,3 +52,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
                  (void) memstream_dump(LOG_INFO, &m);
                  break;
          }
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX=
-declaration.patch b/meta/recipes-core/systemd/systemd/0022-avoid-missing=
-LOCK_EX-declaration.patch
new file mode 100644
index 0000000000..24f3bf74a0
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0022-avoid-missing-LOCK_EX-declar=
ation.patch
@@ -0,0 +1,43 @@
+From fd52f1764647e03a35e8f0ed0ef952049073ccbd Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 2 Jan 2024 11:03:27 +0800
+Subject: [PATCH 22/22] avoid missing LOCK_EX declaration
+
+This only happens on MUSL. Include sys/file.h to avoid compilation
+error about missing LOCK_EX declaration.
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/core/exec-invoke.c | 1 +
+ src/shared/dev-setup.h | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/core/exec-invoke.c b/src/core/exec-invoke.c
+index 70d963e269..7084811439 100644
+--- a/src/core/exec-invoke.c
++++ b/src/core/exec-invoke.c
+@@ -4,6 +4,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/mount.h>
+ #include <sys/prctl.h>
++#include <sys/file.h>
+=20
+ #if HAVE_PAM
+ #include <security/pam_appl.h>
+diff --git a/src/shared/dev-setup.h b/src/shared/dev-setup.h
+index 5339bc4e5e..0697495f23 100644
+--- a/src/shared/dev-setup.h
++++ b/src/shared/dev-setup.h
+@@ -2,6 +2,7 @@
+ #pragma once
+=20
+ #include <sys/types.h>
++#include <sys/file.h>
+=20
+ int lock_dev_console(void);
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-co=
re/systemd/systemd_255.1.bb
index daa3a01fef..2bc1f6fb8e 100644
--- a/meta/recipes-core/systemd/systemd_255.1.bb
+++ b/meta/recipes-core/systemd/systemd_255.1.bb
@@ -33,27 +33,28 @@ SRC_URI +=3D " \
 # patches needed by musl
 SRC_URI:append:libc-musl =3D " ${SRC_URI_MUSL}"
 SRC_URI_MUSL =3D "\
-               file://0009-missing_type.h-add-comparison_fn_t.patch \
-               file://0010-add-fallback-parse_printf_format-implementati=
on.patch \
-               file://0011-src-basic-missing.h-check-for-missing-strndup=
a.patch \
-               file://0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-=
is-not-.patch \
-               file://0013-add-missing-FTW_-macros-for-musl.patch \
-               file://0014-Use-uintmax_t-for-handling-rlim_t.patch \
-               file://0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-facces=
sat.patch \
-               file://0017-Define-glibc-compatible-basename-for-non-glib=
c-syste.patch \
-               file://0018-Do-not-disable-buffering-when-writing-to-oom_=
score_a.patch \
-               file://0019-distinguish-XSI-compliant-strerror_r-from-GNU=
-specif.patch \
-               file://0020-avoid-redefinition-of-prctl_mm_map-structure.=
patch \
-               file://0021-do-not-disable-buffer-in-writing-files.patch =
\
-               file://0022-Handle-__cpu_mask-usage.patch \
-               file://0023-Handle-missing-gshadow.patch \
-               file://0024-missing_syscall.h-Define-MIPS-ABI-defines-for=
-musl.patch \
-               file://0005-pass-correct-parameters-to-getdents64.patch \
-               file://0001-Adjust-for-musl-headers.patch \
-               file://0006-test-bus-error-strerror-is-assumed-to-be-GNU-=
specifi.patch \
-               file://0003-errno-util-Make-STRERROR-portable-for-musl.pa=
tch \
-               file://0028-sd-event-Make-malloc_trim-conditional-on-glib=
c.patch \
-               file://0029-shared-Do-not-use-malloc_info-on-musl.patch \
+               file://0001-missing_type.h-add-comparison_fn_t.patch \
+               file://0002-add-fallback-parse_printf_format-implementati=
on.patch \
+               file://0003-src-basic-missing.h-check-for-missing-strndup=
a.patch \
+               file://0004-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-=
is-not-.patch \
+               file://0005-add-missing-FTW_-macros-for-musl.patch \
+               file://0006-Use-uintmax_t-for-handling-rlim_t.patch \
+               file://0007-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-facces=
sat.patch \
+               file://0008-Define-glibc-compatible-basename-for-non-glib=
c-syste.patch \
+               file://0009-Do-not-disable-buffering-when-writing-to-oom_=
score_a.patch \
+               file://0010-distinguish-XSI-compliant-strerror_r-from-GNU=
-specif.patch \
+               file://0011-avoid-redefinition-of-prctl_mm_map-structure.=
patch \
+               file://0012-do-not-disable-buffer-in-writing-files.patch =
\
+               file://0013-Handle-__cpu_mask-usage.patch \
+               file://0014-Handle-missing-gshadow.patch \
+               file://0015-missing_syscall.h-Define-MIPS-ABI-defines-for=
-musl.patch \
+               file://0016-pass-correct-parameters-to-getdents64.patch \
+               file://0017-Adjust-for-musl-headers.patch \
+               file://0018-test-bus-error-strerror-is-assumed-to-be-GNU-=
specifi.patch \
+               file://0019-errno-util-Make-STRERROR-portable-for-musl.pa=
tch \
+               file://0020-sd-event-Make-malloc_trim-conditional-on-glib=
c.patch \
+               file://0021-shared-Do-not-use-malloc_info-on-musl.patch \
+               file://0022-avoid-missing-LOCK_EX-declaration.patch \
                "
=20
 PAM_PLUGINS =3D " \
--=20
2.34.1


