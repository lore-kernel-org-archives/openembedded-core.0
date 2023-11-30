Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8406C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 11:42:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.70358.1701344541607961522
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 03:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Jcb/YrDl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=069828ff40=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AU6qUrf026456
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 03:42:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=rGwh1K6utbyTb3XrOw
	qBDrLbxzV1Lb7WmySC7TaBJho=; b=Jcb/YrDlJEUwD9oUegvhyd/kNuzOXQGi0F
	63RaGn/EG7o71J0wmGdC3Jz832pl6O4JgUoHzu9QJ78PhRfe5BHrnpbdNvIKDQwP
	aHM37nHm0n3TvWgRhe2W2siJRsZM1EjcP1seBawqommCa6TCaC8mm+V6YhLzHOi/
	vWyq3O10nHfk5Fw5+dWnGl1LuzroLwaSKZFBreIGCmLQULfOy3ORNqsz26p8+krC
	KkK7KJKENr/St1OBF7/LMez6BsqMm14YszZ50kRMDhj+D2yxUe3hC9mk7X3RaDoN
	3mw4zR/CjbIE80WW3lGC5XGXCPzlk5tAQ8vWThrQB5npv3F50+Dg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uph6dgfa2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 03:42:21 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3AUBeKfc029143
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 03:42:20 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uph6dgfa1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 03:42:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIf5IU3afQjepsndkrkPgDUo7hRjpbNQw9Dp06q2A/hlAq4LFKEJExQnXbOqJm7w6oCNOObjWhV9fcO4N2d7vYIW1J11rKb4iTk1QlFEsd3VNRTcJ0tFFIUa9b2q0BtU8kg2RZKQ1mVp06lC5gVfkSo0uk//jjITbybrX5fdUxI/sm31Qp8MRMf1jnc7/jnPgzgGBMCI/Ea7Co7/xeX+h1BF3MTy1eTg765ovu4/cDq8Uj3z3TBMZmgTv1Cl3cKYONmtKcx5zHjC8wU/qDYKo1EMnWPVL9vEvTZIfGRlH52yOetxSJfbplixJMhT5nSLQl5gePouTTV7bcboctApfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGwh1K6utbyTb3XrOwqBDrLbxzV1Lb7WmySC7TaBJho=;
 b=nlAY4vhHNRP9i3B1pweMqNMAn+O5Ua0i0CGBnvlNSWgPgwYP07sgSmL4bXgttnmnpVU3hrlSLG1cGDDCcEcJKosshuY+5N3zGgSO+0PUajchUCFimNOtqnGbdRj0P3qNr/h9TXxjZvKDf6S0zBe2BTs79B35QD1OxlUZLRPN8+Qz1cdqPBOR9wvyvskl6kr/BZv7gifwmpWqph5hOHRmmA2ONoWvq8OD+OUS4lWhbCQ7KvdTYA9m5r51BQngpF6OsBFZWCCxCcrLxeAnC11ao9LrvlvZmqRVPtaXyD197gk+UxvjJIiOgHWznUh6TuHrOtFdbHPx/8AHAmV9d1RdpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by DS7PR11MB6248.namprd11.prod.outlook.com (2603:10b6:8:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Thu, 30 Nov
 2023 11:42:18 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024%5]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 11:42:17 +0000
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>,
        "MacLeod,
 Randy" <Randy.MacLeod@windriver.com>,
        "Gowda, Naveen"
	<Naveen.Gowda@windriver.com>,
        "Moodalappa, Shivaprasad"
	<Shivaprasad.Moodalappa@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>,
        Khem Raj <raj.khem@gmail.com>
Subject: RE: [OE-core] [PATCH V2] rust-cross-canadian: Fix file conflicts for
 arm and aarch64
Thread-Topic: [OE-core] [PATCH V2] rust-cross-canadian: Fix file conflicts for
 arm and aarch64
Thread-Index: AQHaEi1JNtVLhCAqUk2N2DLmXQ9JfrCH8CMAgAruA+U=
Date: Thu, 30 Nov 2023 11:41:58 +0000
Message-ID: 
 <PH7PR11MB644928A5A35201518EE5B6DC8D82A@PH7PR11MB6449.namprd11.prod.outlook.com>
References: <20231108102045.3190366-1-Deepthi.Hemraj@windriver.com>
 <D74A1C47-8F20-4E55-AF81-B46D63A79F5C@arm.com>
