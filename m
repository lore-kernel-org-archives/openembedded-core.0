Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F82E77171
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 07:32:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5450.1733383943151117230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 23:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=20692726c5=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B56evCh024231
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Dec 2024 07:32:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437sp75rb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 07:32:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCZdlVYcjJkMpTjrR3kU7ZLeDcC3MUfTl4WnOgtMIO0c1bifTdWHWbn8Q9qUwXTWRhAa6pFaDWXEeC9UERvMB86pQzf2mHXu/tpWoBQcS8h6gOv2a5n3547DY5PHatpzkYvHkZgTOhV6+xFzVlzY4B8RUZciVQqAcC2Vx7QqOw1rnYO6S2MolHQnJGQeaYvbOovx53foMyOOoMXuJ1M8R7NTpCkqB60UHQZplbvlICX2iiWOZiiJ/1UfsGZCxI6/PrcvGLJCz1m/hJnoc+Gqia/AMZt1dX5hzFd2cNtj2vX/BVjcMa44U8bkk/lXfZtcDqmYSZSLeosCETL9I7QPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdlFhirGEiLXd6SvlVNGM5r6iAPNQFdRBuYP1SaVpbE=;
 b=SW6WVEJkqY2nxED5bAUuAiIhDDK1ul8ZVX2FIR8HH52xNgEn1sVdZHteLbHBxTNKz7apy9mE4Wo/YxkedVNBqJpF/rfAb8rI6gc8z8NhmMlyCGWYb46zY6gzEsjJ9xg/4+ElcrTkh/dRzKFsRQjp2094Xq5OctUU1F1TfzLgNERXMUElOT1FrSu/dWdz6kgLMfplOX+EJ1Ip01wn7BeolOLjHPIIwfIcZoFUY+hMn+PUUux4uGedZ7o+ak8K548K61yhqES0YbML/S5Bv7fs7WIQmki1LqsJQAJ/5QmkAa2v3Ankkqgh286aHfqCwqCxz6kbUkpFJFKaLW2NckVWdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB5230.namprd11.prod.outlook.com (2603:10b6:5:39a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 07:32:19 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 07:32:18 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] toolchain-shar-relocate.sh: fix the replacing commands
