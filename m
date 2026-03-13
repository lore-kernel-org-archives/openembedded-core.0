Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA95105F79A
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 11:06:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13373.1773399992137607859
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 04:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oIU0MYAp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7532d94ec9=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8rlnT2883101
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 11:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=y+E/4uTVSMFLY+SPMMKg
	UwFbyNn188EdVqyJsZOpjWA=; b=oIU0MYApOwbJunZQY6ybQBy2kgz1fYfOr+p8
	w5JH8EM/VhkmHlcgiAUQcXK2N8uEYLis99blWAq/i2vpfuKPVnKGxWXoCOJEQ6zt
	5FT2gq3utV3oLYUIzagXSkSQdUL2V53NDa8DAMLu5L7Estcs7tZSoiXm+dkmU7vo
	VymmweINmTHdmVodiVTCbzIjQ0h5V9qBTEehtZ2UO4mNl5+fyVbz6o3mn8emFLtI
	FylpDI7aX6cjb3T/iowX66FHb+HCa0hUgBUOs6Yzr8XR+hXjKS10SXtXMw2cc4I8
	49vYYks9zd8+0qu6DVbYkXvoCka2Ob4ZtY7e4zwFludUSZpZQA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqsg08-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 11:06:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ss6yRXBlwsbS+BQpppT/flr/DgxG5Ujj0PfeiFaVMHA79p8Yi/buFuXn3Q1rlDwMNwOtWq/sk0oJuCToqf8BKxubmxUumkTPs8gGiW9h3xmkk/0Rs8RAfASdx5Seda72Ts5sNXL1UCkmZehKD5gIuqTPSRLDblwLweg4vGj8rbU3TUsHiv7pudI4pret+xRTVhIRTThvBIyutYKaxG9o6ttJGBlX79LLK9otsqnKHRkYYZdgOO7P1z7cmSs90J9OySWvHg+E5FQlKLs2XZKE2IQI1qahdJ1CIb6oxoOzCYifCWJ645v9aB5UlWed5/U7kYV8pv1YTSbI10LV8d2oqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+E/4uTVSMFLY+SPMMKgUwFbyNn188EdVqyJsZOpjWA=;
 b=RPcL4mXqk4YtSVt4Y2XInxzEITd4JUXs2bk3H2avkUsdiV+hQ985pR2wjzRpgpuU6wiI+uLGhT7qTLsxGaH+ooRWi+uJjU1CSo+Eo5rUz376lGEAwLy1hxJWAtuKG/YeYkpQYP0fBXa0GomcKm3TVM4SPCEXAYLiyWRiM6Dzno4Ojgwvdubi7EgQAHxXG0POn+gE1I6MA1pN5Q+gs2qPgHf8bpAgRXS1U7xRCoi7Ux+wiYLRvjzUTWz+gK1WFBbZbiCMrIPKdlExekTw5+4pCeWOt0h/LtUsPNAExmPNg5qRMOcV5ytfoT60KTGYmjagw3K5cVxQ0pdd6xkV/OkzKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by BY1PR11MB8126.namprd11.prod.outlook.com (2603:10b6:a03:52e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 11:06:27 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 11:06:27 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] librsvg: move symlink file for ptest in package librsvd-ptest
