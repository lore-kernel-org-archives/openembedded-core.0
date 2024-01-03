Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F20FC47077
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 04:42:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10330.1704256947198464990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 20:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tK+U8ix/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17322eae69=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4034altQ013607
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jan 2024 20:42:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=+qYf5BnQbqgJbqpeO4KOFJMF5xLtoKTr4Gy6gDFGlIs=; b=
	tK+U8ix/+5UFdUqEp53lnX8jGRN2Gg6SgeWmyqoVY/PNXLeieKfcK8xoF7auMxMy
	uwlzfTir68VloazpT/eXnf39FDALL5pwO9xHwkAzXO4OmDkFKczRnUfIExILjkJz
	PMhAlq8EfnMTnX/SqQCf3MNHjrPlpjwwX4MV888g2udPWHmpkvgnguyxha5VEMdo
	h5jJ4KMRZh0SCrCM075vcGDNYKxfV0oPqVrUzdXQpN5JFZ0rrI2xLmZ0NrglHzCb
	pcKhaL9Uau9cXL20x+gr9622b3BfMGFyzdIyBU+qmwui4fHHKfB0xo4eGeaLKdFG
	DUAahZHmqjU7qZXdyREAXg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vakkkub69-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 20:42:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hz/yFIVFe/0ZAGdpUbV6ormr04d4Ank1QaW8OJZJC7/oXFRDEjpTZyyb9m3bax+1u1J085RwpTyvyrIHAdZAKea8rQjoUvf3KpJbjwtPyIDeRQYzpljEnYiEqZHQ/KCWqTnyMMO/xeS65yLjbW2GjzacBF6XhPNmVplKWCX9lujX1RDhYxqnB7787/EXls0Hp/uH17+gFHnbx1mkPrYHvrHG5aMMancAo8Wbp8XDhwoTc868rlR1JLOFNWGBHg0L3vL+iMNSsEaqYIeuvoc3+AaCqPmH1vMV1sS8xGstUc6lCJ6sftxL2vtKaDELNfYC5vrlslxkVF1qh/mUVjdcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qYf5BnQbqgJbqpeO4KOFJMF5xLtoKTr4Gy6gDFGlIs=;
 b=dyr2sykULsXrdICEQPBeZrzbm437c91L6xIPpFTd4nTgKLyPGxnR0fETlJgtdm05nHKgljIC8IFQL9SHjnC+V2cCXEygDc3wzV8rpjZrumq7WKyT6Iu36xv52IBdZ3yFdd/8g/EDzg+2niTlfGFZ1bL1qHAbBO3YsF+eJeH+fakZDp9xTC/V4mws2ZQjyV22gOe6jVpQ60DynZyLgIgh2XjvKED/UFICoyymKJ7DsokI2zOUp5g/l08nZOIkr9gIPJ1P8V+vo7Cj4LozsJNE8TtrEmtvePRdEjFN1vQPNBA5oa2U2P/jyeCn0LfRW3FX5+gGzjeNHEfmyM0NxzaYYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 04:42:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 04:42:24 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/3] sudo: upgrade from 1.9.15p2 to 1.9.15p5
