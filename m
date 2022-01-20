Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4419BC433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 07:09:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.8688.1642662562602884633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 23:09:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oLO0V97b;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8019647b9b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20K6qdNp004532
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 07:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=8EOfUkxzOASPEUHM014MHbZvs9N9KU/n12Xbpzy+otI=;
 b=oLO0V97buN1HNp7X80F7ENKQejPY2N2fIsY0beZsf0UjoFYXCSr/72cdhpLqrjk+xi1c
 WrjbCVLzQ/bm6FwXEwRCSBXPIrwd8dY6BU3OleMBHtiXr5KXOQJ6oolokeEgSiLERoDc
 xRRudZb7/GtCPtqxVNJfwQPcMKqS+hTwnlN6lCFqtLoaG2pA7LM5YM4VmbA71poxC767
 ePGdNhKdTy0cmplO8Erj02YdIOYaw3UIY7ewE4sqEHi/ZM3gyw4QmoQxlm1xr4mszXJg
 XuixwLnb+4I3qhFOZnz+jpShc9WMZ2fpawHxY+lFVji2IPBlcVH+W6Tq2H1ZqHvFkCj0 /w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dpsfk89qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:09:21 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20K79KH7008968
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 07:09:21 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dpsfk89qa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jan 2022 07:09:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQknCMje1FRWlNhAexAz4vEuQ+c0TaJg0BgLfMUm7ewUhIicwRLMx4/OPF0PssbJU9qytW0aJu1lxsFJqCsdAnvjlO823EVFVZPC0UhK5ilKSc7+uJpygdm/OT51cHizwcvMHnWJVrEr0qDLfwJZQFvoDBtFGyTCeMXg28BUpRZwRGgfhVx7ZSwerN5uWSx/aTUgXlgCr1uZDcnq7o4K+jbvC80IDOYnzx1+a60Nn/uD7H4VdswOE/7B46sySGDH4uE+INxlfhg4uya+k+tAe0CKm2jfV6fbbypf7RKAuNc1PFeT/fvuqnVHfCE51/NRl5rT74R2QAcIPQYNOC7jGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EOfUkxzOASPEUHM014MHbZvs9N9KU/n12Xbpzy+otI=;
 b=RDYsb57ECCFEt5pP2odguDDVtXCeR/TGjgcFelpTyj+QvLstFLeDltlWUCF8arYxno8l/Uh4BXK/C7xvLbQxPBIVvsLuAcEFSjfo0LHE/oGO1fTEH6f65Qg56wbsn0hi5LjWf/+U0Uip21TA1TDpur5nI20qx3wFoOevcx1/YfpDusrdTAMD1j0GNea0fj3DDUbhWdk4uozBCwWvN2m4tbSBjJ+TFo5F/fjm/0oSGdZQ+ZmfCv69wUQckOxxOz/biTClUJWUwQFkoLJiPEVO417maOksWw4/UBL9bx+XbQ39OeQq/Ch0O5Un52CE2JPn3uvu6nwUndO2coeNx1cOog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 07:09:19 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5cb5:e426:2e48:17ed]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5cb5:e426:2e48:17ed%5]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 07:09:19 +0000
From: Robert Yang <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: jupiter.hce@gmail.com
Subject: [PATCH 1/1] bitbake.conf: Add BB_TASK_NETWORK to enable task network
 globally
Date: Wed, 19 Jan 2022 23:09:08 -0800
Message-Id: 
 <bb3ae8dbd929eac83394be5fe3284dd79c895e44.1642662353.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1642662353.git.liezhi.yang@windriver.com>
