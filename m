Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDDDC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 10:47:08 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.72])
 by mx.groups.io with SMTP id smtpd.web09.19019.1665571617601041069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 03:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=V4Fz+99i;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.103.72, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFHvSHGV/uIaiXi6LxERYY1a4nNt0/a8fAboKTgJCjwGNpWzeKiwcGOpilQ7wBtc0yX9NvXLdMyM3I8iIUPKae1j/il5CeUAeX4KheOu+RYkKzuXJfNzAammP/369AuZ2PsMHUdP1Kk0/QEi66W2Df1VVrK8ikA9+DHPp2f4yhFVx+xSTIFsfKzMmCdnT/nNznn2wNznNAPr/R2dUzP2SDnZhIpBdQOwPe7HErbOM9dE7B3lkNHjIfDiC2IM0q7P50V6EXmRkdCGElh6yN7EW9vEdk+8ExjiDd6pFD54RreycSH4aur1sIEDN6XI1WpDjDnXduciUtNCUwnZXLEe+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfHQGuGi3fklg1cdO8kC+cM4UR1iai3JsWfufSymHtA=;
 b=lAhX3zEBtqD8FAyKDyZcKToxBHzynq0raGwxv0Aen/jgxhoyj26g71b/MX0OR777LpXeye8PLPwdb0aHV7N3+lf+m7jrRcT3YYk4rPhut8vdVnLbUKwi381luKof3/fgkPh8wPG0rNhgcGvi2ICJa1nRrCx1IoPg7bcjSr4yZidcCmkEs1JeFkHJAM5t8U8rk4jLfz46DrC42bBgIcdnCCCrKtGIsM8yah3FllLC4eDkK9ZInMEYz4/XVbv12kqWLxfhYr+lJvZTMdY9RIjdTyvOusWgwA0A1F/Lyu2gadagHlFuaTP6+r03SfzA2iMC/bDuvNmM1QpGqgFZkHFTlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfHQGuGi3fklg1cdO8kC+cM4UR1iai3JsWfufSymHtA=;
 b=V4Fz+99ioqmkEEPmpvqHnjnd1ND3XqISJmbBCjLVmXNSBzK4212quokSycIbt4wtjE42SZNQcCIO6/xpLKDj7lnXa+XtNcuiA9io3Xnzwl/NSpLJqLk4YYVABBhTd+DPcEgTtqXClLGZAiU1Avb2I4uYo68qqVxUSqrTxY/5/4SlERTncCVEBGSciX4FXC5M8XtqGnGedbYH0u0wmtKRSOlxg1z4VCqmlpfMQaSavn8eTlYlbTd98Aw3lxZLFbXMbzf+zfYdSzXOZv9RiPfkXC2q4EXvD3vw+wwfrUcdPT/6hAQJDri+i9CsMMJgM628lbc5ANwJNKUv0ihOT1cC/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB8373.eurprd04.prod.outlook.com (2603:10a6:102:1bc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 10:46:53 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5709.015; Wed, 12 Oct 2022
 10:46:53 +0000
Message-ID: <4edacf8d-012c-b1c7-d599-cb6f58e7e34b@theobroma-systems.com>
Date: Wed, 12 Oct 2022 12:46:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [OE-core] severe issue in CVE checker
To: "Carlo \"Kappa\" Piana" <k@piana.eu>,
 Mikko Rapeli <mikko.rapeli@linaro.org>
CC: Marta Rybczynska <rybczynska@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 Alberto Pianon <alberto@pianon.eu>,
 OE-core <openembedded-core@lists.openembedded.org>,
 marta rybczynska <marta.rybczynska@linaro.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1529445347.7178896.1665568288122.JavaMail.zimbra@piana.eu>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <1529445347.7178896.1665568288122.JavaMail.zimbra@piana.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::9) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: 83102920-72d6-4c18-3a53-08daac3f134f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A3uHc45SKFiKR279ZG3MZmtFHcbC7ElDms+ZfNVQYP9/Vwpn1PMQHWXp0HUEg8r0cefziV3CX/tahOv4M/BJxdbMny8xWwSehZUXJKc9c3fxvMQIJ4XmY6GweeWSoqACbIr/R8HcKGTUmJc7EkI1Gz3/uODMrHJ5JSE9itqaAJ9wyRuDN0EGJmZJDYLugS6ISD/zTuthdIj1N6bwzV32x15NVQxDIAhOwiOx1HB+FAi5G5oWhYsMlhpvlN1nUuKtAIh/hzypD7DeKZCgOTtKaI4LXjPYQPN0OcPec7xNn2T4Lt9Je0a5hVagJqW+4RHGTI+tiilIbDuHP5VpW2i6pyLArKhEyras9I79712Y5ai1gbEsy5mZjQaym/ZO/wudD4hc+BWXvrY2txiKOPOLbdicrTuAi/lMCoKP8CALNRQ9y183Fk/Asnfi/CyDQp72tabSZsV+ff8XCte2o9xZW9swF0O65/FNConuzP5MZwdBrZhOMbsrv2qGOMl0i6fGG4YQCSr9jCTyOdrCDfZY4unClUkig5N5GtvPUdkJpHHVHZtyguaYUQEC1+IbNAy2kNOoy1FT+LORYyliX+awu8vn9hrgfO5K36tEtg+iI1wFiXxgYyyjIEqrQywM2bq0BAc1FuKPTKKuOADG/TSEfBsFYnAQOPzEDfLMaXPWSEypFBZtLgWW4ojewWsmZ/i1F6TGWZIQ3Gric0NLMPNMaNnKgxISj3VFyBMLd3259JCi7laErNmIVtl8ST9IFl/Qe5MJX6tYbbdnOGut2V02rMcweFIaLsGFD2M5VXwpBPjGiMjfVTj+wme+ucmfM9RoZUo65zfuEZfuuFKze4y+YQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(396003)(346002)(366004)(136003)(376002)(451199015)(186003)(5660300002)(8676002)(38100700002)(4326008)(2906002)(53546011)(44832011)(6486002)(6506007)(966005)(26005)(83380400001)(6512007)(478600001)(8936002)(66476007)(66556008)(66946007)(316002)(54906003)(41300700001)(110136005)(16799955002)(31686004)(36756003)(86362001)(2616005)(66899015)(31696002)(781001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UYNMdPkVq5aZYPVep17cPHUu4Zogntd2NU2rxRqJHuJsHNMr9dQpmpxTasQg?=
 =?us-ascii?Q?gipmWoku/Iqn4jyCMTrPp5OmP8itfsJ7QjM02xB7G5esBA0Om/6DFYaceG+x?=
 =?us-ascii?Q?IsggNn4+25wM/g1gWQuwnDCUbKAN5bBw0aC4DoJeYklNdphKLu2xa3MvBwHH?=
 =?us-ascii?Q?j40ydzFcn+dRpOTAJ1TLAfl5oQjr2kPxcgFZxEcWPz2B/kHBjhVH2dHHdX1D?=
 =?us-ascii?Q?6JofQVTT4PNgd44ZNg0eA3emwx1IRT1QxcCgN99+wcd5B+lHFGhRZxo5HbFn?=
 =?us-ascii?Q?ySdgOpXLtzd8KqVV4mZLphuDbtFXevmejJOHE2BHBAcIp7Sqcj7Dq6ZgqJZp?=
 =?us-ascii?Q?o9Q0rbckG9OJEk1bIm6BTvVZtWmrcvRbiiTLAJWEG27sm6cAs4xPQpXaU19U?=
 =?us-ascii?Q?thcfxlq3vpeXDg3j86dTXAur9N0XmmnUwLKIkxwrAMzJaoSPXjseZG2PxOzp?=
 =?us-ascii?Q?+dNO3EYfTPlhCZSQp9+IGu8N5wbcZO5Db3vQsWnUq+Atve4yd7krkEaDw1vi?=
 =?us-ascii?Q?a6/La77jUnEn6AOb2i4PAVx1w3D13wRKD3s5TKaR28fq69hz82nAmP29RgCr?=
 =?us-ascii?Q?gjTnLVLzGtMsuIsbEM52/eT0axeuLEl0vXoxvMGFs+SiNMl6LcPy1bGqpwe1?=
 =?us-ascii?Q?O1WJacyf8ChA6XdUMeGS/R++gYvACyKfvFqNfensLFeZ4I8MGtE40BRapvaP?=
 =?us-ascii?Q?QgeWooMxURM5ShPBtJiov8qekEKtbXpcTnrRCb5fTHp/ju2duufg1ZB6jUIH?=
 =?us-ascii?Q?s2ZBUCvXsOklI8TZ/MkhVLZKFXkozdZe157Hqh9xgZ/2eB/rEUzO/+jQ4fF/?=
 =?us-ascii?Q?zPrZL66bZ50+1eWThpMvZ8uWfDFjbsTrnLn8owZlb0DdsSK+UDHFTQ3mZXcs?=
 =?us-ascii?Q?yUFnIfMO42wCd1dz9bN37QKypoZI3CoDOscuZebQmCpaIz5GXJHtbZZ/vJv1?=
 =?us-ascii?Q?vMHWXWrSTa3ZBRvu2wgF9PxDSVdTw/1rnECnbOTsJFhEKZ+eYF5/R1l2g7Jd?=
 =?us-ascii?Q?ubxhfxZmaCRwGRhq/cbGGp1Mxz6oBv+sLpNwzqtLtq0bwXEaLRt3zIanJExr?=
 =?us-ascii?Q?VC4KGo3i317QjBIOSPhBesvj4OCxsq+hbSWO/AlfyIiNWEPRC/pzhGaDJmgj?=
 =?us-ascii?Q?oS1XOuNQXsuJSKYdh56ywThB1RN9G1rH28usutw3jKuTbtZRpj8ifcLWUxo6?=
 =?us-ascii?Q?MTzUYC+8WefZAYRoMg5KmJ50fFwdOJDVoBU3T1dsj9T9tNKpBu6FtGi3LbF0?=
 =?us-ascii?Q?n47PhzKx2D/hihi7SgjIOpvt6zzomGMk40rcTRP4dadEUdXDC52nhOJZnDB9?=
 =?us-ascii?Q?sssmhtqOsW3r8IYvP10zKUDqav21KOBGENo89FdKCikKk5YvHo9Q+kAooCBb?=
 =?us-ascii?Q?pxElSjfBMLfv39cZ+WrNsG8grS2fbgfRxvrW8Len2oEieED9FNuuXUAWbp/Q?=
 =?us-ascii?Q?p01uSqNKF0Vc00pu/pjV8ANfLgTqHez6fcyYZylFXcakIUE0UXNotDFNR6Yw?=
 =?us-ascii?Q?qqqYYlU2OyNpWkTkcqwHVZzbZT8b5Ctqg1PxdZwbbW7HH05bfH4Bh4yM4khl?=
 =?us-ascii?Q?oFkEKFXMTqyfQD3ZtuKfjFNVZdkFTMqW8H2GRlhyIyGbcSEpl3HLZgyO6rRl?=
 =?us-ascii?Q?Dd9n5XIsoQZn4Go1GquwzHo=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83102920-72d6-4c18-3a53-08daac3f134f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 10:46:53.4628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htKOXjZXwchZTGhd6Zp/RfL88ZwDc5/9Qocty1wCrXRsc4hz9m/46E6YDavwYn6o97NM+M1sfYn1YdV82H8Dk0JMPyqixaotAdIJECiEdtoFDfIlznYLVF/W6MuxF49C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8373
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 10:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171664

Hi Carlo,

I'm a mere contributor, opinions are my own. I do not represent the=20
project's official view on this. Also, I am not a lawyer.

On 10/12/22 11:51, Carlo "Kappa" Piana wrote:
> [sent from the wrong account, resent, sorry for the noise]
>=20
> ----- Messaggio originale -----
>> Da: "Mikko Rapeli" <mikko.rapeli@linaro.org>
>> A: "Marta Rybczynska" <rybczynska@gmail.com>
>> Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>, "Alberto Pianon" <albe=
rto@pianon.eu>, "OE-core"
>> <openembedded-core@lists.openembedded.org>, "marta rybczynska" <marta.ry=
bczynska@linaro.org>, "Richard Purdie"
>> <richard.purdie@linuxfoundation.org>, "Carlo Piana" <carlo@piana.eu>
>> Inviato: Mercoled=C3=AC, 12 ottobre 2022 10:04:07
>> Oggetto: Re: [OE-core] severe issue in CVE checker
>=20
>> Hi,
>>
>> Can the downloads be turned into normal do_fetch() SRC_URI downloads inc=
luding
>> caches in yocto infrastructure?
>>
>> There are many issues around CVE checking that it's really
>> a process where a lot of details and uncertainties just need to be
>> accepted. It's far from a perfect and users just need to accept this.
>>
>>
>=20
> [...]
>=20
> I beg to (strongly, if I may) differ.
>=20
> CVE is broken? This is no excuse of course to ignore a known insecurity.
>=20

Thank you for reporting this. You already got an answer from the people=20
who worked on it. This is now known and hopefully we can fix it soon, it=20
depends on the contributors though (which you can become by sending a=20
patch :) ).

