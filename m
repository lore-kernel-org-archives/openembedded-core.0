Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC77C47073
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 06:10:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.23862.1704175810394741768
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 22:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BPrsbJlx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=173143555b=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40264L25018103
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jan 2024 06:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Sc9R/K/9PcJmzNfq93
	GzhnkK4S28kggeSSs4SSj8EZE=; b=BPrsbJlx8roZNOQbB0J1M5DsF5J0Kt3i85
	i0tVPKsFmWgnjJSkPMUQ+xWqf+0KZZpFvvuJaWD1BwCiEgyu69Lkw0MdaCI76QKy
	vknNVOfu6xw48YMZLjDzFZX/bJmO6S5NcGQcHznKDk2ZXtAA30EoIIOBLX+jj3ig
	jRCfhu18E9oPPJgXHzeMNcpBaOe4MHpI3Jz6VHdJR6y40pd7iNC1DNSkxfATB4V5
	yIm33FkR9kFogE17wLkYxsJne6wCfvAGGu2/QGxsQRkNvzCwzgJkkNnaf8TM0/Cg
	2SuWWazQKMEN3qKIIkVDCQA+3iVtoFq5ru1plMJZNLSQYXlfGryw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vaa662g4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 06:10:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8xizkeWMcFzjPoQi8sMVdCKh1lbqIE4NF0NCec0/fIgkbJdsMiKDuemED4pwZh53VH3+6pTT0gG3IAArQNwopp/Lu5MlrQMxzzysQ8K2yj/xtKE/lbI2zZ3TzgnSy/33nepSSkq4nTIh2ECl82AU+AeUaR99hGdnUe7oGKQexmHWcMchNgs+1+Ra71DPiRIjRRwkz6zscy9dsVqXtmUQHh8Pa/8jjpuH0/+i8tfuAIR9cAtuZheIwO5eXAqQ+p8hTftvPUtQZ3uZK1zcHsDvnYFNPeTTyF25Y/LXAZJEkYSRohdrJXCYmEDCynuE891PDZ7MGjUJ3LJ56qFsKdX9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sc9R/K/9PcJmzNfq93GzhnkK4S28kggeSSs4SSj8EZE=;
 b=irEoaRwHDUiqEMhYsKF1i9OlCCie5V0oei7ooGs1XrSstyxdrJZ8VmL0wDxCOcUQKEoMbY1mg/wNoQzVBuwwV3gwAx+9dRMS04QNym8VuSi3xkGhgfO3XfmPdxRCmSYs5FDF9BUHW6TmC8kP1tibG8192lc6MzkJEot7Rp3dR7MBhCwmdtqqBoh6QjUQtAXfGcf/TFK0RcVhvPYGGjwk16+zZ3fC/2QmlqVXJvDITd3HkpdbuXfAdp2q83fa8VZjuElnwhDQvBs88mFGssEvBD/E2sVsZHwM3bSqIWnSjTnCIY0lPyAQS3UmrDs/AF49Xyb0shtn7qu9mxCvwLLkcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4554.namprd11.prod.outlook.com (2603:10b6:303:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 06:10:07 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 06:10:00 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] gawk: upgrade from 5.2.2 to 5.3.0
