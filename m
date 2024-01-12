Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27762C47077
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 02:44:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10907.1705027464791794167
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 18:44:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pK1cW+p8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17418cb69f=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40C1U72m009163
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 18:44:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=tMXbMGdJbyafshX2vz
	AMzQF0qzeHiqiW4y62NKk7hy4=; b=pK1cW+p8Gtn6YeC+sFpVXnRN37l6nH7gi0
	WuVgyZWkpnc9/4Di+oZgLxcHR4TzMZ5Sh+2Krm6tCzYsBJ8tjZTdMtjxhVf8uhNk
	U+ejQRWu8SzhwjgOZVH0HHOsxL3DhfnUi0hkrDGm1FpEn0kqcBeEElXO4nyg+Mz2
	X833HvpQ1xMO7RgELcgy/fIB6Zr5rNFr1l/tSnETCTget51Cvi0+GNhGSVpEdOfE
	oLSawTYPFOu3BkVnlLDgUzHXl+hI8dbQ4y6txBvucfSaCSyTvYL9v+nzV6R9hTL6
	o3pofy1ayMETyaF+XWBpBZDo9lkb8YKPC09Z+bDIza+nDVuWtniQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vj72rh7p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 18:44:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VymBLDqX3epjHULEvFDNqB8ihG5NruRA3dWqhyvqVQxv29fP0QE75hN1QbstWT9mSgXCxwHh2QNFmnRPOqcvHIwDNqTVtfVq764TR8BwoJ32VPRjas9oKKOfhqH/cdPAaSqrUIdgd5iJFtZFiWiVfRjxBDxh6jArYCj2rrqN2nAv5VJKP96oy0MrEMtmy5J3xiN0uyHCEvW7TIamZGeU+AEd7hiWk6qDVy0TUB+hov2u9GJwGgjEhRFp14uy/PrAnwNDL4J4KMNSkBgXD6JGyLAP7fIwoHQmbZUr/FWEi669rF4ffn1cQsabk8SRBEaObg2tkQRaSjNXN9/9Mrqu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMXbMGdJbyafshX2vzAMzQF0qzeHiqiW4y62NKk7hy4=;
 b=cFYR5nKjvIhrNGCLUNcayHBNqHuh6Svz7VoqDPt35u/Tzw8XfwUJaQU/jR7T8HP3QlKgBs45hFO7U8aoEOsZEIFJuE72I4iEGPlzOA7pHTvUd2dqK4Tk2l03G++ZF8kHHP1iMW+RXGoUOP+UB3A/ampV536CE7/7o01ELd8MDmjkzhh9Q2dC6Hcbr9JAB2m21R+Pc+ABLSwBDn3f6u3pWqdzFq+fU13AMOfCFtjYPIEcsDgNq2YWxwWWxEiqdeXFlsAeGSgc7P3sD0dQsMG95Fql42j79GDthBjJySOhEL+j7CMVVePeJpPi75nOEEJ3SMkTL3e6woZzEAVBnY+Qvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 12 Jan
 2024 02:44:14 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 02:44:13 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] kernel-devsrc: copy source files under tools/
