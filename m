Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BD9C531F7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 14:58:22 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25529.1784818699337788180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 07:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=noRyZwvC;
 spf=pass (domain: est.tech, ip: 52.101.70.15, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylog7APbfPRrhzHwQQmGeFlRZrKo4JEz2F1n70jXm1BrzcNzOx8Bo1AqlKjq7PQjkfPJDmvwi45cEEwQfxTBTU8qMwHJ1EHDqSI9gA9hPU6JFHPKUFmRiinEgb29KECv9hiO6jbvJ3/wiZ6/RX4Uv8PQnj+3NcbBZSkHwSCi5bxOTQUBWEeBua35VISq+Cdff/B+YIkpmwssKNj9jbUua5jhnsK5i27Ep8YjPBpsEvgmu7Kry6EeZIpIsDVQEyLhyjERFVuOIpKJ5wFPnazcCWjIgFnGTJOiV0SUShPYZRUzsk3UX6HR/WaM/9xP+0xyoGFTQOSWlQMVmKBJNDBMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRWlnhbXB9FpCPZqdxxNHy1WXvjwpnWGjXIQoJFZM9g=;
 b=YZT5to5RCm9+uFv+aIPOHJKnpbr24ejS6EeqaBsbuiwUKk+65jMOp5m7mgRIK0zCKHQOKqg6biybfTulXkjUb10e9eo0pPRkPEcFlwfcuPxRQCoRgQlI4eRvnvT0+UYIfLCnL17XV/AP6AOwPVXO2VQhHYtdGrMfKwNnQW9kjV5dH28xwcH4AC7UbN7KZx5jEYe7qqTx/6uyjm/e/YJU1aUMaokpbAinrcYBNNpXecy4KVMO9teDj+qoRm2SNvy7krqUiDAcNZ5+x5XcYhDhttHBWFlifDz2scHOqMqDlbkE6rXx6r89kHEQuWu3KcYMX6EdXa+6kIuWY0wr3ot3Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRWlnhbXB9FpCPZqdxxNHy1WXvjwpnWGjXIQoJFZM9g=;
 b=noRyZwvCuOesGc6+6ys19YrAWXSqJc9DeQx8W4B6QRRyYQpTIfK44dEFKq6+KDH91CZIjQkLw9FubEfveUXm7sfG375HUhJ6MnBlLr9JVSjUl9L9JoiMHTIzHmmn+CYxTSuj+y1gAdAB4iybfrjYszGBMhnKQ4jPXSZQq+u/GKudeXnRyKMGAheEupmvLT+l46OjDRfIuMZJPZHzv6ASDng6M+A7o3Q/CZgxYtQt0Aslk3HcQzXjHbtFVI/+xAfazqS43pvj3GeoHkro86QuEhu6P6SDtpgibddv4EC/3wYK1tbZOgvowe/uSNZY+ZJO4ef7x53Fsq9zprq8IjS6mQ==
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU2PPF595CB3F60.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a8d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Thu, 23 Jul
 2026 14:58:13 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0270.004; Thu, 23 Jul 2026
 14:58:13 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: "patchtest@automation.yoctoproject.org"
	<patchtest@automation.yoctoproject.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patchtest results for [PATCH] libseccomp: upgrade 2.6.0 -> 2.6.1
Thread-Topic: Patchtest results for [PATCH] libseccomp: upgrade 2.6.0 -> 2.6.1
Thread-Index: AQHdGq4r/a4LCn2kp0ebD5yettJDyLZ7Km2AgAAHXdM=
Date: Thu, 23 Jul 2026 14:58:13 +0000
Message-ID: 
 <DU7PPF66507B2D750AF512C9E0859CF2513F3C02@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
References: <20260723141839.13175-1-jaipaul.cheernam@est.tech>
 <0101019f8f631dbf-218257e3-e261-43d2-b5c5-22bb30cf356c-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101019f8f631dbf-218257e3-e261-43d2-b5c5-22bb30cf356c-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU7PPF66507B2D7:EE_|DU2PPF595CB3F60:EE_
x-ms-office365-filtering-correlation-id: 4efaf80c-626a-421b-c7d7-08dee8cad1bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|3023799007|8096899003|13003099007|38070700021|10067099003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info: 
 RIc1bl8U2pwjc6nCmMdQwwQpv5vt9UmooSbQMaVznmCedTKah0NDQiZeF47TT87kgZK8AGyjzEjx1ap6slOwde/kM/fHIO0LO/Vt/wgB9/ADFLF7QSYKc52DeU5ae3r6BSJpn/qIBzqujlue6q4P+WHBHbuU0N/pgbWFTvdhgmnn6rBt52s3PesUKpxJXo/m7venoTmz0ICz1xZ77YR41qSOBRZPMnrWxJDYNGqe1t4N6+fd/VF81pz3y/VWxjQ1xP18Q8TS5Nj5YPP9/k+VzT4Sp4XMOj6ZQ6iot1d+0exrzotteWdfEWgmEGMi8AbvMXo5c5zFOP3I3q2xVOgsgzt8J4w0kkYNjfsr+vtJNecJV4omdoVSQ104KSo2SkgTRSqDAaK0PVJVvcqdc34lR7kglNVf2GRH1zD15gf8vk23uJbwPVxP7Ez1DvUhk5ht7YgyWKN9TfiU3/dYeh+hMZ+Au5+m9cqnBGuqPPn3j1OI9PwLcSUQQFTB/eYN1+tfSAvU2/zlDQAcJWBn6wb30HbVZjKN1WJeLQr52J4Brd9zafUY7rr7Jm8mrmuZAyFhq/eIMQjGp2nHnVDe3CNjybtRBvB9Jp13G6N5H4dfLIV832/h2aZvIYmGzWQH0fQAJf44x/dN3DNAFsclxtJ2zFAJPPoI2tMZ5oiSs2CDqnE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(3023799007)(8096899003)(13003099007)(38070700021)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?zizdA/8nNKeGnLEOvp2vLKiL/1UoWbCSYvI3xZPSfGJch7ZkiMhXc3Bv2Gn9?=
 =?us-ascii?Q?BC7A+zz9yVbz+iqlQrgC2wLTVChxg3YZZFk0F6+1ku61qY6aoH4C+h29GhzY?=
 =?us-ascii?Q?Yh49FAeEGBZY0qoNGxVmtMu5Nz3UzktQ9dJfGoaY6rqgPYl+2Nu0U9BI0iWD?=
 =?us-ascii?Q?+I0M5xAd3mMSJKueecS56mPhgk1kSLNRjgW5yDJsT2HWV9+oBjM2jxD208uT?=
 =?us-ascii?Q?jvWbHtLdG9FdTSJfVRQVpHK7hXeCWShdo/aDS7MKSSl7caKDsWBsbhpcLnpX?=
 =?us-ascii?Q?9ykk6Oa8cl5IxO5o+0av7GM4gnmA7Qdp7WVDljSE8pVOqfsmybRL/LmGcIHc?=
 =?us-ascii?Q?koIl8SqzmkIGPQcr6CfOSdZCvr7NdoRwAJP3QLNJvYiHVr50C3EGqhGgYb7l?=
 =?us-ascii?Q?cELb2nsChT4e+6gIT2sJkkG0QKp4cq7sofT0KpJiDRRc91pqfc8JQVmi79AY?=
 =?us-ascii?Q?MR03oTTFcPIoWYOxfJGKVPSdgqhanqnQv0C4Iax7FdrMC86/xiNAMBF9lD6f?=
 =?us-ascii?Q?3TmkYUZO2WX43l33+5YKmw4oVmZkQdD6AtUBOmHN05iYWnl06UedYToHm6xA?=
 =?us-ascii?Q?2nAMiWHZkcK5Z0IN7qYGlcx5CC5ZO0q7nHMH0tdTc7ylDAeN5efu0dyPEGzR?=
 =?us-ascii?Q?XgNfjrKiSwWJHKCGDRNsIKuZ63PGNlJsWDEa9hKMpa6jpFu/lCWB9Gf0+g7R?=
 =?us-ascii?Q?YsM9UzdrsjH6Jfm/h0a+NsexcvUWgEn7bPlqiNhoLMtE9FIvLjF2fFPNUmiZ?=
 =?us-ascii?Q?3kD5XK2SkC8mJMVdGb21KQM//V7UAEFyIJIV9rAfzjRFcXrj3wACgs1ofBCU?=
 =?us-ascii?Q?/xsk8zzOGbhk4PpaXM1Rg2YGIiKbr99XbB5UDaeLAjM5OOufrJLe7zr8J2h7?=
 =?us-ascii?Q?ull60jKR6UiRQruzc7qLrcaE/Ip2TEVMtf2dtRkNoB489yiSgd+sd46TmTGi?=
 =?us-ascii?Q?JWqiYvZ6xjtjQAY3Fd+dfMGtbccJrWJizjgh+M9pUX0Ktp5Y/uvBpPXbd5RS?=
 =?us-ascii?Q?7F8z6s0+YBHW470HATK40wcxS1LXRCwkeYUkAw/AZGYnT0LwoklEQtBY++Af?=
 =?us-ascii?Q?+TWbdHvIr2XTAb663HTvajhXsqc2NBmAPFQFVyl+RkT7up4OkWAFa5QoNhLA?=
 =?us-ascii?Q?49Lr3UFDrIa0m4IUP1WGPOTHI8S+GVKeQhGcxPLF87UCa1QUgy+9u7Mh6Kp/?=
 =?us-ascii?Q?VzaxGrnhPVaEH6dsZuvJ8M0aS/5GMMhNWMWUXdNHv5VFMQGsByWsUZasZrxO?=
 =?us-ascii?Q?zfPNEf51tMzp8mH6sl79th2Xf5a9N0YHMCKHGqrmi1VhRaGO1abLXf+7E7nA?=
 =?us-ascii?Q?mkU0FFCdpW5qjgCIADixq+oRurOnWf7fIpRRtd31cxgymc+rThDzRQhdlVSO?=
 =?us-ascii?Q?EJR9FgnMWoudf78EGf8QzHBnrHpzSrGovQlTm42s4yK5orGCaA68pEDOPFwd?=
 =?us-ascii?Q?Kj4p07/nFun9SHv1j4QbvmtO2yAYDgJqnC6t65ltUulxHL5KTgAeHW3fWNbF?=
 =?us-ascii?Q?ob/R1xWEmS5OMojnPoVLN0rs+XPBohTsAUr3oMXoMU0RCrHCRjnIv8H6J0Xa?=
 =?us-ascii?Q?aVQd1P9fMd9XFlDytb5KAjfj36ySQ9oR2ypEE92eUHVzS+0vRHyEd0gJegDR?=
 =?us-ascii?Q?sBVAASFFX73LmjfoGe4KILEx0hD8EBN7l4/f5t40fQMIJqah5IRNa1gBwU7y?=
 =?us-ascii?Q?uYY2TKX7rY+OxgUz1hBEgtKHXF88a0lxp+rdoS3g3vOZkPH+eSjXJ+RNvpz6?=
 =?us-ascii?Q?W0CauPxWnhJT4I14g993R4JqWnV+BLg=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DU7PPF66507B2D750AF512C9E0859CF2513F3C02DU7PPF66507B2D7_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4efaf80c-626a-421b-c7d7-08dee8cad1bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 14:58:13.2669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 97ln3Mw4lALTZWgI49ClNvduPADVmyHn/zOaXeOnhbl9zVGCPCVygxMSGWnHRWq3Z08YFCf8jaY6Dl9bgVs5mkXiUbFRbEAIxx0gYlqmlYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF595CB3F60
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 14:58:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241852

--_000_DU7PPF66507B2D750AF512C9E0859CF2513F3C02DU7PPF66507B2D7_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

 Hi,

This is a false positive. The @v3 flagged by patchtest is from a verbatim u=
pstream git log entry:

  8e31cd254be3 github: bump codeql version to @v3

It refers to a GitHub Actions version tag (actions/codeql-action@v3), not a=
 GitHub username mention. I'd prefer to keep the upstream log intact rather=
 than modify it.

Happy to resend with the @ stripped if maintainers prefer, but wanted to fl=
ag this as a patchtest false positive that might be worth addressing in the=
 test itself.

Thanks,
 Jaipaul


From: patchtest@automation.yoctoproject.org <patchtest@automation.yoctoproj=
ect.org>
Date: Thursday, 23 July 2026 at 16:31
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Patchtest results for [PATCH] libseccomp: upgrade 2.6.0 -> 2.6.1

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/libseccomp-upgrade-2.6.0---2.6.1=
.patch

FAIL: test commit message user tags: Mbox includes one or more GitHub-style=
 username tags. Ensure that any "@" symbols are stripped out of usernames (=
test_mbox.TestMbox.test_commit_message_user_tags)

PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_ur=
i_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_igno=
re)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_pr=
esence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_=
presence)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetad=
ata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length=
)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left=
_files)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list=
)