In-Reply-To: <D74A1C47-8F20-4E55-AF81-B46D63A79F5C@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6449:EE_|DS7PR11MB6248:EE_
x-ms-office365-filtering-correlation-id: ce054cde-d796-4d9b-b6b0-08dbf1995c84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PQZ08uc7n5/StIMFHqZ72EHAqaTr1GysaIFKWiAmifwWK/xR+DalsNseochE/N0hRqApdSZXxcB2bU66Jc45TuTmuh5WL+R6OsWhb15TGY8ME/GXYABdKhUqJVV1ksKTesDulYZvKvCOMtm0yHKfPTp46776uXPebUh5ZR8SnXxXah7h2q2TPRMwc/PGN60PVUnI5l8mlXgaey95NhjLvpBavyOIqNsWAV+OE8Q/yE2hEycFl8ffFGBNTVnx/G3QBB2N7EWVvC1ANimyDFrnDevscowcB00AQb2T2LYcgV8rjIkVWRn+O1eIg+T4TV1dsqPNzxvG6Ms7EjrlZ/HApKj+lpn1M5DhuLPOIUTZyT5FT8FGCf753yVBx6GE/tSh9gsjiD9o29Qbj/3LFyEvV305EFl+KlHNssfME2yV4Afu8CvsTwNqDtam6lgZlhKH7w6fKSkBXLKpL95smmAn2gSQIW/2r4R4gox2pl4CI7lYXC1MVRJ8XoVj8ReBy4hlkUpQo/gXv6CgIkgUf6HXm8CrXht7IAoEV8n1BnL+cZifncpQX0U+KDk9Idle1X6qtR4YZK1EX5JlzqtnWtLdj2QhrlU5YgbrDCkHRWx40SNy+l9Q/Rysq2M+P0Ht0lSRwAd7242Xq4WPFxSoqyrodKkR+eDni1Cv1944b8iXuYgefSfmKEV3ryGJi03i+Vlx
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(39850400004)(376002)(346002)(230922051799003)(230273577357003)(230173577357003)(451199024)(186009)(64100799003)(1800799012)(52536014)(9326002)(6666004)(8676002)(4326008)(8936002)(9686003)(53546011)(7696005)(6506007)(71200400001)(66476007)(66556008)(66946007)(316002)(66446008)(76116006)(54906003)(64756008)(6916009)(478600001)(966005)(202311291699003)(166002)(122000001)(86362001)(26005)(55016003)(41300700001)(38100700002)(38070700009)(33656002)(2906002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?+6CkpNxT/ybHZ//ziahsJxSWFlb9bxz4zC3cEOtEdsKiB03ZkkqGed3V?=
 =?Windows-1252?Q?F26CI91P6dYZgk0eY9TPnEZWIrw+ny7+kbAL9e2C8Ix41VrqazlmdrcI?=
 =?Windows-1252?Q?xOGIONAqdp7Zvx/c66sehVNmOcW1ZDS+P7UOzEUSmacqs1IkAMsKlLTR?=
 =?Windows-1252?Q?cLSYzI8joKk3AUN29nE1PVZ1efKVS/dnM+1iM/XEENmLuBg/Bf/MQN6U?=
 =?Windows-1252?Q?9bvVgmlely4caU4WMo1CnNJ+hMzt82S1J6Vg/8SVQQjZINRvkl3W7IOV?=
 =?Windows-1252?Q?gjJseAURwL2EU+wDgqA9LP+mtG5Rw3zM24ux5pJWLe3xN3eqihLNC0H9?=
 =?Windows-1252?Q?Mh7QsZGedhE0PHyFVC6QYN3ItThxFnN7AU29abElJZXiFLjfxaLRbfOx?=
 =?Windows-1252?Q?dkk2aisWWv859OS93ip0zVQTsYzK+OArjqA/qOn6TblZ865evqsFppjy?=
 =?Windows-1252?Q?sTsLzrnBIBCo+AOqROvVhgZl7eWaTAfJitkAkUwY7qkT4Qcjd3uwGnsa?=
 =?Windows-1252?Q?AlTLqmWy4iA9a+YIjH78kO9eserHFJJMA4gcmWdKvzR7ksUx30+Xs0QB?=
 =?Windows-1252?Q?hxwQPpyx2T6YyWHq7o3/qo4AvN9EsbWJLY4rZJjoF8quNN73kBnJClQM?=
 =?Windows-1252?Q?9uwFAhvk9Vz38d7aEL/XOlJ9hUgqyrn9RY8yyfwulaRkPkyA3E2Tirmd?=
 =?Windows-1252?Q?TEQziPrnSJg7SiTNw+QIusxQ7M3w5MVmJgBv4nFOdtJOEGOXZNJ899Mv?=
 =?Windows-1252?Q?xlU+jCymqaexAIwWS7PgrvCh2SltwCy4pU4GyR3bxee0BLpJpYRXYU65?=
 =?Windows-1252?Q?BvzFFXkcEwpUmHOhwu2npnAdBS1jordHtD3niV32pFMM6E66eijANeMQ?=
 =?Windows-1252?Q?2IbVHbyWFRTaiUZYue5YccIkooRALhCMdY8LPYNXahnf25q066YSZYjT?=
 =?Windows-1252?Q?k2OmEA3dd2ZvokAqv/Z0tRMIcD7Cd5rb/9hMbMxnyYIeu7y+q6L10/Mn?=
 =?Windows-1252?Q?kHAq3yLdLnT5eyq2dQVIWN5AZoz5jPge+ngkDz/ZvdkEkHJrJXA3AWTj?=
 =?Windows-1252?Q?tsL0OEiQztGq+CNa4zpS1Zp3pB+XZeWP4Z1zVry/r/4Vfbzfevjo/ow1?=
 =?Windows-1252?Q?BVv8ew7dkFXOvaUR+YeuwmNBxJgp3xjn3St4ZNsYu1X+Lxc5jR5TgyHg?=
 =?Windows-1252?Q?kL0C+0o2U5si45CqxpuKn7mevBiHfAtAwcsoPCf/3sN69A+G4OhTf7+I?=
 =?Windows-1252?Q?9ZzEKur2+nNtoss6wtS/ghaFVmxJCVfQgg1T+Kql5zSxvGwpY/MS5EuZ?=
 =?Windows-1252?Q?+npwqpEUB9Jzpo/gcO/6/YE29mCgsmriUYzjxmfoBZigS8zx17+9/nsg?=
 =?Windows-1252?Q?NhM2ny4eDn/0xI2pkPGmIrovdscP2Rz1fbRoi/G7vK7Iauy8k5WQBhBW?=
 =?Windows-1252?Q?4ubhUNrhcXaRZzTKnEvLoIktO6g2dfzRas6YHzaAbtysgK+YaKqkrw0G?=
 =?Windows-1252?Q?ULxXLIOjHNRhZ9Hw8DwGn6jbfTNcCvahsUo/IVNcUyZKMyPrJ54iJ9Zu?=
 =?Windows-1252?Q?hL3NMmK99XwV29CzQUstmVsHYUQRnfNGnwCrmXtCn9w+eb4XYjOjYL/k?=
 =?Windows-1252?Q?6m7M1OMkeVn/twbx38Sfp7FHfhe4XvlDEJGmhckV0oNyArRYW4pk0KPH?=
 =?Windows-1252?Q?wVi4c/2RScfJkrl8iw6+lkUZbUtXWbaPvvk0WhaTbcYssjHuuojyBEuW?=
 =?Windows-1252?Q?UAUNy94Y99l0utuVmaI=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB644928A5A35201518EE5B6DC8D82APH7PR11MB6449namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce054cde-d796-4d9b-b6b0-08dbf1995c84
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 11:41:58.7167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VE2XrpW6vEDbLtxAqS9gjkGwz70r/FlSPJ9/lv3WhxMGCQxF89EypNpk1kow85HG+hehVw2cq8yQEgyarfbSe4lSHv8e5YyktKbIuISpwEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6248
X-Proofpoint-GUID: hfi-kubF8v5wVtlIUw3GL8sawIdJc1kn
X-Proofpoint-ORIG-GUID: Yla335rf24iIisARGeRt9Pmb3zTEntf2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=866 adultscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311300087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 11:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191501

--_000_PH7PR11MB644928A5A35201518EE5B6DC8D82APH7PR11MB6449namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Thanks for reviewing the patch and your suggestion.

>> Why does this restrict rust-cross-canadian to arm/aarch64?
Please find the patch at following link that fixes the conflicts for arm64 =
and x86-64.
https://lists.openembedded.org/g/openembedded-core/message/191481

Thanks,
Deepthi
From: Ross Burton<mailto:Ross.Burton@arm.com>
Sent: Thursday, November 23, 2023 6:10 PM
To: Hemraj, Deepthi<mailto:Deepthi.Hemraj@windriver.com>
Cc: OE Core mailing list<mailto:openembedded-core@lists.openembedded.org>; =
MacLeod, Randy<mailto:Randy.MacLeod@windriver.com>; Gowda, Naveen<mailto:Na=
veen.Gowda@windriver.com>; Moodalappa, Shivaprasad<mailto:Shivaprasad.Mooda=
lappa@windriver.com>; Kokkonda, Sundeep<mailto:Sundeep.Kokkonda@windriver.c=
om>; Khem Raj<mailto:raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH V2] rust-cross-canadian: Fix file conflicts f=
or arm and aarch64

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On 8 Nov 2023, at 10:20, Hemraj, Deepthi via lists.openembedded.org <Deepth=
i.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
> +    # Set up environment variables for AArch64
> +    if [ "${TARGET_ARCH}" =3D "aarch64" ]; then
> + CARGO_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/cargo-aarch64.sh"
> + CARGO_TARGET_SYS=3D"aarch64-unknown-linux-gnu"
> +    elif [ "${TARGET_ARCH}" =3D "arm" ]; then
> + CARGO_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/cargo-arm.sh"
> + CARGO_TARGET_SYS=3D"arm-unknown-linux-gnueabi"
> +    else
> + echo "Unsupported TARGET_ARCH: ${TARGET_ARCH}"
> +    fi

