Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D862CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:08:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.52924.1759151298636416363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jltNj8/D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2367b08ad8=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58T5buwB451401
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 06:08:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=0SVcbPbT6
	VUjg72QeESBogAxmmKzokN+eiEZHdaVwuw=; b=jltNj8/D2IOsDiewHI/6wyWdM
	Hv7/hRxO/rUEtaPFRVqbYSqy9bmdT9aSL4MyBTYVWohhz9WBKQmdPjsp7cXV0OMV
	7TT8QU6MT8UtG+Ik2HDxFJknNk6zGZOiXkAPI0yZ9UmL0QetAhmwaqvZ/qqBknyk
	CHSrz/ANuOD7UhZ+RCjL3YfQXeH/Q4c+kBihYuLvxwFWptMyEwy+S3VTVIV34XC9
	yxx7qmI5EH7etkUykDAv+SpRTbHLStJQhwA+PhhCysrGe3FnGnJ35H5tagxF9ZAj
	q6oNfY0IdxPvK6J8tFn2jeujf3hQFpLJKFzqFR5Uptw00wMnWkKuAy+k7siPg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010068.outbound.protection.outlook.com [52.101.61.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49eb6yhsrg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 06:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUh/gvgKCMOpnFi/gFb0ihlpOVGvl7C0V3BlcwaQPAULghK5cMcIqIeBW8gQsETsnnb4aoWtNrdF1nHgVXAcb8F4RJpQF1Cz+MXBG2naiG5VGWKBuuWGUyns5W8f2hzSB3WyY3LSKXRWaTF9TEoGTNhHeYiot6omt5blWBJRTDNFHla85xQlb0ZNQ4xkuqXVLdN+GtnkJKIilMViM7Qxla2BY5zuVN+lQlDdIbTgYuL3USmntSMTLPf9d8C+y+W9W/OMDZWK9mo0eMtFT7xgZT+OpH3bv0UX0zT3i5zWgXov/Z/NGFLUB67OwsBjd2tLFC0LHBWRo6FsSvjry6mJcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SVcbPbT6VUjg72QeESBogAxmmKzokN+eiEZHdaVwuw=;
 b=pfoZA2CF0zGYk//4JgrHYwD4DRYPa3L7e8pj3eiaQxl0KrAiKJvU2Oma++7xIN2VpK07WAvtHU4ekK8cWyschOjIuJ9+knv4BP4vUvb88hIT6VBl2yXmusuvm4AOj9GKUaUVU2gNkahd1onmsa5KW9Bb4VuYty1O4nIcyronIN0uFolFhgeBw2vP5MXFnUD/6RSlBPLMuIHUUbKW4ogAvEJNjbKzjd9uF8Tc0IMYfWPfYHEoofxojfQkZ5Gk6rbEe5t5nRPYIrfADYICki1wumY54CxmWHrBE2jS+kUOZwx9CNTONFNz+Rqonuqsg4sKaq+UhcbXt7xpIw5XUuba4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MN2PR11MB4581.namprd11.prod.outlook.com (2603:10b6:208:26c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 13:08:16 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 13:08:15 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust-target-config: Update the data layout for ppc64 targets.
Date: Mon, 29 Sep 2025 06:07:59 -0700
Message-ID: <20250929130759.1657340-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0147.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::32) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MN2PR11MB4581:EE_
X-MS-Office365-Filtering-Correlation-Id: 662550e0-f6cf-4b60-2ebe-08ddff59404b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QcbjYwDlWOlUeYmpIl67jF4Tkt8Vb3SIp7jSLyAgdM+T5CqVBdz/nfGkY8gC?=
 =?us-ascii?Q?RZzemEuzUe2j+SKcrVE93zlsea9KX0wI+vqYn3x8xoONwROPkN6v/DBjqiPW?=
 =?us-ascii?Q?BN79Vm4kz49AIRLfZHCGV1rhprP3WBmHHM8uExP0GhgD8geVUMraPmbxBwkE?=
 =?us-ascii?Q?J98oJHyR5GENQ34ILhTR/f7a5dTfZMtY+CUAJsWW5JuH9X2nWKnV/M7bWIM7?=
 =?us-ascii?Q?/2AZAyS1JAv+/Zl3iiTyxSCnzDAmYXrfe8RSr8caa7J9UnQaVPcXck//h1g4?=
 =?us-ascii?Q?O7mc0ymmGbDzEZkKTD0Gi6MnG08PYIKi/OhYaXodXILBUJ0Ylc5nPvvgk73N?=
 =?us-ascii?Q?UpIhQ6W1zJ62jaIAqkxLj/huGgnAaKKERdHONgE2Xv3sNIhw/mB1NOjj4EU/?=
 =?us-ascii?Q?dEFs22Xdv3TQ13L9MVXG7v8qg3oRcxp6lI+kjFpk8kSqySu3jePR7qAXRFsg?=
 =?us-ascii?Q?IRCwP4OSBoyTz3bQ2/tGmXCFuCh3Dc8+fqQZXcvngNHGSQ6mmwEpLBm40NHZ?=
 =?us-ascii?Q?Ov2LN/O0tXdRO0+V9bovOqXfdter7CCjKQFuke0FPJQS0UwYLI6z7ALFVShn?=
 =?us-ascii?Q?du5vfERONDNqDx7c4wETlZPYkY1+ucwEOrFyotzXW6GreHsUuBCf4qvHUycA?=
 =?us-ascii?Q?REZPP4W9IiVTTRyop1A3A5ZTPUASdt4XH3mBKBtAVZFvlrrslN4grkWPD8pC?=
 =?us-ascii?Q?VR5SYRwPVgJbxwt/9qilbiNGTugDHEcp+UPzjB9K7DsvBwfj+d34KykPf5a/?=
 =?us-ascii?Q?cuILqNAfkxnXONrb8VLBIyQDoGXA7DMDgPnsdaOBlc3LOk2xusld8+YckIZy?=
 =?us-ascii?Q?AjqCQOg8Q4oQKBO9i/UG06WDbFt70XzMi0uz86NtWrLoNiBVmln/O3wsnvpy?=
 =?us-ascii?Q?20W2r3p5oErWw0vBcrC4vg956UvKPGI8HjlPTJKZi8GlQgDIQ2TtRNEUHWBs?=
 =?us-ascii?Q?Ka223IlQCaZYbERaTVrojwevDJqzJ966iHPVBBBBjAxdNo+k4Rr5cVcz2qCZ?=
 =?us-ascii?Q?DKOPDJozpoWt5DEy2qkxhkbb0Ivet9Qf1SXHwx9/IiqT9v6NTG/fkMz9aRjK?=
 =?us-ascii?Q?OMWe566PjBv9GafZ0nDGPuVJrqBvVa5tpjHU+QFZPWAmV8mUMumj+VOs/cW4?=
 =?us-ascii?Q?wruJO5uF8O5hgiFFW5MrfHTf4p6Ecxho0Q8BFERiW3zfbj2nfYctyod+/iaR?=
 =?us-ascii?Q?uUgMMvY6QzHtD5AYD3+9pQkcj3uSnR46Mm+51RdNoSiRbv2rX5fQ3/7zhP/9?=
 =?us-ascii?Q?D99TKUv414+wcpkpQAurhYRttlcJespMguG44h92Ba6hVvWyVeIKBja2Z6pY?=
 =?us-ascii?Q?kmmbDgcS5/dZj5HUo7bnppDIp2SRkhY0BO2ZtARYwxIOSXvrA2ZQhW460mT1?=
 =?us-ascii?Q?DARlHF8h74IcxkN91SGEmh0+mN2+gQFAP6Kg1IHrBa2NmgCE/Jf7n/+OQXvw?=
 =?us-ascii?Q?KxhfQU+Li6hKCYpvPvnRmPz6Mw0v5p/7rtlaf26X954jUSl/zAqx+w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pZXQxEZueMAz4aBXRzHJMWgmhhcSrHXN1PJiy2uVmdi9mvmc+psQT2uc2FLY?=
 =?us-ascii?Q?2fRdPADHPj3FDi/j2V/SrSLyaxNTCXowk+13bisPhzBScOIKqBtG9IvGKTC7?=
 =?us-ascii?Q?lW6S4DaqmLxHKdt9OfvN1AMLnVBCvjjTTuTzumgVjfCqrcqSONZYPT+sT/38?=
 =?us-ascii?Q?pQRSXiqEo8az9Sso4LSnVMlLVdW11R8FFevbPQjR5BMp2BXS/yl5t7jYTlHQ?=
 =?us-ascii?Q?/Owhlyz4STgh4otaW8wgcmmTX1oQ7wVoaL8aoKeV8VFSxdXQ6NSeKRuITajO?=
 =?us-ascii?Q?2lSe0ssgivqo9eTlX0Ed9+FZBeCu1Gme6LFOG8UWEuZ8qUNPBLZfTPKDHhbs?=
 =?us-ascii?Q?9VzrpCVLSk0qvMdnFIXttgzm3h/jyGSVJuMKMEZwUJtgEQ+icNmGp4iudhRF?=
 =?us-ascii?Q?BHbZQukg97CFQgZAFLfzISYN8oDAvf1I+aIcpzRmZwo2WC/1scJ6LzPNVDhh?=
 =?us-ascii?Q?kPB/tjVVT+dOstzXBuZ4ehZlgXZdnqQ98NHa3Cc/NEOvz6gAjDmXYunT82LT?=
 =?us-ascii?Q?XCCaMs/Egfaxv4kRwT4cWZXS0CGgqUj06JJKTjHgQsCH+4tOBb/kAc7zoCMs?=
 =?us-ascii?Q?WFzuqpNkg/IkHXB9dCWgRWOlMmRCEd2+ekR199pn4FoaRYXy14jdmMjJZm3O?=
 =?us-ascii?Q?pG72yr0RLEQAZUahLbYNII+t/eDRPxDOojieXfi3tv7AxhTa/dVARhcObSi/?=
 =?us-ascii?Q?qeGt5G/3ix7e7+HIY6ZPClNUp4QhCFAzYTv/S7eGbIpcuY9HtZvQmOBupkcG?=
 =?us-ascii?Q?zD9xPkjJKUdIzEH0VAICS+zfFz3B8uRb4Qd9Bc1WQdCc8CdWX2mTXaRFkPGL?=
 =?us-ascii?Q?GBe2hduH1lSuk/F+WFZNQNa7rj2bKo74C+PVeqa4Tk3Q2mT8JXthJI4Lx3Js?=
 =?us-ascii?Q?3TLIFmYS+St9JDL645f+Njn97EU5i+nnXWnJEmcjC5GdrTzvDGmklA3MS+7Y?=
 =?us-ascii?Q?iDnX+vExjw0+AvqvdNZZskb8/RXB2aPOXBuoJRqn6g1IDWm//4Wg/H5IOnBm?=
 =?us-ascii?Q?ZNwwyA50UenUVYTVecrdcku68/HGIZn4mMg2Cz+c+xFgt7dwREQn9fK0xSwF?=
 =?us-ascii?Q?8YqLRIsBsQPDCl4MjcCKOtTUM4FYZNzkH8iThNuXzfmN/WPkXRon3aVm3byz?=
 =?us-ascii?Q?qixcHN+shk+JNUEY7xis0Rj0mHko68TdfqaSrgFlmkj61Kl++fppsUkkNwIK?=
 =?us-ascii?Q?lcT3WL5n7if9kWsnIZ8acV8bmVy/pXezMPkmZZypm3j2PAM0W5uNavCEDuB5?=
 =?us-ascii?Q?X+5EdipHEoyMkHdq0oclaX1tM6cwwPKNkxAFqnXClpjkTc/i02kjzhhMp/KF?=
 =?us-ascii?Q?P4In0PU1/hemesCIpOQq6lMlAE/xXy6VXcx+n9CjCBQoB4Vc0L/h3X8kJJ5E?=
 =?us-ascii?Q?A7voQXYYtJqStxSn0sPMtBQ4rg8MFwKFcAHI7rNcqqZkrTHAGdSvhQckkxBI?=
 =?us-ascii?Q?065AzmqTlLTUTibx7SGTMNzzuL44vrvFx4tTw1zfKRkfblo7uB3Xlc8QZEKA?=
 =?us-ascii?Q?T3c05Cqmbj1rS7RaZdg7alGBsv8U742dFwgugCAhwi6ti+1CKM3ABMWT24yk?=
 =?us-ascii?Q?DoLpGgxo5XtDHZzcFdNSYBM5DFfzdjlhrN0KwI0eDzv1BElHBchUPs4IwGRA?=
 =?us-ascii?Q?UhYVDL5Bd/FapNSg4EsNC0M=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 662550e0-f6cf-4b60-2ebe-08ddff59404b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 13:08:15.4133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzdVI5hN3NFGipGp7s/uye4eCqd0uAevZkVMPc8eg35c5CTH1gKKPs/QxKXnoUaUZxUP0N4E34DbYhvUTxjh+XMAy6IpObYNsekXwLtKEzeSLtuIOsB0dFsa7WUhydZQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4581