SKIP: pretest pylint: No python related patches, skipping test (test_python=
_pylint.PyLint.pretest_pylint)
SKIP: test CVE tag format: No new source patches introduced (test_patch.Tes=
tPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new source patches introduced (test_p=
atch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new source patches introduced (test=
_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_=
bugzilla_entry_format)
SKIP: test lic files chksum presence: No added recipes, skipping test (test=
_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_py=
lint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.=
TestMbox.test_series_merge_on_head)
SKIP: test summary presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_summary_presence)

---

Please address the issues identified and
submit a new revision of the patch, or alternatively, reply to this
email with an explanation of why the patch should be accepted. If you
believe these results are due to an error in patchtest, please submit a
bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
under 'Yocto Project Subprojects'). For more information on specific
failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
you!

--_000_DU7PPF66507B2D750AF512C9E0859CF2513F3C02DU7PPF66507B2D7_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"direction: ltr; line-height: normal; margin: 0px; font-family=
: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
&nbsp;Hi,</div>
<div style=3D"line-height: normal; margin: 0px; min-height: 16px; font-fami=
ly: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0);">
&nbsp;&nbsp;</div>
<div style=3D"line-height: normal; margin: 0px; font-family: Aptos, Arial, =
Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
This is a false positive. The @v3&nbsp;flagged by patchtest is from a verba=
tim upstream git log entry:</div>
<div style=3D"line-height: normal; margin: 0px; min-height: 16px; font-fami=
ly: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0);">
&nbsp;&nbsp;</div>
<div style=3D"line-height: normal; margin: 0px; font-family: Aptos, Arial, =
Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; 8e31cd254be3 github: bump codeql version to @v3</div>
<div style=3D"line-height: normal; margin: 0px; min-height: 16px; font-fami=
ly: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0);">
&nbsp;&nbsp;</div>
<div style=3D"line-height: normal; margin: 0px; min-height: 16px; font-fami=
ly: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0);">
It refers to a GitHub Actions version tag (actions/codeql-action@v3), not a=
 GitHub username mention. I'd prefer to keep the upstream log intact rather=
 than modify it.</div>
