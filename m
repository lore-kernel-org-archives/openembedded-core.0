Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BE0C5479D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 09:11:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9780.1672996286013161770
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 01:11:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GZs6RQot;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0370ea45eb=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3068m3BI019367
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Jan 2023 01:11:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=tiNQlccpDj7/kIiW3KYO5n24GHQawlV+BsnzUMHnv9E=;
 b=GZs6RQotjQZA6todzW54PcC5XBwPm4LdYVy55Bvb0Bg3usdkYTfFFCzAJ8FeLkzJLIry
 59v8Xgzw6c3BsbiiR+z6P9Jvpc69Xy3qLQDWxlsUxQjWtOYjXF+2lA1PoPOSelrsv/G7
 gi15jLG94duLVKlSPCuZq83kyGAIQUT2DmL/I0iqrN1w5GcXLii7klKqj52R06P2YkAI
 9KR9ZwiPyJ1TuGHdj6rvZ2l3gHBGyvAoKm8lK78z8hDHfVIrdvkUfRxZdyszTVmQj4zy
 FDQoOLhLimbWvYHxjo1280xBw24kPPg2byjODNHyCKDEqjC7Pi9nbH5qEuPy4UwKdweq DA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mtnfruqy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 01:11:25 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3069BORR000722
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Jan 2023 01:11:24 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mtnfruqy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jan 2023 01:11:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jN1QUJep2Con+d8nky+KAs88XwnQ/LcliWhI/00d8Rjxx+YEtte23hKVH0VgkZaH5PcchFi5EB8mPM3G3iMT1qvlCC5tEDlie3wbs3bzj3Pkng2JKht5CVHl5wC7C7U8AWpoD/IZnUdSv3tpvF2WRVOtBdwytZ8QnHPf1O9Cqy1KYSUgsHy5L7WaxbaH8S+kq0rKbwyLqLRb5piQG2CxLGKj4p0QNenzUUUU10rPWnsonsAaxhtKIpEMPC3aN/q1zrzvoSZSNV0JLOAescntE/shevhFWxAb5wzh/erXeO7x2+HErrRb7WEB+khfUl5VAtoJkrDuCsfrNvp+3fycAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiNQlccpDj7/kIiW3KYO5n24GHQawlV+BsnzUMHnv9E=;
 b=aUgPhDFOXCu6ifFvM2vfzfa4yj0mS8zYTz2qDngjqr74CbBIr4RUQHrRrYbzRH0HbDHn/C0B/zieGEFo6pJN4+cziqEhIKduOm+G8Po8gkuMmNAzP7WRgfBv4SBAJnw/mvMuuYsZf4Y9vBHeZSSlegHnUptIPiOVtyeodb/jDbkZ6gfUtcHz+wCMVzey9cmRj5hXPzPLDuAb2C+q54CkxDPAhl5mXLTD3MLelvmd1an2DWq/9BOpihcDLjMn140+iUH76xvaxW66VEvJ9uvvR9rMjk7sY047hvYD2kUuPAZuPXr3NzAiryQnPx3kLlkOWT+G1m9HpBvMZuX8Z0Cw1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CH0PR11MB5538.namprd11.prod.outlook.com (2603:10b6:610:d5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 09:11:19 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c0fd:6b71:8808:4c21]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c0fd:6b71:8808:4c21%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:11:19 +0000
From: "Yu, Mingli" <Mingli.Yu@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURES
Thread-Topic: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURES
Thread-Index: AQHZFrL/QuopzLqlx0mtgN/wjaOY+66PJ8/NgABQPwCAAbalOg==
Date: Fri, 6 Jan 2023 09:11:19 +0000
Message-ID: 
 <CO1PR11MB5009A23CA03A78D7FB67DA2EF1FB9@CO1PR11MB5009.namprd11.prod.outlook.com>
