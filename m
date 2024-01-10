Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62746C4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 11:56:08 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.40])
 by mx.groups.io with SMTP id smtpd.web10.9970.1704887759862691106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 03:56:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=TROFLefB;
 spf=pass (domain: siemens.com, ip: 40.107.7.40, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzuYvLLmPdH946WuX12XsPq0BQdkk8cWa7OgPnCvtS/cb/ppFzrn0vzfV1ssmbLc0m5YQvFRtJRDh6uuw+VDgoMRf9AQ71zWNcE1wPhQj9dIHwc6WjB3lhDa/cJLeWfPaORx0wfCkGZhfP+gYEMwV2vshiaYclTFDXZs5c8g7N+6HidCRviLc8pRmorT6LxbI1E0IWqfiA/lLpVy85j1tFRK7gxFjHxDydqgO6uhiHSEIx9xtIAhaS9idUnLrDcO1UzbbBuwXyFaK/cjwH6tyHH6JbarCLAxW8QvxgdCuPZvgUVNXTl9h9L9kV5bzdHUQZgClBAlSXQ/WEj+CVDLSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGP3YUpDsaR0m3V/wIxzCWJDhlLi2Lmc/Jb2CHKqe50=;
 b=HUi8c8pMqwnka9NNhHLgNGVFGKSo6cdo27fvxDCdwzu19ApckR/CLF7TgHHMGESdpWCtDIuk7ltPxPyP/Op2Ly4GizeCi+OUD+durTOfC5NJhszmzo9uz7UBtCMrprUA01cukfZEbCnsvVvsaBAochh2Urznfo1xOOWjzhF8/S/CiSTtPwY6qGpl3IllQv9UjMK4pL8t4f2LDiyXbJDfzBA6Ue3K9asZH6/pzYT8obCT+ycAgca6bNz7FIiQ3vz3p8OEg4zQSrty3RIK6LxZMR3qBTZwmtFg4JfM9+59jErAP1yf3OMF8LTQWqQeBy28kXB0mUT1O/GFc7JwAEYOfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGP3YUpDsaR0m3V/wIxzCWJDhlLi2Lmc/Jb2CHKqe50=;
 b=TROFLefBzHvu6iSnW81SRBGRdwIwpbGfB+TUAzBUzF0n3I7A2pc+dK0u6ito8x2n04Hq/Iu20kW1Sgloxm20dkyGCWwBES4TnhdQX9MdLvNMfcNXSIVPwxaaDtzkl4ZZ1y3haDZaXSIj4oLbmtrdJ+pwo2LbtKqSMhOTlxJYmNgjt9C+pPQrqacv3lnbmjhzkGtPVZHw6C3Ma4aXe/TY46sfPOCTCPuMagxleuy7u4lVMrRXiplM1A+4Nzqy8Y1WqGr/0CgwJH7oGzgWeuQk7Or2BCoFf8h7LCvKcVjXC4fvKS8hWyADtPGlhaYUw9IJhuTo0Lk0IiC4XwP+DO5+LA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI1PR10MB3632.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 11:55:55 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e%7]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 11:55:55 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "simone.p.weiss@posteo.com" <simone.p.weiss@posteo.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"patchtest@automation.yoctoproject.org"
	<patchtest@automation.yoctoproject.org>, Vivek Kumbhar <vkumbhar@mvista.com>
Subject: RE: Patchtest results for [OE-core][kirkstone][PATCH] openssl:
 Backport fix for CVE-2023-6129
Thread-Topic: Patchtest results for [OE-core][kirkstone][PATCH] openssl:
 Backport fix for CVE-2023-6129
Thread-Index: AQHaQ7rkyvKWpyqWD0utOK0YGH7ZHrDS762w
Date: Wed, 10 Jan 2024 11:55:55 +0000
Message-ID: 
 <AS1PR10MB56978588EDE41492DC1AF896FD692@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 20240110113840.655450-1-vkumbhar@mvista.com
 <0101018cf3337384-2df39066-4255-4a99-8684-851ee73b7326-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018cf3337384-2df39066-4255-4a99-8684-851ee73b7326-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ff9af711-5a6d-45cb-aa4d-d04e2d9279c2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-01-10T11:53:04Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI1PR10MB3632:EE_
