Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1013EE49A4
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 02:18:45 +0000 (UTC)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (JPN01-OS0-obe.outbound.protection.outlook.com [40.107.113.118])
 by mx.groups.io with SMTP id smtpd.web11.50203.1694398721393516271
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 19:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@lineouser.onmicrosoft.com header.s=selector1-lineouser-onmicrosoft-com header.b=dugFkcfJ;
 spf=pass (domain: lineo.co.jp, ip: 40.107.113.118, mailfrom: hayama@lineo.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A38oVdkbhTjXF56rP16bJ5ADI5UuxSce0XVcyW4+up+db2JahhST59DpsU0Kw3hOb3os7cHjS0he59faraGjmJTkO1QLh8klj9vXm4Ygrcu8N88SRoajyyPkzadQmrlorja3w5Th0Et2/SVxsQoVu9JahipQZJzJyFz+2kgEtpVUBiDH3ZODOyc9sj+zxxsucKHUKOuElwkPzmr14SwlUSGcMbpgf4BzmB/kKgPMEVk+qRJsvykPMjLSfK8Z8yG0x3oQ3Ia2iFINwWxT/wTCzejga9YlTktT5rFRuutUiDjPa/YR7C4cmElmVpXza+3ltVd/fDMvYOZKdayjfJuRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3r8IDhe4YJ1ca5b5C9lqLHg0S9cmVTfNDJgaaLfcnn8=;
 b=gzYeAXg0VZb5VCzT49NwfpWnL4wRnyHeJ/slDlBPHxa0p4cnoCM9ZbErKHZffXTWAD7yazpHHaQh9rQpQYmuWnqyHtIobtZxl6tlmaaulvVegJwbfpVDRPkomLhszWEjIELOnWmVwjoxd1Ku2AuX7dB3RRJSeGKTpv6vVrFBllMscBuwkfmLV+XQ3ds+4BwS5LckB6Z+G0Y97aF5iA3xh/TpqX5NysJrH9qjD2N8KDnFVCEJItGzRparQlulXPKv2I0efBa2fbqFxPexNfjS1RH711WkIkVIezEGkHwW6PxKN0SgXqxU5mUJvUknAWzU8XcyVkc+xVUfGYCZ2ohcIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lineouser.onmicrosoft.com; s=selector1-lineouser-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3r8IDhe4YJ1ca5b5C9lqLHg0S9cmVTfNDJgaaLfcnn8=;
 b=dugFkcfJCMz0tQ/RiYI2R7GI/25h8W5EZ2rb730BOubr49lMUKT+ftkFDjEz8fh3haPIeUqiGLkxIQFPq82P7w5I2msRh+SrPx1BbZSqXeX+blt4K/UDUdg/GPcnZ1v9n59b8htj0xwokDTytywzbGg+XdS/V+QK8AFNCERg4JE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com (2603:1096:404:dd::23)
 by TYCPR01MB11547.jpnprd01.prod.outlook.com (2603:1096:400:389::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 02:18:36 +0000
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::f6d7:dd5e:bdf5:abb6]) by TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::f6d7:dd5e:bdf5:abb6%4]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 02:18:36 +0000
Message-ID: <9ee8fcbf-da31-5f22-aaad-2811eeaad0d8@lineo.co.jp>
Date: Mon, 11 Sep 2023 11:18:34 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [OE-core] [PATCH 1/3] linux/generate-cve-exclusions: fix
 mishandling of boundary values
To: ross.burton@arm.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230905072920.615-1-hayama@lineo.co.jp>
 <C799CA2F-53A9-47A7-812A-73DC55F64073@arm.com>
 <5e19b8ff-358e-0b6b-2fd4-f7884ddd280a@lineo.co.jp>
 <097A1A90-C4FA-4D2D-9FBA-193ED9D4D5BF@arm.com>
 <0C22D829-0D4A-4623-B678-8AB3D4946CFB@arm.com>