References: <20221223093229.823322-1-mingli.yu@eng.windriver.com>
 <CANNYZj-iY82hN76qV6DZSfMHobF30hM7rKRXkVwFUYGDV1AkJw@mail.gmail.com>
 <CO1PR11MB50090C2DFF0949D0B90ED483F1FA9@CO1PR11MB5009.namprd11.prod.outlook.com>
 <CANNYZj9GAPNapBr3PyxAmj-JaiGRV=EnR1YqZnPXA5Yuf+_02A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9GAPNapBr3PyxAmj-JaiGRV=EnR1YqZnPXA5Yuf+_02A@mail.gmail.com>
Accept-Language: en-US, en-AS, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5009:EE_|CH0PR11MB5538:EE_
x-ms-office365-filtering-correlation-id: 8ed66250-6f1b-4cb5-e850-08daefc5f93e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uCOITqHOyRmcg373pgCfNK/01MXu6xo9HxWmszbCsoG4xBv0GjW6kbl9XmjyMsHUDofEToSLqUEE67Hs3nOZVrFzMsZTgtzZQY8ANkNt8kvWgDjYUr/TB/25qt+sgN91oDdStyOA94GC3BO7bOe3dewirnYAGyPtypcnlFp+jI1Xz1FhL0zxdXPfYgDXETekRkc6PV+Oy7Tr6KD4+cbZJVuZb0JD58t+YX293mjSNY913jnrLq1F0rnkPxviTTCbUhC7zvj1MXPZOZZ0CTFC4TEF0lX+yI8v12kbytpyiHzhgY2L6bVIl173xSxKCp3qAsxYgoDTl9K0jIh3Hi1jHyt71dQutB/+20aVyrULvIWm6NrlLOmp5klEpTw+Gv/wyFhzYF+wMRbF1t9yHQ6SvGxoJTa2R0ll6aE9n4H2gDA/MtJ+JQrrTA9Tivhdsu1qJ8OmNVjQdC+e6jyY9NaE3uFNYPCz1maJJNuEJureLDqX9fPdPnN33JVvtZGLGxVOuyGLbojVc/uAlnRGhDyKPshKz014RYQpSWvuVkttCu13Exp2v/YLafe0pUkh29Cqz/ruxOgT/1u6EC7CQvG6lbOzJHsVi/yfklmbdK+0zY0Zc+bXcIkHwx8yDEY1TStqZnj2+oNLRJOCo0xB0Wg9Z5jBgfWNP3tYO4NRl6tJW3CESkg6Q1KgNIJNCw+I914tk8OKCZ/9RXtE0DzD/ZIWke4CrhLPfbVwbOnMwF4W1ddGvjiEwZmsRZRJ4zhuI2QvBzh5l8ribzJgu4wiCiVqUjbpSHNIYrDYEUvpyEsGf+Q=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(451199015)(83380400001)(53546011)(186003)(55016003)(26005)(9686003)(6506007)(7696005)(33656002)(122000001)(86362001)(38070700005)(166002)(38100700002)(4326008)(8676002)(41300700001)(66899015)(2906002)(5660300002)(19627405001)(8936002)(52536014)(71200400001)(478600001)(966005)(66556008)(316002)(64756008)(66946007)(6916009)(76116006)(66476007)(66446008)(91956017)(9126006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?kBNn0jO1AwQTrEbwDTpon6x9abHF1Hw2YXY+5aSrKOlx1ZHbiUGqdaG2?=
 =?Windows-1252?Q?HwSqF6lZ1dGuuBGSmfVl7dOa+tKASbVt9bm0VA5Ny/VW1BgEDcLZJHVd?=
 =?Windows-1252?Q?A8pb/la7ebZbotIwSNcVjWDDJaVNeESV2ocQ9Ct3wNXUzdzJQeP8IPRD?=
 =?Windows-1252?Q?CTjdl2Z5gX+ZXT1ASvmfGIa3tbrdBtP7584ydi1nJj18eSzA9SbizzFv?=
 =?Windows-1252?Q?7LY2IG7tB7qnwiQJS+rSDp9puQ1UuuyfOaAH2iHLhijQhvTVsQVdaGoJ?=
 =?Windows-1252?Q?s1BQRIyRDiDOnw1XR2Bl3b1Md0+IwJ0GhUtxQ/gKDjn7OwaITsng890L?=
 =?Windows-1252?Q?NZ8n5oHq1Y/2lZPp2mD4/gRdcBqLS6GOqEOfqgKtSIwAlDHhzFwwoIEi?=
 =?Windows-1252?Q?7HFMU0VPhGZ8Q5td0VxgIbSBNobnXtg6UuS00nADPRyJqfnnHsBS6RLS?=
 =?Windows-1252?Q?WyOtTeliALzNbFrjLp+FiGU2pfKPceBS+Ph6bdKKXutcimDD8Bkoynm6?=
 =?Windows-1252?Q?1NiyUmJYBQSv4DADkFWvCMiAsv5n8SyMLiC/XiR82U12Y2BWTqjHVK/i?=
 =?Windows-1252?Q?MUDHZuMsbVrvTQB2aSrmAY9p8j+vEH8qBoebo0dX+Xp9Ytvj+QwM5TlS?=
 =?Windows-1252?Q?D8lOd9znYrxOCdiIr6D4rxA5bhGzCTOsph7KW4KJIergHJOc7SwEH1ZD?=
 =?Windows-1252?Q?+UN2HPePvf8ADLrOO/YTwNdW5wp7mkDtVyXOlwhTnP6khq+eMvMfdGxM?=
 =?Windows-1252?Q?JI8jO4LFICi75oZ2jlPLy7ClR1VYWM9EVSqSSnuaXg5SSyd6MSquy2E3?=
 =?Windows-1252?Q?a0vghVG0SqvcBAG8aDLMVlLke+bGNtRg5nCteIzP6J3ajXcbdn4Uq/jE?=
 =?Windows-1252?Q?vcQDuJDfR5eo4tisnDWe4Le8LsKm5hcQkI7XYeHdCzwk+yHp+a5DCJg8?=
 =?Windows-1252?Q?Qm/SlI5Qj4g5T8vvk2kyiZp3NJMiPCMlqx4j/ra+ufZJ/fl9EVt08UBp?=
 =?Windows-1252?Q?Io2fzrz0zkfHbXVmtE/NBfPdI89Akbs7z0f2rX9/wZYhTRlf8Vjw4yNF?=
 =?Windows-1252?Q?ssPviRVj86Xj9V0BY84eK/3t5Di6r+U6lkD8yownS6DIgwBIY+b3SaOP?=
 =?Windows-1252?Q?LRw42HYYvINe/25GzhzQpVI3dnM0hYBgg3GYt2PW27XGbKZRE/7xh6on?=
 =?Windows-1252?Q?YA5GN2PeDbsjwkSZGn3H/lWM+KviQ6N/CO2RS0eoXBx9IVGUBCqcntFg?=
 =?Windows-1252?Q?PVG/ekpnv/vmyFjJVF8qzhMHFVfd5EW5vCuxYga3ZdUhYBCFKLWvfKM6?=
 =?Windows-1252?Q?5fKh988Xiqh6uLpPGDq7KHIat0g3PSN+vFCwYxExdMEU172LesDfopZG?=
 =?Windows-1252?Q?DTOCKc0uDWPKlfZaxZLvZlBuiNdVb/k242wgro4bbQgAg4HQiTRFd2Ia?=
 =?Windows-1252?Q?CBCk/BRfEvkIMLm2HIFsLh3lOww/pu783wn3nCIIca6FvO1rkii9/eEi?=
 =?Windows-1252?Q?fA6XseoB4WUusgUrzQHEsV854qdN1ap8i/OKrGMqay9P1nAPrzibckrx?=
 =?Windows-1252?Q?gKlsPWdAwq/K3r+S4Uc/qu1q6GULLoa6s1r1o0SIzicxwuDMIx5OyxaK?=
 =?Windows-1252?Q?9fG8qTPJczpnUOv/ZOkebotkPl6CVtGFMNMVZc5r2Y9CjjKBW4dXwTZQ?=
 =?Windows-1252?Q?lc430x1CFHudscvRMhFYvw4FSVsOzkRQ?=
Content-Type: multipart/alternative;
	boundary="_000_CO1PR11MB5009A23CA03A78D7FB67DA2EF1FB9CO1PR11MB5009namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed66250-6f1b-4cb5-e850-08daefc5f93e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 09:11:19.5123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ddThfgcMCg3JjcVc65tBysDGuKpdYHJLHeVQIroQrTZLILFzkLUFRaA9fzWFlwerj3QLh+AdugJ7uJdsiixnqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5538
X-Proofpoint-ORIG-GUID: RN8Ss9Ig4nPXNn0bVUHsxfGjBGspiyzE
X-Proofpoint-GUID: SkWRQh9RWG-NjUCla2zWehdI4g8Nyhlp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_05,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301060072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 09:11:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175566

--_000_CO1PR11MB5009A23CA03A78D7FB67DA2EF1FB9CO1PR11MB5009namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

The gtk4 depends on libepoxy [1] which needs opengl  DISTRO_FEATURES and it=
 makes gtk4 require opengl  DISTRO_FEATURES too. And it also introduces the=
 opengl DISTRO_FEATURES requirements for other recipes which depend on gtk4=
, please help to check.


[1] https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphi=
cs/libepoxy/libepoxy_1.5.10.bb

Thanks,
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Thursday, January 5, 2023 14:55
To: Yu, Mingli <Mingli.Yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURES

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.
But does this mean we now have to insert required distro features statement=
 into everything that depends on gtk4? That doesn=92t seem useful; it shoul=
d be enough to say that only in the recipe where the requirement originates=
.

Alex

On Thu 5. Jan 2023 at 3.10, Yu, Mingli <Mingli.Yu@windriver.com<mailto:Ming=
li.Yu@windriver.com>> wrote:
Hi Alex,

Yes,  The setting REQUIRED_DISTRO_FEATURES =3D "opengl" is in gtk4 recipe. =
Apart from that, gtk4 depends on libepoxy which also needs opengl distro.

Thanks,
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com<mailto:alex.kanavin@gmail.c=
om>>
Sent: Friday, December 23, 2022 17:43
To: Yu, Mingli <Mingli.Yu@windriver.com<mailto:Mingli.Yu@windriver.com>>
Cc: openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists=
.openembedded.org> <openembedded-core@lists.openembedded.org<mailto:openemb=
edded-core@lists.openembedded.org>>
Subject: Re: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURES

CAUTION: This email comes from a non Wind River email account!

Do not click links or open attachments unless you recognize the sender and =
know the content is safe.
Is OpenGL really mandatory for gtk4?

Alex

On Fri 23. Dec 2022 at 10.32, Yu, Mingli <mingli.yu@eng.windriver.com<mailt=
o:mingli.yu@eng.windriver.com>> wrote:
From: Mingli Yu <mingli.yu@windriver.com<mailto:mingli.yu@windriver.com>>

Fixes:
  $ bitbake gcr
  ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/oe-core/meta/recipes-gn=
ome/gcr/gcr_4.0.0.bb<https://urldefense.com/v3/__http://gcr_4.0.0.bb__;!!Aj=
veYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5E=
t5Kwi6bPycXwXHb4CuXgAucUmL4$> DEPENDS on or otherwise requires it)
gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_F=
EATURES)
  ERROR: Required build target 'gcr' has no buildable providers.
  Missing or unbuildable dependency chain was: ['gcr', 'gtk4']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com<mailto:mingli.yu@windrive=
