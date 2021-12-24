Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02663C433FE
	for <webhook@archiver.kernel.org>; Fri, 24 Dec 2021 10:07:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.43827.1640340470835006810
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Dec 2021 02:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Dy6PU5Az;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=79929afc47=kexin.hao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BOA659i025823
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Dec 2021 10:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=TwJzjTXRLVoJe6Ihv4b4k5a6LgIrVCfdqgH8bmiahpQ=;
 b=Dy6PU5AzLU2qIRI3TLkWdKNFXArEjxLxSZhbI0V4iLD0Anb+dNcxP8KhPl/u/qephL41
 TBsEnIcnSZdPk6XHFqqoZ+gXYSd3baDXqVabX+QfhQeuAH0aK5PGtZHxrWtJq7cLxl2N
 EKvQaXTcnlWW2EJgLd0MJJQ/PR22PLhO8uzT/NZA/OGBRdqwK97BDHhw0YQ+/yKWGKuT
 jy7wY00hFPb1jJZb2uNXgVs3+yuwfPTFcXufi4F+DfXDg5RtKopgDxPPU/L5YtWOtLLQ
 P+OJz0bK/CYjVpS0RC8hmmTInss0qkfTE0PowX3ARTup5Z0E2qyhrwySK1xy5e/OYtZo DA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d55mh06mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Dec 2021 10:07:49 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BOA7n42028522
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Dec 2021 10:07:49 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d55mh06mg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Dec 2021 10:07:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGjE2wxD0+Sw3PIQA9DvueH5CuDCjQHIo6WwfYKuEAXkDGFqp8tgNAojDjnwWx0uMg6ct3T3D6Qbh1z2aQgqVB+P+rmW3lEJEHGC382LVSuyWGhr6NVcWP9w7K+kdFChshhcglQtUdYGb+vCPlnk27TjVo7bOwVB8lT2zQJTicl6fKunHtFrg7i8lmkD60nQ+NaqcvoMHN762dcuFMPhr3SRmAkw0IlVC4aNJeSrbSevcxA1wLaa7TJQpGvjS4dRnafjSoGgSFrXbO8n6bvarrEHfM+n1uTb1mBXdtmpC0+SRP2DfD/q5BbcEznva6lG3zs0Yl0yUottukmr7FbCgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwJzjTXRLVoJe6Ihv4b4k5a6LgIrVCfdqgH8bmiahpQ=;
 b=b63gQWn+lLXgyvi4ry36QYzW1AavxxOh9N2ZxP2XCzpHptV1/ZfJvMntx0sE20+2uMMouvP93hpJme6YetHkrEhSdw6TlMz4FG5U/v58ZvcLCg88TTQoSqlCAcQ6a4H+ZOgCgkPSeEECn8j1cuP/jsxyIohArcMcq/sAIDEZL2+8OpeWyKT0uoOLMqg1Q1sFRqTbNstPvhNEJSugoel7vSDVWAl2RdFYRC4CJGfaQautcPisINtQmpPBsseDnosPbn26HJJHXdQdEDaG5082FikanH9uMwnhD0W/Imhz+xQeT838x2jqurXwhvtd5QefBOctRk+Jm0fueT1NGTuYoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by SN6PR11MB3245.namprd11.prod.outlook.com (2603:10b6:805:be::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 10:07:48 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::75f6:fec6:8c13:2cff]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::75f6:fec6:8c13:2cff%5]) with mapi id 15.20.4778.016; Fri, 24 Dec 2021
 10:07:48 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] armv9a/tune: Add the support for the Neoverse N2 core
