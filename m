Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C34C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 19:21:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2929.1709752862513773557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 11:21:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EAkZ9ZQc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37956c3c62=william.lyu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 426H3W3I029450
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Mar 2024 19:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=/LbLZ8LcwaNCJFgGWn
	I+L8BLWNKpKCC60PTMCgHJBeY=; b=EAkZ9ZQclXfftVaCuHx7O37xM8eOZEBH2v
	tABKFDEozCSvFfGKput9XsFeIlNpl48Fnn434AbYzwQ4tBn/YMmJTEzCVSfmxWmQ
	dysjqItqjemIFmIv9g6Yc3FJeIN1ZDdeEE0Efa8rKdo8x0CK9b5EZpWzM2Pwt3hC
	ml/CYcxZa8sofjs40BfCoiaK1whccpO8o/XP7Zn9rmZw5oEkYtxVFbyxivI1iZPv
	11sBwUQRGgMp26+gJq+IcxHDdsPH7UxCoKJr0Yp1vPA96wMwT3JKqQ+UMnTmbzcx
	2Iwh50KkfDEjbBMeyrM/vmXHj+7LPI+ODgHDZM6KXLkpIoEEOR6A==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wku36caq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 19:21:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WC/2CLI7Vm0TWyQ8Qm3znQ5UuIfdKE41P9mrrxe3m6BnVBU4RS6AClB1PfS2GG7mHXuZ1jKfLp8D+0KpigC0Sv8rCZC8Vf2FLYOIKrvECwkhVwgAFiuevdFrrncDXgAwfR8CagDpG6UwAxsc6txrWI0P2Oywfde5CZ9x4Oq0P66WqzffcVoP7EwMn9Gfb5EIAT8eIjlo4bymek0h3lfJICK+yJxL40lKbNU0SJFnQD5t2wJwMMsmREprlYCioZiMAeryLZ98++2AwwH9+P+h6hoqO40dyewozW2+SUPH/UY9cJ9dnnXqNAQ4FxiR6JLLw/eqy/ErRKIgoyCAswGxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LbLZ8LcwaNCJFgGWnI+L8BLWNKpKCC60PTMCgHJBeY=;
 b=c0kszGqaXj3s5ce1JmLwbxOQEfbHyXkeYNfKvEyMomk6lXRoRuKmWZemVaO+xlhqR52QlkJgIYPg/J58rnLzwT8uep++5qXYF78CAzn42T2mwQ5/wmAreAkM4w+qqM4RhYpPyxpyMm6wokvB54fXvtPz6LabMMKEJ46eyI6rueTIpWUlBn0rwRF4wW5qsNxrioKPRc4Mk80Ko5Z+yX8vvssd2AS+TlxC/jhO5L+kHqghcK41v5236JHCMEa7XKtRBC6FEepj7CZdwzkfjrPVuvs0nOcYBv2kUlKgXEkmeEjWbE+tHduEVN04wvDJ0jTTrMFcFX84TJVGZq2JkiEW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8767.namprd11.prod.outlook.com (2603:10b6:408:215::11)
 by SA0PR11MB4653.namprd11.prod.outlook.com (2603:10b6:806:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 19:20:59 +0000
Received: from LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6730:81e2:544b:1379]) by LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6730:81e2:544b:1379%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 19:20:59 +0000
From: William.Lyu@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssh: Add a workaround for ICE on powerpc64le
Date: Wed,  6 Mar 2024 11:20:48 -0800
Message-ID: <20240306192048.2801375-1-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0084.namprd11.prod.outlook.com
 (2603:10b6:806:d2::29) To LV3PR11MB8767.namprd11.prod.outlook.com
 (2603:10b6:408:215::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8767:EE_|SA0PR11MB4653:EE_
X-MS-Office365-Filtering-Correlation-Id: a9374c7d-9113-47a7-18d0-08dc3e128dc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mil8E00zPR7YcJR25tO7x71vzRVWt+Q6RB6RWb+d/6a6xWiIevRLyngFXvCIdGHye78XhgUexrwfmuP+0PK7AV6TGfx/eLXD2Mut3EmCs22Ze+BCpcwANn92l7ijv6HO41jzDnRd5opM+GwVLb6E2sTVJLDXKQFY3IE1n6NAHMWT4oDAUr46ltgOeXLlBhqm1I2keTYDYLysfcKArhXBz0MoUezgiVt7LXDaEYTzfNpFxlrn6X7NnONvTEAqZnSt/RYWNLc/nVf8rx6IVPkeHlWAF0Rv0QvJj/+LYwMSXEo8zlcCR/aeQ0zidNW02P1NJuRVT3Qd4lDy8RRcwhyNJ1XYEflOd71sk1CQNKkf8Hq5W4Ma1yTPF5d4wiCaAsDauJ/kuEszblm1cuof4CfZwGxANPIIbOzWpA5808cMl4LUomw0OwMRPX5oH+SMW7EJt1ajIxW8BDQAj4X2GipECOM/B8axCZuv2ZzwmSKZhMObzf+WTvXvAcwbcvlzQpAkLfh2VBV9RVH9jQab/YvBMoDvh8HHivROxtO6Ras0TVp4QiZaf1+2U2hPi+hoan8hqQRuJciaxR0q+M6o4v2Vz2CLChoLVxV+QLY6rTXkDlS5+65bZs0OOUHpyAuS4L4cSrugaJAwoPSLoehmhGecUfAqRT27cfjt+1GRxfHtack=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8767.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mba/2dKOUY2U6puzPYFfm4RS0/ZmkLiQTp7+D4w/P5IiCB/GuEYTfY+SkND+?=
 =?us-ascii?Q?sRuCp7PUcmSwt23KndEF7SOooyflpdzvAYMAGUzDZ3topILP9x5dSS4zKOv0?=
 =?us-ascii?Q?eZjG8I8z/Hc9Z/WgB/P7kieUZi2+ylOINkZFcShAAIS3KM51ipUFqFayZAol?=
 =?us-ascii?Q?n4yKoUsVQKPRr1zjMhZptvW9OWQLaZWy2kBmpgKJREb4FEOmv6urYUjM5dtT?=
 =?us-ascii?Q?Xs0rpBLeCpQQjByAsBTRgigA1HWEmqP6lvk72/pAui/KgZsZEMWXLloVODTk?=
 =?us-ascii?Q?P1t2UY5ve01D987eeruFtbXUWudGOUzhv+Xt5qhVfPi5GPWvh1zhwKng3DA7?=
 =?us-ascii?Q?8HoQqL5ruktGVtIPk5wR9XTl8uQj2Lpm2BZ7rt1MC3K5EX/lzY4TWhmQesus?=
 =?us-ascii?Q?+OEAM1mqE9h389F+iKkETVisCLKORXLjCmOiiiqMNb4XGhcmxLuvj7BpFAmb?=
 =?us-ascii?Q?pOdkKuUmPPTVuryo4xHRCWdXRlFuSWb0b9p6ftiA2bNTu+nNFvcm3xSvAoJx?=
 =?us-ascii?Q?RhYIPN/Uc/7h/EGvXowLMUSRQTFd7xjC9qfs5JgZArqmzP9qKi9dTowVOSEB?=
 =?us-ascii?Q?onhM3E8V9A9LTGhzKxDlwPo2Qe25ul3p5v3H9ZKogIMLn2ns2PlL5g5Hz3+0?=
 =?us-ascii?Q?zOzkpVnWkMTTfWt111TCRVRJre2EZmC4VI0t/lsVS21R4urXc+GpYnyQjECj?=
 =?us-ascii?Q?BRdolmXDKL1p9IAXCC2AarCrmp4kWtZGtflno4lE4fQVK205f7mPz6ONTv6N?=
 =?us-ascii?Q?vXk3rx+53aqq03elVCzr2LRBqViY3Tmv+Ghlw7UWO1jyIO12+FER6QGh6v9z?=
 =?us-ascii?Q?30/LJzL7X1M51lKIV5dHSqAWsT7I4G9P3CQ7w2ntj+Bxl9LxVY0jyFArxuyb?=
 =?us-ascii?Q?bzyFjtZ17X8kd9u2TVvou+oJQzcq45ZsimxyGKeop6Z7ybcM9kbduHSK5/Vg?=
 =?us-ascii?Q?cxCYvPUlv6juxnQc+K/rFjbxxTCDtjwfU3rZC4XSrj8rKMqFVDv2Zyn8rdUY?=
 =?us-ascii?Q?tY7eFwHFJrgKMl89LuofZ/SWLcQBggAWZgKzzVY4XWVUVqwjV7lmqI9uKsjJ?=
 =?us-ascii?Q?ZPozCwsaQib6ySRPkuwrLjiJ62Wuegj00OEmDMMjmvGNubeTp3MGJ5N6PL9c?=
 =?us-ascii?Q?jjDpHZ0G0fmrm3Cms55YET2RaHSAUbGITc4+VUWOrP97xpDgdrgyI/As13gb?=
 =?us-ascii?Q?kXspd75woIcfEjlOL+QrWRGDQOpm0wJpAvEHGM9LXsfzHdvl3R72KA7O+MvY?=
 =?us-ascii?Q?29awRklff9k6Gm7txfLP+1PsUQBLQhQsFRa3xDDVQRBHRbNnEe7aDnvz61ul?=
 =?us-ascii?Q?AziEghx1nxavzsdoP7o+VpEhaa8qdOLbWSBvYppoKw/5vGQKCceNZSrBPAy6?=
 =?us-ascii?Q?OTKcTS5lJVLO4yLGg4h0HPQAJxIqErWoN4c5A9nbUhRT2EHDVItkHq9ZkGm1?=
 =?us-ascii?Q?21yCPs+Qg3f3wJZyUPeuGlOhH2xEMPn1p3TrnQTqvZeq6TH3K7zqll/SqRqv?=
 =?us-ascii?Q?EzkV1fXPnVakMTlUitTqu8udMdX67J/ciBIZTeqE5YAvTH/BFvTWKoI8Swhv?=
 =?us-ascii?Q?UZ2w3xsVbsYCdrEgoAOC2ZHUQgT7c57VO9M4Viy3v3w5m3xnI4V/QxxroF+x?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9374c7d-9113-47a7-18d0-08dc3e128dc7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8767.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 19:20:59.0388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0q0KoE7ad3v6CrJI8ZKtiYLzhsnhudPyIo2xr1LbPrDqIaPDoHwjPcZlTUTz3yWVRjVdFy6HHmHAEXju1JUqgwaVqJc29p9z5/JGWLHR/sY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4653
X-Proofpoint-ORIG-GUID: IRD6i2D4ISr561mUytyMe1dXWLXsIfHf
X-Proofpoint-GUID: IRD6i2D4ISr561mUytyMe1dXWLXsIfHf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_12,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=797 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 19:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196752

From: William Lyu <William.Lyu@windriver.com>

Fixes [YOCTO 15415]

The new openssh version has an ICE on powerpc64le similar to the one on
mips/mips64[1]. By adding flag "--without-hardening" to "./configure",
compiler option "-fzero-call-used-regs" will be removed when compiling. This
prevents certain functions from triggering the following ICE:

unimplemented: argument 'used' is not supported for '-fzero-call-used-regs' on this target

References
[1] https://git.openembedded.org/openembedded-core/commit/?id=5b290566519a87c563945a033cb49863317ad63d

Signed-off-by: William Lyu <William.Lyu@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 1fd36a266f..edd8e8c2d1 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -85,6 +85,9 @@ EXTRA_OECONF:append:libc-musl = " --disable-wtmp --disable-lastlog"
 EXTRA_OECONF:append:mips = " --without-hardening"
 EXTRA_OECONF:append:mips64 = " --without-hardening"
 
+# Work around ICE on powerpc64le starting in 9.6p1
+EXTRA_OECONF:append:powerpc64le = " --without-hardening"
+
 # Since we do not depend on libbsd, we do not want configure to use it
 # just because it finds libutil.h.  But, specifying --disable-libutil
 # causes compile errors, so...
-- 
2.43.0


