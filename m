Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6316EA3F3B
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 10:37:13 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16755.1770719825169345218
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 02:37:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=p0guKY5X;
 spf=pass (domain: siemens.com, ip: 52.101.84.2, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkKiKmH+4OHgwHzO0QZ0xA+mNY3eXVidUYR3JwnPo5n/lb0SlGp7crVdcEUTDJ4uvhfKXAJWAl+iyIMUyWZNLNTffcMtn2+0XUy+hdLvWhvVjmWxzguehHEcZv/dETGbjccIHJ6Ci9AqvWvw/dhLp1kGsECD1SFWf3a1c6NO7604dr3z+x3bQ5PPYiS7DFnhtjuiFTJi3XsL/gBpmtuTjYopTTR8VMUiuGppLzbocObQfTPboijAoesgHsZCBrJJbacpcGwyiqywx6FfkXjy72L5p0FauFcn61EQDR6pNMdZQr+GIPRT4Ar/M1SIlJghYrxE896kmRxBnIKyg6d/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JolDyOqD0Ni6BLh2KlUXkA89Gomu0tqUxxq5JW4xZpw=;
 b=axqa7g50Nczl6FsiC7OqzNsURFOIUuMQfF5FbcUxutNE1hRcLpXLEKxNmOWDN+S7TxZVAIPIflrXDPT76jOmSh6Dj0VPKFomgLMcykpyOs4mXOQQtfwi3TE8vmMwvKiJbON8J1AI/aFeTUaFsrsCGutbOogOSg3+tGTw9Odp3PTl06FVRVsfZ5RBVYFD7XZqAjGrrzmnSS58kVre6odUm5yKBwWYD4Q1Libvc6c8BtEknKVi04ShPtwjHo8F27PyGHvbwE1RBtoNXfhkXZH8pIyYlvskcQZVy5vk5CWby2BTrTsFOOkBUHl/+CVTWLDrc3Fq8knhY3Qy+32kqAA3wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JolDyOqD0Ni6BLh2KlUXkA89Gomu0tqUxxq5JW4xZpw=;
 b=p0guKY5XSOHc21eoW5lM8PTUg3G5041zy74XUJgvY3H+bhPbsKRV+v8cKkJc53vCoziClrbpkgoFmX5E0QVzx16f4b4Rd497FAQ7OxcpzYRkudBiA3JP4XKuN8r4tsOcrsLyijPYk6EYGkpgB8irUjOnZNJDcthbBrnpBGtMeuj1QWYMTvrzxA0TfgpgBcoK+Cl718pp1DYsd9pfKVWJtgV4vXnWF19qil9seWCLHSOLxRHYS2bZfFpbTmGWtLKONy1kx3LHOzB2FU2D/WN+/ql+IZSkfDP2j5b8f6t4yMyW18oGXZ9zuTOmWCG+a5Zv/b8/LChHr49dNJiZWcVgXQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB4PR10MB6118.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:38d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 10:37:00 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9587.013; Tue, 10 Feb 2026
 10:36:58 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "patchtest@automation.yoctoproject.org"
	<patchtest@automation.yoctoproject.org>, Hongxu Jia
	<hongxu.jia@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] Patchtest results for [PATCH 3/3] gnupg: 2.5.14 ->
 2.5.17
Thread-Topic: [OE-core] Patchtest results for [PATCH 3/3] gnupg: 2.5.14 ->
 2.5.17
Thread-Index: AQHcmnQul3q5+0jq8ECqroyCS7G40bV7vVqA
Date: Tue, 10 Feb 2026 10:36:58 +0000
Message-ID: 
 <AS1PR10MB5697AD37C0ECCBC9E8B71456FD62A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260210095025.633860-3-hongxu.jia@windriver.com>
 <0101019c46ff2150-c2b795c2-726b-4274-8690-58a40f98be10-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101019c46ff2150-c2b795c2-726b-4274-8690-58a40f98be10-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=9b0d51f7-fc16-4d09-953f-35b50e81800c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-10T10:36:35Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB4PR10MB6118:EE_
