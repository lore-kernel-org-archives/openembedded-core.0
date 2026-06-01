Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DA3CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 20:00:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8373.1780343992886367838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 12:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CkDymEsn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06123b62e6=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651GxSlL3668980
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jun 2026 19:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=KEXVCoC7BzpDOwyRpPofpbTKAETKjnOK2LXKCPWV7B0=; b=CkDymEsnCLhi
	jZKUNmVop+uIHKuRYNnKLRpqdv9BCtfyZ/fpGCnjR7izEo1obEoD+JcNKrTPEhB5
	MuVfOSuOt/FZQh3k1X9OPReCl+uz1hgptAFJO3YzfA/EHxlCQLGnaJPWM9svV2/a
	NyQxiAVoiIcIpcO8cEwkS4/BB+4p5zz5PkGJOknJEZL5bnYrhujPfw5MIF64iWIX
	UbL20UpnYCdLAFXLva07bQwh2o0NG/J6EyoxfWSTGqo9MJCuOynT0JL6Nkw1ixqe
	rrI7t/VbdYowSJLXm32SoM/dOkcgtJvcToxKo4A74tfbNIeDHan7r9FsI8TmdIjg
	Od3Q3WAURw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010002.outbound.protection.outlook.com [52.101.56.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efpv8bmdt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 19:59:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1FRHDr3cCofot88E8LwNqwb0ZrLvFRaHTS3BpR65PvQpQ3+mVO0lSZFQxmO2qQcES7krOQHvUTdKVpAFFZkfS8flEF5vEwUv56Dns8Knq8Ry4tzpF+xfTovTeXjF1Qav/nLWH02Xr5gNAf0PueH7my9E4BtaS2OnHCUuSRvvNl7lrNuo2CDIEPRu8IQ7PIMKasr7w4DZda6sF8AhGBgp8JKD2XAMvBta8jQ1HkNGqg9h0t6Yaxo+erZiT5UzsWdmy+IYUt5799G+0adcM62sxPEXY3EIEQs9nRn3IRkKSQs4lo9MOekP3dyENwbgYImRZp3bv5Sayv11j+pLmd6+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEXVCoC7BzpDOwyRpPofpbTKAETKjnOK2LXKCPWV7B0=;
 b=g8gZVQsiHl7ki2pUSqsXNacc4jPUa0qLtLW/fyBRgIrVpdfrDQUZdA0otkycO3kr6ECwdAFjCPd9F8Of8dUKowlZRZKE0tKDsjHGdezlHYSqnT1mD8eeNrW3DvmAUi9eRf4o1A7FDJQLN2C5pFa28yJHwCDZ58VMXZXwGhZPXCpbRclhaeFPc7UhuzlzsCwICnz2N8qHsTKEaUkFkz0vqjqCosqr3x+1ENnHF6Lx3R5R+xWpFeKYcn3UCX119vUdMLzTbnGRFRehav+07m9shyVqDsbGCK3zyz0hy2zIQfFTrEm9Tw4S+qWIAnbYZB7K2I/F9xlmOWsI2NwbiTDJeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by SJ5PPF8F93806F5.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::845) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Mon, 1 Jun 2026
 19:59:49 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.21.0071.010; Mon, 1 Jun 2026
 19:59:49 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6][wrynose] cups: fix CVE-2026-34980
