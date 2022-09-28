Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB25C32771
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 08:45:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5626.1664354704316539027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 01:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jJb9zJY5;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6270d21deb=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28S6f07r024397
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 08:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ZOKoM6CTDy3hw4ePcgABymjYTsqgbV9rDTGv/NveAnk=;
 b=jJb9zJY5LRRvzSAlPsbSzo0vskDjPqjDHbK+hsa9Fup46e2i2IOWOttQHkoROdpVZa9O
 40wI0Q+m94rrsqAtbGqaorInqEepvjBqKACAsUf6aPhIzUlFjLkoa1+Vj1ZXObBaaiiX
 thsaRVLNrIL5GB0PDZJAcehqABfxaH/hhmfbhHLGIlnxva6AiZyhz0kGYswexND+zL0z
 DKKudwTE2aKiH77OTqQRMYY4GrwNa12fIpW9QrNiDRFldbwIfHFoeIBhR81LoYYUXRkz
 gL9c90CAs70iQBmFUPj/xCIFpPp1cjY2X9qh7tTa2JlGGM2QVqe8zMJzl10tU3tKzPw5 dQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsrv9kagd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 08:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUAK989/kZfKR3RklbrfOP6TCBhmafx3weSzJRnDGmZy6JzXCYIXf0t1AE58WsmyISlcX4oPifbeIFiR/45HHAcVl3DqAvWYcHiw/nQjfO/lnBdXnYpQHIonS81BmslUSZQIu2yU321B4mU2Jk642FvYRJL6k7KrPzu7ckgWMdtUG9Rq4FcHyDvNrAoBy4N18qfkTPKp7hUG640SSWfje5yAzqN3elhkr8lrpzharkNcLVH36a5auOPOPdRCimax98qKT93tdo1aBi6H/aqGNXISNo36a0voTWU/rbooQ3kDPvNyzbfbJkaounmJP6uTaS4khSUsZfzcj2+REBOfmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOKoM6CTDy3hw4ePcgABymjYTsqgbV9rDTGv/NveAnk=;
 b=czpw6spdUNHF1D/Uu4h9okit5LAij+MLPzd2Rj7ajFcVcP2lE9dC3CsHN2txsI6OqSx+qf0tU6817/STzz+Er2UAU7LbxkiaE+2JV3BWXRchRIU1MtWNKqnIWP1Cqtf4dMdwp67AJnueO5ye8pl33ZIzJ5KFx7j5G11ym2AnYaRbbgcD2RXJeRc44Pg7fsbNGtJVk9ZMKWTts6wimRRhJUBeh1chreSXwGBGRMv7nvqbFZpMaWbNVvGjhpaRFC71orUDc42vXLdjzdgcStY+AGKkPlm2FOmiAV915WUuym8H/yvdCU+AmsAy0UJqyBeUp8PVFDmiBN9swKEhpcq3Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ1PR11MB6300.namprd11.prod.outlook.com (2603:10b6:a03:455::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Wed, 28 Sep
 2022 08:45:00 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::46d4:1bf8:c70:29e9]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::46d4:1bf8:c70:29e9%5]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 08:45:00 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][kirkstone][PATCH] useradd-example: do not use
 unsupported clear text password
