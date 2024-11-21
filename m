Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB7AD78799
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 17:17:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3869.1732209422240339476
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 09:17:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=105544ee82=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALA2SLb008878
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 09:17:01 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7ws9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 09:17:01 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4ALHCRA1024846
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 09:17:01 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2046.outbound.protection.outlook.com [104.47.56.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7ws9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 09:17:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIW3P/wtw3DPN6nb4ZbfIq1y4nw0FQu/7vDGsoXx6/S9ZkOni7VpsS7CJmB95eahOMU7SmGWQ0vEqKnq7JqfO+sH9foa0NAJlkNO4yjUl7d5vYCXjRN+t9sl8ow2QOGSPKlCE8k3HNh9QR3BghSGFWEOIS5cYneBTzKNDj7qQwMp0l/jaZZOXVXZMcqoEqFLopTuEfFR3QLAptk/M8lcFaZQuAE7zPrupBUU6eobSP0L8astsBPT060Z535jhntwWTq9KoDa4oFIRkpRMERi/HnWcu96tOBhrM0pQuq+ncvZRteEU+kSQhaAqJfWQYJp0MlGlfvqRz+YMKo2X6cGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhkUw0THQ8E+qBrdfdZCuwVngJzvNlI4sZ+Z2xRqEp4=;
 b=N67f3J/ZIZ8DY0Qkv5db6eTWkQzqJ/R8IN7Ia+/JaW6cyDDD+YQ8iAwMyma5pWbecILjhmafeAWusxrikpmxFeywHryHnlVEOg7z58tMzRnQfD842yA+XzxOfirOVyMNMVmntFy9jABMwJxaKJvMs6/jwhUOaWtm80ro5vJU4oiWDpm56lDzqI0n8AmcPFiMvhjYhs5HdJdOMwWSLhAsRk+kl6ZDz2wnMREGccI4pDFSIeiwxig+sjPsxWK6o8LhRFpR8Vp834RqiO7W9QYKtyD5ghubsHd09+CuKjXqNPcGiz0NkoZDyQRZjwR4BCCqanqXnD8uMBAeIISmHl+1Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SJ0PR11MB6766.namprd11.prod.outlook.com (2603:10b6:a03:47c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Thu, 21 Nov
 2024 17:16:56 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.8158.017; Thu, 21 Nov 2024
 17:16:56 +0000
From: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "JPEWhacker@gmail.com"
	<JPEWhacker@gmail.com>
Subject: Re: [oe-core][PATCH V2 1/3] sbom30/spdx30: add link prefix and name
 to namespace of spdxId and alias
Thread-Topic: [oe-core][PATCH V2 1/3] sbom30/spdx30: add link prefix and name
 to namespace of spdxId and alias
Thread-Index: AQHbOxAy8seauXM8iU61qFgu4tZhkrLB+9Qs
Date: Thu, 21 Nov 2024 17:16:56 +0000
Message-ID: 
 <PH7PR11MB76085F452AC5DFF28736B74994222@PH7PR11MB7608.namprd11.prod.outlook.com>
References: <20241120055036.1002075-1-hongxu.jia@windriver.com>
 <1809974167D85508.29057@lists.openembedded.org>
In-Reply-To: <1809974167D85508.29057@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7608:EE_|SJ0PR11MB6766:EE_
x-ms-office365-filtering-correlation-id: 156d1e00-7708-4d26-e986-08dd0a504d04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?8qSemI8I+/EjCtIx3bE+4bGbiq8PCgoO2tqWZuFGnJ836ozme+tbi7697S4v?=
 =?us-ascii?Q?sdrYoBrsNs+xR7Xf2hGW2d9OIiV/LOOM+3MO/P6Vplog85YxWncJp/ty+TVe?=
 =?us-ascii?Q?MS+5BEgfSgOSR33Pc6yoZFBSfSV23ecVRMkPIdzFLHIFh7cV90x7OVmJWQfN?=
 =?us-ascii?Q?kfknOPmLbb/44UoeNuhsSAnqYKK/SIjliwD+nFbOdPvpdZqgLz7vXhGrITZD?=
 =?us-ascii?Q?Z459V2txOesStihpKX6WoFnFGL78/a//+AazgpwyCpavztkKHvlY8wCJXq3U?=
 =?us-ascii?Q?NtlRUjm7NvllVA2EdWywGLUz0ayNCY+1i2c6Z4tzA53CiFzvzYQSM5oWAqVz?=
 =?us-ascii?Q?pPWqAWzHDZZtDodS81jJ2Ipt1vfBBF4orxmwUd4s0BC7SkfT41FbOzolnmRz?=
 =?us-ascii?Q?QKvkMEwBhPkC/8reklrAjPYZDI+zOV+KaP22dbWJWIm2cnH8BFmJMSHo5o1I?=
 =?us-ascii?Q?yupyLwnSv3wi3n0Jbep8GHqkPujlYJOttZ+rZPIE+zKswGGPYlnY1jGcPaCR?=
 =?us-ascii?Q?zxUdnRdl7T8ZrdRSygJVY+I9HzF5vN64Lfnztgq+xha/4fFuby3poLSjmOYR?=
 =?us-ascii?Q?i2K5GIMFeVDWi4AgOBVBjgSMK9Wbk9sZSxcs/b1T7rkbDkxWeNof8GKlN3wN?=
 =?us-ascii?Q?Hp6SSZA18M50p3b0GCV3bbNNP++RR01K+k7n2+VhT5t7hBIm99+d3giOL+hu?=
 =?us-ascii?Q?tjqLoJV+/0+qEp1qjGT8cpUq3Elfuyo6wPKbPKWhFh8sD5h+iEKLzhY16xHG?=
 =?us-ascii?Q?4TAJdc9gKBGASj1sVJaPK5trErHJLNN7maFGIgMgWD16LR8imsoyiqB4flwu?=
 =?us-ascii?Q?eIzn7vVS8kn+Qg+itXasLGaGoJms58pChyoI62yh0JsRqh2QJpeLAFUbPhNZ?=
 =?us-ascii?Q?DEiqqKJHjaS8qrzQ6KkwnMIYYTx3y6SrTYeYKX6RK3nd6IQUFehi/BSpHgar?=
 =?us-ascii?Q?wd6PyBIE/nt49hSsbB6s1dBXEjLo1tU4ZpIMw7DYbU+es6JcY6SpoqW1x0Vn?=
 =?us-ascii?Q?zbzvf6iZqgij3WkUi5PGYkjamVNJCfyUBQb9MJN0S+kWUYsYwHQNeHuAtLif?=
 =?us-ascii?Q?M6ZD2o7ea9xjy5VteXtGauhWppnioV0FLvjLYHyDD69WIrp9d7/AtEQieSRv?=
 =?us-ascii?Q?YVH/lA7ur98yOo7NR3t0rE9t+oxMGBGT0laN3fe/2WFAbg4ajy4sCpYc6By4?=
 =?us-ascii?Q?zjxOXajGWOsiD6EgPb9eU8+PdizFj476YLownMfULo2aeAi2lTN/4DrK7E/f?=
 =?us-ascii?Q?cC87WQhDZUslxS68MXpMi5ANimU6j4Z6jAQFfEseETkthBiDgLlbWGlq82eJ?=
 =?us-ascii?Q?4tBRnGROKbRdgiNq9KkQF+LvnyLOm9ya8eR6Bzky88zafQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?zRIpNOHyE8/y1cytehLFydKiXbHoGkadpGk8Kx1zMLHIS1FbVIo1vzNZQW84?=
 =?us-ascii?Q?QvHOHFpDU/VnkikVAM9mfbXgkPKEeLvicn35bmgRz7LcI3dXwSqUD3u+j85h?=
 =?us-ascii?Q?4ypubMiWJu37m+oK3LCtlMDoJPvjKJyhDGDiiejfRj3twhZwSlxHPPJbeb59?=
 =?us-ascii?Q?GPWOriiLW3elTHNrBjanius4CmKq8lVXNP4lA4zrC0u3BIHXCWD/usji3Mfm?=
 =?us-ascii?Q?eS3dUrPfdfhVGC4qxRu/usVH+Ou7rst4XTj3mQUvCxa8NvfM+yoG5PtitUV9?=
 =?us-ascii?Q?CW/v8Tdew892o7f2TK8zoAGAsulHAfrQ7ymBE0JhLRAWVQF2jODgj6ZlKBag?=
 =?us-ascii?Q?a5AK1uSSZ8tn9W/MdkmGcPTKZW8mEEP0cIiVkYv3HtDWHzTH31a2SwqbUG6q?=
 =?us-ascii?Q?XJYJa3VN6qKNVDFBpBKBKaZjW66sCGqmK9ebBTOgeGZA3GHgb2O2IWCKIpee?=
 =?us-ascii?Q?Os9CELi3Zs4KTY7cWQa1R3+B8tK3wqXcgU72SprrIXCNQo0s3fy3dqunyq7q?=
 =?us-ascii?Q?AkxxvRgZmmDy8oq7ZgqOSrOMwylYJpn1k4fSeWpCwpcdU8UrTTHJokuVzWlC?=
 =?us-ascii?Q?bIqsv2ZkEgUiMVzln2nSegdlTEzm96ohCtaBV2KlW/Oh/RvJR4RZ0X5JQkLs?=
 =?us-ascii?Q?wQVmH8toeqAwjQsw+1qfRGwKJGODxlbl/BOwV9Nst5JLbJvDWKxuO5ygwbGD?=
 =?us-ascii?Q?iyl3yroKKnwL8BfYZy3xqFGYgMDuiaSHJu0ew6LBCn7L4ynqYXuBScwRwUDC?=
 =?us-ascii?Q?absj/6tU4KbMxOlxMposFiatTL36iZzFpT1PCL6b+rMoGhDjEdc74o6I6izV?=
 =?us-ascii?Q?JfFu7n0a+DJSvXTRs5Rz3lq1EMfTQZi3lyitN6drYgoqKMxOlm7Q7f7VrKGQ?=
 =?us-ascii?Q?J6HDrjvTFM7IhnEtdD9x5Lz6nVKnUlmkdKOeLDYif4vzOfAWLkuB7q8PH96g?=
 =?us-ascii?Q?z8Bggs4NTZ1SIWLYZjr6JRMatzF40HxwuhzpfSffJKGxn7lFQLEU2/fwnEab?=
 =?us-ascii?Q?qla5koP2aMoHvKbcM2kR01Gp7DnAPatYBsmKgFDtxVvRd3WxKvXj8ZfK+mRb?=
 =?us-ascii?Q?Uw6OuWU7R33UWG4Cct9J/lkA5o48o6YGqhb+I2JjqM1Euowd/wKWIvnuV9sp?=
 =?us-ascii?Q?dieCpH8awql9p0mgeZkiTBBeEWeBcHsUys0zlQk4elX+uvp5/fidg81zbpv9?=
 =?us-ascii?Q?yTY5yGVg674c8SsNu0lcX8wUC4ak5TuQMft8csR/+gbmKKiEmRY+HFuapzYT?=
 =?us-ascii?Q?Bjsu29VFp2XkP00F5tqU+D0jbDXoe6eJvLhFvBQczVpD4lcyRBCkdkiWj0M+?=
 =?us-ascii?Q?AMeOmBYigQwSbSByVn1ZvEBjOa6aCXtytYlHjBtneGCEQfORZs2kLdFXuxTI?=
 =?us-ascii?Q?paHaq9tpxGKQhtJ60+3hhqCCd0liQP1upBFaqsbHsljE2TQtVxikgRU5o+12?=
 =?us-ascii?Q?g9SC7X2EPxpCfLOL+O2lkGMi5LHpOBx8qdQ8O+2NYiC+6A+rnv8bdV3QrRD8?=
 =?us-ascii?Q?Z47tHZewVE7/ZcZP9wLZEqdeycbihsb+TXdXKFL7FGPN9DK6GmykB2RC6B3j?=
 =?us-ascii?Q?R7FFrsseIf1aglRLPvu+C5c7xvKJBC/ZUO0IsUWH?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB76085F452AC5DFF28736B74994222PH7PR11MB7608namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156d1e00-7708-4d26-e986-08dd0a504d04
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 17:16:56.2176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7MAYKD9DM74tFxiO8qZFppBF9yk56/kPilgGvbB520D4XFAoSt6H6mQPXxlbl8f76VGPYIGlLmE9xoSdy4K05ctzi0Z7CEM4gj2EgySfBOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6766
X-Proofpoint-ORIG-GUID: t3wU1B-uF9DMCroF0JrEIrToIbaQf8FO
X-Proofpoint-GUID: SBkoA-L2X0vYiNUEox4FEwayQcCe2IEu
X-Authority-Analysis: v=2.4 cv=Sb6ldeRu c=1 sm=1 tr=0 ts=673f6b0d cx=c_pps a=SmJf4+RRogz8lGj/IwyRsg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=24AZYWMyAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=M7lxqswjPBWPblf4S0MA:9 a=CjuIK1q_8ugA:10 a=lOIBBAcPV6fvrrbqnVMA:9 a=YlsP-J2ZHypDGNjx:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=bG88sKzkDEFeXWNnvthB:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_11,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411210131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 17:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207552

--_000_PH7PR11MB76085F452AC5DFF28736B74994222PH7PR11MB7608namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping Joshua

//Hongxu
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of hongxu via lists.openembedded.org <hongxu.jia=
=3Deng.windriver.com@lists.openembedded.org>
Sent: Wednesday, November 20, 2024 1:50 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; JPEWhacker@gmail.com <JPEWhacker@gmail.com>; Jia, Hongxu <Hon=
gxu.Jia@windriver.com>
Subject: [oe-core][PATCH V2 1/3] sbom30/spdx30: add link prefix and name to=
 namespace of spdxId and alias

In order to simple reference the SPDX ID to instead of making jsonld hash
path for each element, only creating one symlink for one file and referenci=
ng
it multiple times, add link prefix and name to the namespace of spdxId and =
alias
to replace ${PN} to avoid namespace conflict between recipe, packages and i=
mages.

Take recipe shadow, package shadow and package shadow-src for example:
Without this commit, spdxId and alias in recipe and package jsonld have the=
 same
namespace

    spdxId: http://spdx.org/spdxdocs/shadow-xxx/...
    alias: shadow/UNIHASH/...

After apply this commit, the namespace of spdxId in recipe and package json=
ld differs:
In recipe jsonld tmp/deploy/spdx/3.0.1/core2-64/recipes/shadow.spdx.json

    spdxId: http://spdx.org/spdxdocs/recipe-shadow-xxx/...
    alias: recipe-shadow/UNIHASH/...

In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow.spdx.json

    spdxId: http://spdx.org/spdxdocs/package-shadow-xxx/...
    alias: package-shadow/UNIHASH/...

In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow-src.spdx.j=
son

    spdxId: http://spdx.org/spdxdocs/package-shadow-src-xxx/...
    alias: package-shadow-src/UNIHASH/...

Then will use namespace of spdxId and alias to create link for jsonld file,
one symlink for one jsonld file, referenced by elements multiple times

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sbom30.py       | 27 +++++++++++++++++----------
 meta/lib/oe/spdx30_tasks.py | 13 +++++++------
 2 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index e3a9428668..7033bcdf5b 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -217,9 +217,11 @@ def to_list(l):


 class ObjectSet(oe.spdx30.SHACLObjectSet):
-    def __init__(self, d):
+    def __init__(self, d, name=3DNone, link_prefix=3DNone):
         super().__init__()
         self.d =3D d
+        self.name =3D name
+        self.link_prefix =3D link_prefix

     def create_index(self):
         self.by_sha256_hash =3D {}
@@ -322,6 +324,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             uuid.NAMESPACE_DNS, self.d.getVar("SPDX_UUID_NAMESPACE")
         )
         pn =3D self.d.getVar("PN")
+        if self.link_prefix and self.name:
+            pn =3D "%s-%s" % (self.link_prefix, self.name)
         return "%s/%s-%s" % (
             self.d.getVar("SPDX_NAMESPACE_PREFIX"),
             pn,
@@ -341,10 +345,13 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             elif namespace not in e._id:
                 bb.warn(f"Namespace {namespace} not found in {e._id}")
             else:
+                pn =3D self.d.getVar("PN")
+                if self.link_prefix and self.name:
+                    pn =3D "%s-%s" % (self.link_prefix, self.name)
                 alias_ext =3D set_alias(
                     e,
                     e._id.replace(unihash, "UNIHASH").replace(
-                        namespace, self.d.getVar("PN")
+                        namespace, pn
                     ),
                 )

@@ -803,8 +810,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         )

     @classmethod
-    def new_objset(cls, d, name, copy_from_bitbake_doc=3DTrue):
-        objset =3D cls(d)
+    def new_objset(cls, d, name, copy_from_bitbake_doc=3DTrue, link_prefix=
=3DNone):
+        objset =3D cls(d, name=3Dname, link_prefix=3Dlink_prefix)

         document =3D oe.spdx30.SpdxDocument(
             _id=3Dobjset.new_spdxid("document", name),
@@ -885,9 +892,9 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         return missing_spdxids


-def load_jsonld(d, path, required=3DFalse):
+def load_jsonld(d, path, required=3DFalse, name=3DNone, link_prefix=3DNone=
):
     deserializer =3D oe.spdx30.JSONLDDeserializer()
-    objset =3D ObjectSet(d)
+    objset =3D ObjectSet(d, name=3Dname, link_prefix=3Dlink_prefix)
     try:
         with path.open("rb") as f:
             deserializer.read(f, objset)
@@ -916,9 +923,9 @@ def jsonld_hash_path(_id):
     return Path("by-spdxid-hash") / h[:2], h


-def load_jsonld_by_arch(d, arch, subdir, name, *, required=3DFalse):
+def load_jsonld_by_arch(d, arch, subdir, name, *, required=3DFalse, link_p=
refix=3DNone):
     path =3D jsonld_arch_path(d, arch, subdir, name)
-    objset =3D load_jsonld(d, path, required=3Drequired)
+    objset =3D load_jsonld(d, path, required=3Drequired, name=3Dname, link=
_prefix=3Dlink_prefix)
     if objset is not None:
         return (objset, path)
     return (None, None)
@@ -1047,8 +1054,8 @@ def find_root_obj_in_jsonld(d, subdir, fn_name, obj_t=
ype, **attr_filter):
     return spdx_obj, objset


-def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, **attr_filter):
-    objset, fn =3D load_jsonld_by_arch(d, arch, subdir, fn_name, required=
=3DTrue)
+def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, link_prefix=3DN=
one, **attr_filter):
+    objset, fn =3D load_jsonld_by_arch(d, arch, subdir, fn_name, required=
=3DTrue, link_prefix=3Dlink_prefix)

     spdx_obj =3D objset.find_filter(obj_type, **attr_filter)
     if not spdx_obj:
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 5aeed5cd6f..ef829fbbf1 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -461,7 +461,7 @@ def create_spdx(d):
     if not include_vex in ("none", "current", "all"):
         bb.fatal("SPDX_INCLUDE_VEX must be one of 'none', 'current', 'all'=
")

-    build_objset =3D oe.sbom30.ObjectSet.new_objset(d, d.getVar("PN"))
+    build_objset =3D oe.sbom30.ObjectSet.new_objset(d, d.getVar("PN"), lin=
k_prefix=3D"recipe")

     build =3D build_objset.new_task_build("recipe", "recipe")
     build_objset.set_element_alias(build)
@@ -574,7 +574,7 @@ def create_spdx(d):

             bb.debug(1, "Creating SPDX for package %s" % pkg_name)

-            pkg_objset =3D oe.sbom30.ObjectSet.new_objset(d, pkg_name)
+            pkg_objset =3D oe.sbom30.ObjectSet.new_objset(d, pkg_name, lin=
k_prefix=3D"package")

             spdx_package =3D pkg_objset.add_root(
                 oe.spdx30.software_Package(
@@ -793,7 +793,7 @@ def create_package_spdx(d):
     # Any element common to all packages that need to be referenced by ID
     # should be written into this objset set
     common_objset =3D oe.sbom30.ObjectSet.new_objset(
-        d, "%s-package-common" % d.getVar("PN")
+        d, "%s-package-common" % d.getVar("PN"), link_prefix=3D"package"
     )

     pkgdest =3D Path(d.getVar("PKGDEST"))
@@ -812,6 +812,7 @@ def create_package_spdx(d):
             "packages-staging",
             pkg_name,
             oe.spdx30.software_Package,
+            link_prefix=3D"package",
             software_primaryPurpose=3Doe.spdx30.software_SoftwarePurpose.i=
nstall,
         )

@@ -1002,7 +1003,7 @@ def create_rootfs_spdx(d):
     with root_packages_file.open("r") as f:
         packages =3D json.load(f)

-    objset =3D oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_basename=
, machine))
+    objset =3D oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_basename=
, machine), link_prefix=3D"rootfs")

     rootfs =3D objset.add_root(
         oe.spdx30.software_Package(
@@ -1037,7 +1038,7 @@ def create_image_spdx(d):
     image_basename =3D d.getVar("IMAGE_BASENAME")
     machine =3D d.getVar("MACHINE")

-    objset =3D oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_basename=
, machine))
+    objset =3D oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_basename=
, machine), link_prefix=3D"image")

     with manifest_path.open("r") as f:
         manifest =3D json.load(f)
