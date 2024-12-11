Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 642C9E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 18:25:15 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.40])
 by mx.groups.io with SMTP id smtpd.web10.1794.1733941505867972934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 10:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ZuipHBYT;
 spf=pass (domain: siemens.com, ip: 52.101.67.40, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dK9leNfaOZwQIBptQSgQXAJunKvwUDTq9WXcIdaCrF81pBPJ0BNW0Q8ccKb+v7dN/gVg5RpCxk3Ust2UYTp5pLxSjOvrVr8jpEvNbuS3ZIreO5TfnMQRsTdv1tOBRe7T8dJuz9nsfxIiV0iXWrH2cI6mF8KzvblcQa1FfqvRoSP/3+CX4FrDO8vLvBp/mFX12oCKfo2Xn7eRoP7MAZjQlYrJ8y0Vgjk4ZEMw+wIe3JRUBIOZVx89L9iv0ounf2Z3NxXM4USopdo/zfcwM5trwmXMMXgMRhJLEydw6V01XmkxG0lmx5xbOpNGvavz3e/qUSEw2ni6dwUk9cSXi0xfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQHGxOh5SEKQ4TJ5fE+34wfn7OaZaXnsoF7/vQS3M1g=;
 b=NCaB7oXqWKn8CRvg9tEeihbVTXrrPUcsBZ4yqPyv5XnT2fwPeDeLM70QaExAGRoWI5D7MFay5j7LQ2JxOZk64v5wS0zziwKl3ViETdq6cohccwGLINSKNpIRunKSMaLiubu9dXeefRu3wngtEIuY3ycRDILBTf49PvYPvP2tsRLUSVWUqV/gWFJGaC3fw7r87dGLaYRws6fMxhL37PSozyKvAOwyp9rgRjQ68mz/aABAeYqsbtRk8lpf2et9flGMagq7/PYp0pWUEnwo7tl4c/rTk+/3H/HEoRuBWQRAGBD0yP9zio0gmx4/0SHAKS+dRLz8G2LvLyMGmIR2KxBdEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQHGxOh5SEKQ4TJ5fE+34wfn7OaZaXnsoF7/vQS3M1g=;
 b=ZuipHBYT64/Ua90KSMokpZrij6UmrM6e0OkjKZUTes+LXIR5D5lXomXjchFSfx3GaeD0nL8VNN46vaGZACComfL6kjgM5HpiAPt8pCrlX1oSUNAv1TdMsZ2xygYqGyFfiIRt7p8Brh/Q8+DuHmFyF9aY7KP7EvzgLC3zWpgaJjS/8eNKdg5sw0zC1DB0fGhXLDNKYhWsxEfOzOeC7rSxJz6437TbWYjlZ3PQTcyjdwerVXjm3tSRYDEUuCvX2//sn5j1tBYwXtfeyPIojWx5JVHunpAOWGeGt+Ml+ZhNU939yygw7xUvDO8piS5NcARhdAcnjqpim3iNTtKEI0+MEA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA1PR10MB9084.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:445::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 18:25:03 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 18:25:03 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "patchtest@automation.yoctoproject.org"
	<patchtest@automation.yoctoproject.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: Patchtest results for [OE-core][PATCH 1/2] curl: upgrade 8.10.1
 -> 8.11.0
Thread-Topic: Patchtest results for [OE-core][PATCH 1/2] curl: upgrade 8.10.1
 -> 8.11.0
Thread-Index: AQHbS/gPwp4EjyC0ukWZL+/toOfCKLLhWj0AgAABiYA=
Date: Wed, 11 Dec 2024 18:25:03 +0000
Message-ID: 
 <AS1PR10MB569711D4C80528D27CC265A1FD3E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241211180953.3369248-2-peter.marko@siemens.com>
 <01010193b6f1b4c4-6fb43b4f-1036-48b3-a1da-9aba5a15c4a7-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <01010193b6f1b4c4-6fb43b4f-1036-48b3-a1da-9aba5a15c4a7-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=6c883743-8c26-49ed-9942-63c52bd38660;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-12-11T18:24:03Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA1PR10MB9084:EE_
x-ms-office365-filtering-correlation-id: 1b99fcbb-57e4-4e82-9421-08dd1a11214f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?mgQWz7UvZyqg1p7nScLx2LOppK+KVq3p64IZ1yhUdtH/zGxY3DzxMZCds+pf?=
 =?us-ascii?Q?HwEmBGQYxCse65I1UPiMeLPV+NFICTTqReOxOlG4MW/HW5VO2TIm5PC0luGB?=
 =?us-ascii?Q?zrnOzcTGOQL/fjjKXU8SmkhaM2KK0i4VQYKnprxiQqBewWk4aU2SeWf7E1ti?=
 =?us-ascii?Q?uOdIN/JAEzFdFNIdQcOlyc5MwyEIWkO0ffFLGxl2HLp4XKDIH3e3Sbdp32V7?=
 =?us-ascii?Q?R9dkywEGAnLvgG95hOuqepdMIHZkydW0/4coOTLMgsfhiYQmyBLU51BwXM56?=
 =?us-ascii?Q?XGey3fO3jdQnmhEqhjahH57ahMUUS1UJEaOzs+J+En9XzmjzqXByvo0FoL7a?=
 =?us-ascii?Q?kqojQ9q7KPeSLKU9xMUMhp6P3uT8tnZhFOUS3O0GAz9YwKoAW4pqmLYVMw2m?=
 =?us-ascii?Q?I08YNZBsLpSA7iSekIi1msPTajNDLMi39RAcvFl7N1D6TRZv6x1vuoYKWJsa?=
 =?us-ascii?Q?eeaHL8bsruHCG0Ozs0dnd16OkaVpRMe4vdc6pXEipjkNfX7GiLs91qTOhV8c?=
 =?us-ascii?Q?+S/OF3qMVYfWL+pLDT1c7dZSBIrVB4HoxuLgALQTwlEqrj/6ksvYo7H4qA9U?=
 =?us-ascii?Q?D6BIS4sGKPBDNucNG7tLPhQfrKWNProUHnwgRMpznSWWD67zkyVv+TU9tZ4o?=
 =?us-ascii?Q?vWOdCvAEp1HbPBzRGjJ2b/wpQWWA6JrGgtRB0k1kRBDyhGUhAI4b8jFPg6mY?=
 =?us-ascii?Q?gB3vLnKkgBZcMYqL2GxUlsD4IleEZ70yGU+kymgEDvAP8EBQ2ZzmK15ORhIB?=
 =?us-ascii?Q?8VQCi8+iPY7rsnzPR7/MeY4MlQNtKwWK1FcgISQV4AUxkTSIP5Z0aNuMDLdX?=
 =?us-ascii?Q?60l7OYm+qH616tAcQCqc6c6XHTVcfww45RqQd+uGnN9YsibBt3FYfIPfz51N?=
 =?us-ascii?Q?znoVjN5nwJJHqQxr1uM/oR2j12kkZV9BJUj8ylR2ckYUNYJk3enVfyrT2wgN?=
 =?us-ascii?Q?gzck13BsU6ufU+dD9kAQBYeCF3QKMR8JpfnPZgup6/KeF8yOACIHyVvxqRZb?=
 =?us-ascii?Q?XeYaqNLBQp/DiFoRjTYBWirSO1KcoHOlRTII/P0QRSl/p8UkWO7hgrkmak5E?=
 =?us-ascii?Q?kHBPi927mEhVy5E02VHIqw9ghn7x+Jtu2f2MGn+ZBkL/kdDse48MWrgun2mz?=
 =?us-ascii?Q?IXXO9pnQ/xcY3bM6rsycmsBbKqxLW2BpR6DlPW3OkMXfWjregckBHA/6EZCl?=
 =?us-ascii?Q?lzHOBBRIng5nXUvz+QUyPnD0MLDOlFmuLZY9xwaqJJzEVATuOVXFMbmTgjeF?=
 =?us-ascii?Q?bILd4atClI7nM+WupTOQmdKrfGcHAcfbAbUgflcP5u2XjvPVXP3CF+PPYVo+?=
 =?us-ascii?Q?MXBAINRhpy1e+/FxxxfNmuO2vnruV85P1Ao+pmUkYlUFDezwjNWsqb5ZKnmm?=
 =?us-ascii?Q?mVbFQts=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?uLaWAXbqMLv74v5/EHtAWQOGCyiORhS38AwStQYOQ13suII6p4YzN29PlgnX?=
 =?us-ascii?Q?io4AGqXZ5vaqM8s0pNTR62oCuyvZEJ6I2vEGuL8UoLNIkMAfOdOHZ16GSkI0?=
 =?us-ascii?Q?rhcO2DyGydnnM2Pf3BQ5mkIjQ9ZfLC2VVrM/c8bGpQybX9O+iRW60aryTjJ1?=
 =?us-ascii?Q?OtbYlE8Oa4bqZcdosIv/f9DK9AQQeZOFHA5VF8eGEjRL8wrIM+JKz2npKfn7?=
 =?us-ascii?Q?XT+Fi17r+aCJ2NZ1EUMNtTo/sZg1h8pBEEIdskxT6RwoesFjyVcbmPlftVT+?=
 =?us-ascii?Q?pjIXOX3/cSbRXVhUe7OBKuF/k9CQUm5UpfEXfxOXLYgzpjkfC1CivM9GAISN?=
 =?us-ascii?Q?brhFUImQEEgcFW5DfEaKmpFtLGvo/VhPxSgV99Xe1FHazvzgfkeew/+pWTMU?=
 =?us-ascii?Q?Nghp/ShndBnFG2BsdKRlKP5Oa0AeeopJO/0/NOTX0ld2WGdpCJO/QsIp4JAo?=
 =?us-ascii?Q?JCQ90GCIOnpu0TFbrW8zjOjUpyAUcGnxRg/FXG1lu1MbIEI3ykliENvqCiIA?=
 =?us-ascii?Q?/LFxzUtYKB9gF+SDXe3r1g+/c93rzxWHiZf2LdrMlqJ3lpqojF3dn5uzxLoO?=
 =?us-ascii?Q?hS0GbCPzxHdbl14wH3gbP8P3tnBFKHB4OR5cMzQlsZsZOFlMZG/+4W9o/uRT?=
 =?us-ascii?Q?Nx0YyHHhLeGRub9ZxBYJ4n28fnXvPM6h9DS6EDA8T9gIKH35ksxLKm0wbUif?=
 =?us-ascii?Q?6ZiRkEoTtj6hkQ7O3lJcmgqjsEl8d9L+ZapVh339Al/FqynxIvvYIbHuq3hw?=
 =?us-ascii?Q?H+7JL/OqujKjwsDWxg6tEazRWck9eLRA4lAHqMdFVlZQwUPOM4HDsBNRoSeg?=
 =?us-ascii?Q?QyrOCxPjtxnvtUY67DBAb7Rqn6P/06hEdDHQWHGZAFo2ro+qotcNrZJzwDJe?=
 =?us-ascii?Q?0F/Row4h0WqOIjauHrYWAyk1AanjuQ9Ws9exKAVQie+tNiHRgp+5noifQ9YK?=
 =?us-ascii?Q?9w7TG8qnuQHEYz4+mdW/kSDkxhDTvtbM8UlUlCQuSSm+ZuLsBTRzEA64ZgT5?=
 =?us-ascii?Q?PrFVMgPd3m8M2GLIzIjFm0lwy1KAItF4HWK8Iz7BgmbRM6obyRidywpY7FCW?=
 =?us-ascii?Q?tMGkfn1W46bps1kEwuhdqKiPhVVE2l4rO0iM/tTp/DdxdEuSKVWGKb4XRfb6?=
 =?us-ascii?Q?zAcxCebwubi+aOeB5zAdx5B8Flbg8Ye+1G/RSNneE0+l0HlmtlZvZMQvH+Wo?=
 =?us-ascii?Q?1mVK3/8Q7L2zj3gLbD+LmwInzREUjECOARs3YID8B5/xap2ouJAJTOREGM37?=
 =?us-ascii?Q?qIEXMdNyx7igmAp2UHc0WifH18wHvIr0HF4ka38qNHYPF2MXht5LRzTcjv9A?=
 =?us-ascii?Q?HwkCNR/b2ujB6AEXZ1svNlRHjc3cVjhnSzV8si0kIg4X5c3mybRuyiXUmAo8?=
 =?us-ascii?Q?gPBzseQ2IHOOS937RqFoPKFdOrtonpq/nRKpItIBHnmlDk20pcInh6XcaRfV?=
 =?us-ascii?Q?H3zulTidVqGYSouUpIvmI9/Cb1W58D5h/iXIc8uyTMYrFRE+fYJytPfAbWyy?=
 =?us-ascii?Q?lTPTcxjYGdLrH4u/KYZPTs1ZvTBZeLp/lpFDnOYrqqAmXPI1z14L/AeYL8RQ?=
 =?us-ascii?Q?YamKOgiQxfV/RAItSjOyc4FNZGTihY6Iw219L8tj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b99fcbb-57e4-4e82-9421-08dd1a11214f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 18:25:03.1717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aeST1f20tKmFpAhPyD5YCvEBEp8BS94VEN8n7E05DvgAzgUi/KG+Vkjk6rj6JZU27Juox8spM9Nm0S12jB3heQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 18:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208609

This seems to be a false positive.
When upgrading recipe, CVE patches are not added but solved CVEs are being =
mentioned.

Peter

> -----Original Message-----
> From: patchtest@automation.yoctoproject.org
> <patchtest@automation.yoctoproject.org>
> Sent: Wednesday, December 11, 2024 19:19
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Patchtest results for [OE-core][PATCH 1/2] curl: upgrade 8.10.1 =
-> 8.11.0
>=20
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>=20
> ---
> Testing patch /home/patchtest/share/mboxes/1-2-curl-upgrade-8.10.1---
> 8.11.0.patch
>=20
> FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in pa=
tch file.
> Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-X=
XXX"
> (test_patch.TestPatch.test_cve_tag_format)
>=20
> PASS: pretest src uri left files
> (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test CVE check ignore
> (test_metadata.TestMetadata.test_cve_check_ignore)
> PASS: test Signed-off-by presence
> (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test Signed-off-by presence
> (test_patch.TestPatch.test_signed_off_by_presence)
> PASS: test Upstream-Status presence
> (test_patch.TestPatch.test_upstream_status_presence_format)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence
> (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test commit message user tags
> (test_mbox.TestMbox.test_commit_message_user_tags)
> PASS: test lic files chksum modified not mentioned
> (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_leng=
th)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_le=
ft_files)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_li=
st)
>=20
> SKIP: pretest pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test bugzilla entry format: No bug ID found
> (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now
> (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test summary presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_summary_presence)
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