r.com>>
---
 meta/recipes-gnome/gcr/gcr_4.0.0.bb<https://urldefense.com/v3/__http://gcr=
_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6=
JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$> | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gcr/gcr_4.0.0.bb<https://urldefense.com/v3/=
__http://gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAA=
nzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$> b/meta/recipes-gn=
ome/gcr/gcr_4.0.0.bb<https://urldefense.com/v3/__http://gcr_4.0.0.bb__;!!Aj=
veYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5E=
t5Kwi6bPycXwXHb4CuXgAucUmL4$>
index 264069ffd1..22edd386fc 100644
--- a/meta/recipes-gnome/gcr/gcr_4.0.0.bb<https://urldefense.com/v3/__http:=
//gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mg=
KI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$>
+++ b/meta/recipes-gnome/gcr/gcr_4.0.0.bb<https://urldefense.com/v3/__http:=
//gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mg=
KI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$>
@@ -20,6 +20,8 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
 inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-version=
-is-even vala gobject-introspection gettext mime mime-xdg
 UPSTREAM_CHECK_REGEX =3D "gcr-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz=
"

+REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11=
', 'opengl', '', d)}"
+
 SRC_URI +=3D "file://0001-meson.build-correctly-handle-disabled-ssh_agent-=
opti.patch"
 SRC_URI[archive.sha256sum] =3D "c45855924f0ee7bab43e2dd38bfafd2ac815c6e986=
