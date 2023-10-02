Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE737E784AC
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 11:03:10 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.77])
 by mx.groups.io with SMTP id smtpd.web11.78809.1696244580516331556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 04:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OotBtQVf;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OotBtQVf;
 spf=pass (domain: arm.com, ip: 40.107.6.77, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hl1rHahmcQOOl3UOY6KL/WrHM+MqpYjWavbwd7fEpn0=;
 b=OotBtQVfuWA1vEMd7tCIgGCmEH3sli1shM1GjMbTpbtftu67LR5vkKsEOhq6bcBnDMrH5gG0Qkb56cRAdHGwRBU4E9qXdX2ImMpeIYfMNPM/soDPGEGZrwh2k4XP5zNB/GOVmOHWWwnELuRjTa2ycKa3XP+xRsvQOb8Pdse4ZeA=
Received: from AM5PR0301CA0021.eurprd03.prod.outlook.com
 (2603:10a6:206:14::34) by GV1PR08MB7331.eurprd08.prod.outlook.com
 (2603:10a6:150:1e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Mon, 2 Oct
 2023 11:02:54 +0000
Received: from AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::3a) by AM5PR0301CA0021.outlook.office365.com
 (2603:10a6:206:14::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29 via Frontend
 Transport; Mon, 2 Oct 2023 11:02:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT026.mail.protection.outlook.com (100.127.140.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.20 via Frontend Transport; Mon, 2 Oct 2023 11:02:54 +0000
Received: ("Tessian outbound fdf44c93bd44:v211"); Mon, 02 Oct 2023 11:02:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 15553f9022509cb4
X-CR-MTA-TID: 64aa7808
Received: from 499671df27b6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0E71AC39-047C-4972-91B2-DABC3538775A.1;
	Mon, 02 Oct 2023 11:02:48 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 499671df27b6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 02 Oct 2023 11:02:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PolRTSAk22yGzA5gO1MZTgnMkpBM2vmbT5LY9JAgoACjYpmBF6WSXpZCerKa3SJfzS8G7QuiC8VGhjpfxBh2Kc2xNcQ75nvgpq/gubn/CVx5mvcDu52TRNd7CjcVqa+LmdT/UywPBDwogsm+z7TfX8iD6JX4zHn+r67ShHS/EY2+0DVParh4odf6w+dLKxPV6YAlKlduhQXoKrxAVpM/9M1Uyz/20JAFF1dReqeVnqoSBL+6sc1wRPIUnrodOExZb9HgiCQHWM7Kd7lgEM8l6kLzk9JlevrLw8vsUuX+oBu+iK0HAUZ2V59O4kwWE6+6bKLx+SuKvFFN7gDi9PNXjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hl1rHahmcQOOl3UOY6KL/WrHM+MqpYjWavbwd7fEpn0=;
 b=RI0I251JbhpETarcXqy/1kT1mMbluIvM5EhorV+Z+KXhNtxSe4jSqisTD26B2fuuTsUNaRBamP3UnyIAwqVS48zvGfZgf+fErA731iDzA17xxCRdpEc/2ArY5WCOrG7DMgS2JrSQBTf4a2HXiJO9FQZGBm+Xr6oSONRv4vLj7zCMvSOQ8vDXyJq7mdgHCFYivnPdMwFeq3n8Ivi9gNslHZjuVmVSupR5/3eeuwrSOIEttHe7RIHokKee3cSsE/8TmZpAMLfjVRYhIkLrp6XRjnaTpvMwSWyHtG8tvJaxr0rqYJ6jAft/bt2KHQuGv67VnU9J766nuavcvUyvWUte8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hl1rHahmcQOOl3UOY6KL/WrHM+MqpYjWavbwd7fEpn0=;
 b=OotBtQVfuWA1vEMd7tCIgGCmEH3sli1shM1GjMbTpbtftu67LR5vkKsEOhq6bcBnDMrH5gG0Qkb56cRAdHGwRBU4E9qXdX2ImMpeIYfMNPM/soDPGEGZrwh2k4XP5zNB/GOVmOHWWwnELuRjTa2ycKa3XP+xRsvQOb8Pdse4ZeA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5687.eurprd08.prod.outlook.com (2603:10a6:10:1b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Mon, 2 Oct
 2023 11:02:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::70a7:28e5:6644:a68a]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::70a7:28e5:6644:a68a%5]) with mapi id 15.20.6838.029; Mon, 2 Oct 2023
 11:02:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] remove obsolete workaround
 (https://github.com/python/cpython/commit/33d95c6facdfda3c8c0feffa7a99184e4abc2f63)
Thread-Topic: [OE-core] [PATCH 1/2] remove obsolete workaround
 (https://github.com/python/cpython/commit/33d95c6facdfda3c8c0feffa7a99184e4abc2f63)
Thread-Index: AQHZ9RqBcbqw7z4M30i0QqjN8PPJI7A2VbEA
Date: Mon, 2 Oct 2023 11:02:46 +0000
Message-ID: <ED2FC1C2-F778-4A80-9166-063E04F22B07@arm.com>
References: <20231002102320.3692433-1-ross.burton@arm.com>
In-Reply-To: <20231002102320.3692433-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5687:EE_|AM7EUR03FT026:EE_|GV1PR08MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: e99d8ce1-7540-4b1d-1f47-08dbc33720ad
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 P65LfB+POA4KzVEMkE/vMc8oVdv5Ct7TgbvWOhoXbzQyikMjJuW1QJdsBONm8xyuadJ66Eoe6CpcixQGQs84zgbhHQ3MxtG/9fa013p3SmhAtKnP9SmQA+EjwB8GEVIw3h/osElh9w3VTk8C3+HsZkyIHJyNO60A0jP/kmDHYX2bQIEtRRTlGWbWKnet2YNnKAmBiPOKLgDX1h7jy4V+EHIqcJmhGA3vI4GxLjnE4LlVXCgCdX9Uq+Lim6RSuV2bMSNGdkJv7C3oX5P4te6rNi7i3gQP4QMmfCAC4E8IeTEH/2hUfStkGb8dMjKAZDDo8ZStyJCOkB33AXNY+udzyC3LDCVUHxZMRgubkroNyPHolR3nIM1o1sRkDUhRZ93UtRkGTXjycYnO0iSMycJiGXy293Gux4emEOfqRHx8dGvLsW2MxPb6cQFnRsgNbpMJMZax0Gy25WQJhgxZeOkt7cjG6OY8Hf50wm6lx1d3AVpwySuuH9y6emqSF2dGliFHiW6pMB0EOMFVbmVnde6uoheZuZ2rMaTWfBncS8jJg6Q2k8JNEZVFa1rTXTqgs9Kv4+Ny7wU/0K6nt9vXzF89UYZIxbXWR0GZVgFqNRrYHB3mU7IXLHa5nQpdSBaUHGGNEpH57bkEL18U7o9V04L/LNWDJ3TlTYmqsw06/3F8XHYi1gKldKFPxNZRY9yWWJ8I
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(376002)(346002)(396003)(366004)(230922051799003)(1800799009)(451199024)(186009)(109986022)(64100799003)(2616005)(83380400001)(26005)(4326008)(8936002)(8676002)(5660300002)(122000001)(6512007)(53546011)(6506007)(38070700005)(91956017)(38100700002)(66446008)(478600001)(76116006)(66899024)(66556008)(66476007)(66946007)(64756008)(316002)(33656002)(41300700001)(36756003)(86362001)(71200400001)(2906002)(6486002)(966005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <40A170548CE1FA4B8E37188F2AE161EC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5687
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	014c7e09-3481-4285-5d85-08dbc3371c56
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nSUFAT8R3b7qTC/nLA1Vm+J14eMGIxMNiDvNh9D8wR/9toKFXx0WqOKCwUcgP2aPzSFErqAe68wrTPcWlxgyASAhqwQZKFaldPT6teE1lAYNuy6HOqTaPEwOhkxPyd0bRT4mfzAIz/EUb5k6oSKsilZjJKoKcKChZXp+HHqVLHPpdssWytsb1WG3kKZN1qKcDEuWKwi8Lk632B3QUrTBviwM96T9oLJPx3baH6Q/81KXX5nZECq2vC4NUYtd7Hd8uWwn8n+xa+vWqJbFWsgXR36wS4ekS4r8npT6AKYm5x+ORKq8/pN91QjnAejver8/j1kBJ+O8K0csXo7rmPfsOavQRlTkZiGuatFDmFJeyfG45n782LlV2CU8CmxBMQhrcnX6yjWaRptualkjEiDuA159UYu3K80F7fzmKsXgtymjVAgL0O87oAOY6B3FOgOZITsVCZrfA4mP4xJqIGqWpzm0RynbPdzk/mUfjvRCBLNewv9PBzLUQt65K4mt736Wu8zz+VcqGMOSiQwU9X3fGHLuth6Tmr+cHzGkOY7oToPBZPu8NKsy+lI2uASTKYxH3M849HP15Nd+pT9dFFjg6sTfDtABh78rG5uURhhW6ot3NvzL959i5eetF5AvymwZwovbWRR5T5D1cmacM1WgcZrV7RytgdTo3XkCf6BBO8GtSZtUWVEwrh8YWwSMAI3j8UYEH3C7NimsR0QU6RAJb55b0JGTuLl+7uovonYtjm570mNFPVhzIBSETjSI3B7ZgLNx3v6mNSNMzXPDpWXtvwPh+hD+01dKCIXtE7uaFQXDaBDZUIYxuTUQVZUHi1Fe
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(451199024)(1800799009)(82310400011)(186009)(109986022)(64100799003)(46966006)(36840700001)(40470700004)(2906002)(5660300002)(41300700001)(4326008)(8676002)(8936002)(316002)(26005)(70206006)(70586007)(966005)(478600001)(83380400001)(6486002)(40460700003)(82740400003)(40480700001)(53546011)(36860700001)(336012)(36756003)(2616005)(6512007)(47076005)(81166007)(66899024)(6506007)(356005)(86362001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 11:02:54.1266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e99d8ce1-7540-4b1d-1f47-08dbc33720ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7331
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 11:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188599

This was meant to have a better commit message, v2 coming shortly

Ross

> On 2 Oct 2023, at 11:23, Ross Burton via lists.openembedded.org <ross.bur=
ton=3Darm.com@lists.openembedded.org> wrote:
>=20
> From: Ross Burton <ross.burton@arm.com>
>=20
> ---
> meta/recipes-devtools/python/python3-numpy_1.26.0.bb | 9 ---------
> 1 file changed, 9 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.0.bb b/meta/=
recipes-devtools/python/python3-numpy_1.26.0.bb
> index 4e1e34e8df3..3ae40a33fb4 100644
> --- a/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
> +++ b/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
> @@ -30,15 +30,6 @@ do_compile:prepend() {
>     export NPY_DISABLE_SVML=3D1
> }
>=20
> -# Unfortunately the following pyc files are non-deterministc due to 'fro=
zenset'
> -# being written without strict ordering, even with PYTHONHASHSEED =3D 0
> -# Upstream is discussing ways to solve the issue properly, until then le=
t's
> -# just not install the problematic files.
> -# More info: http://benno.id.au/blog/2013/01/15/python-determinism
> -do_install:append() {
> - rm ${D}${PYTHON_SITEPACKAGES_DIR}/numpy/typing/tests/data/pass/__pycach=
e__/literal.cpython*
> -}
> -
> FILES:${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a=
 ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a"
>=20
> # install what is needed for numpy.test()
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188595): https://lists.openembedded.org/g/openembedde=
d-core/message/188595
> Mute This Topic: https://lists.openembedded.org/mt/101708818/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