Why does this restrict rust-cross-canadian to arm/aarch64?  x86-64 isn=92t =
unsupported and presumably a x86/x86-64 multilib setup will fail the same w=
ay?

Ross


--_000_PH7PR11MB644928A5A35201518EE5B6DC8D82APH7PR11MB6449namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Ross,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for reviewing the patch and your suggestion.<=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;&gt; Why does this restrict rust-cross-canadian =
to arm/aarch64?&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal">Please find the patch at following link that fixes t=
he conflicts for arm64 and x86-64.</p>
<p class=3D"MsoNormal"><a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/message/191481">https://lists.openembedded.org/g/openembedded-cor=
e/message/191481</a></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,</p>
<p class=3D"MsoNormal">Deepthi</p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0in 0in 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><b>From: </b><a hr=
ef=3D"mailto:Ross.Burton@arm.com">Ross Burton</a><br>
<b>Sent: </b>Thursday, November 23, 2023 6:10 PM<br>
<b>To: </b><a href=3D"mailto:Deepthi.Hemraj@windriver.com">Hemraj, Deepthi<=
/a><br>
<b>Cc: </b><a href=3D"mailto:openembedded-core@lists.openembedded.org">OE C=
ore mailing list</a>;
<a href=3D"mailto:Randy.MacLeod@windriver.com">MacLeod, Randy</a>; <a href=
=3D"mailto:Naveen.Gowda@windriver.com">
Gowda, Naveen</a>; <a href=3D"mailto:Shivaprasad.Moodalappa@windriver.com">=
Moodalappa, Shivaprasad</a>;
<a href=3D"mailto:Sundeep.Kokkonda@windriver.com">Kokkonda, Sundeep</a>; <a=
 href=3D"mailto:raj.khem@gmail.com">