Date: Fri, 12 Jan 2024 10:43:57 +0800
Message-Id: <20240112024357.2656128-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:4:186::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 40126057-6ad8-4110-cb14-08dc13185cbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	havBxKBSA+5yEUmhTpLg6h++qZifQKvZu0zFU7TmSs+e9JaOjb+WpvUL+WO8dED1YkHu8IERXasOgQW/40FyuHiBeoOFSNaNd3V9FjnSBaGI6Yh9g2qmaw8Z51j/hP9WGaU1S+X4Ou3NpTlk93AJZvZw22eoQxtMyr1joEQUVGj3V7/y6VQcFkbfX9whu+wN5ojb06GjUGm9FC2WwHMZ9E5B2T7wnNdHO2UGJBzQ+XA1NeMP7VjY9H4S5u9tX+J/b2vlsw6zeCCpmLZQZ22bs5/l6Pnfq1MhVjH1oo6P8YoSXI/2GlZqCxskdBPvDqUuvhwY1GHChaEZV2yfzoR0tsAlfclrqBnk0ROfc7KaTKfok+HlvADVGpTXBmdbTMmlWTogdneBzdacNzUngX+D29EQhsklY3s+Q2tzSOrX9BJEDRU8p47HgHTCnhTVhy+5FMqtJrXYHATXKOQrWvPS2aQX6+d51D27bFENNJpu/AqGbs2/Oh7XbwCNnLeH4I49BAtG1D/lZscPH042DtEcJ8J4ZGY6M74CiOVbue4wgz6WRw8e/DvISYwLH0oNO7PbwKwtpNPIom438w9um3KbtJOsREsnwBNZ3bJPxqIpeSUigk71Fsu8pOXAmaqmKAaK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(366004)(346002)(396003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2906002)(38350700005)(5660300002)(41300700001)(1076003)(26005)(2616005)(478600001)(6486002)(52116002)(6506007)(9686003)(6666004)(6512007)(38100700002)(86362001)(8676002)(8936002)(66556008)(66476007)(6916009)(316002)(66946007)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Tf8LW4fME0GoNCEFFnx3tqMl7RblLGR2y67Kunp2OKjX+fk6VSa8GYjpVigM?=
 =?us-ascii?Q?K83PeIgtPJctEtJHkrUEov5sODeXkWvWXpt68+RiGNWshhgSy/6k0ImvxJN0?=
 =?us-ascii?Q?IQ/432jBFxg9JBUR8xFjOj1tmOzmG8VnK9am57m9Tatoo/wMZBbS/HehjT3V?=
 =?us-ascii?Q?75i4zCasZ/PGJCntl3KgJBDM8XCkwt5aHI3z7XFy3rmyYAC47sGq2RHx2pqm?=
 =?us-ascii?Q?b6jEqTYR+wQl3yd3gHotojpkBkU7CB5yf1WaDaJGa051d1Ppr7nx8ur/Q9h3?=
 =?us-ascii?Q?gkacN/KlLSC9koEEfb78u9hy7pimRLiFQdWAc8mpovFE+qVq2mz7ZVYwGLFJ?=
 =?us-ascii?Q?5bxGhbOpzdl7mfc//nIb2NOCW9RMQPOFOqmwVzhnIAnAlIPGs88SIcruRQzA?=
 =?us-ascii?Q?HI5SN/EAe459HIljnMx4fMmGPdoGyR8W/9UR8pD7WK/gXMqQrdPF1Acp3klf?=
 =?us-ascii?Q?RI053tPSq/SzWEfO9Db6Jp7fk1i3l90w3p9Es1GBSXDpi8ssZsoOXMSndG0n?=
 =?us-ascii?Q?MfMjpI4xYqKf4aj20cQ03qAas+tk6Mxrw5yQ3ixty+Am3U3FPLfejLHg3qk5?=
 =?us-ascii?Q?nI0wRYoGOt2W6co6+b2zXmFtsBC2iPzYHTJBCHU16ZaRBr083MX4yn1jYQc5?=
 =?us-ascii?Q?JE4KRutbk79Tfbsd8ZIGNq+iceWEeAzjzgeXp6MreVpP+5Tyqs6IvYNf4S3A?=
 =?us-ascii?Q?yNuamFUqmuRSBU5SzWyd54qAgdXXoRJDpMc9DlQJEhu6wUAxDggQ/qSwTRZy?=
 =?us-ascii?Q?/6DtTnOHL3mtTRjhLpuG6SY5KBtWAkOqe00e/SiUz6E3o6jzmNPtaM3gXzwP?=
 =?us-ascii?Q?Y7XMjla6QhmOHgRLtcKZMPB96sHOxOVMZ6VAWFRSBkL1y4n6yooazP75fSIN?=
 =?us-ascii?Q?18G/qK1nY3hu68FtvqrlnFR/7JSXCc3xgbrbs+SH4rx0n3FjNmdkmaeTCSx6?=
 =?us-ascii?Q?rwgoNOoe7v6zASNP+BKzul68q43f5L9r6zLwabrUq6bZtDiqJWo0kN0p5atq?=
 =?us-ascii?Q?8fIs93qT6iGbOac68b9pxZhKDPzm+MO3iwWHt4B9OkKclNsClYQ5nz4GG36G?=
 =?us-ascii?Q?eEOESeOHlGvy6ilap6OatSpsuqZ8ElRWiX26TWVL85SK+1+9i5hGQUrPLlhP?=
 =?us-ascii?Q?yQP5gjc2irT7c31caPQ/Q8Ptw+r28k9itDjf/wRrEB7WqfDJsaXxDxg8BtaQ?=
 =?us-ascii?Q?UAibFQyH/g/72l200TgSVGrbeEn4U6lJpn7SHI6xQQGHNs0Q1f/I5AhL96Ni?=
 =?us-ascii?Q?mL8wUVHINdnT35a47HSdl2eMkxASb2QWycxfj9mzra6EB2Jsr5KSak9glnc7?=
 =?us-ascii?Q?yDJ8cNuGcRim9ytR5SSTjev7vxB+1NSH8iJVVrC7k7t6Ue7nWDMXBodvAtSl?=
 =?us-ascii?Q?trhC1R+hAo9SL1sQRagtxNjRAKfPwkPOKRdjYgvYEZOFeT/ZeU5Xdry4PYBs?=
 =?us-ascii?Q?Ma0uY/epqMmUaDRRAawut7oN+pRe2a8sO/QFvq4A7bTsMRdSyLIhRcRzFbms?=
 =?us-ascii?Q?cpBsflWmCs3AOjgfGxztrsQwNzu41MG1B84f/BmCJQxevmqyt92zscKTBUjT?=
 =?us-ascii?Q?TqWkcBNhHQtejQADmFdlBAYYT0KRswcx2oH7Szz8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40126057-6ad8-4110-cb14-08dc13185cbc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 02:44:13.9002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1pDuPHsLTVgb4B69PjkxM9DeCjAXesUTn1EcXJKL1nDO+93BJd4pYEWdE5y14jABOF7O6pVWAf88rxBwsBUnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
X-Proofpoint-ORIG-GUID: xCFFP9HJjH2ufTZ1fbv2-BtmeFU4ri3y
X-Proofpoint-GUID: xCFFP9HJjH2ufTZ1fbv2-BtmeFU4ri3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=959 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401120018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 02:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193563

From: Chen Qi <Qi.Chen@windriver.com>

The source files under tools/ also need to be copied because in
some case, they'll be needed. For example, in case that the
CONFIG_DEBUG_INFO_BTF is enabled, we'll get the following error
without this patch when doing 'make prepare'.

  No rule to make target '/.../tools/bpf/resolve_btfids/main.o',
  needed by '/.../tools/bpf/resolve_btfids/resolve_btfids-in.o'. Stop.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index ce5777fbe9..c2aeb8e216 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -62,6 +62,7 @@ do_install() {
 	cd ${S}
 	cp --parents $(find  -type f -name "Makefile*" -o -name "Kconfig*") $kerneldir/build
 	cp --parents $(find  -type f -name "Build" -o -name "Build.include") $kerneldir/build
+	cp --parents $(find tools/  -type f -name "*.c" -o -name "*.h") $kerneldir/build
     )
 
     # then drop all but the needed Makefiles/Kconfig files
-- 
2.34.1