x-ms-office365-filtering-correlation-id: d54f1db2-e9fd-4757-0ce6-08dc11d319fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 g+YBeg9pEpn5h8DN3K3Unfx87l8JHHqncnuNgz25Hh0+HvGdO4hTXL+8XJHW6owNl/T6XEbK0xU9eK0bCtWx9K5DGfi5nnL1gqycj5t2nRdm1OV1wdKkEnMZqfYRRAxNwtpYTLz8Wza+s/m27jNZNhZ8gIQtYvKQYt1WNVCtRRrmVK+bvRKDm6xu3hTBYEK5JtXB3kGIFVuUpQNwRX7N+Y+nT0YUGcp3Nv+LzEreZdodaw6iwd4BC9tkNzS3d/V14KeoO1l7uHKQcVAfnEwr2+VTBVv294YzZgwfo7fSHjipIBQV7fLnkltYKJrBk4lJ7vSjdo+pX83Vq/7C8e82Ku6OVkkWl1Fbb78Po9ro7YBYpNeM/o1fPVy7hPxQv+lTpWfjs4UiEV+9draq/ajIpFRKOYdoLEhWyr7tErNKtMfQeHO2+YWKTsOyTP6qSgud7J13JIJ2GU1zK5n3KQ/yat9ehFjk7yi+Msof9dnYD1Ur3Fj7K/4dZ4ZkK9BRIOi3alf16aC/+bNAkHocMSUrw+n6kRejf8wNl2QcWMXS27bgzLc1bgbEwaqYwvoBRj2hhNUgn5ByzukwxbzQEdAXrbzPMtEBnJ56CK/jXxb2YuQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(39860400002)(136003)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(55016003)(2906002)(966005)(5660300002)(478600001)(4326008)(52536014)(38070700009)(41300700001)(8936002)(66476007)(64756008)(66556008)(316002)(66946007)(54906003)(66446008)(76116006)(6916009)(33656002)(82960400001)(71200400001)(55236004)(6506007)(9686003)(8676002)(53546011)(86362001)(7696005)(26005)(83380400001)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?EghyAAFOj312w+SVVWX5H4tUAOrqp6FLjTBbp3Mr0BjamOXl11J7nHNSzWPt?=
 =?us-ascii?Q?LMMKC8WeLKZ9WhOXpbY76EkLOJvOBN1tmUqMr2xnGdsaeBFJfBEnTYOZGxNp?=
 =?us-ascii?Q?L7H8BTZHBbHcCW/TyejdcU3AFi0OYinwaeBET9B3cd56ORnFylJsFqYeKUUh?=
 =?us-ascii?Q?x9njRZDZbWs2oOeIS5Z8KNbCaRIvDMV4WMU4dNOaW3Zqwun2xA31YjmY+dDt?=
 =?us-ascii?Q?O6hKtvcXDBFvVeNBR7QqT5U+J0X1BC9ffdke9TJbB33bce1vec+lN09/lZY4?=
 =?us-ascii?Q?heSU8nb4I+CC9/b2orJ1tVGN61MBAqTxRi0C7x9oyiH+qneModx7YS4bkuoV?=
 =?us-ascii?Q?1EQU5vlQOY2bRcWBLnUC9NxMrAAXrlJPWamFv9h+oDPWH+uz1usSFIOXYZYZ?=
 =?us-ascii?Q?83BI/BlnU4nQQfeA1fgCpekP8wFPXZbFXgGWbQE9dAO5P90E+ERYPjlbh6SR?=
 =?us-ascii?Q?IWAmZ2hblzFQwOUtXLmQJTP+eoTxvtlNwqNmih5ZGx5WuM/UlH7BLHSEdYy0?=
 =?us-ascii?Q?oyvVVq6uvx0mbbG++H9sVjJK3i7DgSYSmen5Cd7IRLSGmhfUPGLqdqf2pC0i?=
 =?us-ascii?Q?fZ6V7J7/QFK9Gsfwrm0+8Mqgmq6FC6Dx7worSFlnQ4p2QNz8+1dzydpBS/47?=
 =?us-ascii?Q?YjiRtvWXjp8wqQzOVsI0ziz9VIkHtfELmjMFJSHpTm3ixLt1RkgoxkQuvZQi?=
 =?us-ascii?Q?qe8qQi/KR4iTtfAoqgFqEVfcfHUqsXm8lIMPXRbk1SfEAz28DL2I8C3pQ3Ch?=
 =?us-ascii?Q?LR3RixfBHMaRAR9wObWKTgleDaY5EtQA02Ivi85kAw5cgBzXL967p2bJzr1L?=
 =?us-ascii?Q?BweVOofjqrtXOGkRUqu2BD9uZ5KFZ6nv/H6UMFwput/Wic90tKsElr/McF3D?=
 =?us-ascii?Q?icLROxQthlIE5w/ULSZLAdIbmMVaDlfjiAz7Tj3nK+4xlA1hdOIBOcS48VEi?=
 =?us-ascii?Q?pJd1PL8uBzY4A5scl7Aeh8PSkpCVMZYgbGyCzRnLcunoROI1r28CYrUQaz0L?=
 =?us-ascii?Q?CoHn9AnnJZK4vbyQTDrWLeXtSpVFkP1AtJwYT4yF4Od2Do3bml7cK5khszi6?=
 =?us-ascii?Q?zozquVOmj6f8i68FxHJFZ7ZLS+Q3BhrpdnkUtd7/ThKwFAc8gtQE13XPNYnh?=
 =?us-ascii?Q?w1sOgxQIydIZ7xOeJL9z3bJQULdfT9HgvbPmISbbXYs8F8dgLf1CNTOut6Qg?=
 =?us-ascii?Q?UDHDwCIDwD5nlZ4fQuTvRr/vyy9Z6dBCS/IUiHpgL+8m8KG/JvnoptIGO0mh?=
 =?us-ascii?Q?MKvDJnSjJdjy8mYPF4kwpI5UaT9d2YTs3KnpuIjEeb1QEbz8NBA3fhd2H7Rh?=
 =?us-ascii?Q?jDFKoLfCX38646v/8WnM+S0VJjyLwjYWPXJJ1Obv5RAJU6M5kHt0XlQGn51Z?=
 =?us-ascii?Q?VuxMpanhvSYJJ6FC0l3OoWzv9Lpvu72Wml9qKzuVWyj4kkhzZQyWjrIJsrj/?=
 =?us-ascii?Q?R2OQDRiUshPjxEeE3CRqEI6IEW0MsMQ5sowNCVJn1DDuyyZBzwc5iRjkPuRA?=
 =?us-ascii?Q?9s5D7n+0zkIYWjg3AuFcx6F2OI/AE/j0bfAtGspkkRVq4KoKagnMlIFSzIT5?=
 =?us-ascii?Q?VzoKeDQ6JVbfKOeqA44aQKPM55i/3cmPhPE4mjdp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d54f1db2-e9fd-4757-0ce6-08dc11d319fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2024 11:55:55.1216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z5tL6bJGGTVcpp6aoUNa0KdkSb4oFPs7psjDk+0GGmaQWZ4xX+eYHDNXhiLLnzWIcQmUCF7OA3/2h4EYRlrZUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3632
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 11:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193496

