Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D2FC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 10:32:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.10059.1660041121790406085
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 03:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AcUtkXg3;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=52207a6cd5=kexin.hao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 279AL0f4028043
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Aug 2022 10:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=UsYzq2zk/udjbmExEVljt6Oehgufz14A5j4Z3bMBLNs=;
 b=AcUtkXg3DYwt6UE/DnC6tzcED1obllBjCMMUZhrqw6/6GtD5HKUv7qDsThhTqlMr3K5M
 2zOKY6h5CjMCdjAW4TE/JXESqMd6kerD/QanjQe005K/fqX0EOsyXfqG7KMuRhahsu5G
 JKV8nIX4/opOy92k5OI3q9XPzq8wB0B/jVfw4S3eqrM3F6uN2jqVGsrMsMcY7lA3Gxph
 OPxd6tZ0XjKpmBxVfpLIpr8UZWn67RS1GZODBTj0qOvERpSnNRnSVQf+42s5IpqjTuTl
 sorrbRWuH4K9rnrMfhHs5zBb9r8BLkgFnmKbWyx7Vpcc9PkJuXf+Z8wVn8pCMGNO6CvQ og==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hsf9d2dqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 10:32:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csfi76iv7eY7ZGc2SR8l+RuJ+lMAkHyOKM6t8RC6hd9o3/rKl0ElArZbKy9ECO8rbvOGW7JwLaw8/keRVjbBFnIg0EPQ1ywf3KxU9/CToyfHCz+NS6JHh4uukE8a0SxMKknwhRNcW3xK+DDtyF2TQ+Kx333P3rajkEKZKkMNhQqp5wycgxlzEKcce2EXMXrRzbQuNRWIxcoKCFTKKNLNlfs4i69vnfNnwlhmGLO7kgiT7CUBNbD2Ie1vd3n+Ph2lBolY3CIsw04kApN9Ee2bemExLA98Zy2b9c7ZuYXq36fV/IrWay4iDpb/mIkPfGaPV8UecZd9ls0YGOfvQ4bBAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsYzq2zk/udjbmExEVljt6Oehgufz14A5j4Z3bMBLNs=;
 b=kqDTCHxgBiZVGS3bFi0Eiz3QSN46Ghwi/AGdIhW8ggSE0sQfVaOK6aZ/xr/sozZzsDHB43ACq+Iq0fvSjT30QeSbmUrxyCd/ZFTDjT3CcJoH+VXScoFRMobxO1VOzdRUQKG5es5qBsmszJk7iiH9urRDEaZ8HBJC2CwzJ+sO2VGnXGofW5BylXL5pqSU3+2uQNVCQWVe2ZBD6xQhWmjxfEgRMsL0b+YXo6B66Vzxkt046SjYPeqkYGNlgAmpfzD7ckWRfRvoiwKN2Q8t5Bv5j3uzttmZrQ7u+X9+mfUD679EYNiT/gcf2s3o8JTXwwctHt1znisQY+0/4PDdTPgeTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by CY4PR11MB1573.namprd11.prod.outlook.com (2603:10b6:910:c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 9 Aug
 2022 10:31:57 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::978:131c:957b:98e8]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::978:131c:957b:98e8%3]) with mapi id 15.20.5504.019; Tue, 9 Aug 2022
 10:31:57 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] uboot-config.bbclass: Don't bail out early in multi configs
Date: Tue,  9 Aug 2022 18:28:19 +0800
Message-Id: <20220809102819.4118941-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0026.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::13)
 To SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5adc841e-d30d-43c6-d74b-08da79f26292
