Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E17FC4167B
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 01:42:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.21680.1698889357137515702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 18:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F+ODRX6u;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9670048a34=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A2102wf025570
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Nov 2023 18:42:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=G7nREQXp0YmOKDPRAT
	noHV8RNj+BGGzw4dwgcZcomPI=; b=F+ODRX6ulYWocfqSuU+5CQbEAv1iugvnBu
	kMnEcTAaVOg84n5JfBMAkfCIJNYiaWmiUQ/m8GXDxN81dVnmAM+paZaOx2SiDmWF
	xHnEAwFfmsjwMEGEcimtvzln0xCiznSHfMewahL/rV7i5XytMbhaYbzAq327T++N
	Iv3NPO5xsUqV+GlpTe27EJqtqCshmhH5r4Vg9/qngBg0863jCTxSjcBo9rh2e+OQ
	cBSrqxjYjAN8QfOrdk52iKTo05T6WTvKLbL8NKB46hcp+1SSZK4gh916lkCB8twf
	Ac/t7IYXFXu5juhjxZaGnXIZHHMZWQSFCS/PcJlERaDaNepOJtNw==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u11tfwa3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 18:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZGK6mi7DL5NpLUgsRmsAlvRt1/ybA2xdVcUh/UYoF6QeKs2tEiX2h1pGrAWw5O/W+ljsgkldhwK3B1udiuwst/PBiiXCiQvdbRFYJ0a9dpxY2CDF55jMvrzK9Ht3ixqOXS1xmlemI+yYNs2Cz1OHq4FFcc4wfsuBBxrkpg1PMLlfBQCxUenMnh4NsvyLIVfY51XS2/a+iFVk0/nluKKoQXtZXLJl/IOnYRUurJXXdn63oFAtKTP7axBNC4acp8VsH6AQ+oiTFDX8e1ws7tFMHGAR5ZXsFlUfeZu4LuP5+B/JrYu8iC1+7+56yRx4+m4eDkEUS1UgKLu+z3PmgaEfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7nREQXp0YmOKDPRATnoHV8RNj+BGGzw4dwgcZcomPI=;
 b=YH7iT4LG4fy97PQrTD+O2PmyNKM00n522b3VcHEfN6TSSLX62HiQ6WOMG6cUYKDMcM9Ov0RKsBc/izjLYbjSV8dHsN5pKtWL8noXFZekCiJkxjxHEzb9cCX2EBfkI7IjNu5kXEj9wGzHt0KtnhqrIqcf2nzv9Id7yfnfU288eMGSdTtmK+Gg6sM+ItUxzrzzSiw+jr8+wohLHzFjsYb22tE9kzVqSb2rlbW2HY3FgCK1NZJsT2m7u+5SwPTF9ndg7ZC6zHfciMY7Bc/wymU9Sjlt2KETC5txyssXbfdzLao8POEKDjQ+3c57fu5V2YkPdkhA5ZB9UcaC31ntx8U6UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 01:42:32 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::1ea8:e7e3:acc1:8eb6]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::1ea8:e7e3:acc1:8eb6%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 01:42:30 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] systemd: fix DynamicUser issue