> Is it better to include a process that, when fails, the fail goes unnotic=
ed, than nothing? No, "nothing" is better than flawed here, speaking of sec=
urity, since a false sense of security is worse than insecurity itself.
>=20
> If we put a CVE checker that just throws in a contradictory message (a wa=
rning and eventually a "success" one) and then silently moves on without an=
y fuss, we leave users in a state of false belief that they have completed =
at least the CVE checks -- however insufficient this may be -- but in reali=
ty it's a test that never fails because the database is empty or outdated. =
I agree that for developers CVE checking, compliance, software component in=
ventory are a PITA, but it's way more a PITA when an attacker exploits an u=
npatched known insecurity kept out in the wild, or when a copyright troll c=
omes after you demanding (many!) millions in damages (I can't disclose who =
has received it, but I have seen it in real life), because you failed to no=
tice that a GPL component went into a mass-distribution device.
>=20
> Once the function is advertised, the expected behaviour for a thing of th=
at importance must be to visibly flag the issue and **stand in the way** un=
til you acknowledge it, so that the warning cannot be missed. It is up to t=
he duly informed user to say "Ok, it's nothing, I know it" and shrug the pr=
oblem off. Not a decision taken for the user by others and hidden under the=
 carpet. We have several clients relying on that CVE checking and just by c=