<div style=3D"line-height: normal; margin: 0px; min-height: 16px; font-fami=
ly: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0);">
&nbsp;&nbsp;</div>
<div style=3D"line-height: normal; margin: 0px; font-family: Aptos, Arial, =
Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Happy to resend with the @&nbsp;stripped if maintainers prefer, but wanted =
to flag this as a patchtest false positive that might be worth addressing i=
n the test itself.</div>
<div style=3D"line-height: normal; margin: 0px; min-height: 16px; font-fami=
ly: Aptos, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0);">
&nbsp;&nbsp;</div>
<div style=3D"line-height: normal; margin: 0px; font-family: Aptos, Arial, =
Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"line-height: normal; margin: 0px; font-family: Aptos, Arial, =
Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;Jaipaul</div>
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr">
<div style=3D"direction: ltr; font-family: Aptos, Arial, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</div>
<div id=3D"mail-editor-reference-message-container">
<div class=3D"ms-outlook-mobile-reference-message skipProofing">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
</div>
<div style=3D"padding: 3pt 0in 0in; border-width: 1pt medium medium; border=
-style: solid none none; border-color: rgb(181, 196, 223) currentcolor curr=
entcolor;">
<div class=3D"ms-outlook-mobile-reference-message skipProofing" style=3D"te=
xt-align: left; font-family: Aptos; font-size: 12pt; color: black;">
<b>From: </b>patchtest@automation.yoctoproject.org &lt;patchtest@automation=
.yoctoproject.org&gt;<br>
<b>Date: </b>Thursday, 23 July 2026 at 16:31<br>
<b>To: </b>Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
<b>Cc: </b>openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject: </b>Patchtest results for [PATCH] libseccomp: upgrade 2.6.0 -&g=
t; 2.6.1<br>
<br>
</div>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">Thank you for your subm=
ission. Patchtest identified one<br>
or more issues with the patch. Please see the log below for<br>
more information:<br>
<br>
---<br>
Testing patch /home/patchtest/share/mboxes/libseccomp-upgrade-2.6.0---2.6.1=
.patch<br>
<br>
FAIL: test commit message user tags: Mbox includes one or more GitHub-style=
 username tags. Ensure that any &quot;@&quot; symbols are stripped out of u=