x-ms-office365-filtering-correlation-id: b6d1d3f4-a1af-4839-f508-08de68905196
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?KzsYpCvCafzpwGALzEZ5e8qi7UKbH8FcTARXpeuvRmYzwVkbs9ZishUNDfmS?=
 =?us-ascii?Q?XZumpegQOf2UxL+2TXSR71ejRGQCeLZFhqjMdnsKq7Qs0Et9waSgMRhUN6Iv?=
 =?us-ascii?Q?FXTH+S1uRo6MW/mxORc9MSXNWJb2VHwZr8eSh8wZUJGk0cX+kv5t3D7POWoW?=
 =?us-ascii?Q?dm7nnZdtY18Dq0cd1Vv3LPoJxES3re6+e/I3KT9fqeYOhd2f61mH5myz5U83?=
 =?us-ascii?Q?huQ4TlfEXg1EcpmMzKGDCFykrpRNA86rmylDMP4u/gj2YFwyFUgSGmXgOwD6?=
 =?us-ascii?Q?2ZQFd1r+E3u3ypWigHARBsb792387auFd7ZLdwnQgv0Af23K+i11LkETDb1p?=
 =?us-ascii?Q?BxY6S/okZ3n5IR2R1qLxwsfViDDMyE98Z+EysNFaIXR5ovUFN7sPhhBjIrt1?=
 =?us-ascii?Q?VFtQqLDjInmG8aoHyo8eYMZz66+AuCZJILH1Io+m7JR2Dk+5f9InJ/NtrIZy?=
 =?us-ascii?Q?mC6cEae+tQDa5tMthgPrcbxaXpB3LdnCgZcs4ReWuGDGExJX1r4LxDiAzEis?=
 =?us-ascii?Q?DaRkgH7U1SjnGgunQeLGm61ju/C7ztAMUnwScuBIeCWB9HKB8O+Mqj68j17P?=
 =?us-ascii?Q?WdSlKQeiI28w3vh+9e+60n1QYv8t/2BalWylCd50WNbBykGWAC/H2dKeNaA+?=
 =?us-ascii?Q?qNeEBTsZNKePh+0xQ6KdSDDoAiMQiQ6Y6GkYi33yCPJMiveU+V9oWF9VC7+I?=
 =?us-ascii?Q?eM5QnvrSVvcoy734rXLAlq+b0TcCNgorHvp9k0xl5vQO1H56VodYLL8pFvLQ?=
 =?us-ascii?Q?w+cARAxcJGkZuzxg2a6TC2ByzKAgXCcpYxXR9dtzDlvxbkpIskn3xyyPFMya?=
 =?us-ascii?Q?71kBnh8kMIV4wydCqyKitGeQVfBuaSPk3QDCrNiOJ9Dt4H5gsb+kcItHqF9m?=
 =?us-ascii?Q?Xb7rQtArugsyPRvjmYDccCwpqEKxz1XqJSnSWDKXCFj7IyrzOo4bsp6fsFJZ?=
 =?us-ascii?Q?j/G3sJG//SnUnDSQh+Kvw7LSm8oSrQLUsKmPq8dwM9jw7YEheZ5mRPXa7PwM?=
 =?us-ascii?Q?s0/pdep23HSlyj+athK0XKIZC7oA30Nl24kIOAfSxHZWqDQTmqRTf6gMezS4?=
 =?us-ascii?Q?xQGUbe/BEjcp+zMv9joVCPYSCf2naNhshYz31RcYNJAyRMval3AKsagSE3FK?=
 =?us-ascii?Q?9uwZP4nG5SsADKogW8hXzeMCMZ8f1UMnNF9BiXWjms71BvlxyC8Slyd2FzY0?=
 =?us-ascii?Q?QudSHbmEs9MAEMHLHdPhGQHKPnV+3DnUCKZzu+4E/+GrI803UWuIFtyKaPnr?=
 =?us-ascii?Q?OUbiX5ZJQ5k7em3Vs9uvjWOb0CVaIgLe/DaszQqtdV4Z4Yyx/SdYQoJZGXo7?=
 =?us-ascii?Q?bYGqtqZ7hoMSe0VJc8MM8sloquE849pQqESi6vargQ+6sply83sGgD18uf7j?=
 =?us-ascii?Q?yZgQkjrmtFxBldohGmxK/8p2j/ukslIXFYWaP7xbHupnJoARDZAjISUPCX23?=
 =?us-ascii?Q?/9LxiZ0THbOnddi1AXEgcRCvXIkH+M2cPeexyApWUVHrsgK++Yp4O024D9tv?=
 =?us-ascii?Q?iunTfN7+UuhOdkGy6WFixABmKnN+KnhUcn+bMm30pHscaPm93HwTePExqB9k?=
 =?us-ascii?Q?ftbpXCAeHF9S3UVKuJY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?kt5i0OCnHQSFZeSxnhoO2umwjDLu+yyZovlzGwghNZPKiF5l/sfBWHDkkooC?=
 =?us-ascii?Q?UOED6EPJwTt2Gvi1RotvgkEjE8SgN8ZYDOB5uIk0H+4+k145j0Rih4gRmK5l?=
 =?us-ascii?Q?OtpsSx3tGRuGH3ZGdPPE6yeEXElrZhiWso0EPBOp3W9QNRLazeoAR6xgIYRC?=
 =?us-ascii?Q?XVkJmXfjf7qQaEUsy7A0KCbAGzXEJPG6/AAC2E5LKMkSXsB03bVILS6akKD4?=
 =?us-ascii?Q?Rgdo9ehKSouhBD7fD7Kq/BJXI/2vmHBAwzf0ZvAgS2FECfAELIk6sCifwjuN?=
 =?us-ascii?Q?+prcTlfyp8YkDvd4n4hmZrQCBS+FYpoeGb9zWxHYWyg5VhWnlm94TBh8lJJ7?=
 =?us-ascii?Q?zfyCk6SLV4mVBtellAFcTEZYbvviFjRczQJxnF0DeYpSXCM1WBC8DC/iMTQ1?=
 =?us-ascii?Q?rFsT5BXXEG4EBqbnMs55+bPuwGInujan170xnTbx5B8ozkveaBigP6xXQm1F?=
 =?us-ascii?Q?PUKsuRv5JKe7e6eP0q7UzZmX1ASEAcY8MTpWF6LX0Zs+tixu3n2t1tke1I4H?=
 =?us-ascii?Q?B14d3rcxy4hDQe20Owo18Kh4tARxCyq8vz5FCk9rv9biHWS2doyX7v3d1oJ4?=
 =?us-ascii?Q?OJhsDlG62zP5n9WUEf+opv792U5bm0Rfz4YgjNGvgtxE+ZKHm0FjAaVSIg63?=
 =?us-ascii?Q?Lji3bVu41drDI06miRtafp/h5KbZUH43mUxBCa3XXaZBML+pEQwCPPwa8A2K?=
 =?us-ascii?Q?h8CQ6qC3w9B8wHeAeMhCAwASXEUHNOSiOrBP5A0eo4AetdCAhw+ff4bm161K?=
 =?us-ascii?Q?U4or2zKAwkMrqKeI2SHUqD3Vj70OXLNk2QW5RIyEtKkG5URqxcm/K1mEkX7B?=
 =?us-ascii?Q?TatiFe7AVZqIdS5aPD1IE39OEg9+GbRceo91DwYqmMfwc+GI+Gy3iZn388zZ?=
 =?us-ascii?Q?qHqdxFQ6F13XKpzZtZCtQkpm96VBun1eCwkaM5Zrnxw1mgpvvVu8Oyz+xfwd?=
 =?us-ascii?Q?a0rby58/QnsggZfd2LV4sCa6cjWqw7WqdGAv4p6pXjooasPdFCeMYv3GKiAv?=
 =?us-ascii?Q?fIBTFXo+W0ot0xZsDRG1jcxXpVAuzy77mKuWE1PxUTK5FK5ypxfp9aJYKlx/?=
 =?us-ascii?Q?D9xC9f8eDsA110eK11AnqST/yyZ2G2KwTADZIxRNNYclRTntxuGHieos6G96?=
 =?us-ascii?Q?Jv+/1Tk9w88HOFDB/ZUI6EW4NiGw4WYLazbbhW03Ak61e8yPDYNsDkQg1WW7?=
 =?us-ascii?Q?3dhGJYuFSqZHqKBZjmGeeCH01hcOOaBY8gLRoeGy+8LaDC60lbwjlOAjA3kR?=
 =?us-ascii?Q?MwfgqQ1Uc3Rc3vrvQdbhJrc81Bd6NDazW4UHBp/pRN3/rJjb4XlevIwYytWX?=
 =?us-ascii?Q?XlJ4XdVE6znF8vq27C8/mFe7bfhcLV7NjwAvrMlQ/q+/QHaZR9gaH2bT1gzt?=
 =?us-ascii?Q?EI3RAlZGjMNwUNHMIznJqyyuI+ecLJYBXMIHZDc76kSlNOfFsqIz3tp2/+J0?=
 =?us-ascii?Q?sqe48IDMNqW2nggBLgMh0mC39poqvOkeUZSgIKm9tFtBQxrsKUI17JHQteYj?=
 =?us-ascii?Q?lPK66dLArd8Cx2MIovcwd0zYfa0tbK8pcj5Tcu+z4TojkOuo0U5GOLp0uApF?=
 =?us-ascii?Q?Vwf6SbS4FL6HPqBQ3KbCAhCnsP0DAtcqe7V5k/Cw2tmPhPPB/QIlz0mvshzS?=
 =?us-ascii?Q?ghw5we5k2w0vPhEMzZZxMmlS4QnzQZC8wssbNKaNaviKB9tEpnhaHyggViEs?=
 =?us-ascii?Q?HC+wZiGBnBuoprifpYXfdSg5Cj0C5sOZaPLU814hq2n0h9Sum082nbLYjOXB?=
 =?us-ascii?Q?U6zTOg4njw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d1d3f4-a1af-4839-f508-08de68905196
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 10:36:58.6498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iuBoqs0H1KnmmLQLWgoOp2KfrI2XdQ/dnDhFpgDMZGGBw91yNQ+GQLwc0BGvgQYffVurCaHxUBlLNKq7rxfCEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 10:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230880



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Patchtest via
> lists.openembedded.org
> Sent: Tuesday, February 10, 2026 11:01
> To: Hongxu Jia <hongxu.jia@windriver.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: [OE-core] Patchtest results for [PATCH 3/3] gnupg: 2.5.14 -> 2.5=
.17
>=20
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:

Ideally mention security fixes: CVE-2026-24882 and CVE-2026-24883.

Peter

>=20
> ---
> Testing patch /home/patchtest/share/mboxes/3-3-gnupg-2.5.14---2.5.17.patc=
h
>=20
> FAIL: test commit message presence: Please include a commit message on yo=
ur
> patch explaining the change
> (test_mbox.TestMbox.test_commit_message_presence)
>=20
> PASS: test Signed-off-by presence
> (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message user tags
> (test_mbox.TestMbox.test_commit_message_user_tags)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_li=
st)
>=20
> SKIP: pretest pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test CVE tag format: No new CVE patches introduced
> (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced
> (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced
> (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found
> (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now
> (test_mbox.TestMbox.test_series_merge_on_head)
>=20
> ---
>=20
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!

