Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F448C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 17:45:44 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web09.35275.1641836743101187891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 09:45:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=TCD6Xf4S;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=800905d1e4=chaitanya.vadrevu@ni.com)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20A6RHlG010815;
	Mon, 10 Jan 2022 11:45:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS11062020;
 bh=A3GpX1WReGDHsGnO6BKW0nGDiS1oZME7ilVwXJYeExM=;
 b=TCD6Xf4Szd9Pep441469xU7Mf3mnqlLLLXIjqb1xfnLQ4evVFhn5/SzPnBSUw89zXrtk
 xH4P+h+dZ/ZncLuAwYrZ4FsHIqsEpD1l0L2iq85e5YZshw9a1ssIu9DLcjulyA408rfL
 S2MgNYUyUF3b6xBmTw9j+zrJS/7Tftv+X5QjCGJu8QMhZjFhILk4qBkIJxLpmn5V5Hll
 3nlx4Ll6Z7MbSz/YPbS24FqtKh5zZuavEmrBNHa4Xmdn/DbPYmjfLZ+FnmDVSQIu9zvM
 O9z5ko/3Mu7ZBDA7hOe4Ncu14ZAEXZjsr/W8dsfGfv4wSI/y8CTbf/YGHIUj9tTrSZ83 uA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3dgfhkgv6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jan 2022 11:45:40 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWKwb92dth1wxOoBpXM0ZqtTC+OM5BoOjfo5TZqbksUxPOtvQpwd3UDSqBORHnoxjzcvPlKAxFlfMXR9925q/qNkBn9NrtW1b9ZxhBzC+mT2zDRWWACghkQlxs/25JrbewAor9JL+rfo2+ms9QyGofRZD1PqfzQixiGHXOOkPOpZMzbJ+ngb50wbfRF6+vc8t5/tw3acjLPFaDhBCR9tRvH5+9WuFb7ATVwdVpd+nTJsJuLBZaiZBUOJEoOVl6Ku29ayrSu9OTVkKsFeqgCtYs9R/XJRAm+r7Ja2lO2deNMlkA2sbKK3u+Ow4VVS8HjBmDlvUsBLZ1eQ+wx5BCHMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3GpX1WReGDHsGnO6BKW0nGDiS1oZME7ilVwXJYeExM=;
 b=GR6OLUoM7FjNq33t8yAldHmnOCfsnZwEn/uCvFPZepoQO6idUaorbAXrEg5iIzhVDbt/zS4uHdsWEOA27flxx586B+apgXkAafkSjqiZKUfxcquW3qVgVYdV/uJpuiCMVg+iuxF9fCCmHafjzw+gjjT7T519k/a9W8n9bX3n8lDg6IlD/hyqcjPN8i2fWO2n++M9WXOghdQf3oLEiJPogbUEgF6n4IrusJ9wEv1syONG+SJsj+V4m7wBgDy8p9TEkkkpj1E/iRyOZM32u0wkKzhT1CAjUK0la1/DQvpJjGdUDbYBxTOAckJEVUgMhDypHp2FoRiw81u7RMuQduc2PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3GpX1WReGDHsGnO6BKW0nGDiS1oZME7ilVwXJYeExM=;
 b=nj4dNlJ0A72iXJIeSPnDNQ5S2jCGKzS3xVkq1dP1F8PF21BLpy/GFEgk43fx2bVhDsv8UP6iI9xLegZdL/QR5v8+E8SXiwia/mMPAKTwArucoqu3jBB8pFawLHflTyCaw6RQewyw6tdtAYRDK5S+UDlCCjrU12uf2R+qY/j+Swk=
