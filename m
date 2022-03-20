Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4762C433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 09:29:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16475.1647768572753476945
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 02:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MlsgZDjt;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=007883ae7e=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22K9TWml005876
	for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 02:29:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=xFVqqjeMkAhqJ3Rb0czwApEvRzMPlK2puoI6v/KEgao=;
 b=MlsgZDjtrL2yphCOrD4FR5bpnM06hJKfD7ZJOnb86hiipZSs89UYGc9ypFG21WmxkpIB
 7SThgO0rarkp55G25grIzLC+TSd3gWHZqz8cm/n/+JjUxxsSxn8T59Yk2/8in0fOeBT1
 znCSmyfLU7bSKlZ8z58f4G2iHQzaAGqYSJqJfPJIdZlyGWme8tLC6vck5zPIdC3HsB0t
 /s8LDiDMgO58Z3eaDfjkZhGoqSgF7kxUJSM82cN6/1IgUuVL3neaqvILI/nR9BEn0Mq/
 8togkpL1tAX/Z72sF0Tp6GNTx3LQg69g91fhZ+72qoGW951pJss/AHSNVMsSMWU/pdjD DQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewaf3rmav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 02:29:32 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 22K9TWEE005864
	for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 02:29:32 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewaf3rmat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Mar 2022 02:29:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUi9i1KTE/RAjBraieMYykArVN0gbIz/XPRShkf0nrM/ckLmmXMuZNTOcaArdRU3MHpnJ4cD1K1lvS3d4WbGN8/Q5hGqlUiiLIZUsJOIRTlWRw1HIRUKJB18karC/5zW89m2yXj7mZh9V9G+Tc5t0jLg+vxkaxQt8yzLZjyYcXQS1CzX6l5vW+BTSAbv10kWInqzEoxJY4fedJH4VOKhlgHRrgQF9o9DHFXyrI6GxfLH1NpOIuZzcE9+LlyLVfMkKKtwDKwFhQLXGCD688GqocGA8r8dQ1KHzJf+UWYozqPa59psb+H91TPy9DGdIHD244Vk++/cUxya41DQ6ZR1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFVqqjeMkAhqJ3Rb0czwApEvRzMPlK2puoI6v/KEgao=;
 b=QGYUkDGo5PyyKvZzO1nmVTntCZnFY3t8HN5S8YC506qQhREE7M62Irguj/VoeY/P8ReT+StT61a46Fv4VWf9Z2aVne6QNOEGtgITX3zZnrqH7p0dmcxmf42MpKa2gj6LjqkAOiSyk0e3Lo/c/PXu8Enb9UQr78VcUYy2hQFDFfXLrgi+RyLMjOOn34Y8yW4SH2cRcWQyi3ALxhi8JF19q2gkRFed4AaWMaUiJUCIEt15kmMiYEh/waguicMFnqkPMUmDp7qda1DM8nC8tyUXq4iYmXZP5Fgq1nhoWeOHC/pmW/Q+zg5aek45o/VCfwiL9mfsHOc0WIDA+fCb8PDbbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by SA0PR11MB4608.namprd11.prod.outlook.com (2603:10b6:806:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Sun, 20 Mar
 2022 09:29:28 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::4ceb:e511:4a4e:17af]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::4ceb:e511:4a4e:17af%9]) with mapi id 15.20.5081.022; Sun, 20 Mar 2022
 09:29:28 +0000
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com
Subject: [hardknott][PATCH 1/1] openssl: upgrade 1.1.1l -> 1.1.1n
Date: Sun, 20 Mar 2022 11:29:13 +0200
Message-Id: <20220320092913.2845571-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR04CA0106.eurprd04.prod.outlook.com
 (2603:10a6:803:64::41) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 120bd16f-38ff-4b4f-d9e8-08da0a54219f