Date: Tue,  2 Jun 2026 01:27:58 +0530
Message-Id: <20260601195801.4008899-4-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260601195801.4008899-1-Abhishek.Bachiphale@windriver.com>
References: <20260601195801.4008899-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::18) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|SJ5PPF8F93806F5:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e34df3-633f-4e24-cbe1-08dec0185668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|11063799006|3023799007|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	pEgbcJDfa/EyBgplpsznUWPKy4Jcg0iBatwYYzEsrnnFffw9f1b5jUQ9zE3dl6aEBfBqK4HZCnHKe9yMR9oyvoQB/bojEvSkwkue+AUtCL/sBlrNVVEoQSf9yl2HEtvUU2rytyscWF+KEh0w3aZJDkQ+ngmix2nnF5kd7uwsEuGKGD59vidUFsgpOgmUZvXHishrGh1cJS5lOLP3P8u75pPdxKK7g1pX42DbS49fEYlPSuBiC5i4o68fqM91+GIj1DwWiLO7Uf5eyOKWdQUXuDRyzmQOqHJ7f6xOjzH+mBRVEiqrolZNv0LNIiAV+oKHzwIcPMax/W2PgoJXCyPrReg2IryvekERfXdxG6KzKrgsA7qvHrtpZur8edhMPoyAwvnkegXwXtloHj40UL1pPolIrv3UtfeP5rbAWmbuUukyL32CSrIy0+c8Y2WJQTju9w9fjP7RRlVn1MU+pdlc6AvJrZhQp08P7lRYa5VXRjykcl3vSJOZ/t9i9y0bCjNwEnAzuBR3TYE1/szLdRl/6AaoXGYkDchBit+iiM3d5yXIC+aBylY6l5n0Io872os4k8kYDAdWKwudsRpqCuIXfhWxbGdN8tvfJo8SAIgLmm/vs4Nbo7TkOSR35pXZM+wgVeub0DQyhA9h2160qn7vF4yRHf8TfHAyk8JHR2n8vf2gtfLxL6RU+AJ6zXdg3J8hNb2WcohZmQLhdTt/YJzyKAC/ey/7O7sL0f1u8ZglQJ/xy+bmLy7VGHFvUG/vMrjF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZBdxrK9eMby3waQgtL03PFpyusnS+zEjV3ysYK5sPwikosFKnPDVN+vps7TL?=
 =?us-ascii?Q?kfcTxRFQf2MNVPQzjkDug3kdSrccQ7R5W3zBFgJZunauQ+jHSansQe+T93yr?=
 =?us-ascii?Q?6dgz32qCQC8NZKv6V9d+LCMYMjntzXn/X9tFDyEqCgQ32QtQwMaC68pOWzRg?=
 =?us-ascii?Q?T3e9pNa0K+FamATtznH3TJjaOfMR2t+xzZ6/FPhUGJD5qIx8u8Ho/BihA6l1?=
 =?us-ascii?Q?3TBZV6pqmUIxhAn0cAykTc6Zqh33XqC1Fhs8vb1D+7OIDenYLbBSj84rosqF?=
 =?us-ascii?Q?AiU5jvnVVMkQOmhCtQXoPSxxv6Xg9XzANJqzVP2XJrQsD5UgVy9Qhcoi9X1b?=
 =?us-ascii?Q?00C7LpjUQ4KvYvLCdyxiH5ay1+E4baUDC/mlphwZXvwddavH73HfrooPQIIK?=
 =?us-ascii?Q?aWgZermi6shknjQ+2ZQAMXR7cMPySnvK6HPog15eUYe5Fv5bst24SvuYSwj/?=
 =?us-ascii?Q?kmd6sLREyhcYt93SvXj7Iv2zHgMZ3g4KS4n68+f/CXvva/dFOw1BEJs9eS0Q?=
 =?us-ascii?Q?kL42HXqLmXq35QXGd8qrl6pnURFCRKMmI/amQ5KTKCZ/jtf7+2N1VUIbdPPg?=
 =?us-ascii?Q?IGgytfbF2w5zDPnKAnM53b+AnbxMB1Yt4CPqK91/adJ0gW6XDu6w3tb1Y2Vr?=
 =?us-ascii?Q?KdHoJ92yDIpvlNyrGqNcgt3Ea54cUQ8bpREJY/GwfrI2uRsrsPmjzHcxqu2F?=
 =?us-ascii?Q?MXIu/fHnEaqXpWjXWcr/ZgpGPL5JvluazE+V/2rA8ubDCYy4ZPgLvKtstZ+q?=
 =?us-ascii?Q?XwIf0tjNrBdW6aQzmZMQkKBCa/EDoMMdOuR+sx2SEoeleHIEg6i+41yIN1o+?=
 =?us-ascii?Q?zqSf6VYoSd7iWE2WxQBYQEZppXYBwnai7JNtGZW4tSxrEWqLDTQMZ9AbiFTo?=
 =?us-ascii?Q?Xyy9B6czLs9OksijPDRoIM3kgh7qv9zgYJF6wai9IaBXOneHbrzPu9t6LeiM?=
 =?us-ascii?Q?lHFa7JltZtVvdg96GerpLN7X0iqIxn+EJEXeibfzhNlecEVtxVH0INjNPajp?=
 =?us-ascii?Q?IR0cPYsmnfacRhB3qZp1xwGprlU8nLEk+RF3fgCaKwxTCGY6kw858zCMTkrU?=
 =?us-ascii?Q?4Kr9bRl4q7xcUA1v/FrCswFyfy2Ub6GeILhTCjE91OmGHRLjuKxcRYwS6jSj?=
 =?us-ascii?Q?4Kop+dp1l1ABFpjDcs22ChnTaOiakA8l3aLdxfLxHp1sYf+9yb3X2vuFYQSX?=
 =?us-ascii?Q?Aaf7fGjKEbM/yZqTUiqUez5faRxxokkspspdtXp3oX802ih9u9jtdj3AF4ct?=
 =?us-ascii?Q?I52nQajaMTDt7wDOz/PqNcqJALMeW+NUH0nK1Yllpy+2PkpFFiUC6IupASne?=
 =?us-ascii?Q?TuS5aThXt5qzgpIEndO0tdLyve/T1TQoYB9swkFjF6EoU8aJQ3vSccwS4KVS?=
 =?us-ascii?Q?e0gBYDPRTNGPz8FS+8HiWYVhOg8FZda+w3FvIbzUcSy/YMmE9CtxQe2HvL8i?=
 =?us-ascii?Q?4boXf/sHt7QLQWyaK7GsO5kLlkaFjJvDWlg478C6QknOrnVnN8YUrWcS5gD0?=
 =?us-ascii?Q?jjMlgZvpnehUDcNQxVItyhOwJKLyeZTMVVoVu5kJxSuIbJgkolcY4U0f2p8E?=
 =?us-ascii?Q?RbtVmOo6/Ab8it7KxzxAMhEc0ucnDD3fopGaR1X0cuRp2ictol4barxt7PGg?=
 =?us-ascii?Q?32jpA1cSoGfYhYC7kHldVkSghyx91NF2KBpg9xnVid81I71LkDa0m5AUDuH0?=
 =?us-ascii?Q?irFkwVUUNCsUbNjKdfo2gy9+09VtZbjDtcnp7WZdVNkuhxUVNDoN7NxYsGxV?=
 =?us-ascii?Q?uYRnM8QonnS6M9kduJfxWKDFxFCWxr1RqwAejItBHP40+sv8XJtF?=