Date: Wed,  3 Jan 2024 12:42:08 +0800
Message-Id: <20240103044208.2304438-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240103044208.2304438-1-Qi.Chen@windriver.com>
References: <20240103044208.2304438-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0088.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: cc40bdb2-25d3-47cd-5b4f-08dc0c166175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZpOU5shIItIlf6nuZUUCZVoKo3ZzPaCvJ43xcMzki8IhGQ27cW9xEJzI+76otlMtpw1o+KaQj64xL1D65AfLfUW2ULW9d9kMC0q1nOMcOUPccvHED4qLU7UdrwFXTt1Fd9H915N0cWRHXo5UmDybCqkCHQTE+dLtYXt9sTAJcrD74WaXgkkY4eNj0+Gxg7Q/xwBYecd6lKEniv+7bRNpkWhG84tvV3VxE7R3DfNWWruhPDq1fO/domWFwvOpFvhqXflfqT9PGinX8ePpA7pmdx2+EcdkPUdPKv8sG2+XFU3Edk5wnvGy9sC2e5ShQlWQ1DfgK8BYXhHVGnlJcf4pEitv9Haq31cn2QYBqmuT/xMWDKeZBSWO3oWDxxVbPMFS3knC7lFM87qd68bZ6Z3FlMemOo7CTxeop/L/kcUJqKJ1zqyokTzy3+QIz6FwVnuIqDplNv14RaEctBfDhUNcrNA9uDOJUt/F1D/dcGGMTEFoew9mEhP7XytLDybWnrd37oqqbRZIkDbcVmiLDNcXPTsMw2OKqeeZ+MIGJlJQxClyxbFV0y4e3RnyRyvfcNlZWOpu5NVgYFKJ9Z+q5J7VTTIJtMgSaWfPYqGGEfYS4Fk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(366004)(396003)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(8676002)(8936002)(83380400001)(38100700002)(26005)(5660300002)(1076003)(38350700005)(2616005)(478600001)(52116002)(6666004)(6506007)(6486002)(9686003)(6512007)(41300700001)(36756003)(66946007)(66476007)(6916009)(86362001)(66556008)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v4Sqlbn87zLCcTERg83lx9jzaQ8q0HnKz4+xRntWKJyOuOL7sWy15HcmHud1?=
 =?us-ascii?Q?a4+YrSFruUMxjB3yt4d5RLQm/avawcAXSyTvvffQSHsdXIXzX50NMm6DE1Ic?=
 =?us-ascii?Q?4oPJaMl4/XiFaNjnJ5gVsDDakMWSdeNGajXkwN4aM+cqTzVTqCTRUviSiHsr?=
 =?us-ascii?Q?Ngohafe9f6/QgdlupFb4Hp13hKCcnPHkFRMu8kPV9r1+ElV1JoFhnpq11jlr?=
 =?us-ascii?Q?H3q3WQejNfZ2w44HaCjNnLkKYzVBWvfZ5jX/S53kKg8nkUwY2XoWWooEgopV?=
 =?us-ascii?Q?Rzo1OTy6Z8yvk2Qs0Pxlacyd0PHA29MtbyNFbZAOxYfLflTvtja3INvb0lGC?=
 =?us-ascii?Q?V0LG7cDhVXF4P3iHh59N1c9+UHbdKnkJ9sFkNBuT243uWn8lP2CKJChNUZYh?=
 =?us-ascii?Q?x/OUClprCS2AU7Q6I3xddI5p6Xz4mITLf5BzACGG+mLbjJ6HRTSlEGkxSG4Z?=
 =?us-ascii?Q?ram9HEYgTgIbhGDe0nPGgKov4n3YoHbqbJ3omuwPk6Yf8eUPgtfCcYW6zTwK?=
 =?us-ascii?Q?VzVRYNVzAAOZgaJEyprSL1wswCNCrimnBEx7GFxzEp1SpKsfx4XrfLew0Bx5?=
 =?us-ascii?Q?R/HEFKHHqnQEOvuQM1/4J1R3d3tRAlyfrqX0OMN9nlcCIRhKMgiLmpe6rtVu?=
 =?us-ascii?Q?BFVi0TlnSe3gYF4UxSrL2qcg2BdOeslA7IbV2Q2UyNLBrf/PtEDXcpgB8ZCx?=
 =?us-ascii?Q?QCK3eFzAShVWomHOExmeWW7aq76DIa6KSQmBPnvDjGoLvcnYCg0l3v5LMLlx?=
 =?us-ascii?Q?a37Rk9CdtvxjApBP/tlNMTT1CBjMp3SdOQMsLyTLbL+DHh9E+vqF3v6+DrdY?=
 =?us-ascii?Q?oWA3HUGWiFH1lBG9K6+6H4l9IFEzXN9NmIymRrXWat2KRZK44b0og5rnMIiH?=
 =?us-ascii?Q?A4C2P/nVSDph3+0LGcggmG8pbpE4/cVchqjJFTcY42hknxWr56z6ewERKIVm?=
 =?us-ascii?Q?7GZ7rA8LvrjO0weqxhBOaVq25nYmlCX5y7PMDkfwP1RwxhBHKLJFXJ/Pf9az?=
 =?us-ascii?Q?s+cCvO/+BF/lPcxqBlTMU+xMIeMDkj4zfs5T82SBPggz9Zuo8XI54zUJhhNQ?=
 =?us-ascii?Q?GeJHEFq07abuBkNZJlUUYl0FnVeGlGNeN0+mAKhLcITUjr7fuAd66TQ8HZAu?=
 =?us-ascii?Q?ylDpQErxVMuD8TPoWK2rNMiGFM0PSDqgvctJqPba/l0Q9hnHDa/BQnT4v1Kr?=
 =?us-ascii?Q?qqfyqFfB1jc1ENJgdZPN/pJAjszqhOLaMikSEATR3g+HFI7MwC1asO8NDOsX?=
 =?us-ascii?Q?jgNiJsfwpe4n7+CrZSahC0q7/qOOhjEXF5XM50Lb0aWeW1nr484I1Mic1+wB?=
 =?us-ascii?Q?ci/GzCWYfC/sJNOnhY3cu/R3+VXs4c/Hn1Krpxi37fApiz3FEZaisiQl5zWQ?=
 =?us-ascii?Q?LmYdGMMsXizQpKn/Prl/HE1oxD5TS+67H0bQMmtcrmiwPVn2NaHdopJivv2C?=
 =?us-ascii?Q?8RRScn0dJ3ZVph8uN2Vgf32Aaor0Z5Xy9hhPzzv2mJ8oyApsacs3ETu1TZ5U?=
 =?us-ascii?Q?jzTdMAonzq4rSRqfhq9g/UZsXUP4oOw9iOw42g5YcZVpUzLD8+pI3NEEA67Y?=
 =?us-ascii?Q?r/HvQFgQx8kX6uOv1rNzaDwkudipRedkYuSwap7m?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc40bdb2-25d3-47cd-5b4f-08dc0c166175
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 04:42:24.5872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MuoQu9ccVdE4hLTGHTEL+yKP9Oaic1dC2o7I72EQBCRxtpsGbUBtS+Pf7MAjFnUxWN8ug6ExlFZmHHCnuRBB+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7621
X-Proofpoint-GUID: BtBMDKCLNpNwvZUgkKq2-2zoDKb-dKTL
X-Proofpoint-ORIG-GUID: BtBMDKCLNpNwvZUgkKq2-2zoDKb-dKTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=908
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 04:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193271

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../sudo/{sudo_1.9.15p2.bb => sudo_1.9.15p5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.15p2.bb => sudo_1.9.15p5.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.15p2.bb b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.15p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.15p5.bb
index 431dfba3c2..8e542015ad 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "199c0cdbfa7efcfffa9c88684a8e2fb206a62b70a316507e4a91c89c873bbcc8"
+SRC_URI[sha256sum] = "558d10b9a1991fb3b9fa7fa7b07ec4405b7aefb5b3cb0b0871dbc81e3a88e558"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.34.1