sernames (test_mbox.TestMbox.test_commit_message_user_tags)<br>
<br>
PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_ur=
i_left_files)<br>
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_igno=
re)<br>
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_pr=
esence)<br>
PASS: test author valid (test_mbox.TestMbox.test_author_valid)<br>
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_=
presence)<br>
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetad=
ata.test_lic_files_chksum_modified_not_mentioned)<br>
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length=
)<br>
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)<br>
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)<br>
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)<br>
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)<br>
PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left=
_files)<br>
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list=
)<br>
<br>
SKIP: pretest pylint: No python related patches, skipping test (test_python=
_pylint.PyLint.pretest_pylint)<br>
SKIP: test CVE tag format: No new source patches introduced (test_patch.Tes=
tPatch.test_cve_tag_format)<br>
SKIP: test Signed-off-by presence: No new source patches introduced (test_p=
atch.TestPatch.test_signed_off_by_presence)<br>
SKIP: test Upstream-Status presence: No new source patches introduced (test=
_patch.TestPatch.test_upstream_status_presence_format)<br>
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_=
bugzilla_entry_format)<br>
SKIP: test lic files chksum presence: No added recipes, skipping test (test=
_metadata.TestMetadata.test_lic_files_chksum_presence)<br>
SKIP: test license presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_license_presence)<br>
SKIP: test pylint: No python related patches, skipping test (test_python_py=
lint.PyLint.test_pylint)<br>
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.=
TestMbox.test_series_merge_on_head)<br>
SKIP: test summary presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_summary_presence)<br>
<br>
---<br>
<br>
Please address the issues identified and<br>
submit a new revision of the patch, or alternatively, reply to this<br>
email with an explanation of why the patch should be accepted. If you<br>
believe these results are due to an error in patchtest, please submit a<br>
bug at <a href=3D"https://bugzilla.yoctoproject.org/" data-outlook-id=3D"ac=
e2ec3b-02e2-404e-9320-f6713e8518f8">
https://bugzilla.yoctoproject.org/</a>&nbsp;(use the 'Patchtest' category<b=
r>
under 'Yocto Project Subprojects'). For more information on specific<br>
failures, see: <a href=3D"https://wiki.yoctoproject.org/wiki/Patchtest" dat=
a-outlook-id=3D"b5683956-7935-4470-8e0d-a47ba277630d">
https://wiki.yoctoproject.org/wiki/Patchtest</a>. Thank<br>
you!<br>
</div>
</div>
</body>
</html>

--_000_DU7PPF66507B2D750AF512C9E0859CF2513F3C02DU7PPF66507B2D7_--