Date: Tue,  2 Jan 2024 14:09:46 +0800
Message-Id: <20240102060947.218414-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0200.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW3PR11MB4554:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca4920b-2f68-40a6-2ab6-08dc0b59738a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VUyEc7OvKhO+N/AH3AK3kvgU8SwPgayZr9V8QCPBUKB3Kx4te6gVJ43buZBl1ZNZRGVQVNeQoNip13/NokJyV7HXyIBGERjvRUtyoLvvK70JQr3cyKWmmVieWby6Wj3p/bxqmKyb16Ds7wUvM3aDTYsTiQ58vaS+YlCWxc6NXJpPSZNOQZYOB5f6Pt8pO16G4Jx+5qGRJiaJWA4j1Ekd9jV/js6J4qWh8hIqa609RGRPa/kHDmX0D392dbSDFk0hkXfMvJ2X+Rcn7KXQshyHqbflr2IueGtC0SgGZ+hCV97QVCuTf1bJt8iFnc1IkJPGYHs8q5JasS/kFklk9vjfU1cBLpAi9FjlcQESUN6tJM55Wqa4w5LQnArgD3wvakYnMOKbvcjOsYhBSGZPc66wEKWJoaSfdmW+2ezzsMNYRgV0SQWEtzh9kcwv5xtNzdalEL6W3NttHd54jvZox0BZNuhceCMk6hAz4wdFHrZiN1+corOHlmr0B9nhSxd4ImfH993oDLz1bX6VkWehRZgF5N/u4+qwL8R4U4SeVFc+rOlAXlREVYk8jpVOP9QwmXOwXY3NGK85JXGh+ae4t9qU8QYp1uYbem2AHMI7lM02x7SaQ82QPomviZ3PF5fzqhzn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39850400004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(4744005)(5660300002)(8676002)(8936002)(316002)(36756003)(66476007)(66556008)(6916009)(86362001)(478600001)(6486002)(41300700001)(6666004)(6512007)(9686003)(6506007)(52116002)(38350700005)(1076003)(26005)(2616005)(38100700002)(83380400001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?29och/U1+cQt/gMlZwKD8S2mvzutfhxfZYTr89kcbOsz+5Rnu53RSnwGYhf3?=
 =?us-ascii?Q?MjbsGF70LtITM9iqe05QxSi/uXZXxb0b2csdlIv4llTgvcLWs4gUivz0/MCa?=
 =?us-ascii?Q?ZF7qjR3BLMKOZO06dkMEaf/6nXPPq5lwSBtKIfHhmz9Flj5CycVWSJFgkBUY?=
 =?us-ascii?Q?+C1iMLWZJpjFwFAq20OKcDDgKGwDPl39vMit+4shXctAw49JBNpE59q3P5jY?=
 =?us-ascii?Q?s3h8MEKg0+KMXRA6J7/zxSW+Poh0HQuZZhyL0XwgZat1pFq2XqZwXrS4WYPp?=
 =?us-ascii?Q?Pbfu0MHfnbWYbIH7ykYXOZnfbHgFJ/xMV4aKm2rC3r80p14NtI2or0TEabgq?=
 =?us-ascii?Q?VdyrCwB0ATifnAfMj1IusRnMGq9swbjlD8atlmOATZKqeAB/FT6RAYSvF78w?=
 =?us-ascii?Q?2+MRLItgCj8NtyKbrdE+vWsu3jWMzUjh7/AjWRzskkwv4bB2LZL/6kGOJMR8?=
 =?us-ascii?Q?HrQL7Z92sRrUzslpauur/rJNfHEu8+wjXBKacEJYv96XEDdlzimT0Tr/iTeT?=
 =?us-ascii?Q?gdU2zD7rZg8q8pMAp5j0qsXAo24KJY1uYOP/0GrkgnU/wN7vEppsQplHO5Qa?=
 =?us-ascii?Q?xiDL0Yl+1k1OZ2nOHn4ebJIDDccrnTdburx8cbINp8zcIBnUN4PuhJl0tbHg?=
 =?us-ascii?Q?LG5+x5WqYlVRsBSsLM6D6Rylk4erGFwhrXgUtoCHgl5184gOi2ZI4LTFItRO?=
 =?us-ascii?Q?j+EFiWIS2MxoJ1dAFfaaiqefbyCrQbOb748v0x51cHOHp9+ivocRtYA6HQJ4?=
 =?us-ascii?Q?2fK2Bx5Hks9rBk/XehHFVKV8brBFp1D9IzXWJJO6FRVGzVFIejcAQFY3y5R0?=
 =?us-ascii?Q?nNcFHfXTb30/zuQvTh5HL2f5nOR4m2nBb5v/736SZDZPXO0jgIAD87nFInr6?=
 =?us-ascii?Q?jPIRDk/IYPYnaowSpFO+HIJIfR6HcEydBvETNm4cO6PvzK9CxvEWYpEE6BVC?=
 =?us-ascii?Q?Z5OLO/XZMUAu9XqHOQ77GNXx9ZNsmdhXSj1JjWJeyYCqT+PH2ClTqBGH5zWr?=
 =?us-ascii?Q?BEz6RNaEH7p6orgp3xhpQNnz8UJA0MCV7nvL9YwfLWZQ0fWlfbGM8jEH73hG?=
 =?us-ascii?Q?CpCJyLpY/O9AECcaIt1sZZUPH8NVZiDtIeyb98yjKn+5uQ6BsjaYaxFxjtaK?=
 =?us-ascii?Q?Yipd6p1GcaSHktS9wOjYCoby5iHo2YRmqjgqQvcj82zYy0/yjHRZnX6e1HdM?=
 =?us-ascii?Q?U9at1B0RRMrWiX37HX9U23hEROUvAWojabm7X0TbG0GVZ+OnNbk55dlh44FH?=
 =?us-ascii?Q?LK5WnUKQ1GnXSzBuGD0SqqYjidj0rJZZgeQeUAgZ8SOhbl8JfVMQBgxPmoNH?=
 =?us-ascii?Q?GzUlXpxnK90UuNjU7TqCMR2P+aATbLkNWwUWG/JN1z1O5utEvSC3O6Xc13RQ?=
 =?us-ascii?Q?zzIodFv79n7KDE3sv/uYd6pB7O2Fh0IqQ1tWHKq3F/SuU5zPVTG16C8KWdS8?=
 =?us-ascii?Q?oM26Sfs/hsQsb6ChBTx8HWNF1n9w56JrVrLD3s9+Bbv3emFBPzfDk9x2NW/i?=
 =?us-ascii?Q?RjlRUR0l72MaHblXhP9F09+Blb+77MelvZeJTd751u7mo8u3t1rz+7Lu7bCT?=
 =?us-ascii?Q?vUBr3mtRHXQ2QaH4p2Eh1WOsQh4wUGORM9QuACJJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca4920b-2f68-40a6-2ab6-08dc0b59738a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 06:10:00.0671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6QNgPVjvOOCapNWNY8zsN2wmsgdZkHAxjEJd/KWagj33954iCYadx3jJFsUew/rwZo2XmMydqxpsWtuSXgcjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4554
X-Proofpoint-GUID: r_X4GLQQCuWRYb6ae_eBS264j0L1iAzv
X-Proofpoint-ORIG-GUID: r_X4GLQQCuWRYb6ae_eBS264j0L1iAzv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=657
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401020044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 06:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193205

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/gawk/{gawk_5.2.2.bb => gawk_5.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/gawk/{gawk_5.2.2.bb => gawk_5.3.0.bb} (97%)

diff --git a/meta/recipes-extended/gawk/gawk_5.2.2.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
similarity index 97%
rename from meta/recipes-extended/gawk/gawk_5.2.2.bb
rename to meta/recipes-extended/gawk/gawk_5.3.0.bb
index 3c18b6911a..3d652da6e5 100644
--- a/meta/recipes-extended/gawk/gawk_5.2.2.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "945aef7ccff101f20b22a10802bc005e994ab2b8ea3e724cc1a197c62f41f650"
+SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.34.1


