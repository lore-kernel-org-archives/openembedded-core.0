Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6904EC53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 23:52:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.725.1785369119120110827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 16:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IJb3bFwK;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2670ca2d30=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TNSKsr2478073
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 23:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=; b=
	IJb3bFwKs6bT8NSXO79I12w2zcOcOEChpryQ3sXRwGgK0ski7jaSQeUPvdi+RjRR
	HElLfLKp26ZzkulE4xtMPpVxY7Mn3A1QBxXi6AC69rK89Nff6Xdn1jzwvrfbcXqH
	d3HAU5UqMm+4c3P53ne8L2UFL3jorOdkiiV64Ys7nwt8/0KPBOY5R2Uj/0laphfJ
	QcrBHTE5ITsfizOTA7EXSRbX5w7XKpSMXXOcVxabMFb6YvL//mtVF97UqBOW95hf
	3Im1jctSMmleWdnI3b4oWPinixT6trJz0Q8vqL45g/K1vJ2jcKo/vDvJg/fY1TOG
	p65gXBvemmXsru99+JNYUQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010059.outbound.protection.outlook.com [52.101.201.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fqtbsr2ae-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 23:51:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVp6adDzE0th+hz2+cddDIOUTgyxqV5NC4MieGbFaUe+tlZt0nMLOYxVAawRmRE6hNZpd+Xfx3l05gdri7hXgeU8NgdQz2dSil50dwLqLn/OySxDP8PeY69T7ny7lCzPpbCKI76fYJScRRffYfZZcMJSzU2x8RcQjivEUvaqB0uZ58nvmUUcZJjBNtl17FleuCxaxFO8HAASutL/cvfynauv1VW6qYsKQV10X7ZhMavf0jX9GjvBzzgILJ94+4EZenBG5kAUC2nz/I7pj8WXG5x4XoOO0uLTwoNX1ll4o6ExtxCOMaddZj/lQUF0FNk5foz6M0aQAZsBw4gU/qpNkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=;
 b=hfigm9H148LxQrOIScdBcChWLbaZHM8QnAneUD7NWQeMDTQF4SKraxSRexe7ux78tHRbTcWNwA3YKshba6pam49SUe3GXgn5DzKGCx1yiRnyMAsGnyUxKNqybNPKK/HaXK41VWxww5/VHlDA+aQV9laHRWE8a/4DnuPSbh70CF6vHncUNESuRDpkWtiqEuS8ugjG4eJoDpuyDVeXJwXx5BAW9CJqQP+KDq4jNxBF5JRfbIFDvTLevx6UDHYtdnX9xGpyEpcubut3PTszIbTOGdGJqKwZhchbxK5PV2UCffNZH+Yw/qw6m47HmFnnPJ2CeX03tEp+WBTEBl++Y/YGAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN0PR11MB6183.namprd11.prod.outlook.com (2603:10b6:208:3c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 23:51:55 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 23:51:55 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v11 2/9] package_rpm.bbclass: Define _lib and _libdir for rpmbuild
Date: Wed, 29 Jul 2026 16:51:33 -0700
Message-ID: <20260729235141.1067679-3-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260729235141.1067679-1-sumanth.gavini@windriver.com>
References: <20260729235141.1067679-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::30) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN0PR11MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: 94da8526-95ea-46fb-a515-08deedcc5ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|52116014|38350700014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	xuB/sH3eseCllxkOm5V2JuYfKzMxhDNv1W6aFrFKSSamDIa6Rv+/osjlNjDXqlP4cwwjfTsgM09xKQ6x8mMzHwAwhJB+aUFZvQhW9Si3/AB+ObZ5IISBnb9YNAplMnNqF4aBgp4V2qb2FESyD/hsJ77QTdoEP4FoJ5847I+s7z+ElMALJLCmtOCrYiaO6uLLE8l7leRYwArCbOYo4uWj1Aw1NQdnmPZJ6TzbRUWhlHUYXJ2963pebdOijE0xP+HoYmlqxMesakJO2FeqkcklE7TUmXElwvjd5TpJrdwOcNUxQ4I7Sx3CoDcnpqjG/LiSIREcQPmoh5t7JUjOdQ+pfBIVAgyyxZYk4xbgrS8DTTbSRCPMYrjEKKKHK0rgWRfC/8T8Go9zfUZUuFxhPaLlB8BAXwYmjYIQYeILe/F2LckBLNaD+a5fk4nalSrMYZ873VNqZendODUmanPhsMX/+fFVRHLmxIF/ajKue/BHcuLTmY3BTs80ZKPMv7wDzpnJyHMAFDC3/xdzrlbZI/ay4Owr6V4BdQdzeN0fSRSvTJFivGvhLpch9I/vOpFk3m8Q6BgqW6nxtBArw6ij9vkT6swCZpSp0xY7VlGFJv2lk7UMfY1o/dOzH+RX63Mqxh+aFmnyzOqc0sdTABy24YTOBSQQItLc+5C6S0JfXm/r/JDQKx/jUy5iRk4bNppW0pypawaQskHkzlKc2detn0YnijehqLe4uDelFDYdATFxgqs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(52116014)(38350700014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+ov6EI56TxJrqyNEi95poQ/R4vanEo/6w9C22DrX9Tu3fRO2h4O9EIXpl4hf?=
 =?us-ascii?Q?LkGs0F2KmU8NEOMYCat7WfLj7fuQTStPgUSmoR30A1/qAv1ghVYdtAmN/Nny?=
 =?us-ascii?Q?9BLwbdBqgS5ynScgo0bTLzwR5AIhSOdWtC/vulBoDftzKp/oezp3bSchLjgl?=
 =?us-ascii?Q?Fes1mMkmWxZGWTe1T76ceDqYgF7Q6kuCbWlAIQaAgF2bBGvtArCFtT1YGpOA?=
 =?us-ascii?Q?KWfkhf/Er1NPV+DODCjN5qN3ImqcrH757ifYxW1Qh5kLsmCjzT68HCeh/7AT?=
 =?us-ascii?Q?oTu1RcfTmkNQiXzvtvSH63TlLt4wkF1RsnQjo4BY7+P6NmevUlrnaPoTOhpw?=
 =?us-ascii?Q?jCgxQWZQeLUmQJ5fOmhq2FO0b0FoVJwNHomVq9Nj2peA286b2AfdLaNc+G27?=
 =?us-ascii?Q?U9QDuuErN+PX5PdshNmX2l4TQy8h6uF3pMM0SvaVkjhG5yid6gzpI9mdAeoD?=
 =?us-ascii?Q?orlhRay4gz/r+C+fhJmNV+vzNsjgpu77c9P7v3PHfJ/gI0pWk+pU1+FhJmdZ?=
 =?us-ascii?Q?jLi6sAt2itCE5aRorl8Rx7pudbe80VqhuFCPnFmthDJi8KrwrPtAEBU7kM7O?=
 =?us-ascii?Q?3KLTq9N3m9EqhzHdSI+/8eTagGuXFFnNDAhm6Gz1DAOpG9YYvTQPp5k85pfy?=
 =?us-ascii?Q?qFkqlyoWgsXi0zHJtTU+xudmqJE8tFF8q86MjQDlKChC7zPvR4gz3SQH7g1I?=
 =?us-ascii?Q?9T4Ev26Ilreywq7h6GT05eE3BFSdsV5zak3rc7k5v/j0TQI+fVUKPGpIXE0u?=
 =?us-ascii?Q?ejnmy6HO3a+f9hSJM+SuUoP8efyIZkaoplIn/z1KR3Pv82yjrfwE1kkk9k2K?=
 =?us-ascii?Q?lOykjAdOxpiCMQ/PegFmNiIy8WyNOcY8rW6ZKOphl1BYw9ecxvyOUP82MIN7?=
 =?us-ascii?Q?2nIJFD3OpecB3jZexiT9zVvhnxoeYvKOp6Q0wmct336W3AeJR95wIoRhqY7f?=
 =?us-ascii?Q?SiiV48yW9doh51bL1WKuwoLgXk8ua9VQM7LpUlyDe5w5ebZF8Us/Ipr7smVH?=
 =?us-ascii?Q?hwO9ChEEHw32KapSGjna6QzOpTJeywlImbBVq8+6gVi4GrCCl+sDvVi5RlPa?=
 =?us-ascii?Q?Q5A8nEc/TsXjZCC3mFFmRI5y9t0cEKmERYxDrCMJo5vuyNnfV1BTCZIk7LQG?=
 =?us-ascii?Q?zGagu/vOxIaiU+7WvZRnB7d9vevl329Jg6QuxWevk1R7rZ4qeuGWXREfGDeX?=
 =?us-ascii?Q?NFVlfOTqN2oiYDM+n44d4zsyGHQCRZmzzgjWt5nAJUG0WvAtF8PFpYnIGzkp?=
 =?us-ascii?Q?eHdLYMn7M84YkBntiWb/Ld3+rZQip4+zN0wtCsX0rMDAwbWThCAVA5H0/Wur?=
 =?us-ascii?Q?/2MPTc7Huwj1e7XLzrwh520EOGxpnlAZ+culT5Btl202uHQcpkznJn5UNCih?=
 =?us-ascii?Q?2WGeguurwd0/FcZa9t+BoZq5Ju/gwtAmjH+kJe2YWWpXgB9VQLNolD0sN0du?=
 =?us-ascii?Q?Zo4KOS1EePzatmnMfbggBw+flb+5gVB/rlfW7PZJMzcGsKUAc1zsuC4zs2l2?=
 =?us-ascii?Q?o1uldyvjptDLteFqnrxrC1y/FZS3gzCayH+j0OaG5F8wmHEleLUIkMsGshs2?=
 =?us-ascii?Q?S035I9FU863dQv7s648zG8atTDd16j8jo0MRdWpwI0kjuCRHnmMwHcWoWBHU?=
 =?us-ascii?Q?+bqYbSZT55REIa1C9JhUqFuvhL1lcrbk4yNkOE1yrLjoByr1F8UYRGOYxk15?=
 =?us-ascii?Q?faRzwIoz0yACJayM2sbq6JqxXl/Ee2gqJd4rbDPM47T1Qgsdnt0GCB2wjB2z?=
 =?us-ascii?Q?5/deHUjAPGrAZNlQRRn0zRdiLKOsZTg=3D?=
X-Exchange-RoutingPolicyChecked: 
	Ia+HefPUhqgyKRa/FO5zckMJgnXJfjK/FZnWOh0ZPns7hDqkthwF1a1U9peRvw8M6y24CC3mhPGE93occ+hdh4aoufj7prtsNbsCTl+9aDzjbogeqRGrDUSTkRYJ9lAE2CxTAra4YHoVagyCH7Lx0hTDCVV+GbttJNvG93x37IxcsMxFK59/9ulzqEPucQS7+zEOrF2AMAaGH4mxmTCXKosDHgoclwwFcyDfe4nR+dlfrDSHEfV1rhGMYqRynYSgwhQ7PS6ieUS23t/xpCV54JSa0Ee9d6Ky3r51asuSZmfDm5513jKDR6ToH6mWaxvyp7wivBZpby9mHJMqfdLCsw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94da8526-95ea-46fb-a515-08deedcc5ef6
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 23:51:55.6709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/pvVldfvTUHuk1IJsNrhbJZ06TOPDxj7NqWozl371fKIWyLZuBpYtZfc1lRXAX4PiPo/ZGe3LD5MGqh8/KizTQHyHcoh87ssrfkyqhSmAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6183
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=JuvBas4C c=1 sm=1 tr=0 ts=6a6a921d cx=c_pps
 a=mPJaQZadrGlgYT55Vo1ogA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=uhQZ5Q_QBcnTBNJc4ooA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3NyBTYWx0ZWRfX8oeTL7fzEwJ7
 TUvCVuGeD4hN+uLTba5FxgdB/2SF9TW/aVxMK7pDVsei7HaRyBKxfTkVnf8QjodmLyzrNSOfuSn
 0fCk7sbcQq2pe1ODYfEnA4kQ0rzDV3nB1HzDAOBFrN7zpLF5HUVp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3NyBTYWx0ZWRfXyPrfNWz2dSB1
 VKA4VVLnkgq2HN7yOL/+tKamWZPkRQujYUiW/EH2DmmbS53XTPVUa6viVOGJ8N3h6VH2CkR5e8t
 m03hSqB2CXyEYXD0Ro0gRsfaHhx82QPd+igW8CsXwldwnVK/4647iq7rBgO/ZxAcccxu4u/Qglp
 m1H5bN+3P93sAgv76Q2UCQWdYyRnEQUbnKJfZsYmBztkh2AP3nUMYpRWoOzSSx0YeMEF3t6xfrU
 OaAFDqPxqX7dBo/1isOSW3qXEDUT4RvLIp422ds1jS+HA1PYAMpIt4qm9mkt0sGXA4WAek0RuJX
 liPRFF/OVwkFlCkAvAtimH9uh7nrmCi3Zk56W9bJ9UYGp9iCGnJaWQFrePV4O/Cz+wS5f/jjTle
 0B2S6NfEMlTP0ofiDJpJuL2lBXEq4jQ7Sj2YIlaIUBh4bgEMNiFkbZQo0mF9NE0LZiOGjFKrY4K
 uZU87t+8TrCPj1ZhM6Q==
X-Proofpoint-ORIG-GUID: h-Gmchp2tKIMgWz63tdekuNOJT4NGwM7
X-Proofpoint-GUID: r4adrT08QUx38seK078G4pp6HoVGUkrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 23:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242299

The rpmbuild is from rpm-native, the lib and _libdir may be
incorrect for target, for example:

* rpm 4.20.1:
  No pkg-config files can be found for qemux86-64 or qemuarm64

* rpm 6.0.2:
  - qemux86-64: The _lib is lib64, this is incorrect when multilib is not
                enabled, and _libdir is RECIPE_SYSROOT_NATIVE/usr/lib,this
                makes the pkg-config files can't be matched.

  - qemuarm64/qemux86: The _lib is lib64, this is incorrect, but _libdir is
               correct (/usr/lib), so the pkg-config files can be found,
               this also looks wild.

The rpmbuild is like cross build, define the values when run it can fix the
problems for rpm 6.0.2.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index f286d3a0e2..9af4cbdd94 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -585,6 +585,8 @@ python do_package_rpm () {
     cmd = rpmbuild
     cmd = cmd + " --noclean --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
+    cmd = cmd + " --define '_lib ${BASELIB}'"
+    cmd = cmd + " --define '_libdir ${libdir}'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"

