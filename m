Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228C2EB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 07:41:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2805.1687160493813298414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 00:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=q75XPCwG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55343858d1=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J6TfgR003709
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=09Vv7ytYZA7AQcASo/+9tPwBvDQfoXknE+GlahWZ1NQ=;
 b=q75XPCwGXbIdH6tMQFSOn8uTRSYZvlKxv7UqU4csRzK4GrKM7Y3zM03hj3uk6ruzcYOT
 pY1fNdHDVvnJnNuUIAK8mSbGmStxWpVi3a5Yp1xWI0jHSyX75nk2wNpf3s8G3tfsxVal
 QNeb3vqmE4fvv7HDBBwmKg+HWA0tKDwPlyz/Zgu/1IB2joIp8aKdpRusT6Q9tZesrl54
 mRQJoNiqkXk7p8nvR9pNvLO3FaaD5qXuCQ3a+ShbJPeyohIrtp/xDAhWbXq6CRKJoBjC
 Cj0UGmzGLMLinDU7FUAxAETRFV0HX21Wkio7PIjt/Rq1TPQYJ1POW6Fq/N6VmFtSnKHB LQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r9220he5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:41:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpHOOhRw4bhk2SRzHGFYPyxch1AHL0yeufiZ07VUY72EVuTWgzjz2tbyjmWNzWCGqiGEHRtKCAPT8zC3d4uBYGKpc7LePvaNe6kYMvaHhUEbjUx7uSjSJroZ5XItGtwKCEvaeuiku6qNzwbzm9RWcpfdvDIDae9vgySOUinALtnESZyvNoNciHm9R6fxuhrKVxd21gdVRawpIpWQYUTb/riuPv5FKhrlM4moHUT7nvBluGPtv9VPtozEH9BKd9ia8wjtqHQ8vj1wFWS1pwQNXFxbcx/VbQKI/ef/3oRIdsihDo0S9KVq30uHhRziIV4o0+V1c/twZJY+2P1l3DuK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09Vv7ytYZA7AQcASo/+9tPwBvDQfoXknE+GlahWZ1NQ=;
 b=h8f+0lB8z+Nwl1ZDZX1blYY6yFW4nYjS7Gfhzp0cup90C/qgysOokp7QkKosT+AoyufNGG9+OUK3Hlg4Fbyuk2OzYN7S+h1MA9Xzr9q9L0dUQYbfJarpUihWATgz6DUcv8EYzIpaaUG9/lSYKbQYj9612YNK1DBJhWKOYnXXXmgPmntiQRDPUk3oSvc2S7JAncz+r2EVRthV2W5o/NpHNj62FQtHkgTrCPWLIJyK6lyFa8SRtScLOtHC1ibaE97rqSxk+q1UqtTAL2ax0i2l3VzXZR8RqDSR8HnfNHUrDWUeVN60Z2fj+Kvw8TjnuxzASZ1K4VfVJUyJh4proM4RQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB5825.namprd11.prod.outlook.com (2603:10b6:806:234::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 19 Jun
 2023 07:41:22 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 07:41:22 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/3] sdk.py: fix moving dnf contents
