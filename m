Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1932C433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 09:09:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.7445.1652173763932917763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 02:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EtUlWJrc;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=212905ad7c=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24A8hX99005176
	for <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 09:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=4z7ao74P+Po3O3zsZ4plKe3fYbhdpFwfK+e7NSm6Qwo=;
 b=EtUlWJrczPqJUB/P8/d2Z6Fxvb8lc1jL2pNGZ1YkOndcTn3dgQJTwwqJRXfNoa55pkWm
 4QPkFj5QE9E6r4lBqpKUf1ijhWMXey1qbkjUI06gxadDuNfroTxWmI1dbpkfGAwQSsVs
 swVWEQOCWZXYn4TB6XPESQr0QDa1i41tTgDZq+fWiUklDjrDfBYQkIQBq/l38ebqvGoy
 9gwl/E/cS+cT5T06NA0gBd4knENABBy4aiGMvYLzabLEWTcoCJJAX5kB1kfzjNpZBh+O
 3/yv08rb6AL9R0KR77dHBWtH1i8RLsCNzXRqoxL+YRgFgf7W2u56cDf9B3cDGfNRlNIY IQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwdyyt2vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 09:09:22 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24A97sSI022454
	for <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 09:09:22 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwdyyt2vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 May 2022 09:09:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6frvq+qSfpYrsTUA5cIX/Z6MxXqj6tjvqfrcxvI5WuVVly1/rVJMKPfF4aAefNi5RKfFog4kjnUxTHXrUNHQ6lHhwNzCKroji6BaXKRaHLbmdtbUYQ0ME9AbZ19XNctll12zpfY2L0C79YTrfXzaRmXiNIoPDVx3hFooGbSwNHkS8fWk05l4bke62622Oo+Kr+f5b+El7Ij+7L3ExgXE2wnpTmRdmhj/PNIfJcEPNqeOYUBfU0kxmhwgQSk7kvxCC2exkW9Cvk95wKlQW+NN8JhnNEyO65kgioQZGAe2ir1Pu5FoVg/PZ+kSxGcFTQ2mXykmt0bdxGBIGDLrX88bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4z7ao74P+Po3O3zsZ4plKe3fYbhdpFwfK+e7NSm6Qwo=;
 b=KQ645FASnjlF3Xlc9SIsTOKZ6DZ3f/QBW/trqHDriDobHipTe8GUfDoih12c1x62IK87thoRH4RkbbGs1cwy5EoijlsJiB6a7wDoL+z6+4y/sgyVZAZqBJS0z3HtyjKqtxq7MKE5Xv+dO8YMH1g4nwdWbVY260zGVr4BjtdieH8DXSAOdtFdUDmD4zEWO5tZ5VI3MP059z9XG5+3YUZlSklBopvOmm42TCnTfYflBsDmP+Usqc1A+EGDnSMGia9MKTMSQXLudVI4C9pF3c7iJXRvq4h1LkRYGfNQonU20na6L6FBaZoXJrkDPWwaedhLONMp4ohsYtpX3X5JaEPhtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM6PR11MB3643.namprd11.prod.outlook.com (2603:10b6:5:13f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Tue, 10 May
 2022 09:09:19 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8%6]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 09:09:19 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>,
        "alexander.j.kube@gmail.com"
	<alexander.j.kube@gmail.com>,
        "matt@madison.systems" <matt@madison.systems>,
        "richard.purdie@linuxfoundation.org"
 <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Regression about go 1.18 + OE specific local patch
Thread-Topic: Regression about go 1.18 + OE specific local patch
Thread-Index: AdhkR3J0gZ4IkFfXRuug65TZE3/dCg==
Date: Tue, 10 May 2022 09:09:19 +0000
Message-ID: 
 <CO6PR11MB560249B7071753A389AFD7C6EDC99@CO6PR11MB5602.namprd11.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b66418e6-b7fd-455f-102e-08da3264c40e
