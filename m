Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AE2C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 16:20:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.28275.1673454048414228060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 08:20:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oHRTfBdF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=037548e3f3=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30BDURqb022659
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 16:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=jUmc40PaVsqEiBKpg17bvS2pJXiGG3rQ2VNuD9jynPA=;
 b=oHRTfBdFwyQQockXhioVHnEXSV97UGi8ry2+hsA2876XVg4brRgzaB/f9mwUoZvu21Ei
 Egn81yTMdWxiAiHKde4xrvMEXYrkOe3MCYuJHXwsoyqd3HkxxrJELoVB1oIb9uNMV/cb
 kpiX7xg9JoeT2Vi50IAsOyAfzO52BXywVBOyQQrs7gSpIiyFF6YtbXZskG70gZE/Eh3e
 FUfB0PUBiQyExNTEKlmhku+e4v1pd2C3H5KtVKB8tMcKuCb1labNoEvSsupHvHJL5Z0+
 NJpfoLl3Nu7lbtYXrGekVPqZchOheeNK+l1WDhkSYinTRQMmxteIElGUMcGqIVsurw/Y Ug== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k60gjq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 16:20:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESbdHWO9VbaY9lamrkBMN+AcmMkmKTMnV02cwXmVe0hfO0w4kCmAnvSayizKR297ZWxK52XSyPKs5RDB9XB049Gx6mpXqaUNYxbo90WOcbnh+/nis5+jKLOqo3aCKPnXjzrrpSxyXDL8tysb/tlDrA8F/aj0p258LQJv4SPI7uttM+tHFs74xwUmetxjtCDklgTUiiC34ijmz6LSwWYcsuKbBSoUnRgcT5TPgilGaPv3chMTDWbDmt9iq7k7pbzdXKlGe105CspJQKBQE7LC/8FxMj3yaF8Aw+dSBGeRxE5YopHGK9DiAz9J/yz8tTwUK4fekvkvkcup2pVVxutDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUmc40PaVsqEiBKpg17bvS2pJXiGG3rQ2VNuD9jynPA=;
 b=O1OtoXOxwcSPFQN5PIi/nQaJUOdTl4wsPho/TkA0DVAAf8SSgiEdPVRFfT9V5sw+NLWwH4RIxcddYXbwH+3WgBVOtVZ6p/g1aFnrwOOyR9o3yezTGBP0aYICIXL+0RfCG0Njt1rHwAOR3z85Jdtko6jX+o/1E+GZ5/46SAUi7/ukgodceTpqaSGLdJ3ac9W93ttjjKiH6OVZsulTu9yeFGsnt7lUF4SewK84+XIXWchko4plfSeuH/LLVg6a23A9Y3CJNHYaTWQc5kyHbEeCF31bNHmOYsKVPuQ0uLOrYthYOiHfaxo4QiyKOv0Zaw7Vz+Rw9XCqTc4kTPmLU9jZMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 by SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 16:20:44 +0000
