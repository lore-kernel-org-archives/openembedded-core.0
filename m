Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B97C02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 23:37:26 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.41])
 by mx.groups.io with SMTP id smtpd.web11.20195.1739057841181701379
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 15:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=NLmQIG/O;
 spf=pass (domain: siemens.com, ip: 40.107.20.41, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Puc88dAPvKtzgDnYV0NuVCRW6yiR8AKAdXk1bC7WLlfEFKfLaJvAzFr/Faez4WUfQenvYuEKWuXx9iSXUYl4WnwYxtTudoYXv7KXJin7D6ouoxYX5LXX8zKs7YihsQbCbQN/7wy0L7tAUc+oHMzTD/rStc4hjue/vl1+cMs6DFGBOkddJmkNHgXC9OQiFIk/vlVyyjKC3DCBYnBH6yb1BZ1PSXou9juIuzncjtQNcfDBROyUfwcU0SI4E2cy98Wvf6YcyPzW+CyqiEd2KewunWiMBqqyKmJETCQhtU9TTPjG6RjJ+6drStY9yy8sVP2POSUPSWA3gyY+5C41mKx4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33E7Gmjww0hwKvYh4EmCSMG/YMOUHhhD0xtT5O/ADSg=;
 b=eDX0jTY/aNRRKalwmGW0Xrd5/O/rWmAhAyGkTH8/rJyGT5hhKj2DprfI9/pqq9gZaIgvL2RKmTeQh4xN/aIA2rKTzZuz0njCU8A7C/TDPX/AzkVlv/3bR18qoEB4105G0uWOQYQ7lZ42DrTK+RAZBMg2YE5OAu0IGPPsR8gWuBpMQ2eJNFzuWh7dCnx5A2uoP8In3q0hpGs9x1cLzSy9Va+sRBwlv8cmCOxMPhoA8M8avL8gdbOmpHaNU1IrF60eXBkEPVi441bhZuA/UGqMcncWjTVBwo1ErUHtjkOL4uyJMrenXYsC7DFi+YwjWss1pSiPHGh/HCJNiivYtl7+Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33E7Gmjww0hwKvYh4EmCSMG/YMOUHhhD0xtT5O/ADSg=;
 b=NLmQIG/OrI9dquiFjtXoaEWSUjs56CuabOFYD+SrL6EDOPSGqoUuNEPX3UEv8gTEVvHyfWeo3itvPoTbEJNdZ4oMBlfPXHWZ46r5LXcUnFSfuBr8nfsozDZyL5ThRFFS/4pdgy9SHpG8DRh07x9IF2AgZH4Rcu1Qk5ABhx5G454pNvUsuk+9FAqmP+0Hg1Ts2Y+GI0RR3jq/N2kYVeAS3ogskjlHENDE6Dw2unVKIWHI1z7TcUadfruLwXondnGmYPKwFN74rk26an/qGFjy8o7twhzr8DPMpOE61zNw2yTg5/8XOvwEtKltgTxD3/PJ645DFMwRJd/ypyFi7vUUYw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GVXPR10MB8946.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.8; Sat, 8 Feb
 2025 23:37:17 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8445.005; Sat, 8 Feb 2025
 23:37:17 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "patchtest@automation.yoctoproject.org"
	<patchtest@automation.yoctoproject.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: Patchtest results for [OE-core][scarthgap][styhead][PATCH]
 python3: upgrade 3.12.8 -> 3.12.9
Thread-Topic: Patchtest results for [OE-core][scarthgap][styhead][PATCH]
 python3: upgrade 3.12.8 -> 3.12.9
Thread-Index: AQHbeoCO3IPAhvPLVkuty+cseU6bqbM+D2IAgAAAMVA=
Date: Sat, 8 Feb 2025 23:37:17 +0000
Message-ID: 
 <AS1PR10MB5697F8EC5190A4C4D77CEDC1FDF02@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250208232319.3602940-1-peter.marko@siemens.com>
 <01010194e7eb7300-3cafcdd1-3d70-4207-b807-c279c4cd3c1a-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <01010194e7eb7300-3cafcdd1-3d70-4207-b807-c279c4cd3c1a-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=622c020a-00fc-4238-b885-e67679d90b9d;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-02-08T23:36:34Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GVXPR10MB8946:EE_
x-ms-office365-filtering-correlation-id: d27d81fd-2aa9-47c4-c84e-08dd48998609
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?hU8wVAPWNZwbmjGKLWMrCNmgMExVUlysm0hjD+1ZMXO6akG8jXTfryOZHmtT?=
 =?us-ascii?Q?Q0EVSNoozKgRBiu2p9zWBGDd97cBJcBVPj1RmTvReysjqEYL5Lv3O/jtnGcZ?=
 =?us-ascii?Q?+GnVkkbPrWHy2lebC/kAN9UUulMWuLgcSu2iHmc0a4M4ceVAiir1xQHKYTCp?=
 =?us-ascii?Q?S49hm3FKPlS37BMqYOYHRGZFyNoGay07sAmwOGqmo3TgtdISSfENcy+NCAQc?=
 =?us-ascii?Q?SbZXybLxXRnO0XMmquG9uU2JxjwVfWNTj/u20k7lPtJsw1DBKCR/DUBxQwec?=
 =?us-ascii?Q?3GO6Kw4g/uxnyNfJpUwR9knpXhgxCYvBygxtTPUITvoknl/MOU15Cl4cKB1h?=
 =?us-ascii?Q?6U60MFNNqiwCyU5j9pVUHlc1Vkjjljn3xD53O+XkgJx0Pm/Z2zHJ0+masKMQ?=
 =?us-ascii?Q?VsIiuvHsXdx+vUYFce3pg1bMu6PcJ+BwqKINe7KkFsqadqcvp7jgu1474bVH?=
 =?us-ascii?Q?MEIFXISXXDvVyqFJhvSOWy6olMjjeQx45oBuK0YKGi/aK3sLIcXmOCmqlIaW?=
 =?us-ascii?Q?AJ1ZB46efs8X2T+YnjhNSDr77teVr0yoTaLyTTcMyp29bPebukJO7bl1InFn?=
 =?us-ascii?Q?TOWkvpkajvyFP70EncElvWxMQYvc+HZqeyfdXKBxAN+MOdbk9Qo6Zv6mfBuQ?=
 =?us-ascii?Q?kt2KuVLtBTfgASDS5vjajt71t0DRZihmFEn2JevhrrUU5gUDxqRb9ruE5GxF?=
 =?us-ascii?Q?hUxb49HQvt8Q3qKfTQLdXQTUeA0Y2ypCo2u3JXNpIwT+zvTFF3o7G4+Bc8vV?=
 =?us-ascii?Q?iglQgOXyefy7DFthn60Ix3acQ+vOPv2+mJlNl3CKF5JEDevmQ0ylPCzTCT2F?=
 =?us-ascii?Q?j61revvpzTwjixmyDapeeCsfIr+zvID6IOtNZAyUwQwkwqr2vRdeL/fcPuNX?=
 =?us-ascii?Q?n9rzNIgNQNFhKILX5lZYkWQx4G3/kdHJ40wwSO2lxbRDjED5p9MKLwvRFgQ6?=
 =?us-ascii?Q?R+B8wbVaMAFSGaVR+mTRjQEz8UDUA3mqKluu/uwmO0yI7mYZEfHL/UZ5sNNt?=
 =?us-ascii?Q?b6r5AzdOZm18w7zkzD6Oe90xgOhrOgsrXP1X38pUmgw5u28kbSAOfP1H9dOA?=
 =?us-ascii?Q?behf9xgSL9iUgVIICB3R5p3hjTUgJB26cwzsgOHPO7XWtjjk8nFVR9NTNr8M?=
 =?us-ascii?Q?Lex88lol4xutC6PZf83x7iIx5jB0G3zqbIK3pbarFwDGdz8YNTO49pchfOIs?=
 =?us-ascii?Q?dKFJsQ+4KpI0+crPfCDOlWiDu4zJNZY6mZnQxG97kPjwzRbV1louFCTMpbdK?=
 =?us-ascii?Q?cfkgEfvvo1ig7zOZuM37TX7XAYFBhxD5t+dTDaAx1MImDc/3gINizSplCVM0?=
 =?us-ascii?Q?FQxEo/BKDOaVWLPvrrMIxhKDyLRZfvg6k7QfK83gOMZNZvRlN4joadgQpegt?=
 =?us-ascii?Q?jtBiSFFj8n2GpRl2WFwQqrKAvOqz?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?4f08ZZGz5/d0X60ynEdftzz7v0r90GYDCit1PuTgdUtS2tbjIMXdnY4h6sRx?=
 =?us-ascii?Q?T3VxqutXB/IVG4coUNPMDmGpPjzBNJztEQBhZF/Xg2mhpmOg1GQg4oH+6o7m?=
 =?us-ascii?Q?NSZUuiquRUVb/PshpIlUFGovnemNoIHaaM1mv6BeR198gK1EGpuE6phfdfgA?=
 =?us-ascii?Q?IFeioBof04O+ZQ0Zbo2VljvOoRjyFanaOguygJog3orky1asLKS/qo7MBflY?=
 =?us-ascii?Q?3tJAfNAWpmUw2v/Hkp/MuwfQqIzy7okhL7JfWrCSFYZmT0/Y3sr2apZKjrkd?=
 =?us-ascii?Q?vJYuxGE6PbrWt/bXHyLd1Dd8l/3mhRnhdR7/ZP6v9yRcKCpmLR0SF8udwYbD?=
 =?us-ascii?Q?kSbIJbpk68/Bd06fXYdLVZQoN2hd1bJYNZepIa2Ow04jxcNi4V29Y7v/Du56?=
 =?us-ascii?Q?Nq2DwtoRXJEKL5Np5DyaMCPG43HN/bPWTzutSi4YGY/1zAEaWWbpGyNQJZmG?=
 =?us-ascii?Q?peBg3NML1U/XWSkNfz0exKqkRmm2K+e1uXPQisdKM7gkfIRwx/0+rPj9p9B8?=
 =?us-ascii?Q?fWzg768nU1JCKWxgOlAl2clJz86nd5hp1gvmFoq0AiKpEx0XHIZ92vsw38sa?=
 =?us-ascii?Q?mqKd2ymZQwX9m2n56QRz495HFdZ+iG/XAq5HeHYRir1fNsqdxdTIvCDTQyUU?=
 =?us-ascii?Q?OJEZ7U4E0i8XqByReLO0DNJ2r7/bJkR/z7+xBBoDc8lyIaTlZw9jI+E3T6sv?=
 =?us-ascii?Q?uVsFeQV5qmRVO7ctbOMFpy3TP0ZkfEM/KAv5vxRKl4KJIA3l3L0LIOkO1NRo?=
 =?us-ascii?Q?F6366vbt2i2vQnuxVsjGuZ8iNKIMSJvD0BaRs5El4YL8EOD6uwtpwXZLpKme?=
 =?us-ascii?Q?9ox59pQgUA8IZ8t0/ff99VrDR5fQ0wZ8lcH7IgJUSaaBiKJ4g3BKypGxhnHy?=
 =?us-ascii?Q?3uDY4t18j8AMlT5SQce+Id5m4zW34suWC8kCObuQdA5D/kJuSlod3DNFP6FU?=
 =?us-ascii?Q?bZTyqSsNmC00KxjrqAe+5/rqOYyp4oUVy/xcJrQ5fWWsd/mMQqcZbnKkwURr?=
 =?us-ascii?Q?msGiSjtCopegHkULvKAduivi6zyn7t4+R5Sh9KS+IXK8DcoDwYOzI47BfwLr?=
 =?us-ascii?Q?AY7kowAjrHecc+BSn8lEflSywqdB0Oaph47AcbSkMq0izJjSoBA6jtNqf3IZ?=
 =?us-ascii?Q?aU8u2z1Zso0T+gxPwx7GzcWTo3yVVg6UbeTg9Rsg5LtF7smga152gj3L4TMH?=
 =?us-ascii?Q?W6Q7p8BqmdmWvP2IIENk0Kv0pV4tiSNSL1UIWVNS8iAuI6jmCmykzBAQyD+e?=
 =?us-ascii?Q?fGwu6kJxXfRK2DNJkXgq4XChB95IKFVMerAHn7raDeZtGjX4sn5fDePQw+ze?=
 =?us-ascii?Q?PZB9tp3qWq1m1TsxpopNrTqVSWS8rW7dcr7L1CqIEOzbxOs/Mu2hkog7MLWc?=
 =?us-ascii?Q?HDhRmn8gUrThprbHnF83kbvjGbb/w+1gJuP9Z90kV1DDANvYTz0c4sfmT4QV?=
 =?us-ascii?Q?T1Ql04DbXUIK3jEyMpiXY6IVQDx9devjcplr4XMK8M8dBIBnujlMvhza8NXK?=
 =?us-ascii?Q?6qTvRwGqjZHn3QENwrJgehgpijcyJq8oQPPLUNlS+EFoey67J9N4BcRje7rf?=
 =?us-ascii?Q?b0aBQDtkmncE2jWNinXf012QjCJ1SqnF9lw/GB05?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d27d81fd-2aa9-47c4-c84e-08dd48998609
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2025 23:37:17.2095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LWR7YcuYWKK7qpA4z0NuUnSa5idm372dKa3KjIrDZsqKu+4O5urX45sJr3OvMvanbISCXdjdZ1TS2Hlr8inn2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8946
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 23:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211046

This is false positive.
I'm adding patch which is not related to any CVE while upgrade fixes some C=
VEs.

Peter

> -----Original Message-----
> From: patchtest@automation.yoctoproject.org
> <patchtest@automation.yoctoproject.org>
> Sent: Sunday, February 9, 2025 0:36
> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Patchtest results for [OE-core][scarthgap][styhead][PATCH] pytho=
n3:
> upgrade 3.12.8 -> 3.12.9
>=20
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>=20
> ---
> Testing patch /home/patchtest/share/mboxes/scarthgap-styhead-python3-
> upgrade-3.12.8---3.12.9.patch
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