X-MS-TrafficTypeDiagnostic: CY4PR11MB1573:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0fY1gH1pRl33m+Z+YF1+ia43actQw4QNYEd16hvFZih6AwOsFL1Yvv0KCWBkGqJTCHs1eQeRB7LkhKa8w3JX3V8qs80YgjqZmAyRNF3yK0zLHDDuLjZKROktbmkZpkGah18+g7cEfM2AbRoMEf/Zr1lwsoVrYOf+d86e5QH3qCIs7nSTHiPcQeZ9JT72AOctZQIjtkGVfxbdR0g6pnCa97j/8htIHUuZhkJSAhE8rgnqkkYdZ7XSP7eEJ40rvBC0hi4dzehRnGjTxQZowm43X77taIPsEHzPIlz3kl4TCxK7gvyUq1p4QRloYFizJNnbbNOb5hpFeFkwifRJYpen124fO9kwq6I0m1W9cbdEnKAsn/+W5Ots6ocKuic4cBORPtKYOH3xUyPpIfzZdw2nYo8JEQ4O9f3YZyhV/eDvi+wV3QLlH/wop4IvMPPp3UqasBK2EZ6BiAm+Xx6kXR4gLoQd855hNROn5Ge2hSOTx/NRqvxIDddr5GMlr48GNgucpYw4G6S3+sWg6aE+oqzNtU5kVUBzRRordsJBfWV2AQKWfN60T94OU2ANgkAdpikJgXU7Kn3x6g89Jo/R4wf3SCjbzPLU7hg5RnXWwbrXHjBVuSSkzN8Nb42vaSarqhnG/40f+lem9D5btqDPOrmO4G3hFSei+bcPfXpDt8jmuyHhy2R5YYUYoteJc04Ub0jHDxcJfX/MRAJ/l14hHhxKohjBV64tbFF2mJUw/VceujYZFUgrW9U7gO4S9C0tKT+LcQrhNz5lBddqluT4XY90c2QA8TS3MUIKv/t8R4G1Qms=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(376002)(396003)(346002)(136003)(366004)(316002)(1076003)(186003)(2616005)(66946007)(5660300002)(66476007)(66556008)(6916009)(36756003)(2906002)(8936002)(38100700002)(83380400001)(41300700001)(6486002)(86362001)(6512007)(478600001)(6506007)(52116002)(8676002)(38350700002)(6666004)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M5cWmHyVmzlHsx9mwPZpfrBysFFQs6Ru6sj2RlTk6vgasrwhblwaEkGAs7ck?=
 =?us-ascii?Q?CgLpHhoUhnreVDfbWRemaYERrRhGdsld+kLuXS20LMNwbuReo5yyH3NZcaNK?=
 =?us-ascii?Q?jGNclm5aeAVsbKTmvW9kLCB4POQDI+8W/+swcoTrBzlnXyWd8hd9TkxogVxX?=
 =?us-ascii?Q?dWnqoH5x7DmuDA8KW4CkVSfk6yWhpcDgtJIdPK+1VxFf2zVl6StlWPuqfVIR?=
 =?us-ascii?Q?qtJ0/bAC9xxATavjFuLBUErQGr6bbC72ho93Wr1VSLH9bv6q47u+y/cunt5C?=
 =?us-ascii?Q?iw6KX4qgG+7uQvc/7RKQPc3y9rW/k0vBVssUVq/cHtAq7jmSz4WalrXr0cjg?=
 =?us-ascii?Q?W+xee2bGYIX7Multc/7R3U+7Py01yO3cMLQ+KKaMVh2WFMUtv7Bpal/6cE0m?=
 =?us-ascii?Q?cEJvXMpnM2K1YuSO8Lk/h8vmUIIp86OmSV/2RVX82pusEqIThh+GavZ6m6FA?=
 =?us-ascii?Q?eI6lmwi1S1CzVLD5yDgIi+uxJZ1Xe+e4O+kvWkAZRdL+ZB8Q7hugue4xg21w?=
 =?us-ascii?Q?+LNtAoyng/D558/M8MDqBQPHKkGce2lHSrNNfthxWfW4CgNUVmYsWqP8AqOW?=
 =?us-ascii?Q?KSBna/a5gnakZlLWHo+3CgqgSRkT5PA/Xv3l7f25Jw6fUVKrx+iyQ8Q9zBiF?=
 =?us-ascii?Q?eLbUnObJ1mkfZVZgeNFyUT61Qzm9xLmGjsbBJmp21ZffG1CWChkwe4ULm5uu?=
 =?us-ascii?Q?GIY2CZ9QZGYqdKDK1wFjnSEdeGFMUknC3myiNYlT4Uu/UYsLkSdWMpaSc0qb?=
 =?us-ascii?Q?ADJpc5nBInn20GPqRHmWoPiHy7+ER1PSGcObylGQaJ4qlpYbJ+9lkH59bTjj?=
 =?us-ascii?Q?F34q7nZwH5PmWK3wtnJXc/xfgk4iW+Gl7H7Rg+UHBlRvnpt6WzZB6QFg+Xtt?=
 =?us-ascii?Q?BoaXOc6ms5QlUmcue71lkoZdeuUFyyCS4kjQbmg1dUEGSBhrvb1EdfOv/xyW?=
 =?us-ascii?Q?SPU+GH7xt7K8wWj8h/l8UXhpV6FhduhNL2e85AJgo6j4Q8B3qY2sLUz4RBWC?=
 =?us-ascii?Q?Q8FWJ0Mn7GmNCY5683Dgkm+NCZgJOhFSgV1qu71zPQhaj/qtDghiympe9EMf?=
 =?us-ascii?Q?R1gXkmCd8y6bm/BIb4kHPfiN61oNfn18FLG2+4M1o5ALzG+g0JhIPbJWIqbz?=
 =?us-ascii?Q?jwg6wG2FnU4VHt+ynQcmynbleqQNBsksO0WKD+5BTOIGtuzbbWVWsRdUPOsn?=
 =?us-ascii?Q?5MtUWs9+YJG33s1ooz1J0JWH8zjR9IYlYGt6M+ZfT9WvLYYpkDCthw9k0fgl?=
 =?us-ascii?Q?HMZLZPWxuJNyb5H+t021uDRDCNb4kib8f2h/qvl+2dGcpATjPM8uZdFk5SWp?=
 =?us-ascii?Q?5ThKbLPfqeR80v1riHlNeMSt/yhfxT98zMQOfSVWzqdJhMnAdiu8mE6piTw0?=
 =?us-ascii?Q?QhDDpLZyaR+1K37Fb0sadLaL85sO9ELwTXOEYvVm8XS/U3d9KTSGTijJGmRe?=
 =?us-ascii?Q?yRdbRtVUhTUf/v4ZjYIM6pn1ZYmhXrwGYwZDmcqLM8kngaEmi45cVeW4GD3X?=
 =?us-ascii?Q?VTnAjda7OLXN3d9lxM04aBSy1fe4E8gUTSBJ0lGQ2CqPY+wdPNgFqsZYLRa6?=
 =?us-ascii?Q?q4FzMLNHk9yXjjaCtyYL5JI6lHDKNHJK6uc02hGP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5adc841e-d30d-43c6-d74b-08da79f26292
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 10:31:57.0902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pHuvvNTGTpbUudQF76HfxL1yLKv5GLKv9Jv2HtPAmUWM26ILvrKHrJMPNZOhLguahVh2xQOoduVl3Z9eT5ZxPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1573
X-Proofpoint-ORIG-GUID: BculbOUoy0OrtGRqhb063j9Ealg9jPJw
X-Proofpoint-GUID: BculbOUoy0OrtGRqhb063j9Ealg9jPJw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_03,2022-08-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=589 adultscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208090045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 10:32:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169145

