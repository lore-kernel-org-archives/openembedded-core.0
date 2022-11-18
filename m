Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5BAC43219
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 17:15:44 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.64])
 by mx.groups.io with SMTP id smtpd.web10.634.1668791736893625428
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 09:15:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=H+7odhPE;
 spf=pass (domain: arm.com, ip: 40.107.22.64, mailfrom: anton.antonov@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxfEJ6dP7rp/XtGFi+l+4/eZhkikomCOEYZgIYtDzLk=;
 b=H+7odhPEhIltQISxOQ6Ac6en6TqYjSnBcPWWQzXnyrfUqCXaxUa6F2FqSfI/3I6pMnJPDQ2VjdAZUTjpFo4/Sj1QLH2QBlOh6FDA8OLzqkQ0wB5OX/1CLg95oAL5VdXHZHblRRljHjNCjJ3MYwvCpUnnEnCjbyanGARMJihEQos=
Received: from AM6P192CA0010.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::23)
 by GV2PR08MB9878.eurprd08.prod.outlook.com (2603:10a6:150:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.8; Fri, 18 Nov
 2022 17:15:33 +0000
Received: from VI1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::c) by AM6P192CA0010.outlook.office365.com
 (2603:10a6:209:83::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 17:15:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT006.mail.protection.outlook.com (100.127.144.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 17:15:30 +0000
Received: ("Tessian outbound 6c699027a257:v130"); Fri, 18 Nov 2022 17:15:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 14dda4c8a33f6399
X-CR-MTA-TID: 64aa7808
Received: from a8944caed98a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0DB1DA4A-D4B4-4936-8344-DBB22EA9B636.1;
	Fri, 18 Nov 2022 17:15:23 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8944caed98a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 18 Nov 2022 17:15:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bhnrws2wZ772/Q6iC+SHgFpcsZRH25G1F377WIsZCJn7/1JTGLjTxFoimvH9+q3plbjli3XWLmLsPGtMcwk+8ziuF3O0dDfG+kxKhhFYNJ2NplrjSjdcDOFseoyzXWAfPMTuiR6NsL2b91eNEgZRIHxnCtl2SDTV4lcgF+e/Uyd7xbL2D+rMgjkx4Lct1NPA+6gROjqEtKEDg9C0CMgDTd6Iy15h+/Yj8Q7QGj4CrMc9dSqFaW4vAGTo1gkvG1ykZvinNBlyy9h0Gz5M50dhHso2K+pDfvzDM7IJlogFHU1uN7moRa8rc14I41TpMJWxBgnZ8amt7F5ap8tpLJDwGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxfEJ6dP7rp/XtGFi+l+4/eZhkikomCOEYZgIYtDzLk=;
 b=lgNaDuhiy9X8MG1VoN+kfdKuNpfndUWmRJ3Q9LW7psroRXOpM0PXLmowMHAjNBIAVzH3PVUrSMwwjnv1IWGtX0d6v/ITFKCi6vdiw9iq8qZtDAZw5TbxxYbU7q4BGwbUQBjv9rACq0y/mkD6kMD0ASvYD/bRtK8N4Xwj1i7bjmCAGsUPi0CmFWROuD93JYSXB76jx24CxuanIEvxfob7uEIiDgkQ1ylMF6vMTMkkvWbIv1vMwIqDdPgczZzu+tYbNnTvXkkxSdEhdrxlhD2JAW7L+bQLbZbN+x+ee/NmR9pXvbwtaVA90n4fldx+NRtSXSZDr3Z5R7Mzgc38NB2MSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxfEJ6dP7rp/XtGFi+l+4/eZhkikomCOEYZgIYtDzLk=;
 b=H+7odhPEhIltQISxOQ6Ac6en6TqYjSnBcPWWQzXnyrfUqCXaxUa6F2FqSfI/3I6pMnJPDQ2VjdAZUTjpFo4/Sj1QLH2QBlOh6FDA8OLzqkQ0wB5OX/1CLg95oAL5VdXHZHblRRljHjNCjJ3MYwvCpUnnEnCjbyanGARMJihEQos=
Received: from AM7PR08MB5320.eurprd08.prod.outlook.com (2603:10a6:20b:103::24)
 by AS8PR08MB6103.eurprd08.prod.outlook.com (2603:10a6:20b:296::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 17:15:14 +0000
Received: from AM7PR08MB5320.eurprd08.prod.outlook.com
 ([fe80::ba79:f42e:a934:d12b]) by AM7PR08MB5320.eurprd08.prod.outlook.com
 ([fe80::ba79:f42e:a934:d12b%4]) with mapi id 15.20.5834.009; Fri, 18 Nov 2022
 17:15:14 +0000
From: Anton Antonov <Anton.Antonov@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [langdale][master][PATCH] rust: Do not use default
 compiler flags defined in CC crate
Thread-Topic: [OE-core] [langdale][master][PATCH] rust: Do not use default
 compiler flags defined in CC crate
Thread-Index: AQHY+1/drvhiEUgbakGXLpqCRSQQZK5E1dnIgAAK/ICAAAdANg==
Date: Fri, 18 Nov 2022 17:15:14 +0000
Message-ID: 
 <AM7PR08MB5320B3702B17EC3FA2BBFBACFC099@AM7PR08MB5320.eurprd08.prod.outlook.com>
References: <20221118144253.1156045-1-Anton.Antonov@arm.com>
	 <7dc90b995d7a9688188b8756871181e46b2e296a.camel@linuxfoundation.org>
	 <AM7PR08MB53201A46A1080F4AAFA7E318FC099@AM7PR08MB5320.eurprd08.prod.outlook.com>
 <8b2ecf15502e08644ffbc1c7cbea6d3862da68a1.camel@linuxfoundation.org>
In-Reply-To: 
 <8b2ecf15502e08644ffbc1c7cbea6d3862da68a1.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM7PR08MB5320:EE_|AS8PR08MB6103:EE_|VI1EUR03FT006:EE_|GV2PR08MB9878:EE_
X-MS-Office365-Filtering-Correlation-Id: a69fc52e-b326-428d-0729-08dac9887ebc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Hhfg/7CgIzxDRgz8917FTh66qyNJU+aT/0tHXLVOKrvIN3jveKzI4HNhprt+QxA8WhUoa8H10+wpyw7GbY5mE0hQaTbZrksPFTQ4PUTwbJP80Rt3lr20Ax9TEUpXLavspkmnuFfyBGpwA2RL5FWUUPCxPpG5gxq1s4orJi2D7wicEzXhxRql2xwf8p9ZsPk56RbT9BNcm44Y8nEJxMSiNK1WxXlwMuE5dvk4csPg/KjODEbbNZN0g0FYkAeKIIHBT+2Mvz3Ig9caJpHM+gklKfeWm/foeyKxxgLQs4JwIXMryY2Um22IAmzCE2qkwZO7LhP19OhV/L1rC7BTH2ynjyiENDF7XwIOSUA4onP9HD8wwZJrLz/KiIYtPOJEi93RunJU6qri4PtQfLi0GC287JZ7Qg0REIBVsjnmF7LZOsKmLa2hmz2lWXCIRL6VwHkFt6sgcCkp52LXEt7vbeWsFdyOfHAwB72lkmh0X1jlfiT1Nn12TcW/rnZ8RGAuMqAWpi3P8Xvs2lZ5ehFofaMYN3yEcT0MhvQj01k848bb5I2D6RJBb37R51bKja+D7Fy6Etj3PdXpM9vxnjXSEJnv6xgLhu1HovIFtlYv87r/y1dzEy5QddHgyjtdhxE0hL95ITsrvt/NM708ogXxDcvcyK+dKt6o9P0Nkd2Fh0EcWQH2S5VfQy7I6RKJO3sQ/tjhI6831QdJFhSvSjtLwdv0dv4TuAl3fiuPBQDj5Ce1N/8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR08MB5320.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199015)(33656002)(38100700002)(316002)(8936002)(2906002)(4001150100001)(966005)(38070700005)(9326002)(166002)(86362001)(122000001)(66556008)(52536014)(66946007)(66476007)(91956017)(478600001)(186003)(110136005)(66446008)(41300700001)(6506007)(8676002)(5660300002)(64756008)(26005)(71200400001)(9686003)(7696005)(55236004)(76116006)(53546011)(55016003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM7PR08MB5320B3702B17EC3FA2BBFBACFC099AM7PR08MB5320eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6103
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	76290583-3bd4-49ed-2208-08dac9887548
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q5zAIT7VjLrhZhbga8Y/xNWyPhsMAONUV0pY4Tw1SzhmWi9Od1sbp+5qC+qMC18r5aHjmtnvEFhZS42JaCU0diIS6wstoQLiA8+Nr6NPxTPeDc7TMyIfFCFBqRnya2pdA+1fmOSSQTNsy9HhIXpBnCqJDJw8PEGwIJHZk4N3XBa7BBybn1XtU1IaRJPqFL4TMH2JMywJIlykE5hZjDU03FyQa3gmV/wUp/78uFmyZC2gKI5qpOJQ6siy/+rk/0clgW/5CirLm3fVL8q6kD6VnQ3vBja/VF/IYHfDwoA34+J4fC90oI1c2r8Ba16QydU7qLJsT4trhETUaO44+ZEc3n++dbQdnOp7quMqGWAidmJCzHfHVfEKudZsoQpJ3MZtFpSBE2NbF3FcZvFRRM/Edzyut1hFPVPa+TTu3BWDyx74812KEpeeoMDXlqy0yebR94hpYWZlBicLeXWDm1YVD2/K74FLM3mBQaUJiD2ZWLH6iomj5kHNpBwoOlxxqMNqnjxetvDDRSzM7gAO9yAw9o9K6LFT3x/rhdlroa6FEEmn8qab1Op5s56znZRXmkkCjp1rgMUCkgNNJ8QJ3k+Q9BF8ZB01+YSPy5HYrsdaewQCPIczqrLB4nWdwnm+aeW6Mb4y2S5e8iDWcSvmdiMIivZMrzJCZ+ADOImnO2NIsZTYRRftAVmM721AgGEyqnbnAQMi3uJKr2GNv3NiKynhFH0+oiazANuMD6Wlr6fT4Q8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(40470700004)(46966006)(36840700001)(86362001)(8936002)(9326002)(36860700001)(110136005)(82740400003)(4001150100001)(966005)(166002)(356005)(2906002)(81166007)(82310400005)(40460700003)(8676002)(52536014)(40480700001)(55016003)(7696005)(6506007)(70206006)(26005)(41300700001)(53546011)(9686003)(186003)(70586007)(336012)(316002)(47076005)(478600001)(5660300002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 17:15:30.3927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a69fc52e-b326-428d-0729-08dac9887ebc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9878
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 17:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173479

--_000_AM7PR08MB5320B3702B17EC3FA2BBFBACFC099AM7PR08MB5320eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

  I=92ve already unsuccessfully tried all these combinations with both =93i=
f=94 and oe.utils.conditional.

$ MACHINE=3Dqemuarm bitbake rust-native -e |grep CRATE_CC_NO_DEFAULTS
# $CRATE_CC_NO_DEFAULTS [3 operations]
#     [export] "${@1 if d.getVar('CRATE_CC_NO_DEFAULTS') =3D=3D 'true' else=
 0}"
export CRATE_CC_NO_DEFAULTS=3D""
# $CRATE_CC_NO_DEFAULTS:class-native
CRATE_CC_NO_DEFAULTS:class-native=3D""

$ MACHINE=3Dqemuarm bitbake rust-native -e |grep CRATE_CC_NO_DEFAULTS
# $CRATE_CC_NO_DEFAULTS [3 operations]
#     [export] "${@'1' if d.getVar('CRATE_CC_NO_DEFAULTS') =3D=3D 'true' el=
se ''}"
export CRATE_CC_NO_DEFAULTS=3D""
# $CRATE_CC_NO_DEFAULTS:class-native
CRATE_CC_NO_DEFAULTS:class-native=3D""

Looking at this =930=94 should work
https://git.yoctoproject.org/poky/tree/meta/classes-recipe/go.bbclass#n30

But, even if I add
CRATE_CC_NO_DEFAULTS[export] =3D "0"
for testing, I still see:

$ MACHINE=3Dqemuarm bitbake rust-native -e |grep CRATE_CC_NO_DEFAULTS
# $CRATE_CC_NO_DEFAULTS [3 operations]
export CRATE_CC_NO_DEFAULTS=3D""
# $CRATE_CC_NO_DEFAULTS:class-native
CRATE_CC_NO_DEFAULTS:class-native=3D""

Cheers,
Anton

From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Friday, 18 November 2022 at 16:35
To: Anton Antonov <Anton.Antonov@arm.com>, openembedded-core@lists.openembe=
dded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [langdale][master][PATCH] rust: Do not use default c=
ompiler flags defined in CC crate
On Fri, 2022-11-18 at 16:21 +0000, Anton Antonov wrote:
>   I=92ve tested your approach. It doesn=92t work for whatever reason.
> CRATE_CC_NO_DEFAULTS is empty exported for native recipes:
>
> $ MACHINE=3Dqemuarm bitbake rust-native -e |grep CRATE_CC_NO_DEFAULTS
> # $CRATE_CC_NO_DEFAULTS [3 operations]
> #     [export] "${'1' if d.getVar('CRATE_CC_NO_DEFAULTS') =3D=3D 'true'
> else '0'}"
> export CRATE_CC_NO_DEFAULTS=3D""
> # $CRATE_CC_NO_DEFAULTS:class-native
> CRATE_CC_NO_DEFAULTS:class-native=3D""
>
>
>   I also tried:
> CRATE_CC_NO_DEFAULTS[export] =3D
> "${@oe.utils.conditional('CRATE_CC_NO_DEFAULTS', '', '0', '1', d)}"
> with the same result =96 empty export.

I think it might need to be 0 or "" instead of '0'. It would be nice if
we could make False work too but I worry that might not.

Cheers,

Richard

--_000_AM7PR08MB5320B3702B17EC3FA2BBFBACFC099AM7PR08MB5320eurp_
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
@font-face
	{font-family:"Times New Roman \(Body CS\)";
	panose-1:2 11 6 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Hi Richar=
d,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">&nbsp; I=
=92ve already unsuccessfully tried all these combinations with both =93if=
=94 and
</span>oe.utils.conditional.<br>
<br>
<span style=3D"mso-fareast-language:EN-US">$ MACHINE=3Dqemuarm bitbake rust=
-native -e |grep CRATE_CC_NO_DEFAULTS<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"># $CRATE_=
CC_NO_DEFAULTS [3 operations]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">#&nbsp;&n=
bsp;&nbsp;&nbsp; [export] &quot;${@1 if d.getVar('CRATE_CC_NO_DEFAULTS') =
=3D=3D 'true' else 0}&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">export CR=
ATE_CC_NO_DEFAULTS=3D&quot;&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"># $CRATE_=
CC_NO_DEFAULTS:class-native<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">CRATE_CC_=
NO_DEFAULTS:class-native=3D&quot;&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">$ MACHINE=
=3Dqemuarm bitbake rust-native -e |grep CRATE_CC_NO_DEFAULTS<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"># $CRATE_=
CC_NO_DEFAULTS [3 operations]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">#&nbsp;&n=
bsp;&nbsp;&nbsp; [export] &quot;${@'1' if d.getVar('CRATE_CC_NO_DEFAULTS') =
=3D=3D 'true' else ''}&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">export CR=
ATE_CC_NO_DEFAULTS=3D&quot;&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"># $CRATE_=
CC_NO_DEFAULTS:class-native<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">CRATE_CC_=
NO_DEFAULTS:class-native=3D&quot;&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal">Looking at this =930=94 should work<br>
<a href=3D"https://git.yoctoproject.org/poky/tree/meta/classes-recipe/go.bb=
class#n30">https://git.yoctoproject.org/poky/tree/meta/classes-recipe/go.bb=
class#n30</a><o:p></o:p></p>
<p class=3D"MsoNormal"><br>
<span style=3D"mso-fareast-language:EN-US">But, even if I add <br>
CRATE_CC_NO_DEFAULTS[export] =3D &quot;0&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">for testi=
ng, I still see:<br>
<br>
$ MACHINE=3Dqemuarm bitbake rust-native -e |grep CRATE_CC_NO_DEFAULTS<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"># $CRATE_=
CC_NO_DEFAULTS [3 operations]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">export CR=
ATE_CC_NO_DEFAULTS=3D&quot;&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"># $CRATE_=
CC_NO_DEFAULTS:class-native<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">CRATE_CC_=
NO_DEFAULTS:class-native=3D&quot;&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Cheers,<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Anton<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Richard Purdie &lt;=
richard.purdie@linuxfoundation.org&gt;<br>
<b>Date: </b>Friday, 18 November 2022 at 16:35<br>
<b>To: </b>Anton Antonov &lt;Anton.Antonov@arm.com&gt;, openembedded-core@l=
ists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject: </b>Re: [OE-core] [langdale][master][PATCH] rust: Do not use de=
fault compiler flags defined in CC crate<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal">On Fri, 2022-11-18 at 16:21 +0000, Anton Antonov wro=
te:<br>
&gt; &nbsp; I=92ve tested your approach. It doesn=92t work for whatever rea=
son.<br>
&gt; CRATE_CC_NO_DEFAULTS is empty exported for native recipes:<br>
&gt; <br>
&gt; $ MACHINE=3Dqemuarm bitbake rust-native -e |grep CRATE_CC_NO_DEFAULTS<=
br>
&gt; # $CRATE_CC_NO_DEFAULTS [3 operations]<br>
&gt; #&nbsp;&nbsp;&nbsp;&nbsp; [export] &quot;${'1' if d.getVar('CRATE_CC_N=
O_DEFAULTS') =3D=3D 'true'<br>
&gt; else '0'}&quot;<br>
&gt; export CRATE_CC_NO_DEFAULTS=3D&quot;&quot;<br>
&gt; # $CRATE_CC_NO_DEFAULTS:class-native<br>
&gt; CRATE_CC_NO_DEFAULTS:class-native=3D&quot;&quot;<br>
&gt; <br>
&gt; <br>
&gt; &nbsp; I also tried:<br>
&gt; CRATE_CC_NO_DEFAULTS[export] =3D<br>
&gt; &quot;${@oe.utils.conditional('CRATE_CC_NO_DEFAULTS', '', '0', '1', d)=
}&quot;<br>
&gt; with the same result =96 empty export.<br>
<br>
I think it might need to be 0 or &quot;&quot; instead of '0'. It would be n=
ice if<br>
we could make False work too but I worry that might not.<br>
<br>
Cheers,<br>
<br>
Richard<o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_AM7PR08MB5320B3702B17EC3FA2BBFBACFC099AM7PR08MB5320eurp_--