Date: Wed, 28 Sep 2022 01:44:48 -0700
Message-Id: <20220928084448.62273-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:a03:333::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ1PR11MB6300:EE_
X-MS-Office365-Filtering-Correlation-Id: d38dcad5-c66e-45f7-ed81-08daa12dba95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VfGEdsvsjUjzoaIw1QSaQc8Knmj4pPlxT49occdBt05RhhYOh7y49xwtEq/pfRDuCpCCeuNtqoUL3aHchK1GpF5Ekn+K6rLX0NGVCncs4DUwGTEe/5rGxwPrdxeYRGdVRjQ+tswovV3CQk9vUI+tgyxIuSRHWjiuHzvDlEHlWhLm8O84IzHOJ/MlYzsZxiioZwz3zrfXbZv4tMjXSufGaSD3zjU7rYr5b67ppsT1M44VZZLUnOUS6i+Qh2DF3q8YqkY3Zeuhm5SA39pP+yxP2Ei3YpNNujTsmvFRIxcNwfQU2ilRY/hPkV0CV+o9ROahN4X7nDclGB1HGkoKUZ+yWEJAXwA+YqQEGsGATalUR/dX5p1cygb9Q8v498xgXCYhapRVty7b/5MMACN+TLGFKMl8IZIyXfRG7BnlgxyQfZxyiGQEM4DN20WBntLkJJT5Shj2lRv84x4RdMv64Hv+Hkqa33UTIc1jYoZKPyg9BvM5v2O/7d74LO9rQspPKK0jBTI2cxw283sGDyvMfzXGyKtx/d8qZTkOr6FGt3NSqhhkX3nWnHU5lTC1r8ddIFSVvv7dtpCRnG9X/LZmZZKLiF6n4NC4JerWwpVAoZj0S4aDx017ec1ZQcnmMLd6jpmNszhduVVbieU+WwGXtyJONbtt/cw028hgUrv+3Njnx48yZQnv9t33nGdJGQ3GRpaRX0laVcyvRpxuSKdrOoUJSz3l7PZlN0JoFC3msmBdNg/EFR2k+UeFPgb6mvKyySpB5CwQ2kvF/Wolsvv92Xl69Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(39850400004)(376002)(451199015)(1076003)(66946007)(186003)(66476007)(66556008)(6916009)(36756003)(6486002)(2906002)(478600001)(6666004)(86362001)(5660300002)(2616005)(8676002)(38350700002)(38100700002)(52116002)(316002)(26005)(6512007)(6506007)(8936002)(41300700001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FELcWXwebmgUW6iylKjJUSmwKdC9079sa+pZ7FHYqug/Oa5+F4qnEKDvsVq2?=
 =?us-ascii?Q?263hDAe5NnLnQwZNupzUdMmun+7YPOfyw0+eztxGW25ukjyrhP5a7fSu/caV?=
 =?us-ascii?Q?tK8qn/puFR/+tmcyW3nRmC0580gswERADNVzVJdhy5Zgm9beSrTAZoD2cnYp?=
 =?us-ascii?Q?vOuret5nDdj7AN8S6GRlUdq5UoNUzeiEv8rCgiwbGTgviaD4sh8Hr7qpIcAF?=
 =?us-ascii?Q?3le1L9B4675nV6r9MU4zSi7InwMvifYELcxqJwU1ozwzBP4pBOEf4+QNAShY?=
 =?us-ascii?Q?yCTYkGhEejTWxFeq7XDYibFqOwqCKRpNSlONRWd/98SKcjbVb5VBD0uxysor?=
 =?us-ascii?Q?1ZKIvKvszJZfzCYl2ss8ElAt8GckuC17u4rt/q9YkztxEYpyczY0Sv0XeykQ?=
 =?us-ascii?Q?kIi8ixgDWoT+EYPHZqkQtBs6BPl5CF3lc14c0jelrWdLtrJ2Gi4ElTduXx3M?=
 =?us-ascii?Q?RkaVWzbhcNm+t2r7zaCln1iBJSoDoETF7f+mrbHC0SLGzOKgaK5NzYLdPR8O?=
 =?us-ascii?Q?RpvZOQXzYl2eBZ031LfFQCFDrGDa04VBkKFpo9H/hcZOoy5Xtvyib3Ud1eMY?=
 =?us-ascii?Q?s7U9uGqby+3Y7xQjg3c8o18f25DTy5Vx6l1+M+g9jPLS67ccGeSdSwcMV+/7?=
 =?us-ascii?Q?cT+RaLesqNAGjS5QvSoD3/j6DrkOqt8RNJugw7GP04KkifJUy4kTy5V5ezmV?=
 =?us-ascii?Q?hrcQMv/P/8nLZDRamSQ13Ut6gOdxd8gW/4lDJxeGjQ2T7jbdafbGl6o13G+k?=
 =?us-ascii?Q?xNv0uBEFj76hauQYA+jSDNkEP2pBDrIVXxdNkXCElquuKWQRzNxtQIhM3VWG?=
 =?us-ascii?Q?sDA++E/K6N3GYkmWD/es5OwPQUYzMbqd+CtXiC3VvM4cIafpUVof91D4sZ7V?=
 =?us-ascii?Q?T+8xy6d4AxMVBJBoECDfeHr64TeS2MeahjgEQb4yvrLwzwC+o1snUClcmB3t?=
 =?us-ascii?Q?P+BdnBdZSJXrQk0O60QX4G+G/8fgZgYPrgew2bWLbfsQAWffR8ivSr6VpCNU?=
 =?us-ascii?Q?ukFQJjlm15xR65ZjbflQVAE233g+bMNb6pR3g0KR7vfACXzSBjK9Y80myJPK?=
 =?us-ascii?Q?RXQouodtmDuknfrKN/jQs39KAVKMKlMFHEiXKkCZb26ohJPUjc7zZvbcYLWs?=
 =?us-ascii?Q?lcMnJyszmzkmwKZ+QyvvrG2Sn3AbBJP41H50z+PgRYsq5MK5ovPV4Uv8P6fE?=
 =?us-ascii?Q?vhVoePe3tprF3b0PtZ62rBYDCtliq1amDWBqa8k9sH99VJ/G+7BKoL4MIice?=
 =?us-ascii?Q?d/s2jaKB9om82cASHlloUerJVThDWxC/akJGsdDvVfyeuhp+M6vfTLA5OVTv?=
 =?us-ascii?Q?rV7cYSlMzCQFi7ez9P6OUB6MAwdRRscWO5nr1QSx3c7uSaDxrLvTN0xhC46r?=
 =?us-ascii?Q?EfIjeL4a4P3B36TJ21JB0fx0XkdlLtPEfFuskt2Wv6QKgvUR4FpYW6KQf4X2?=
 =?us-ascii?Q?7E56oE1f4TscBsftoMnq3O2GUPsljtWv80ji6a2q718z5nxoHjddI6izf8iJ?=
 =?us-ascii?Q?8sKhvj6QR5M2+L5esakprV9IHY7kLaSkv6baiLFHZvqjRMCnoiJeDURaL2KF?=
 =?us-ascii?Q?O/o4VLN/oP5Z4x4CTv4fmS6IF5JSDqfCmKovmyq71Nvz3USstZla9rOb/bp7?=
 =?us-ascii?Q?cg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d38dcad5-c66e-45f7-ed81-08daa12dba95
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 08:45:00.2803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aGrZ2NY6XKW8kCSiBlYW5eKcp1QQzd+jVxHu6AqT1fzIC3/4Wnw8HXH1l8ah2oZh+tDshLruooycoAP/oFg08A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6300
X-Proofpoint-GUID: Yxe7HmMZJjELiwLCgrtRjTxDV5Q2hkSj
X-Proofpoint-ORIG-GUID: Yxe7HmMZJjELiwLCgrtRjTxDV5Q2hkSj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_03,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=892
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 08:45:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171140

The clear text password support has been dropped. So let's just
use a normal ecrypted one. The password remains to be 'user3'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-skeleton/recipes-skeleton/useradd/useradd-example.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
index 3f4c42d714..cff624e2f9 100644
--- a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -33,8 +33,8 @@ USERADD_PACKAGES = "${PN} ${PN}-user3"
 USERADD_PARAM:${PN} = "-u 1200 -d /home/user1 -r -s /bin/bash user1; -u 1201 -d /home/user2 -r -s /bin/bash user2"
 
 # user3 will be managed in the useradd-example-user3 pacakge:
-# As an example, we use the -P option to set clear text password for user3
-USERADD_PARAM:${PN}-user3 = "-u 1202 -d /home/user3 -r -s /bin/bash -P 'user3' user3"
+# As an example, we use the -p option to set password ('user3') for user3
+USERADD_PARAM:${PN}-user3 = "-u 1202 -d /home/user3 -r -s /bin/bash -p '\$6\$XAWr.8nc\$bUE4pYYaVb8n6BbnBitU0zeJMtfhTpFpiOBLL9zRl4e4YQo88UU4r/1kjRzmTimCy.BvDh4xoFwVqcO.pihLa1' user3"
 
 # GROUPADD_PARAM works the same way, which you set to the options
 # you'd normally pass to the groupadd command. This will create
-- 
2.37.1