X-MS-TrafficTypeDiagnostic: SA0PR11MB4608:EE_
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB460888040C4979012242AD5CFE159@SA0PR11MB4608.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jRNseU/L9xw/ZtUdKPHpAdO/lMBUxGT25brjwwZ79lbSVnHE1QNX20s2Ia3T45Hwi9ulUqlfJa8ggd2U+wDVdieacuT8VCA+ZEcR/YcJL19h8CexdKsCI6832I4Fy7IC2wxP9p6ot0DEp/0JXvJpSuL5QpBMFLBU4dPZmM3bRsRGBoZZ7OvOc4Gmj7pfAk2TXtTYIFF0QdRklscmBR1Z9YgTOwrGPuPf7Pb0SI+l4hdIGHMjnaFyuo7msfdNMs3KHVGHCMy6QW8NXdthN6A0V/0RCMOeodPg3Fxr/bU3AF+VKYhfpmrExMRiy3rLdOG9j3byJ8N44yMrCPVuo32PfxzBogVVwaPYIFOWqZSqGjjnXLgVIlJ3EpBu0b3c1dGPzONUqeK1StTgO66K38Gz0slf7hz2Z2khzXgHSN09frdCVBduYFVrR5NXVqsN00WX+mazTTgP0YtV4+Fw/qHYubHWRi71HEQgktPqoccwsdI10pJ0scGP8DbqdCiuhW2IY6O3ajf28nUVMROKR+739J6Mji6OgbGnoEo/N9XfX8j8Va1uNFmdRms8tUfMSrIsYJziZUjocEqR5TngMoIkH7vno/C5i8GWj1wSUUu7YjedbarxnD+oela80TZfPRdRykFOUlGBgo1C5bdabHeOk/vWD36rgq+LtBKVtpRq+s7GKRY9PBfmt89Pl6XyzcD9eJdg/QJl+gItuJOMn3U8x3Mg5r0+pGQObRH7/cvfbYu/eIjxnLTbJHzBkt3xqbFQ9zTmv3YkjlIyjS2XulO8u9K+Ib1k1nrcT/vj45CNrKTcGpLZ8rT+C4hlrzDIhdlXLYhOrTAOht68edpkTA581A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(26005)(186003)(86362001)(2616005)(508600001)(6506007)(6666004)(66946007)(6916009)(316002)(66476007)(6486002)(966005)(38100700002)(38350700002)(5660300002)(8936002)(4326008)(2906002)(44832011)(8676002)(6512007)(66556008)(52116002)(36756003)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NHY5fOli/6aze2iaBhYi5f0Vth8bp9IQQrVGnbRbp11CvlHeERmfCvSO2nRP?=
 =?us-ascii?Q?XD/gee/2NvtgmzxCXYJ6Hc0VgD25F1sH0bcoXuXq1I90tLqBTTDO6HxUQPeM?=
 =?us-ascii?Q?ag1n1zyWN0qZwvBdtGrXWWGb7SI+0KBkl8k+Q0IBKI6yt7LZzyxMdPKhlAiF?=
 =?us-ascii?Q?fTnMGcQuWcc7p+VHjQBdN5PfmjwBLQmcwS9udc5Fq0dhjEHj+WW8HoqBzcWw?=
 =?us-ascii?Q?z4UMP6zDHQKtiQVDrjNbQqEdQZzzFe5+zp6SoyMxb/1l94R4M8Puqs3PFPdj?=
 =?us-ascii?Q?95Nf9FFKYSXHlE3yrSSipGUkGt4v3A+ZY50z2H3wjPWv3NGh5bDEtCWWxn5E?=
 =?us-ascii?Q?CVBbzuZBAEw6VIdMUGRkd6N5tqoUj7ZRSBE2/oVn8lZORjq8KZId5S+OJOpn?=
 =?us-ascii?Q?OaXSu7Cl2v0yxw4rmQA6bFr4K4CGf3Ksx+5Ethdm3BteX5oPsBSTdjB6E8j6?=
 =?us-ascii?Q?IDrR+Spyvzs2HLM3xhhMyoBO+UiWZ0r04U1aVkG6DckQyFG2reFwbrqMJnOC?=
 =?us-ascii?Q?c47h5nI/Kgu3yERY0rtH4VbC+pTeW9qNM+JD3OHt1oQjZS7HggOtd0t0VntO?=
 =?us-ascii?Q?IOkCkoImgb1zGLhubLOuBRMHEuBXjuDxUCT6IM3EmAslTrDYnp/pCPrbzoek?=
 =?us-ascii?Q?Ua8uT4xrxEEgqUaxBYaAwez0t7XrAucKEl/Hso+puvoCnWyVlFpxBhQhp1tn?=
 =?us-ascii?Q?nUp759SbuJgoiXYUh7NHjoIZSSYxJLWP4mKnw8LCWRzG2PSdJ8LMHxxld8wr?=
 =?us-ascii?Q?GlfKUfL3lw48cP2Orn7DBD2ugykf1SXZgrohaEQsTep7Z+ueE/VjUGWiRz6x?=
 =?us-ascii?Q?6RlUDjkSNDHr5U/jwEFGYtaPpGeubq5seD8/EF1irk4INpL27HLbBhaHVje5?=
 =?us-ascii?Q?HPeptVfkSTu+OH+xZh8kElh051VJSsfhr09KqSYaRWnJC160+0K9GUR7sPDy?=
 =?us-ascii?Q?EMhxx3pNv7uGup4mKctJUYW+DGcTnYdFfw1ASXVUvwE85BhDnSZQUeWwHRdI?=
 =?us-ascii?Q?nLw4amY8CQ0QHnL4RnqfGD+Sx96bFYcs+T4Uah0wLGXXjRKGCNG5+e7uXDA2?=
 =?us-ascii?Q?Kc3IzlpY3l1yox5t6RJeMEz2degYZC64q6KgbjfJbDMiIgOP7hEwsIZLUEIK?=
 =?us-ascii?Q?yl9lHw3VLoNkxVbMgLgUmFJAoaZWDlj3IAij24OGoS1oJXBpIF1ETiLBfMb3?=
 =?us-ascii?Q?Koa8FyceeXYTbMcmLIsN9j7MTTcA+2x1rWPm5W7fuCridg/IYfEJL8wYecPN?=
 =?us-ascii?Q?gN4Ia3dp621MELFE/67z/89l+0vQqb/c6wT/qLb3ok5XUZXFJMX9H1l0UvLl?=
 =?us-ascii?Q?Q14mTqWYl1FHVXskSnvBtp2It2vu+zVgnUd/jTYF6cY13MEZvu6Ha/E/6Mlv?=
 =?us-ascii?Q?lzh0lHuV8FsbMN6ya8u4/5ehqgzO6bx19rN8qESOnP7gbvLkwx/9Owt6HhBW?=
 =?us-ascii?Q?rOfV4Tkf4uaVKFCtLa6KONtPXYmSfmFvvD7nYXbTDlbKk6T8Sshn6Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 120bd16f-38ff-4b4f-d9e8-08da0a54219f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2022 09:29:28.5251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hgbK/GglbJ0LDAyxtH10ZdSNshj0pFJZVucwVeienP4AkIzbF05sZMyPdagaKfLwCGSN8XnhKdT3Muh4prDQMF9s0vOEIQrClUeS1gXyzgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4608
