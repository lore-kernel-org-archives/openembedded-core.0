Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5B4C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 04:21:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.95497.1703650858712853390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Dec 2023 20:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oFEAxf5v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0725ab29a4=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BR418j8006540
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 04:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=WbygehyP9GYECLFi3mtCQFu2kCoBx3m7HhOblmB0KxE=; b=
	oFEAxf5vAvemHehIXwsrpJTXuv6adkbCwK8/DbO+phOJHqEkR9yEKERjFlu89Zkf
	tfpnzne6P1j3VCrP3+L3ypauLhn5XG4ZDAHxjBgstyIfRvsMiXP7v2K+i9SRTsrF
	Ir8G2PCkorO6etPE3N312gQgaC5RCe/ByMfGSmp32AoaomCujj8pGGgfl5pBPGAL
	AdW4D0oCAlPaiSg2xfhtp5GsiC/yX/kdKScfYMyXT3hP3CrRwPWavaOlgKQK6W9w
	cM5DpqR3LTQyhLG2nDFlNEnMMUr1acctgxfmC7p4GgnomUHjJzSlQCusEpw5oA4P
	jaH2cxMfqRYEVKZ/R8hCFg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5ph62u8r-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 04:20:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxgtVh5ZyrsJXbld05CcYzP+JdwMbarPQ1RMlxabliq/N0tJijJu188mHdddXTpilMLHcgK0pkW88LqD2vZIqzhdPwxGgXteMtyZxctjIVYKOJ7gxljEPk9N9niPgMYQfrXdq82XknaP1Z05dQnANMbTt2uDFvckHN+7DkcdxWOa8dBRb7qnW8EFCT8ZnjsSlaRYsk1MZSKYxXoi7F4qPwR0HXlDNIl5jLFFh6Zy2DZQeJwYAAbqusMNscNu9eU7kQIupo5mBxO4mNlDSdmOqHnGnOqdoHrZhqNk02DU9jf+TSWnM9buDIwFQCzvY/s39a1mrRj/iuheJnj/Nae+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbygehyP9GYECLFi3mtCQFu2kCoBx3m7HhOblmB0KxE=;
 b=GgAog98DqpmCHbI6c2JKdh7x12RgeQ6GtHRLhyW8bDiIsr3BmsPPLoMg4rRzkf4219MUNu1Fe8AcP3QnSAX9qXxCsg4+740livp0Mok9sqd8RarMaLanrKm0QXtv0NNHCQ2SS+4Y8KjypRyYfgPGCOMSLQFSL4RZROlar0cMJCSb1OqSFQz9aDNbwGLzzDXZXnGaLYOaQUNuMM2UKV1tEAsn3EzxMuIM7cPHjobA3FGJdct4ymXQ3uisqUP2199Td2EWjgNEVgIrOkxsdgLbH2fK1KepGHHYWgb0luEszIGUAAhdWPeiuTeMKiMJKpkFTOjuuYxql5Ur4YfPL7bFKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.27; Wed, 27 Dec 2023 04:20:55 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.017; Wed, 27 Dec 2023
 04:20:55 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/3] rootfs-postcommands.bbclass: ignore comment mismatch in systemd_user_check
