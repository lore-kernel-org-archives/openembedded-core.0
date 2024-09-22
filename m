Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 141FACF9C6B
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 03:32:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9047.1726975923786408922
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Sep 2024 20:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=999533e59a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48M3D3C0024523
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Sep 2024 20:32:03 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41sse4h4n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Sep 2024 20:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWQxxh7GDPRVLzKrm2pyG/+isD89Kznq+au12GKN3UUIwPpukCqtEyFnKatw3M9zr7/q8dBfeJ3EzDgvjSuZswXF/2RrHoLDjMJcM83qZC8auZzy8qOk2Z8N/0WJh9VcLKYakBBJ38cGddWatyLeKu5j2D4shRDNsn7QCuUEeDdrFzf5Dn+NU8F2og1I6FlOE96/W05x4FKtM0JekWOGzynxxl+m2Gy5xmGW9q3YqTfAQ7QookkIE48EW+ho31/AhS24BmxwzuQidn8OJ7izYHKxe2qNJ3tXI5ZGTMrPl6RNz6cJGpr6rSgJ6EMtR+Tm5m910HFHWKqyFWqKVzc1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTjsi4kabLQqC5ZnYQyAdpYvJNdXgm3TMWFH+GYxV9A=;
 b=TS2Kv+NXE0hRQrOYPr+MgBhUik1b47B7OSdPZA2owkKOZxANTJp1iibAcKe9BIShsXus8OLWXqYX5Ndxk4H4wpxYjItv5vh3t4e53p1ZikFK0zHkKCUegRDl/BOENdzGYMz1KxdTb6tNSbJzjHMYVSZjHKescVj5GPrhXzE3BkG7YGGVt1qN68MkS5cym/n3CRcWV3A/vhtVTnbfoHe4bNeh0kJa0nQjG+Ifrj00xjFAtZR4449Vd/VrWq3+2Zp2fPMXJtK8oGmIx4TZjRGiF05qIuiF8u9bV0rDYaLvzH3XUD2koNyqsZabLQSASoYOcO7YcqTn2gK7voZU/mjJ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8113.namprd11.prod.outlook.com (2603:10b6:8:127::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.16; Sun, 22 Sep 2024 03:31:57 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7982.012; Sun, 22 Sep 2024
 03:31:57 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] json-c: upgrade 0.17 -> 0.18