4341c0161e171173dcec7c"

--
2.25.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#174976): https://lists.openembedded.org/g/openembedded-=
core/message/174976<https://urldefense.com/v3/__https://lists.openembedded.=
org/g/openembedded-core/message/174976__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx=
-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgJaHBHwR$>
Mute This Topic: https://lists.openembedded.org/mt/95842308/1686489<https:/=
/urldefense.com/v3/__https://lists.openembedded.org/mt/95842308/1686489__;!=
!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gki=
Y5Et5Kwi6bPycXwXHb4CuXgFA08ADx$>
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core%2Bowner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub<https=
://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/u=
nsub__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXR=
ulca1gkiY5Et5Kwi6bPycXwXHb4CuXgMLu9URo$> [alex.kanavin@gmail.com<mailto:ale=
x.kanavin@gmail.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--_000_CO1PR11MB5009A23CA03A78D7FB67DA2EF1FB9CO1PR11MB5009namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof">Hi Alex,</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof ContentPasted0 ContentPaste=
d2 ContentPasted3 ContentPasted4">The
 gtk4 depends on&nbsp;libepoxy [1] which needs opengl&nbsp;&nbsp;DISTRO_FEA=
TURES and it makes gtk4 require&nbsp;opengl&nbsp;&nbsp;DISTRO_FEATURES too.=
 And it also introduces the opengl&nbsp;DISTRO_FEATURES requirements for ot=
her recipes which depend on gtk4, please help to check.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof ContentPasted0"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof ContentPasted0"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof ContentPasted0 ContentPaste=
d1">[1]&nbsp;<a href=3D"https://git.openembedded.org/openembedded-core/tree=
/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb" id=3D"LPlnk536996">http=
s://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics/libep=
oxy/libepoxy_1.5.10.bb</a></span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
Thanks,</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Thursday, January 5, 2023 14:55<br>
<b>To:</b> Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FE=
ATURES</font>
<div>&nbsp;</div>
</div>
<div><strong>
<div style=3D"border:solid #9c6500 1pt; padding:2pt; background:#fcfc03"><s=
pan style=3D"font-size:11pt; color:#000">CAUTION: This email comes from a n=
on Wind River email account!</span></strong><br>
<span style=3D"font-size:10pt; color:#000">Do not click links or open attac=
hments unless you recognize the sender and know the content is safe.</span>=
<br>
</div>
<div>
<div dir=3D"auto">But does this mean we now have to insert required distro =
features statement into everything that depends on gtk4? That doesn=92t see=
m useful; it should be enough to say that only in the recipe where the requ=
irement originates.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Alex&nbsp;</div>
<div><br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Thu 5. Jan 2023 at 3.10, Yu, Min=
gli &lt;<a href=3D"mailto:Mingli.Yu@windriver.com">Mingli.Yu@windriver.com<=
/a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left-width:1px; border-left-style:solid; padding-left:1ex; border-left-c=
olor:rgb(204,204,204)">
<div dir=3D"ltr">
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; background-color:rgb(255,255,255); color:rgb(0,0,0)">Hi Alex,</spa=
n></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; background-color:rgb(255,255,255); color:rgb(0,0,0)"><br>
</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; background-color:rgb(255,255,255); color:rgb(0,0,0)">Yes,&nbsp; Th=
e setting REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot; is in gtk4 recipe=
. Apart from that, gtk4 depends on&nbsp;libepoxy which also
 needs opengl distro.</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; background-color:rgb(255,255,255); color:rgb(0,0,0)"><br>
</span></div>
<div><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-si=
ze:12pt; background-color:rgb(255,255,255); color:rgb(0,0,0)">Thanks,</span=
></div>
<div id=3D"x_m_-7193453025957777169appendonsend"></div>
<hr style=3D"display:inline-block; width:98%">
<div id=3D"x_m_-7193453025957777169divRplyFwdMsg" dir=3D"ltr"><font face=3D=
"Calibri, sans-serif" style=3D"font-size:11pt; font-family:Calibri,sans-ser=
if; color:rgb(0,0,0)"><b style=3D"font-family:Calibri,sans-serif">From:</b>=
 Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"=
_blank" style=3D"font-family:Calibri,sans-serif">alex.kanavin@gmail.com</a>=
&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Sent:</b> Friday, December 23, =
2022 17:43<br>
<b style=3D"font-family:Calibri,sans-serif">To:</b> Yu, Mingli &lt;<a href=
=3D"mailto:Mingli.Yu@windriver.com" target=3D"_blank" style=3D"font-family:=
Calibri,sans-serif">Mingli.Yu@windriver.com</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Cc:</b> <a href=3D"mailto:opene=
mbedded-core@lists.openembedded.org" target=3D"_blank" style=3D"font-family=
:Calibri,sans-serif">
openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembe=
dded-core@lists.openembedded.org" target=3D"_blank" style=3D"font-family:Ca=
libri,sans-serif">openembedded-core@lists.openembedded.org</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Subject:</b> Re: [OE-core] [PAT=
CH] gcr: add opengl to REQUIRED_DISTRO_FEATURES</font>
<div>&nbsp;</div>
</div>
<div><strong>
<div style=3D"border:1pt solid rgb(156,101,0); padding:2pt; background-colo=
r:rgb(252,252,3)">
<span style=3D"font-size:11pt; color:rgb(0,0,0)">CAUTION: This email comes =
from a non Wind River email account!</span></div>
</strong><br>
<span style=3D"font-size:10pt; color:rgb(0,0,0)">Do not click links or open=
 attachments unless you recognize the sender and know the content is safe.<=
