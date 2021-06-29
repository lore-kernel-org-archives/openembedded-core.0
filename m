Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.9268.1624978639979788203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 07:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZwpIEGGb;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=281492f5e1=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15TEo4Kb014342
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 07:57:19 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 39g5a800uh-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 07:57:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxORJFAQBZs9ILFwEnA9S9VnyWR0TFLlG/SbVj53Yiuk/84pDYApYA6bGUNrb2mnZGtjEs3HdqYp/dRHsiCmnQa1KrE2H+nbCBa6UdgdJ0Jixvn5S3z8DHi0CZnnLemIajYiO3gQL3SGjP+0Nuy2TI/ffdV6/+HNjo/W7tG0vdCXuthQLUQS7HP+GdCRc/5/VPGIUgokRsQ+LyJs2nAqgMJxOPBnrecxZyWGWcUxVafq5nR2ePBGirEdcrPHTfdyJqwtM7mvW34Owk9lt7BDIgULyEq3JPIvhPVXBcp5HP9xLeKjvHRZg+4jNG2OON61VpH33DVnoBWxVWH4jLQvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zl1JhZA8dbwnMB+A08rc+AG1RC58ZZbF3GSbljunC0c=;
 b=McNkek4Bv31NlDonFMdytaxkzgc+6uwQWpx4IJVv4t2ETKbFGYTURJ71gwjShInAZt12W2Sa53vGfBFkQ36Kp3wV9+GaeJoEVd1WxBqV3jmZ3p15v+mBzCxwo/9nea3aGm4c0jM3+DIfGUePjC5nKXdfuu8amfHs3ptCa2CJBQpA3y3WPSJBI0soCSqm6TaWG50tBuu6Zud/komIcaVTDaY5LqQHlXcdrOQ0v8FjJ5pHgotnfqdDZ8ybr8AzlLBoOkB02YHe4IHLNvnXjV/juNgwLZNmwOWNHJs/Nwly86sfrWYcR5WQ8jHsdbyhIRFJdQiMw3wPJsqOdPF9/+KdBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zl1JhZA8dbwnMB+A08rc+AG1RC58ZZbF3GSbljunC0c=;
 b=ZwpIEGGbtCcqGJ+6VMZUDiU7J5IEiKIbQv3mpxxv1jqFZDi0TcDrFjsmuvsjoZXn2Loh2VhBwIqAK85ZAXjA8lIhe2o2qgqUQueAqMNXcWjMKIQ6Ew7ke5a7mQWuUgjiRX7/k5K26X7hrI37wAUkuS8m9PG4GOnSbB/RPubShBw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 by BY5PR11MB4401.namprd11.prod.outlook.com (2603:10b6:a03:1be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Tue, 29 Jun
 2021 14:57:15 +0000
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::c0d8:4c7e:53dd:6b1e]) by SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::c0d8:4c7e:53dd:6b1e%7]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 14:57:15 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] testimage.bbclass: Add dump-guest-memory cmd
Date: Tue, 29 Jun 2021 07:57:03 -0700
Message-Id: <20210629145703.979269-3-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629145703.979269-1-saul.wold@windriver.com>
References: <20210629145703.979269-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW2PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:302:1::26) To SJ0PR11MB5085.namprd11.prod.outlook.com
 (2603:10b6:a03:2db::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW2PR2101CA0013.namprd21.prod.outlook.com (2603:10b6:302:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.4 via Frontend Transport; Tue, 29 Jun 2021 14:57:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 488db7cc-dc4d-417a-7415-08d93b0e2f1b
X-MS-TrafficTypeDiagnostic: BY5PR11MB4401:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB44016CF53810743C6A421E0DEE029@BY5PR11MB4401.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LYcfQqaB/cCwcXlAsbwVV5CMrzOsFaXIEo8LGGuLDBgIrEu2IQIQUC/YVFdJCx1/oG04uvovIRt0xACqm//7XKceY/qkAVUt5Gml6/ZimbRYcNlh0wUFbW4sJvJ3LMZGfkfNAV94GKLmz8RqAwCBHtsa+PN1El+c9VNTD2Xznj384RyQOeu1Xqb8wBLRscYsTp9TzNCaKqIwNGpCKjCfMW9Gr+VrlQ4q9AaIWc795ZMVQSWgKt15REmy/AWoWKni5p+/B+NLSsZuMUDbu2uia+jqqS+j54YxoRxz+fu4e1ZB+mIJselMKc7+7g8jV6HT8SwgkD0CiHcBwlCABlgOT4nBZ5Yrxoviagi9YUTZYH9hpkaHFP33B/iKazMz3XuW+JxdEw8L0mJ00cOiadO/X7iuUMrDKr5A2TmmiyesV5gPv/1sCfLcX/saKAw0h1+9VsClBRcghAljqwIRqiHsGIv7qOdoGVHh1aGndvTbZBy/6OVJTHxJUn51tJiwM+Ia9YOe/XOPHiem7zuW4T0UM3j7s1X6oYK5zYtpu0iRODo8w7Cl0kihWo/VYq6wpVYksHVAsMxBrNwLvycIUpqxBZoTTq/IzQL+JUGzN/uftAAXPCrAqAELhdxVSoacn3WkZS/T5rSJ7KylVVpL1VpwtQs4b6xBgqdtQvbrFGZTWZh53L4Yn/4X++tR9I+ZIYCE7YTupMQEtDk0/clSumDwgA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5085.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(8936002)(316002)(6512007)(6916009)(38350700002)(186003)(86362001)(26005)(83380400001)(38100700002)(4744005)(52116002)(6486002)(956004)(6506007)(66946007)(8676002)(1076003)(66476007)(5660300002)(2906002)(16526019)(36756003)(6666004)(2616005)(66556008)(478600001)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cpH8sxAhgdVqj+YKT/3GpsmYUqwOm3Cd8G+UClSQFZTvLZtLrhHHQZOUHR3C?=
 =?us-ascii?Q?cdpoaYAyb9RHxXWQKBAWN/B6cmmpZkxS3r8EnvIJsEX2u2d68KJDiHWwfDe3?=
 =?us-ascii?Q?ihzYNvcw+XW69SRIbG8AMlT0jyY6sXDN+43jUjLgLV43RXGG9s6kExaLL9p9?=
 =?us-ascii?Q?wnAINp0sZuwylWb8ZSUq6rkJR6e29oQJkxBRine2m4c7FsMJrLXsagJexKm8?=
 =?us-ascii?Q?LHM/AzT+5O5C+xmo+tuFgZ3LeDOgH9cVD73IsoPSd8RJjXX29VBRAxKYLI6F?=
 =?us-ascii?Q?Qwbmiz1lo8Hm6HuM8JxOwkQVIssDh1xULiYU0RhSVwuAtlxWO2Uo3ehaVpDZ?=
 =?us-ascii?Q?X133+P8iSlTvWlHlgadNyRXzsfjAWz+o3TOxLfO2cfueyKfsT79Jtk2FP2IY?=
 =?us-ascii?Q?nLzbpbSRsCC5e9IKaBQILpBKmhUxpc1w9DzGIyX35ilTPyBJK9TGL1pLz3Lx?=
 =?us-ascii?Q?NI25i5J3u9+MRp7BWizAdrCvBe+Sf3gdjHQyOyUolEx4yUuR8+M/PJ97XK/i?=
 =?us-ascii?Q?8ZBb0Fw2W4qRyY5ZxK8k2i4i9IIzKXZFupC9LjRTVF8ZbjluuitejydZdEUk?=
 =?us-ascii?Q?wrZSKSJUoJthvOoek9heq0rYYXgsHH7ssMhiKJl4tKHKq57KemYJH/flVQ0T?=
 =?us-ascii?Q?0g/Nbj1t6ZfxUgHSiGIl9PtkNA9j3wIKGOjwqyUcEINaZZjsGtHic7i54p8s?=
 =?us-ascii?Q?rpIq+JwMIPR2/NNvuEVsZ7YO4DxU3FRxHnn9nr/L+ZzRgqu071JlUtmrpySL?=
 =?us-ascii?Q?pHLApdYDU98hkZdnz9YtXh0tr1ukUtKNKfZ7lLL+i/Yc+7ubJwGQpbj53IRc?=
 =?us-ascii?Q?sHSaU6HpXqG35Jl3mrI9YC8T+CfSBzeLV64T3NJGKlQegeoj9TriFFwIexrb?=
 =?us-ascii?Q?21/dACthtk9SAXjZP22w0ZoB950shf5EVMgH/mVw6YhGWXG7zpYwLr0qNZZ2?=
 =?us-ascii?Q?x3AC0vRhrH/bI73ycyIetfpibN4MEiHFWvz+AvuCQrE5RGyXIrpv+OrGmYd0?=
 =?us-ascii?Q?u948iB2gAMFrg+bg0jNqPYb50WjcL74MhcO9IUSnlNTkL91Jz07zPgLqMtIn?=
 =?us-ascii?Q?03E/roWloNlyv+o/x4tleCNaThjB69m4/jSXHUp+4KiLhEOR5jLFNv/M+TCg?=
 =?us-ascii?Q?eal2M7vBgPhZZPg9Z88UPDh1blvXEduTnml8oGwk6dBRu2537MHRLz2EbxY2?=
 =?us-ascii?Q?Jxaww2A0dlxnHZ2GheqhyfHM+pbrJgMpj3m4OYsbBgBH/6r9XbxqlCCOI6vy?=
 =?us-ascii?Q?OpNaum00Nk380Jyni7yuVT0HXsz16Xs/IcpcbnkznHw/iPGFmJ9So1pIv8Tw?=
 =?us-ascii?Q?Epi0/sQ3dT0Lh9t3BHtLarBX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488db7cc-dc4d-417a-7415-08d93b0e2f1b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5085.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 14:57:15.8163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D83HNURUvnY6t/zDnzDy+VtMmKqNffASrJdiA1uF2xJhoB/Q3U1N4muj7MyRh/oIwEivCmP5yxxCLqd+g9+Feg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4401
X-Proofpoint-GUID: ogOk-dkxqququa-OShKL8MvTA2gFn_aW
X-Proofpoint-ORIG-GUID: ogOk-dkxqququa-OShKL8MvTA2gFn_aW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-29_07:2021-06-29,2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106290097
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This command takes a set of command arguments, one of which requires
a filename so use %s which the MonitorDumper will translate to a
unique filename in the dated qmp directory.

CMD Before: {paging:false,protocol:file:%s.img}
CMD After: {paging:false,protocol:file:/yocto/poky/build/tmp/log/runtime-hostdump/qmp_00_dump-guest-memory.img}

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/testimage.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 43de9d4d767..ed3a885bdf2 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -130,6 +130,7 @@ testimage_dump_host () {
 testimage_dump_monitor () {
     query-status
     query-block
+    dump-guest-memory {"paging":false,"protocol":"file:%s.img"}
 }
 
 python do_testimage() {
-- 
2.25.1