Date: Wed, 27 Dec 2023 12:20:36 +0800
Message-Id: <20231227042036.2376255-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231227042036.2376255-1-Qi.Chen@windriver.com>
References: <20231227042036.2376255-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: e6daa656-9126-4de5-e235-08dc0693381f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SrWy/Vy2jIHv64Ob1MLWdUI+//3l/d0X//2J8sljpSyynh6nT2Jmai5cVTDzA6BVS/8Sv79vMIE4YvHHe6gd6fTC0SAP/hBCQkkGHR+7tnCNavKj86tblkloOcMrPkYPNo6McxtjY00Eo6OLcTL7/2vd3MDEWIu4YaqgG08tgek5Nv0Rl6dAWT15nkW8hHWTg0WAMcLtzX0NbubnSpYOC/j0EENhqTGU76cfM+qwYdgjx6SmGm5bGy4TmxYtfcLA+sdkSPREGATZSzKzbFMdjYZVJXIwx8LxuYZhKrfctfvrIwL8aP4xn5R0ZwlAaNK7vxM5mpIc70S8BYfw6KtwE4NudOiv9eSQcqVqiNRgGDIicyBkq9U+vQ3lH/fAGJm8u/MkUOwwIrn3DgcljW5BltmGRWfjZPnJeovOYtxO+ie8lB0jkDyiX3fHNqBnROhS7Hag3YAmyWC7lDZYsqPPIffpw/VJ+YDyhh0p8mXSE4WsqYuiHZtSQdbLEe3r/3i1rKe/N5KFniw38y6v1jGxUyrOSwmS13DuDmfDyXRLWhrlwokTa2SIyctOUvBKLLk95KJXAnCtwqBfckumhMgp4x19pk0DpxrUBN7BUKhGNLOMjA0nq9PMto90iOgX5+zpb8honHMnrWwsJ9ue76Vo1kpqQtumqagqso5qPgFKigY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39840400004)(366004)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(38100700002)(83380400001)(86362001)(2906002)(478600001)(5660300002)(6916009)(8676002)(316002)(41300700001)(8936002)(6666004)(6512007)(6506007)(52116002)(9686003)(6486002)(66556008)(66476007)(36756003)(66946007)(38350700005)(26005)(2616005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1NnH6+Vq4tA/zskh8S39WccGg58sV2MIw2IV6NnrVPgHszI1dHLd3HH9yZ9e?=
 =?us-ascii?Q?SqTBt/F86Ry3GgcyJi1rFLY1wypjT2JEAHXzkU7JwFpsTOek3bWlNCArkKxz?=
 =?us-ascii?Q?qj7Hq/6Q/64Wb3xLs1O3cR92t02anjzDTrEQ9RKQzcrwPdaafFMFnVqJazfD?=
 =?us-ascii?Q?4xo3KP7oLGFbkziCERTNtJDSaEP+4C5c52XjUFzXJYhvH09XYvHmjru8Rx0q?=
 =?us-ascii?Q?tg+TVIpi+cWVr1mcRL8kd6RlTqBdRZBdOpx5CAURVHhfohAofk261KLDq11i?=
 =?us-ascii?Q?aFC16NuKXs5vOgrzfeDkydwQz0Oa9GDKMqmBH6EmVIdSve+k9Jc2HYavk/ib?=
 =?us-ascii?Q?pJgJv7L6w6FYYxZrif1kPRn+oCODvxj7RChDdfnlYzlEu9U3YaY/HOT+tQu8?=
 =?us-ascii?Q?ZMoiUzw2hpJ2ejCchK5n7s5y8PV+olug/F7/RVO3YMhUcv9PzfAhYIqmOvIs?=
 =?us-ascii?Q?N5QGs7asdfl7WTpwSnzUMWIX9kHOcfxiLJ1haCAgY5grsUKkX+jNPnSSbq5b?=
 =?us-ascii?Q?bzRFh/eDqdT/Hbd6WyA8RawbGPUSMrnBgBngVDDUsfi8p7JjkEL3HYjnrKNN?=
 =?us-ascii?Q?ge5Jlm8A+xPOfX/kJzPKPfyv6YViPXlA0ZjaKg/xHIZojkXL373PehH+Cxbr?=
 =?us-ascii?Q?csoD4oL99IauFAUlrNp2AWYdlc58FA0fRr7Dn5exPmULcMp176/a3HJPI5vo?=
 =?us-ascii?Q?VHpndWUjfnMwG5sqtzJlIhVRYLgCKep/x3z19uCevLdCS/J/ol+wbciNLrhy?=
 =?us-ascii?Q?zdMUUmAkTcTQ6FTdsoTL7Ao/qeDT9UAT8GzJWiJDmxxtxaZA/d4pkAH7EBwS?=
 =?us-ascii?Q?rtjx1rTuHbghPrNGa+00tV0W6TyT9gX3XFAPB2BSYBSU98qUdohZ9KuCiJaq?=
 =?us-ascii?Q?9chYw3nZu17xXcfU1WChHsLTFYDI5tN8q/O6NnJzFgpgkDDNXWiIRpruQHEN?=
 =?us-ascii?Q?4oG8W7k1NVm9Eno/6n1qUphqfM5FSy4OHObVDciDOKnZglFN59FgsfQwh9Gq?=
 =?us-ascii?Q?jzcMSKq1Zm49CuQkBTFv6pc1vQNPIoGr/3731DynWOrnkxJV26ZwAm1yzD92?=
 =?us-ascii?Q?+E8sLH1/v6lgntNp5s6mTYq2umfCo+55PJKmWvovhAcIbVRlRPri5IhqMLgM?=
 =?us-ascii?Q?3gIBYoeRm7b51k1mukoVk0W//FPh2oTVphDqNT0AuOZL6xJUkVKy0oCVo6Wx?=
 =?us-ascii?Q?JXCCVWHUIM76d/onmaMBxHpJn0AkfwWDvFUB4dZpttTWUZkYPisX7o462uxX?=
 =?us-ascii?Q?7DKzef7IkbnqyfCiD9OhOer+mYlcsVT5vpcN/GetWhzKCDV7QhlFbOzaTsGl?=
 =?us-ascii?Q?ouQAPcHsQ0D2yeANU8k0iwnK+p7IlHPILKQcRZOTj847QN/FcwMeV/NoiIQc?=
 =?us-ascii?Q?Jg+43zgM/0bhf/CrbXthjRAxVnEhrbBeVH6TPqYN5pFwx5VPcZU7d5d82tWd?=
 =?us-ascii?Q?xf2ZxNaKbyVnUYH/WN7/4XwD+/nK1rwfbbWr0kqtBAQnGqxUszVdRcxhdIOf?=
 =?us-ascii?Q?0KzxwXH+U9eV3Q/R37RT6yO6RVw2gQFKGB6LQ1mMwjfe5HEPcSFbPYXu6b3i?=
 =?us-ascii?Q?LdFSCmx272w/FPolK8SoAUeVoovEIiMm5BIieLr5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6daa656-9126-4de5-e235-08dc0693381f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 04:20:55.3004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqT81RkJJt6HebcPBFFYgL6RIEciUSwu0DDKAfbQv56fEdQ1sKGYjupB7llMREsQHroVPtw/rN+UMooZC6f7CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5966
