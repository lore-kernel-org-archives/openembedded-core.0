Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C33CD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:24:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.899.1778649839765425909
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 22:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GA9gICga;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=959349fd7a=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D25wnh014510
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 22:23:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=h5a4TInFqd8yF4Jbz65UwUUfshjZUuu9jGauKZ/4BI8=; b=
	GA9gICgao+HUsTmEhwY2VY3H2q3GDTdl6kou+AK2UMBo1kREc6mDZEIIjujbd7w6
	2SIwhOrv14SnpesI1sn0lN7HqYB2wH3UXzVvPHS31ngHpb7bXiaJ7klH1CnDs7U0
	KY1KkxA+9SQhpxRmPeE6jUla2rontd7QhGEH4UTG+zEtV8Ih0Ji4M2xArZ9HpeQM
	Jlx2iX+XR+i/4yF7KffeBPlo18mzZRJApwJTVVSMKUFMQAcE5qKsaehD4bje7FwD
	WVKMWIKqVBQuQ+Yeh3WBY3zdaiZy98vX3yJ4kl6024fzDsmbQ4XFu3O7wB+QXySj
	9AD4J93CRcY7CNJJklBQTw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010014.outbound.protection.outlook.com [52.101.61.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4g7g85xq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 22:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiKU6HVNWbbJzLI0B/6cf47DNvxCRDWw1yfYG72lV8kev6EnxOeBu+/Sv137QmnfUeLR7XhFL++6II9y+XIcCf9H62Gn8L/aKajLJNXN3KU4xDoElExZJywBs2E+LjLO+ybees/hppNbxRfUhJ6Zlt8EeV170OwXR0vmng/G+PdmZxusHgmB1Kg0DIiDKhBerDyreSMDhMx48hf57KoIb480ldedTYQQDMXIRJkvlE01++AKFJ6yw2bBWieItztgfwXPncQjxTnTHR22ktqOCNccMbxqQ+weWkSUi+HXiUTHcmn3WetYnTVyT1ePfdhYMnfsX1Qa/G+kHh7wBzoRXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5a4TInFqd8yF4Jbz65UwUUfshjZUuu9jGauKZ/4BI8=;
 b=LNKFyxA4GUOO3mtSS75Qbx/BKsz4pyaAELIcs7DoV4hVUGLzb1EoH+zPDzA0rOxAbx/2JlFA5KBuVTIM0Cl1Rs0PR31du8pV3E4aU9AZjbpNPr7sBlY0tmGk+ao9my3RaZHvp4ps0Ha9SFucJYWvVi2Xjf2AhQzlEaNA028uN5UxS5Bu3QgA0IeDPTpHRxWKzvg5bRJYsHPTloRcY1l3Es/co+LXH2GKquqq+2SS2VG66rLbbQ3oiObzD4l4UlwRJzWSMCPUu9elKalMMl8M3PLKpNGzE3g7SLLYEwUC0vHJGxEaF6ThfNWXxx4UzsiDOTfImHnYn4UfP7hqTDE94g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB8855.namprd11.prod.outlook.com (2603:10b6:8:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 05:23:57 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 05:23:56 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V5 3/7] vte: inherit upstream-stable-release-point
Date: Wed, 13 May 2026 13:23:30 +0800
Message-Id: <20260513052334.2271800-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513052334.2271800-1-Qi.Chen@windriver.com>
References: <20260513052334.2271800-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0116.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: d9abdb54-9ea6-4521-1e39-08deb0afd493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|56012099003|22082099003|18002099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info: 
	UQVExkY/0oR851djJJEpBBCY6ZPxepj5cLLAS/5PXmxB4I8iz9C2QzXkZgiGVNwJtZopvvDOPsY2zzc0plD40skLlsuE/nlvR5K4lRPH7fKxtK0hrCFnO3GZ70a/fgjJJxQuSTPBibqC4Co1kyAgltjexbdhs5Nh7L4tbKrDCiLtoBGCsbZ3KVzSBnALtyKG3toEqfj3lO36Cc6zKWs1N+PmJMIQqNF9aOAmWUZd0btiv4ROKat1O/CKZwxloyjaWAIVQ7Y9bDmqfybcpZDIUIRIAxg1DKvFeTvIGl+9ivSbsqb9VuktEhELbiL5dlVKaBR7DeJHbbsYShA7a6HG+FWpkWMqtqZFTkGJFrfxixxPLI/JnZM0BqdiqyIQuJedOhV46pTvUvftWvzTQOfI90qBRpocq2itQ1sisRG0k70Pc78MQLkzmD4A3PnJp5IVQFCRfHeTp8dBAvUl3r6KczS4ruV/OsSAmK34p6PniKB7PFIUKRMcKAchx0ZRun9iruiZP/Dolbm7oF+Z0QAmLdvs9INK3E0cVqRTXFnMQ50z+n1ulQBrUk48fv4EYa5aXmadJRJVi2NpyicqcoTpkCCykCHG2FKD5j/kE3kgJLMNkDmyuM4vav99lh5fdgoj2ilDgzUp+jdcM0a5Y4LKMONkaWh6BQMg9xzdTeplE29XZjTI8Mw4UdTX/T2Gf3Nn3m1c1x1YOwGEjC8CAw8PHA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qmnSKjgHJ2+F2iRZgfExjiZz+JEz32OMITlXORLFHZpc9FXkoz6S7jVaiNOn?=
 =?us-ascii?Q?sOtBMuS/bTaSXB96nOt1uBrmN0VWIgxtFB1kfxjHwSlOkrpzQBIPJKW11uDR?=
 =?us-ascii?Q?DDJbwOHxTfkTHZcx9GnHsCSGiX8DdcG6Dnb9dLpHN8oAE/nbfIm669wRWAUz?=
 =?us-ascii?Q?2Tkw8FGd858IwJ4X2jd+ZWb20T7HQ4wuay2t0xr8ZBCcbFUrTK3cBqpO/A4J?=
 =?us-ascii?Q?5v6cTmp0/qNa5aHjTnEUD/muhoQjayhwaSTtZr62xS74UUafs8TMPlFI3cOG?=
 =?us-ascii?Q?7A+f6LvpRgP4K9v6BPOdvFnwBMnPuq7MV7vjpZKhwMJ63A0Y2hrzpsgGAifv?=
 =?us-ascii?Q?iYM0qEDLVTpPwHHLuyesXGmYM9aBDBCeKeM/gn+pV1vyDmg5z7v5NYhErJYb?=
 =?us-ascii?Q?BM1BK5Sj0H1BkVoQ/Kip+y6b3/D/NFoaWe5o8fMt5Jr33uiRAr+Mzr/WWalI?=
 =?us-ascii?Q?bP+lFNpKapVXl2rJFR0ZZak+AGei/4BJzO044Htz+nyjDel23D5LswbqSXVv?=
 =?us-ascii?Q?i4BEXF57iivTWhCCUKI/ciIf6JYbCUQssGy8deVM6lX5dy/2ID0rZFCNc475?=
 =?us-ascii?Q?xP+xfYJK/uZTtN0tAdt2b5mg5AKM/1nCulc6PjnMP/swEjhXQXhRkP2iQryL?=
 =?us-ascii?Q?T+cooFU++HOPA/8M6uCRRwgLC6YMaqaUtzt15YXtBXn5GmgTjeSjPnuTdg0I?=
 =?us-ascii?Q?HV39v7gyuJXxmTsiVA1PfpkGlDYJ3Ks8KQF/zlmv5C/B/KE4tWK47toPiufB?=
 =?us-ascii?Q?1pGrIPmzS0Mrk8cd6zRK5CgDWiMfg8zla5013tDK69nBrIvJ39evtR9fYxXA?=
 =?us-ascii?Q?tD2xL5Of0yfXV52PW9Un0IBI+ObMqze+RAY4ZQRyh/Y9r1DZ+brY2+qn3y8t?=
 =?us-ascii?Q?2+pM6IoHvBvtiOdgfIs/JUpUjTY9DIgk9NoOc2pXN0el4WagTsQaq2QyM6L5?=
 =?us-ascii?Q?cnkEGxYMylI1SU11UhlHKABmUNWWkvmtoG6mwBItHty9LuLtbFBuTI9roZbY?=
 =?us-ascii?Q?mfbOb6jp3l/Aw7l2sXy8eU2PBiHeWTVJ/Z6TbfupNfMDaPlVx8K7lElbDgVf?=
 =?us-ascii?Q?kRipFXcvOFnTP+WM/d7yqyFo98F7LWyjTw3qIE3lYBp9Ieu7UccVpRIjv++v?=
 =?us-ascii?Q?+tm90J38+x+tpUtXB/4x316XA2tbuwyADWS/yYdzhZ6CTsi5vWFXYvWiQyzj?=
 =?us-ascii?Q?AAkwPb6jVk960USiHKeyWLEQ6pNitU5eH7MglPZPMumaEes2mwwsq9RPnb/m?=
 =?us-ascii?Q?/OV/z5j7Wv17XvIqbXaErE5E9lYUjZhDmyNTqc3/nLjSnGd+AitzLmqs/pOb?=
 =?us-ascii?Q?2zTIRyILuN99XhILWg0MEls6pTW0Quvq3m0M0SsUNFSsdF5juXJSmL6viu+P?=
 =?us-ascii?Q?53LmU9e8Q6KUwD2WMZ/Ta7e/+tumlFJ1Ahw/MQ288o/bxhXYl1a+g7idp603?=
 =?us-ascii?Q?3GFQQNt8mh04mxMdBcaF/TwzwcKTll5q9B98cIblbuPhLQyYWFvS5PI1K0kB?=
 =?us-ascii?Q?Lg0IydoRwOYvZv03s1CDsI0nWbJ9njimcL+MLhzxwwUQHFRx9EcRFWp3/cbO?=
 =?us-ascii?Q?BqmgMG81gpdrACzOiiMA5eIM0lkLvFjdZ1dnzm2i5RIatit2QyaxlQHfSutW?=
 =?us-ascii?Q?EC/QApVM/rA+5i/FcIDNIb7+xl9YUGGVu1pfG4NLm4ejyle9qUYoJaazwvpn?=
 =?us-ascii?Q?WEqEFKzUkkLp3VgS5Q4GH7+0LB4q9qrQ6EIKn1EZGowGQAYoqfI6ipOEIsGu?=
 =?us-ascii?Q?H9abdAUhhA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	llpxJkwcKjyxFF21FH7wKM3BqwwFxKbI06nj6UtL//G6nqNMh95pJfHqQAdyaDVa3YtXKWDvQzktjx3G1Y3K9uGJ9WcWzURBHQsVeKdLP+afXAr4c4elr1G9oFP+Gs50ef8pDIhIvDxF49S7xc0bllfKARm6XSYxHXhaPa6LqYWcShsjkcw0+qbUMkNIUmJDZfTDHfmhpVq+DX6USXqcIZ3edCqVi7vl9224aJDYIP7C6UFBUZEZMq4+X8fEGYdD7kB4vx0nhRi/c/aMXnNRQyHZOV4X7uBrOme7yk0QV8WmAXBbsE32X57xSzy+IOLgmcLnRQ/a6NAnWPlSZzZ49A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9abdb54-9ea6-4521-1e39-08deb0afd493
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 05:23:56.8741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vU6ZZAYwPOCQI2OrLpzqusBTlo7I5FUPAqtnGEwTCDx78UqzjGWjvrEKksVuqQWKd7y38En0vc1A7GFCl26lbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8855
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA1MSBTYWx0ZWRfX35QaXwh1/UwU
 6iGdxhoMRk9dLPmwyH4wEVbYGLxP3PwhW+Bz/27DOfEx30GMCZWt2nsvpIjpe6E+76k0d50xwuk
 OQ/b6EYsPvAuy88mAaMTc1ncpqW601WcYykTE/rFGekw3yA28OrI72i7DytTsMZut7rJj9zmuMC
 m0UtEucWGIyzDEfy2Z5ocWCupAWhQzz4E+v9DJIb3KMz/IG2Xl4j6whomPQaGyjzxf92Qonxvby
 XAhRNRfK+RVVu0JYqb+br3ERZjMgeH8ZLGKhsG6z7VH0arPmDHUj5ILcYJUqVZ9mcmV+q+d5Kn0
 64EOmi8il+3QwmoIxxjhaMWVR6A0RruVQBSYFpCii2e3Zj15NcLnj11tgutmJey1UFORJDV5oPy
 5SEW7pWn7oCZvoWrj/TxVi/OH7TBZby8PV9Z/Ujv3b607UQsTOFjafASiK0NirSbHolx1aZV0fl
 T1gcRqHUNbAKOxoSG6Q==
X-Proofpoint-ORIG-GUID: gUX_awGuSlTTnug25_JOJ5SOGtvgkkU7
X-Proofpoint-GUID: Yeu8kSgOXdUYiqdQhyi8ULUdI5SsgriL
X-Authority-Analysis: v=2.4 cv=Q7jiJY2a c=1 sm=1 tr=0 ts=6a040aef cx=c_pps
 a=cMwMxZTj1NM3F6QoWJDe6Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=GHR8O2WEAAAA:20
 a=t7CeM3EgAAAA:8 a=_0aN1pf_025NAIwbKcUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 05:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236922

From: Chen Qi <Qi.Chen@windriver.com>

The last version part bump for vte is a stable upgrade.

* Evidence

  Its repo[1] has remote branches like:
    origin/vte-0-76
    origin/vte-0-78
    origin/vte-0-80
    origin/vte-0-82
    origin/vte-0-84

So for example, 0.82.2 -> 0.82.3 is a stable upgrade.

[1] https://gitlab.gnome.org/GNOME/vte.git

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/vte/vte_0.82.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vte/vte_0.82.2.bb b/meta/recipes-support/vte/vte_0.82.2.bb
index d5dced4ce6..839475f32c 100644
--- a/meta/recipes-support/vte/vte_0.82.2.bb
+++ b/meta/recipes-support/vte/vte_0.82.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "fastfloat fmt glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native
 
 GIR_MESON_OPTION = 'gir'
 GIDOCGEN_MESON_OPTION = "docs"
-inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
+inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala upstream-stable-release-point
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
             file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf \
-- 
2.34.1