/span><br>
</div>
</div>
<div dir=3D"ltr">
<div>
<div dir=3D"auto">Is OpenGL really mandatory for gtk4?</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Alex</div>
<div><br>
<div>
<div dir=3D"ltr">On Fri 23. Dec 2022 at 10.32, Yu, Mingli &lt;<a href=3D"ma=
ilto:mingli.yu@eng.windriver.com" target=3D"_blank">mingli.yu@eng.windriver=
.com</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex; border-left-width:1px; borde=
r-left-style:solid; padding-left:1ex; border-left-color:rgb(204,204,204)">
From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=3D"_b=
lank">mingli.yu@windriver.com</a>&gt;<br>
<br>
Fixes:<br>
&nbsp; $ bitbake gcr<br>
&nbsp; ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/oe-core/meta/recip=
es-gnome/gcr/<a href=3D"https://urldefense.com/v3/__http://gcr_4.0.0.bb__;!=
!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gki=
Y5Et5Kwi6bPycXwXHb4CuXgAucUmL4$" rel=3D"noreferrer" target=3D"_blank">gcr_4=
.0.0.bb</a>
 DEPENDS on or otherwise requires it)<br>
gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_F=
EATURES)<br>
&nbsp; ERROR: Required build target 'gcr' has no buildable providers.<br>
&nbsp; Missing or unbuildable dependency chain was: ['gcr', 'gtk4']<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
&nbsp;meta/recipes-gnome/gcr/<a href=3D"https://urldefense.com/v3/__http://=
gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI=
4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$" rel=3D"noreferrer" target=
=3D"_blank">gcr_4.0.0.bb</a> | 2 ++<br>
&nbsp;1 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-gnome/gcr/<a href=3D"https://urldefense.com/v3/__=
http://gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnz=
q3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$" rel=3D"noreferrer" =
target=3D"_blank">gcr_4.0.0.bb</a> b/meta/recipes-gnome/gcr/<a href=3D"http=
s://urldefense.com/v3/__http://gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx=
6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUm=
L4$" rel=3D"noreferrer" target=3D"_blank">gcr_4.0.0.bb</a><br>
index 264069ffd1..22edd386fc 100644<br>
--- a/meta/recipes-gnome/gcr/<a href=3D"https://urldefense.com/v3/__http://=
gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI=
4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$" rel=3D"noreferrer" target=
=3D"_blank">gcr_4.0.0.bb</a><br>
+++ b/meta/recipes-gnome/gcr/<a href=3D"https://urldefense.com/v3/__http://=
gcr_4.0.0.bb__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI=
4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgAucUmL4$" rel=3D"noreferrer" target=
=3D"_blank">gcr_4.0.0.bb</a><br>
@@ -20,6 +20,8 @@ GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot;<br>
&nbsp;inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-ve=
rsion-is-even vala gobject-introspection gettext mime mime-xdg<br>
&nbsp;UPSTREAM_CHECK_REGEX =3D &quot;gcr-(?P&lt;pver&gt;\d+\.(\d*[02468])+(=
\.\d+)+)\.tar.xz&quot;<br>
<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;${@bb.utils.contains('DISTRO_FEATURES',=
 'x11', 'opengl', '', d)}&quot;<br>
