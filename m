Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BD7C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 07:31:08 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.66])
 by mx.groups.io with SMTP id smtpd.web11.8177.1700033462919260631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 23:31:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=XXlz2k15;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.66, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNAmyySLXLfnJwruzXI0JcvlLanRsL1FzgXgN5LXTGEar7o2YOnVVuyX/zkTrfQyal9erNdGOVLslKx68fel7t7PXQewwsl1EcnwaShMQAZ+klKyk5V99vmiXUeev+dPrdo7YNvSVscoiKHB2V8a/lKURi/ytR3BrrSICa/7g8OF9Nn617A7hX8YCqTPiUEpMOARSMpV92Hv8N5TZ9Ow1qfENcp8qBYbzo6D1AKdVNCfMnrGvVGHscZZoCpRlTNs8WmgB9KXA0RVnPREbsdBw/u0UGomfWWBNcoTH6Mp/JP9TLvj+MZlJlL+PlzYPJyEQh7MUWJY3YGQ7E+UdV0gvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLQMeFYiAB3wgt11+O8Q61v8dMtYpsK++V+qNgZ+qps=;
 b=Ol6znEd5N2Gs02bDSdi/bJGHU2vKOjhVi0bMUXLRSCVX6aNWfhK75Q0idpPHXQ6ioLKYZDNnVYEj1OAawpAuCLdSYp3LyQQ+GAuZPug8UJSE0Z1uRp9gT9Ud6K9iTjZza59YjGMSXr4jFDSt7OjVvSFi2HYwYLKEND2qs9FVg1DT67VvtXZYPwW73mHFOL0/0MbwoMA5LBUzJti9MjujJ+RFdamkvrADRatQtSzaGOaTS9xDaJEfMSlC4lLHddOPEkZTXLZXPa0Amh0G0xo82FuLour6qE3oukbMPrYv6X5MyZXBND0/u1NIdnn0ZX/ICF176z+Oj8G5NfW9ZuXx/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLQMeFYiAB3wgt11+O8Q61v8dMtYpsK++V+qNgZ+qps=;
 b=XXlz2k15bjy3U8AttbYEgswQFTH1iHm/GyXxc8trv2cBP3dVuXiPO1DBR6f0OiQDbRMDkGWeBqRfcTt0B+G5YaUhHlxQjzkXpvQZimGTEVEuNa2+ZQXWSseA6KCL7I443NmrpRTpffym5QnXqi6WHCDQDOciXp8SbEb1Aj0Htcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by AS2PR08MB9644.eurprd08.prod.outlook.com (2603:10a6:20b:607::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 07:30:59 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7002.018; Wed, 15 Nov 2023
 07:30:59 +0000
Message-ID: <625e1f93-9850-4c0f-b546-a246cf94924e@weidmueller.com>
Date: Wed, 15 Nov 2023 08:30:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v3 0/4] recipetool: Add handler to create go
 recipes
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Martin Jansa <martin.jansa@gmail.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>, u.oelmann@pengutronix.de
References: <20231102155313.309534-1-lukas.funke-oss@weidmueller.com>
 <cf5fa871-ddcc-4f18-a013-3ef10ec77de9@gmail.com>
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
In-Reply-To: <cf5fa871-ddcc-4f18-a013-3ef10ec77de9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::13) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|AS2PR08MB9644:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed19b58-5239-49e0-b75c-08dbe5acd010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cJVXiRkXIZEv0T4Ir1IQGeubw/QI8D1x9c0YRRD9xCtbQ61irz6LzFlZt0JC/gmE7BFKgkSF7zsCvO1Jv9LEa21fAHZpIr5QvykSl6Qv6+BrfpMZT4PTIc5QUeMvmbX91RsiFRuYKrLZzTThqMMInF1ODaxmOOISMPRfj/+4wvsgN41dSVo2gc96iePe3IOtCxufK5/gxYLVnMu1HNj0Z4t3S3xOtsAlgjoynPfseMLjxGR/pajk8lqIfEsL+6clhqEbx27vaNTOPFCJitEj1tEyZCM21OaBiolTzf2YKGjs3Idc6uzADVhhvnLIsUJakDW+BLeySWIZINFcdrATOqUmy+933bPS4MUdAkCYDOprFQ9cKrovGisWKunViv9Vza7EVWPkoifCzgWZQ3OR7CH6HX5D7pHkmGEOnO+Ut3Iz/aU1NWc5blhpk/t45KcVlJUmtiKt/BZUTC0dPd6iYwwoIgZKMj8zFo2Ywwr8vIqrGFoB8DIrACNL3cbGLO7i7t2ZFNqJwg4CC2vvnef503dBA//Tap/UVlJnj8SQV/cOeqp8UN74ylf9nLKp5MjWGwmefcnePvLDu6nQLT/R9bJ/rvJmUIsP6bREkLW4Tj9XIkmiCQx+HVr/KdlFpCGkioZAVkv2bA4zJYijjNNxcQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(39860400002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(86362001)(5660300002)(966005)(6486002)(66946007)(31696002)(6512007)(36756003)(316002)(54906003)(4326008)(66476007)(8936002)(8676002)(66556008)(41300700001)(31686004)(2906002)(38100700002)(26005)(2616005)(83380400001)(478600001)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fka1qGlzXyCAvo/axVUtZXUSMZ+aqlQW1vzmq5y0HN7bMO2VS9XLHt2E5yzQ?=
 =?us-ascii?Q?2pUK8+G+Zxj+HS2Lb5qqwUBlCO2raRXS0A/LNr8K/uXiJK6E3iRhPzANRlaM?=
 =?us-ascii?Q?jE4H90Lpcrna1eFPUSG/fH97l3q1flGxBd0BPmiXpYDiv+SQqNJVWi1S78Qx?=
 =?us-ascii?Q?zyCab39TYJYYTvzCJRoF7gAYvM5xpcSy/Ls3YHk52Ges0/TtZraqQ6E60non?=
 =?us-ascii?Q?P5PgznbbB6iGw7EG7khRYGaY2gBRTdr/GVl2DLT7G8bWpolxhlG5ShFFQbgB?=
 =?us-ascii?Q?8QSWDPAO8ftsx9PgwvGA1YyeKNIrewuQG7jJqefd8B63CBt8wc9crqyQfi0O?=
 =?us-ascii?Q?mHrnvLRxQxGk6G8GF47iimGlFe5APeOBiu1V4Wrgn1Q3NBcVB3Q1nNfwzyak?=
 =?us-ascii?Q?rXArou6tNWr6CMvyK2xg3ndcUMtTs+Zbr9gs2WW9dvAo/zw+rrn6K9ya64uz?=
 =?us-ascii?Q?6cUoo5MvmSD0ARgGg1c9fgPLMBNDXk0rmmjvenit1MhSYbOSIiQbuUXZD6uk?=
 =?us-ascii?Q?KWaN4IcJ8ybQrCp3geamFE/5A6RkvgiMwDFci6rwDhaMKjcGPPu9Zf8frfiW?=
 =?us-ascii?Q?gna1XSAFiNs3V9JHoZIZeW/zB2MVlhMM12Tqqx4z908R4losJtSKM+vVMW2E?=
 =?us-ascii?Q?bYObxjjUCG2XCvS+bdgUkzKE61B4UZN2RVEGaNR6V7EZz7Obocrlnxcb79zT?=
 =?us-ascii?Q?sKfDA6SzgGXwcJ/4+QORQibdo/ZEBRH/70+Ked6IAhZnPEoBRBxvyItAvuU/?=
 =?us-ascii?Q?QFFhrlAS2M3GYFNEOjVu28Vn2+PpQz7gcTdZZBZA+nacm9citAuA1I3EOPXx?=
 =?us-ascii?Q?kebfGc7oZ2pRzd/YOZ4OYMi3nAlFC10Uklb45WZESr+umGdWtCZlo7zzzdZ0?=
 =?us-ascii?Q?jFFE2OSxYLppcvplhOD0JBW1Q28ESVskbKubrdDZ7gieekARWrLeRB6yNFb5?=
 =?us-ascii?Q?+pV9RNL2EDMpBPocGJG5V4g6+UzI/T4NQ7J3EM3MunrzvpTS6IiWAt9Qmg8c?=
 =?us-ascii?Q?QRK2wxuBGg5o2dgELDVhAcVB4jC6kEP5bXXkgZuICbH93qZWGdKpUZCy2i1O?=
 =?us-ascii?Q?QOlW6PievU9HNQyk+OMMYb7QvPnN/MmpuUxCxzQVwJYMn7+ugNWPguNwQjUs?=
 =?us-ascii?Q?C47VGCDxRm7fotoCXJk4OoyUWHCytRH3PKSt/DiM8+W6DpKSW/8hh4NAToYc?=
 =?us-ascii?Q?N6BzIeh1udtU8wSQ3gPW6zeNGtz475oTECyVczwT/TOpNSJOJO7N0xfU8H9R?=
 =?us-ascii?Q?gv/XOuimXQDytbJHkoMLzbMv1ISBYoZCFZI8QBXx1sluA23n0y0hOm34xn4S?=
 =?us-ascii?Q?T5rKrY2JTVO2thloA8EkvOtY3pBhAJVRfXmMOAfmknO3TCGS3gf92t7xdeoU?=
 =?us-ascii?Q?TRGVu5MkFKj6pWWGgCno+9D4YoLTpTf+T/Sk8Aad4MiEVjZGSvdMZoCR4dD9?=
 =?us-ascii?Q?ZA2onpMxjvVxw4w1xT8Ri3+wh5BhjFkYa+f6dFEU/LNxAC8IfNzaI93ZtN3y?=
 =?us-ascii?Q?vHgVC5HlOu1ZDS7RArbpZLxQZVoefr8gWxmjHhXU/bHxmhBe8qL32k5CgJOH?=
 =?us-ascii?Q?gXTebKbJb3bcEO7u51IlgRwxj866QvRr3wqAM1gIcFB7k4maAkNTlDqYhZ32?=
 =?us-ascii?Q?Rg=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed19b58-5239-49e0-b75c-08dbe5acd010
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 07:30:59.1970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmsofTdPfISw1PuiwoQL0vZkWShapDAIiPoKd5cuV3K6TL1dHis1KqGwVLTNZQ1FnCIJmFS4aouhK0V5xo+YEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9644
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 07:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190557