X-Exchange-RoutingPolicyChecked: 
	LnYLtYTD+oG7r+VV3b7AbR2fIwkIliMiyXBiMgbNHyo0Mf1SNBf8UBNAXmxIahuQhm7pSMtVu+AilIY+njMuGJlmD+DdF8vuWwVx5K7X7h2m7a4Pte9S1mTEtXzS9MrxK1kAsAWxul+9/W/CjmAAduIJLJtsEq3hUMo3PeUIcSsqT5WullrH4EcFKANk6SvO/dHWNAyXZam0OnOk340RUD511NbaX7PGJUE9BweFNOYqiVg7OU1/JKS2wH+5jj6UXke1vDRbx+7+izHYBElNzpzupjiicyzjMLc1XiaIzg1ISRqwqyPLCmhwRcISjto+s5QxNBxf+/SOcnR/MJ9Xgw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e34df3-633f-4e24-cbe1-08dec0185668
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 19:59:49.6809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsQKFPHfLNpfdQLLX683pnG3LK8vu2RBMlfk2MDB30WQZ+F9J9SOzXfUbLleUUJxJ9GCL3hsusEeC/WH9UznUfpWph8C6kAGS/Eqmd6mbVFH+eQetboiwi0tlTDyspR3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8F93806F5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE5NSBTYWx0ZWRfX5tz6BTm0shsg
 TmmDtzQY/w1ZbjxRqok9Lua/wRCXGl02nYmfVkTK59U69oAZk6MbJpvKw33rM/q2JCnXGJ4kR3z
 mV8zSF4m0hZPzWxIBtELh1HpTNktT3Tia0fG7KdLYIUoYW7C/GWmzEe4fs/ThBlX7KcojWJeOFe
 xAY8rGu/+c5wRt0ymwzES0w6PJQ51qAQ0ITnYVxsTX7cN6kWWW5Xhvttx35TD+2aAEGhLFjD1Wd
 6EJMo69nqvIqzglk2sx4ZCfMB3crLUEpLocqXgWv4eNQomCuBjiXyRbqxOjFbmZwTklndXDF9aG
 ORk0AA7NpSaxxl860+yYtAKbEmAK9mM3KJmJiJc5feF4akkF3qtlsSe6PpDNBNjfB0pJSigEZHK
 LZ4WMTPGtuQoYv3h3z06inemdFMnVocf509xU5G1TbwOL2VTILPSarzY6IPbfKyRqapAV4zrvyl
 4bAwJakFeXb5MQXxmJw==
X-Authority-Analysis: v=2.4 cv=Opt/DS/t c=1 sm=1 tr=0 ts=6a1de4b7 cx=c_pps
 a=l7cXxZGRKbMfBYROU17HtA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=F_ubicZDAAAA:20
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=aTVoPYTGAAAA:8 a=LyxU_5k5JVd1Fy2Yv-wA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=rKT3Ez47ESLuxQAP_tCa:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: RTfr2HX37OOjydovUwFZU_8PYa0o9ZDD
X-Proofpoint-ORIG-GUID: RTfr2HX37OOjydovUwFZU_8PYa0o9ZDD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010195
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 20:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237991

In CUPS versions 2.4.16 and prior, a network-exposed cupsd
with a shared target queue allows an unauthorized client
to send a Print-Job without authentication. The server
accepts a page-border value supplied as textWithoutLanguage,
preserves an embedded newline through option escaping and
reparse, and then reparses the resulting second-line PPD
text as a trusted scheduler control record. A follow-up
raw print job can therefore make the server execute an
attacker-chosen existing binary (e.g., /usr/bin/vim) as lp.

