Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4670EC3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 15:30:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.717.1692977441177636538
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 08:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qncDakA7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7601b05b87=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37PADH14030723
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 08:30:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=RzNBeofTJZwIbkYPPf
	8FMr6qpcApq8qJH71WcRRprsU=; b=qncDakA7RXVWSAeuXozfJepNFdmZO2nUIH
	LtMkUhO4mDcfBMT0nnLwX1hKxvQ598nU79rfrLskoPT/aabtkNCksWuJfMnKK6tn
	DOlZic6Xjb3pVzavV35VQiPBrs/ci0UTIzMimiBVN8CYFVkVq8CDbCMl1bRo5GfR
	3IdmrUb+GQ5ZIjbMWmp3f7HdGemIKH4wcCXKSNYk3anp3QYRWpCE3xPl4bd9M3cr
	LpL2iX1SgKh4dWRUsQIqFjiS/4lzJxuBo7eblqI5gQr7EtS1zuHq8bq7eG/TJTH/
	TAMlgGH9FMVRc+bAHaQDp2fePDrUCpxeoDaaa3e4Zp3ngxH3ooag==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20dkanw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 08:30:40 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37PFUeL1007518
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 08:30:40 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20dkanu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 08:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2nIEnMLGA8PlD7bnCmn+sj9AEoICRiSJB4/nnoLw8WtRQuVn7h7n/Kkzac3pobCR95rf5rei99jXuDEos8ZoFR/JkkKU4ojrY8yp55B0JC1kwzAaepvdDGzwEHlFTqUinE5JuzCposHdU15opiefYrXik1Gn3NxvYuyg0u9NqKcgl5MrVPWoZQwESkEni6G/+pQOAjVVMzI/6hZfBWguzKZay1zSqnD+rjvOJyVhi4i15v4upGIpVeHzHpfjjEIzBhOhM6aBKxxVUV59qoM+dTsX6of3i0W0s9lcY826vu3HcQBac2SSec/yTRGH5heKK23IinVJxYAUvT2O5L8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzNBeofTJZwIbkYPPf8FMr6qpcApq8qJH71WcRRprsU=;
 b=DeM/qw3dvd36/JiAPAihcR5DsyE9XkQjyESSPnLOjR4SG7RFadQi2Aafl8wsXrp0dIgehEsmlvbgeAQNG7bunEANStlDb0jG9wdPJf6CyP12W8eGKuUj5kbCcHK/uLiKZZT0RbQ/rUwQUOvADKTvq+FKIuQ8j1kJ/NE1rUF28UkhkDC1TffoRbifujb/T9TMog/lcgsyRU/s2jJlxUFevxYDU5XipD2gDzv8K6IAHgsRzY+bQsT3GKV9H/YQIF0GARvv0XmAnAlXvx+eOthgGKJ3QqX743CXVrCiOuvOwXIXa/vAQ50OWRATVkj67Qy5HWg07zmaAZzOwLoOsVpt4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA1PR11MB7270.namprd11.prod.outlook.com (2603:10b6:208:42a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 15:30:34 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::2e57:2022:73b2:f8fd]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::2e57:2022:73b2:f8fd%4]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 15:30:32 +0000
From: "Shinde, Yash" <Yash.Shinde@windriver.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>,
        "Kallapa, Umesh"
	<Umesh.Kallapa@windriver.com>,
        "Gowda, Naveen" <Naveen.Gowda@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "Moodalappa,
 Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>
Subject: RE: [OE-core] [PATCH v3] rust: Upgrade 1.70.0 -> 1.71.0
Thread-Topic: [OE-core] [PATCH v3] rust: Upgrade 1.70.0 -> 1.71.0
Thread-Index: AQHZ1pePp9dOhMZOHEmXeQMU0j4vkq/7AIyAgAAfsyA=
Date: Fri, 25 Aug 2023 15:30:32 +0000
Message-ID: 
 <SJ1PR11MB6129DF74BFD2DF3574E4144FEBE3A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20230824143018.3098875-1-Yash.Shinde@windriver.com>
 <20230825152007.50079565@booty>