Date: Wed,  1 Nov 2023 18:42:20 -0700
Message-ID: <20231102014220.3413357-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR22CA0017.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BN9PR11MB5354:EE_
X-MS-Office365-Filtering-Correlation-Id: 30dba84e-8c06-46b7-d88c-08dbdb44fa1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	puMHQkM5NhKAh0OHyRULf4iuz+ejAh1kJeuwPXTrjHhdO866FKZ3VChxjNztE7emM3mjfQdM4S0tfM1GXu2Y2eh/lw4nvqcdc9n3Akqaz9PxKYOLxqc16EPdcTY1pXz9Mx/D94N5uCe2Cjj0ORtwB6F5ip3HItAFTDdoib6+zW5igNzExl0+S3sN8vsI4wetrVHT3PIn+7t3Qx8DIpKzOcqUV4HdTUoJ6BU6cRwWK7CLrQu4VtZvYKCaFLo7faB7nS7EWMMyBcogt6gzitcd3EaQP/Wn7Dy3uMY3jMhxakajGxbBQIAatYFvwhtun2raGyTxIMXV5WqyAQqdbfFTaDhsH3Yk7b9UmjaCZFMx9ZWyiQs0nRH00y6dC6geLkwpMTDsWwY/TiheQazItBF/tEPujoo5IsA8MSL2K8TsY+h/fR1VU8l1fC+iuxUEGXcVwV3nVDR/EF96f+OIchvszSQzkFsn5dAocQ0kb8Goz8QHw1F0Y3lE2G6Mc5Uxc1RCYrUWRoaQBEep4RtljiGM/jgvF8fSgOx+9iDk3UvAPgCU9eXXlo+4LJlwKW1WqwvG91JdwobR0QdHr0oA5p9eW0auQxGoSRuDS+4WA9wCBQY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(366004)(376002)(396003)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(38350700005)(38100700002)(52116002)(6512007)(2616005)(26005)(6506007)(86362001)(9686003)(36756003)(6666004)(1076003)(478600001)(966005)(83380400001)(6486002)(2906002)(6916009)(41300700001)(66476007)(66556008)(316002)(66946007)(5660300002)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qKEDpG0sWRWSBy+Mz6mzjQYFHuDYsiVHYFKIxWGAwdnZBHdurTsE9GigyYGm?=
 =?us-ascii?Q?ee2fb4HNNnmGjpGLxd7bTnX25LFaaYd+/VZu8S820kxW2gpefoooEvPeNUE+?=
 =?us-ascii?Q?3tIS0Ud6DVsHHnw08KXXA0OnW0W6M+44FWnrr5hLOpKaG5U7CAgXcnp7pRWx?=
 =?us-ascii?Q?fTauoSvpyqrub8cj1KUPCHojXmtZveexQwZij1j9h+64Rt9r0f1R6eR4GkOu?=
 =?us-ascii?Q?DcH3B7iKvzUb05DYEO2UGa6NwQTFqF6z9t1FjT19pOQDKyW4bqcT+QFH5oFs?=
 =?us-ascii?Q?rzudE0LClXw30ZM9CUdOEkH2LWlYB9qsnYtncuIO0p2KEfsDg9FVelmPv/Tu?=
 =?us-ascii?Q?UaafuEvyjX36AGy44RfqMoGI+WeaXLuiO1xSQlQUbQcHBpzgQ8s2/0B7nrri?=
 =?us-ascii?Q?vWj1tdlmEyGjhYr5WN+/ALDQJJsLueAo5UOnPKBYCS07iws1dC3PLpxH5N4I?=
 =?us-ascii?Q?XQkrKhOb3RqyiCrcSYNyEooaUQuuloXaSyDpAhL5rB4fAvxOHwrwXjH8pVF7?=
 =?us-ascii?Q?MJA4q95EXYbpaG3t4WWQVdFVfA4O69Z9QfzgDtsfac3A2ecXvS8ILODuMpfY?=
 =?us-ascii?Q?M8mEe58Mf9Sk6wbIGYvi03BcI9Y+mKz2iU8CkFQgBSN5RCwxFY/M21/pdja2?=
 =?us-ascii?Q?E47Osbk9zpIOdjQ+JJgr4rbxTrybZEDu6DMKufrBsGosl2ZcUzXq+8ojY352?=
 =?us-ascii?Q?OrcHFVb0MC34DPO91iv859iGacoXT/3vVFnJZBUNkLWQbV+N+Pbs5WjrSO2b?=
 =?us-ascii?Q?t7bNpu6ssQtdOyoG7DfYZGKx+JTmly1JoDY0CNYJE/eS0XnabUl8PsnTpybS?=
 =?us-ascii?Q?KrQT1CC3NLQfM+YDdEa+KsM//X3IAnPP4lBv8i3Bf1SbUFvKtK+JxFra2nf4?=
 =?us-ascii?Q?6YSuYUa5fNvsKCjzdv7HVkWKkHfuM/OBEfOeBRVtLnuNapzD0xzF+6j6UaSS?=
 =?us-ascii?Q?O/dxO/bmEs8PpIhwLtzI804rnOWR2+nLHyVjPSqPImBoJYPK46ZFldrHEXmm?=
 =?us-ascii?Q?fNRypQ/xiB5yQR54WG7hpBa+lUL/ycpzgqWtIz1f01p/xaO/K3B6rTnfe1DG?=
 =?us-ascii?Q?ooruNXkZxGsyEaK6BcK4quMus52FmZG78tzTuem+PwoaitX3JEUI/nVrMeZ9?=
 =?us-ascii?Q?kwsMsqP+bkP4u1x66ImOn0gMoI5fsZcdL5+xwlmXoGhWFj496nVQicPJnqOV?=
 =?us-ascii?Q?/XUFj4RrrHC0Mm2Uno+KdahdzlXUBdWrvqyyyb6CUPef272djXh18yZcyWYP?=
 =?us-ascii?Q?kSNyrOt/dooF7ytEyH6qrCsADgenIlJYFVJVeoAnh4LcbrHdOzr/Yk+zd4pe?=
 =?us-ascii?Q?rXjFaVUz8en+/QbwDp/Qu5VCxclLWVtj3gpllePIOMc+cWoIyh/F6Uu6OwBb?=
 =?us-ascii?Q?PkFRQPon84yo7grsHIzXrDl6CFq7b6L+LWvC+in9Qb6OVqL1aFfeO6ySuPjy?=
 =?us-ascii?Q?CBMtxfpzmq/TvDtDl7XZd8mo4B9l35WZsXN93j0QIIWs5IJqbD4PpEX2sutb?=
 =?us-ascii?Q?3Z+ds+DEuJ8vsz5zWRHOg4K3gytVMUO7QlXRSFNuSXrnkwxnAa3dGpIjbOAN?=
 =?us-ascii?Q?/wNlDnclOPFgLbZYpDhUm3nO7WcQ6ch7BHg8IYGtW4vk6TiC85N8pu5lic3P?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30dba84e-8c06-46b7-d88c-08dbdb44fa1c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 01:42:30.4689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rofV+JnegEXMoSjdaEwJWkVyY3pH8E/Ei7xyeDMTicd3VI7agf1eUS9+lNz+TF+RcxhGJ9gAb2rvbWR+stOacg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5354