Apply upstream fix to prevent newline injection and
unauthorized execution in shared PostScript queues.

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-34980.patch            | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34980.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 78e0495d1c..f23411f44b 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -17,6 +17,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://cups-volatiles.conf \
            file://CVE-2026-34978.patch \
            file://CVE-2026-34979.patch \
+           file://CVE-2026-34980.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34980.patch b/meta/recipes-extended/cups/cups/CVE-2026-34980.patch
new file mode 100644
index 0000000000..ebf7a3a353
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34980.patch
@@ -0,0 +1,88 @@
+From 8d0f51cac24cb5bf949c5b6a221e51a150d982e3 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:45:13 -0400
+Subject: [PATCH] Filter out control characters from option values.
+
+OpenPrinting CUPS is an open source printing system for Linux and other
+Unix-like operating systems. In versions 2.4.16 and prior, in a
+network-exposed cupsd with a shared target queue, an unauthorized client
+can send a Print-Job to that shared PostScript queue without
+authentication. The server accepts a page-border value supplied as
+textWithoutLanguage, preserves an embedded newline through option
+escaping and reparse, and then reparses the resulting second-line PPD:
+text as a trusted scheduler control record. A follow-up raw print job
+can therefore make the server execute an attacker-chosen existing binary
+such as /usr/bin/vim as lp.
+
+CVE: CVE-2026-34980
+
+Upstream-Status: Backport [ https://github.com/OpenPrinting/cups/commit/8d0f51cac24cb5bf949c5b6a221e51a150d982e3 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ scheduler/job.c | 41 +++++++++++++++++++++++++++++++++++------
+ 1 file changed, 37 insertions(+), 6 deletions(-)
+
+diff --git a/scheduler/job.c b/scheduler/job.c
+index 1fef9d0cd..af6390687 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -4118,9 +4118,21 @@ get_options(cupsd_job_t *job,		/* I - Job */
+ 	  case IPP_TAG_URI :
+ 	      for (valptr = attr->values[i].string.text; *valptr;)
+ 	      {
+-	        if (strchr(" \t\n\\\'\"", *valptr))
+-		  *optptr++ = '\\';
+-		*optptr++ = *valptr++;
++	       /*
++	        * Convert tabs and newlines to spaces, filter out control chars,
++	        * and escape \, ', and ".
++	        */
++
++	        if (isspace(*valptr & 255))
++	        {
++	          *optptr++ = ' ';
++	        }
++	        else if ((*valptr & 255) >= ' ' && *valptr != 0x7f)
++	        {
++	          if (strchr("\\\'\"", *valptr))
++		    *optptr++ = '\\';
++		  *optptr++ = *valptr++;
++		}
+ 	      }
+ 
+ 	      *optptr = '\0';
+@@ -5395,13 +5407,30 @@ update_job(cupsd_job_t *job)		/* I - Job to check */
+     else if (loglevel == CUPSD_LOG_PPD)
+     {
+      /*
+-      * Set attribute(s)...
++      * Set PPD keyword(s)/value(s)...
+       */
+ 
++      int		i,		/* Looping var */
++			num_keywords;	/* Number of keywords */
++      cups_option_t	*keywords,	/* Keywords */
++			*keyword;	/* Current keyword */
++
+       cupsdLogJob(job, CUPSD_LOG_DEBUG, "PPD: %s", message);
+ 
+-      job->num_keywords = cupsParseOptions(message, job->num_keywords,
+-                                           &job->keywords);
++      keywords     = NULL;
++      num_keywords = cupsParseOptions(message, 0, &keywords);
++
++      for (i = 0, keyword = keywords; i < num_keywords; i ++)
++      {
++       /*
++        * Filter out "special" PPD keywords...
++        */
++
++        if (strcmp(keyword->name, "cupsFilter") && strcmp(keyword->name, "cupsFilter2") && strcmp(keyword->name, "cupsFinishingTemplate") && strcmp(keyword->name, "cupsIPPFinishings") && strcmp(keyword->name, "cupsIPPReason") && strcmp(keyword->name, "cupsMarkerName") && strcmp(keyword->name, "cupsMaxSize") && strncmp(keyword->name, "cupsMediaQualifier", 18) && strcmp(keyword->name, "cupsMinSize") && strcmp(keyword->name, "cupsPageSizeCategory") && strcmp(keyword->name, "cupsPortMonitor") && strcmp(keyword->name, "cupsPreFilter") && strcmp(keyword->name, "cupsPrintQuality") && strcmp(keyword->name, "APPrinterPreset"))
++          job->num_keywords = cupsAddOption(keyword->name, keyword->value, job->num_keywords, &job->keywords);
++      }
++
++      cupsFreeOptions(num_keywords, keywords);
+     }
+     else
+     {
-- 
2.40.0