In-Reply-To: <20230825152007.50079565@booty>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA1PR11MB7270:EE_
x-ms-office365-filtering-correlation-id: 2404fbae-b113-4cb7-5f3a-08dba580386a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RKWXPLgUhC1t1nnuxfCCqZb+sOjORHEpKD6BXyHsTcibdgRBujQc+CikjXTmnHqhfzxgnOY9KO4cZUPoTL+kK/LCLAxDNyNCAU4ykl6T4xZxf4b8+3vurv3Wz5aGe0Jjc8kQhOvQXwuUeIZOm7IQnLQCQ4Mk7b7z+r6xGhEIZ4FTQPY86D6ztNXmvmdG0YUR4sBA0oRO8770ibGX8WSwtHmq3sK33fqTtvN7gmOjshduDsSv66UG+LN+u1c3dL2hDWu2W1P1uvNhd6oRXBlx23Uwm6QsWAJQllUnMFU5NBloyl76Cyn+1kKD4Q+Nj997AWATFu9gJyhtK1r9pAxE1tTV4N8frb6ppQAgib8TGD0ojFTzd1n4eQY86cqWBbg1aLh02qPSlV+6KqqZ7U0ipd2Fe60argAUsx57YGuAbRI8sqOUO6lp/mvly7BLI66Jb7RThQ0Cj2UVera3p+WyPZxkx8JbJbIA23gDLa4V7CWgd9CbzE7F3wm+i7bC9ya6bfM/7YRDHLtWnXYOu3wQ4MCU0LEbH4esFyyxYlG92DrBuTfl/0ZCE9QNQthnjU7RudkQiha2dINc1qQOxHp6U2BTOG+sId28DWEykJdvjno=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39850400004)(366004)(346002)(451199024)(1800799009)(186009)(166002)(122000001)(86362001)(33656002)(38100700002)(38070700005)(6506007)(71200400001)(7696005)(8936002)(54906003)(966005)(478600001)(5660300002)(4326008)(52536014)(316002)(76116006)(6916009)(9326002)(8676002)(64756008)(55016003)(53546011)(9686003)(83380400001)(66946007)(66446008)(41300700001)(2906002)(66476007)(66556008)(107886003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ptM62e6avHunspOnnou6oDhGcopYsyK+ZLoenkELgPbURZUC8jlsRuIAjxCl?=
 =?us-ascii?Q?VPjwud6HJD/441L9pmDGFX/dRnL4YfqrN+g6QNS1mgHP7z8MsKB1RfuXGaUg?=
 =?us-ascii?Q?eLrioJgVIa1zuX6p2p8Sy3+V9pdW4ULvihvEgkOXMpErS9eQdnPgX5tcXoV6?=
 =?us-ascii?Q?+2vVvGOAE7u9BCkscoXcMpfUm+ij8HY9LOg5krJUwod6d/De46InPZMyVAKA?=
 =?us-ascii?Q?c8IAKqhfIvWv9YWbHxnPdF7y9FS9/O7ZCzsbZiELbMDFpxs5MtGlE7saZAb5?=
 =?us-ascii?Q?TDCKzJq96jZkbEj40gkxS39hhFl3hsfCyv/hj8sI8o4t/MSFt31cuZTvna//?=
 =?us-ascii?Q?TBx4YP6KjSivXdvT3C1GL42psF0id/KkRQVgpI+gWpO8fYPJ9GNbdYAfJi9G?=
 =?us-ascii?Q?9xqxRfk1bwLxNjU8LwbnArftlZuXSMwmhXiFgWi0U8Cp7RnDH3eb3SBVApzW?=
 =?us-ascii?Q?dz1LeHJUxhb+9qek/XMcc1HaR2CGy7s7+qK2t91Ll8dhOg3tFKxOjUjr/oV6?=
 =?us-ascii?Q?ba1fftAFtF8MWkab5OM9HlxqejdxG78ASs/kpSj5kvIK2YAvXNfhrJ/ZB/XW?=
 =?us-ascii?Q?p4YK2Gc+0dTNQk52Y0Xnuc9pqZDdOGo8iIU4qDnQOPPJOagBjI8xX1uPagLZ?=
 =?us-ascii?Q?6+TmKSuzaVcOCtaATSMfLAk81HdjvuAN02wLn1zzLfZuh8HiWL4nP4Yx/9pi?=
 =?us-ascii?Q?lG/2/y6Is8NY9KMlKJoIpELo96aqWRAeEldH681RAHybrlHAmSdrUBYA4DXJ?=
 =?us-ascii?Q?FoER7TnG2oe3JOUwGjnIJJtlqC9NEIiOGOF8RX3x2xTHq3B3sFejZXa30Bnd?=
 =?us-ascii?Q?f/hoGwmdvOIBRH7wVJ1vEf4eZRqDD+RTf7EBgHYXRBWIsW5KhbPnTrmdLNvq?=
 =?us-ascii?Q?qLTVykv1lKUH+M6GKZmUjYOGQmmveOZSIMAWJFrpmnS+RGVHhQcFsKroz6II?=
 =?us-ascii?Q?NqjIAl9USGaXiDZleGwWqoyQagbwMQxlHeW7gwx/Qy3ZyixXXfEew51Vucmp?=
 =?us-ascii?Q?kg+77VZeon92uHksf7CFSfObLuKvZ72NXrpxh/qDeqAqVO3a9BIOn0YnOlQf?=
 =?us-ascii?Q?mvn3zoxUiLJgoJYkSBrgEd7UcdOuAJOKwDqPuowyzbMaoYtkPso4VQxlOVyq?=
 =?us-ascii?Q?/sABVMi37o7g5lI2wAybwBIbAWf4jC6DuaBUqPRRdTWvkA5U0byT1+HnzJgh?=
 =?us-ascii?Q?KMpoMjh4cO6Sh7SGzE3PF+PnS1tx8OAgzzNM8jV02ep1muw0Mz0/vJ6H8L+U?=
 =?us-ascii?Q?iI82z38apd9TH5mJQadv7zJF375FR/cxfoX5xuOyYO7UBD90UxGsyMKo+GxW?=
 =?us-ascii?Q?KMuQY/uGQWBlWWq7pVzggSvSPyM4DuYpiX0f6I6hPMOyaveAoH1x3VVWm6SS?=
 =?us-ascii?Q?GTLHHNB6C/TZDaOjZCgY67bvJbiNJ6qxOj7Sq3e9WiKNR7JGSXn43R5Wrv0j?=
 =?us-ascii?Q?In849onBE89wfF4ptlCpyilgY1K6XV5jRQgmuDDJuo+DZ/Ae94nzktR2D47l?=
 =?us-ascii?Q?xkshvu9278Cwb4tUaymE3LkEaphPqcBG7bsN0MFzc+2pXJPoWiEALYnyOCc0?=
 =?us-ascii?Q?d1fkLmGOHH0wrl+xnKxOqPzfo7YIXgIy2s5tXOmh1gOh+1AP9+YCw6rypjSc?=
 =?us-ascii?Q?JOY14DGUVnCUzhdgJ073k0pI6y3VZopY1/GFP4BZGyrR9eQ7uRSvvRis8PDX?=
 =?us-ascii?Q?yObuJH+58wTyYnIRL7y0COOwrPs=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ1PR11MB6129DF74BFD2DF3574E4144FEBE3ASJ1PR11MB6129namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2404fbae-b113-4cb7-5f3a-08dba580386a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2023 15:30:32.3782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Rb5TlJ70cKcATWjL0ggo6X69yNhuDfdams7GrmU9gowhNk+o8wf/y08z4YYM8AdUEK3h1636xL3YEK/+i3c1h69ffX/QnOqM8EydidN2NM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7270
X-Proofpoint-ORIG-GUID: WAoWxpood5DZ3Uo5oqU2aEEB1VtvUx0K
X-Proofpoint-GUID: zLh7XEX2KTn9XcZaQtJ4LadOj-G_JALH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_13,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 spamscore=0 impostorscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2308250138
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 15:30:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186711

--_000_SJ1PR11MB6129DF74BFD2DF3574E4144FEBE3ASJ1PR11MB6129namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

The current version of Rust Oe-selftest is based on Rust 1.70 and works wel=
l there. It is yet to be updated for Rust 1.71 (eventually 1.72 which is la=
test). With every new Rust version there are newly test cases added from wh=
ich some might fail leading to failure of Rust Oe-selftest.

The patch sent here is only for Rust version update and not for Rust Oe-sel=
ftest. The Rust Oe-selftest would be updated to recent versions after the R=
ust update is done.

The Rust Oe-selftest fails since it is still on Rust 1.70 and the Rust vers=
ion is updated to 1.71 here. Parallelly will start to rebase Rust Oe-selfte=
st on the latest versions.

Regards,
Yash

From: Luca Ceresoli<mailto:luca.ceresoli@bootlin.com>
Sent: 25 August 2023 18:50
To: Shinde, Yash via lists.openembedded.org<mailto:Yash.Shinde=3Dwindriver.=
com@lists.openembedded.org>
Cc: Shinde, Yash<mailto:Yash.Shinde@windriver.com>; openembedded-core@lists=
.openembedded.org<mailto:openembedded-core@lists.openembedded.org>; MacLeod=
, Randy<mailto:Randy.MacLeod@windriver.com>; Kallapa, Umesh<mailto:Umesh.Ka=
llapa@windriver.com>; Gowda, Naveen<mailto:Naveen.Gowda@windriver.com>; Kok=
konda, Sundeep<mailto:Sundeep.Kokkonda@windriver.com>; Moodalappa, Shivapra=
sad<mailto:Shivaprasad.Moodalappa@windriver.com>
Subject: Re: [OE-core] [PATCH v3] rust: Upgrade 1.70.0 -> 1.71.0

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hello Yash,

On Thu, 24 Aug 2023 07:30:18 -0700
"Shinde, Yash via lists.openembedded.org"
<Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:

> Switch libstd-rs to use the dummy `sysroot` crate which represents the
> standard library crates. Target getrandom-open64.patch at 0.2.8 (merged
> for 0.2.9).
>
> Drop bootstrap_fail.patch as it is merged in upstream rust.
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>

The rust.RustSelfTestSystemEmulated.test_rust test is failing on the
ABs with this patch applied:

https://autobuilder.yoctoproject.org/typhoon/#/builders/146/builds/408/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/154/builds/407/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/147/builds/407/step=
s/12/logs/stdio

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_SJ1PR11MB6129DF74BFD2DF3574E4144FEBE3ASJ1PR11MB6129namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Mangal;
	panose-1:2 4 5 3 5 2 3 3 2 2;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Luca,<br>
<br>
The current version of Rust Oe-selftest is based on Rust 1.70 and works wel=
l there. It is yet to be updated for Rust 1.71 (eventually 1.72 which is la=
test). With every new Rust version there are newly test cases added from wh=
ich some might fail leading to failure
 of Rust Oe-selftest.<br>
<br>
The patch sent here is only for Rust version update and not for Rust Oe-sel=
ftest. The Rust Oe-selftest would be updated to recent versions after the R=
ust update is done.
<br>
<br>
The Rust Oe-selftest fails since it is still on Rust 1.70 and the Rust vers=
ion is updated to 1.71 here. Parallelly will start to rebase Rust Oe-selfte=
st on the latest versions.</span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<br>
Yash<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:luca.ceresoli@bootlin.com">Luca Ceresoli</a><br>
<b>Sent: </b>25 August 2023 18:50<br>
<b>To: </b><a href=3D"mailto:Yash.Shinde=3Dwindriver.com@lists.openembedded=
.org">Shinde, Yash via lists.openembedded.org</a><br>
<b>Cc: </b><a href=3D"mailto:Yash.Shinde@windriver.com">Shinde, Yash</a>; <=
a href=3D"mailto:openembedded-core@lists.openembedded.org">
openembedded-core@lists.openembedded.org</a>; <a href=3D"mailto:Randy.MacLe=
od@windriver.com">
MacLeod, Randy</a>; <a href=3D"mailto:Umesh.Kallapa@windriver.com">Kallapa,=
 Umesh</a>;
<a href=3D"mailto:Naveen.Gowda@windriver.com">Gowda, Naveen</a>; <a href=3D=
"mailto:Sundeep.Kokkonda@windriver.com">
Kokkonda, Sundeep</a>; <a href=3D"mailto:Shivaprasad.Moodalappa@windriver.c=
om">Moodalappa, Shivaprasad</a><br>
<b>Subject: </b>Re: [OE-core] [PATCH v3] rust: Upgrade 1.70.0 -&gt; 1.71.0<=
/p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">CAUTION: This email comes from a non Wind River emai=
l account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Hello Yash,<br>
<br>
On Thu, 24 Aug 2023 07:30:18 -0700<br>
&quot;Shinde, Yash via lists.openembedded.org&quot;<br>
&lt;Yash.Shinde=3Dwindriver.com@lists.openembedded.org&gt; wrote:<br>
<br>
&gt; Switch libstd-rs to use the dummy `sysroot` crate which represents the=
<br>
&gt; standard library crates. Target getrandom-open64.patch at 0.2.8 (merge=
d<br>
&gt; for 0.2.9).<br>
&gt;<br>
&gt; Drop bootstrap_fail.patch as it is merged in upstream rust.<br>
&gt;<br>
&gt; Signed-off-by: Yash Shinde &lt;Yash.Shinde@windriver.com&gt;<br>
<br>
The rust.RustSelfTestSystemEmulated.test_rust test is failing on the<br>
ABs with this patch applied:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/146/buil=
ds/408/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/146/builds/408/steps/12/logs/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/154/buil=
ds/407/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/154/builds/407/steps/12/logs/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/147/buil=
ds/407/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/147/builds/407/steps/12/logs/stdio</a><br>
<br>
Luca<br>
<br>
--<br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ1PR11MB6129DF74BFD2DF3574E4144FEBE3ASJ1PR11MB6129namp_--

