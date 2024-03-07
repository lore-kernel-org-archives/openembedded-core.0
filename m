Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0459EC5475B
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 03:19:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14956.1709781571679835941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 19:19:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Z0Ff3Isj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=379604a212=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4272wSPc011444
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Mar 2024 19:19:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=1C7HtzNaFzRk4dkvRYCyiIqHpanxQpFk0xsqhkalncU=; b=
	Z0Ff3IsjGKFQqzBnQUuaFiNFw0zAXC/ehfP+5QwI/ZFUJFSEINuY7q21D1lyDJsq
	PcHn9f8bNqhK0QEPsltu92mgrQTWLgy9MHo1Gb6z1f3neWeYpqGfVTKy/+psyGqu
	Uvf86x4+3xbQn53297tmHPahPTW/rqQ8jwpUjlOIPMbY21FKpGmRqQAtBxB95u7k
	SpJKRI8v3IELzRmzAhRBhAzRNX+IuexfpupfTDM5bHx+we7+NvSJ+507Ccv5jrPs
	wilSdz3p4VgLq751i61QmT7XOba0xOSZDyXXRX8FHhDmMPnR3mtK9o7HGU9x4E4Z
	20t8/VV8X0daI1NqNot5/g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm4cv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 19:19:31 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 4273JUaI008264;
	Wed, 6 Mar 2024 19:19:30 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm4cv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 19:19:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dH9RRICugX/szLx9cin9ZmuH35INT3rGeWsO1an2ddx5CLpkc7ilwCoOzet0Bv27DZRK2A9djlnnpIv6iA9Nd3nPPtXUE7aLk6dYm5UFRtESNt6CySVT+vjiv/3gnpAR03gwtvuMkiucC4B83FxjYxu6PV6P+oqMxwhZ6qEeR9oDSUDqyzsjLCULtbrbbHdvuS52RVJigvU3toX9g06gWdULBOhEshR+UzEbK9HDf7KkFbuWKuogY1KHCB1uXratWMs+jRHmndWYrp+4iQJa1gF9I6+Xaa46iUV3neA+RceOo2PglgvhDDj5veuRTFGr3ZrQ7l7tGE324U66SLom4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1C7HtzNaFzRk4dkvRYCyiIqHpanxQpFk0xsqhkalncU=;
 b=WhhaoSTMf5BcO60UqXkYcxWpbyUZ8Nv5Olrd9uWwH8Tn7fNyxzkC8zToBahX36mHB2h4LgJVmLrbKHDQrEyg148qvHoN7ZRcbjj7MuMUok1b3FeXG7bEQ/WjptaFFq9k0rcTP6ioaAytBYncVBHefx7E2BA7hK314eSExoSFfvLIQAn2SPc4lXGRXcABCKmVc0HPz5354/FSuRn/PGOvB1exo3aVmuOwY+HqQtPkyiEn6tMnmpI+lTpLlwkJMXYs7VjR1afHvtcPlbJn747PK3kviDlcp3qfLym2a7tXbKTtSaci/5JcSKLzJIe8KIvAUFk6ncKqW8ealWZgNU8Vpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB8067.namprd11.prod.outlook.com (2603:10b6:806:2e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 03:19:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%4]) with mapi id 15.20.7339.024; Thu, 7 Mar 2024
 03:19:28 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "patchtest@automation.yoctoproject.org"
	<patchtest@automation.yoctoproject.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: Patchtest results for [OE-core][PATCH 2/2] systemd: remove
 systemd-bus-proxy settings
Thread-Topic: Patchtest results for [OE-core][PATCH 2/2] systemd: remove
 systemd-bus-proxy settings
Thread-Index: AQHacDb/nzMozEkPk0SfcnBEnvCUVbErj9OAgAAMBjA=
Date: Thu, 7 Mar 2024 03:19:28 +0000
Message-ID: 
 <CO6PR11MB56024BD76AC17EDD3D7A9B6CED202@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20240307022708.2061916-2-Qi.Chen@windriver.com>
 <0101018e16c415d0-38b988bc-f84e-401f-9bc0-4bdf1d92817b-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018e16c415d0-38b988bc-f84e-401f-9bc0-4bdf1d92817b-000000@us-west-2.amazonses.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SN7PR11MB8067:EE_
