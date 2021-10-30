Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C841FC433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 15:15:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.20184.1635606920869128506
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 08:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=i8mVmmAe;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=69376fac2c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 19UFFK7k030410
	for <openembedded-core@lists.openembedded.org>; Sat, 30 Oct 2021 15:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=n1x7J0nZXhQZWQSkRLnYkYwuidYWIT8XYgHCK/qkw90=;
 b=i8mVmmAej331dSFWQgYVrILHy6MGt76oQHwAR7aRGJD/kIbsFCbxCSfgrBywGuOEXboA
 IuPxphIGaez5rBNPFjYpg/0BOnVpu7ibedKUR9IxqjYzWr7wZzfINX8Pauv2emhFxJ9l
 2CkOV5Ics/R6q3O/xd8gWbJpbOOLUUb7JZN0F9UKEwE/6Ci4gldF5Iei4A9nO1HmJPus
 hWMuu9tl2oWbRgHqchNE7R+IZ37lS/YpntIt7knA0uQj2o4RnJ1UsVU8fEAxQhnrl/zw
 ugcVV0AZ94aSP2tG4lDFX4vF4u1WfH26kvOXDZp/4p0WpN/ZqHjYdsh4QBgVmMod1jRJ YA==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c12mm062k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 15:15:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGCWJRpwrODg4jl1Uz0pz4Uv5kHqYpNPMMHdnq+pH8ri8Oql+Tr140oUp6AsecfNRe9gWdzdqGbbOoZ90a2FxIkGDJKhP+N3rtXwr5k/32EA1U//c3CzKwnbHldElfvDHBK0RWjTsvyuHM8jCY90lfXdfM01Ot6fjIulgaE6UEZXXSYwZIl7skrf46TXCzME3wOGGiG7IfQp2q0wpbJ2jf7dqXuUzom7ECzcZtYXxY73dAsBEd840Sapc5skMQDiOQCbZolAFXMlYF5W04rNxCb0AArA5jTAh8a6bqkOQSXBvLuzvJzb54fihf7vgl53lNujF8GXbUPcP+/pj1AbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1x7J0nZXhQZWQSkRLnYkYwuidYWIT8XYgHCK/qkw90=;
 b=lOxO3bJTbm4x+FNGs1dR/BQ9wRzFARK3RnKLL+57QhLYy4jJSmrLjZ5tD+B6b7/dpp0+x7kulHEscFkplPEGlKHAhhVyNgc8Ta2QErDHjt/ZXNbljLfjrZMEa5OVj2UfefEKYWqt0eKzyMYR5HYQSKURZZilcwqSyFh2TQdO7ibnDv/cOFaCOMFrsJXpK1hVlXTnOW+hK5Nw5PGzcATwYOi3uxqeiWvOuzQ3ar/fTPKekvsW/i+YcFKGIQAx3RHaJNHcgNMU3iwH62GceOz/AZNSop8vKcDPDYhu/pRf+5wnA4pjUk5Z/oO1ByrMIGuD4PPuDcw9JoO6j7O2W4i9IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB0048.namprd11.prod.outlook.com (2603:10b6:301:6a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Sat, 30 Oct
 2021 15:15:18 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4649.018; Sat, 30 Oct 2021
 15:15:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bind: remove -r option from rndc-confgen in initscript
Date: Sat, 30 Oct 2021 23:15:05 +0800
Message-Id: <20211030151505.661959-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0012.apcprd03.prod.outlook.com
 (2603:1096:202::22) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR0302CA0012.apcprd03.prod.outlook.com (2603:1096:202::22) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend
 Transport; Sat, 30 Oct 2021 15:15:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbb30a90-fe5b-485d-161d-08d99bb81530
X-MS-TrafficTypeDiagnostic: MWHPR11MB0048:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB00487DFF9E78E40A809D7691F9889@MWHPR11MB0048.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:359;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZeuziUgczz2/h+BIZwjPhi/D5v5iNY05OH22EMZP6tqUhW217n72iCEch+ungg37OQ8BeOnPUB0af+lTgACThrQpBQLMlnQq/Ge76nWGx//+QDxMsJBcUNFcOab+7BRtjdA6LjmqLjFu7y2EUSoMTZuTlw1URtqKXqs5QC0ilmT0qE8wDCiCDUJFq3HQH8wM1QzSfLy/VL58cKnJGSAPyA64Y4+fqatN/Xp/tubRQrY9G8d+cgdoSRfn/GS8gpe26DZujgMz10pIOT8krHh7dDSdciDl9Mj4zdzHX+NEmbjS86bH1eqhCLJfnExu09cCgPQSbgr3HB+IdgWyrh9+SnxQ8BguPYLaKMvTHezgzK2qdLgGbfHvHIOd3mgswX+Oa1A6LqvntDAKXn/0ryUcq8DHklDzmXM4beu0hIBSUsFfy9cZJeb3lgLBh/lEtkfwA0rZjuTNbVepC6yEYa8ydAjeSuKyhjiLWBPKfHeS3MExlH3PYwKeSnFgN+Bf8l1DEXoHWE/e5XBZSyGATF53EXrKfNNuAzV3DFUqOhGhbsdVB+vB8NACouHYE9I2WwHJ5cubpBFCfTKZLSg4tgXgN68p/k85MxIhwgoaO0zPrv2jKOftnFjOAtnOugyvWIApMBgKsxeM2p+mjJc/MdXPqt6F3rdx2mNSZgINNT1fY3+OsDe/rYTwkYq2xh32bOkn0FvFcWSjaUpG8DdwhDQVaBcX0FT4Nc3bzc9YqXY5lmkvkUnMgr6tw4mX20FvFXytL93BdBOJV4rxl5E3eCv6+52+HXCZvjAYBcDnNMERrLs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(6506007)(956004)(6666004)(316002)(6512007)(2616005)(6486002)(83380400001)(8676002)(8936002)(5660300002)(86362001)(26005)(66556008)(44832011)(508600001)(186003)(2906002)(66946007)(66476007)(38350700002)(38100700002)(36756003)(6916009)(1076003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/z3fC9KtTjMkjjykfjx+W1yGjCb23B5eFEOq/SwV2x8BlIOgr/TA6kVAblLh?=
 =?us-ascii?Q?jrKBS+wunuObn7+i/9C2B4jUphrlEheImixP5jZTRihA98YUa51DjrG2S9OS?=
 =?us-ascii?Q?u3ibQiLCbaw1vENyhopNezI4ubANShK7Zu21rzvalzhbY2BCNf3aeWM9XEbg?=
 =?us-ascii?Q?jTsFcIYP61xlWeu39cy1nqZQcUSd2/+qiMBjEATabyY2BYw9LBTOUI7JPjHe?=
 =?us-ascii?Q?TexM/sxvPkej8hU67fEgGWlgBxHGXdGCKPmVZ2U2ISTtw79OcrMaz9enFQ9B?=
 =?us-ascii?Q?C4pGW8gW57zjWYt0g9nWy+OXgRQW85dHmM+qf8Gzzxpp7SB0fSoO/mtpQyR1?=
 =?us-ascii?Q?T4V3bd2a4Ez1wEpGsxAfhuQznx5sEE4eMNKyfEIvW//mvIsa8bpCM+2gFlGO?=
 =?us-ascii?Q?CLMbox1JmWQeajxPPFZb4bMsxlVmjaDCyYqz1A5H25/M5tf5fPh/K4YkTN6/?=
 =?us-ascii?Q?Q9ik+AyfrKzv190l48hAz83+F+7hYAf/vKEa2YLrkdyJ9kMhRjHmW98D8STL?=
 =?us-ascii?Q?3ijiD9M/Eq9EWSjsv2+pcIvgbXrebFdV8yz6+04M7p4yXkFAupGed/pOPdRB?=
 =?us-ascii?Q?lLGwTMdJuijBbNOmoMsR2hRhErtQg9Oa89AtzJ6CeByskZ58yqhlcDK9Y1sE?=
 =?us-ascii?Q?PBwiGnwrE5/HbMRp5cRZj72Z9xEPwLI+BKbQC7gZET9qK7ehQPWst7bHUvqO?=
 =?us-ascii?Q?T5kpoNANfp+odhxMfzGv8KEItRoKSDKYgxAwkeJARIvfTPZLPSw5BK0qVB5x?=
 =?us-ascii?Q?oiuA/KSe5w+09XQVq0cxm49QuHwdRiKRcwTtkwLMRk/bVhtfyF1QHEpgBlof?=
 =?us-ascii?Q?WHLINsKcWRowoJb3rNE0PHC0fDhzpSj10/rPLNQ2fN3vogqCdc+i92Srb7qW?=
 =?us-ascii?Q?WwYw3OJ2HK6HH6xOcgSVYnfr9RyNigUFAI3To5cpbf+5KlsHvUpzWgmLzeDo?=
 =?us-ascii?Q?SjpQhuFbCaM8wRluClJwaFEOVFUGvAhK7cN7Iq1lO7B3e2imhjzgRxxZSTi0?=
 =?us-ascii?Q?JTFGTn/6QXImYRJdCKT32Wq6lP1cDe+NfGujAClAvIy/rhDTAhXWbRxZDlu3?=
 =?us-ascii?Q?cnfwPStPLTOgVK0rzWOzAcPrdtWAGdogDAvFERnknWeugLRwZK37n44g6thK?=
 =?us-ascii?Q?zEG46UJzB4Waf+TvtucuPJ1QDgW7v844OgPIYqisMiJEM+gFk+vqtb2cy16J?=
 =?us-ascii?Q?VA6cwL8kx7k+893VNemjmBr9jfCIK3N3EuvfIIhE3yksdAqtdoZZQXJ18G4c?=
 =?us-ascii?Q?4UiPSajvNQ5FKMP8HoY2ywvftjF4U/8dyhwWfok/RBC1BZD15AKvZM6q/pZ8?=
 =?us-ascii?Q?ORu+Gbb9vCQgmgZpKIri+ghnX5bKivD1iQr72LVMARzoNBHNF0vtaFcKKTHN?=
 =?us-ascii?Q?p+OQOHVjmB5OoEhkyaS8lrBwnKvR0Q/y8YlIq/5AbRa7Jcalhmyn0gXA3mbI?=
 =?us-ascii?Q?qnTUgyswcUrCRbIppXPoUPIf1kQw/E+DQ5O+1E7mrw62OWhVjVFGF3mVX3nM?=
 =?us-ascii?Q?VWqqzDjTRF0X8CifUhJXVCP/fjUzaB8oNpWI2YDjfwF7AFxZai4CYfGe7ekW?=
 =?us-ascii?Q?IXWqcuHWvJOwBaliriIEphRES/werZD9kE9MLuPp2cnGhNAJHk1JaMAc60WO?=
 =?us-ascii?Q?38OrUjB821aOqyLygcsS0Eo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bbb30a90-fe5b-485d-161d-08d99bb81530
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2021 15:15:18.3089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 k4R4hqB9B4zvlA2ichWXpT17K1R2WamL5/qClwQmFs/lYXe+YCqzt8owb1uk5/xX32Hs6E3IAIdWv+RrAFalnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0048
X-Proofpoint-GUID: opw_v9DruV6zCySAk-qKkCx_g-sLjILH
X-Proofpoint-ORIG-GUID: opw_v9DruV6zCySAk-qKkCx_g-sLjILH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-30_04,2021-10-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=766 bulkscore=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110300088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Oct 2021 15:15:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157646

The -r option has been removed from rndc-confgen since bind 9.13[1].

Fix the bind startup error:
$ /etc/init.d/bind start
Starting domain name service: namedrndc-confgen: The -r option has been deprecated.
chmod: cannot access '/etc/bind/rndc.key': No such file or directory

[1]: https://gitlab.isc.org/isc-projects/bind9/-/commit/3a4f820d625c214cfb21f5e6d18ce9160d2a193b

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../bind-9.16.21/0001-avoid-start-failure-with-bind-user.patch  | 2 +-
 meta/recipes-connectivity/bind/bind-9.16.21/conf.patch          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.21/0001-avoid-start-failure-with-bind-user.patch
index 8db96ec049..ec1bc7b567 100644
--- a/meta/recipes-connectivity/bind/bind-9.16.21/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind-9.16.21/0001-avoid-start-failure-with-bind-user.patch
@@ -17,7 +17,7 @@ index b2eec60..6e03936 100644
 @@ -57,6 +57,7 @@ case "$1" in
  	modprobe capability >/dev/null 2>&1 || true
  	if [ ! -f /etc/bind/rndc.key ]; then
- 	    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
+ 	    /usr/sbin/rndc-confgen -a -b 512
 +	    chown root:bind /etc/bind/rndc.key >/dev/null 2>&1 || true
  	    chmod 0640 /etc/bind/rndc.key
  	fi
diff --git a/meta/recipes-connectivity/bind/bind-9.16.21/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.21/conf.patch
index aad345f9fc..aa3642acec 100644
--- a/meta/recipes-connectivity/bind/bind-9.16.21/conf.patch
+++ b/meta/recipes-connectivity/bind/bind-9.16.21/conf.patch
@@ -276,7 +276,7 @@ diff -urN bind-9.3.1.orig/init.d bind-9.3.1/init.d
 +
 +	modprobe capability >/dev/null 2>&1 || true
 +	if [ ! -f /etc/bind/rndc.key ]; then
-+	    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
++	    /usr/sbin/rndc-confgen -a -b 512
 +	    chmod 0640 /etc/bind/rndc.key
 +	fi
 +	if [ -f /var/run/named/named.pid ]; then
-- 
2.25.1


