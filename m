Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E85DC7618A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 15:47:35 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.19])
 by mx.groups.io with SMTP id smtpd.web11.18135.1679327248461368673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 08:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=S3kNnJij;
 spf=pass (domain: outlook.com, ip: 40.92.66.19, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNA4F2g9n3LlLPJj44TA/3NR/o3w0/UV3FWlWKLKvxGiuJ+5ZqyjS1cZaLv5w6CeX+BC9b6Sy9Ztsyj3VOfyMpI+QYODcmNgvzNi35P5VSdgbzF6IN6NmyZ6hiLMIAHqnb5Swz10mjz4upA27d0V0EGgUK3ucZY4vtifqHblxWEXUUXNNBmDC94zmURY2lRJQj5ENCZHaoiH2TVLsN/Ud9OcqLnJb9EXnrE+A5QegZfF70A4UufG36b1abC298akSiTXUCW7tR0Bs+nR850aIWjs4llx0rvcwvc0S8zErZubr7VsCb0ntBz4JYthpB/0hXYDtbL5SncVLoRXkjcOgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3hAJqoLBQCP4GsWy7gPROZC8nKORWfWZE2VU9Lg/EM=;
 b=Pvj/5vKpeOLUR9tFz8i4H2L3HZDdWctWH47jSvDkc+dsdfyXUTAcudGLnFJ7OgXGF+sIwNm9Xqv/H1KTPed3kqPFFX1+y8r+BklnUrSVWUTXzBBP0W43goFkMpK7eDGCKacM0C/PizKpTFa3nedgROHeVf1YPWMEI63+24f4gSXP6b0kj5wMiZdiFYOhIBCLh+wfPc+irWM1ZYBpBrwNzyqx+zwj5DoTqGObKbX1TL80aajQhAHPdI8TEGlB1zwjbcaIcnQll0GY2+QxgWIFpQMKr5PQne0En87zeFVHLIgQHLLGzLpf3Wiz5uBhMgsM//q7EHxeKWBZhJpWqO00Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3hAJqoLBQCP4GsWy7gPROZC8nKORWfWZE2VU9Lg/EM=;
 b=S3kNnJij12fZloiyU8Vx9CxGjkv1dpZ++ovfkbUBBAz5jsjBdBgRIJe+bm5T9BL+diqQHGKvUvoyjy9jbppJHdW8VJaNjw6ea7Pcw5Y/MCsz+vHup28AyKFn23ZE8TbbjuX5jVtg2XYhYQuTSmMnZhhNO6DQtzShUnTi25qxGX8qHiou5f99XL9V33/4E+KQgafvUcTKz5KmZ2tPchGZoYde/LtZa5YBqW82+e2ruccX6Pv62okh/lbE5ULkrrbL6smV7HayYT0Ysa2BWSSNZr0PTIzeb1D+TbalM8vyc4OUQPCpMt6Rsq8ShyEjuknHYl+tRtD61GoJlhCBdjKbug==
Received: from AM6PR09MB3091.eurprd09.prod.outlook.com (2603:10a6:20b:c2::13)
 by DB9PR09MB6012.eurprd09.prod.outlook.com (2603:10a6:10:3db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 15:47:24 +0000
Received: from AM6PR09MB3091.eurprd09.prod.outlook.com
 ([fe80::6a0e:f7c5:d3ef:378]) by AM6PR09MB3091.eurprd09.prod.outlook.com
 ([fe80::6a0e:f7c5:d3ef:378%3]) with mapi id 15.20.6178.035; Mon, 20 Mar 2023
 15:47:24 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] lib/oeqa: add __init__.py
Date: Mon, 20 Mar 2023 15:46:57 +0000
Message-ID: <AM6PR09MB3091CD0EFBD24354A1A80FF6A8809@AM6PR09MB3091.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [Zsqpa9US5xXmCBFCOXfVPA9f4UKvt6Bfo/bBgKzqMHHXdqyg3xd4zISBgoALzJ+qtvzntz8aTHE=]
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To AM6PR09MB3091.eurprd09.prod.outlook.com
 (2603:10a6:20b:c2::13)
X-Microsoft-Original-Message-ID: <20230320154657.24351-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR09MB3091:EE_|DB9PR09MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: c62c9ffb-1025-4f44-2a80-08db295a6663
X-MS-Exchange-SLBlob-MailProps: 
	Cq7lScuPrnponL+dhLUxfK7GK7ORkUhGABoLkPPCC7GAyYitgj77BxgaebW3Wmq6ngJL8eGSy5EGqviWik1ru2OUJGyDHjZ5MJiohftxFQTH2mIMSkfLRcEKPPsWvKlnQXlkW5otFNuIeAaq8EecQ04aIbmrYvPFArddsp8LfVeD7NI/8GcK4lYNS+bIznAEFpT+6IvUGMUH91glycoUisucRRuxne5pGXuFm28ufjqJjjzmg3RS/i9zl4iUeqgxJO8Vo/lKpx0K6AE7UfYoKYQ2rc4AnSMtxQeCu3Q4spFGFitGi6LtKMYVPusU0VUYuVaa/s72b81EyBc8NrmqcvqRRXq/b4gjORYEBFopWf8949Tj6Z+fkqNqsoDe4ich46P+UTdF35eWCD8tmEF/Y0CG0LMfYZOpplRsXZnE2uppZ6ZZhcS+RLrBmCUpkHT57OWYxeJBLshcqljWX0tFxvCmZ3+v77yCC6EqpHI9ODnAlUhgo2rFyjALO40W3Ui90nxhmQ7KMWOLbvMHQMmtm9x0FJYa/Od7UlqonphmYPugT/u6AXMu+J773t+toVMAJL9E+XIrfj3aDjTk2DJYF6moAGFLkDYuHClO0ZRBKoGqKC2En3ht8V3rf3OrrC6Q3C3IVzfOBKlEBpYw+Yn5rLRRqjvvLr34hu83ek41QdcflrIm5Vp8iKxqVC+MtsddUqi/Cdy5ftmxQLANUE9fs1ZFAGuCJ4bXhC+ScqTTXO2duobnyqCZC0HnQsvWMMaaT5g/F4X5lOw=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d4ymO9/7hTkBdTWnMJmrRjNEL46kOrMLgVh4bZq9q0Jl24uZmuH1s6URKI0G/LbJKxGT9QAoshMZV3dvoO1MANqA/0FjDu7l4LSGvuArTiZOsMQsKRUiQUen+nEtGG2zzAEexjT0WfG0y7XiWjmm/XcdLykyNLGl19H0MqwKdRsCbL5KLLa/Jv1s/4BR9hcRyVTqQg0cE7bJex41hR+2iqedkrcmRl+pFcGPP1vy8pZ8z0j2/h9Wd+SovqbbTRaY+KLjl0cFHJA/aNlfH6mMSt0FVXBYYTuXJ2pDH/EINpn3cC6OaRfo33D7K4ir2fAgTn+aeGWjcoXUaK+vNaeWafqTxtuf6B0qmddsCf2oqlvrn66n+p8njxefmfQNrkAyEu9TjwYdrRZosHR1+Li9RO8qaDMk0rcs0nxXcFW8HcTpp2m80lDv/YLubMbPkzi6WEcD6RPoldvX6HclqZDjXL2cP/VfyTXJAw6Raaghjxit3+BY5xQ4nlkCYlVL4Fk2j8iecLQ3GsPyZgBQorTv5cIInlfqpRg3Swg1PMcygWylORlQ82+1GXISzJeBRGuhLeb1+Lsx9zHbqyfjp5cHKuobfffMbsyOm0itN39qIUcSUz0bdg1gL/dZVzJlWIjY9YiS1jwEmSlNCv/V5i4YjQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FzcnV1tXE1+sEpyq05Ev13IZjfMvhw/uOROtCbibgBb8BYHaVxY9+18EMLsP?=
 =?us-ascii?Q?GWzOYRgdXb8wrhjqAFNI2flKIpBNYJrQCpaK9jVbv86HbCb+qw55h8asEMYa?=
 =?us-ascii?Q?8UzDFbNYyFU6WeRztv63/LsUnEdA8zxa/qwIEkE2nlnJOz2B7PF8j7U3JcsU?=
 =?us-ascii?Q?/7huT1Hpy1LuJZOYyhwKF6IJ5P0PyTLP1GDoI4dnZrSR8Vy+b3Y8gCkr/3Fh?=
 =?us-ascii?Q?wpo0oXKfsmd8uqaOG+KXhEOu6W5hMJc+KaQL51RdI1PtPd59cakf7dAmDpGe?=
 =?us-ascii?Q?XS3Brn6aEkV822qQcESUqXKDXcB1PhS7KK5uIvZZkWM1ZjC00jsipxp5TSpZ?=
 =?us-ascii?Q?Q+iCn4Ryf24yU6FLql4WnPSFDak6KrYZfZKqIZtRCBs/kbdSmDrggZf6MAJs?=
 =?us-ascii?Q?ZZ+vy9mBSY9QI1h1xWn8Pri9b27imXD9eVdaugYX8TIpSLPrko8TJJh64Pxu?=
 =?us-ascii?Q?EJEg2YtfGzm7B5tMYQeQFQuL+gbhIfr6Yr9l5RoNlLFApnvn488k6o1uuOIF?=
 =?us-ascii?Q?xB9faK6vpuJBVcvY+HZ5Q8WVZoiOb5uEYONc8kqWjvMCXa1E+WkCyE+gayJk?=
 =?us-ascii?Q?05F5hNZHW83dtHXQ1phGf0T1ggcw8SyU+igWckiep7nCsXyIrHqmjxLtnkba?=
 =?us-ascii?Q?2Jtk7AHfbTLIOOLeZMWT2BYaMVu07ofZs4VrLpIEHQM+pAee9lJ9tEB9f3tN?=
 =?us-ascii?Q?kTL1Bwi/0PrnYk1LxZFhi2BmyJZV2SLc5cY2lU4TfKzBvXOD1cITPbqytGYy?=
 =?us-ascii?Q?IlzVXmun9k9bZtFgwi6Bs6CDrfaR97PDb2lp8EgPhFcH5Ldwk33qYXRDutQY?=
 =?us-ascii?Q?5kgjDA4qr3/RRh6ZOv7l6sjaHWuDXEGlwI7HO01FCDpKcP+5KP1o3EBAZZTe?=
 =?us-ascii?Q?v4gB/QrBOjwScsEbi/8VlRkkfMjokMP6OJ2WFdGNXlNPRdc78VVQjXBjXhKh?=
 =?us-ascii?Q?mIGsCpC8Ns4YPbJDwijoDOfZ5e0GMqo+U6JQ9WNxd6zrBKaCPykTRdbVcRt4?=
 =?us-ascii?Q?P1p2iFA5W5H06TW1nMKpixL6rqb0jF1Vg2twoL0afkTcp2+9FFxQZ5NP4p9A?=
 =?us-ascii?Q?t4Ufi5hP0hlbIMkNXnHbAzsCjGTm8HRXOWkhIV1vrgJ+K7wEWInJ5YPecB+6?=
 =?us-ascii?Q?d4fvHmLTjnqOMvUfwZjW7ADqcP64aVsnKK+pGMZlbz3DF4oZm+q/N9bxsvxB?=
 =?us-ascii?Q?+yWaftgoRnX9Jefy4sqHCePTUPsJmtejfbmzq1OY2eTCnh5wWOFXEHNrxhEz?=
 =?us-ascii?Q?ml3qWw648jEn7umwYbeoXMlw6Fj/Ro0Cu26P1d0ABi2Cgv+ouUa6PxD5WFh4?=
 =?us-ascii?Q?4NXgkum9c6wqXYmx4cUkCbfAer9N6mYF4CfAehKQIJjlhg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c62c9ffb-1025-4f44-2a80-08db295a6663
X-MS-Exchange-CrossTenant-AuthSource: AM6PR09MB3091.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 15:47:24.8377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR09MB6012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 15:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178832

to allow loading of oeqa modules outside of bitbake.
Calls like from oeqa.runtime.case import OERuntimeTestCase or
from oeqa.runtime.case import OERuntimeTestCase assume that oeqa
is a python module, but a the folder is lacking an __init__.py imports
fail when the file is loaded outside of bitbake with manipulated
sys.path.
Fix that by adding an empty file.
This allow to inspect for instance test case and generate proper
test documentation from docstring or even other use cases.

The file got deleted to fix testimage and testexport features in
d9b3ee8b38f877c1723e48f1aa311c28102786fb, but it should have
been not deleted but just emptied

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/lib/oeqa/__init__.py | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 meta/lib/oeqa/__init__.py

diff --git a/meta/lib/oeqa/__init__.py b/meta/lib/oeqa/__init__.py
new file mode 100644
index 0000000000..e69de29bb2
--=20
2.34.1


