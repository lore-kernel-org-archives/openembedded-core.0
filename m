Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1218FC43219
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 17:21:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.244.1642008062082805843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:21:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PwizTaKq;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=801136dcde=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20CGwJ1M007582
	for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:21:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=jk3oJTGurNzONcYJGFgtSEL6N/6+NRNMgpGJC4yG53I=;
 b=PwizTaKqDT5QUiqHj+o//Y3LUMMmwAP5k3ZykZcb8+bWRDyYat288EzLH7Tg0cXUEapD
 TWXLuN6tt/pczTRFBG5Jsd3+6wc58/btKoJgNjtmpr/7ti+0kUz8zBO7IQkCy4vNfUrC
 dzRxwNAO680Z3PpQMA/5phUgHBQTdRF7HGJLu+F+xbVRDwmsRU39O692zfCw0EZZCm3L
 KAO4JPRNXmj035iPHsJMxip6BaXcPJnw+c5HBDplhlN9qJvLeCIGHnIsfROTjOyLcuPK
 26nOEDrRo3z45m9X7fOS0pFCcFJvL0p0Y39xt60d0W0PKcoEwUNvoeX0exhcjBtjBnjz dA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhy0786nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:21:01 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20CHL0Tm026388
	for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:21:00 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhy0786nf-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jan 2022 09:21:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPpftAlRazQNKk+t7Ka+hvkQaZKOPM7+kCPVnAgxmeXLmCZEpqBvZLLZkKgIyECLJAh17Ce4soS1kDq4qSm2DlQVj+6hyoQznPP947qYQ5ziBsUA7ogcJUZKgOiAHcyyHEZf1+LLEHztsRqDjS6lie7p4fFfXG+leAXjTQBj49+KmTJPydxkHpHhZGjGWBhp83bAxjx6Cw/YxRT8sQD1CMTbYC/DUahjIkVQGbxxvudwf0rdAktSO33BaiHR6W8EtnCvNBK5nAWXhHsZ/ySLE6bcIVOfv3kezBQqsx49NyDd3WCwJ8x5hqfFkg0PyTwGCJol0uXa5UH1XpEOI7cEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jk3oJTGurNzONcYJGFgtSEL6N/6+NRNMgpGJC4yG53I=;
 b=PFdanEkkFixBZ/6wwGAnxNmC3nkL//mq4YaPOOs0snfPyL8vL/MmfMuLN/HKjzxaAzg6NeWYKmPIl18xiMXa9GXojqzGJF0TkorqfjhF5vtvhABd+ZEb1IeJmgReEB08wmHB7XUA04WR2MFADKqyZr2OCj1W7nvx0QidGMY1YJGkmKHoj4N5OFoDTxLmhZQJOoLBSdvf1Ql4ueO47Y6E28/ir43roucFN2npCgwJzIrOEOCzJmnvrnciuYKUu0v0/AuE70qalwS00oe+pRbNQxn6CPQpoggw7rPoVRFyeTkmbZaSOdH27BhyNcwgpnLdTH3ygahkCr7uUAoRNL4cbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 17:20:59 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4888.011; Wed, 12 Jan 2022
 17:20:59 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
        JPEWhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 3/3] kernel.bbclass: use common strip()
