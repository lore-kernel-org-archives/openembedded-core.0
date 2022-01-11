Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083D8C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 23:59:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16321.1641945542932355776
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 15:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YT4weYUE;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8010f76d9b=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20BNgaBH030032
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 23:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=mybti3GnvXs+GiDwYG3gmRgeurEeCTP+xcqcOMZuwQI=;
 b=YT4weYUET4FqxIWJ95bWIjliKxxa6W/KQwzZI/ypfqEV5hr+f3MK/laV30nnwv3TaabD
 llAxlvqKktw26o7+dokGub1DVbE8w9KFCyZmlkNoUN/AU+gzKeRqwGsFSg5M3EJh0VEl
 fMzq5qpfIw6KdaZhDkm6eFCbeQ2J3iU0YhpLxupd8eMC4PDwvm0/IfcqiZ6E+mF8GSWn
 ZkMtdHuPFeTh6BeX6PNN/+TMeJzKwtIi3VNAH6ZPWlUdhmH5Tm10RBzbrSNuS+3lo3rD
 kB/K8DgyobKjle1E2JVSPT0cjlIdeoPFdUhl44L+i1mEnVdNOyg15ENChBz8HksN/n6O /w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dgdxj1gcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 23:59:01 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20BNx1v4029112
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 23:59:01 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dgdxj1gcc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jan 2022 23:59:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duunz/+80hrsCYS6U2JpvBd+I2UL+g+m0VUdOOnXweU1axJu5WnyTNJMDtjLduqSybJtFO4EYBiT1v8eQ+ZF9l7i0NuweMw/yavE5UoC+K3YrKfPxPEnf+aaYi9e7dzXkMgZ5VC+DlUgG7RURul8EIOOWM0czR6lbNQmisp9uTlkn2KelPTpDqEhzBXwo4BrKgvmQ0Q66iEDXbsmU1g3yXJvcYB8dUondLVAgh8rVndTcL2oE42HJwptKznBen8Dz4EuPUOjkULOXhuz9biQ2KKdgg4J1JOME4cK/ISTq4Pvtgzk2eLVLTF95Hd6ELGFMj8AXF8Byhij36Jv/6f5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mybti3GnvXs+GiDwYG3gmRgeurEeCTP+xcqcOMZuwQI=;
 b=h10icjIVcxn1/YVeVPYPkHVF1EODQTTNALe3M0gjTzeRhso/pQFjguONC2qoMER0PnfVkdcWUlPlqvag7UD7p8NJ31yt5/zC9CsHb/1rS8wRkBqsqgd8uTdNAqzYrhAnsFHKiWTmabWIOWNVc1+naC6Wnehh4ea4FqOCxoy6J1zkly2XeJ0HOKzGRJIo0aS7Yotu2KKjSqNVABfhiOkTuHgp1gNl6HUC7Ujcd3CgY3QJNFqr2xHclM6Xe5CoVbhqTszFHTfPSHt8qEnXResRqNKu//p0PW2scnYUMWePu9DnC0B4QLbUq0qPZk/dDSqPN6swtvI9b0SoaUkg6SXtRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1280.namprd11.prod.outlook.com (2603:10b6:300:2b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Tue, 11 Jan
 2022 23:58:59 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 23:58:59 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
        JPEWhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [RFC PATCH v2 1/3] create-spdx: Add kernel work-shared source