Date: Wed,  4 Dec 2024 23:32:06 -0800
Message-Id: <20241205073206.361519-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0011.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM4PR11MB5230:EE_
X-MS-Office365-Filtering-Correlation-Id: 283754f3-96ae-4f31-b498-08dd14fef2b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?983iWxUAONd8f6PcCLPNMB6Fx8awIIcnbmj/cMaRL+GyFPO6Rd1tm+2GLYv6?=
 =?us-ascii?Q?6ek8vFMgjHCoB7ACjSqkZ6odFw3DtobL2gRoDa4hGIAcBpR5r209R/t7ZVIS?=
 =?us-ascii?Q?McupynnudMQI+dp1Z7GNq/KjX7xAZ6UID2dDjMhdbEPwwE9s8ksCN2HOf8H2?=
 =?us-ascii?Q?t49857tYFKbOCdVct4wHyQHKqUwusNSumwleWfxTJAbJx6E5KVZp9arVAFld?=
 =?us-ascii?Q?ShK23BjNwuyvfKbl9txYDF+Xd137urKgNO+TBEIpELn3KlL0TR4veTwYPcwv?=
 =?us-ascii?Q?E/iQB9ufnjxU67MbZPpDDnjrWOAPDVwx5FaTlWfkGR2FJodQLjPoypj7ilHd?=
 =?us-ascii?Q?IXhPncpe/yrlUcijQo0MBJCxHsleB75GxsP2KBdbRGFlIecyxGgGmG/uK1Lr?=
 =?us-ascii?Q?I6fr/29IiXkZfRiJ6Dii346fka3Wj5jfjuqzPlnJQb2yoPscYRP+273jphsH?=
 =?us-ascii?Q?UajvPa9nSjgivVg/HgTiwoeYTwnq+0u36wf9b/VAK6Vafgrpjva0NyYMtO2H?=
 =?us-ascii?Q?3T9eKdO8oQiRuLFrR0mB6QkZ0e/A6oUpvilIDJM4HQhF495kyLf1Aa+D0tza?=
 =?us-ascii?Q?JX3pVFJQG4L09IPYD3Z6ZUKwLPs7gSZxHC6Etnf4R5kpu8ymlA8cfVu/DyNf?=
 =?us-ascii?Q?h5gH2SdCYOD6m8MU22YNdfbVlu/+/fVD5L7X8/q0Yi300RNLJAPBi4aZrNd5?=
 =?us-ascii?Q?fHYDs/MKydA5cZIPBKqH7P1OrVArULuKHapbt4fMMpCyD4oExCP6f/4p787L?=
 =?us-ascii?Q?sOysdWyXAccA2CKux4GZJHiwU+sd3iHij9UC+dSfNSKS0h34z84OF72UKO8Z?=
 =?us-ascii?Q?p/vy8DFv70RCo2pBzxwUx9RHahu8+UdFTIFAtFGGK826Ej0TiQMB+Rt17pPN?=
 =?us-ascii?Q?EXHrr/ZnohkE1Ia3vGOjuEPd0E0rUh8dghxQghKNefJPPC5q8+kMfb+W/JVt?=
 =?us-ascii?Q?fuMeZF3lUhezBA4eLf8fToRaMoMpZjj60VmrdKuQPd2lENMGl8FkFXjwy+03?=
 =?us-ascii?Q?f7MixR3RvUfzZCBqN+fBhrGT3tM0gJmYtIgEiykCMSdhw83AfGQ5qk0/va5a?=
 =?us-ascii?Q?L7huHUZ9ZE9O81mp+d+E9rJsH3g2pOndO5a9ZZOybAmRWZibDK85og9UlnC3?=
 =?us-ascii?Q?DnVr4Zr2NCYyFdbiOKv86s6HrHabxmia+m00U/LJCG2v2MI59M82TR1yR+GJ?=
 =?us-ascii?Q?DtrgN+0H+AZ9AV7uU407+lCQOlPHLnHnI8C0JbvLj4cRGppNVtjaOh9ZjSTi?=
 =?us-ascii?Q?L8H9+T/FmHHLMstd5FGFWyMvM5f7x5vy98ba4RRyh0eqAl7kQA+xqNITTYsw?=
 =?us-ascii?Q?7jqwqYbhg2JBmg8dQ8uSnlqCyPAsT/QmKsBV5/6KowQbul16umRdl73tp5m2?=
 =?us-ascii?Q?iHJmon0LYbkZSSL1vR5NLC1jhjljUMdaFX/TMnUhqNOUoaOezA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n/7UTOBuNOUc2sd0wohySFzrdnXph2xc78xOMjh43QvsNHVaiDqEcErHpnyO?=
 =?us-ascii?Q?Hx2BYeBRVhfBmgqAxybX4UkcAGqIxzz685OUJTfvMsb91Uj9oGSMkrXYWL2q?=
 =?us-ascii?Q?NQS9F1JueV5UVLgL0FZHbcT+WI2ExrFqy9YBc4IMZK5EE3EGBlYs50im12bW?=
 =?us-ascii?Q?/psj9j9txcZoprb3GO8wWE804W5lQAT+1rQoKNN9WQOGaACxUT1jq30YQa50?=
 =?us-ascii?Q?ELhhDTK3F6UfRgrVLOndsnK7WYW4qLd8as68SbnA7WzxdNnea+K8AQAO7Gkk?=
 =?us-ascii?Q?HwD+6XVEUx+XXiDsT2PhlOTEW+K98Hkn0cSlwXLrkvD+H55hKfaxUXSVPl+b?=
 =?us-ascii?Q?vFRk5ElIbc5UDbuNxqloxN/2WttG0wz4RS/6ImIowi5LqAhXizaERI95u6q0?=
 =?us-ascii?Q?Wqzh7hgcWZa7nVRy/9BuCUQlIXW0AQWkE4Km+b+fcmfEGcdqSEVB8xbmIRu3?=
 =?us-ascii?Q?wSHpeiyb40XWiK+CLKJx+2r05wdM9NExrkw2PmdLOavXXTC0grHIV1UWDkG7?=
 =?us-ascii?Q?Cnfw9jp8+q1qBr9EZZ1NpPiJ3JZsMUS5/9c9u3D6zUZLgFu2vuY/mUd0N48x?=
 =?us-ascii?Q?JUNvzhfoH/ri2eGZ3e1DIjB5mSGXMc5UD1oQL4D9QHeR40yEPPAyNcdil6fW?=
 =?us-ascii?Q?UQjCE9WGBHHZRr/0a3UoLp0bne6kBjCcsjGKA1uO7K8Aw15+MctOmLD7QG7l?=
 =?us-ascii?Q?btBrrFenFPUaIbMYRS8Ij8j9whLW7yHN+iHvrzPFvEZIYUr7zPv07P26bKOr?=
 =?us-ascii?Q?07wO1uvfL9cbKBNJ6J3v6KB9ruKnNuA0CkpAi8MwZ4hwezMR25HKdYjdHeIz?=
 =?us-ascii?Q?AruPiU9tN/hSg9VLj5YEUVUd90Em8d1cJej6Mw6LdLEfxfJ//K/BeE4oeupg?=
 =?us-ascii?Q?Sj47MCdM+70EI45KPCWKg7yfOBm82eWQXKPd8dsvW59hk2h0e+uTS7F80e41?=
 =?us-ascii?Q?CVWTpUaPGT1E+z7JGMWi6AxEzeMlM/f1LH5V5qumj7Q3K728TwjPuK6GLyH+?=
 =?us-ascii?Q?3gobEbrlzuS1Umg0n3o1/v9Q7ANdCr5W08V2uaCZTcNjKujg1+kVaqIXWYor?=
 =?us-ascii?Q?v0xZojXYN/LBM+53kwsFGWIjjePQkKjQc3l+CtjYgrYc5h95Vvq9Tv0dDZuo?=
 =?us-ascii?Q?7WMa77siVIyNJrJ4KjRepPzkD7OuBOY8fj57x/KfsFoTi6eZLnBADLoubrUJ?=
 =?us-ascii?Q?kXev0FbSEeLIyPUbjk8whBILfmQoKj9VXSY7pmnu/wBHU82SPvkk9/yd5eyW?=
 =?us-ascii?Q?waeoRXYenIe5aR8iXHvuH7EgP7ByCJy7lVbLOVNH000szZntP2LGo2DHqgTE?=
 =?us-ascii?Q?1pJMYawm+Q3WDIuHJflm3dYozK6ckh5Tu0zc6rsNcLBVeNgWlZngueFcz+kb?=
 =?us-ascii?Q?6BAIlmvrM6wOjIje7V3flCoF6W1fiw6KylzW+FBiPM8H8p5Ga1bCx9yjgrb9?=
 =?us-ascii?Q?eiXGjH9VX6BvKiTU3vwq25n6qnag5+JIzPHYI126I0tTqYzlzmORjkBAH+7J?=
 =?us-ascii?Q?2xlxfRhA9BrERI36mTCim0E7VRqseAGSzE0tsAefD9Tk3jOEmEdPYfxysiA3?=
 =?us-ascii?Q?3+OgdwTNtBiOucEmJ4tCIJUFrDdE2kCznpdguMxwZtaLck8qkSiMErY4SVAh?=
 =?us-ascii?Q?Lg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 283754f3-96ae-4f31-b498-08dd14fef2b2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 07:32:18.4251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6N3IFUBH6jGVwhN/Xdzh8OZhWgKOdjANtTSgU5XKgyQha4P4e0KV2kRrFuoM0HS4B10MOu62/VYTk9q7oLVAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5230
