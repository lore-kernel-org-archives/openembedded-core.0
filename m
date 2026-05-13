Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BC7CD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:24:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.899.1778649849765017396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 22:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EafjgcjA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=959349fd7a=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D3xm41251624
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 22:24:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=bml5wCZh0zQZVYlUoC9fA9EaiLJN9Lsei92RTOmfE04=; b=
	EafjgcjAsKsb/kgTS7Gudr28nBw/FQDZfgvqGfl2z544/TL6Z2NHxhFapzOHZW/y
	G1RdIIWnGjeRmCwwYlXldqloAgidDmQJjIBvj7YYifGrPWKxDXoiLHgJvyBFcl1J
	6ZlbGnZdjCWgZJJ5TQe+0bXTnIxkbHf8E/v+3aRMleyRNHXhukthSIclv6EtyAT7
	wE+NYaz+UvMWtujOQ+yiW63IFkaLw2ZWthFmkSBIlshDXqvTcjmpWk1kuBFviQiG
	I+so60GtkmVQedL4LYHgpfKVLbuC4iFr2NtNId6pvE3JUmAR1nOQhVKuDqfrM9qI
	XPYavFzW1XDoqpRBf1cT1g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013053.outbound.protection.outlook.com [40.107.201.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ftb8719-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 22:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRYvhV/5pDqsd6FDCKwWJjQ2niLCWeAxzZi7hIA67Q9jVuDf3Y5OSiKusuc6Nx7MyHYC79qQPkT6ES+wP/go+s5EIAnXsPaPNUkJAmUlpaP/HbwwM1ecqtnJ/O0lcMxaqfWEeBonp0Iigk+xx1SNmlbGADsq2kCWTU+yHnEHIZniAJosLJ7MqGe4JZ9kUyrH+3jKkgZrCZDfZ6SU8t4hXKbwZiER6DuSv2Ddc23QwpOWSxXYK7moYXbHCcIADxLEwdyMVLGajW2R4cbXRCF1caCq629n3PpCIMuJs1xVvG3tOo6spmqfWuQrjpXhG2ZgOlbk/kz29NIpZ4hokcCYZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bml5wCZh0zQZVYlUoC9fA9EaiLJN9Lsei92RTOmfE04=;
 b=kIERPiWNjHXYHQlIbubAazsYv08gUChF0M09WZDne4QSrHUVG+40nWwq3O3TY9GVhYWwajm1npMqF3Avq8Hdqg7NC28Eahgn3wVDsvDMTc/JyVJKWwSd1Vt4BzL4p+d/9X8nNcVewNuK6IBlznK9KATjb3jIdqX8DsOz4z27upz7+IoygHvveZSB84nw45r+kPnRPHKIXo3ljkmNiUgeJOnD33KHcwJ5vUEaZNalT1CBhV5zgl19vWWAh/0uhSCHkGTmxqPYofC00N0FmMc+kJ1QLkeDCbsR/RkCF/URFsTLEtS2U04K+mVKcXSvPGDTPqAbYKmjBY5UrEY+l1qP0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB8855.namprd11.prod.outlook.com (2603:10b6:8:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 05:24:06 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 05:24:06 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V5 7/7] openssh: set UPSTREAM_STABLE_RELEASE_REGEX
Date: Wed, 13 May 2026 13:23:34 +0800
Message-Id: <20260513052334.2271800-7-Qi.Chen@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: c2fb907f-6b27-4b1b-962d-08deb0afd9b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|12006099003|56012099003|22082099003|18002099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info: 
	mkeaiN/V+XRKioDDxw6PJyUaSD4EeVqDs6ze5s2e0tNgu5MwwSXaakqtbBfH6m/dGXFvMiS8ApivmTmp9Q1jvdaWO4ESPjfznGbA2SX41KsIAYSTVdSS4hFCr5E0jSGkEUHC865ZlNJ0FRGiY0U+GRn3VJ5obwkuIM5QsnO+BPLLnjjhZL5FUXtHorFwD8lun6A1WkYKt1F4wT7MCy3iukeF4az4qIVnVB/yMVqJLhyg3TxWAqxOj7cXtqeH43Sf6+vl18OS9A637+W3QFhlS46mxLUlHncqC1Yvxn38FLbDquno2fzfo5aA5KbS/PaUtdw2eW1sF+HT6sEM7OQLY5/v2pm8zOLMv/1xM1DOjNadJtT5NSRqQf+aDigNFq3P2fLd3o7y1T5lXqChYroEMw4bb9nx4sKs7/oWcbDzJqp514m0f9oJLdBo4bIpZVzB+S2cSWOgwEo8TCiCIXnL/sco5XJzkb1LUA9hgAe7cEx0wuZDEq847DxfcEk/l9e0NvgrZykDOrqaZxJJaw5iL81EAX/donJwW+hy5CJGxxDi8GSwQ4/PAblaPd1rEDCEwfrofI0C3d0HVg10If0dFz9e/dilJgHpqfCmKwzDAcDuYI6XUqYHFwUyJ/gTT9X5l9mawcebnLnvXBnrrz/vO05iX8LehQ5RkJSMcvKSvUrWS4kwdmxwGVbt2Cu+QzLgf2W9wy/jVpEEu6/gLBh/sw88HXoOWlzPHOlMY16E1y5urzAVNnT9LlcBW1l7PVtE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(12006099003)(56012099003)(22082099003)(18002099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0Gyj+zi1ONp0SorqBNVE5Wb/r/m+83OQ7ufTOOUqLRLdwQyADrL08RFwhwPL?=
 =?us-ascii?Q?vUr++IQBNonQ4IJe7GnCDEY8iyB5IDEsnyxMT3fCsohxX8vdGw5Lc0fRDeB2?=
 =?us-ascii?Q?rTYxgL6tOeE7dPvj7uVjHbsPrds7ExAGIdZkE426+1fOfK/toenDtBEt/R5Z?=
 =?us-ascii?Q?E9rUACTxZ4TbTI9IY5wAHkklp0jGkTRWcbrbBbqvKarjqcsbR3ekc2dscsFE?=
 =?us-ascii?Q?JxQcD1QrJZnnnoXhOzAknfBR8vErqeYzJskK5NLFtFjcsMojAgGSXyykSgaY?=
 =?us-ascii?Q?NFm46ucHz4FoxwRM5Ae08ntczqPK7vIuDKZNQ7h19c4l7pi/CiZkyThfrlbe?=
 =?us-ascii?Q?nGb0+FAfAwTvTupEqyb2RMqQFXU3WS2FICzVndBG9xccTX2/44P3P+z45GJU?=
 =?us-ascii?Q?t+m5rOqKOyTKe6Ofc7ms/um4O20DoqFqDDtm/eWERtQItd4K4Wc5bmcjfFzk?=
 =?us-ascii?Q?1JizD6xe50CvGhsiP5AuwFOYq44nsMzswxw/oPJmhZhKXM5eDJLKp+JbvPuV?=
 =?us-ascii?Q?rIW8ttnYDU/9TD7zADwq6ReLhYsUerNqaVjKWQhhJ91vZz19kewKITlE35/B?=
 =?us-ascii?Q?iiFAsXHsA0b/9Ws54smaBMzlj3EGxK7fX0UfqMDuU2+C6YpF6scoDFyXgFjs?=
 =?us-ascii?Q?Stc26GYA0up0Yn6IfFkVKyzil4kD7q8MMc0D/V2/WwOQlMY/tFq3A0EAPbRv?=
 =?us-ascii?Q?j0oyyQQe6l4MmZ1TtAqc8TNkoMWzPTHoj8sjqzP84KbacV4XM9JcVP+Sn6ME?=
 =?us-ascii?Q?R44J+nSdmuDFlfGq2THJZK1icXgEubrHN+bgCCYBJjX1314pdF6IIxD/n68F?=
 =?us-ascii?Q?A0Tl/qcWGYnkQDfAvuMpnM7z1FIBcrnI3GULQBLaN/Xg+BLKMfJwqyJmlUEe?=
 =?us-ascii?Q?HSgxUkjLDG5Q82nSBlYIWr+eb+pXKJ//AwQgPfICT6LXPudupb4JAK3Ot0/Y?=
 =?us-ascii?Q?d/aqgfuNyZLs8djtqkw6S5K78bn8IPzgXhQQpY70+UDrP9Dp6PY5XRHU5xLX?=
 =?us-ascii?Q?xifhCS/EpM5BobBDKTARzZMeNHXayZU3+MUEHTAle5odSN96w3Mq3JUzemUU?=
 =?us-ascii?Q?d+f/kocFdvMv4fkXfk29gOh6DfCzQYCyQZJBnBszccsLXU/+GIpcLCTOxbua?=
 =?us-ascii?Q?5851VIbGTYjdbRD5hVDl1/PeS4tKR0wLfV080YvMczHHgMf/8S16A86JYVWz?=
 =?us-ascii?Q?AGodZwHxg4T82KmCDOUPCtiWkhuY45b+xjHF94gh9qsvB+DjrVjSQabeMG6z?=
 =?us-ascii?Q?XO2+J//ZrpWiTJr7Hm/ZDwo4bNQ7GSd9q+X4yf9WlF38348lYDQIZWFNujoQ?=
 =?us-ascii?Q?CIzQg21ERrpyZe5BYYutFXS4lLaFXUM4Lv4jK4VimoEHrGHRWNmlCgwfB5/M?=
 =?us-ascii?Q?/xJYGMKVZumNO8qKT+LrFzpjBbntE3QZHS6FDA5QAN4Q9bYFux34DqX2XVRn?=
 =?us-ascii?Q?j+krcLg+vHLkpiw9o2423N8xcTza1lifnV35V6bRJYwhaLmwJq3BEo0nfvAZ?=
 =?us-ascii?Q?iERgBhZUYSxs9Er9ZOH4fY/gl7l8R4skob0BvMmHqbkLaXeVKTad7AC1ZKum?=
 =?us-ascii?Q?YxrEzaSJbk1nDWZgQVMLgrvhAWg33Fg7wbAzTz9WB3f3oTv4EiTCzPZQ3SKr?=
 =?us-ascii?Q?1Eq6xHqeoXOiUum9iSNiDAnfB2sg94BcHVYwKpha1/F83v34aUcIVZV1xFld?=
 =?us-ascii?Q?l+g/ECyw7N1ep71qXNN3KYFh13kgKZDTpyfjyXi7cDTowhAp8Pv+eLWAlD2u?=
 =?us-ascii?Q?BS7XwJ6M8A=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	QeWo21tP/uEiAPEUR1INcLZu5eE9bbAIrQoPE0qdk1Zi9cmgEyaXRQ3iuv7JDC7/CItxxbzBLgimSgcc0M92Y07bK6ZshcfRwhW7Afxi4+jYxWLkrv1fiL6JY0DhP4CHDDkItsW+ud0C7g3yvLGb6n6c10SBu1whMnp7lz42HF2/NhPfD8B/AX6I23c0eEwp73yuB1vqd7DfFcLCsSGM4Cr4y9Rh2cXv3k5GUX1IHI082x9HWRRlIvlB9Z/nlb81vU4gM/NlAAhSvkY0D0mqhY1gNNAueI6LDBAom4YKhrZSNKmCzz+FHneQG+SkcaQgm8mwX3moz4YbMGozGT07yA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fb907f-6b27-4b1b-962d-08deb0afd9b8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 05:24:06.3638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6l8fSfIulT5yKU7yTMJUmfkQ601+BvLZFPtDSQ/xVXUCzdiLmu6anNBSh52XlPG8XbV3Jj95iXm+t17ImjteGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8855
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA1MSBTYWx0ZWRfX8oTulo+3cJ32
 SyDNVzdky0I/PhW+zdjSrPLSQpYGCCHpqzpxzguoDQEKNKMxDxy5xvk4kO4or1ycmYL1Pf6ZAUM
 1p6vfKFnAzLXavcQeZr7TA0R+JbD8MmUYFmeHl2CZvS0EEqY0ZpsrnPwfJqqZaYZfMSbIxoBVQG
 VQyc6bq7hBurkWXEbsTwMRVNQMr79p+ZhO2C+H50cBn2tAO7SP3Zh9z2+L8wrIwanki7FfpMGG5
 09y3+myk6/6ZgsYFSCbIj8vBfmgkLf7F/iwuF25GvYfIdjQYHTr0qsL+wcuL16gM5Qy8ThW3M3R
 DInDKtXOcClEX/llY15ifpnUJg62E3XS+e/OOT6fjIAQVG3lcVHgtGbvg79dbPtrvytvPGSJOJI
 KcXsf+SsmJ8TAaKzygWxRZ+b0XGzNd4edOzUBJby9m9Cb+vTaVJSNBiOElRY9YrOkwHNAoxMcfX
 E5RdUImobG/DfCu4lqA==
X-Proofpoint-GUID: 40bCvPiYB_qYVwLMIeFfm9iHfKecHkMR
X-Authority-Analysis: v=2.4 cv=du/rzVg4 c=1 sm=1 tr=0 ts=6a040af9 cx=c_pps
 a=5+LGht9gDMVyy/gYI/Qwww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=3tcz3bTJAAAA:8
 a=t7CeM3EgAAAA:8 a=_XbGDX9CfFHujiUbNUQA:9 a=4EbjBm0RLgFgoQzmu6QD:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: YsVFPDuZk82ccHH61PTHJ1-V9sVuu-UQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 05:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236926

From: Chen Qi <Qi.Chen@windriver.com>

For openssh, 10.3p1 -> 10.3p2 is a stable upgrade.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index a050475532..394b4c2884 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -27,6 +27,9 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
+STABLE_VERSION = "${@d.getVar('PV').split('p')[0].replace('.', '\.')}"
+UPSTREAM_STABLE_RELEASE_REGEX = "^${STABLE_VERSION}p\d+$"
+
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
 # This CVE is specific to OpenSSH server, as used in Fedora and Red Hat Enterprise Linux 7
-- 
2.34.1


