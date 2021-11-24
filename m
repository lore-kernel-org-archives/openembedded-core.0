Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF9FC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 20:15:48 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.99])
 by mx.groups.io with SMTP id smtpd.web09.3327.1637784945840376828
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 12:15:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=V+tj8yb1;
 spf=pass (domain: outlook.com, ip: 40.92.74.99,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaEJannSW3XGm98dRtK4qSbh5b08DX0NOeDs5xNBYZlVl6OsUeWkfjP3g/Rp+1pdOvuvuewCu7f2Gmoiqs+q8I/XOFGHI+stRzS5EB3mv+u0rv8i1akpdZh6Pq6aQHO2Sb18XTkQS4UYi7MmX+wBl5ocUdr2/p5gF9C2e6bggNsElUcM85oFtZFBH9YWxs9NVH0VnWu40mw1SZsUiFSYypAZoPDZ1HqqALxTl6vBxj708n7uUiy6FZo30UD5Ya6gMlNN9Ximew7xYgIBkXS3CO4X8sd0aAM5dHUcCr7W5pQzjVHXIG7ZA1T3oAuRB+MhDgS9nfvcDM9lJCBp2xclZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+e8QJXi+2AHEUwHYAE1QAkChOAME66jPrK+j4xzN24=;
 b=I+hPohKSNLZMZLSoSGUJuCJp9NCrtH0q6vd3et9cypZqCtHaQbDCbiWUlBCmH5/jw7Lq+crGSgDCcbDPv3icKlLBYiAbcLn8r9OJm6eHCyXWKoSJKvTOhCy5VGGY8ltsuGWK0Tanm4IbY6juCoK/8SsWPGI8PmA6paGj2r0mBlT48QGQ+FG+XsVPWOpjWmCEd+H9UGQqnZ0Mnt+W/9xVYzYKGmqVL6pYTRjQLes1Sj5vlstgf0rGYnIFeNC2pqOIGVEuKy9eflszfd94+e9Pn0aXgdqsCYIpexhT+FvtHQ+jTvVR75YYSs0U4IL1focwmOlbG/d1IQ4V5MCV93Mstw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+e8QJXi+2AHEUwHYAE1QAkChOAME66jPrK+j4xzN24=;
 b=V+tj8yb15lcHLVEHWqqqQywLFMsUXJY5QXzMUwpHxNNbzvCplxFuUlFgT5wC1/VDMf5tpWO0lu8KeWMaqD1pV9N9fo+jBdXb+9fiYo5FjXJJzClkevZHsqDh3F8nlDv+NRg7yz9nr1y6doz9Bxyzy8h+KO4sbr2l0RneyCj+CYHAJSsrnVd/xUk6VzGXbcbaoaFgBZdYLYh3FTqis9QzgLTpyDsivzgZ6rHYLCA6ECsXZnXZfUkG9fJZnQPb7BTOcmUF++moc74QxojRuvHnm/2h1/e/GkWPF4rlNJrltiQkMeJL/risJoX/46iy0q69+F120xKl+0st1HR0ULKjQQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM9PR09MB5139.eurprd09.prod.outlook.com (2603:10a6:20b:300::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Wed, 24 Nov
 2021 20:15:44 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%3]) with mapi id 15.20.4734.020; Wed, 24 Nov 2021
 20:15:44 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [RFC][PATCH 2/2] python3-tomli: remove custom crafted setup.py
Date: Wed, 24 Nov 2021 21:15:09 +0100
Message-ID: 
 <AM9PR09MB4642DC6509DA1AFBAF672699A8619@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124201509.3046484-1-kweihmann@outlook.com>