Date: Wed, 12 Jan 2022 09:20:41 -0800
Message-Id: <20220112172041.143485-4-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112172041.143485-1-saul.wold@windriver.com>
References: <20220112172041.143485-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::35) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80e696e5-3b4c-4723-da45-08d9d5efe671
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4226785BCAFC796B47B73E22EE529@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lEsdaNDA8uVBW8tnrh5hmLvvVZxJN8lTi8qyj6CN9cqFCqR7GmXnIcUu4ONyN5Ucd+b2+NP51eQIDBMGnk0eUyiQPCGP9gPpX0M5YQFOtuEzJGJ4BA480s58BZetUyZmdCVODhpk2Z9g811F9Ja8+xJAb7lpK0LPGfC0NBzHWQGQJzJ7u+AINCOIeTum7ufWXaQ79+lgjgFpIp6FFa90r3W0Vb+O9rCmUMFVrqXuqXz9R5qqePH2iLSQcTb2+po7+NKOG/m2V7P6EYsor2+at6tlsWXXKw7+Izs8IydNvNck9qTVd9UOuIRztLOVZYkhnt/GVW1NoPqjaziZW4SYOkCHwOtE+CD/QgQWPtyq/4WZeWQs2VkZa6Iw2yTViX5vLjytQggaEa/nd6eO0Iv90lUUKk5TQy8jsM+D2SAPGGEx5IXEwny3M39DVwgII5xu2qXuff/M0UNUKxjW6K8zUsgIjnF1IEY6FAQxOd+nykWOfhtfF480hjSR8L17XflOVdAIgoPHVJ6WAt8GMhkg517uta4VmHeYgMmylxyDVCiEi3w6/gKztc6sCqExpaSN5P8Kl7lMPqOLN4t49d1LPaWY5lPOADPDdu82hmPXaJtyg5j89eNTeOCdcwpMB1X/UXoew/R8DkvSJyDRHW7Td4LKxG1MCksyxvAO9fz5HWQoxVLBbU6yR5q8aiCiNdDwZohqFE0HUBn94VqRu06Yhg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(2906002)(316002)(6666004)(8676002)(66946007)(1076003)(66556008)(66476007)(36756003)(86362001)(186003)(107886003)(6506007)(6512007)(38350700002)(38100700002)(52116002)(2616005)(44832011)(83380400001)(26005)(6486002)(508600001)(5660300002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pBd4g+NZWyIDf+wHk3jUdzVpz8w0LfxCmubxfD4s/TLhxwUEsSQi6ztL7mqF?=
 =?us-ascii?Q?WYkNR52ZJ5186hPD8cBlZ96pM41K+BMcOCVLmFOl03H7UtUc1m9VtEMq+lcY?=
 =?us-ascii?Q?uG6Gus9oKZLJap4J611IPyXIjYP7R7LgeRHpLTxyRUgu0Py167V2q8bZq4lA?=
 =?us-ascii?Q?ZLcs/LRvZvipkgc6fH5Xlkcxv++KlDE5tRfTHW130HdzXp6OFeQzDC3YvR+k?=
 =?us-ascii?Q?NtIcYoAUOB8ThSYVKetCOWaKlFwOUpok2XPhG9NbWN2tddZk9uJgqB5Xe79a?=
 =?us-ascii?Q?qGWHVNXnUmfbVhnuMEzDzKyv9y+XuCRRoE8r+pXBSXF48WSFIDwd8ujVFRGA?=
 =?us-ascii?Q?ZVpmx5Tm97jGUJB+1WQgBcPzgv2Wq4lvYfooQ4PYdjknnB2p8dfOJLhg0IIL?=
 =?us-ascii?Q?tsk0Aj+YX12sG67DSFGYH94a4FaywKc/YfvZ303Stszr1l6gHJtEzTTd8bC+?=
 =?us-ascii?Q?SRk4CNZpgCBqP9PGu2MwF9RNYIUY5WI1Ev1lOZuoWoTGtIWTW2z5OVFaniNT?=
 =?us-ascii?Q?7Q8ZZ6r1AvvileQzpozq56FR0gTVPmZoOw335HO70Rch7VezC5qVaebS5Wbz?=
 =?us-ascii?Q?ohHyo+YX5GbRW0PR6ctEnfWsxCMTolIa7Llcou7LTyuPVJOK5ZIEbKom/bi+?=
 =?us-ascii?Q?f4ShcxtBjIF+FF8kSGe8mwP318XVTJehWYm2Vj/PIVjyOtqJPm9kn8AbY3vD?=
 =?us-ascii?Q?iNBEWs5Tk5xkYvNHe+zCbwNmau2TTYcU5M6SpkXEhkM0j1R/1LKsPIE3cd2M?=
 =?us-ascii?Q?Im60TIrkR0L+/rMfvqLcStr3bNFxOdw88/atDn42OxVItos3S0zugK/ymkis?=
 =?us-ascii?Q?Ic7VDruein+8DweTo10XJRt6ZpQKoq9YWcRfg9K0Ra3JPIGAgUaAoC2X8ITE?=
 =?us-ascii?Q?0VxYcQSF4vp5jDA+o8q/OiVAjZje6XRjBUBvEq8p32bQRAtsgyD7IWmmRfcP?=
 =?us-ascii?Q?PWIYr6fWLh35tuEkO+AjDYbA0GNjJRxQ04bWrLQQFkUlOfd8Bkcg9b01cRXx?=
 =?us-ascii?Q?X36L5jMqE2dZfV4DNVgBHOE5Lld/V1dB68shrjLCufA8blviMgi5E8lFh24F?=
 =?us-ascii?Q?EiLSEFwl1nSbb/TnW7timJtdAZPs5u0KG4TOE6U2QEXVzN/VKK/ERnhqht3W?=
 =?us-ascii?Q?m2kjXc1dmyiBKQnZu026T77xx7VRRVCsTsux4m3c8WTP30kct7HYLsIHzUQ7?=
 =?us-ascii?Q?9l8O5+79bOzui1Wn/WaMOv5YATqdlpkMFWJKYGvzYWPxAXxK1P7nL8/0Q6xx?=
 =?us-ascii?Q?u6muX/f7uEWphAENc3jV8c+H4MNtuuqhvtozgpLpx0ql6lZLOc6puEc38oPQ?=
 =?us-ascii?Q?g2ECfDiiVZXgEIw0hpj7tpoqxNyossxJtcLp/8+AAJIEnQNZmqUTbaWA8EhF?=
 =?us-ascii?Q?nrU1cJDbfGGwRRCnSS+C1W6FbcVq2YInMmLdz4umiHWxzQtZDrxupMD2wbOy?=
 =?us-ascii?Q?gtLwN5PjN0AuEfU2JDL5JSntNHNqhORNuoWmG9Ef1xi7ZGZ1Xqvcow/lBlij?=
 =?us-ascii?Q?66MBykFm8B1M8ytgMeCvDiaOgESDdtKobGmwzGSTfCSrIbA19V4rsAnkuP/Q?=
 =?us-ascii?Q?3xZHIBR7ZZxCQO1chS3ocVF0FdLIXzul7PITfncNJVZtThBTKUHEObM0k1gA?=
 =?us-ascii?Q?/k+MAI552Yl/LNwgRpOG9Ck=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 80e696e5-3b4c-4723-da45-08d9d5efe671
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 17:20:59.1006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 p4Be0jkjjuWqPgW7y8gmpY5YJrzRhBeYLQjs/ShLUVhx9GVNUsvpEY2bpl6l1oNsRTKp9IhzhvuJla/uY4jxNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
X-Proofpoint-GUID: YxdqjNL72Ucp70ax4d-q_HHj_ZS1ZYj-
X-Proofpoint-ORIG-GUID: 8YNJSTzuGlAZF09Rvz_uU8Iq_7I_jQvw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 17:21:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160493

Re-use the runstrip() code from oe.packaging, for the kernel
stripping process. Since runstrip() is python the kernel do_strip()
need to be converted to Python also. The stripped kernel image
will be used for deployment in do_deploy(). This will allow the
package.bbclass to split an unstripped kernel binary for the debug
information and extended packagedata. The extended package data is
used by create-spdx.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/kernel.bbclass | 44 ++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7685c6921fa..473e28be477 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -700,30 +700,19 @@ do_kernel_link_images() {
 }
 addtask kernel_link_images after do_compile before do_strip
 
-do_strip() {
-	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
-		if ! (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux"); then
-			bbwarn "image type(s) will not be stripped (not supported): ${KERNEL_IMAGETYPES}"
-			return
-		fi
-
-		cd ${B}
-		headers=`"$CROSS_COMPILE"readelf -S ${KERNEL_OUTPUT_DIR}/vmlinux | \
-			  grep "^ \{1,\}\[[0-9 ]\{1,\}\] [^ ]" | \
-			  sed "s/^ \{1,\}\[[0-9 ]\{1,\}\] //" | \
-			  gawk '{print $1}'`
-
-		for str in ${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}; do {
-			if ! (echo "$headers" | grep -q "^$str$"); then
-				bbwarn "Section not found: $str";
-			fi
-
-			"$CROSS_COMPILE"strip -s -R $str ${KERNEL_OUTPUT_DIR}/vmlinux
-		}; done
-
-		bbnote "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections:" \
-			"${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}"
-	fi;
+python do_strip() {
+    import shutil
+
+    strip = d.getVar('STRIP')
+    extra_sections = d.getVar('KERNEL_IMAGE_STRIP_EXTRA_SECTIONS')
+    kernel_image = d.getVar('B') + "/" + d.getVar('KERNEL_OUTPUT_DIR') + "/vmlinux"
+
+    if (extra_sections and kernel_image.find('boot/vmlinux') != -1):
+        kernel_image_stripped = kernel_image + ".stripped"
+        shutil.copy2(kernel_image, kernel_image_stripped)
+        oe.package.runstrip((kernel_image_stripped, 8, strip, extra_sections))
+        bb.debug(1, "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections: " + \
+            extra_sections)
 }
 do_strip[dirs] = "${B}"
 
@@ -768,7 +757,12 @@ kernel_do_deploy() {
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
 		baseName=$imageType-${KERNEL_IMAGE_NAME}
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
+
+		if [ -s ${KERNEL_OUTPUT_DIR}/$imageType.stripped ] ; then
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.stripped $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
+		else
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
+		fi
 		if [ -n "${KERNEL_IMAGE_LINK_NAME}" ] ; then
 			ln -sf $baseName${KERNEL_IMAGE_BIN_EXT} $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
 		fi
-- 
2.31.1