Date: Fri, 13 Mar 2026 19:06:10 +0800
Message-Id: <20260313110610.514979-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0120.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::24) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|BY1PR11MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fbc61b1-3f86-4ac7-b571-08de80f0925b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	X9LNP8IcjqPdx4fnL5zta2fDhy853dCYil8NFg/LI8o+IPfSwaSps0zOTmX9itffxuno0Vqi/0W4DF1ExyiNue7sT5AjVpCso4eizD3Ni62ZWStuQlMPagyYGQ+v1mXe6U8TbvJzgfyAMTw5COdbw45LMRxJAur8Amn5pr2KffGWT4o+v9jO00i8Pop1jVqeth9Mneo10+mqmyIaVJvgbxg/fV1QTf6+OdEa0Ge6jgaZg0aZGWp1SqufwQQ0PrYyi77i+ecvjh2CLkigu/BVXQwaSTECR8ta6YdMuWq3/7QbbYg67Gvp2aH0Tuf97OB9v6vKrrUGRfEP+m+khRuckiENDyVCZUlFYa8YCvjiFIauUdq6N9cB5kzt0l+P3cUNcBTe/xbL6cdUYxNJt/ibnwyjlAn3F/So3cidswDYu5zln3rP9fTjjCez/wfxuKAaxAF8vkgiYtNWCwtDfiKM/vYhCGn/R7jBL7aqz/us+DPVC98FhFWZEKjG+fDXal9JG1Yngn2YutorVD8xyaZnDRLrkykFpcr9p7d8mM6EhRYsegOwbDVtahsX4eL1eMVzZlYZ8S95X0+j+8HGRO8XUStI7QLXjg1Vy9e6Ydf2UJbH0p8OCqtLDXrGv/WJrSfSvI5fh15zu5H50E4w18oVuuqAZJHBC1dpIEWDr3FrBm54wXrQ5T49lFDdTHJOZozg/IsAR11yg/DRRPALKEXFXWoyakILUXxTkLLwOLMTgnDRoVwWniSBunMcqvOpTHhenpGLcZ9k4pXw9HS/P7U06w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9qCWK7MePrFvnoaAMe9t//cdveLHW6O9lrkXvUtVYh2Jg8RjT21/SOlf8Mpn?=
 =?us-ascii?Q?YyR4FFty9wJO+eoxUrKgBElW9+HI7jsXqBCG7oxTAdwI8yPN4rfQJ09rAF7+?=
 =?us-ascii?Q?TySwuTLFuKtNPIIl4V/+I1IE4aowob0Nzr45BiU7ER7irTgx4FSRym+4F4yp?=
 =?us-ascii?Q?uZRCJtCWcV2GEqcRjtfSQjYDLnrcpiByWr/i13shlNaQe/+f7kYASaO4BLwH?=
 =?us-ascii?Q?pc/ILQdNbQRQbQhC8ZTL8tkPwcb9XfEn+vOkATH42v8bQ57/Ye4iwH65POIg?=
 =?us-ascii?Q?08FKavlmobG2sHOF3WUK6rlNTEuD+FXbg8WF9yuOQX6Mh//QAxvoaDhI7Kd3?=
 =?us-ascii?Q?fScDCDFJkQ2QSr0Qq8FoLHvWOkzd8xThbYkkbcwFCGkD52rwulG/n/SnMyXR?=
 =?us-ascii?Q?nOoJ6GCgLElVryJC2kkUaGAWbFLF3pfgAkTe5HG8NydXiHK0wbPnjN0jrf42?=
 =?us-ascii?Q?aSNs19sH1pn6JLy/kZLGDHwH5Fp9strHiJ6X2sBi6sICiwLS1BaLjpFxhFho?=
 =?us-ascii?Q?MIt31GnojPH+OEBEBThPFV9Q52Wmx33PSgTyJluLHupNGqmrBSJb+wLGuuP2?=
 =?us-ascii?Q?PUxxbMKb90Z/AGDMzypfsDwH7JVpjNjDUTC3o2NVdQgubn8zx86nRAFQuRqT?=
 =?us-ascii?Q?YXy55pxl80uDf0333dbUqwGXGGRv2eclkOrx096Ms38Rlg+2Vk9l7M8mO6du?=
 =?us-ascii?Q?QtGEEazmmuq3ipqWw4XKFmO64WAGysGHJR44YXJHt7RZGwnWvR0MBGNjWVJ4?=
 =?us-ascii?Q?r7tyrLGrQWsJffY2gcTMlWVKLt1Z2/kuuTKvZHLqnI4yolhES9TgpqJSbViq?=
 =?us-ascii?Q?Ob+7vzSWCD08ICfW1Ydqs3Rap55anww+iTxpN50UwuT4zc6iYng1IOvm8XJb?=
 =?us-ascii?Q?ZyWXCF90u5A4U7cKPdqivuxe3a2cyCwwgi85yjzAEg39cAH4hJYE7qMs7b89?=
 =?us-ascii?Q?PFB3IGVB/LH91ypw4HAxEGdOPq6+qaY53sgkbJotOB+x5R0Sdg18UvEaBAZf?=
 =?us-ascii?Q?p086TVa4SZywgKiNOULL8Qb6WHoHSGT0GhS1XtxibDmMfforXdX3gwYywDz2?=
 =?us-ascii?Q?1MwhCsFB7vOctzDr7mNxzi2a/ADy4qAoloOUfRVdZLvsv++VWYlB+rL1IOZL?=
 =?us-ascii?Q?SNeEYox7y0gW4lhcog1PIQpDJrcS8xMNcwp7wW6v048szFI2th63j/NJdzPH?=
 =?us-ascii?Q?tgks/OBFrGSStk4jLVBfXegWpXj4meqT+Jm53IdmHvMWfpV00ST/qmVXLX0Y?=
 =?us-ascii?Q?CjgzAngpVAWvreABLtKj7Fyq/buj94Qke8OLdlln+VAn6xnY1eIRQfV/RZiq?=
 =?us-ascii?Q?8Z/OC8K3DA24Nl1GjleXC6s6CYZh6wkF/OpxozluVSS3Qge1jRTX+s2q1t+e?=
 =?us-ascii?Q?6dvDN1yE7JO9MXYpkRopucMaaKUmkWKUaAQ8JVXZFDgAI5yvB0Lpmg5yt1WQ?=
 =?us-ascii?Q?gT6Dr1LGVqjbSdrUZir+YOGGZT7EaHdyaQVtS+at7W7A7/AJBLLAR5PjprY3?=
 =?us-ascii?Q?NujKdpKitljIIviaI1chTFPJif179nu5Obs1wmC2Uf8js0AkgjCKAc165aRB?=
 =?us-ascii?Q?gy6Kx+sJtlFoT2mOYEkUQpOSZ5hulMbWMHkdVsLsd9OZExQ/v7PfI1cwHN3Y?=
 =?us-ascii?Q?mkgZI0T/x/vnUrlUNH3FDVaOAcF/uKSfcZKzS1PMuFYGPiFpEB2MYyC5DhP/?=
 =?us-ascii?Q?sQdRC0jsJnPvIXLLNaBQgQDkWutcg0j97AcBLZEuefHzI2cV4BUZfqKt5Nn3?=
 =?us-ascii?Q?2KsHBv1K8OEDFN5JJYVKLO1in5IZaf8=3D?=