oincidence we noticed that something did not add up. God only knows how man=
y times did this happen before.
>=20

You should not rely on this tool (or for that matter ANY tool from ANY=20
project) without human review from specialists (be they lawyers and/or=20
security researchers) on its output. If you need guarantees, get a=20
company to do it for you or hire teams of people. It will be expensive, yes=
.

> One can think it's not their problem, this is open source after all. But =
being open source is not total relief from liability. If you create a hole =
in the road and cover it with foliage, the fact that you are not paid to pa=
ve the road and you are doing it as a service for the community does not sh=
ield you if a car takes a nose-dive into it.
>=20

It actually does. It is the very essence of the open-source licenses=20
we're using. Mainly, MIT, c.f.=20
https://docs.yoctoproject.org/overview-manual/development-environment.html#=
licensing
By using our project, you're basically signing a waver form saying=20
"whatever happens I asked for it and cannot hold the project liable".=20
This applies to all (most?) pieces of SW that this project builds too.

https://opensource.org/licenses/mit-license.php states:
"THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=20
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF=20
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.=20
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY=20
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,=20
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE=20
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."

It is YOUR duty to check whatever you're using is compliant=20
license-wise. It is absolutely possible a recipe we have advertises=20
being GPL-2.0-only and being actually GPL-3.0-or-later, we are human, we=20
make mistakes. Moreover, we are NOT lawyers, so we can misunderstand to=20
which files some licenses apply in a project for example.

Also, it's not because a piece of SW says it is licensed under a=20
specific license that it legally is (hello license poisoning for=20
example). We cannot as a project afford to look into all the pieces of=20
software we allow you to build to check if they are legally compliant=20
with whatever they say they are licensed under. This is a job for your=20
legal department. Also, since we allow third party layers to be used=20
with our core layers, it's not something we technically can do.

Now, about CVE checks, the same applies. We provide tools to make it=20
easier for you to check that some CVEs are fixed or not. It is legally=20
non-binding (see paragraphs above) and your legal and security=20
departments are the only ones able to "guarantee" CVEs are fixed or not.
The tools we provide are automated tools and as every software in the=20
world not perfect or free of bugs. We rely on people to report those=20
bugs (like you did, thank you for that) and/or fix them to improve those=20
tools. If you need to certify your project does not contain CVEs or CVEs=20
it is vulnerable to aren't usable, get a security research team to look=20
at your images.

I can understand that you are disappointed to see our project is not=20
bug-free but there's a big misunderstanding in what the project is=20
providing you with and what you can expect from it.

Yes, legal and security teams are expensive. But they provide=20
"guarantees" that we'll never provide (see open-source licenses).

Cheers,
Quentin