Date: Tue, 11 Jan 2022 15:58:38 -0800
Message-Id: <20220111235840.81471-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220111235840.81471-1-saul.wold@windriver.com>
References: <20220111235840.81471-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:5:190::31) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25138c9a-b704-4685-408e-08d9d55e55f1
X-MS-TrafficTypeDiagnostic: MWHPR11MB1280:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1280FD69EE920E0F16AE68EAEE519@MWHPR11MB1280.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bkS/5XIt6z8ow1C1BicZOypmwuqT6eT1f+TrVbR1idAPHjhHW59humfHaZ08r0hJo0Rew9jRRYAtyCbr2nCVM5PkbnJZ5Pp9PhVALy+3GrqX8NYWIGZm3dyCj8y4ujwhdZAB4DG0tXn0L9OyQ6TVSNPRZlmC4zxZXcdPohohDZXh6W4rQRZCbFYZU0bQjpqMuza/ZPOWq4n4jPgi/WkpkeAtHl3J815Mr09SNxex8G6Igudf/X+MYeGvkfzPImCMEc0bNFZmdSyQ5AboFN854gNnfhXdX/bFCVAOkS9MwByzJWaCODL4TsiEbKwSwCJvl7rDXXp4tUFnPvzpje/zOWvr88AFzv+sgVHEVOr0MKNv9gSWvj50Ibr9hXZlJoEN1hGxv1rm/o0X0mSkAWqry/8BurPNWDXtfQsPPqes4oDeluCS6Ye3p/Fqs1gzcIqGMpjOhSxAxi1Tl4jyQU5TuxGlUJrDsY9v/E931so3gOcp1+7inrbS/u/SaEfpt4NZsdriciVgVE1KenqL1KPj3rM7J66eP80A9vYaoIZS5E4kggTtgR7UWuybh+zqk+T67IxDX6RLQ5vn/vlg4ij0Z2HEfXU2lEMyKCb/pJTMxQhDfzF3wfCmVVzoTfnMYotYNA8Rn+XD5qB+92tLVfvSHWKbnQc5Q4zrEiqYT0w5w2jki0fBOOMbfUCZ05RXgJy6qxVMmu7DS7GSp4HZvMZwDQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(508600001)(36756003)(107886003)(52116002)(2616005)(2906002)(44832011)(38350700002)(6512007)(5660300002)(86362001)(26005)(4326008)(6506007)(66476007)(66946007)(66556008)(38100700002)(186003)(6666004)(6486002)(8676002)(83380400001)(8936002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nXjKQLWSm0HNapnZ8nYbm0r+THIDWwxYQCUs5YjhgUeKvq4YmjjLVjBNwrNT?=
 =?us-ascii?Q?qxtBwqNA8q88u5WUjxkEBO0GucS6Q22lKalVe4apXDgdf6D70xRKoiIAynBn?=
 =?us-ascii?Q?BGNDl9WOa4hqM0Y0DRzplx8+9haK2Zd3R/OvFQuFriwJlhtPt1dH8jzbQayi?=
 =?us-ascii?Q?UvT6KwtuXOUNIlDIQ0C3I3EZWVGPYoR5CkxFelkrL++ctVOZQ7scGnSeXqtZ?=
 =?us-ascii?Q?t1jJNPjxT48Y59aEvjvXAdqQ58iuytGeJD3aAn6NELJUVG19i7B9JNd9GaVo?=
 =?us-ascii?Q?7tnKLnCnMEOcmicRWZGSG6n2GXQBfJL6oM67Tv6ZTGIxq5qEcHPJY5DvjffV?=
 =?us-ascii?Q?TfSSUeywP9pQHDz+UFYtfhAef8FB1ml6VuG4D9KEx7HC0yPdIbC3fErY6fzm?=
 =?us-ascii?Q?bnN7BFYNynUW5EaXPA1PdsSeuC0zmTyzqxU5c6jbaVqRCFEuUf+PwcjGafwv?=
 =?us-ascii?Q?kzeQKMLRfakoftN8yh7sHLL/N9LFmdkmr2Yk+QJrCFWt7Mul0pYlXTtMVFWD?=
 =?us-ascii?Q?iQuF6+pv/T1+gIVu+Pn+TYGTiCNVBCpAWxi5aSGtCho60U/9LfSMVAwj4hwU?=
 =?us-ascii?Q?V5K2H9wEVZZKhCoMz/8S04HbH+XC9o2eYdF6RmwAJQqpwJYYF0hhbXAPR813?=
 =?us-ascii?Q?ah4O2sGEVWA24vEk7jq3BKRgKvhsZK+ESn5iXCxFRwCGr5BocRetZp++rUoI?=
 =?us-ascii?Q?IkcQ5DIcTTiqUzKOlW9oq63vR0jPt0Hf1lyDL6Fazu+qwo9KcGXHbA3+tVFO?=
 =?us-ascii?Q?coC8jtyf/oMQARujfTybBjeuD1Ka/+HeBgkDuHHwX19DYKi3eduhSUc2ND1n?=
 =?us-ascii?Q?86VeRYAQ1pJ8TGsfgnf/AM3/TyBmCbDnLJcfr7yiIlSmbYKxMGmck8PknXeZ?=
 =?us-ascii?Q?JFkyh/zv3p6ZMixQ/HDlGuc1R4+6wx4sAaaqmcRoPEtxgzHnBBKcSooq+Zpw?=
 =?us-ascii?Q?UlnJC7H8Lut9JsiHP8tdSK5L597elzMdaI7WatGMUdmVtPUN9ltKdhpI9oyM?=
 =?us-ascii?Q?gZcsoEjPrqyr8tgYQejVoCCPGiG7BbxHZUYIJ99QNpi1h0PbNGWyQeSxDMRg?=
 =?us-ascii?Q?VRUZzHeoAu1RPBAYzSovZn4q1/OXw83xpkKh4aydpBFiq7S9OclKEKcQ4y9v?=
 =?us-ascii?Q?9ijWovhzUuFtjMiFwfMTftZUn/dSFMGXdv/43h2EofCWJ0QpZnw2KpNWUXBU?=
 =?us-ascii?Q?mWrob95N0coVwwFrB1bGwxct60ZVF4CGSJsNBf1PCSr7TE1dEwRvmK65pfbv?=
 =?us-ascii?Q?8AtWwAgqVSpmoyY8hRtopRL3uYPNa4HfWOs/e3Y/nglGfcv0xyDa53akyIW7?=
 =?us-ascii?Q?qEjSfvBx2Q4TD3/XB4FGLM7/9OiyMYVbcidfll/fMFkJ4HDCKshXWgdgZxNw?=
 =?us-ascii?Q?6jams4/mrtltNs+2VqRVCeMV2WBwrm1mMY0wBEB2HyZ4o1+cDPVfxGCsLZzK?=
 =?us-ascii?Q?8PBhvO0lCDI3XW/bAr7oUZk7fupk+EWWBvCGQpDWYHv0RL3yL7oLhqRyhKVv?=
 =?us-ascii?Q?bJvmcJGR9XVvOx9Vboxvb0k6estyD4SAL58Kbj/ZQsrU82APN6hCUyx7XHMu?=
 =?us-ascii?Q?opdDSgkgj0KhaS4hTQxt1l4xPIqwaOX2Et//WyY6c7qz/ssoOr/sCjVkgKrR?=
 =?us-ascii?Q?6Q9ZT2boG8yNDiJ4KE0HTfI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 25138c9a-b704-4685-408e-08d9d55e55f1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 23:58:59.7339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 O1UUw4i5U60t1hF51jJfk4l84Sfs/C83+NDgZfWJNOzJ+4Em6GxZ/9//5lQ2oTmKDj9ahdSTrPJBXCkzsNq02g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1280
X-Proofpoint-ORIG-GUID: r9ihfhPsXMh2JGveBkle3kPVEOOA72Bv
X-Proofpoint-GUID: pIT-JpHqFBhxIgUPW3vzRAdkhtg5B_wP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=858 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201110124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 23:59:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160473

Since the kernel source is stored in work-shared, we need to add it
to the search path so the kernel and kernel-modules source code can
be found correctly.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/create-spdx.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 0a4db80aba5..e1ff2bbb787 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -254,6 +254,7 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
         Path(d.getVar('PKGD')),
         Path(d.getVar('STAGING_DIR_TARGET')),
         Path(d.getVar('STAGING_DIR_NATIVE')),
+        Path(d.getVar('STAGING_KERNEL_DIR')),
     ]
 
     pkg_data = oe.packagedata.read_subpkgdata_extended(package, d)
@@ -275,7 +276,10 @@ def add_package_sources_from_debug(d, package_doc, spdx_package, package, packag
         for debugsrc in file_data["debugsrc"]:
             ref_id = "NOASSERTION"
             for search in debug_search_paths:
-                debugsrc_path = search / debugsrc.lstrip("/")
+                if debugsrc.startswith("/usr/src/kernel"):
+                    debugsrc_path = search / debugsrc.replace('/usr/src/kernel/', '')
+                else:
+                    debugsrc_path = search / debugsrc.lstrip("/")
                 if not debugsrc_path.exists():
                     continue
 
-- 
2.31.1