X-Proofpoint-ORIG-GUID: Z4gprouLoWcCzo-y_dzoJKkOYQ2kspiz
X-Authority-Analysis: v=2.4 cv=cYHfb3DM c=1 sm=1 tr=0 ts=68da84c2 cx=c_pps
 a=UdDD+omNl1Ext3Jod4IcCg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=G3b5Frj51oVsZK_9wjsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDEyNiBTYWx0ZWRfX4QeUaUn+1WMi
 fy2Rmn1jcyfEZnj5rOs9BReX8m9WbXdtxayTX9q2Ut2GKoj5hAI4p02Kp8Y/jmh/DDQi/H2bye/
 Pz4vYyDGKdUMpqF5e5y27zdJsy6SGL0Wc92TfL6iXW4BbyGk67/D+AxnZx2DTzxzBvQi0dk5WGG
 d4SRUTmeK5x9iRQbGMOU5d4u458OPw3YIw0jPGlgnQjgnOUewUsjPA2IqHh37d4k+ZjGL+nAMy+
 2bm5Rv5ZId5VmWfZRhmdVt+uUb92sZBmdC6+ZfvXfQc4l6PbVoT355QP/Ysz1VvAFddUZsaiauh
 pRVhcEblLNu5iIn2ggqh4pLqELxriniDnRCUBKjwvp+UwLhX69FBDrtpaSjXzxXDy+1bXdxMJIR
 k4QVNT1g1M+JgA6dl0YXg4aU0yjDKw==
