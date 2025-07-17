Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C680C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 09:42:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.44537.1752745327374736442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 02:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9293639f93=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56H8hwii376462
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:42:06 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdva2w2e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:42:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfA470VtXJ84jNzb/Jl7EyXFNot3x5fNqR3SbR5EQfV2EHUIe/bYxOp61eq9STd4F73zkmJluY7Qj8TOMz+HkEsPMXF+DgRKgDZoJM+lLCVmKZ5VvgjYWKitvRaYbRosnQry+458RD8KBvl2MFsNzbCHRJDTfVEMc53/LCtxX1rkQ3YEZTFC7iII7r5qUmPfwlcXpY+2XNckJNQ7zCq9eiVLxDM0K8FAFukbfB4fCHGKEb3xy806F636pv1PzytPQvj7LUgb7hXkv7CjFslyf2s2/w5t2EZJ25k9JvyO0Snre/rrfMQOOYqalRK2AYRYy8m66L+tNMGNNqLg4i+WyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6RWmciSsaUEyAoxZuGpLV0mmpmfSXdc81yu7uqK1jI=;
 b=L0yJr9EKNd4Z86lu1FsH5aBmpwcFVq2JmHni4QVDdkaUFq4QikbeJDxWgGCU8UOyAWKLJXnVt42288g3AZIcncevWOpWLbfSFu/ZUmJDWosNKqHOwTOB5av5jOUKQGfDbpTS3EsBhC8UYeFf9YBx9vukWsM/TycDV3EyWoL4d+IRb6L4Ozs51t3rQdF7wjtt+bU+cYcTnIrfORPHZPer64KquUa0np0Z0byDLgs7g1wqnHN9t9XKYw2n47lRV3WoIoS/vtmPr4ZmxDZcnVtYwXFdjQBSNi9M8EJz+y1Ry8UCbTwAnMQB+tPXDooWnTroeZcUR5ZSw1fLsXjSKF1F2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ0PR11MB5938.namprd11.prod.outlook.com (2603:10b6:a03:42d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Thu, 17 Jul
 2025 09:42:04 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 09:42:04 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] glibc: stable 2.41 branch updates