X-Authority-Analysis: v=2.4 cv=Qvqk3Uyd c=1 sm=1 tr=0 ts=67515706 cx=c_pps a=ybfeQeV9t1qutTZukg5VSg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=MJ8bsT3HE1sy4XJBgnwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: L8S7bPvPnxo5GeRHw987hfNTaneoeVZA
X-Proofpoint-GUID: L8S7bPvPnxo5GeRHw987hfNTaneoeVZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_04,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412050055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 07:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208364

From: Chen Qi <Qi.Chen@windriver.com>

There're two cases that the current replacing commands cannot handle well:
1. Files with whitespace in their names
2. Installation path with keyword such as 'script'

This results in installation failure of a buildtools. We can use the following
commands to reproduce the problem.
1. bitbake buildtools-tarball
2. ./tmp/deploy/sdk/x86_64-buildtools-nativesdk-standalone-5.1.sh -d dir-with-keyword-script -y

The error message is like below:

  Setting it up...sed: can't read /PATH/TO/dir-with-keyword-script/sysroots/x86_64-wrlinuxsdk-linux
    /usr/lib/python3.13/site-packages/setuptools/_vendor/jaraco/text/Lorem: No such file or directory
  Failed to replace perl. Relocate script failed. Abort!

The actual file name is /PATH/TO/dir-with-keyword-script/sysroots/x86_64-pokysdk-linux/usr/lib/python3.13
/site-packages/setuptools/_vendor/jaraco/text/Lorem ipsum.txt

Note that the file path matches "script.*text". In fact, if we install the SDK into
some directory containing both 'script' and 'text', all files will be matched. This
is not expected.

This patch fixes the replacing commands by doing the following two things:
1. Use '\n' as the field separator for xargs so that files with white spaces are not splitted.
2. Use awk to match the second filed of the file command's output so that the file
   path does not mess up with the matching process.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/files/toolchain-shar-relocate.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index b017714df0..69ea063c8c 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -57,8 +57,8 @@ fi
 # replace the host perl with SDK perl.
 for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
 	$SUDO_EXEC find $replace -type f
-done | xargs -n100 file | grep ":.*\(ASCII\|script\|source\).*text" | \
-    awk -F': ' '{printf "\"%s\"\n", $1}' | \
+done | xargs -d '\n' -n100 file | \
+    awk -F': ' '{if (match($2, ".*(ASCII|script|source).*text")) {printf "\"%s\"\n", $1}}' | \
     grep -Fv -e "$target_sdk_dir/environment-setup-" \
              -e "$target_sdk_dir/relocate_sdk" \
              -e "$target_sdk_dir/post-relocate-setup" \
-- 
2.25.1