CVE_STATUS was not backported to kirkstone.
Any idea how to skip some tests for old branches?

Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Patchtest via lists.openembedded.org
Sent: Wednesday, January 10, 2024 12:48
To: Vivek Kumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][kirkstone][PATCH] openssl: Backpor=
t fix for CVE-2023-6129

> Thank you for your submission. Patchtest identified one or more issues wi=
th the patch. Please see the log below for more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/kirkstone-openssl-Backport-fix=
-for-CVE-2023-6129.patch
>
> FAIL: test CVE check ignore: CVE_CHECK_IGNORE is deprecated and should be=
 replaced by CVE_STATUS (test_metadata.TestMetadata.test_cve_check_ignore)
>
> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_=
uri_left_files)
> PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_=
presence)
> PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_b=
y_presence)
> PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_s=
tatus_presence_format)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_messag=
e_presence)
> PASS: test lic files chksum modified not mentioned (test_metadata.TestMet=
adata.test_lic_files_chksum_modified_not_mentioned)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_leng=
th)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_le=
ft_files)
>
> SKIP: pretest pylint: No python related patches, skipping test (test_pyth=
on_pylint.PyLint.pretest_pylint)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.tes=
t_bugzilla_entry_format)
> SKIP: test lic files chksum presence: No added recipes, skipping test (te=
st_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metada=
ta.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test (test_python_=
pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbo=
x.TestMbox.test_series_merge_on_head)
> SKIP: test summary presence: No added recipes, skipping test (test_metada=
ta.TestMetadata.test_summary_presence)
> SKIP: test target mailing list: Series merged, no reason to check other m=
ailing lists (test_mbox.TestMbox.test_target_mailing_list)
>
> ---
>
> Please address the issues identified and submit a new revision of the pat=
ch, or alternatively, reply to this email with an explanation of why the pa=
tch should be accepted. If you believe these results are due to an error in=
 patchtest, please submit a bug at https://bugzilla.yoctoproject.org/ (use =
the 'Patchtest' category > under 'Yocto Project Subprojects'). For more inf=
ormation on specific failures, see: https://wiki.yoctoproject.org/wiki/Patc=
htest. Thank you!