X-Proofpoint-ORIG-GUID: 2kPizdix8tPGtp_i_zQlBrz2hmCLZ0nw
X-Proofpoint-GUID: 2kPizdix8tPGtp_i_zQlBrz2hmCLZ0nw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=363 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312270029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 04:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192925

From: Chen Qi <Qi.Chen@windriver.com>

The check was forcing every field to be identical, this is too
strict. For example, if the comment differs, there's really no
impact. For example, root user's comment is 'root' in passwd,
and it's 'Super User' in sysusers.d/basic.conf. Such difference is
not worth a warning. In fact, previous codes use 'lower()' to
avoid warning between 'nobody' and 'Nobody', and what's more, another
patch puts its own basic.conf.in in systemd's SRC_URI, but it changes
'Super User' to 'root'. Such changes are all unnecessary. We should
just ignore comment mismatch.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 29ee74932a..f996b6c71a 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -111,12 +111,11 @@ def compare_users(user, e_user):
     # user and e_user must not have None values. Unset values must be '-'.
     (name, uid, gid, comment, homedir, ushell) = user
     (e_name, e_uid, e_gid, e_comment, e_homedir, e_ushell) = e_user
-    # Ignore 'uid', 'gid' or 'comment' if they are not set
+    # Ignore 'uid', 'gid' or 'homedir' if they are not set
     # Ignore 'shell' and 'ushell' if one is not set
     return name == e_name \
         and (uid == '-' or uid == e_uid) \
         and (gid == '-' or gid == e_gid) \
-        and (comment == '-' or e_comment == '-' or comment.lower() == e_comment.lower()) \
         and (homedir == '-' or e_homedir == '-' or homedir == e_homedir) \
         and (ushell == '-' or e_ushell == '-' or ushell == e_ushell)
 
-- 
2.34.1