Date: Fri, 24 Dec 2021 18:05:18 +0800
Message-Id: <20211224100518.3561765-2-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211224100518.3561765-1-kexin.hao@windriver.com>
References: <20211224100518.3561765-1-kexin.hao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:202:2::22) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4508d763-3ca8-40a7-c9fe-08d9c6c53d09
X-MS-TrafficTypeDiagnostic: SN6PR11MB3245:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB32459F12B2CDACC0171EEB88E27F9@SN6PR11MB3245.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HZ0aE+dJKnESMk2+ni/aiB9cmIQ/Aqgc1H2rPMkqOCjVB1IY22Q4LeTlmVr+aAb3N35U6cxaWS14xfi5Ta1jGVqE0DdzzKu3dG+H6dB/C2kaj4n9I2IxZ6fW/SxIqbT5qey0AvUz52A8TGhuPHy70fz2RCcZSyo3zZjzhRDHNfxtkb1GZkzhrTF+X5Qd0aIZvcCUyjoL246lP5eFOsHXABHv6V8QU9KJzZDizNuSEhoG6RH7K/orVBBpDdgADZLY/wzh1d0MvakR3OJhiPXOYPU9Bnsw2YJmfhH6R/j7apd2eKrfd0bkrWQ8kNdYhXSdeZyTK14DBrnre1OGtoW8IB2nePCHvCZIxnAD6Q1F6L0/NTGIcelgerjTG20HgLjcdAdecuqFqm0abs14K7Rx2OpDNlPkd5prRSakT4Kq8nczp1FGfto7i+AAATVB1sAp8FSFlZDBDrk9puusoJqDevaXfIhvIOUP2UZevRLRbm1onqzxTNFx6bAzIioLY0/SnLHsgpKaR4xfIVdmNvPvdNRREDyT5CIT12I6/cv+SK0tm4sKc7Ghv/xNyH4dQONO12pcNH4Mkcl+kjrAiv8NDHdi8CzF+7nxpSo+jeC7JmXnIj0VtfRanL6ndNs3GHtmh5WDQzmlBj3/J8WEIJDSyPx27Z6Xh4nCf2czJ/G6TlJ+c0iTbsqLjQH6OKDvuaumFPpk4l5bIczzTUFT0RWLxyXjMXYoef4BK6Vc8HF03Ik=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(38350700002)(6512007)(66946007)(6506007)(8936002)(6486002)(66556008)(1076003)(26005)(508600001)(66476007)(4326008)(52116002)(316002)(5660300002)(8676002)(36756003)(186003)(2906002)(6916009)(2616005)(6666004)(86362001)(71600200004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IsvQ4dZ1W8gmnjDf/Ea2VUY6ARYBTFUkUQIgXWL5XHby85djCsnvmxef4Aej?=
 =?us-ascii?Q?dIpZ22s4Fj3eWabDRr3ASrjNIDo56cKuH8IhgCG/5YzUgbo8siEblWk/qyDd?=
 =?us-ascii?Q?2UyEj+EtEMkKzr5KOpjWfJe5rdmkuEcGI97VcCKmciYe3BeEkd88CR9orprn?=
 =?us-ascii?Q?CjYqyUJ1FqX+XbbNRBw9zYo/NfvvVBrbvDkvHb1J8C9kuWl++Y7HsFdrRmIH?=
 =?us-ascii?Q?VI80zaMqaaUY+E9iJPN4F3DwQqQokQE2ply/lZl39w+Xpt0zbZjqI987iM2T?=
 =?us-ascii?Q?EwcIs4MpfXaygQtFd5yvm1iJt/d/n7zpp7sT76jiKrjU0xezhDHENiH2rUQc?=
 =?us-ascii?Q?bZY8RZ5BSvDE5zvbP/8aWQFFXwZ3+oSzFlZoOYTBqvSaYLVD8bI/ezka8qsf?=
 =?us-ascii?Q?iG1DXY7zh2W1G2AaW08qMACeYAjUvKretZKlBK5FODCv2XGUn2X/rdoUEYGo?=
 =?us-ascii?Q?UfXonklJLk5omtxNGczgX9IYJjwKw9bWJMEvT69DR5uOgSnIpfz2aIoMaItD?=
 =?us-ascii?Q?MefpL+F2JMWq1CH+xkcffM30k1kH4KH18WIleBx7FzV5Hm7q55PZh528Lp6a?=
 =?us-ascii?Q?+2Lsy6qZmTUy4nSAmJjrr+/sNqZGUi6G/qwcM0ees8esbDJw0bEL5AevtQIC?=
 =?us-ascii?Q?F7sIm9iyhQH8bbmValLqU+BayrpizifgIg2eB6MWN+bEquD4iqUtug63/f+Z?=
 =?us-ascii?Q?mZ/GZqt8tEyW/zoWNkSHf5CoRVROF6TxMhqFVdZ/ngqId2E2LTFmn6DM68t7?=
 =?us-ascii?Q?tA1UgzPuaOdSWWisNmGHY7dxFk1J4PU7WJCZlLwtuGekA+Mm247bJGKi9J8G?=
 =?us-ascii?Q?8MoKGI5EAc7crRh40AmkPL7Fsi4PuUdkRZvydPJ8o38CIOZ5yOLfjL4xEcNd?=
 =?us-ascii?Q?wb0EQbUSKQLIU163envXs9xvimGsZjOEYS2u6JZTbxD5dOi/XF650lnqGot8?=
 =?us-ascii?Q?Gi3qQqm/ZGddprvw9ZIdV/+RnHOu+Kf3zjupKntBDbbJl7o9nVurmXXbesEO?=
 =?us-ascii?Q?S8iyGRmSzcbmQub4co43yNvZOFify3/ZF865kD7p5FRtyZFjxFTMiBSHWIiV?=
 =?us-ascii?Q?vlW0JH0Uwzj0q1Vf6xQ0QqmQEPl4TAj8LlzkXxWIQnqSK9sR+ijPJmIFZLG8?=
 =?us-ascii?Q?PG3y+QQO++Gs/02UXoLMJoeEO65SyRrCyW1+9/RdDGEkOHDXxb4Gc8FcG7mC?=
 =?us-ascii?Q?ZR153YLtrr7TWpT7LyqloXhbipgxG/H1hUFERp9WZABDpxiXNLOowKki9cag?=
 =?us-ascii?Q?ymsrem74xaNd5pTfgND4SuGcFPV2d0AvLBqNboQ1AuA4C3p4pjbrEn+JyPf/?=
 =?us-ascii?Q?sBxpOUjXdL/wXEfyxt5FfJaDXpoIHBhY6+qC/Y7ZUN/nBP/A7ySsD5YFkrlj?=
 =?us-ascii?Q?Dnlvh/rE2gfwFFCSuCnKZrmalBN8wSSvsK1zaXb1RJ4G4RQ/vn9hecmxS9JU?=
 =?us-ascii?Q?4AUtp9Dcj5lHM5GL7cOizCrYe7US0s1zuD+N12VhFhxfwj5Zo/ErJ9Yef+Tv?=
 =?us-ascii?Q?1uUs98pJPZXRZMATP2bffuRiFcZBKM+EczAwrZitaFHdYBmG2uTvnYR5QN5Y?=
 =?us-ascii?Q?8/8QuwA0/HXoHMjEmf65npgkzBHzfHrTBW8mFh8cWHDG7TjIVn5dYFW+JXAb?=
 =?us-ascii?Q?axrcPivIrWv3cUrKyzCPvA8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4508d763-3ca8-40a7-c9fe-08d9c6c53d09
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 10:07:48.5950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aikpKKaL9ZCjlZpAwou//Z5xBOg5R2CFzbZsTgkGFX0E58cI4XAOEyRHTgiaXaixDSRTBPzJVbNqDLJ31fsxFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3245
X-Proofpoint-ORIG-GUID: twGzZ590CD8TB0qkBQIxAbqoIzNzl0p8
X-Proofpoint-GUID: vbpMpkenJ2Gwqdn756Dcm0m91UL7eZTs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-24_03,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=412 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112240049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Dec 2021 10:07:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159998

This adds the support for the Neoverse N2 core, even though the
Neoverse N2 core implements the Arm v9.0-A architecture, but the support
of it in GCC is based on the Arm v8.5-A architecture. Please see the
commit 50d9db203bc3 ("aarch64: Add support for Neoverse N2 CPU") in GCC
for more detail.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 .../include/arm/armv9a/tune-neoversen2.inc    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc

diff --git a/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
new file mode 100644
index 000000000000..36355f7bedb0
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
@@ -0,0 +1,22 @@
+#
+# Tune Settings for Neoverse-N2
+#
+DEFAULTTUNE ?= "neoversen2"
+
+TUNEVALID[neoversen2] = "Enable Neoverse-N2 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen2', ' -mcpu=neoverse-n2', '', d)}"
+
+# Even though the Neoverse N2 core implemnts the Arm v9.0-A architecture,
+# but the support of it in GCC is based on the Arm v8.5-A architecture.
+require conf/machine/include/arm/arch-armv8-5a.inc
+
+# Little Endian base configs
+AVAILTUNES                                         += "neoversen2 neoversen2-crypto"
+ARMPKGARCH:tune-neoversen2                          = "neoversen2"
+ARMPKGARCH:tune-neoversen2-crypto                   = "neoversen2-crypto"
+TUNE_FEATURES:tune-neoversen2                       = "${TUNE_FEATURES:tune-armv8-5a} neoversen2"
+TUNE_FEATURES:tune-neoversen2-crypto                = "${TUNE_FEATURES:tune-neoversen2} crypto"
+PACKAGE_EXTRA_ARCHS:tune-neoversen2                 = "${PACKAGE_EXTRA_ARCHS:tune-armv8-5a} neoversen2"
+PACKAGE_EXTRA_ARCHS:tune-neoversen2-crypto          = "${PACKAGE_EXTRA_ARCHS:tune-armv8-5a-crypto} neoversen2 neoversen2-crypto"
+BASE_LIB:tune-neoversen2                            = "lib64"
+BASE_LIB:tune-neoversen2-crypto                     = "lib64"
-- 
2.31.1