Date: Sun, 22 Sep 2024 11:31:46 +0800
Message-Id: <20240922033148.1138038-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYBP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::34) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a793d8d-e659-4554-71cc-08dcdab71cc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7GWdbN7adlxxBjv0RjdeIrGiEOwNQG8Sg5xiXHixovwjj9ycpOicT0Wmwpmz?=
 =?us-ascii?Q?3HFU8oS66o/1IOIThUH3xqapnQWHjC5f08/6t/Oq9sAOViawz+4SAffqCAPq?=
 =?us-ascii?Q?f9RyltB8H8BLq0T/Xjn0XpQk6jZsZ0sR3TUJIyaE/cIeg24qn2IkRaFBhCCo?=
 =?us-ascii?Q?YaG86DxW2obgkAeov9az2Tl6gxXlL3gDQmPgoAq5ySZ4yKYPsLNMZokmZv4o?=
 =?us-ascii?Q?kpUY5zZyvBjBW/Hpvb1RL4VLjlQPuZb5Hd3LCWJAg1mQownpQR3TlxSWIcAW?=
 =?us-ascii?Q?8Eisj3dd6v+ohL1EEIbwg4r3GkeGexHwUqP3pUWA4mWdtIpm0cLvBkCqH+hg?=
 =?us-ascii?Q?jAKyoSIBMj682iS3W00E++Z6xTe42Zm8TLzxtAxHU/jME0ZVtWFualk/AnWo?=
 =?us-ascii?Q?JgH/R37gcd41Dci9Xsr/yngXIvLNvWMfKPGqezEZhN4skK2aoWIGqpjCXBa9?=
 =?us-ascii?Q?RR5nMc3EyhGY9DdOc8NJfYf/Pq3z5BRGJSoa0oXrd3F8pPakst4vAK3Ovqcu?=
 =?us-ascii?Q?YnS0qfStmT3Y3swe+5WTYFN9x4ov/rbRujOdntchPVUP5ieDNP+aEy69mFi1?=
 =?us-ascii?Q?EqYVIEuLc3YzsWWPkNAqSlugYTgSUyVIzvKT63VfLEYFLPCrdHU02rfykoFK?=
 =?us-ascii?Q?u6bw1PHLnhZOYzsFNKduI05RMlRMvXG0fAw0VfVke+kVzmZMsyo7Q7KDeknG?=
 =?us-ascii?Q?effUpBaP8KWYhbQAfSH7M5Z9kRnmwySm803bMG0cuOc/nVfyheLiEr55U6TY?=
 =?us-ascii?Q?kzrHtv/emERcCLIUEx6ZZMQy3IA/luuO42/JuOz4zgYNrFGFjWo7hPup8Leu?=
 =?us-ascii?Q?uMkQ4CcNlUpLb4CGXvm5RY3azDa+q8Xj0ccL1HumEtOeG+T0kXtLF0tz6zA4?=
 =?us-ascii?Q?fOENHKMzqo+dO53vpCVV9MM524nMIyWBemIAXYPBVD7DoJwdBStfyEGQtc2f?=
 =?us-ascii?Q?jk0CdsQMyC9ZAPMc7NjqEFCySJY8jFzgJB3IhnbpHy33G04guG7+nwB2tNdO?=
 =?us-ascii?Q?MeX+5Zk3ubtYQdO7PEiGbACYIqwKATEqxGQDX7QBQq5mSj+5oeXiU0jIZpGa?=
 =?us-ascii?Q?5TUn9XEtHsuoSLD9Hp8MGa/z0TmIo9+YtCxjBa01i6eMjyKGl146CvoOl+au?=
 =?us-ascii?Q?VzOJFErvn2w9/fJJU4qg5f+wSWx/wamPJ+9jmExd556oDyc98WpKKlDNoTHw?=
 =?us-ascii?Q?995Gbo3q+ugQuT3uwwJKRNTF96geWDflpIkxbzedbOdelgo+0IV06jZDDIXS?=
 =?us-ascii?Q?FWLZjB4L+9m53r2//hzPitJBV5Qzk+p++OMKRRiMdA7b5jAl2173dS2lRq/9?=
 =?us-ascii?Q?MZ1Mw4uK4E/XEDJbJtauMCxgeImAJkW9XuI2l6XQvTB8b3oubWQw4yut3Tco?=
 =?us-ascii?Q?3JthAiE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8HHXNbz08/7NlllShFDR7tJ5a8ZhZku7fmzj/MBxuIOnZrAqOdSoIn0Qdu9W?=
 =?us-ascii?Q?2vNK3QT1nvm7Wc0yE4i3NZ73ylwfyU5oYGb9bmUf3Q5ej9GUM0peLpcQC1p7?=
 =?us-ascii?Q?Wh++Zoya+amQTb4nggZUyV5z/25FZnAEly0ACCm+DarXFmOZtTdPVpMbbWcq?=
 =?us-ascii?Q?KevJb4uzNfvZZGFRsUYv+pltkp4f8emIngneBNGYlrOXwOxLaJ8SGzL9HTER?=
 =?us-ascii?Q?DoQyJeLIAiggoZngZwQyQ9zVBRCZxavPvMkmZJS175ILbmoV6OqEcSMjbatw?=
 =?us-ascii?Q?I1omhiZQr1QraDg8M/yMlut46pgO6RuLCUywwPdebbaaYXaWC1lMmE2nTWUL?=
 =?us-ascii?Q?rVqvmgS6HQqO32D7JC7IRyTXmPHsuyhn7I62GAZrUYXWXkzpUOBlvvUkbO0S?=
 =?us-ascii?Q?yMIg09yyEwY9Affi5/3/M3f9wJYE1BWKSVR9VaX4U23Reqc/hE89pHfW3MBW?=
 =?us-ascii?Q?bHLwIlkotl8Rf/NG5L/Put63xC3sVfG/FQKbY8qTSC6ZFcYgCbC7geNJ+qOf?=
 =?us-ascii?Q?XZUbbwwwh2QlDctmpUShKkJYR7F97HdGzsIpWDTBHvDH8vHNU/uY6CXqJMQn?=
 =?us-ascii?Q?jnXMguf7v/8fb5aOkU8JAcq54hqdG5bX8ukFHI/OCdXPJ76k4XVTEX3hQnOP?=
 =?us-ascii?Q?lGCdN3h23+1qSqAbqcm2H8X82PwTyUzaxiuzaXlqN+7Q9RuuASSfD2hLrGKQ?=
 =?us-ascii?Q?ac2H8zfep5BhroPKj6DxN0vV6VHI/Hj9CmF1KiK3ehtdooVp2moDGnrsvq7R?=
 =?us-ascii?Q?pwgbMYJ+vDSEKss162mkv5QLutzyP+cLlVU2DVOywm7ObvDZCNEZBloip3wS?=
 =?us-ascii?Q?lQDfg0iJ+SzgXmutjNAqWzHPePSrMslZAB8YAeKd95xGeqZRQ61+sids69Gy?=
 =?us-ascii?Q?YH61UcA+gfH2ZNqXtLrgGSW9s5Rno96QDySZJbFc0YFpOUkpgmhnCptxNocr?=
 =?us-ascii?Q?2DsH7CYUEOYU0voltGztr5iNVDBn4WsS/MUk6MvkRh45vgfoM1qsBHz0yWpU?=
 =?us-ascii?Q?slTCgVycSSryvqdngkYeAwZ9eXdJ4ZD90KU1jGX5Ey4M3/42fwI7RoT59SUe?=
 =?us-ascii?Q?Csb52ntKJhO5fWQ+NZLZJOujaWga/4jlC3tHC4abOIqHkL+PoRn8bEkX+aV9?=
 =?us-ascii?Q?+LCnULn65SFcup3D69so1Dyoios+wuuhktjDfe4O71pHaW4JVsRrzFXZPSIu?=
 =?us-ascii?Q?OpXaHeB2r83AGyH3z/e2z4uB8Faw/FMA/S3LcRRj+jwM7QLev7M4Zf7+T8gy?=
 =?us-ascii?Q?sTsEpNkfY0wyYFMpMe7LQ4/mUnQElA9H9Jf+JYDN5NQs1cQJVVFOtiJ2L0ZA?=
 =?us-ascii?Q?sA58jJSgzYw9OIV8nC3ZvoAGvlSpEt2TmeLThWHJfJVgcTFzUWnBsfUPuoQE?=
 =?us-ascii?Q?7PUd3aw2f2eHMrv82sl/rhcRFzhkGBoKqPa7KAmteiCkhXxymB5H8ub/zqDn?=
 =?us-ascii?Q?VaqgUszt4ByJ/HELkrUvCarrkPdV9hr6qd/GaHA8XwcUUr65oWQauvajFfV0?=
 =?us-ascii?Q?i6sfmhEXyKzpDsygyqTeefnMpQEyS/xPYNa5iLRqyWdY0eZWCVYSNWHwpKro?=
 =?us-ascii?Q?qi8bMGqmO6V1vgMAi7adrNxCJlD77Hb9n5lbFrgu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a793d8d-e659-4554-71cc-08dcdab71cc0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 03:31:57.8558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JK7njUOQ9fEoGcAltguOzB6xYIoRlzbCMVwGzalaRfb2TGenbcZ1wVm+AS2Oxh1xzrtSZEwErtLZCuG+Kuo2uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
