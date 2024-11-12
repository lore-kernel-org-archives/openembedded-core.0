Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24100D597A4
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 20:38:20 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.65])
 by mx.groups.io with SMTP id smtpd.web11.97257.1731443892313716324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 12:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=YDPD6b4I;
 spf=pass (domain: siemens.com, ip: 40.107.249.65, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjBE0Ve00JNfDnhi1VVa+Em7+gaqXYwOPJqFgknCksF8ACXUrFtsERMpkJLBlWP9KbqB686u2GxECj7Kyd9FmkuODwD0D21rWFJwP1GW4zhVy5sDZqAmlsw4CEMvz8N4y6Yakf/aN5W8uoyR4OKOG8fZ/vyII1tcyIR4AZF7elErJHwbEnBqVE2CkLQYFQvUocGVtqeqLVMPFdCY0LAyAMspVD9SKDr70wWd9chLXbyoATHN38819jVAcvogK5yAvhU512hHnP+Mm/B335+XUg24Y7zh7VteouSvptMPboDoBGVjnjcC9cDs45/ZT2f4iRHR6dhRulsXwSO7U3fEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjYFP4pGqPcfCBKjEIJKoRefspBsZ1+0BQWv9GdC5iY=;
 b=dFacCvDARTksAQrREppzC2ezni17qqukQLm0mKkRVD/Vcl3IT8tQbSRRJw5CRdUU9EgLHy9ihNsFTXkmgaHWqowHD9OL8AvBMbsyIPTp1fktdMQZppOzGAkkrlcEC0CsR9wfAgXChcGWNWGbLaJAn/iuIN5arw627ujhDSKThMoEjKdU5ZfK7rUvdsV1sLZP0CnFGrhJN34MWYJcgIkv8njLSMm74lAXpliNwgYfdwDvqWs0/CtnUT0z7J9vKx7Lao+5heVfqcM+VQ0/BjBeiOmqSWRIdf+CSS2IJG5U6lnp/wqP6L7zlBhh/xVAz8wSpLQJM/Ui2lHxIaQ4kxdfZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjYFP4pGqPcfCBKjEIJKoRefspBsZ1+0BQWv9GdC5iY=;
 b=YDPD6b4ITU9f0hygRt19B5PawSFncrxcd0K8bnHmWQ2k1HfFvXydenB+FbM1NUKNVdP3DY8FNlQDCjg9plPFCPzBaKhxJGUiQjoQK964Kie6gHwkD6NTmoT7i+V6Eo3vfG5INPekGlM/OCxgncf9FpP1gj1nvoWQcUNBALCJop2t1ahqIwaAAE3EcP/ZCPDjuPq5wRBcs1jZR+XnQaBTTw4bTqWVrHwkrOxawKeXH1ZKG1wb6MgtJ21ITV1PqTBfigVLTWF/9JecDORrcOaZUa+cIy98jsb8Cg23xSWU4mTriihrSrwbtRPf81bCf64Reu6g+ySyURBCo5f67Dtz+Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB6228.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ef::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.15; Tue, 12 Nov
 2024 20:38:08 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 20:38:08 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: Patchtest results for [OE-core][kirkstone][PATCH] glib-2.0: patch
 regression of CVE-2023-32665
Thread-Topic: Patchtest results for [OE-core][kirkstone][PATCH] glib-2.0:
 patch regression of CVE-2023-32665
Thread-Index: AQHbNT2BC33VAMNftkGDSVBAhx2dorK0FQGAgAAF15A=
Date: Tue, 12 Nov 2024 20:38:08 +0000
Message-ID: 
 <AS1PR10MB569701AEB321545B41691D9AFD592@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241112195921.1587206-1-peter.marko@siemens.com>
 <0101019322052671-8fe304b4-72a7-4a99-9bb7-7a9dea858b18-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101019322052671-8fe304b4-72a7-4a99-9bb7-7a9dea858b18-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=4f9674c6-cfd2-4e84-8996-82f93f57b755;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-11-12T20:37:17Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB6228:EE_
x-ms-office365-filtering-correlation-id: 4779f0e7-d3ad-46d3-8db7-08dd0359eadd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Xz6XMj04/3PA3ojrsdGuVDz2HqHYT2l1JaWpMZkmU7J5DVrJu4lKQttOlkWy?=
 =?us-ascii?Q?qCsYKvCc+1U+IR8MENgOhpOJdhlmib0izDMk6bI0Crnll94WbCrhEDnUQXYN?=
 =?us-ascii?Q?ytYwPZpjWda8/tqhW1bF94YA6w26zfAJARmpsAe7osFK+Ov4RA7HDFRK+Cnh?=
 =?us-ascii?Q?x+htDQblNfbKToKxBPER2sXCKd5kTJffbSIw9E0i+zTjDVA6ivKvAiowNCDX?=
 =?us-ascii?Q?rhTWGq+QGQh6LcdNvQF7DVd1PjfFD7TPDoJcrK2uqz1KnkS4J9JVeCSWzrcq?=
 =?us-ascii?Q?tLUzcA8gXbOJCAVg39PbBSeeLhkbX8jChIop4ox2xgeomwHsBQZC5LdpPsPO?=
 =?us-ascii?Q?90xpJk1iBLT/K0SxSigogGW9aNw73VFdyrNenXV9iccf2bLzhIswcuWliEv8?=
 =?us-ascii?Q?HKBlWPvslbKF8VGWiRYWKAy0b0IFwoYQrbUEK8iyfOmlccdYwMHgcBK04EpC?=
 =?us-ascii?Q?5Vz7KbrwWt/3EeYg69RyPgUm4v+m7A57hr4+WGac5BssytKXdCXTIX7WbGPz?=
 =?us-ascii?Q?ouxQNFYxrT7eYlg7kbyZsKI/zPPopNkOpqoCzHmU3mUd4shJgM77esGu8V6T?=
 =?us-ascii?Q?74o/vyfAfWh5uBVy3epT6ZK9gUMWb1phdFCsOLTg7u064QJSql5mp8jq6EBO?=
 =?us-ascii?Q?EViS8t8R3fH19/jqrXEo885AX2+MdHCecLGaxC0TNEEoXf8MvaJYI1tSz/ih?=
 =?us-ascii?Q?5rXXcQ0z4oPJJ93d8QaUUHVon5NMJKBo7X7M1efyHwSAygEJnjv9h7/NVdqC?=
 =?us-ascii?Q?h930dSK4ua5Li9d0tlltIqBOvFXt6PWmcBp1sVhhjmeZ/6DmX1TNxkeUjh9c?=
 =?us-ascii?Q?9dvNO+L3oc27sXW1nipNfxHzx8a9t4efKjHKNMBVNLVOp4vXJcu6Jm67uJSB?=
 =?us-ascii?Q?NPWXcFFjLe3COy5ZmJhJdF2v2oGWyI6PHiVx7pNAZqbMG2It/G+K7qd8Tld6?=
 =?us-ascii?Q?W3zWI1o4IjUByG0+cu3N2ZjhWDaCb7cn3m2WnaTuIyBE/hAYIOQDXV+PQECv?=
 =?us-ascii?Q?fi9CtlKf0AEMfJRi4CfauI4rB9mP0jDwMcNUULwFEhnR1Qsn5CANQ3j1LbJC?=
 =?us-ascii?Q?I63w57Mv1COiarphbqHJHu5p+mbzSRCMd4DjEfy+2nAWWOcK0eRhAUdIxH5F?=
 =?us-ascii?Q?5fSJ0AhhA0m4HTE9jwrdCLf+9xzw/scVPSvanSw6PY8Su41urW5/W7fJKqoZ?=
 =?us-ascii?Q?ZdhoWjGoRCeHBql+P/8o2AdXQKCHRhmzZJEWfgKPk1ThotLgOrFt4aa6knNp?=
 =?us-ascii?Q?1qsK9x7M5EB5QVfhw09MqMgVcBI6AZeNUWXnaQdmx5wLqLVI3MtEq+2j+XSn?=
 =?us-ascii?Q?5S4y9DIf9Ny0WO37oAb6+m5V?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?BSqovpgaTRXOUdis9jEoLJlMnlBjzTtLDWCJxJV9wMkbHEPA0mOgx5CxNPiZ?=
 =?us-ascii?Q?zVsTeidBar03pC7rzT2RyEFjL4657vgONR96DIlNm/Hk/PydIlnVumxotDkW?=
 =?us-ascii?Q?M6ynlqJxQ2dHQDYBGHSdWD+42JM/oJw2cEw6HW1J8QzIzAdRIR/ps+wWXXq5?=
 =?us-ascii?Q?oGOeusMGS+G62TJpbUC66EtNxy1crc7I5dI1WpuXH4OoOQ5FuIjiTuImN7W3?=
 =?us-ascii?Q?JGvVb8iZwhG1McbdCpX3IkN26rEa6XxRb9+zxh2Jkhshog52XW4CWFMIJVkZ?=
 =?us-ascii?Q?E4tcB4rofw4X6+8ReX7UE7gMia0RBMUgQE4+UmPbBy8DH2zsZ4Vr5xneZDyE?=
 =?us-ascii?Q?gghGF6FZdjju01XjbHFgxhxnIM4Z3WUCL8SXdkLvlQyo46Ih7QHMMCrKZbyD?=
 =?us-ascii?Q?yNMLFGFbQndI0ImC4OSxbn33tZdXJ1FwUqreUw3iKKQmykzrBIYAmzw+tZ59?=
 =?us-ascii?Q?GQV68T18nziuTmeMyRNNMYiu8twc8osFbeYvB6UZbUA75f6lul+mS0E544qs?=
 =?us-ascii?Q?RIxPDcy7i8X9xujyijFz3NrFJG+T/Q18e/mWY7COZAmNFW7RH91T0rEecaiO?=
 =?us-ascii?Q?73L6Q0WuA4GwZXaxtLFF1I/a3sHgMqPZgeMcIY4taPgWM8UeNHq6M8IgrNKm?=
 =?us-ascii?Q?XmFQuJeETl6vxcD/lhto+/swQEpMZKxABFaji6JMG6WaKKsHTDPkvF1Jbq0J?=
 =?us-ascii?Q?AhXXr9A1AXZ8RWRHUwNAH4h0dpaIqVyyNBC11P2etjlg/S7GwX03WnadKN77?=
 =?us-ascii?Q?yT6HKxdbr9yrivXYgGxo12DT6G4DZlJSlzgSHzONk6eal3E+q0VC3my4UVf8?=
 =?us-ascii?Q?+EmuI8Zz9+lTQaZL0KlEXIvgnzxBIakoN/NAYD17b3GySsTs1HFXe9aAethv?=
 =?us-ascii?Q?WlxLpmNO9Pm+hQj63sr0CoA/W5S2u97oFPA6/hQ+2zQk7OiseeUdhg3PAS5t?=
 =?us-ascii?Q?Mgn4at17AUs7v053v/jHpY+ASURR1+jNvsq2ttc9xuhP85NaNaCI3M/4l/gk?=
 =?us-ascii?Q?dZocc50Ap2WJlskJQ2W/3Zgh6bZOUW1ws1emKO4EAHAo4GEOVTq1jhomVxI0?=
 =?us-ascii?Q?iJHoPeYYqlHGolgp5v3bQKZR4RNt+OB6HQ6ffj+IXWGnGCcopd/HtePgSvNq?=
 =?us-ascii?Q?KnZyzf4OjhNxJ1gRLK1MPqX2tgs4zX3EAXvX8jL4f7efFCE80UL3RW3hIN1I?=
 =?us-ascii?Q?uWLnrYTkfwXn4S+e4WvF/sAT81S2aHV8oSRsy4mHPDKwPPq/9TI2a1i1eJHZ?=
 =?us-ascii?Q?HIaUboxOwshY8hXTmnHX56VDO5E5VHKq0HOZHBgpBNW+8L6+GODGmbFxovm5?=
 =?us-ascii?Q?CkWoR0XwMrNB+rUVD/k8xWWbnDRQ0CmcLhB+WKuhmb73XligHxqq1A1PkDoP?=
 =?us-ascii?Q?qGcNa5sv6LPMtNtl3oVbYalE0riETiv5zZ+6BVxRC+E5j3m9R3TpEQ0+3Q6Z?=
 =?us-ascii?Q?Thf9Bf2gQhl6/1hz51yQWifVU4QEI3m2j+9wwp+V5nM1YETGTConmsk3GmHI?=
 =?us-ascii?Q?da9e5gNMMVQ0IITVHLwmNcXzKZSECpBE+8+V3FuDMv3Ci3QbCJBQVRRE3J6c?=
 =?us-ascii?Q?B352xNt7/nh9/0kExFAS6w++/ODJNTyGNPvEh75R?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4779f0e7-d3ad-46d3-8db7-08dd0359eadd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 20:38:08.3453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jb+ribUsguqUXgAiudqMIWHPgQfz5ZVpNxLM8TkWV4EKJeHuSs5hZUmcbzb6WCIBhd6kEO4gTLHFbxMAuRnoQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6228
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 20:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207067

This is a false positive as this patch is not fixing a CVE.
Peter

> -----Original Message-----
> From: patchtest@automation.yoctoproject.org
> <patchtest@automation.yoctoproject.org>
> Sent: Tuesday, November 12, 2024 21:16
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Patchtest results for [OE-core][kirkstone][PATCH] glib-2.0: patc=
h
> regression of CVE-2023-32665
>=20
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>=20
> ---
> Testing patch /home/patchtest/share/mboxes/kirkstone-glib-2.0-patch-
> regression-of-CVE-2023-32665.patch
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