Content-Language: en-US
From: Yuta Hayama <hayama@lineo.co.jp>
In-Reply-To: <0C22D829-0D4A-4623-B678-8AB3D4946CFB@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: OSTPR01CA0072.jpnprd01.prod.outlook.com
 (2603:1096:604:21a::11) To TY2PR01MB3769.jpnprd01.prod.outlook.com
 (2603:1096:404:dd::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR01MB3769:EE_|TYCPR01MB11547:EE_
X-MS-Office365-Filtering-Correlation-Id: 0095428a-c3c8-4210-0588-08dbb26d67a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f0kJmLBzseJMGorIXCUP0qpIx/zaw/9giOK3IGD0+N5ovVfHLLJYHiRxrBdZZUVfYBTJJ7pC0LubVB09glGM7Oj65aGhcjgT2HmGZSa9nR14morPhPlGHNKN6B0EGhcRAl2gkTwgBns+XxkSwiW4BQ6BkzLlZ6lOGkGRCv684Zn5prgREy/3twFZz/C9Zn6/hcRysbGve3kDJbfr5F7nXheFiaqKB/Xvk+lZcS+6kUH8fQ4ZmM8TKZyaFKVrmZzAiAS9ETaPOWjudb/QlOzfyhIEUaA4xddgyRR5D8E2dyw1CMB8rCC+HNe/oy8oxdUAK3fnH6vdMckpuGWtqzwCo0dXKpZHKW9ElFFlAlLl7y0w+Cx+X7wQqohTO1bGezVUoh6mmPEqb2uYpLmFKR3W34Xt+ZcRmY47akDiWHUsel5oONTUaqUPFODTFJfm+PUlO3B33pE23nOvGO6lPnKnj2Mg5RRVxAQji5oFqPjh9s71aDbP5HMiMbz9vfmUYKNm84Cr9WIhExccYFUpbKiBbO62CEhCdbCV1ncbGc/4XcpTEYfTS0qA2KuxiVfVk7x5+K2S7Or1mp36K8rfBXNxlLwlMOChEL0ciQvLQ+uAifkYq2XY8PboIJInqpQzxJZdChhYA0Jz9/Lq1oGHXkMwuw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3769.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39830400003)(376002)(136003)(396003)(1800799009)(186009)(451199024)(6506007)(53546011)(6486002)(6512007)(966005)(478600001)(83380400001)(26005)(2616005)(2906002)(66476007)(66556008)(66946007)(316002)(6916009)(41300700001)(5660300002)(8676002)(8936002)(31696002)(86362001)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?huUY1193eO1VsFJGGR7qiQSiABooLph+eIZ0LS0nzcr4eOvRQ9GkzqzbA59X?=
 =?us-ascii?Q?TRN8ItIWhpnNeOQF7tKOfzzItJQcTnAwFr5SWepgWkDnXY24WI1fS0R+4OiC?=
 =?us-ascii?Q?yuUVeyPCm+bpkdf7lPM5mbqtjZ7CGG82g/3lMStnLO6e9WQWq895DHRCoV6N?=
 =?us-ascii?Q?Z8E4Fddj2avxPeigs0x4acDI3OY91Wb6lbGvEvPmVqsu0XGzLtPoJd+OdU5Z?=
 =?us-ascii?Q?voZo2VtWU6oPBwhBRN+7nwoTVC2huHb7hZ9CraruSnQRialxtGjH/+/A3PVV?=
 =?us-ascii?Q?QnTpCWAb5Aet/rHuEnfkULHlQDoBh7nymr8ubFfW1yVunViv8/OdbjIsTuSb?=
 =?us-ascii?Q?+NUXrvMqAm7pa49mvmHadhw8g8oRsEbMp9DmFZbx0dDvIS3QUQ4iesCcnfOM?=
 =?us-ascii?Q?SwabeMNxBHY9QnISlDUpkMTJJNjgGBenzaDRabofMDFcBmzpDhns/ZHQ53/Z?=
 =?us-ascii?Q?5JU4ChmjsfxduOoikfZICwKIyNlOtK6FwOsEcOUeI34BHkVyPhzTaSUtfSlh?=
 =?us-ascii?Q?XPtJeS+Ppc7UhmuQ665xA4D+Nzvznl0iDht3u2+pF/V+CmGyv+qDaVzK3U0K?=
 =?us-ascii?Q?IFZjLGbD6K6n8uAXyT/fm209hpjOcfboGUdPCR6fIIDH3AvALua+2zrFHAVG?=
 =?us-ascii?Q?9jKpH821hJLcFzBay4/rYqA711uL6vf6RzUKEMb0QHwFGES/QWVHpYe7Q13c?=
 =?us-ascii?Q?OauAm/3CZ/1bSEXiXIabFggI1C214wvtOEsafP83obzUlO4oWZhGjzF925+D?=
 =?us-ascii?Q?6c9SLLJbfTzDWj4+/lnbdrLEuxvJOeXfWxUMh8mMn8DaNzr2CXUFxtl3uGUv?=
 =?us-ascii?Q?GWwTL6jaTovF1fyAyH60pCDrCuISi/ge7zRRR/5D24a2QyGOfDrIiOUkT17U?=
 =?us-ascii?Q?6cabMW+6sm7VVbGLDOsF8a/jrKkB45Qb2KPk4V3fwQMwddbu68pBPE0WVFjg?=
 =?us-ascii?Q?tfLW1HFLcwOwM1prYy/pHYGYVfWWzhte55hNal498SGONzAsM9hDowee0S6m?=
 =?us-ascii?Q?dSB6Z7Se5bjzLO+98ui4qtUKRgH+kqRUS9jvfe85Mo8Rbn2YvRtc/ehCaCRx?=
 =?us-ascii?Q?q0qbZXdBKJjatDt4ENcJJXkXVNsy2VteqDs7S23IhMEKX/G2m15Ia2aswthb?=
 =?us-ascii?Q?irPjv13Ze1QhTwbYY8AcisOB93w2LjnTkA5bz/o0MMcBu5LE+EojL2Q0TpuL?=
 =?us-ascii?Q?fMLfOVvD7CNKoV7MkRfGIUUmSrlv+MGFSvVv4YsdzmhV/OPk8QIovCWF1Yf3?=
 =?us-ascii?Q?91GK3Il0Eig1IOsioCIPkBKSKEu446Kqu8/E7IFxIWtM/L/a3me7ct4GH3zM?=
 =?us-ascii?Q?8ak5AaA89e1LQIupH4kEVgTb9P/m6xmPcMu4LRJYS69AvRBvVpBSGcNVbMRk?=
 =?us-ascii?Q?ANOhgnN2Kz8qfGY7hUaRp7a7OVxWElUC3H7g34g3VTteVX8sgiaq0qaJSBX9?=
 =?us-ascii?Q?OLzk+XvGrx5iejx1tlKwHxz27n3rWv/JeXb+m2mqKubWwR7a0vldARxgCqW6?=
 =?us-ascii?Q?mkP1KHyudtpSMLSugbFSUCvMk4VRBJVEbOUGmmnAYJGbEhXdPbEJe3Ue+wW3?=
 =?us-ascii?Q?5HIlZsrz/5V2iK990jgdoiR+vwgYqe7zbkGM8Bdb?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0095428a-c3c8-4210-0588-08dbb26d67a2
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3769.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 02:18:36.4152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OgQZvadQOCPrp6kn1klXFRaH/w6csk3B1TBV7JrU6sPTVR0klSvBlI0WwN8KWFWEBZ0dFFoQxZ97BI6TIuWv1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11547
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 02:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187474