X-Proofpoint-GUID: wYDNC0BuOK9DZqKnkAmQbDCuojyCfRbL
X-Proofpoint-ORIG-GUID: wYDNC0BuOK9DZqKnkAmQbDCuojyCfRbL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_23,2023-11-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=765 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311020012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 01:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190055

From: Chen Qi <Qi.Chen@windriver.com>

The DynamicUser needs libnss-systemd to be installed to function
well. The tweaks to nsswitch.conf should be conditional on PACKAGECONFIG
values.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 30 +++++++++++++++++-----
 1 file changed, 23 insertions(+), 7 deletions(-)

Changes in V2:
Follow https://docs.yoctoproject.org/dev/dev-manual/new-recipe.html#recipe-syntax
to use taps in shell functions.

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index ef29116bf9..c3507d9033 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -179,7 +179,7 @@ PACKAGECONFIG[microhttpd] = "-Dmicrohttpd=true,-Dmicrohttpd=false,libmicrohttpd"
 PACKAGECONFIG[myhostname] = "-Dnss-myhostname=true,-Dnss-myhostname=false,,libnss-myhostname"
 PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
 PACKAGECONFIG[no-dns-fallback] = "-Ddns-servers="
-PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false"
+PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false,,libnss-systemd"
 PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
 PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=true,-Dnss-resolve=false"
 PACKAGECONFIG[oomd] = "-Doomd=true,-Doomd=false"
@@ -839,15 +839,31 @@ ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
 pkg_postinst:${PN}:libc-glibc () {
-	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
-		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
-		-i $D${sysconfdir}/nsswitch.conf
+	if ${@bb.utils.contains('PACKAGECONFIG', 'myhostname', 'true', 'false', d)}; then
+		sed -e '/^hosts:/s/\s*\<myhostname\>//' \
+			-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
+			-i $D${sysconfdir}/nsswitch.conf
+	fi
+	if ${@bb.utils.contains('PACKAGECONFIG', 'nss', 'true', 'false', d)}; then
+		sed -e 's#\(^passwd:.*\)#\1 systemd#' \
+			-e 's#\(^group:.*\)#\1 systemd#' \
+			-e 's#\(^shadow:.*\)#\1 systemd#' \
+			-i $D${sysconfdir}/nsswitch.conf
+	fi
 }
 
 pkg_prerm:${PN}:libc-glibc () {
-	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
-		-e '/^hosts:/s/\s*myhostname//' \
-		-i $D${sysconfdir}/nsswitch.conf
+	if ${@bb.utils.contains('PACKAGECONFIG', 'myhostname', 'true', 'false', d)}; then
+		sed -e '/^hosts:/s/\s*\<myhostname\>//' \
+			-e '/^hosts:/s/\s*myhostname//' \
+			-i $D${sysconfdir}/nsswitch.conf
+	fi
+	if ${@bb.utils.contains('PACKAGECONFIG', 'nss', 'true', 'false', d)}; then
+		sed -e '/^passwd:/s#\s*systemd##' \
+			-e '/^group:/s#\s*systemd##' \
+			-e '/^shadow:/s#\s*systemd##' \
+			-i $D${sysconfdir}/nsswitch.conf
+	fi
 }
 
 PACKAGE_WRITE_DEPS += "qemu-native"
-- 
2.42.0