Hi Slava,

On 15.11.2023 06:59, Vyacheslav Yurkov wrote:
> Hi Lukas,
> Thanks for the v3. I know I'm late to the party, because it's already=20
> merged, but my testing results are below anyway.

No problem. Party is still going on. The 'modules.txt' is intendet to be=20
in your ${WORKDIR} as it is part of the SRC_URI, generated by
the recipetool. My guess would be, that there is some missconfiguration=20
in your SRC_URI?

>=20
> The series seems to have handled my ssh URL correctly.
>=20
> I've got an error in do_go_vendor though.
> File: '<poky>'/meta/classes/go-vendor.bbclass', lineno: 166, function:=20
> do_go_vendor
>  =C2=A0=C2=A0=C2=A0=C2=A0 0162:
>  =C2=A0=C2=A0=C2=A0=C2=A0 0163:=C2=A0=C2=A0=C2=A0 # Copy vendor manifest
>  =C2=A0=C2=A0=C2=A0=C2=A0 0164:=C2=A0=C2=A0=C2=A0 modules_txt_src =3D os.=
path.join(d.getVar('WORKDIR'),=20
> "modules.txt")
>  =C2=A0=C2=A0=C2=A0=C2=A0 0165:=C2=A0=C2=A0=C2=A0 bb.debug(1, "cp %s --> =
%s" % (modules_txt_src, vendor_dir))
>  =C2=A0*** 0166:=C2=A0=C2=A0=C2=A0 shutil.copy2(modules_txt_src, vendor_d=
ir)
>  =C2=A0=C2=A0=C2=A0=C2=A0 0167:
>  =C2=A0=C2=A0=C2=A0=C2=A0 0168:=C2=A0=C2=A0=C2=A0 # Clean up vendor dir
>  =C2=A0=C2=A0=C2=A0=C2=A0 0169:=C2=A0=C2=A0=C2=A0 # We only require the m=
odules in the modules_txt file
>  =C2=A0=C2=A0=C2=A0=C2=A0 0170:=C2=A0=C2=A0=C2=A0 fetched_paths =3D set([=
os.path.relpath(x[0], vendor_dir)=20
> for x in os.walk(vendor_dir)])
> File: '/usr/lib64/python3.9/shutil.py', lineno: 444, function: copy2
>  =C2=A0=C2=A0=C2=A0=C2=A0 0440:=C2=A0=C2=A0=C2=A0 resembles GNU's "cp -P =
src dst".
>  =C2=A0=C2=A0=C2=A0=C2=A0 0441:=C2=A0=C2=A0=C2=A0 """
>  =C2=A0=C2=A0=C2=A0=C2=A0 0442:=C2=A0=C2=A0=C2=A0 if os.path.isdir(dst):
>  =C2=A0=C2=A0=C2=A0=C2=A0 0443:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 dst =3D os.path.join(dst, os.path.basename(src))
>  =C2=A0*** 0444:=C2=A0=C2=A0=C2=A0 copyfile(src, dst, follow_symlinks=3Df=
ollow_symlinks)
>  =C2=A0=C2=A0=C2=A0=C2=A0 0445:=C2=A0=C2=A0=C2=A0 copystat(src, dst, foll=
ow_symlinks=3Dfollow_symlinks)
>  =C2=A0=C2=A0=C2=A0=C2=A0 0446:=C2=A0=C2=A0=C2=A0 return dst
>  =C2=A0=C2=A0=C2=A0=C2=A0 0447:
>  =C2=A0=C2=A0=C2=A0=C2=A0 0448:def ignore_patterns(*patterns):
> File: '/usr/lib64/python3.9/shutil.py', lineno: 264, function: copyfile
>  =C2=A0=C2=A0=C2=A0=C2=A0 0260:
>  =C2=A0=C2=A0=C2=A0=C2=A0 0261:=C2=A0=C2=A0=C2=A0 if not follow_symlinks =
and _islink(src):
>  =C2=A0=C2=A0=C2=A0=C2=A0 0262:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 os.symlink(os.readlink(src), dst)
>  =C2=A0=C2=A0=C2=A0=C2=A0 0263:=C2=A0=C2=A0=C2=A0 else:
>  =C2=A0*** 0264:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with open(src,=
 'rb') as fsrc:
>  =C2=A0=C2=A0=C2=A0=C2=A0 0265:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 try:
>  =C2=A0=C2=A0=C2=A0=C2=A0 0266:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with open(dst, 'wb') as fd=
st:
>  =C2=A0=C2=A0=C2=A0=C2=A0 0267:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =
macOS
>  =C2=A0=C2=A0=C2=A0=C2=A0 0268:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 _HAS_FCOPYFILE:
> Exception: FileNotFoundError: [Errno 2] No such file or directory:=20
> '<WORKDIR>/modules.txt'
>=20
> I've located "modules.txt" in my $WORKDIR/$GO_IMPORT/vendor directory=20
> though, which seems to be consistent with=20
> https://go.dev/ref/mod#go-mod-file-go . Am I missing something or I can=20
> send a fixup?
>=20
> Slava
>=20
> On 02.11.2023 16:53, lukas.funke-oss@weidmueller.com wrote:
>> From: Lukas Funke <lukas.funke@weidmueller.com>
>>
>> This patch series adds a recipetool handler in order to create 'go'=20
>> recipes.
>> Each recipe contains a list of dependencies in their SRC_URI.
>> Dependencies are derived from the projects `go.mod` file. For each
>> dependency the corresponding license file uri/hash is added.
>>
>> The recipe may not work ad-hoc, but is a good starting point to create
>> a working recipe and have a working offline-build.
>>
>> In addition to the main recipe three additional files will be generated:
>> =C2=A0=C2=A0 - $pn-modules.inc
>> =C2=A0=C2=A0 - $pn-license.inc
>> =C2=A0=C2=A0 - modules.txt
>>
>> Changes from v2:
>> =C2=A0=C2=A0 - Generate separate *.inc for go dependencies and licenses
>> =C2=A0=C2=A0 - Adapted oe-selftest according to change above
>> =C2=A0=C2=A0 - Incorparate community suggestions
>>
>> Lukas Funke (4):
>> =C2=A0=C2=A0 classes: go-vendor: Add go-vendor class
>> =C2=A0=C2=A0 selftest: recipetool: Add test for go recipe handler
>> =C2=A0=C2=A0 recipetool: Ignore *.go files while scanning for licenses
>> =C2=A0=C2=A0 recipetool: Add handler to create go recipes
>>
>> =C2=A0 meta/classes/go-vendor.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 135 ++++
>> =C2=A0 meta/lib/oeqa/selftest/cases/recipetool.py | 163 +++++
>> =C2=A0 scripts/lib/recipetool/create.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>> =C2=A0 scripts/lib/recipetool/create_go.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 730 +++++++++++++++++++++
>> =C2=A0 4 files changed, 1029 insertions(+), 1 deletion(-)
>> =C2=A0 create mode 100644 meta/classes/go-vendor.bbclass
>> =C2=A0 create mode 100644 scripts/lib/recipetool/create_go.py
>>
>=20

Best regards
Lukas