On 2023/09/08 19:57, Ross Burton via lists.openembedded.org wrote:
> On 6 Sep 2023, at 13:30, Ross Burton via lists.openembedded.org <ross.bur=
ton=3Darm.com@lists.openembedded.org> wrote:
>>>> On 5 Sep 2023, at 08:29, Yuta Hayama <hayama@lineo.co.jp> wrote:
>>>>>
>>>>> affected_versions in kernel_cves.json does not mean "first affected v=
ersion
>>>>> to last affected version" but actually "first affected version to fix=
ed
>>>>> version". Therefore, the variable names, conditional expressions, and
>>>>> CVE_STATUS descriptions should be fixed.
>>>>
>>>> I=E2=80=99m happy to believe you on this, but do you have a source?
>>>
>>> Unfortunately, I have not found any official explanation for this. All =
I know
>>> is what I wrote in the following message. And that is what I have been =
able to
>>> confirm empirically.
>>>
>>> https://lists.openembedded.org/g/openembedded-core/message/186994
>>
>> Based on that evidence you appear to be right, yes.  I=E2=80=99ve just m=
ailed the maintainer of the JSON to see if he=E2=80=99d like to make a stat=
ement either way.
>=20
> I got a reply:
>=20
> "The code takes the breaking_cmt to fixing_cmt. So it would be First Affe=
cted version to First Fixed version in the mainline.=E2=80=9D
>=20
> Yes, you=E2=80=99re correct.

Thank you, Ross.
I am relieved to hear that I was not mistaken.

Also, thank you to the maintainers for applying the patch to the master.


Yuta Hayama