References: <cover.1642662353.git.liezhi.yang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::14) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96b9b67a-810d-410c-d560-08d9dbe3c6d6
X-MS-TrafficTypeDiagnostic: CH0PR11MB5428:EE_
X-Microsoft-Antispam-PRVS: 
	<CH0PR11MB5428DC7FC22EE3C9E3F64E04FF5A9@CH0PR11MB5428.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uHbsLp+K7Ncbj/+7D3ysAtOzalXQrdK+PgCGLsUuSTMjk1jtJYKaeSmaIt9ptnhOsdfXfWHT9GAeZfCbAdiqdV/nSgxAxuq900G+EhGD2ovH79O4EvB4rXAYQiUc7GEU3aYA1f8NoGjy3Q+CI3GEM+8QbHoqC6J/yBfSmTrjIBh1g9T7U5mih/UMwhCvw1tqEqfBMUg7/j4E2YZC6vmQqwFsCtu43YzzIE31/V48+nEpgXBgG/y2o9sqaUOiaRHGmlO+jjOaCx58tYlYXWRG3v8RwVvlQoSaHLtlklOqQUrWNqNP8cG0R55YjxhYNoldoC4k5J9ulWaI6ax9fOXQ44HH+qXSSOyz/za/eyhkhACx09HJwmC2aqJDE724M0wUkQhwiGNiK9QPWFGAcKE7+9r5B+dhMWV+O2ikMTJE6b3H2Ud/4WmUVZ1NwfXVT0r1trsiS2swzOqx8hXELqc7gl0kbB1+OGcBL0xXHaTP2EtOf3esz9acW41LcPMzC4RGIwl1Pu+7aMIhTNatMnLYIj3/QDG5we4dv7htKZE24Vx+vTFW5/s+AR1o1LLktAQOMW1ZW/clqLVXgHM/9h55ix3zsHqoSnK12kM3EvkT0c3IZLuxHsy7HAOXEh9NpuTuyxMWfGiXl9M+aJONw5dmQ6ZKjOJv3UcxoZovCKZFWAuSnVNfE2xbQpM4vWWZMf8Lrjv0+Y1h0+cY6ioWY+PHSQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(316002)(6506007)(83380400001)(38100700002)(6916009)(36756003)(26005)(2616005)(186003)(52116002)(86362001)(6486002)(4326008)(38350700002)(66476007)(66946007)(6666004)(8936002)(508600001)(66556008)(6512007)(2906002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fjaUa8Qj1QsIf/ZvotG7p7YUbo8hk8XKt2xzjo4TQPkNleGZD4LZ+Ga4p9z6?=
 =?us-ascii?Q?N8eYXrxIQPfbfGSYaltSlbTEw95xrJIuYdF3tbPimCtBlGllZwAe67sauAhF?=
 =?us-ascii?Q?AVNpbiecMOrtdcQIAk+UeVM5WGE6T0YL4hDb4Vv5CnGIwfyHM5QDzrV21BEv?=
 =?us-ascii?Q?7Y0PeNt/MNBjfMgkdhgcj0UU0mvA90s7p55cR+uPJxqkgtlFmoQ5j1CKwfcd?=
 =?us-ascii?Q?vBUPZxHDNUyjI0xLy6BPzCu1NmldSGEoLA6kN+/b/XREYV9Tkc1QOyMhe1qk?=
 =?us-ascii?Q?QBAXkLdxM1SI/kkpQqCaQAHuHCUBYt6nrRrRcqdL263NQHZ/vqOO7xFfyw/r?=
 =?us-ascii?Q?u36aeKg5z2zFr6ZlUL3Zq5+KOn2Yt1EBHW53apsQPIIWVK2yRk419bY/TPu3?=
 =?us-ascii?Q?VE2UUbBxhO5gcYRu+O9+wFUYDY1WluQEtefpF7e8nGRYbnAZvuu1tDRWxiyw?=
 =?us-ascii?Q?xSQCDznnSG1KYqrBCTL68rWgkoEWoCFhZAsco3dfAbM2TZMOlTrYskm897/j?=
 =?us-ascii?Q?DPA9YX0ZR/bJWLsx928COYU1fsiyhbuysawd7L00tQdB6BB9vnOEUDxfxrwx?=
 =?us-ascii?Q?K8q+7Ik1kK4IFUUm833rfYW2VYgGMHxWQVoli6x5FDOV5GEK9JRIhsKNcB17?=
 =?us-ascii?Q?zYmM5luGuQpXNp7PkIgYKvl3nkhxz6ZmPLJnhkZL2AU6nzovNrIABn1GpKjB?=
 =?us-ascii?Q?91wXy8dRr6TcfrchzMwtWBBqzQxaM/1INLu7KooKyxLYTjsNSbskkYN8x+QN?=
 =?us-ascii?Q?lqMZSQM8lJtumEGRx6hvVV7CvtiMXdh3JFyUelJG0dBMqh52UUa0Z+J4FtA9?=
 =?us-ascii?Q?pYmzUNYHT9Xq3heO9vk3eiu5jauRhBgVN7XlzheeNwnFD2U3TkU8JrR7evXE?=
 =?us-ascii?Q?q+VcGZPZAu888VoL8RiLvC3i3gbwHcUrQnnRxfr6hDA0TCx+/wqxOVyt62m/?=
 =?us-ascii?Q?1K7ND59ACb/byBPi1MAeJFXYjkI5dEgXV2bqAjQtamuenisYBGB9OUaOaait?=
 =?us-ascii?Q?yJht/vc5n9x4IVIM4VUUeGkkauCMcXZd78is0mlgowHD2Bx/0n1lb7V57XH+?=
 =?us-ascii?Q?f4HwZTE5aErCBlExMi4KJ9MjVNs2E4r3Xutys36/7bmtPtWMvSP4A6SrgUSp?=
 =?us-ascii?Q?8oBZhl5sukceyIRFzpcvdMg+R2MYKC0cA0xhgkJ+PBy58YYFhjQSgAQTEivp?=
 =?us-ascii?Q?9zfaifvcpHdIJLUFXtwvIBzXllMIFImBlm3WfJRCqDHvkQXP5tKUSG1fO5VS?=
 =?us-ascii?Q?/7Hp/e0ffWoClHUQNbc3dAShk8eLozx3u0+rAJpbcojY02cBXKq9LdLfAs4G?=
 =?us-ascii?Q?rdH8PRUxrwz6ER1hA3bcerfGzi5tJrmLRGE92U+ocCU8NkfY9X00fnUrMQwk?=
 =?us-ascii?Q?KXNfwgIzcjJUriMKem8P3yfcS5POZR+MFNpt+kXGiXHO/v+AlnsO6aeLlH6j?=
 =?us-ascii?Q?3vYkkQzBnTLQ+KgJfTzKNYf0UdJxFiFnxhYfmbVvaTpKLuXHJPPJChGBVAIW?=
 =?us-ascii?Q?ZxmxQUy0p0vj0RzkBYmcJFqIrSTX2XmYXUisXjeBWuOuw4Q3JEydrY+RAkyg?=
 =?us-ascii?Q?AnoifHaDW0b/gLTSGmBVpzqBEJMfk0GFjzUA+Vkeuvr2EAGjUd5K/w6Uo5ch?=
 =?us-ascii?Q?hcFKl5UVdS5zR4V2SGIY7sGpfYAX9XpCD1gLv4OYOHLTyZ8QGGzdiNtzhm3j?=
 =?us-ascii?Q?6VARlHHw0PVyTEwaXPGV5CxCiak=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 96b9b67a-810d-410c-d560-08d9dbe3c6d6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 07:09:19.0600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SPdSpo5P3dns/GrzLBYUZti1tYJDxZQXxF0e3Kb0PjIQPQQKroeVYgxSMgs5Znd7RzSpIyar19Z6p8UWUtpF4tUuvvUYSKWEvKXuRgOIjjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5428
X-Proofpoint-GUID: 9BlHPKw9vtEzv1OSqNUK8A7LyZ56OIzk
X-Proofpoint-ORIG-GUID: dz9_Ys_2JRkXSC_6UTetXFHzpYzkzIxQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_02,2022-01-19_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=809
 spamscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 07:09:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160752

The NIS or icecc can't work when task network is dissable, add BB_TASK_NETWORK
to enable network globally for such exceptions.

Note, enable nscd on the build machine might be a solution, but that isn't
reliable since it depends on whether the network function has been cached or
not.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/icecc.bbclass |  2 ++
 meta/conf/bitbake.conf     |  3 +++
 meta/lib/oe/utils.py       | 15 +++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 794e9930ad9..c39c86458a4 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -41,6 +41,8 @@ ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
 
 HOSTTOOLS_NONFATAL += "icecc patchelf"
 
+BB_TASK_NETWORK ? = "1"
+
 # This version can be incremented when changes are made to the environment that
 # invalidate the version on the compile nodes. Changing it will cause a new
 # environment to be created.
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fba99e8f0cd..bf5bcd55519 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -946,3 +946,6 @@ MULTILIB_VARIANTS ??= ""
 # what it would be anyway if the signature generator (e.g. OEEquivHash) doesn't
 # support unihashes.
 BB_UNIHASH ?= "${BB_TASKHASH}"
+
+# Enable task network for remote user such as NIS.
+BB_TASK_NETWORK ??= "${@['1', '0'][oe.utils.is_local_uid()]}"
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 136650e6f74..c21f034aafc 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -595,3 +595,18 @@ def directory_size(root, blocksize=4096):
         total += sum(roundup(getsize(os.path.join(root, name))) for name in files)
         total += roundup(getsize(root))
     return total
+
+def is_local_uid(uid=''):
+    """
+    Check whether uid is a local one or not.
+    Can't use pwd module since it gets all UIDs, not local ones only.
+    """
+    if not uid:
+        uid = os.getuid()
+    local_uids = set()
+    with open('/etc/passwd', 'r') as f:
+        for line in f.readlines():
+            if not ':' in line:
+                continue
+            local_uids.add(line.split(':')[2])
+    return uid in local_uids
-- 
2.31.1