Date: Mon, 19 Jun 2023 00:41:09 -0700
Message-Id: <20230619074110.2831977-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230619074110.2831977-1-Qi.Chen@windriver.com>
References: <20230619074110.2831977-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e261e1-fc5e-4353-6319-08db70989328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cS3koxMuwIzzImv5sXWAUaDRVqwDzN60w9UtHYN3oVXl/DgVSZm/QRRwcgywZtK/uSeqqFNGvocuQRdB3Zn09kVqxOEsEwzCVGmfjl+AyyOVGUwEDXRv/vb+2NQHbLyfCiORfPNf2qfYzm02Jk0tOYm1rliIgs9oTSi9ui9WelSu2y6CtXWvRedpGzHC0I0u90aosm5o3DFTiPDrJr5WspqNz8VdNgoHElUoHAGH7d0RJHDgwxuddpYvhCebZwLnnplGzxUxsBNb6cVWccUjT4OpXOtdpGYfuaKAQoWgUFSIl1aRa3Zk1GfMulMVfv5o/Y8IeuNi+SNK/V1ofhYXjOVXy9GW1e3/xqSEEpsMQQ35tyShViuHgTN6lNg60cgnudJAG+ge2+lAQCAVEuHO+ShFWtySGVmuVrSPlkyuEHFF00WEPLVMwmaBxCDBBu88pbiahS9/o8qPPcsBtIIWL8Wmpfp2amq1Q4vvGQFcQ7QAnUZChdUVvbGPQFJTZ5oGJxLxmTAGrT5rUSUalnzFtiG3P3/2lfqZh6RCEsExmMFYaT9hqJsEYtRqm8VwXk7+GpeRLrAE7LzANbZTbOhBAPKJZbT5nVad2sCFFU+J6JRk4PrEqpxnthx4o7OnHXYHL11VrWFZDbMMYJ8F0weMcA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39840400004)(366004)(376002)(346002)(136003)(451199021)(6916009)(66946007)(66556008)(36756003)(186003)(478600001)(2616005)(2906002)(66476007)(4744005)(316002)(8676002)(41300700001)(6666004)(86362001)(6486002)(6506007)(9686003)(1076003)(8936002)(83380400001)(26005)(38350700002)(38100700002)(52116002)(5660300002)(6512007)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tWgBWwGEFOI93u7K/cYNLyK0xgxu5y9Tn+cmVuf6yDcRUWW+6aQBTVs2JKxF?=
 =?us-ascii?Q?wtm635e/B4j9cC3NtROUAmQvnD0sVXiKdSiGbZBtbmUJ9tIoRnOQF16RtM7Z?=
 =?us-ascii?Q?I8JEJMlKH+vDNdT7xmr97XqfT6gRu7rlEvPuWMH+JUf6SD/EVHRGUvzVsvax?=
 =?us-ascii?Q?WLZirOUtVSSyPfIXFPCrP7Ys8uYGDZnP2bK+zKKWkzYUc2aPkVhWaMJgv5tG?=
 =?us-ascii?Q?kz/giOmDt4ahXAVRVrSJ82+NJumHloPqjUbnfIb5qiipjvspu3caVRvAQJy8?=
 =?us-ascii?Q?Xo7HjT9M3j7OhX+ftf9kQ+//nvwadXsBQauplzqD3Wm75r1Aj9SxccfdjUOE?=
 =?us-ascii?Q?NJBmeWMFTIDuLF5yXkxtbF//3EUfISabO6ENH2Kv4RWm7C9HisaFeEJ4gbrL?=
 =?us-ascii?Q?c4SxR5LqFrXAFv7lpss1fwzpj4Efg0qEV8qfAjJussxEGA8esKVSPAd7h9t6?=
 =?us-ascii?Q?mnLX3fuO3vaKM3o28eqaYNAsF+RJm64CKeIKsa6RAmnpW3mgK4eFS/AtMFI2?=
 =?us-ascii?Q?Pq5JLdBtgKZafflnKBMgp8uGCIPu+ODCxmz5EILKAr2p9OVRaImzE+yz8prK?=
 =?us-ascii?Q?xfFggWrB1wtwH6RonEZ9YYnQuGgAfN9aYS+wnLM6NeVMFFHF7AtnN8nKSJge?=
 =?us-ascii?Q?MIWhg7GTOVifoiJYQT2ZmRyVpu6MX/E/nvRR7WhV25pvBf4+iPdVfTuv/mio?=
 =?us-ascii?Q?hjsscyC6LMca8CjZcmgrcDCi29ozgw8jIldjTcLnjZgPQwVAmWvLY+cn4IB5?=
 =?us-ascii?Q?+SqeKke3ZsFR7jQVAV8qvaRcJ0kUCzS+RrTRVzoGgTJvKa97lyS4utleJu5j?=
 =?us-ascii?Q?vq3du9qOJmA703rpoafrOODdGdqRrLaWwFnvui4Ot57iDm40EfbK8idGnE+B?=
 =?us-ascii?Q?MJj71lVs3Lt87JSaUcH54zzeS3UE9cZowltynrtxGHU7mOVGKSGP1xeSasPr?=
 =?us-ascii?Q?f3l0KnayZU9hFxA8pTPhnGJLoWqlmCUA4/A7s5dR7nCQL7accwd4PJBjufS/?=
 =?us-ascii?Q?GSDgduV8yKPk4I0IiFR77kmsBZ6kddWgxkqDi2qxdy2Mj4E7H62e1kCDJc1y?=
 =?us-ascii?Q?MfWWBgZrcWBtW8oRR1XJcOkrEq6iyOTkA13wOdlDjUDcJ/b/nfKJ8Eb1eEgT?=
 =?us-ascii?Q?5bjrkKU5i32zTgSLx8NO5NM/jzFGHu5SjKKuo+M1XrtUQYNMBvLg0BJSVTAZ?=
 =?us-ascii?Q?H8Bg8dJvsF6f/kVQBl2R5yq7cGd2E+6fHBz9DU5veM/JFwW3P/xdn8riEnm7?=
 =?us-ascii?Q?zQ5WNnPQxARi5pyUHEVJ2nWoKKyDqL5NiI6DMzM0m+xBJ3GDoFPPOF7LhDVq?=
 =?us-ascii?Q?6yMkSOOuJ04OLOPrh1z6PkEhpl+9tcN6YIAA9tx2MOqzpIzZ1lNCGpiRUjg1?=
 =?us-ascii?Q?rM84tO2poekj9WOPoQa4ENlRg/0b15IXssSElZbLPKIhP3bSx4lT3nTpsIxk?=
 =?us-ascii?Q?OvnSNCCik0Ta+9PaVhTthKhWWtfIhzGszVVwY8LtukteajWSUebFUAnMeODr?=
 =?us-ascii?Q?k+qIv7wwXPYXgBAM7H+iKv6bGQj+HV3S7VZNv7SljPovFTT9VE3W9QMdNK+a?=
 =?us-ascii?Q?bSOLI8R+AmZYRPjAZEF8DQFOUPs9YKBgsHIPFzC/LLKjLFSK6Dd4XBWDcmc2?=
 =?us-ascii?Q?Qw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e261e1-fc5e-4353-6319-08db70989328
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 07:41:21.0870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kECRy0YsFY+mEsFp1LrGRrXb3XoWF/MaeiAs8tgZWAKVJmdG9JpCnmVNwRMhH1MpSn0MYC+WDymSMLkgU+UuTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5825
X-Proofpoint-GUID: a8CmEZavN0MxDQjNjPnRMV_rfWbpj64b
X-Proofpoint-ORIG-GUID: a8CmEZavN0MxDQjNjPnRMV_rfWbpj64b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_05,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=771 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183093

From: Chen Qi <Qi.Chen@windriver.com>

The dnf contents should be moved to <host_sysroot>/etc/dnf/xxx
instead of just <host_sysroot>/etc.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/package_manager/rpm/sdk.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/rpm/sdk.py b/meta/lib/oe/package_manager/rpm/sdk.py
index 0726a18b91..85df6e949c 100644
--- a/meta/lib/oe/package_manager/rpm/sdk.py
+++ b/meta/lib/oe/package_manager/rpm/sdk.py
@@ -112,5 +112,6 @@ class PkgSdk(Sdk):
         for f in glob.glob(os.path.join(self.sdk_output, "etc", "rpm*")):
             self.movefile(f, native_sysconf_dir)
         for f in glob.glob(os.path.join(self.sdk_output, "etc", "dnf", "*")):
-            self.movefile(f, native_sysconf_dir)
+            self.mkdirhier(native_sysconf_dir + "/dnf")
+            self.movefile(f, native_sysconf_dir + "/dnf")
         self.remove(os.path.join(self.sdk_output, "etc"), True)
-- 
2.40.0


