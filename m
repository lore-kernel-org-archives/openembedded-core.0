Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD18CD343B
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 06:20:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6088.1778134836861146559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 23:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZlJp7hBK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9587885fd3=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475n4xp3049597
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 06:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=nhpAtK6KlSt3E3Cy5MDXDjJ6a9TFgfmsP+1yMIX39yk=; b=
	ZlJp7hBKvgBxKwdjTrBxjSSB8IbKp2IB4zmP6KNzgLwUJVLgWnLgiu0anYXNwqm7
	/l8v5g9ErXguef1ynaZ25/epwmQH1OXGXHb0Tf76OAq/frMTmPR0nkpu5kC+zLPl
	xFEB8/LC4MDe4IMQX06UfRoi/Lydnab2imBIxQkZfMQYjlInjMF9G1reRJ8FIe83
	K64gtl48IUuZGLVsgl+IBWOZyNpHG7EVgqLMrvCmQyVlo5FIB0YKfslMmF+8MuwC
	VrV9QPOmiDIvSNxF6yiJhoT1UjOJjH6vPnu3lbDRTEUlQgWBQMZiYBDFHsEbDic8
	fGsYE1Og81Omdvo6s8yTwA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013001.outbound.protection.outlook.com [40.93.201.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8pu64qs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 06:20:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yd2e1GFMro/DwKNnaH8ijQC7mC6jslOG/M2ZwPam6PqyqhqJVwnFdtfaUPzDrZP6gYiQcVYzU7NnqBGYXfrcTmktnq8YoBqJ3QhoWx4F4MXI5ARvaGBmrGuJMN9hB9naauZVEsGJvXsALktJC6HNt9H6XE0MQjNBSY6lKY5htJqwWngVv+AbEIjQ+vV4ik8J7Epns01jqd52eA7u0I8Z4yvK7k1dG+LNmTLQpBG8eAWB1yOej2Z4189USD3qQNyfXY8YWx8AeKpFeIZ3ze5NHv2jrhxmR0+S5a1pYKV8Q8IQeNk+qUxJPGpeWjA5kQP2YBGd5Iuj8sZYrUUuMNnvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhpAtK6KlSt3E3Cy5MDXDjJ6a9TFgfmsP+1yMIX39yk=;
 b=WqZSflrESJdumUEJ+iw2neW6S0pOJx7zQvPU/CiTFK2eRhlxbyzcQ2kbFc4PwJVxHQLGtMy/SZRmpi3T8+3FwEo77+9ICEjLukCNXEi2I4mQ6amqvlTDSWSIeU8LaBwPt7XkwdFU54uaivf6sSzepGjf6xQ+bdv/Dd3TLruWB+2a3S7MhmX8mPqfxo3fyXFU8wsJUZxgd1a2/9ZcFhsjSwC3vOG1+MkmyByewMBOxNo6JjM1cT4OQAgIQ0gJCWrX8OoeYywqBAfynULGCtJMoyUv82RFczfKncDyRBEkIwkqlqvss/RgjZJoRi92FUaU7ptqcICdRdmYV/OjJGKKIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB8764.namprd11.prod.outlook.com (2603:10b6:8:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 06:20:32 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 06:20:32 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V2 4/4] openssh: set UPSTREAM_STABLE_RELEASE_REGEX
Date: Thu,  7 May 2026 14:20:10 +0800
Message-Id: <20260507062010.1461027-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062010.1461027-1-Qi.Chen@windriver.com>
References: <20260507062010.1461027-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::9) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e36a467-3da6-457c-4c1c-08deac00bddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014|18002099003|22082099003|56012099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	Gx2MxeothHOnUhwVL2nYUUnPosBo/aNVHwbWlHHvoxjwkX+gEoFBLhACLSjqJNuUz+bSFtR3L3DDQrPw6E7PJr1nVjFHMKjSH2TygRmAzKU4FsFnOHufsDCdpXe7baZL4FMhxTIKqWDbRUMMDbZm88nUiVbPm0k+vvJi6uaKDjSTUr1txGSAx6wRh3KwPvCAAqg1yzgF1Bp3us1oufAEtxP7Y+DSLfF7nYXqj3Qj1Vb2qYKecF2SzNuwobJmcWAm1hqzwu/Vuvu6zSfC38cYBKL4E8YbS+f4de+o0LexH0Wo0yVRK6xJ7xhtNYAzP94AAc1EYRqxVXfuAxVHBuIP63Gsl2o36r13XtL6wp48/yoDnwoZXepqcohMGuS2DdudDDJapbVicfyUHdp5/gYNmpmxxhFmUFg7UTtej6UaZ66f7zXlGhhugFZKhhy5ikBnmTSAcLe6Pd4JCyCnTEmI+dh7oG+f4x7tlYLjkfruPAd9LDUAdDyq04MCvMpff+DS2lg4WuBHk0AIelbfa22xQY/+H9HrbojNr+MPVqSW9086pJD7j6PEGcdvVI0ofXUuhCdf5Y5tjWwrVRN+1Yt669WHe56YGmk5JzNH0VxiR218fHbpu428ZNk+JcFp274F/HOZhSK7vOyVITgucygxvxCsf4I3ZCHbhli36nFLjvU15JnlszEmCrBtrTzM6FstHyMAW2yk/kdwqpNywJIAODqXhjCBxzVcKNH+vjCId0OJqt9dHzSl39VbnfF4jHhq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014)(18002099003)(22082099003)(56012099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vyaEGIZQbK+sZRNXMaeOZ0Q1Gzwn1rvx0gvlkggskkRYipZNxahrZbdpeN5O?=
 =?us-ascii?Q?mnMQgZ/M4C2Kqo/JykVAvxW6oie3TFyOe3rPMPndl8ztxTIpJLyAPpkBoXDK?=
 =?us-ascii?Q?2nYUc7S8sLpcaAnMh1C5jC+uMc9EAXfY/8SROPy2m2AdFwQJ2KnbK2aVohiK?=
 =?us-ascii?Q?3WcWO+nW7Kera16+d6MhHyj6MvemsWCsHNcMTDKFEI3CknhNwApy5lzv5RR+?=
 =?us-ascii?Q?Hu8Ekr9IG/RhT1VSOUAjSeLdHiEsV7Nd+u7n135PD63s1RR1HWoPGf/p7lAe?=
 =?us-ascii?Q?v8Et++5wC3jJLtjG1P7/ISEbPNWzL43bQwBRc88xt+16j2TbScjdVO3xrDq8?=
 =?us-ascii?Q?X1SCPkBrme6RDU0rWtmTIzTiKoylFpY0s7WJOaLainKqM29uEDdcVSWEX1nF?=
 =?us-ascii?Q?t8b2SdgikZsPuNcHL8p1I4Q/SdOxF5c3OvBnAAawoN+L+TeHE81HzidG/faa?=
 =?us-ascii?Q?cF2J/+UL4Jrl0iP4gQe1zWvqVp/dhRJOMCc4U6+dy7o7dSdI1fndPNAZuXwO?=
 =?us-ascii?Q?ZyXOGNXzdSC0lOymHgFKogKwqLanrUC5s53kyInjd3SM14vFUimj+sOt280A?=
 =?us-ascii?Q?YzZUiE9H+3vD4ngT8sCtoQxswoK9icrNCNTrUrimo3LjXHqcJ119xQR21XDJ?=
 =?us-ascii?Q?6UWgRyjWoejEzcs8tXp9AKeOcO/E5VRFhYZd9UunLsLXnt+30PIm2bF6S7Xr?=
 =?us-ascii?Q?d9QzCV85QhDCXk9Uh56aIJH0zWWIH70apYqaWE0gQxB7P67wtTJFNqe8tE5M?=
 =?us-ascii?Q?Lwn9JsFfwXaw9umfd6y4aVrkyD6TfKLyHSPRVVut25a80JXvGeCagQnO22d7?=
 =?us-ascii?Q?EIEu3guBm2CKRraUUQP9t0aAYAs5TZYlneLCQtB6j8YvfozlSSqa2Jxk+Qcu?=
 =?us-ascii?Q?B8tCMJMuBge4L5RcBdwmKpTjtkAzdToIu019AAVnqWcBnEl0rRVfdFOymlWl?=
 =?us-ascii?Q?v9ocWaMkm/nwBHDabPlcy1Hn3g6KgTMxzxfGhAATyHF5MSo/tFitwGwdsNtb?=
 =?us-ascii?Q?rwkLlNz1TBfKdj3Fihgh1A/bw97CnLyiaNWr9iCd4D6KCfUQtT/vWbee5bQV?=
 =?us-ascii?Q?yT1M095S6Qa6clG0cJmh3t+YcGkxsZOiP1WzaxECIP/Gijfu27oCwTfmbZAL?=
 =?us-ascii?Q?VJ9zBwZWhC0f10T6QEu5vPtkqJDviRaOOGMfYSkHOdNrmRTrpWoL3AJ/sosE?=
 =?us-ascii?Q?8pbwyptf/3qgnIic/I6ZCeJCvvRZh7y/povMCIwZksnh8/QdUfoQpgqTjAPa?=
 =?us-ascii?Q?dK8BuZzr3rJD7a8wbuecF7JPxRyQ0nHOXApiDOurEZKRMu3xVD/LpUiL2nUd?=
 =?us-ascii?Q?GyHwGszRXG9n3EspmWKiqF8bxl7VqehMIwnYcYW0hgg3o+wNf+QF/N/x77a/?=
 =?us-ascii?Q?vO9vhPy8ML5ktONTkZHPUPhoMYn53z+UT9PYzZkGKYu+02KC53TNw4QuRuBm?=
 =?us-ascii?Q?OyHPxBM3TvMzmG3xOgani7/DICpwb9x07WweBU9It8SKIrhDBHRQIRb9y/xv?=
 =?us-ascii?Q?dEI3YhyDPWM4UYgvsKSDor0yI6Z7za0POQP7ISrfCuxW7Yrow2h7wmDGr+pP?=
 =?us-ascii?Q?//sCNEStqG93yP4q7h9SliZtO7nOMZaI01s5yoYYHtVwI586gFZBVApZgF+p?=
 =?us-ascii?Q?KB99xf/ykCrx14tbttuu+/c84W5xzX+gms+zHzFQQe7v5bhlJcMsz86GtBTE?=
 =?us-ascii?Q?1hz2i7yzp8gk3pgKdcVyIeOjWSsgV2Kd/4qGWgy7buH4Gi7mTMJJAzBs+wdx?=
 =?us-ascii?Q?uZgNly4DlA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	Q83SeyXtiTn3iT9pQ2sXecLJ17D9C6dvf2Qko/HLZdtQ9VKFLIg3xVDzxFd625rAoASSKeYwBc2wwG+/a81f7I0C/VTa1njpd0jxofGFYIU0Nw8Vvsy0YKPNnvYZyiXomsW4Hd95fmhrpwF+ZnPuFO16eoNfroPTnrSXttMClaAgrQq8yXQ0Xt7Zl8F8m2pz7zb9MmlDzDGfKb1HthXt8jI+fj/pGlgJMSOZFD/McwVYwJ1j8gTtskwWWqnjKubG02EKKTY5RlwolVYes4rn81GygBKHEC5RsiMh7n69MNdq0OGvK2OlkdPDiMupE6dLvO7cGYeEXF+4VXWJOSiIMQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e36a467-3da6-457c-4c1c-08deac00bddc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 06:20:32.0732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/pRAWaAskTyh/qsWUYj/jodLNslQ0mapmDYldRHvpbnOHuEhgf8wF8MOY+uPf4KfoKLaG0EKeKYTq6hykVggQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8764
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AdaB2XXG c=1 sm=1 tr=0 ts=69fc2f33 cx=c_pps
 a=/vFeFcp+ixIfR90aQz5jMA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=3tcz3bTJAAAA:8
 a=t7CeM3EgAAAA:8 a=_XbGDX9CfFHujiUbNUQA:9 a=4EbjBm0RLgFgoQzmu6QD:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1OCBTYWx0ZWRfX/9ZLMByPuuv1
 2urjsb4iL6bjeMlo60R+mBc4/8M1tNda2VhsL8AO4CpE56x0i8thQcI7Kpqcdu5X856D3xXM/Cl
 tO4GvJEsyVA7P+n6QnTAmIOdoF/NG/AuTeu16gC91sk1zI4NvxQqGGBDTYjbe48d38fk5fOcjGD
 wi9rgrdabpWqNe+B+32T7x7jpa3TVsFB0z2Ke9/G6oGPftjq8guW1CTUmxR79URMo2O/pgJXRbD
 6NRWxNHZIGSb53m5pWGDbJTwXQMSY5oZmHZlpj7pe16DKuKQ2k7jVTPLGQwCzT2dQJOAHU4NWMS
 P+1f99oLztC4y9ThjKcUitFQScThAbb5HOKFbEB+bXBiiu6JsvYMby6H85JpAeYhVj3mwnO7dPg
 U9SiHYle8Ieq4/WG1xVrLMGGMp0m22gTESi6T0GL19lk2vj6YeLlDxV5PneVsfvdLt3cp34iHhf
 5PgT7K1EBShe/arTLXg==
X-Proofpoint-ORIG-GUID: 4CLdnusKNmY_TQU-pIXklfcv52epZjcz
X-Proofpoint-GUID: wNeHW7mtWEdO9OBZ8h3DRO6O1kGbL7sr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 06:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236564

From: Chen Qi <Qi.Chen@windriver.com>

For openssh, 10.3p1 -> 10.3p2 is a stable upgrade.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index a050475532..38c3ef0214 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -27,6 +27,9 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
+MAJMIN_VERSION = "${@d.getVar('PV').split('p')[0].replace('.', '\.')}"
+UPSTREAM_STABLE_RELEASE_REGEX = "${MAJMIN_VERSION}p\d"
+
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
 # This CVE is specific to OpenSSH server, as used in Fedora and Red Hat Enterprise Linux 7
-- 
2.34.1


