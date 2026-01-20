Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D384ED2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:53:26 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6790.1768917203872023214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=K6iY/d4k;
 spf=pass (domain: siemens.com, ip: 40.107.159.36, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFJB9AU6lKPpALygYk3uwGVZAs1JAc7lRpI9j72DjlE59pbfx+I4dIkGdtfhHk2TpE2WF8OqwQwZdQ6YMAXwVqTqZs5PcWxx5UsjXjztoeuTEYlhzJAp5CjHRibLxekKOvIKaq/Tfe/ayxZNA0I6MyGMNe86DXhpM28uFUPV2nN81ODuu1sa5NfcPR1ck09LpuyovD9kjLu9ug6PF9N35OdrSl1EqDzXxeBUX4UnuWfCIFAB/gyzG5c6602FY9969kAQUMEwil+6+W/twvuRhb7unbZJ8wYRrjBvj387KJFltDezRrGlLiZxH/kyGqeqrP38VPDr89eOqFeXon31tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2YAt21VIjCMGqQiaDYBah2S98hAuhiVcPw0ok9p0Yg=;
 b=fWf59Ll7Qme+HUjvids9mLEkZbTyWweOQEpDbwDq/Xpc9Q/imozIolm//1A1wB6nOEiNLcb9vd0WnvfpQH1yuYRqYU5nGt4gd58OWlL0u+1cE2vvj/lsS2pOUpybW/3dXvg4K6CFTkvkhKD6HZq299MSCdkQEaKIH1JpiHLQeMEF9XVJ7H2wU1bRW0O0erisqB+DipUeHd98hZWvLuconqLYSVgoOmAtuLMgwuTgri9N9o9toKdkz9LOCFW++Q/ne/BRFvRVtw3nHSfstBKPQX8zuLyYaQvo16GoCVytBl6j0I7bHNLuY8R/vSlV9+gNTfPubLdtDY2T/1xmsHfP9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2YAt21VIjCMGqQiaDYBah2S98hAuhiVcPw0ok9p0Yg=;
 b=K6iY/d4kMbNP2zYUmoJsnD9r1st00NU8+trvjGsjYe4QbAANZKoRJ4n7yRBAsxUs41omhb1MbXNLyPpAW6TyJvZqmXB3w12wefd5677tHvzyRxTj3KE2W7yu8oFF/TgYhCP3XSbCSPMrY6akmVoFAkcvv9g/Hw6czNYnbRqjXIKvargn2GhjDeCD01D11cr+aUIHoiKY5oxC7V3Vc9CQpJdPopzqn7s3PIv1KImoq03JfhmSZRV8sqnbFwoafEbWBfdE4nPqYEx230AEfrL5F7iyutcb6WNbQP39urHXM0pDd08D8AXMBogMMTVR0dsXFZmcccXDNHrWgiry4WER0A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAXPR10MB5710.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:246::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 13:53:17 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 13:53:17 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: Patchtest results for [OE-core][kirkstone 10/26] python3-urllib3:
 patch CVE-2025-66418
Thread-Topic: Patchtest results for [OE-core][kirkstone 10/26]
 python3-urllib3: patch CVE-2025-66418
Thread-Index: AQHcihJEX1VoU7ftVEiRHUlQxbtCx7VbEmiAgAABmoA=
Date: Tue, 20 Jan 2026 13:53:17 +0000
Message-ID: 
 <AS1PR10MB56976F94658942F591438EB4FD89A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <49af1e1ee78adc165a2c1d6905d0de79015a942c.1768914702.git.yoann.congal@smile.fr>
 <0101019bdba8cd9c-53c2fb56-e648-41f9-8f7a-94a616b99e4f-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101019bdba8cd9c-53c2fb56-e648-41f9-8f7a-94a616b99e4f-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a90566b2-04c3-4c23-a143-25564601f6fb;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-20T13:52:54Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAXPR10MB5710:EE_
x-ms-office365-filtering-correlation-id: b6e2d739-c56c-420a-b3d8-08de582b438d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?khFQoaWcxbRXXrKsUH0fsuEN+9+NFlplAWX32XizL1ZvTorgURXcnTungXz2?=
 =?us-ascii?Q?eR0SjZlt5cZLKLo3Z6fV2gln+yohEGH1Gwyv7tm4V52OESmCN4q4D4nbdnat?=
 =?us-ascii?Q?n1Ptes1HJkUePB8LfATK52HaYV9O1Y8RohRTZvGNiLTwGlVg9Y+IVo1OCsxJ?=
 =?us-ascii?Q?aThYP92NGwXKg1tGxTLZoId1H0e4qJMZGv6y04H+4lLlVQPOVAxYjeZhNvM/?=
 =?us-ascii?Q?yTg7jyVfq3S9OrDG9nIGIX6Pgx5FwMe7+Zual3T+8Yv4pN81qFfZiiaMYs0S?=
 =?us-ascii?Q?mysev26gQAFerh31tk/vFPSu1Luzi8eGTCEQgnTvjK+Y9MLsc7RjkhSBznZL?=
 =?us-ascii?Q?Ky1auGSrKU08kTF5rzw718aK5fYOpphUXH9ya/LDEPdp0IefQ6xy6EmyzwIs?=
 =?us-ascii?Q?EaKejGtjLSR/mYvHTh8ruOqvYfHhfEKlk69mIaFww8S9fasan2Coza3uYgPy?=
 =?us-ascii?Q?UJ5zaugQY+OgJStPJ0890AantR8gNgAcopqmm4sN789aHXpI5IMxjbGddMtN?=
 =?us-ascii?Q?/dwOyC3kQn9/cUdp8IEtIRuwK/YVca9zWCjXkmWDDdBUkPK9M9OpgNQDY9jc?=
 =?us-ascii?Q?RUPjwcNjVQ9lZTZP0uhIScqF5xPMYJ4tXtZ+MgVHZ+P5yM/Gvu+p4s8l5DLn?=
 =?us-ascii?Q?lVv01s8tb1wfFvj+BuCPVRDw/Qq6iiVru7bWJ8ACUdSrv0DGivHYpyMEEF9N?=
 =?us-ascii?Q?zHOFPyPTr5s/S3xEDfau+hCOrMwDSngJojTUuclFhP7/gABjNgCHYTCvW3ya?=
 =?us-ascii?Q?WCV6azuvctWUULa1tBZGRgvd4AEBc5MfgCTn9j5RZ5IK5tEYJr7w8FlDhF5j?=
 =?us-ascii?Q?CyIXH0pgfL4yf5oswqwfGhwaLA8RmLbtzDbo6Utii+p3gyJQOUEYCEI3QJJA?=
 =?us-ascii?Q?cUFUrPFtoFp/+S1wsMCncSx2qFar6LwWAegmTUGvcbvBRxb1GEgl/vW2ASS9?=
 =?us-ascii?Q?bQqxnuzf2GJtGgXXXt9LKG2r+rW2p4kKrF/iyTzf+thEGmeAWONe8FkxwNIp?=
 =?us-ascii?Q?v449DU1b751MUs7mloFpFAL7wR81sPxs7m2Rz4SNbpGOfyQ7dcksQ01bD80t?=
 =?us-ascii?Q?5WJeVvSJ+aa2+t6K501OD/OQbqOhUImhxWxSHwsovSrJu0kyKfoV3mfgqlQw?=
 =?us-ascii?Q?Yz7HNOgHVxdI3KZbe0i3od+s/V6/8cXtEt0Uj6ZEwSGLKXB0XLA2gdgRZCuJ?=
 =?us-ascii?Q?TuRwDbpVN4jPKKueew75wREh7s78V5mHQQJwrXC7nd/PI4iavmD8j4khHoGT?=
 =?us-ascii?Q?t+aRs1laqkjLa8ywjdgLvXwEB/MQSLeDQSgpZAYUP8F9kB2RK1NJC6QA2FpD?=
 =?us-ascii?Q?fz+Sz90bdMJ08MxV7O/uhkfHud9yhwDmkUe259o7uVGhWriyzZTL8xf3anBc?=
 =?us-ascii?Q?8UG7ZfU1DAqOcaSMYe6pFGMrUmnL/mEYj20SLM28dasSdzBlWf26zrmWTpe1?=
 =?us-ascii?Q?fxMDfvuBc8lGrikmb2HpmO19D/df83kKR3h/uYTP/6FyioDOmUFBQJJF82l7?=
 =?us-ascii?Q?69NSeg+l85rTvac7fF52k6SgyBbAC3l03745EG4hD7YADIGzgdobwDK7dfnO?=
 =?us-ascii?Q?6Cn7toa07UXr4fxhdzU=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?t6IPLAg0ww4rQP2qJ9gFuCpzH7psylkICZAxXjOZeraatFx9g01ObDoTF2Wf?=
 =?us-ascii?Q?LeTmasNs1Eiz9AaBOgz5ZpsO+W/FAgdkEZG+KDriqiUHC3mpV3+1VVIfUyQ9?=
 =?us-ascii?Q?ftFcH4yOcFYV2RT2faqF0iFIdNjjjhpNEwHJfXR4wdVRl5Y9vobFVu4FqSTd?=
 =?us-ascii?Q?f9xlyzSxS4wVu860LbBv1cSOoOImkiwdvBuhp+HTiKeLpNON+uJUjd+xKiVs?=
 =?us-ascii?Q?iuzbyww4jvUHjbszyebmwHm24fRBnrp8G/0JfcIOfi2e2qseQUyPBVPgIAHR?=
 =?us-ascii?Q?ej8WrmAxkcTrpcfcv1nDvFRG4kFOBlgHjmc5mnf9bBD54+g4Qx5ELJcEQq1w?=
 =?us-ascii?Q?SDgDWJglxgMJ8qWg54i9m7pJKvwFmeGg2DnQBGxH7IRHrG/FjoFsyZwb63SK?=
 =?us-ascii?Q?U94XU+lEl3VEP+i+0iFIUUf7MXC2WSh0NMlpgXh0b8MzoehRIgFKUdXpe2lh?=
 =?us-ascii?Q?dM7GcTh7+Af0YYLUbNrCQsoS285L5ePMzDkB5Od1NrsiBlVsAXk42FCU+KL3?=
 =?us-ascii?Q?sb//ZE6IAub3FIOrI3qmsRKx9AEtG7GP1529bUAZN9/hRY4YyYobusY6LV3p?=
 =?us-ascii?Q?1a/fP0Mb2tuUrqSuQOTYWeIYCIc5XSMx/lGuiRJIIVROJ6htCBKpRfDaTGE5?=
 =?us-ascii?Q?cL4xNf0zKCgIbNm9uWesIBYd6K2Px58sDR85OPI/AxyjLMJ+DlUOzKKSiHnc?=
 =?us-ascii?Q?Y8xQVQdcEUi+iABmjqVcaYn31FeB4INyUjCg5LmMiip9pDfeafflI1l+IY4J?=
 =?us-ascii?Q?ZXNvQkCZv/UkaT/Ip5Bft8g3ry4pVL5WWqj+iJaeI+wh1pFVGThB8nw+b72u?=
 =?us-ascii?Q?M07uZHgBWoCbTyLOqVVSfpy6bLS+WaGpXtpzm1P39UQSHNtJ22iTHxbpOFpa?=
 =?us-ascii?Q?+FPpIWcsVZz2pSxwIW8SSS01v0RB1Xu947tFufzVjfcSIACmNq+fWJ+lf9P7?=
 =?us-ascii?Q?Y+jv9wHEfITZ00BrgVRkIVtfCvIHWActMInZVQ7bVtibFXs8vQkjevlSQXb1?=
 =?us-ascii?Q?arB4eMwcfvd5uLQNLLnzmHK1a6eUHxuzur1wgEqTzaMMGANJdGs+qt8jPzZX?=
 =?us-ascii?Q?ZCIH/iAfw74VIuk/jGrC+cFc1rczRwxwM9SjB/ja0FQ+xSe7DMRBAU22uc98?=
 =?us-ascii?Q?QeNbeQFgBCAbSlvZX0X/QcjVKNME90L0f0WaaLU5obHw9OVvqIsnJF9AQG8R?=
 =?us-ascii?Q?4muQc9SBSVZKmF4x8O0UWmyNdrCXLwxzEpSFaZnrZCGNqQnI+3Po0j+68bBb?=
 =?us-ascii?Q?Nb2s4W5lgwAReYgOl+/otowGpm0cnsrVSye1kjQGEy8SGHt9UStFmtOWs2FV?=
 =?us-ascii?Q?VKWCOARjMEzxiUKyjXDpGU1LVsgKvdgtp4iBZS5YKijlmCn4PB94W2o3bUIb?=
 =?us-ascii?Q?oJR9EJU5CjnVm4VaQlu380okhRwiyGrMPiGO1cZ/z/fQDcfaEshLuOz4iUVN?=
 =?us-ascii?Q?1ssGBW1WO92g35eWUL5gWuqnqyHE+5v+AR9J40/21nDE965f+UnxVmhf2WVE?=
 =?us-ascii?Q?4sP5A4Dkukc8btlWwwnE5CAKqTHZ9jv9zDjL4IpPaVNqkBx1Pqq0FHkVw5Bs?=
 =?us-ascii?Q?gnmX3fv/xEwWAqmu9P5qH+MKXmkAagK4d5dqkp3Ekyzw867eyxUsBc2aUIFr?=
 =?us-ascii?Q?EChiVNkofAW8ECS69Iwp8m74aa9Ev9nXw5iRWOYrR/xUOYTcFGpN0qt1HLdD?=
 =?us-ascii?Q?mSyc6jvHU3bdrn5BV64GTqy7UK92fmFTPzrbuN6AeSz+Wt2k1rak2KS2lDKc?=
 =?us-ascii?Q?3EZRRTOJ0w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e2d739-c56c-420a-b3d8-08de582b438d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 13:53:17.3282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C4IOdg7z9tyOx0yg+fs2pI60y2BUvbdLrlzM1XvkgkMdSWlNCDqMTKsK8WZZgBgX7D90uMRzhyi5nVRLDeW4JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5710
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229736

This was a real finding, v2 sent out.
Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Patchtest via
> lists.openembedded.org
> Sent: Tuesday, January 20, 2026 14:47
> To: Yoann Congal <yoann.congal@smile.fr>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Patchtest results for [OE-core][kirkstone 10/26] python3-urllib3=
: patch
> CVE-2025-66418
>=20
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>=20
> ---
> Testing patch /home/patchtest/share/mboxes/kirkstone-10-26-python3-urllib=
3-
> patch-CVE-2025-66418.patch
>=20
> FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in pa=
tch file.
> Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-X=
XXX"
> (test_patch.TestPatch.test_cve_tag_format)
> FAIL: test Signed-off-by presence: A patch file has been added without a =
Signed-
> off-by tag: 'CVE-2025-66418.patch'
> (test_patch.TestPatch.test_signed_off_by_presence)
> FAIL: test Upstream-Status presence: Added patch file is missing Upstream=
-
> Status: <Valid status> in the commit message
> (test_patch.TestPatch.test_upstream_status_presence_format)
>=20
> PASS: test Signed-off-by presence
> (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence
> (test_mbox.TestMbox.test_commit_message_presence)
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