Date: Thu, 17 Jul 2025 02:41:45 -0700
Message-ID: <20250717094145.2061968-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0117.namprd05.prod.outlook.com
 (2603:10b6:a03:334::32) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ0PR11MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: 3788d823-a388-46ab-5e84-08ddc5163015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dzoJJlvgYwgg6G8JK25gJxfsC5TN9uOVFQllOhHKamIiNLlsM+iFMUKStSmo?=
 =?us-ascii?Q?tYZicXaqWBPbW/JJcvV1jM4Yocf3F7X4JL7QNoRmD4nko74Mb+nAFk42qlJO?=
 =?us-ascii?Q?4OYZAtEZyb+Yhpo+pC0J0PDtFSyYfZ2I4m2JDSfqgLpu8L7y2B0VqhD+hVok?=
 =?us-ascii?Q?fUiPXsqI7Q3crZbrmg8XGsg9S2yyfCLPfHeqB/fMSfzQ+f5VdxASrbRDDHvK?=
 =?us-ascii?Q?3G6k2ucYNQUbrPE8J7PfUnMJVt8lrOAvSP/WE2KWaDfIuZUftSWj92CoPbf7?=
 =?us-ascii?Q?Zxa35JiyX0ZANCalAhScpwYIKAejpLusgYDXyRehzPGwRv90ALE9huf1Uz0/?=
 =?us-ascii?Q?DJ6CPPhTm/AzDq42pDFjg4smadonyUZP4cRa/MpYzIQkG04f/pm+/YxCXsJr?=
 =?us-ascii?Q?RqV4fa+iI41OMiiwivAMkJHRvNomoTnNKBYN1+jG8Rd0WEyiUxz2RjjO4H2v?=
 =?us-ascii?Q?qFGB6Khfq+9f2n5AV1f6n55cJ0rrAWczcIS1Jun6HF6S07TCkvrcMcY4XEdU?=
 =?us-ascii?Q?n58qTv6vIbEOYcwDtw+t59pZbVXXm9/8i+HI0WZxaBWDHCKYN5UPwTZ+uR5R?=
 =?us-ascii?Q?wmuzkYRE9/yKXE/QwSyGNMygbuGswNAIhwhArXnx5ywpLFXPebrD94gNilSf?=
 =?us-ascii?Q?uYEOj/VHUwIcGf36es+66X21aTSLFfRXQVEQt27lzphCdIdh2gZ+Wfy93ExP?=
 =?us-ascii?Q?Gl0t20Ed8K4tgymlPO/mI6g3wQAIeOgQRVuMMTQB+nKDzT7V6VBOJ5EOBy2Y?=
 =?us-ascii?Q?ePid1u2q99xa/IqMKishFG0sEvdHow0npZol9gaPFu1Vrk95zJHUhasO65PA?=
 =?us-ascii?Q?P3H2j/flWcV/v5iSv/tC0Cq/cY9fEobuqkCMFIINRkGaXb0u1atmXH9e2DzO?=
 =?us-ascii?Q?RNxKlse06va5C7e7UA47QB2Ea0CyxRxRu6MwuJa296sfyOhL1EBT5c+ju+eW?=
 =?us-ascii?Q?EnuPl6GjKpVXbUWvNWXXcXup7bPGPQ30uSBRFFzpYWYl9mpjzQeI8E5lOALN?=
 =?us-ascii?Q?JxM/LaBcAPGTYidevNgK1zTmK1hlj3eZFmSBFuE9sCSeN1HKp6HDRJ6/h/2W?=
 =?us-ascii?Q?r5YA4XE/JQ7xBzHaCMlBkvOj0vIDiBcUs5rFtNOU4A0TStDs3Zk2BhSfXTBo?=
 =?us-ascii?Q?5xFfuJ0qduuSIB6eTCQA/MxEjG8BgVnlaWVIoz+pAvfFoaNyk83+RTIrj0g9?=
 =?us-ascii?Q?ti8XPyiUcpYL3kCOB4AUuQ8wUPqHuFroXtklxdfUJrqSmbiHyhZAFPiuMZ6B?=
 =?us-ascii?Q?z9w8s3RVv42vwNEdKhKwN6cZO7mZLyzuyvn5H5GzYSebW//SRVK9ipB6szGh?=
 =?us-ascii?Q?v8WZO/rzlfZn5nqd+8BXk9wp0kgSei4fsVjku7uGH8a5b0yCvc8pvll9Z+gw?=
 =?us-ascii?Q?5XJasebqSoJ+cxeF54a4zi179/JydKjQnfvnktUcNfhOpE+u55Rvxuk5vGbH?=
 =?us-ascii?Q?ykswE182tGwPs/wYOsPV2vG/Ir+nELOoDU01+Dzov8yZtsOYCDLvWw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1OXBe1+m0UT6lPj//dtKltKyNe2F9ckUijBhpSzq8ALjzv5X5OhyhJZkSDhO?=
 =?us-ascii?Q?E/q/1Z2oUIDsnxpFr+W++4RqGHlY5FwH3B3IxspAImUODHeVUi2K/oVV2csF?=
 =?us-ascii?Q?SfoVQKWND9eEime5iXEnJ6n4xNyKkwePtzp+KphedzLsThf/vxjaudYrw38H?=
 =?us-ascii?Q?7pr+/8N1Sk2883W8zLNZZBaoHt1tON4gUplf6o+6+mox4WRv1GRIr4Sb+HzT?=
 =?us-ascii?Q?DHmjtCjaHiMw5plpRSVFsnGvxqIHtwtMAKhjGb92PB0dZvDUkx0oUjVjOJ/2?=
 =?us-ascii?Q?51A0cJjB/CyMMo1lGLgmK+9X3NqleVRzxb2vwclRAULLqcDuUQd6t2LbgimP?=
 =?us-ascii?Q?+5WgGWo716YEzbBAVXsnwbj+xQ6/gHV8zDGHIsswldDj1gNAO5+4skesTqFi?=
 =?us-ascii?Q?O6sjFTdQLA3c3ZYIqzl2Oi12uCpk97H+ngHmpJKcBowlFiQ7KDTjCMLRMU99?=
 =?us-ascii?Q?sGNNU23dUyWTkxzkn6ApVQAInfh5QWZSl5uUqpfWNQ7ajZitDNiRU8CJ/lv3?=
 =?us-ascii?Q?GbXkZ35rqc2PiQ+CKQcBlQAnULbiia5apksgH6UmhMACcyGau6uoL7wnKzOI?=
 =?us-ascii?Q?CmB7EGSrVNdMV5gAE95WrW8YFwy07vJbrOos/1S52VXJVcPnQxqnccDre0md?=
 =?us-ascii?Q?wWIy0W3TCYiwkVSxITCNdOWXb4oeOT0j3LTttERdmfHJ0EL0v3yOZMvIW2tI?=
 =?us-ascii?Q?SeCGQ4Wz9R/9WTjDoj3xMbMie6RCj8qRTLQqjLDm/2pnNZX86zMVpE/vz0HG?=
 =?us-ascii?Q?FZ/rmLNE/riNSjlhlfRW1Hlwh6caYfjJvz59INdvrVXsRKf1plnZ7D3yadr3?=
 =?us-ascii?Q?/7mfXsoILG8qBeaXDfvR5/RRmOeVjzQBP8thbTzfIZul+S0iiGM7dq/EniRt?=
 =?us-ascii?Q?4V6Aa/Ul8ePdTo+BBUtIl+6/sddzaNx9YEcb85cVyd0H9s3wMKMmza+KLCvo?=
 =?us-ascii?Q?9wscNvWgPI/nwlswzijyciJ2oD5iitUot7SnCM+nCQdf3Jjad2Mk4cd6zGXd?=
 =?us-ascii?Q?xegKZ+Z1pNfVW25xQOlzuKchtqIF4JI/AXv1nBRzf7/JWAmGloslhuvtF+e7?=
 =?us-ascii?Q?Qo/OX/TwrxpN+oyH+J6q/fyb95me+stSvGeZvB+KeDTWg4MJbtEZpzHFXtjs?=
 =?us-ascii?Q?fauwfilZnidoO1/C1ikcGTy+zM9YDvPMqZ45qr6C9f3uTDep+zY3XIll6iR7?=
 =?us-ascii?Q?hQZl7Uckytfn/9iKxA7J7sRbKhWKrI2XPbirjMjsd+KewJnpF9rQTNYq7iXL?=
 =?us-ascii?Q?hSUCkQseH7K8ADN1w83svnUi+B/Gzj931AnMKgjogeRt3ioLCM0YYuWYwvrt?=
 =?us-ascii?Q?3KGseAr6smMkrriK/vo0kB747jcqmBfrfib2sIZM0b+0XzOwGXcLtMLaMn/3?=
 =?us-ascii?Q?5jefKmj8zi5CFqRWS4Nn8LXYfl4hK9atYk1M3DRVgnhGbdlnf2pBuPBQ4JU2?=
 =?us-ascii?Q?ZqumCrkrHcG7P5nYmtB7PEd1Fp4Kdh0hSs+Z8Tf75vVOuK0iLmywCEo5f6HK?=
 =?us-ascii?Q?hscJgfXT/7DX7JlqQfacpq2znY1f7HKQIWDzzCtYsEcvCPH4tSmaAsaPP3ld?=
 =?us-ascii?Q?uTucYFwavTa6/MPqAhp9pKs75fp6j8iTp1Ye0mxYbkHLxMqwiTS5Zj2ZZdhE?=
 =?us-ascii?Q?CwQ988ljRbkeE5iFmGSA6CM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3788d823-a388-46ab-5e84-08ddc5163015
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 09:42:04.4135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24ntmiAW2tRj+mU8KSF5Pu5rwdpCK1rrENMGgDo/ln62L6RAGJKtiOJAZ/HpDZQ4UtYcJNcgo8S8JeXml8clQcnNTuwGVwVHeKkd6+fguMQNcO2dbSeu1ow/wH2KzxmA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5938
X-Authority-Analysis: v=2.4 cv=AbaxH2XG c=1 sm=1 tr=0 ts=6878c56e cx=c_pps
 a=WuF1xcOKHElLRUdN7CAxnQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=LgjECgB9X0GoU_SHiBwA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: P5fF_B_UWWczB_zWMokPIjb5414e6b39