Received: from MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::f606:748d:1395:815f]) by MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::f606:748d:1395:815f%9]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 16:20:44 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] at: Change when files are copied
Date: Wed, 11 Jan 2023 08:20:26 -0800
Message-Id: <20230111162026.2318717-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0336.namprd04.prod.outlook.com
 (2603:10b6:303:8a::11) To MN0PR11MB6035.namprd11.prod.outlook.com
 (2603:10b6:208:376::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6035:EE_|SJ0PR11MB5613:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a16688-b6c1-4dbc-d5cd-08daf3efc9f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wDoEC50L8JQbvfLcYJg2XqZckd2VutDMBXE+51bRBeRXsq23dwM9gSgGRra8CtuJLfdPqsPBgOu6Rhl1yswoWWxdO4A8svyPzTg8nOoFXB/HtM3sYKLRa7LgRQPr8Ak1V/Xx07xl/+KZeaO+hqtYOthPDIdrOES6MsntJGrarWIb+uOjAnnlYEEuQtTlCxMTYCqnLMVnon4DFJBc7IIeSu4ZPzE5Dg9ZoTUInM5VN1KAP+UYBnbPEpLqolq6LRSpriqnEsczXVdMl7Z2aHkNeb0txIHq7ll6jXZp3RVHhyZ8ISqZATDpVrI7tFbO4QLW0zckAKpyIWn9cY1FG/+dZt9PEBzqyqjbp7IdTWdsFkndK8uuhvuQr0HMYiFDBH09P4Q9i7RYPpYTI+qoROO9nGGtylFZi/KbYAP6zS2nnMPlybUiawaBfwZJrYo2wPVVrE/SOtFh8rksVm8qTvZKFEmHtM5YkTTMvtROQNMWAJbzFtJ55rnKybDlqZ3xUJjDeqiBRl3cczI9EpAUf097gXLu9S4J4/IqE1je2aKtfTB4EMAl6nNvhwPi7UjluAx/wwizy0Ym2svWmplMe7W2PGlagg6rfX5c1OL6fyN0tQ+O4BpuwmjcQFUXB/Caaixm46lSnL7sldNAIVBM6JIaSBWjq4zKbWEm3s9L00vWIaI8n/XkE3B0NYeoWE8S+kYGgBVdp+NwurpRf26N7aJuUA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6035.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(39850400004)(376002)(136003)(451199015)(6506007)(38100700002)(6666004)(38350700002)(2906002)(6486002)(478600001)(2616005)(1076003)(4744005)(52116002)(26005)(186003)(6512007)(44832011)(5660300002)(316002)(8936002)(83380400001)(36756003)(86362001)(41300700001)(6916009)(8676002)(66556008)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gVrXmZPk71pJIU0husJ4eeNc5KYQQNDK8m9RbYkwQFyyDp5q5kdd5zDboc8j?=
 =?us-ascii?Q?Nraz1QE3Eb1Muqhh+X7AZ5x7R/HhPvNQOjp6S1KvdabvFm85z56wzxGukdBJ?=
 =?us-ascii?Q?EVk7UHro3eI8KtRxsJb8btEirKKXiPQLP7rmo0Pn57hVtN40kVEm0dhMc4za?=
 =?us-ascii?Q?X5BQrLZykYKT3zIWwOFrRNvQ6vmBZP2Wp6XbCI0qcuov5MyxS2LLZviBBFnS?=
 =?us-ascii?Q?oLqOUP218TuXo8gzhK/IWiDBj//B0Min2Ytaq7TxhAmVkfTd8Lrps8mqDo5W?=
 =?us-ascii?Q?vE96G8imxOx6Jq6phzOa7gQr49Hn0Z3OO01j7YagAhyAle5c9fkCS+Ze/Wjq?=
 =?us-ascii?Q?L25S4MinGPAZBJ2KwCutMW4QD3niOQGpSQHaJPoNO5NqOHRbQBf0w1mTRAU6?=
 =?us-ascii?Q?ccC4N7KdIFzvU4vbqmcMB+1/2PfhSuCVOfd8yw4GHZ6Fm5SveHHPUcISAS/h?=
 =?us-ascii?Q?tXKYsXddOSNBCERIQM6iAXeFlXJldu1XAlMU6p1ZYcSNcpZjjxtYOFxnr7KN?=
 =?us-ascii?Q?DfE5ca3Jt+gla8fgc5fHFxjTDQmt11VHvY3gzWhm6Uu+jritzgKRMfFWpA6d?=
 =?us-ascii?Q?xeJ483wX/frc8QlFltQNHPWAfB+fBNGE6gvjnGiwh5epAzn3RO1Kt7cywC8l?=
 =?us-ascii?Q?g83hPP3jEVwGjc7myNbr7s11OzHgQVyKbcjOWT8MY7ZQLw0d5q+oyqKFK2Ri?=
 =?us-ascii?Q?hY0pECuGxKYuG6Y9UHgrgUxhb+BfIKc9FROyXs2XVNI4TAd14GHEfrGe7XNX?=
 =?us-ascii?Q?Wl4eEL8PmuyNBfHjv93YfZVtm8AKSF0SiS4Ch2ror+EOCrYvfeS3Kx0AiMxI?=
 =?us-ascii?Q?xHRVRca8cgR6X3GfTeDtPjhrXDrLB/ANwu6HEAmLWe2diboR7PJM9W5msZiO?=
 =?us-ascii?Q?Zgpz/S3tkzYcZ9IS9l4rQYvNfTVxfEoUVrGhtBuXbKGXCiwZEjCT/X7U3poQ?=
 =?us-ascii?Q?e4INdb9Dlh54vpl/BO4Z1qr0p36du6bbeUkr0weeDcRCsiTM0EiQrFHTipBM?=
 =?us-ascii?Q?AnovzeYJSqbWpGiiTzikoiML1M0Bp97X/hRPktwcO3rSxHS3aJnv6MTgMARv?=
 =?us-ascii?Q?Q179iKTBfSwpIACPO1B8BDPDMVxMY5JjkPhX1heh6d9Z4F/qoDCrqk+TFNoK?=
 =?us-ascii?Q?g70dHgOnKSwm15FkDirwaEouK5itS1CrtJtEkLxbczyiwgLoOv7l+gT3ff67?=
 =?us-ascii?Q?aTHNRoKuB3dhMPJseQPuo0q5mY/l8n/ilGQrpR9HcgZYwzW7R8JkZrJII/Nl?=
 =?us-ascii?Q?yE7mZgJu9qVWInMWcwIs703WQBNIu6u48wYn/yd9Z3MG4bcq7r16vTKfNIzA?=
 =?us-ascii?Q?qstE+ldj/brAmYBKw4Wf8urwTy53nl/kz95KhYbZ7q5cf8WcyJnF1rzvnhUH?=
 =?us-ascii?Q?pMUrvytfqgq6AMIWl0o+Fmm1Ks0JuIEHbZoAOWLq3T6GxVM9EuQCXmmS4RA3?=
 =?us-ascii?Q?MEOhQIjIWrOHXh19iND80DPkMCWwKgKXU+Ejv6QWU/14iK4ITSYd0BsiUaju?=
 =?us-ascii?Q?gDyW/O5TAb7g7IlFFkgam4e1UaIfLZuFFpwKoDS2KSKvV+KoFBe5WNygXl4k?=
 =?us-ascii?Q?//8b8VJXaqFMIdghZtlUj1ZTatqAvChAArbMNsgya8ojaUYM9F/sLdY+5PES?=
 =?us-ascii?Q?EQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a16688-b6c1-4dbc-d5cd-08daf3efc9f8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 16:20:43.9651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbk/UJD91DR6U4mRGNwx+/B272DrJjIgonvEIOapwdnxc5UrN2G3gIqHU76tr3raCRBHD1Nqx1SUXUUODArHrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5613
X-Proofpoint-ORIG-GUID: BhOrCaGAUrL1vgD45i0fXAbUORiqt4Ad
X-Proofpoint-GUID: BhOrCaGAUrL1vgD45i0fXAbUORiqt4Ad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_07,2023-01-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxlogscore=596 suspectscore=0 adultscore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 16:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175755

The create_spdx code relies on patched code, if files are changed
or added during the do_configure phase they will be missed by the
create_spdx process. So we need to ensure files modifications/additions
happen in the do_patch phase.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/recipes-extended/at/at_3.2.5.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.2.5.bb b/meta/recipes-extended/at/at_3.2.5.bb
index 87a436173f1..c0c876a6443 100644
--- a/meta/recipes-extended/at/at_3.2.5.bb
+++ b/meta/recipes-extended/at/at_3.2.5.bb
@@ -52,8 +52,10 @@ INITSCRIPT_PARAMS = "defaults"
 
 SYSTEMD_SERVICE:${PN} = "atd.service"
 
-do_configure:prepend() {
-	cp -f ${WORKDIR}/posixtm.[ch] ${S}
+do_patch[postfuncs] += "copy_posix_files"
+
+copy_posix_files() {
+    cp -f ${WORKDIR}/posixtm.[ch] ${S}
 }
 
 do_install () {
-- 
2.25.1