@@ -1150,7 +1151,7 @@ def sdk_create_spdx(d, sdk_type, spdx_work_dir, toolc=
hain_outputname):
     sdk_name =3D toolchain_outputname + "-" + sdk_type
     sdk_packages =3D oe.sdk.sdk_list_installed_packages(d, sdk_type =3D=3D=
 "target")

-    objset =3D oe.sbom30.ObjectSet.new_objset(d, sdk_name)
+    objset =3D oe.sbom30.ObjectSet.new_objset(d, sdk_name, link_prefix=3D"=
sdk")

     sdk_rootfs =3D objset.add_root(
         oe.spdx30.software_Package(
--
2.25.1


--_000_PH7PR11MB76085F452AC5DFF28736B74994222PH7PR11MB7608namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Ping Joshua</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
//Hongxu</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of hongxu via lists.openembedded.org &lt;hongxu.jia=3Deng.windriver.com=
@lists.openembedded.org&gt;<br>
<b>Sent:</b> Wednesday, November 20, 2024 1:50 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; JPEWhacker@gmail.com &lt;JPEWhacker@gmail.com&gt=
;; Jia, Hongxu &lt;Hongxu.Jia@windriver.com&gt;<br>
<b>Subject:</b> [oe-core][PATCH V2 1/3] sbom30/spdx30: add link prefix and =
name to namespace of spdxId and alias</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">In order to simple reference the SPDX ID to instea=
d of making jsonld hash<br>
path for each element, only creating one symlink for one file and referenci=
ng<br>
it multiple times, add link prefix and name to the namespace of spdxId and =
alias<br>
to replace ${PN} to avoid namespace conflict between recipe, packages and i=
mages.<br>
<br>
Take recipe shadow, package shadow and package shadow-src for example:<br>
Without this commit, spdxId and alias in recipe and package jsonld have the=
 same<br>
namespace<br>
<br>
&nbsp;&nbsp;&nbsp; spdxId: <a href=3D"http://spdx.org/spdxdocs/shadow-xxx/"=
>http://spdx.org/spdxdocs/shadow-xxx/</a>...<br>
&nbsp;&nbsp;&nbsp; alias: shadow/UNIHASH/...<br>
<br>
After apply this commit, the namespace of spdxId in recipe and package json=
ld differs:<br>
In recipe jsonld tmp/deploy/spdx/3.0.1/core2-64/recipes/shadow.spdx.json<br=
>
<br>
&nbsp;&nbsp;&nbsp; spdxId: <a href=3D"http://spdx.org/spdxdocs/recipe-shado=
w-xxx/">http://spdx.org/spdxdocs/recipe-shadow-xxx/</a>...<br>
&nbsp;&nbsp;&nbsp; alias: recipe-shadow/UNIHASH/...<br>
<br>
In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow.spdx.json<=
br>
<br>
&nbsp;&nbsp;&nbsp; spdxId: <a href=3D"http://spdx.org/spdxdocs/package-shad=
ow-xxx/">http://spdx.org/spdxdocs/package-shadow-xxx/</a>...<br>
&nbsp;&nbsp;&nbsp; alias: package-shadow/UNIHASH/...<br>
<br>
In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow-src.spdx.j=
son<br>
<br>
&nbsp;&nbsp;&nbsp; spdxId: <a href=3D"http://spdx.org/spdxdocs/package-shad=
ow-src-xxx/">http://spdx.org/spdxdocs/package-shadow-src-xxx/</a>...<br>
&nbsp;&nbsp;&nbsp; alias: package-shadow-src/UNIHASH/...<br>
<br>
Then will use namespace of spdxId and alias to create link for jsonld file,=
<br>
one symlink for one jsonld file, referenced by elements multiple times<br>
<br>
Signed-off-by: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
---<br>
&nbsp;meta/lib/oe/sbom30.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 27 ++++++=
+++++++++++----------<br>
&nbsp;meta/lib/oe/spdx30_tasks.py | 13 +++++++------<br>
&nbsp;2 files changed, 24 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py<br>
index e3a9428668..7033bcdf5b 100644<br>
--- a/meta/lib/oe/sbom30.py<br>
+++ b/meta/lib/oe/sbom30.py<br>
@@ -217,9 +217,11 @@ def to_list(l):<br>
&nbsp;<br>
&nbsp;<br>
&nbsp;class ObjectSet(oe.spdx30.SHACLObjectSet):<br>
-&nbsp;&nbsp;&nbsp; def __init__(self, d):<br>
+&nbsp;&nbsp;&nbsp; def __init__(self, d, name=3DNone, link_prefix=3DNone):=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; super().__init__()<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.d =3D d<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.name =3D name<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.link_prefix =3D link_prefi=
x<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; def create_index(self):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.by_sha256_hash =3D {}=
<br>
@@ -322,6 +324,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uu=
id.NAMESPACE_DNS, self.d.getVar(&quot;SPDX_UUID_NAMESPACE&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pn =3D self.d.getVar(&quot=
;PN&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if self.link_prefix and self.na=
me:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pn =3D =
&quot;%s-%s&quot; % (self.link_prefix, self.name)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;%s/%s-%s&quot=
; % (<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; se=
lf.d.getVar(&quot;SPDX_NAMESPACE_PREFIX&quot;),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pn=
,<br>
@@ -341,10 +345,13 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; el=
if namespace not in e._id:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; bb.warn(f&quot;Namespace {namespace} not found in {e.=
_id}&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; el=
se:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; pn =3D self.d.getVar(&quot;PN&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if self.link_prefix and self.name:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pn =3D &quot;%s-%s&quot; % (self.l=
ink_prefix, self.name)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; alias_ext =3D set_alias(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e._id.replace(unihash, &quot;=
UNIHASH&quot;).replace(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; namespace,=
 self.d.getVar(&quot;PN&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; namespace,=
 pn<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; )<br>
&nbsp;<br>
@@ -803,8 +810,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; @classmethod<br>
-&nbsp;&nbsp;&nbsp; def new_objset(cls, d, name, copy_from_bitbake_doc=3DTr=
ue):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; objset =3D cls(d)<br>
+&nbsp;&nbsp;&nbsp; def new_objset(cls, d, name, copy_from_bitbake_doc=3DTr=
ue, link_prefix=3DNone):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; objset =3D cls(d, name=3Dname, =
link_prefix=3Dlink_prefix)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; document =3D oe.spdx30.Spd=
xDocument(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _i=
d=3Dobjset.new_spdxid(&quot;document&quot;, name),<br>
@@ -885,9 +892,9 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return missing_spdxids<br>
&nbsp;<br>
&nbsp;<br>
-def load_jsonld(d, path, required=3DFalse):<br>
+def load_jsonld(d, path, required=3DFalse, name=3DNone, link_prefix=3DNone=
):<br>
&nbsp;&nbsp;&nbsp;&nbsp; deserializer =3D oe.spdx30.JSONLDDeserializer()<br=
>
-&nbsp;&nbsp;&nbsp; objset =3D ObjectSet(d)<br>
+&nbsp;&nbsp;&nbsp; objset =3D ObjectSet(d, name=3Dname, link_prefix=3Dlink=
_prefix)<br>
&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with path.open(&quot;rb&qu=
ot;) as f:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; de=
serializer.read(f, objset)<br>
@@ -916,9 +923,9 @@ def jsonld_hash_path(_id):<br>
&nbsp;&nbsp;&nbsp;&nbsp; return Path(&quot;by-spdxid-hash&quot;) / h[:2], h=
<br>
&nbsp;<br>
&nbsp;<br>
-def load_jsonld_by_arch(d, arch, subdir, name, *, required=3DFalse):<br>
+def load_jsonld_by_arch(d, arch, subdir, name, *, required=3DFalse, link_p=
refix=3DNone):<br>
&nbsp;&nbsp;&nbsp;&nbsp; path =3D jsonld_arch_path(d, arch, subdir, name)<b=
r>
-&nbsp;&nbsp;&nbsp; objset =3D load_jsonld(d, path, required=3Drequired)<br=
>
+&nbsp;&nbsp;&nbsp; objset =3D load_jsonld(d, path, required=3Drequired, na=
me=3Dname, link_prefix=3Dlink_prefix)<br>
&nbsp;&nbsp;&nbsp;&nbsp; if objset is not None:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (objset, path)<br>
&nbsp;&nbsp;&nbsp;&nbsp; return (None, None)<br>
@@ -1047,8 +1054,8 @@ def find_root_obj_in_jsonld(d, subdir, fn_name, obj_t=
ype, **attr_filter):<br>
&nbsp;&nbsp;&nbsp;&nbsp; return spdx_obj, objset<br>
&nbsp;<br>
&nbsp;<br>
-def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, **attr_filter):=
<br>
-&nbsp;&nbsp;&nbsp; objset, fn =3D load_jsonld_by_arch(d, arch, subdir, fn_=
name, required=3DTrue)<br>
+def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, link_prefix=3DN=
one, **attr_filter):<br>
+&nbsp;&nbsp;&nbsp; objset, fn =3D load_jsonld_by_arch(d, arch, subdir, fn_=
name, required=3DTrue, link_prefix=3Dlink_prefix)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; spdx_obj =3D objset.find_filter(obj_type, **attr_f=
ilter)<br>
&nbsp;&nbsp;&nbsp;&nbsp; if not spdx_obj:<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index 5aeed5cd6f..ef829fbbf1 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -461,7 +461,7 @@ def create_spdx(d):<br>
&nbsp;&nbsp;&nbsp;&nbsp; if not include_vex in (&quot;none&quot;, &quot;cur=
rent&quot;, &quot;all&quot;):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.fatal(&quot;SPDX_INCLUD=
E_VEX must be one of 'none', 'current', 'all'&quot;)<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; build_objset =3D oe.sbom30.ObjectSet.new_objset(d, d.ge=
tVar(&quot;PN&quot;))<br>
+&nbsp;&nbsp;&nbsp; build_objset =3D oe.sbom30.ObjectSet.new_objset(d, d.ge=
tVar(&quot;PN&quot;), link_prefix=3D&quot;recipe&quot;)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; build =3D build_objset.new_task_build(&quot;recipe=
&quot;, &quot;recipe&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp; build_objset.set_element_alias(build)<br>
@@ -574,7 +574,7 @@ def create_spdx(d):<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb=
.debug(1, &quot;Creating SPDX for package %s&quot; % pkg_name)<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg_obj=
set =3D oe.sbom30.ObjectSet.new_objset(d, pkg_name)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg_obj=
set =3D oe.sbom30.ObjectSet.new_objset(d, pkg_name, link_prefix=3D&quot;pac=
kage&quot;)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sp=
dx_package =3D pkg_objset.add_root(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; oe.spdx30.software_Package(<br>
@@ -793,7 +793,7 @@ def create_package_spdx(d):<br>
&nbsp;&nbsp;&nbsp;&nbsp; # Any element common to all packages that need to =
be referenced by ID<br>
&nbsp;&nbsp;&nbsp;&nbsp; # should be written into this objset set<br>
&nbsp;&nbsp;&nbsp;&nbsp; common_objset =3D oe.sbom30.ObjectSet.new_objset(<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d, &quot;%s-package-common&quot=
; % d.getVar(&quot;PN&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d, &quot;%s-package-common&quot=
; % d.getVar(&quot;PN&quot;), link_prefix=3D&quot;package&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp; )<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; pkgdest =3D Path(d.getVar(&quot;PKGDEST&quot;))<br=
>
@@ -812,6 +812,7 @@ def create_package_spdx(d):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;packages-staging&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pk=
g_name,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe=
.spdx30.software_Package,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; link_pr=
efix=3D&quot;package&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; so=
ftware_primaryPurpose=3Doe.spdx30.software_SoftwarePurpose.install,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
&nbsp;<br>
@@ -1002,7 +1003,7 @@ def create_rootfs_spdx(d):<br>
&nbsp;&nbsp;&nbsp;&nbsp; with root_packages_file.open(&quot;r&quot;) as f:<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; packages =3D json.load(f)<=
br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; objset =3D oe.sbom30.ObjectSet.new_objset(d, &quot;%s-%=
s&quot; % (image_basename, machine))<br>
+&nbsp;&nbsp;&nbsp; objset =3D oe.sbom30.ObjectSet.new_objset(d, &quot;%s-%=
s&quot; % (image_basename, machine), link_prefix=3D&quot;rootfs&quot;)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; rootfs =3D objset.add_root(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe.spdx30.software_Package=
(<br>
@@ -1037,7 +1038,7 @@ def create_image_spdx(d):<br>
&nbsp;&nbsp;&nbsp;&nbsp; image_basename =3D d.getVar(&quot;IMAGE_BASENAME&q=
uot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp; machine =3D d.getVar(&quot;MACHINE&quot;)<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; objset =3D oe.sbom30.ObjectSet.new_objset(d, &quot;%s-%=
s&quot; % (image_basename, machine))<br>
+&nbsp;&nbsp;&nbsp; objset =3D oe.sbom30.ObjectSet.new_objset(d, &quot;%s-%=
s&quot; % (image_basename, machine), link_prefix=3D&quot;image&quot;)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; with manifest_path.open(&quot;r&quot;) as f:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; manifest =3D json.load(f)<=
br>
@@ -1150,7 +1151,7 @@ def sdk_create_spdx(d, sdk_type, spdx_work_dir, toolc=
hain_outputname):<br>
&nbsp;&nbsp;&nbsp;&nbsp; sdk_name =3D toolchain_outputname + &quot;-&quot; =
+ sdk_type<br>
&nbsp;&nbsp;&nbsp;&nbsp; sdk_packages =3D oe.sdk.sdk_list_installed_package=
s(d, sdk_type =3D=3D &quot;target&quot;)<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp; objset =3D oe.sbom30.ObjectSet.new_objset(d, sdk_name)<=
br>
+&nbsp;&nbsp;&nbsp; objset =3D oe.sbom30.ObjectSet.new_objset(d, sdk_name, =
link_prefix=3D&quot;sdk&quot;)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; sdk_rootfs =3D objset.add_root(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe.spdx30.software_Package=
(<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH7PR11MB76085F452AC5DFF28736B74994222PH7PR11MB7608namp_--