X-Proofpoint-ORIG-GUID: P5fF_B_UWWczB_zWMokPIjb5414e6b39
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNyBTYWx0ZWRfX5RdylFDfvvu9
 t2Wi4woUhBajmtoLxDX4VO32OpGsy9HeNtAM9UAakjpAz7/iAtg5LPvtobbF00FiIj0Q1laabyq
 If1TTDH08L/wiPB+Ppr36nfkTkP5CiHXTEWvGgybYLBf3DX1glt55vQHKOy5KsbkG9A0VAlaXvR
 N6LyS9yjf4EuFdltBHrAwXmIueJ1pf6ns0RNAcXsd4mnl+m91W1kjbMym/C9PqILGhnxMlYYD9Z
 YUzi6lnOVBGaTMXxzR6HjTaxldRoh+NsrAXTrgiC1emkskOwIk44UYvFEi2wn3pKJJNPkDzac65
 fLKebutwnTprU+nGvzTQp55/FMo91Rq+b7MYpvZhod+PmOAs3PZGcV3C8lvGXbieSnWPbbAyCem
 8CIb/TAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220524

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

$ git log --oneline 0c76c951620f9e12df2a89b2c684878b55bb6795..6e489c17f827317bcf8544efefa65f13b5a079dc
6e489c17f8 Fix error reporting (false negatives) in SGID tests
11e634ccf3 support: Pick group in support_capture_subprogram_self_sgid if UID == 0
61e461ed0c sparc: Fix sparc32 Fix argument passing to __libc_start_main (BZ 32981)

Testing Results:
           Before     After   Diff
pass         5805      5809     +4
xpass        4         4         0
UNSUPPORTED  164       161      -3
FAIL         282       261     -21
XFAIL        16        16        0

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 2d31131e03..a2cfd0f308 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.41/master"
 PV = "2.41+git"
-SRCREV_glibc ?= "0c76c951620f9e12df2a89b2c684878b55bb6795"
+SRCREV_glibc ?= "6e489c17f827317bcf8544efefa65f13b5a079dc"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.49.0