x-ms-office365-filtering-correlation-id: cb336fba-0a23-4a07-2c39-08dc3e5565f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Be3c0GZ8s5tG6NbdfqLeBlK/4E+0fHoEWpLZPSgSdRC6XVm2r3W3fEuYq73bcPmD7g4CdvtuFTjw2+ZF7cunffCmuaQfMCirQt8ktKYQDlU0lBJg1Ej8VGbDOop9Erb6hKtIBXZcYIJvMUbTx0qPje7abHORJSr6BtfPaxC7PxSYJKNyghwcHf96dMpvTSQ/oXbW971tkX1FCZNRVEPmiWikFlA/NuR2tm4jc/BweZ63Qd48Oc062GVTXJw2GeO4ttGi/mxT415caCMz9t7vmCXYHQk9RjbMOFBQkXJczfwjX1VsZFkFnArMNqttqU0qN4nhbVQuddAlMeVA5eBensLUd6vjkCsv77plQ5dDWEv1mSCXlNno0/0zDKLSUmfvgkyu9P4yja/dt5L7pENcw3JXufrO7Mz5gm/ULu/cROyh+w9GnJU7+6WS/9Ylc1bHAz48ccION2Dd3ApRJZ38W44v8ZmO9SCs1W0uVBC6xw+y7sY+0d+2SOlMH6JOiYxf5g7tIksJ3ZandmXmIli8NvfZun1A1KWpwhH7ADZJPaoqhohyzyMvNxFmij4ajka6vAYrSqKLTCKNQujXuXQT1vevpm3eGYiyZmJJiSx7dlgkPbJlRiqGVJKMjW0wgQ57ihccZKYb6r6mJ0AgNrUtoeNEOB7LezHtMsNZRuXxS78=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?bjvRDqCIF+cDxf4h/XQUyeTD26I5V44b0Da2eZRZKZcPbNFDF1J4OWYHPMyh?=
 =?us-ascii?Q?W5H9IfpEiFfW0AoKPhXueVfPGWvu8diNI0g0hnFvPk+aDFV7XW8p+7Dv/eRO?=
 =?us-ascii?Q?GllE6KweEzisuVod3wJuzOigxAReHBV93BZAHl9Lw2/5on6CtPAw2gh016nq?=
 =?us-ascii?Q?TDgPABaFJjA2+W79K7vQRvkoNQm8zIU6B8wilfYEuyZ88nCbt7tp34iRNepF?=
 =?us-ascii?Q?ybdGHuwN14VwR/oNBRvLBttW/ROHUhNM2EwBvqovNB2dfr2jmpNIOp8IRXCK?=
 =?us-ascii?Q?FJ79t62zch5PVqVZf5YtL6Js+M5wsqYirLoYO2Pw0h/VxrCLt5y17fmIYxsN?=
 =?us-ascii?Q?2Pas1OGYsot6JOq/Rk94zEijomzKUGVVzKm0NbJxLxGbbl1f8YNwtjuYboEK?=
 =?us-ascii?Q?ZuQmJGbWAb7TBGer3U+7PH6m52G1LuxCjwl51Lhf0mIOi3zdHND6AmmzL4tW?=
 =?us-ascii?Q?CZbXNEmQFz6bYQTdN3dvoGaLEsfrU0Wv3GyIsQd2z95pn3mBzZOCW8D+NwyH?=
 =?us-ascii?Q?SmE4mQrUtm5ysdqSuzjL2sUsixNd4v/JoakzIPJ/syPt0+k0fjY7CFkpCZFT?=
 =?us-ascii?Q?SNWGigLjrRe1s433HjbiYtRNeadrQHhTwuTzd5APkkvMH/RCUgRLdg5DiUuT?=
 =?us-ascii?Q?0ni2D4j9mY46CsmtJ3uw7qEjnvur+nC9g/T7hxQb/gNtcAtuWgVjKMw22keq?=
 =?us-ascii?Q?0tym3r+ebSTsWRIqVc5ak2gJsC/hLTKwPS5GxcXLPpDq2uHKBtR1IvravTu7?=
 =?us-ascii?Q?aRhaVdR9iIbwf3k/8D5GoPUuN5uJUXMDeXbe3OesXeliI+b7FPleo2l0QVXV?=
 =?us-ascii?Q?l5kM0X3O+9XS34XnTiMe2+9tGvVLS5P9yi7ZdGLIz4YvG1SHXGxl6nFb6+xa?=
 =?us-ascii?Q?jejqihcTYiR8rUpfK5LUIZvPuj6NTOWEjaBUCRwKX6RDpRB2vovV0XzlmRjs?=
 =?us-ascii?Q?rABm61089424KNk39i/PpvWOOPa/azBOhtkiqr4HDnxTXiJZ9yYeWWLOAfhT?=
 =?us-ascii?Q?oHRmElONnkb8JfV/AYEFGTeOG0x4GtvX/svzuTd1uHELLce1chtqJr0VLCs0?=
 =?us-ascii?Q?X8A3nwbUdWpoWIwPYPyJxtxU1nUkmx3VKjbdKiV7ZW10G/9EjUokaXi/dXTU?=
 =?us-ascii?Q?NMiteCqDrldnyQVrptOap1TwKZHGr3JJld0vIYjFHkM3RSFBx4KR/xhAGYVA?=
 =?us-ascii?Q?EEq9TA2dSkLflyw6r4QlSSnpT7ECzrbKFgF8f4DfLFf3TLoIVnXEdICX10me?=
 =?us-ascii?Q?56vpg6/OtGIvnzkUKq4LA5NhK7i31M7CuRqYGpUyV+PHUJzRyK4w/uFbPEsP?=
 =?us-ascii?Q?AqUjriH13Vci1YYb/LeWAFaIwDbH96CqtR9QLJhLkwD+UpgjUKuqEf5Od9XA?=
 =?us-ascii?Q?bEpXzh1pXXThD1eiZBkGSvpR79pA2aSXFIWjlpVRr92sOyG33or3CiSkwAee?=
 =?us-ascii?Q?tcaLe8lsPG6wOIAF2Jyyl4urVG7nf9J6rlS3g+HAjBiIDnOnpcjyFAFR1VdC?=
 =?us-ascii?Q?IgtZBKB/8teKoduiQIvk6xX+waXGvwe5OsRrB/m2WIAjXhyiE8aGCyTmNDYP?=
 =?us-ascii?Q?Zfzq1aG78ynUb2YSl6+vJAOXquhHqEb10eMZybA3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb336fba-0a23-4a07-2c39-08dc3e5565f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 03:19:28.3565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OuVrFgaDGzLpyHWVyFFdmvIOHkH3MBpE68Rb3KLdUw/mFMUr/DaGOZFEshifRH6kStLLE+jXOhCtq9Nbc6b+bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8067