Khem Raj</a><br>
<b>Subject: </b>Re: [OE-core] [PATCH V2] rust-cross-canadian: Fix file conf=
licts for arm and aarch64</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">CAUTION: This email c=
omes from a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On 8 Nov 2023, at 10:20, Hemraj, Deepthi via lists.openembedded.org &lt;Dee=
pthi.Hemraj=3Dwindriver.com@lists.openembedded.org&gt; wrote:<br>
&gt; +&nbsp;&nbsp;&nbsp; # Set up environment variables for AArch64<br>
&gt; +&nbsp;&nbsp;&nbsp; if [ &quot;${TARGET_ARCH}&quot; =3D &quot;aarch64&=
quot; ]; then<br>
&gt; + CARGO_ENV_SETUP_SH=3D&quot;${ENV_SETUP_DIR}/cargo-aarch64.sh&quot;<b=
r>
&gt; + CARGO_TARGET_SYS=3D&quot;aarch64-unknown-linux-gnu&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; elif [ &quot;${TARGET_ARCH}&quot; =3D &quot;arm&qu=
ot; ]; then<br>
&gt; + CARGO_ENV_SETUP_SH=3D&quot;${ENV_SETUP_DIR}/cargo-arm.sh&quot;<br>
&gt; + CARGO_TARGET_SYS=3D&quot;arm-unknown-linux-gnueabi&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; else<br>
&gt; + echo &quot;Unsupported TARGET_ARCH: ${TARGET_ARCH}&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; fi<br>
<br>
Why does this restrict rust-cross-canadian to arm/aarch64?&nbsp; x86-64 isn=
=92t unsupported and presumably a x86/x86-64 multilib setup will fail the s=
ame way?<br>
<br>
Ross<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PH7PR11MB644928A5A35201518EE5B6DC8D82APH7PR11MB6449namp_--