Previously we had the support to build multiple u-boot configs for a
machine, but after the change in the commit 801a27d73b10
("uboot-config.bbclass: Raise error for bad key"), this anonymous
function would bail out after handling the first config in UBOOT_CONFIG.
This is definitely not what we want. Fix it by making sure all the
configs are handled.

Fixed: 801a27d73b10 ("uboot-config.bbclass: Raise error for bad key")
Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/classes/uboot-config.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index e8da8c7452ac..1fbd49824f9d 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -109,8 +109,10 @@ python () {
 
     if len(ubootconfig) > 0:
         for config in ubootconfig:
+            found = False
             for f, v in ubootconfigflags.items():
                 if config == f: 
+                    found = True
                     items = v.split(',')
                     if items[0] and len(items) > 3:
                         raise bb.parse.SkipRecipe('Only config,images,binary can be specified!')
@@ -125,6 +127,8 @@ python () {
                     else:
                         bb.debug(1, "Appending '%s' to UBOOT_BINARIES." % ubootbinary)
                         d.appendVar('UBOOT_BINARIES', ' ' + ubootbinary)
-                    return
-        raise bb.parse.SkipRecipe("The selected UBOOT_CONFIG key %s has no match in %s." % (ubootconfig, ubootconfigflags.keys()))
+                    break
+
+            if not found:
+                raise bb.parse.SkipRecipe("The selected UBOOT_CONFIG key %s has no match in %s." % (ubootconfig, ubootconfigflags.keys()))
 }
-- 
2.34.1


