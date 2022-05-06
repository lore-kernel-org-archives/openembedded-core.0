Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAFAC433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 03:44:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.5602.1651808679123917145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 20:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jmGqzjm9;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=212557e087=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2463ibYv014169
	for <openembedded-core@lists.openembedded.org>;
 Thu, 5 May 2022 20:44:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=FRKB/A6T0bQegMW8bdgEMvTc//vQ5s7lRQcNqZv7Iss=;
 b=jmGqzjm93YAsWZnL82SL97Dz1Xh77aldI2V1YV2WRfQH4/6RZyUezMECJJ3mX5Og1rCc
 4akb3lEBtloHm1aFIa8HtmRb5B8BGkFCq2flpNyETyukbYzz7AA8aOkJvBnV9LEFX2Kh
 XsWtX8TR/pdOpZzyqY9nVBp18asUp0Wah0kZExyl8FNWEN/JpB5BL9cAZbtmYgk2ZaXk
 WaQ3N0AOYdTM5X7O0sO2RQUclcYe/YD+LNHUR4l8FG0+MhJqT7vAvDRZ2uIbYnG236lg
 NgSmRAy2aimQyoPTcp+CxXReGGLRDfrRmo9W+O0vVzeSW5NzRfwk8zzUGCk5Ht1iFNog uA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fs0d3c9u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 20:44:37 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2463iaaq014159
	for <openembedded-core@lists.openembedded.org>;
 Thu, 5 May 2022 20:44:36 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2045.outbound.protection.outlook.com [104.47.51.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fs0d3c9u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 May 2022 20:44:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPwSNi+FVqVrpukBZReL5/DvddohTUj3u2fz7WTK6EFjol5S0d3pb8uki4kDSOgLdOnpXxLTL1bgecPiuO1HRV6r67g5foO8YFINiEf75tvj8NiNrEpyGISRsNbiUAKsufbSya8nx/KrNkJwl1VtKzVlQlfoios5DvyKA3gj8cl2/JLnvnaUznRsMU1Y8mZuf6OSCZeLUi6JSakCx468hxejnwh50MisZS4OoWugT8K+5tpb/otyVOe0P9BgTB1wrCocIW9huVL3RWi/LieRJes7XYWQmzmOoZkOvN+zSiz4sC2eFmgKSHqrlO0yx/R7JRjb10yV3z1ycSQFv2H9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRKB/A6T0bQegMW8bdgEMvTc//vQ5s7lRQcNqZv7Iss=;
 b=laeFahiTe/gVakO9rjo7oFOpqzSMPi/caowrSpRqV7UHVva/OVRUdp8Nbu30pZ0h3+ucdDvrbyy/StV4pwWbFkmKLIlbnQMLFc6sRZB0anuoDQagzgob7hIP0nfsxS1XfUvNOy5pxYIl+MnTjEaFcGn6LYdiyjaMyAKR7XaiDzAaqLIjy4XIxQ1E/pxa6y1py0mNYIzp/+Sfd8dIsIfVvJUGnDBpQzJ5PacIkHxFsNIq0gqbO+/EiB8zfId5WEfMrKC+mD1kpG8PHiHqEcbHJEPSXp0yBwFUWfdEINikXE781nveZKd4OCr8aVtk3WaYaSJTN/H9ALAYZcNJy4HWnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN6PR11MB2829.namprd11.prod.outlook.com (2603:10b6:805:62::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 03:44:33 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8%5]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 03:44:33 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "ross.burton@arm.com" <ross.burton@arm.com>,
        "richard.purdie@linuxfoundation.org"
 <richard.purdie@linuxfoundation.org>,
        "raj.khem@gmail.com" <raj.khem@gmail.com>
Subject: GIT_CONFIG_PARAMETERS does not work
Thread-Topic: GIT_CONFIG_PARAMETERS does not work
Thread-Index: Adhg+V6j3tCbo93+RhmDQO5OGe3wcA==
Date: Fri, 6 May 2022 03:44:32 +0000
Message-ID: 
 <CO6PR11MB5602F4C0C926F81D7092C5CBEDC59@CO6PR11MB5602.namprd11.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4328830-b693-4f80-2daa-08da2f12bb9d
x-ms-traffictypediagnostic: SN6PR11MB2829:EE_
x-microsoft-antispam-prvs: 
 <SN6PR11MB282929E51319DF1BA8E891F7EDC59@SN6PR11MB2829.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fVXGiogn9qCukERpHQvQvXG4y7AUe8mqo6pWGUolY9Q9WaSlPt8lrtwY3W80VHGsRDxZmHfCEK5p8A5LQ2SNncKtm8dwl7jzLw132fa+thNOKNqSD81km4pKXtWFlyQtJsaU80J/cZUBg2wuZ+2DoGhs4EmCmE6TK1g8lObbWI9hQbpy/KWO2kbzT2/c2R1/n/YNKB9u9evN38koTnly+hlL8deTJl3XoQ48/exU5ZBPmj57mYskjIGMvlgC12pXHvl60/pD/1T902vpBDmTdVC4/K+1Kv5cadwuyOW7Mn5MjWmA6fRcoZGruqcumZYhJmdV94fTHi7YZPGq+MERPo/9AbSUsT1luwKnEv0nig2UkwkYP60EwY+5KozX2kefr+qU0rmwqbyuGjy8x+z1po1rVjJKheBUWB8n3RfAd8+5zGZJzWrNO3vN2NRiO8bZEDLqSZALtIpOMhsUA92f24jBh6eFyz4HBsRLtMb/ZnSwVriSXskuHsW925zhZWI8TbhZdn97/50MDD72k/CcUJcP0C9yo52KS1ELVbj8Ov4cP/MeegXmYiuGs7/75S+00rs4kZMt0Kj2R0Q/u/7BING3vGJLk/wmIdrFZ1YWoLjHAUMG1evlsjavuvikThw336dPxwxLbhDvjcNQhxDSlID5NFlxnH1NFKk20zuGodKNGqEi4tAUX991NI5SMoREVt5eb1U1oV3xdXkWax26r30epiRt2gE352Vs+t2l2lxFnjdXXcas67A+r5r5GKgAnqVoDGXwSyYlKmG9xGTIOjcqoAaO3sDO67pqbCd87UUn7QNE3xOoSzCumdU7vvIe
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(52536014)(316002)(166002)(5660300002)(8936002)(186003)(7696005)(38100700002)(38070700005)(122000001)(76116006)(966005)(6506007)(64756008)(66476007)(66556008)(66946007)(66446008)(55016003)(83380400001)(4326008)(8676002)(508600001)(33656002)(71200400001)(86362001)(54906003)(6916009)(9686003)(26005)(9126006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1/6O7sIzcNph+BynoNIh7+CXxUkHxrF74TvsGwZ98SVGAaacp2BbbD1wJciu?=
 =?us-ascii?Q?1LHydl0YYHHdc5/IRFcd5A1g8gD5H/jdXgdoJ3oGPT8kq8UYIgFkRg+rk78I?=
 =?us-ascii?Q?rNQnX8CiPPfR4mXmXiXNX5Y1oqgYXSnZE9u5jjStRJAIJsmwy9QRsotJmJOD?=
 =?us-ascii?Q?lP9ovTLkeZTkrG4+chEhgqzNvjo3+W9nbnJCdsfi6VjH629oy2AVvxrhyqmp?=
 =?us-ascii?Q?TnKK9lgi6gDcQ85QbuROVUU/WuOYgaHUJwKP5Jh9dPaHnHFp8wNmhnzjrKlK?=
 =?us-ascii?Q?I4OcNnBNbQiSCjUakP8ZDZ0b3Mr7z1/wcfu8CilkxZPoYgDQpX4sjTAy3EG5?=
 =?us-ascii?Q?Fp0UlBh0aEuMq+0lPPZk4NPdfgPqOjGroBrFi6O8zuC2yKfWHNyC4EVOvnLV?=
 =?us-ascii?Q?BNk5MnLPTqtar3AxaPc8AAwlvwsB8wmXVpEwg/Vto0mdLN4e+TDswVflmuG/?=
 =?us-ascii?Q?T8WHlR1jLoQOFvosMkNEWpv9HqjIdMDn/BQBxz9S7HrlvDxbO3Jq25H/SHYE?=
 =?us-ascii?Q?KhtAdCL+5PSj88vu77bN3bCw9ZXCXUakx5iEDLRSO/GrwNF3P+xMPR/pl4xc?=
 =?us-ascii?Q?88yC183VoYVXYxmetuqzGEZNtyPJuT6bSJg2dXEr4Gv3C/TDfvyRuWdXj2gH?=
 =?us-ascii?Q?kAMRj80Y/kF6NSZwq4GFiomb1nJwWXyFGC7DhvRDyxv8EL+/wLt0gxlx7knw?=
 =?us-ascii?Q?+vUSnR1PnxCEWSQZWxCYf86yofAc/fqzAzxEUsK4L+KmuqVBsJc08JfeD9wo?=
 =?us-ascii?Q?BDS4ryJ4x0hL1rVs/Kz2hJ3q5YIUMh/cYFJb4acHJVu20Wn1GwIF6RKFdWRA?=
 =?us-ascii?Q?sHi9g2berfnw6OOLyTD4Idnx30MHDF7vkMPQabgNpnHk9TneONK7Jn8L6UZr?=
 =?us-ascii?Q?fXycLwRImsSzyFVmefRe/S+Ibg1ATCWq6OuCpHzbVay8/J85zhe4NENtZKDY?=
 =?us-ascii?Q?fCtXWRQMQtt7kd1zV08ahCUUh3eXKMYe0g8j10gQNbaMYxnEVGAA1FGlk2TO?=
 =?us-ascii?Q?ETwYGUDLoxlCR7njTHB5DyU/sUx0haYINl+fttfooqseh+8QKQt4O56m8FLI?=
 =?us-ascii?Q?wnHp/E0Rb+OOLB8up85qqtb54qfik1437s68yG0THHYNj3tIO8deknZJNL4D?=
 =?us-ascii?Q?cVDB62SrCCS9iVybMv6vhrZD/tiyxx8XjzvHrU/gd2Nu59I0mMcjhot5jsQL?=
 =?us-ascii?Q?rkM6xUqFkPunwA5M2HtFSsjyxCXBqkKRRVWw4fruSgKRZDRMw5eC7k87ql5D?=
 =?us-ascii?Q?KwTWFl5WKkOUTbZG7IH9oIUk0iZOiwHVz4NIITZIEgRKw/qNZ1XgbYQK2ayU?=
 =?us-ascii?Q?KM3zC3eEMDPlCnMeK7l6dAydegS4yoo5ZbJc/mhITKL9jUveMvMIKbeH+jh6?=
 =?us-ascii?Q?PTomM41/NeWsVi2njK1YwFNwnk5wwoLATHIniGfGA++wubZShjHQds2fHYo8?=
 =?us-ascii?Q?q4dz6RPFTOaLad6TVm9OZTxM5lFHjzOyvECgww4ZzqRPNuekL5zJCDNAws4k?=
 =?us-ascii?Q?28AzdVhOELeRrK8qE4edtBZzan0cUp16NuWa75ru5jS4JEPuMUzx8KgypAFK?=
 =?us-ascii?Q?u3y6y7jb155SfvRL5t/P8w5Yq+wHcMyaDl/wzYtVF1SqmQH4IFsmAT758NNZ?=
 =?us-ascii?Q?CUuKLqdS17OpfUWtnmhtoOmG2CEKdMCV306e6zZy1IzVsU/2fBnPXufa591G?=
 =?us-ascii?Q?svxuKa4TAnNT3Wly9oQRCEyKnP+vdtvJE8eGHNEEzjqWIgjgbPys2wQ2gmLJ?=
 =?us-ascii?Q?DRu58Hh+1w=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB5602F4C0C926F81D7092C5CBEDC59CO6PR11MB5602namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f4328830-b693-4f80-2daa-08da2f12bb9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 03:44:32.9278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 b65OvvRgiQ3F7tZxko5kMjJrPtwVconighkrNqOSv9VTfsYVGKbyt1dSiVO+e+9Cg7kY2jKQGUvbeQYWRBnlQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2829
X-Proofpoint-GUID: 8aCEOe3F5TSGn2Amzfgyf2_L_9liADz-
X-Proofpoint-ORIG-GUID: FymHpeogPQSdCD5QxhwsEi9XiaLezM0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_01,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=652 spamscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 03:44:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165317

--_000_CO6PR11MB5602F4C0C926F81D7092C5CBEDC59CO6PR11MB5602namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ross & Richard,

I'm building hardknott on host with git 2.36.0. And gnulib do_install fails=
 with git unsafe repo error.
The same error could be reproduced by reverting Khem's fix for gnulib do_in=
stall and building gnulib against master.

| fatal: unsafe repository ('/ala-lpggp72/qichen/Yocto/builds/build-master/=
tmp/work/core2-64-poky-linux/gnulib/2018-03-07.03-r0/git' is owned by someo=
ne else)
| To add an exception for this directory, call:
|
|       git config --global --add safe.directory /ala-lpggp72/qichen/Yocto/=
builds/build-master/tmp/work/core2-64-poky-linux/gnulib/2018-03-07.03-r0/gi=
t


I can see that we have already been trying to use the GIT_CONFIG_PARAMETERS=
 to solve this issue. Related changes are:
"""
+# Treat all directories are safe, as during fakeroot tasks git will run as
+# root so recent git releases (eg 2.30.3) will refuse to work on repositor=
ies. See
+# https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb7e7=
d9 for
+# further details.
+export GIT_CONFIG_PARAMETERS=3D"'safe.directory=3D*'"
"""

However, following the link above and I can see that the commit message say=
s:
"""
    The `safe.directory` config setting is only respected in the system and
    global configs, not from repository configs or via the command-line, an=
d
can have multiple values to allow for multiple shared repositories.
"""

If I understand it correctly, this means that the command line environment =
variables have no effect.
Also, I figure if some user could set his/her own environment variable to b=
ypass this security check, then this security check does not make much sens=
e.

So I think we should use the intercept script approach and add back the fol=
lowing line.
PATH:prepend:task-install =3D "${COREBASE}/scripts/git-intercept:"

What do you think?

Regards,
Qi

--_000_CO6PR11MB5602F4C0C926F81D7092C5CBEDC59CO6PR11MB5602namp_
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
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
<p class=3D"MsoNormal">Hi Ross &amp; Richard,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m building hardknott on host with git 2.36.0=
. And gnulib do_install fails with git unsafe repo error.<o:p></o:p></p>
<p class=3D"MsoNormal">The same error could be reproduced by reverting Khem=
&#8217;s fix for gnulib do_install and building gnulib against master.<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">| fatal: unsafe repository ('/ala-lpggp72/qichen/Yoc=
to/builds/build-master/tmp/work/core2-64-poky-linux/gnulib/2018-03-07.03-r0=
/git' is owned by someone else)<o:p></o:p></p>
<p class=3D"MsoNormal">| To add an exception for this directory, call:<o:p>=
</o:p></p>
<p class=3D"MsoNormal">|<o:p></o:p></p>
<p class=3D"MsoNormal">|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git config --g=
lobal --add safe.directory /ala-lpggp72/qichen/Yocto/builds/build-master/tm=
p/work/core2-64-poky-linux/gnulib/2018-03-07.03-r0/git<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I can see that we have already been trying to use th=
e GIT_CONFIG_PARAMETERS to solve this issue. Related changes are:<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#8220;&#8221;&#8221;<o:p></o:p></p>
<p class=3D"MsoNormal">+# Treat all directories are safe, as during fakeroo=
t tasks git will run as<o:p></o:p></p>
<p class=3D"MsoNormal">+# root so recent git releases (eg 2.30.3) will refu=
se to work on repositories. See<o:p></o:p></p>
<p class=3D"MsoNormal">+# <a href=3D"https://github.com/git/git/commit/8959=
555cee7ec045958f9b6dd62e541affb7e7d9">
https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb7e7d9<=
/a> for<o:p></o:p></p>
<p class=3D"MsoNormal">+# further details.<o:p></o:p></p>
<p class=3D"MsoNormal">+export GIT_CONFIG_PARAMETERS=3D&quot;'safe.director=
y=3D*'&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&#8220;&#8221;&#8221;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">However, following the link above and I can see that=
 the commit message says:<o:p></o:p></p>
<p class=3D"MsoNormal">&#8220;&#8221;&#8221;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; The `safe.directory` config setti=
ng is only respected in the system and<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; global configs, not from reposito=
ry configs or via the command-line, and<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:10.0pt">can have multiple value=
s to allow for multiple shared repositories.<o:p></o:p></p>
<p class=3D"MsoNormal">&#8220;&#8221;&#8221;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If I understand it correctly, this means that the co=
mmand line environment variables have no effect.<o:p></o:p></p>
<p class=3D"MsoNormal">Also, I figure if some user could set his/her own en=
vironment variable to bypass this security check, then this security check =
does not make much sense.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">So I think we should use the intercept script approa=
ch and add back the following line.<o:p></o:p></p>
<p class=3D"MsoNormal">PATH:prepend:task-install =3D &quot;${COREBASE}/scri=
pts/git-intercept:&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What do you think?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Qi<o:p></o:p></p>
</div>
</body>
</html>

--_000_CO6PR11MB5602F4C0C926F81D7092C5CBEDC59CO6PR11MB5602namp_--