X-Proofpoint-ORIG-GUID: M1KjvrA1pldSTBk0ZKV40y2p19WAVzwM
X-Proofpoint-GUID: 37ySeUYuEwBSalma2EbGf2pYkdG_YXPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-20_03,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=849 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203200072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Mar 2022 09:29:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163480

Upgrade openssl 1.1.1l -> 1.1.1n to fix CVE-2022-0778:
https://nvd.nist.gov/vuln/detail/CVE-2022-0778
https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=3118eb64934499d93db3230748a452351d1d9a65

This also fixes an evp_extra_test ptest failure introduced by openssl-1.1.1m:
"""
not ok 19 - test_signatures_with_engine
ERROR: (ptr) 'e = ENGINE_by_id(engine_id) != NULL' failed @ ../openssl-1.1.1m/test/evp_extra_test.c:1890
0x0
not ok 20 - test_cipher_with_engine
<snip>
"""

The ptest change is already present in Yocto master since oe-core
commit 5cd40648b0ba ("openssl: upgrade to 3.0.1").

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../openssl/{openssl_1.1.1l.bb => openssl_1.1.1n.bb}           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1l.bb => openssl_1.1.1n.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
index 50500eebc2..df13abf54e 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
@@ -29,7 +29,7 @@ SRC_URI_append_riscv32 = " \
            file://0004-Fixup-support-for-io_pgetevents_time64-syscall.patch \
            "
 
-SRC_URI[sha256sum] = "0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1"
+SRC_URI[sha256sum] = "40dceb51a4f6a5275bde0e6bf20ef4b91bfc32ed57c0552e2e8e15463372b17a"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
@@ -204,6 +204,7 @@ do_install_ptest () {
 	install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps
 
 	install -d ${D}${PTEST_PATH}/engines
+	install -m755 ${B}/engines/dasync.so ${D}${PTEST_PATH}/engines
 	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
 
         # seems to be needed with perl 5.32.1
-- 
2.25.1