X-Authority-Analysis: v=2.4 cv=ANzEoFnr c=1 sm=1 tr=0 ts=66ef8fb3 cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Dw5zRoPsAAAA:8
 a=XKdr95i7JqerCAM43OYA:9 a=THqPM2WZCpP6gl5neYXE:22 a=FdTzh2GWekK77mhwV6Dw:22 a=iN9rT86CrASfy9WEWd19:22 a=m9GVtyk6Dqasd74vaypd:22 a=NWVoK91CQySWRX1oVYDe:22
X-Proofpoint-ORIG-GUID: SrlNswNl1sWxOVeHKrDvTk1I7sFpWwJ9
X-Proofpoint-GUID: SrlNswNl1sWxOVeHKrDvTk1I7sFpWwJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-22_01,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409220025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 03:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204767

ChangeLog:
https://github.com/json-c/json-c/blob/json-c-0.18-20240915/ChangeLog

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../json-c/{json-c_0.17.bb => json-c_0.18.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/json-c/{json-c_0.17.bb => json-c_0.18.bb} (91%)

diff --git a/meta/recipes-devtools/json-c/json-c_0.17.bb b/meta/recipes-devtools/json-c/json-c_0.18.bb
similarity index 91%
rename from meta/recipes-devtools/json-c/json-c_0.17.bb
rename to meta/recipes-devtools/json-c/json-c_0.18.bb
index 92ab612175..2fd1897ba8 100644
--- a/meta/recipes-devtools/json-c/json-c_0.17.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.18.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "7550914d58fb63b2c3546f3ccfbe11f1c094147bd31a69dcd23714d7956159e6"
+SRC_URI[sha256sum] = "876ab046479166b869afc6896d288183bbc0e5843f141200c677b3e8dfb11724"
 
 # NVD uses full tag name including date
-CVE_VERSION = "0.17-20230812"
+CVE_VERSION = "0.18-20240915"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
-- 
2.25.1