x-ms-traffictypediagnostic: DM6PR11MB3643:EE_
x-microsoft-antispam-prvs: 
 <DM6PR11MB3643E09BDF4B41E09FC18BBBEDC99@DM6PR11MB3643.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yQUiGWJUSWiz2A+0rc7AI67Q/+Oa9wLuTptcvY6DTf4tI8Uy01SrRbRLLAnaJgEV2+Qv5NC3L/gZFk0rlyv2cZoIn5Ha736TPpdL6XuJ9gTJ9+AN/d1nj7Ay6efSjAsXyvDh3wpVU3MaN7Mb8joMdQxcfNDZw6LJWk6w+8lJJYMFTTUBAh+CYTS91LHAVaQzugs4q5RSdtsTsJvs5WEWi+XrJHJ6ApciK2Oqs8KbSMfnjW0yGJo1i7njnPooX4qolCPE0ne8BYK28pR9MYsY4UAoj75KbCHk6so5dpU7+b2ZV5icNorNC/C1B7kgp4KQPvRNWxMNwbq8vIT6E+fTbtlfMeq8U/dJbmJVS6gWYGflBRmF3s4g4Uh9g6fiTT0M/wMH1LIaY2nMPo/X8w3oqgmk08IF+kaic57pQuBCb59CNN+p+NqQ7GPFGDjMBf2Z55EAtw4g54zYoSRJn8HrF38IECVAZOHxikH/eH+hkOyhp45EXK20WDgyAnxno8QVQnC4Re7nFDQB6mLl0I8Cvi9puHuiEkjDqAtN0EkQvBKw9tA472onx0MQ0DR+fljCORFBA+LUS3K6MDnoUb7Kc1ILn29OBu0NZ7s+iFqscviUU5uFGOktOQesIW0xrLNtpmxkYPQePllo4RN/djFwOPxok3IALesjgoAg96pOs+pNgIyX8C141NSy4QknOzlQ/UZaCIp1NnWRkOh0eT/UQw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(76116006)(66556008)(2906002)(66946007)(8676002)(66446008)(66476007)(86362001)(316002)(38100700002)(508600001)(38070700005)(71200400001)(122000001)(83380400001)(8936002)(55016003)(52536014)(9326002)(5660300002)(9686003)(26005)(186003)(33656002)(7696005)(6506007)(4326008)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qUcc9LExqnPbTkNI5MQ/CR1uM4dLSYECy1glaqNKWtUdVsYxaiR0rf6Stwpa?=
 =?us-ascii?Q?Wm9HYPi+/LEYo1YSeCrQtCyzeVf7TZlBWeBeCoTzezQptx9fGzhz51jMfsiL?=
 =?us-ascii?Q?7TL20+q+jJrxUlji2pdcRfJb7T0mJ/ogKQ6b9p/8VZQY2dwhYF/JjxtGdMbo?=
 =?us-ascii?Q?cHdoxXc8GAZLUZQsSIjwxpUbQNJctm8J2SUG8ZSb80/kWYxrEswxmC5QtoAX?=
 =?us-ascii?Q?01gXyk/y0EafVsLwK/DbXFELwR8gmZj8H3X2mzgQPjpaLaJcnOYtbQHebaxI?=
 =?us-ascii?Q?LBMraGkuHh23XE63e8r8OsItX3iDslGAKH8F3rvp8OHJ0mkX5DTD6k1lj50O?=
 =?us-ascii?Q?nOFhmY6VuDyvs6fH+K5P7C2o/zRJY9OuK+1b2D1D5xiiz/P1IqcPPb1qXUGv?=
 =?us-ascii?Q?G3F4x4VBmoOI2vgGWwQ8dtnpLMJWsIwHKlVKhaZ43T9lSd2O2KN9zmn343PW?=
 =?us-ascii?Q?/HbDoYesd9NHJEYiYPU7/w8aQoMe9Z4PYTzEmX3IsKFwVpuagzw8sS+IkK8B?=
 =?us-ascii?Q?QyXUoR6CSFgBaD9xEI/HMcZcUMWtXZjC9EFuaKUWwFi9ERHXB/XjS1LZmgdb?=
 =?us-ascii?Q?prQxAP25hRxFAwCfxpca6Z3rlnrf9CJK/kKoIp4ibJXrplM79WRg+DO7cdJU?=
 =?us-ascii?Q?TSeJJsUL8itt7Gw3O349CIHkL3zODZTdMndhIYvRGYFp8vhkhuPAjlM+AatJ?=
 =?us-ascii?Q?iE8wDGbvYOncJC7z/W9uPyLq3fM6sc2Vk7L8Z/OJPaB4J+ZPE/QAOvTmM0F1?=
 =?us-ascii?Q?hJyAhm4fRwpkcYVneZP/p6+nJROkD5tCKM8TpICHn6ZGG0PhddYskaFC7XvI?=
 =?us-ascii?Q?OeGgYyDlgMYxlcMd64crLLkKzSx+l409FFMHBY1nYc2PuF2vWyGwfqKViavO?=
 =?us-ascii?Q?+2kSr7pAneGN7t4b2oi7JL9zE5DIg4C+lS8QgsuqvKUUof91/joooCKAab5K?=
 =?us-ascii?Q?iSVmfuBztm6Jg4cqG7Bll6ZhvavzdyM2Yq1hvjJMlGeT0BocctAgXpJ354oU?=
 =?us-ascii?Q?T9DkF3Wm5rOYa02UzmQl7r9gmGZfZlInKrk+bCEBA5qKkdJTrijVjneGqWAh?=
 =?us-ascii?Q?o4WtOFmodUdlQa4/im6BgJ87ooIv2qQyDNtcw/0OLfXNgZZLT4MnAlGCbHPj?=
 =?us-ascii?Q?uaGb+f4G14Dj2KfJ8DgBK3xUXQW26RGEeEo1fqQQsAkUwMP65z0/BC45j/if?=
 =?us-ascii?Q?4L/cWFAPt33XFP/GrhV0jEhgF5qanIPfiC12eX+Gm4C5jkXVQ4Ab24FiHMxz?=
 =?us-ascii?Q?3orAwG7gobE7D97Uj6/FWdwPL9jvLRbx3eGgLZ8j3Me72CreRWItTblMh59U?=
 =?us-ascii?Q?cQiHcjEORcCWc9gNdfVKJcTBDbQr70idHLLIvoDuttPbGBUmk46xxx2dboeE?=
 =?us-ascii?Q?EooA9wmPAQzIQfykukVfZik7NYAnc5PuWS3rbkIQy5BYBAij4n5SDmZuEJl+?=
 =?us-ascii?Q?TTFf7NVLmCmtjnCQghy9EsQ6aRo0tEfN7BlUy1jHts4ZcuhJN5CRgVp+rVBu?=
 =?us-ascii?Q?NiMglsEAyPjQJ6vpLbwooT2dfLa4YJ9DJgDEfE5JdTaRdjdS5W5xhaPo2rJ3?=
 =?us-ascii?Q?3FCpTFtCxi8Zw7V1eJWcBlD2MbXiJCAybqq+UKxGOrlVIXH0pg1+XOSNlUkI?=
 =?us-ascii?Q?rRERGgAPVUu2aCDNnIw0m2eo7c8gV53m78UPAvJ+2sJvLAJyyZjCLPdkf7V5?=
 =?us-ascii?Q?+MSjpswLUBFgjqpGNlCFvbBpZC65/UqI7BOO7anfrhtpChE2/JqpLjItE4fR?=
 =?us-ascii?Q?HW2F7BOIIA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB560249B7071753A389AFD7C6EDC99CO6PR11MB5602namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b66418e6-b7fd-455f-102e-08da3264c40e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 09:09:19.3251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Kftaaz4+/4mdDe7aek0GVGtCTkz7C4hqcz5Jsz4EG5MK6ij0n6ENBMejihnbAJCNcbKFgiza5T4H/v4uKNU9jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3643