X-Proofpoint-GUID: Z4gprouLoWcCzo-y_dzoJKkOYQ2kspiz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509290126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 13:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224141

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Rust commit for updating the data layouts:
https://github.com/rust-lang/rust/commit/0680155a171d47772302fc4da4cbbfa466378d81

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 61ce7bad8e..6e6b500f5d 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -248,14 +248,14 @@ TARGET_C_INT_WIDTH[powerpc] = "32"
 MAX_ATOMIC_WIDTH[powerpc] = "32"
 
 ## powerpc64-unknown-linux-{gnu, musl}
-DATA_LAYOUT[powerpc64] = "E-m:e-Fi64-i64:64-n32:64-S128-v256:256:256-v512:512:512"
+DATA_LAYOUT[powerpc64] = "E-m:e-Fi64-i64:64-i128:128-n32:64-S128-v256:256:256-v512:512:512"
 TARGET_ENDIAN[powerpc64] = "big"
 TARGET_POINTER_WIDTH[powerpc64] = "64"
 TARGET_C_INT_WIDTH[powerpc64] = "32"
 MAX_ATOMIC_WIDTH[powerpc64] = "64"
 
 ## powerpc64le-unknown-linux-{gnu, musl}
-DATA_LAYOUT[powerpc64le] = "e-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
+DATA_LAYOUT[powerpc64le] = "e-m:e-Fn32-i64:64-i128:128-n32:64-S128-v256:256:256-v512:512:512"
 TARGET_ENDIAN[powerpc64le] = "little"
 TARGET_POINTER_WIDTH[powerpc64le] = "64"
 TARGET_C_INT_WIDTH[powerpc64le] = "32"
-- 
2.49.0