References: <20211124201509.3046484-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [AeR9p8uXwVzdFlFFscWgNY13yl3fzdt6fS6X06Zs+6U+vA9adDetEsXNPi53WLyM]
X-ClientProxiedBy: AM4PR0501CA0049.eurprd05.prod.outlook.com
 (2603:10a6:200:68::17) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211124201509.3046484-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM4PR0501CA0049.eurprd05.prod.outlook.com (2603:10a6:200:68::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 24 Nov 2021 20:15:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 862a8832-ece1-49d3-6489-08d9af8731dc
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtzaEEcPmnmo3qHrnk/hrgn2AoZ+r9sFz1oULcZapWzacadopvsgQsGlnaxPuY89CiseOS0EbyGgOGQROW7cN17TuVNcqZMnUvDsFq2Syk1bGfDcsLNAw0yYYSZwCldl762XFPl9183nV/TNOZNj0DlYC4RNX2H6xGAAlNfpKExNoX9HQnerEdWlCG4d9Db/EfeNVRtcCYEjnUpMIOLjqD+9N5Vk5cOt5MnlNdvA6xGblbLhuZ9c7Ya/RD9tlo6so74SqLXAZnPjM4aiR9tf//k+GK7SngeUIh4xI78Yuti6OT+2YliFzXWBvK0Zudt+NZih9Bx/z7jPjxn0TRnih1xEXrYfh61HN6j3Mqjob5xsqV+NHgIhTHMuCD+xHAVR6GvBMr/8rpdfbSPmv+ypNnT0hZAMknVY8DuSYaG99CUm844uO0WHRTTfglrE/+k3lmS91JQWYo8AmuGEq3mpVihqck9L1Nj49YDa0JVDVTUW71TmGdbrYwLuFghVvJq9n86UH9jyUpRssJ4Dx7R45PSacOphkoAaoMxfJGGsA+fzB7yeKW6Z2x3tZ2c7dd6+fjFwc8dwKH3s0VIb3oLFyH9EQATtu5yRoNLb+gDhUs+9+GMgvgoCrsSwl/fQSQ3dx6QEeGD6IeEOjxZzwIKKSO9bX+G0Pb7adyoMpkPNIAHQ5LTPbkfkyGI+DVlkRr0MaFsbs8vVaban3WRdY18sAvzIdAmI454QG2OFS57Dj0kyYg==
X-MS-TrafficTypeDiagnostic: AM9PR09MB5139:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eDjmSWGMqWJ2EGctiDMGq8ckJiMUsZcQZdEHbG+DRMifM0glPp588w5ZlLPqo3Jcudit3u8eBkODLzmpdv0y9mo9TXGmIz1je3MKmNuLg+thJKDd52NQ9Gf+R6so0joqLImOcfk6B/znjwGVE+GiIcxATy70xw5zxWlDsJleN2oRBHFG2KlydfJoPCNp/N7u5LIbKcvyEm6uuqwsEEClTNEd7iCtYS45UwsXLRG0ik8xPM63liPUBJtn1A8x6c/BpTOzMXuYzou+tYIhiEjdKnZyagMgsQWVwzOtn5GI21AbCl6S+wmkM9Yk13doPUwT6lMypG331wo8YtLDjkfrsrIoaG/ZNnMZOR/lq31DdPSmBz+yJCjw1rVFv/IRnef3Ncw1xHiLJWUojoclXt+Xj7KMRY9sr9cF7Ln+/F7qmVRIrN3SlvgW9GdAlOvvhpVJv9VwTE+GAocgWYJCbYIaeG2q2TkofFb/T7cVYZObFyR2Ms+xDTWt+vAsT6vQEzI2FoGk6w2qiIyJ3hqd+ODFiv05V/6tfJBPdMIS4vInD+D1IAqrLSQ647ZtxJrLcL7PTk5XzNBPDvIU3Y4GWuosRw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	a1FR7vTEihXcrSr37gB9eenzGTWFvxx0aPmEeMc0scNSgwXaJybRi+RbM4TXI9WspfpsDEJRyqrLvXdBSeTlyhDMO12HKpYrtyk7OO5ClBt3Czh2hMJqdDz8c8mEgUsScyJ9Gd++Xu68dxFuu0ckoUJffKC54YAXhfn9mHQZMHDZrtdZ711D+7zRnmmGPAwPNScGP2bIqrZsRNVFBDlr8KuVOK3jPd4eqOZXQcz29VE6Mrrvl6ctvauAdZb2vhSPri8uB8yLnLTmHd2i3HBlE/eNbRHQmoVu/etsWGL5tdoVK3fEwnfDq4sr9QtREpNFjZarBr7K/zOCeLIIe5fuubvp4+oQnaqCmssRKnPgZdoHBGDGKoDbh2Wrer6OgbaPHSLKb/Oor/SoPcbnchgPOQ64Dze9WvnGHDOI65YDBCY//Y16e3uErJNR2WcjQA33nhqEbpsRjXZZrlbXlZX5vp7uYTQYe1j6BoSSxl+zmEZSIGhhrA1QH4PIP8M5zFqdQq3+kr9+G36z8wVq+xYbqHjBtNcqbLgUjoV5TU7Q6ka9HJSfnflD7zjNs2jHyldTU0hiqoTTT6WrdHVminf6oFU2iZYfz1fVVe7eUupxrpLFYYTKgQG6VKBICwLBFg35sP0WvmsldxVpt9LpQiwb8HEnwXfnEG8Yf0t/82dN901VeZFYUdfZuezZJpTk+2Tn/xT/KGQJ+UoZYAmlnvI+r9JhOBpVcD+NgU16Iwz1ZAqXMz+oLxofYEjuDTQ8nLzAFHLGWoJFRZ6qXoGm3Q7mHQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 862a8832-ece1-49d3-6489-08d9af8731dc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 20:15:44.3789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR09MB5139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 20:15:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158742

as this now is created behind the scenes by distutils-legacy bbclass

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-devtools/python/python3-tomli_1.2.2.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-tomli_1.2.2.bb b/meta/rec=
ipes-devtools/python/python3-tomli_1.2.2.bb
index 39030ed218..9be3e2cb5f 100644
--- a/meta/recipes-devtools/python/python3-tomli_1.2.2.bb
+++ b/meta/recipes-devtools/python/python3-tomli_1.2.2.bb
@@ -10,11 +10,4 @@ inherit pypi setuptools3
=20
 SRC_URI[sha256sum] =3D "c6ce0015eb38820eaf32b5db832dbc26deb3dd427bd5f6556c=
f0acac2c214fee"
=20
-do_configure:prepend() {
-cat > ${S}/setup.py <<-EOF
-from setuptools import setup
-setup(name=3D"tomli", version=3D"${PV}", packages=3D["tomli"], package_dat=
a=3D{"": ["*"]})
-EOF
-}
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