X-Exchange-RoutingPolicyChecked: 
	CpUK0S+orav1b0KlQw8SRewoYf7NSKMp4LfmCw2oiho+QfnDWMEnJws+kvktZSFUoAcLRPE/R7QUDOGeHqH9cGVSS5m4QDln3wHtLV0qvhmSnJ72UDmcupdfN1OX9AP/KnB/EnBu9+w4eiOOlAnutRXNfCGNsJMfSgiA23aEfxS8NBOSWle8tx6m4US1+QrmApc8zpiEbHEe4zoC0sF1s6DErekVLvsV/AfjuNhMN+ExE6eiSMMBbJ4HfkewAy1PHMeT56aQsqEK33PrOiS6Wd1h8Ax1puub5ZdAbTmockK4NvDponKSgeHh5vcqfJWw5PSN3L4T2wHxlDRnCD+xEQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbc61b1-3f86-4ac7-b571-08de80f0925b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:06:27.3008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FaQ46GHBAlfhVf+SvSQyce+73EkeCx8u36ReJm00mg3pFwOg5L75CWsWRFp3Qn7I+4Gl6iNav/Lg+KRiJS2/qmcxKWhQNty5tmSIAT8syEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8126
X-Proofpoint-ORIG-GUID: Ufl0-e-7A3TvVKZW72sPfa2IS1McIi03
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4NyBTYWx0ZWRfXxJUwmKFS8vt+
 qCoq4hesbQXaePX5W0345GaRNmmPb1/gW5xxy0/uLrExGNpzcSjSfbe4M2s9DciIeM70h0jYIPu
 oRa+KSwzl3qSbEmnBseKcN15Qd4NodhrbuXVZLfoXKbTiG+vlyIUZRQFglsZF8yWxYVb/3QnGMV
 ImioguN6gEX6xt+alewHAg6Qh6UM5eNGa8NddNj+xALHmh0VCSBLPnae8OIYfXNEd5qpYqa+SON
 AbYy2UKU1a07T/rvYIL7nKoq8Klc/6baEtxHJD0kXSTemrCc3T9cc/WydT/DSooCUX4c76MDETH
 I2VmX7vBgDn3Gc5PeQoiRIGi0UuprxNVOo9S7ilB4FdiPJnXBtEjLtD9La0/wWsR5DEQ8u85S88
 1aws0RCF/vIQ6KLVr5yS993chVeUigKkAcY2/gUdZ90Kvnl3Q8NgtJuokiAX/bCUsgmH70vDS+1
 pY8imGE+5rwVhNbGWcQ==
X-Proofpoint-GUID: Ufl0-e-7A3TvVKZW72sPfa2IS1McIi03
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b3efb6 cx=c_pps
 a=vP0OKLXe+mBq485nSWAwQg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=VwdMFj0CWtTcJ46F3hUA:9 a=zZCYzV9kfG8A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 11:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233040

In order to make ptest can find needed data, a symlink is created:
/usr/lib64/librsvg/rsvg -> ptest

package this symlink file in package librsvd-ptest, this can avoid
there is a dad link when ptest-pkgs is not installed.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.61.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb b/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
index cab8471c33..1375fcae50 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
@@ -103,6 +103,7 @@ FILES:rsvg = "${bindir}/rsvg* \
 	      ${datadir}/themes"
 FILES:librsvg-gtk = "${libdir}/gdk-pixbuf-2.0/*/*/*.so \
                      ${datadir}/thumbnailers/librsvg.thumbnailer"
+FILES:${PN}-ptest += "${libdir}/${BPN}/rsvg"
 RRECOMMENDS:librsvg-gtk = "gdk-pixbuf-bin"
 
 PIXBUF_PACKAGES = "librsvg-gtk"
-- 
2.34.1