Received: from SJ0PR04MB7277.namprd04.prod.outlook.com (2603:10b6:a03:29d::6)
 by BYAPR04MB5079.namprd04.prod.outlook.com (2603:10b6:a03:44::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 17:45:39 +0000
Received: from SJ0PR04MB7277.namprd04.prod.outlook.com
 ([fe80::757b:42ac:520e:bd46]) by SJ0PR04MB7277.namprd04.prod.outlook.com
 ([fe80::757b:42ac:520e:bd46%9]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 17:45:38 +0000
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "anuj.mittal@intel.com"
	<anuj.mittal@intel.com>
Subject: Re: [hardknott][PATCH] python3-pyelftools: Depend on debugger, pprint
Thread-Topic: [hardknott][PATCH] python3-pyelftools: Depend on debugger,
 pprint
Thread-Index: AQHX8tpwavqIx9MsuUy9qvOjE0mgaaxcqYqN
Date: Mon, 10 Jan 2022 17:45:38 +0000
Message-ID: 
 <SJ0PR04MB727722D45724B650A6246D869B509@SJ0PR04MB7277.namprd04.prod.outlook.com>
References: <20211217000952.7580-1-chaitanya.vadrevu@ni.com>
In-Reply-To: <20211217000952.7580-1-chaitanya.vadrevu@ni.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Enabled=True;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SiteId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SetDate=2022-01-10T17:29:30.1288414Z;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_ContentBits=0;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Method=Standard
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d523750a-152e-46b7-c33e-08d9d461039d
x-ms-traffictypediagnostic: BYAPR04MB5079:EE_
x-microsoft-antispam-prvs: 
 <BYAPR04MB50792838A01C73C8B8DA6C1E9B509@BYAPR04MB5079.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KyfjGldWG90gxqzNTWub9iCu0i81f6vXqS6qA7lZnQCIoIYMHD9Kwt+4t/hdARDOsPOexLJUrHV6+/YD3fDNlzsi1mIpoCx5cqtNGes/t4fyDe4d1KVZ8rhAqcsqOIYG4pX1eqOpPtkrpzfUkQWUdM1+AnUkOzT9Ryc9RbAZq0iex5khJkjeoAW5aaVsT0Spmbc1S8+TfP0fYenu+nBXgqg7+m5qV6oKHdLtXO/fJst6aSzR7OQe7oLNFqdgCCkTjI+JTfswAZHHfGFQIJV/5jBON8tKcddHXcpOvMJdIGWzxDQSW0lcR3UQezFoPApt6mujeAQLQm2h0WtAtPqarTTdPJ2ynyf48CqmhSpWxv4T4mRocNHTIIxDryb1AGBhU3UD4xUa2lmTL9AOXUXyHtyXC9izW3u1sV+DJCULvUERrlkuvQtyHZCYWXEd7mgAQSh+OWOU5Gu2Vqq0kwgU6gXS8v9x8DoaJrNIp5r85LHEMPn4dcMluOEB/v/lvvJlVRIjXyMU2rdKgxoPKD7epHl1el5wxj+S21qbUzgkf8dDNnW/CCu0gxZTTaP1P16xZLOycaDfP+qiuMHxb47h/1bMxscUXBiQpFdHKxifBHlOClrKim92UXva/Q4Nzu6hk2YEPmtYLGyH5KaKi4tf2etLeIGDPmzpMx6fM/b721lU/0LBHLJVYirqLkU6brfnBto74KkHk4a0RVM0+VK5sg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR04MB7277.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(76116006)(86362001)(55016003)(122000001)(38100700002)(33656002)(316002)(71200400001)(91956017)(66476007)(64756008)(53546011)(6506007)(66446008)(7696005)(66946007)(66556008)(9686003)(8676002)(8936002)(186003)(5660300002)(508600001)(52536014)(38070700005)(26005)(110136005)(2906002)(44832011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?kS1JP5pp1nT+E0vqXD2r2HVrkRS6aWzmcd9y40sBRYgc38Gdr41cPN7Z?=
 =?Windows-1252?Q?xGv3TrX5XF9ckTPYOFfOQvdLYQD+JtkqRYCeFvuaCwQFT+cZeKquqOpc?=
 =?Windows-1252?Q?Psvah+4iYjjd6YuDitrytuXomOTBwSKTy4wEXKFHJpWNTNNzt7ZN7W46?=
 =?Windows-1252?Q?BNTRXcLCb8tboxjT8FeZqjK1F4VWgPb6LaR94FWgAyM4Ys3qSxhEl0Z8?=
 =?Windows-1252?Q?/JA+R/USlhj0gkbVkMvGpgiFwuc+FITkAt3Um+nvH2I6nyXVGKKchnTO?=
 =?Windows-1252?Q?Tz4Zbg7VZk9FEat/TYTMM7Cn9UtWMLU3H12NynVhraEz5yMRQbTWP5cM?=
 =?Windows-1252?Q?hRO6Mn4VqzrOeaWi5nASU/aQyXlR9yMGl1+3i3NOPQw+VlZ3dkRI44jV?=
 =?Windows-1252?Q?XOAQ6+wsz/tdT38R8AnjPi/hy+rgy2MRmvKBN+HeW+r/SQ+hzy1Uoyfg?=
 =?Windows-1252?Q?HDyLYvDXCddl21u8mhsb2URpaqoM/kvfaRnHtRsb0GHOy6NZo/1MpQf5?=
 =?Windows-1252?Q?bOBi2MHoCZ/D93nAMmht8NJ/Jclq2S6r0HoWrpSVhcecp+HwR6fDKgHI?=
 =?Windows-1252?Q?Z8vTxn5n3d4VsY4J+ANQv7MdyQe25GT5NVyNvmW2edLMOISmLGovAOKf?=
 =?Windows-1252?Q?pLuD82ZwvhEZUQpnDPbHsc+Gt/ULhlKQBLymZ+4bMbOtYdmjyIVhUABn?=
 =?Windows-1252?Q?pgLaaIimqosuO0Htr1fqjnp+ntTSPSiYa8jKse9Wpydw3Q9pv6kPY4dd?=
 =?Windows-1252?Q?KW0cfO5E/SoBnWIO0Mca5SJBCea6l08fS6Z5DZhwcoddoAZNamyuWUbA?=
 =?Windows-1252?Q?UvAJlkW1QvjBKeNGpG6/UBDQ8u3f8zRPGyFc4/Ri4ejAoJWOOQgwW1/k?=
 =?Windows-1252?Q?6AzTRRaqN0eFfck++2s8z0WuCtIlBPnBZpHxct5TQMtJz1RyypXo8bS/?=
 =?Windows-1252?Q?e+iXA9Tq/uGfSOnYXTZiZ3u/OH/D0XvZ060xrWom8vKDfwfXTklPKd6p?=
 =?Windows-1252?Q?9In4Mcmkw27PZVmcz2FhkoQmWwmX5A8FRFLE9O73zLshdiwbkWHKwjBq?=
 =?Windows-1252?Q?2aGDYKwwmxZyLVppoT3buE6dKBKP2A1wF7YCCPsL9tQey0Su/qdCSuw7?=
 =?Windows-1252?Q?HwKGODIKC+eQxs2XRMSv2WBndpQBrdu49oI/aOfDSBlcSVU2Hz8kw4JK?=
 =?Windows-1252?Q?iJmD+VEBpsYPoOu4R42ruvVT9y5xSwe0HkNiqjYKbcAeAkBKstMheBf8?=
 =?Windows-1252?Q?/yZrKe8xGYxqKjD5lH8T2FVS6AIsej4wgWbaCXwHX5fqmyt6J7PqNaiz?=
 =?Windows-1252?Q?KltG3GD21w31wQWvA6Cr+FSGwSu2BRWaY9mrNzyjd7wO0X1/q+IgO75Z?=
 =?Windows-1252?Q?xTfftUOvwOFDrn7YFBhYoxVTs5HLn3K5DUuYM5faujs/x0DqUT+5vSul?=
 =?Windows-1252?Q?QCPcr4yXqv84t9A2R4xKJkzSqXrGjFNh4IAuBfZhYdMgPHdH/ffQ9gDG?=
 =?Windows-1252?Q?b74E7KcP6HQZU9R+JycuztLjPyJwgNnPV9fY1eWXdpzg1PtNL+Fvkmz+?=
 =?Windows-1252?Q?a1Dxqie7V/4oq1jPtGi96YaSHKY3zv14SGl+XXYoxHxtnrDW9e0yQ+G7?=
 =?Windows-1252?Q?gN/nFbMvRdEhipa/i9WeRTAUYEVMLAhV2TNw7j7DN+pXBh3+YN0JFJag?=
 =?Windows-1252?Q?oDr0g7cgErM4o6vCu2r+ADXIxeNZ+WRaPjaYev6W1yQPnEgUMfNkcY6c?=
 =?Windows-1252?Q?3CXJLIVTQNxkkPtY93utTdZdDNuNf40t09RmSa8bEUDu5O+mHZIJ0L8U?=
 =?Windows-1252?Q?aNj9ZoDWlnUYERedRx2MPHJnE54=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR04MB727722D45724B650A6246D869B509SJ0PR04MB7277namp_"
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7277.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d523750a-152e-46b7-c33e-08d9d461039d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 17:45:38.5629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 g54/jMtIQVl8R7HDEmeBtb9HGpvCfZZwbExSGTMPXAbkzC8FIjG51b8D/hJwx9Sj+d1pZrcshmUKfyfjZ05pciETorfTsYeYgo1FHlb6a9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5079
X-Proofpoint-GUID: HOsE9a9P77kozje4ohW726MWjDECv88U
X-Proofpoint-ORIG-GUID: HOsE9a9P77kozje4ohW726MWjDECv88U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_07,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1011 spamscore=0 adultscore=0 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201100121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 17:45:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160372

--_000_SJ0PR04MB727722D45724B650A6246D869B509SJ0PR04MB7277namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

It appears that on the hardknott branch, instead of this patch a correspond=
ing patch from master branch was cherry-picked.

The override separator is different between master and hardknott branches =
=96 on hardknott it should be =93RDEPENDS_=94 instead of =93RDEPENDS:=94. T=
his patch uses the correct separator for hardknott.

Can the cherry-picked commit (66211fa) be reverted on hardknott and this pa=
tch applied instead?

Thanks,
Chaitanya

From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Date: Thursday, December 16, 2021 at 6:10 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [hardknott][PATCH] python3-pyelftools: Depend on debugger, pprint
python3-pyelftools uses python3-debugger, python3-pprint.
So add dependencies on these packages.

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 meta/recipes-devtools/python/python3-pyelftools_0.27.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.27.bb b/meta=
/recipes-devtools/python/python3-pyelftools_0.27.bb
index 0cfd99504b..f8b9d420a5 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
@@ -11,3 +11,5 @@ PYPI_PACKAGE =3D "pyelftools"
 inherit pypi setuptools3

 BBCLASSEXTEND =3D "native"
+
+RDEPENDS_${PN} +=3D "${PYTHON_PN}-debugger ${PYTHON_PN}-pprint"
--
2.17.1


INTERNAL - NI CONFIDENTIAL

--_000_SJ0PR04MB727722D45724B650A6246D869B509SJ0PR04MB7277namp_
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
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">It appears that on =
the hardknott branch, instead of this patch a corresponding patch from mast=
er branch was cherry-picked.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The override separa=
tor is different between master and hardknott branches =96 on hardknott it =
should be =93RDEPENDS_=94 instead of =93RDEPENDS:=94. This patch uses the c=
orrect separator for hardknott.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Can the cherry-pick=
ed commit (66211fa) be reverted on hardknott and this patch applied instead=
?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Chaitanya<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Chaitanya Vadrevu &=
lt;chaitanya.vadrevu@ni.com&gt;<br>
<b>Date: </b>Thursday, December 16, 2021 at 6:10 PM<br>
<b>To: </b>openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc: </b>Chaitanya Vadrevu &lt;chaitanya.vadrevu@ni.com&gt;<br>
<b>Subject: </b>[hardknott][PATCH] python3-pyelftools: Depend on debugger, =
pprint<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">python3-pyelftools uses python3-debugger, python3-pprint.<br>
So add dependencies on these packages.<br>
<br>
Signed-off-by: Chaitanya Vadrevu &lt;chaitanya.vadrevu@ni.com&gt;<br>
---<br>
&nbsp;meta/recipes-devtools/python/python3-pyelftools_0.27.bb | 2 ++<br>
&nbsp;1 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.27.bb b/meta=
/recipes-devtools/python/python3-pyelftools_0.27.bb<br>
index 0cfd99504b..f8b9d420a5 100644<br>
--- a/meta/recipes-devtools/python/python3-pyelftools_0.27.bb<br>
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.27.bb<br>
@@ -11,3 +11,5 @@ PYPI_PACKAGE =3D &quot;pyelftools&quot;<br>
&nbsp;inherit pypi setuptools3<br>
&nbsp;<br>
&nbsp;BBCLASSEXTEND =3D &quot;native&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;${PYTHON_PN}-debugger ${PYTHON_PN}-pprint&quot;<=
br>
-- <br>
2.17.1<o:p></o:p></span></p>
</div>
</div>
<br>
<p style=3D"font-family:Calibri;font-size:10pt;color:#000000;margin:5pt;" a=
lign=3D"Right">
INTERNAL - NI CONFIDENTIAL<br>
</p>
</body>
</html>

--_000_SJ0PR04MB727722D45724B650A6246D869B509SJ0PR04MB7277namp_--