X-Proofpoint-GUID: 95gY_C2Na7OPHfsoaOA9UYTOTnCjW6Pc
X-Proofpoint-ORIG-GUID: DfnSgaLXexLNJEPFGG9mYkQxror27e6n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=675 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205100040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 09:09:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165412

--_000_CO6PR11MB560249B7071753A389AFD7C6EDC99CO6PR11MB5602namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I met a regression after go was upgraded to 1.18+.
The problem can be reproduced by running `bitbake nativesdk-skopeo', with m=
eta-virtualization added in bblayers.conf.
The error message is as below.

"""
<snip>
| HASH[build golang.org/x/text/unicode/norm]: "import \"golang.org/x/text/u=
nicode/norm\"\n"
| HASH /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-native=
sdk-pokysdk-linux/nativesdk-skopeo/v
1.6.1+gitAUTOINC+3e2defd6d3-r0/git/src/import/vendor/github.com/pkg/errors/=
errors.go: 1b60ba5bcb417f0060d1c1fbc
edaa1a702020499094ce8134f8b45a58c0ebbff
| panic: runtime error: index out of range [0] with length 0
|
| goroutine 5129 [running]:
| cmd/go/internal/work.(*Builder).buildActionID(0xc0002490e0, 0xc000370b40)
|       /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-linux=
/go-crosssdk-x86_64-pokysdk-linux/1.
18.1-r0/recipe-sysroot-native/usr/lib/x86_64-pokysdk-linux/go/src/cmd/go/in=
ternal/work/exec.go:281 +0x23cf
| cmd/go/internal/work.(*Builder).build(0xc0002490e0, {0xc000220000?, 0x0?}=
, 0xc000370b40)
|       /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-linux=
/go-crosssdk-x86_64-pokysdk-linux/1.
18.1-r0/recipe-sysroot-native/usr/lib/x86_64-pokysdk-linux/go/src/cmd/go/in=
ternal/work/exec.go:476 +0x199
| cmd/go/internal/work.(*Builder).Do.func2({0xadd9f8, 0xc000220000}, 0xc000=
370b40)
|       /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-linux=
/go-crosssdk-x86_64-pokysdk-linux/1.18.1-r0/recipe-sysroot-native/usr/lib/x=
86_64-pokysdk-linux/go/src/cmd/go/internal/work/exec.go:139 +0x5ec
| cmd/go/internal/work.(*Builder).Do.func3()
|       /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-linux=
/go-crosssdk-x86_64-pokysdk-linux/1.18.1-r0/recipe-sysroot-native/usr/lib/x=
86_64-pokysdk-linux/go/src/cmd/go/internal/work/exec.go:201 +0xb9
| created by cmd/go/internal/work.(*Builder).Do
|       /ala-lpggp72/qichen/Yocto/builds/build-master/tmp/work/x86_64-linux=
/go-crosssdk-x86_64-pokysdk-linux/1.18.1-r0/recipe-sysroot-native/usr/lib/x=
86_64-pokysdk-linux/go/src/cmd/go/internal/work/exec.go:187 +0x3da
| Makefile:140: recipe for target 'bin/skopeo' failed
<snip>
"""

I did some investigation and found it was related to a local patch, 0001-cm=
d-go-make-content-based-hash-generation-less-pedan.patch.
The build succeeded after I dropped this patch.

I'm sending out this email to seek for some help, as I don't fully understa=
nd what this patch does.

e.g.
"""
+               if strings.HasPrefix(flag, "-m") {
+                       newflags =3D append(newflags, flag)
+               }
"""
This flag filtering is not explained in the commit message.

One more question: this patch applies to all go recipes, including go cross=
 compilers and target go. But from its commit message, target go does not s=
eem to need it.

Any suggestion?

Regards,
Qi



--_000_CO6PR11MB560249B7071753A389AFD7C6EDC99CO6PR11MB5602namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I met a regression after go was upgraded to 1.18+.<o=
:p></o:p></p>
<p class=3D"MsoNormal">The problem can be reproduced by running `bitbake na=
tivesdk-skopeo&#8217;, with meta-virtualization added in bblayers.conf.<o:p=
></o:p></p>
<p class=3D"MsoNormal">The error message is as below.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&#8220;&#8221;&#8221;<o:p></o:p></p>
<p class=3D"MsoNormal">&lt;snip&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">| HASH[build golang.org/x/text/unicode/norm]: &quot;=
import \&quot;golang.org/x/text/unicode/norm\&quot;\n&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">| HASH /ala-lpggp72/qichen/Yocto/builds/build-master=
/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-skopeo/v<o:p></o:p></p>
<p class=3D"MsoNormal">1.6.1+gitAUTOINC+3e2defd6d3-r0/git/src/import/vendor=
/github.com/pkg/errors/errors.go: 1b60ba5bcb417f0060d1c1fbc<o:p></o:p></p>
<p class=3D"MsoNormal">edaa1a702020499094ce8134f8b45a58c0ebbff<o:p></o:p></=
p>
<p class=3D"MsoNormal">| panic: runtime error: index out of range [0] with =
length 0<o:p></o:p></p>
<p class=3D"MsoNormal">|<o:p></o:p></p>
<p class=3D"MsoNormal">| goroutine 5129 [running]:<o:p></o:p></p>
<p class=3D"MsoNormal">| cmd/go/internal/work.(*Builder).buildActionID(0xc0=
002490e0, 0xc000370b40)<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /ala-lpggp72/q=
ichen/Yocto/builds/build-master/tmp/work/x86_64-linux/go-crosssdk-x86_64-po=
kysdk-linux/1.<o:p></o:p></p>
<p class=3D"MsoNormal">18.1-r0/recipe-sysroot-native/usr/lib/x86_64-pokysdk=
-linux/go/src/cmd/go/internal/work/exec.go:281 +0x23cf<o:p></o:p></p>
<p class=3D"MsoNormal">| cmd/go/internal/work.(*Builder).build(0xc0002490e0=
, {0xc000220000?, 0x0?}, 0xc000370b40)<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /ala-lpggp72/q=
ichen/Yocto/builds/build-master/tmp/work/x86_64-linux/go-crosssdk-x86_64-po=
kysdk-linux/1.<o:p></o:p></p>
<p class=3D"MsoNormal">18.1-r0/recipe-sysroot-native/usr/lib/x86_64-pokysdk=
-linux/go/src/cmd/go/internal/work/exec.go:476 +0x199<o:p></o:p></p>
<p class=3D"MsoNormal">| cmd/go/internal/work.(*Builder).Do.func2({0xadd9f8=
, 0xc000220000}, 0xc000370b40)<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /ala-lpggp72/q=
ichen/Yocto/builds/build-master/tmp/work/x86_64-linux/go-crosssdk-x86_64-po=
kysdk-linux/1.18.1-r0/recipe-sysroot-native/usr/lib/x86_64-pokysdk-linux/go=
/src/cmd/go/internal/work/exec.go:139 +0x5ec<o:p></o:p></p>
<p class=3D"MsoNormal">| cmd/go/internal/work.(*Builder).Do.func3()<o:p></o=
:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /ala-lpggp72/q=
ichen/Yocto/builds/build-master/tmp/work/x86_64-linux/go-crosssdk-x86_64-po=
kysdk-linux/1.18.1-r0/recipe-sysroot-native/usr/lib/x86_64-pokysdk-linux/go=
/src/cmd/go/internal/work/exec.go:201 +0xb9<o:p></o:p></p>
<p class=3D"MsoNormal">| created by cmd/go/internal/work.(*Builder).Do<o:p>=
</o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /ala-lpggp72/q=
ichen/Yocto/builds/build-master/tmp/work/x86_64-linux/go-crosssdk-x86_64-po=
kysdk-linux/1.18.1-r0/recipe-sysroot-native/usr/lib/x86_64-pokysdk-linux/go=
/src/cmd/go/internal/work/exec.go:187 +0x3da<o:p></o:p></p>
<p class=3D"MsoNormal">| Makefile:140: recipe for target 'bin/skopeo' faile=
d<o:p></o:p></p>
<p class=3D"MsoNormal">&lt;snip&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&#8220;&#8221;&#8221;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I did some investigation and found it was related to=
 a local patch, 0001-cmd-go-make-content-based-hash-generation-less-pedan.p=
atch.<o:p></o:p></p>
<p class=3D"MsoNormal">The build succeeded after I dropped this patch.<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m sending out this email to seek for some he=
lp, as I don&#8217;t fully understand what this patch does.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">e.g.<o:p></o:p></p>
<p class=3D"MsoNormal">&#8220;&#8221;&#8221;<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if strings.HasPrefix(flag, &quot;-m&quot;=
) {<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; newflags =3D append(newflags, flag)<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&#8220;&#8221;&#8221;<o:p></o:p></p>
<p class=3D"MsoNormal">This flag filtering is not explained in the commit m=
essage.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">One more question: this patch applies to all go reci=
pes, including go cross compilers and target go. But from its commit messag=
e, target go does not seem to need it.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any suggestion?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Qi<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CO6PR11MB560249B7071753A389AFD7C6EDC99CO6PR11MB5602namp_--