+<br>
&nbsp;SRC_URI +=3D &quot;file://0001-meson.build-correctly-handle-disabled-=
ssh_agent-opti.patch&quot;<br>
&nbsp;SRC_URI[archive.sha256sum] =3D &quot;c45855924f0ee7bab43e2dd38bfafd2a=
c815c6e9864341c0161e171173dcec7c&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174976): <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/message/174976__;!!AjveYdw8EvQ!=
aAHHBL_XF2Kj8Qx6nJlx-VEmLcYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPyc=
XwXHb4CuXgJaHBHwR$" rel=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/174976</a><br>
Mute This Topic: <a href=3D"https://urldefense.com/v3/__https://lists.opene=
mbedded.org/mt/95842308/1686489__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmLcY=
aA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgFA08ADx$" rel=3D"=
noreferrer" target=3D"_blank">
https://lists.openembedded.org/mt/95842308/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lists.openembed=
ded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!aAHHBL_XF2Kj8Qx6nJlx-VEmL=
cYaA6O2xpfAAnzq3_mgKI4R6JBzXRulca1gkiY5Et5Kwi6bPycXwXHb4CuXgMLu9URo$" rel=
=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<=
br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_CO1PR11MB5009A23CA03A78D7FB67DA2EF1FB9CO1PR11MB5009namp_--

