Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DB7CD4F54
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 05:56:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2427.1779083779430281916
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2026 22:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mFcAnmFB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598bf1d35=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5flMg625877
	for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2026 22:56:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=PQS4ENWqP
	sVL6xNfNx7RuuiRDSQtmNYBYl3+kFy4wYE=; b=mFcAnmFBJFA6JcBAGk5RBK8tH
	yR98P6iSEx4kxgaWFdTMrB4Dwl+zdX8eoW1zLiBVvGyYrjUuAdPliEOhiLyZtEbm
	CtDx58MxzpIJUX8jsvMP8jqHcVHi7sekQCT7HNqpHpg6QySsBKxSjpTcvIzWdrwv
	fTW7pKObzmi7UMENWWdvWZw2GvYnk1+A036ODJQerEiHGf6uC6bgIXg7go/WuUoP
	sd7Z2Ocf4VLGIGnycFzTC1H3iVPSVW6ra6b/L1AibuDWhK+7cM8c720wOv7jSRNv
	iZHUH/O8M6nO5HjDo4a4djg3F6dUY1ku3iNmIJRwfpaGK8SCP8kBstG6eSI6w==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011012.outbound.protection.outlook.com [52.101.57.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux1fp0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 17 May 2026 22:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNkX79qH5UAyw7mobpEZ72MAuijZqVU5WpnjZFokMyd5cMMRHWtZW8ei4wWjpvk1Kyl90637si0xDTAfTy7fhfm6lfhWUNokbq3gqZWNlsRxXg+gQgzsVSqKt1QMCpsRkprbSuhrhTNWU26IvTlOKhKlhTw4v9dml+ATseTFn7wTB+6X0UFyMTX8ekk9U4nA2JiUU/b+KfuCqBT3ewmn3MPn4I5zHhpeQsnOAdwJoSkDnbkohivZJjNsQkIU5o5xMWvZ1QfNpQ8Lzie8Okd58jd4fcag9huVRtx6KD7ESaoKCXvF66Jx3+vOaabW9CUmQpQUaOL5R9rgZ4BCNujmww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQS4ENWqPsVL6xNfNx7RuuiRDSQtmNYBYl3+kFy4wYE=;
 b=nxHKw0L5aws6gIoY8PUtk5Yrl9pudtWAqiqxM2M+asPs6e18mukVESwyKlGy0nahXMHRC3+h1K6yimnJpS8GJ9WdF6i3aHwApeviWDoRNRG8GPZFoRuKER9dbdWFAv7gfQR04lCSKCOgjTP3M0R3G2ZK7Ljel9m/woz+zkxe2flDOyxdxlZvSFA0ItxrEnDSqqhpeC2drmTUu7oF+Js5OJf9RQLW3l702taFPz5FKelMAtJT1g6UQP/9JMlC4298FQZOvBUWgQCOed+cPv+EnudLe14S9OmIFXTr6IV/s4hJ/nOezTnG650Y++05LvQDe4CRjbshm8kvCFClUIvhSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH2PR11MB8780.namprd11.prod.outlook.com (2603:10b6:610:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 05:56:16 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 05:56:16 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V6 1/7] recipeutils: add optional stable_upgrade parameter to get_recipe_upgrade_status
Date: Mon, 18 May 2026 13:55:52 +0800
Message-Id: <20260518055558.3982813-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0186.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH2PR11MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 31662c27-98ee-403a-289b-08deb4a22cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|18002099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	/Go9qdcNXS50r+yxePOFpgjFTl1S4wyLTq0GQRMeiWnosk321JmGfAYhdRVG2VadGajg0aywTmsd0Ivq61q1w3A4a1YKSPxU6SCPV8w6jq966A7EDxkTeIafUv0bducPW7RiQrvdZx7VxZ1TiziDZT6Y8MgHT+0qT3+XHUZScHPRu2CAbDMaXZQ2EMGQSDkLvH+MjMvrylVhVUQx7HzlBBmNVwioxpSUYnAzkY5egVmoBEkg3FmJasrLk/lSL3uJxk/g+JjOv5H35V/bNiEjE3uOOotz0M9WdnHwa+IpPne94YL+O9wIgA+LsBMiAhe1wg35E0YFg2qx7YOIXeWrLkGW0Ra8YzBt8XgJDnupWJCsByDRS8P/sYq8XTmOsfJRGUU5FI3w1ebcbC2E+ULpDtO5DQef4lCIx1OGkKrUTA8Zo/2XJGlC2s6r77o72RT78+kobfxsTRFIQUGVhvb/9FseYxwF9FNiYooeT7CNuMWnsiRugc2tcC8MLXF2FzZcg8ynNdNWbI+oXApHTXkIE5MpiiRNwcfB3/9dFwV7OWqi+hSotA3YOQM+SnPI6vpZmY5/v8DLnELx3L7JYBQ2gVCeno5L8yHPh2cEuoXFZ7T1mtukwFOse2pBC4v2hTdxYOHJmV7dOTlPkl0nGuhagb3BxZYH9abEyLoNt2BINSSyM71IoSSGqP+AHRNQATvXpqInKOuF2zwO1FXPu5UzgkNeOvo8jfgYFlPMP0cdKpJHuW219vZ9Bn17/sb11FTW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(18002099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h/mXb5lFAGHWgnfmeJihbgLjaV0JFZpahtHfBGUu5v1d4Cq/ZoK6EbD0u0JU?=
 =?us-ascii?Q?6gXy3sw9kLl2ASpuiBYSZ3lXCkwHQ8QYhbP7yt5RJ+fqDRxjNNXmTcFqp+9y?=
 =?us-ascii?Q?1QfBhtFS7a7r0tMdnnzRH5O+/Yqr+YWVcDHHJbM7fshtb+2Nihn6OVGfaIYv?=
 =?us-ascii?Q?NDsIyWjFRgV9vpeb5l2XCL2hCrMCIPdmdvDZMk+fTe9nfhuzLoCkmXWgXZ7f?=
 =?us-ascii?Q?1zOZaZ0LbTlbdc5eKXvAmT/+0aY6yf3Qc2gHgaysmDYesiHqnekddqd7UdmK?=
 =?us-ascii?Q?qlkeTvoToG3lb1UyWA1CIPCLdZ8GEE300bZOVwPDbStGzU+x41yymPCDybV2?=
 =?us-ascii?Q?R+ZrN1lYhZs7g8MT+YoSKzMG1uIUlkbvOClYOEzNODlo08f07US2I6a6dP/n?=
 =?us-ascii?Q?349UeVmPF2ogeYG7Lq+v/gU65PW5XbrdsVgzfnHjRAJaPLznNOKKgVnnnviL?=
 =?us-ascii?Q?avI7zKRHLgVNpEK0XiOEQtzWsfN9gTEfWtEE6IWEeboYmkXL9WIMRXRppkgv?=
 =?us-ascii?Q?ubusQXxWElFx5/viRIhMCABErVHTVxi1Nu+gPLKfq1gonlU3tLq0BnZ+Pu+w?=
 =?us-ascii?Q?TluaIfO1qTWMfVceAyue3ROnGSiFME+JjlF4KSq1kpYFcmEVHrtFdwlLa2qa?=
 =?us-ascii?Q?Ih87vYauHI8EYd1w1um13uP3kLkwfUl+Qk+zeqYGRdn475hE/+X4gfsHdlc6?=
 =?us-ascii?Q?lXehFMtNA3jl+4oqRnIiqPoMrnhH8vVoB3SLPYHI3456jNlGC8hhsmOIOGa3?=
 =?us-ascii?Q?veUxZG8Ft4F4vKDVbKOEoDBbf7KxijVPWFCnsQTDQofZ4yvbcRD9uMoTuHnd?=
 =?us-ascii?Q?1VdMJrAq78++zLQdtKjd3jNPOkHiZQ71dAzNBS7zOMiW9fmmdKHMj+PHPNV+?=
 =?us-ascii?Q?UE6dk5+KbRnMOuUzmLeGjFG2f3RKvt8vtnr/VKEBKjeIBOPvEv+ddfMkFphJ?=
 =?us-ascii?Q?X9mPICPs4bw/BKUrkQUmScilTo1wzZn7tsCQRq5/e84jwUgsfic6OTakOo6U?=
 =?us-ascii?Q?sunmOR8Xe4pcx476eOORpUo1X8woVP9C4Lno1NvcefYJ67CYef2loVAvSYkE?=
 =?us-ascii?Q?rtHhMbBkPLaPXvMXN2XmDXx6AxnyIUDVOPDbz7J8xmYWgeqPCxk+miA5HbgC?=
 =?us-ascii?Q?8QfKNMEkcSY6yVdOW3db9mntgOy1cTue40NStMT0MyQJcVahIfLv64Qj00xT?=
 =?us-ascii?Q?8vyRfHYxken73SnsTQ8ExMjj5SGdfCDCi2pf6vrvl37PuTcNr+Jd5hcXAGUy?=
 =?us-ascii?Q?XY085BvevxaxWbMrEHiwjwXqCnCFAI5kq9MXpQpzOtNITOb9rxjZGnzGogk4?=
 =?us-ascii?Q?wIZvpNhZPgHOwEtxm+ZLWApQ17mW8dVDfadVL4RWtA9ZbiGtrgd1+6SZyhoh?=
 =?us-ascii?Q?KqwEyQL6K8d29l6dImQ2lcC+xc9qBZAA9B9iyyCZkod9RDHGK6SxsNTpPyt5?=
 =?us-ascii?Q?nZvJgFW6Pz2I7BuveeK+5BUFLcqI5dCeBewGMuC2ABbkuTXTmKf+/hpljV8I?=
 =?us-ascii?Q?HNP8T1NeGMtkqhIRzdhceVjbiDGtIX/oFKUy3KDMvG72OZ7NDwkjN5a55Sfg?=
 =?us-ascii?Q?k4pKSMN14OguDHvjX3pbiqlNLzwf4ZMFedhzHXUASvD2B4iloeQtR3BgX4un?=
 =?us-ascii?Q?91iYv4hgkh2ZpSLgnmMPVZMVB0fWZVrTayeN7PFnD+XfIioiKma2mUKiMwRL?=
 =?us-ascii?Q?7G2TKcEZi2jyyL9opXwUONxebW5LBj2/GZlJnWupjYRSKtj+10vyb9V5/NlB?=
 =?us-ascii?Q?KRSUd4K2Rg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	NWmRglX4er4XI1NoMmnD2W4YH+4YYiHQ6JoczQeaSZZvzaQmHudoQWjTPCTGoNLe+msqoULwVq9llJmhvAhWep8+ADGML2eGu2Yars7PdHPoGxl1AifffzjjzwyHsji377Xzkw+0fYkF2l2YBM7+SVl4E1qRS0qQqZs0en5DC+s5OJimTF6x3xJ+XelZ4ds7tPUkF8IuXxVX7/15Km7LKm/aJm1qubcNt3BpbazDGWzAyWv4MSLwYezXcc2aVftoovgqpTNp0wTfVPP35JCm1S2tIricN8mDdi2fP/ohJGRJlCkt2rZ4mTelUE3cN7Zg0rKaQAgW7tRlcpUQ+ObPCA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31662c27-98ee-403a-289b-08deb4a22cd0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 05:56:16.3388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8eK9Y7D1oWcu+c3D3RYln0o6Hz/ztVaYBtx6zuzctoQrmg/jBBEUKKiK2BkJpnuAThzK1hsqXOg8eCoaZQtdJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8780
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 0-0fmdRXwTaItw9FckC6GRChj1O3AuA8
X-Proofpoint-ORIG-GUID: SVTaH_Yxmepwnag0HjFuUL0AOf08ua4b
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0aaa02 cx=c_pps
 a=6brTJxCCefizds7ERwDNzw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=9yvo8pdFzNs4Kck5P0oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA1NSBTYWx0ZWRfXwldQEvSlT3r1
 tMHyxeaonLay7chmIjOsjtCtst1aQJepLFAtQRXS5PUonkHkE9LTtQPDzuwjFMrlkGxMNVPmPgn
 OhyN3uzYsN/QPCleROkOXMJ3+oqXx+hsY0Wlu7VsOXpX6gWJ63XvyMAGX06DR9JvxnDcrN8MYlI
 bEdTQlD5HElMqAhEqbOHoZ3i07T46ENnoBsfFi/hwfy0ynJkSdwG69OmpktM6MKTeURDxZD1WFr
 KH+r+7nC7b7UTz7lU9vUNrZ6JuoNNNEbo4wWxd8W8ChE64P7U15DIsJ8qxmF5IaLTtT4FvRGfb1
 6bJ6mZmYQyHM8gWHP8KrXVgXUKX2MQCjQ7aqe3W36PoVxmi/4C+LuJVJaZNSwD8+w0VzhWyo6nJ
 INCqz517BjqpI5mg7kAg3Q/JKnzksAXXO38UBfkyzN3KlT5FBmcqbTHg1TlPPO3+OBA4zJSnzgj
 EaIC/Xsc7iL6XIDjlbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 05:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237195

From: Chen Qi <Qi.Chen@windriver.com>

We want the ability to do stable version upgrades for recipes.
To this end, add an optional stable_upgrade parameter to the
get_recipe_upgrade_status function, which defaults to False and
when enabled will try to get the latest stable version of the recipe.

The UPSTREAM_STABLE_RELEASE_REGEX is respected. If a recipe sets
it, it will be used as the filter_regex. If it's not set explicitly,
it means that there's no stable updates or the recipe hasn't been
checked yet.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/recipeutils.py | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index c6604f536d..7c1df518a8 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1009,7 +1009,7 @@ def get_recipe_pv_with_pfx_sfx(pv, uri_type):
 
     return (pv, pfx, sfx)
 
-def get_recipe_upstream_version(rd):
+def get_recipe_upstream_version(rd, stable_upgrade):
     """
         Get upstream version of recipe using bb.fetch2 methods with support for
         http, https, ftp and git.
@@ -1080,7 +1080,15 @@ def get_recipe_upstream_version(rd):
             except bb.fetch2.FetchError as e:
                 bb.warn("Unable to obtain latest revision: {}".format(e))
         else:
-            pupver = ud.method.latest_versionstring(ud, rd)
+            if stable_upgrade:
+                stable_release_regex = rd.getVar("UPSTREAM_STABLE_RELEASE_REGEX")
+                if stable_release_regex:
+                    pupver = ud.method.latest_versionstring(ud, rd, filter_regex=stable_release_regex)
+                else:
+                    # Not explicitly setting "UPSTREAM_STABLE_RELEASE_REGEX" means there's no stable upgrade
+                    pupver = (ru['current_version'], None)
+            else:
+                pupver = ud.method.latest_versionstring(ud, rd)
             (upversion, revision) = pupver
 
         if upversion:
@@ -1094,8 +1102,8 @@ def get_recipe_upstream_version(rd):
 
     return ru
 
-def _get_recipe_upgrade_status(data):
-    uv = get_recipe_upstream_version(data)
+def _get_recipe_upgrade_status(data, stable_upgrade):
+    uv = get_recipe_upstream_version(data, stable_upgrade)
 
     pn = data.getVar('PN')
     cur_ver = uv['current_version']
@@ -1119,9 +1127,10 @@ def _get_recipe_upgrade_status(data):
 
     return {'pn':pn, 'status':status, 'cur_ver':cur_ver, 'next_ver':next_ver, 'maintainer':maintainer, 'revision':revision, 'no_upgrade_reason':no_upgrade_reason}
 
-def get_recipe_upgrade_status(recipes=None):
+def get_recipe_upgrade_status(recipes=None, stable_upgrade=False):
     pkgs_list = []
     data_copy_list = []
+    stable_copy_list = []
     copy_vars = ('SRC_URI',
                  'PV',
                  'DL_DIR',
@@ -1134,6 +1143,7 @@ def get_recipe_upgrade_status(recipes=None):
                  'UPSTREAM_CHECK_REGEX',
                  'UPSTREAM_CHECK_URI',
                  'UPSTREAM_VERSION_UNKNOWN',
+                 'UPSTREAM_STABLE_RELEASE_REGEX',
                  'RECIPE_MAINTAINER',
                  'RECIPE_NO_UPDATE_REASON',
                  'RECIPE_UPSTREAM_VERSION',
@@ -1180,12 +1190,13 @@ def get_recipe_upgrade_status(recipes=None):
                     data_copy.setVar(k, data.getVar(k))
 
             data_copy_list.append(data_copy)
+            stable_copy_list.append(stable_upgrade)
 
             recipeincludes[data.getVar('FILE')] = {'bbincluded':data.getVar('BBINCLUDED').split(),'pn':data.getVar('PN')}
 
     from concurrent.futures import ProcessPoolExecutor
     with ProcessPoolExecutor(max_workers=utils.cpu_count()) as executor:
-        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list)
+        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list, stable_copy_list)
 
     return _group_recipes(pkgs_list, _get_common_include_recipes(recipeincludes))
 
-- 
2.34.1