X-Proofpoint-ORIG-GUID: 1A0gNd3y1ON-w7h5Fc5p8jM0t22Gavjd
X-Proofpoint-GUID: b-_XGSFonN_0Q6Ejoii0HOOmleq6i7o9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_14,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 03:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196764

Is this a patchtest bug? I can see the 'Signed-off-by:' is there.

Regards,
Qi

-----Original Message-----
From: patchtest@automation.yoctoproject.org <patchtest@automation.yoctoproj=
ect.org>=20
Sent: Thursday, March 7, 2024 10:36 AM
To: Chen, Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [OE-core][PATCH 2/2] systemd: remove systemd=
-bus-proxy settings

Thank you for your submission. Patchtest identified one or more issues with=
 the patch. Please see the log below for more information:

---
Testing patch /home/patchtest/share/mboxes/2-2-systemd-remove-systemd-bus-p=
roxy-settings.patch

FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it ma=
nually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_off_=
by_presence)

PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_=
presence)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length=
)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)

SKIP: pretest pylint: No python related patches, skipping test (test_python=
_pylint.PyLint.pretest_pylint)
SKIP: pretest src uri left files: No modified recipes, skipping pretest (te=
st_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, sk=
ipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPa=
tch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patc=
h.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_pa=
tch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_=
bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, sk=
ipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_=
mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (test=
_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_py=
lint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.=
TestMbox.test_series_merge_on_head)
SKIP: test src uri left files: No modified recipes, skipping pretest (test_=
metadata.TestMetadata.test_src_uri_left_files)
SKIP: test summary presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_summary_presence)
SKIP: test target mailing list: Series merged, no reason to check other mai=
ling lists (test_mbox.TestMbox.test_target_mailing_list)

---

Please address the issues identified and submit a new revision of the patch=
, or alternatively, reply to this email with an explanation of why the patc=
h should be accepted. If you believe these results are due to an error in p=
atchtest, please submit a bug at https://bugzilla.yoctoproject.org/ (use th=
e 'Patchtest' category under 'Yocto Project Subprojects'). For more informa=
tion on specific failures, see: https://wiki.yoctoproject.org/wiki/Patchtes=
t. Thank you!

