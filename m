Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21E1FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:41:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11372.1777376487450661280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 04:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=hrJR0pLl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95788289a8=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA3gS23814829
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 11:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=mlDYVjxhc/Jq3xwZT310
	nOfZTewhdzHyVCzJZRO29QY=; b=hrJR0pLla0omahPO2kJgajJnWc07NOYjZWer
	14/H4edeh9gnO6dN11j5GVp9CH0Jf0tq3VuMJiXBF8vq6W3FHOSRCpMPvCmqOZFe
	U4eZhUMO6v3R8PlH9Vz7iPSlfCJViYtg2IEyslpCL7aHK7lAYW4Qllspb1wGL1xE
	YDDf8hB/kDMsdfjfhUk28NhhLad/ZcAQP3j6i8dh8crQNvGeE3Z0pTjsORoKNpJV
	3W0vLEWKgGAH6KmJWfCvPM5tR8itwDxyJU2wDLEfhL40yMULVg3iv0kB1DjbFHR6
	Tqdrqxb/smljdVGB+anKgT4/QZwnF+yUU/2qBz7sOreVhAtV6w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010063.outbound.protection.outlook.com [52.101.46.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drmk6ubm9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 11:41:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeYtDW/ePXcL384sCzXk4OmJZI0rPBrbiMMxuaXzbDndFJV71zSdlC4ttcuQwyXudFCAR0+35MkiA+Ym75+/8alsKe48y5AkfCUG5r7R1cypBab4LEU0Pl/9ocY4BQb+YtHM8+W33Pfl1gZpC7pwF8ljzqTfTJSTUthr0UTYARXE6aYAUdlBuAz6t6EG4GM0A3s+48meHUd93uCX9dZ6z06exiQ2Ke67cErx6s4ZpzrwjrYOsdigjZkzV2ni1bQXP+K7wI13ytPdFNUCuQ9dlujGORuylQbqxSzQjoZP2QEU/xK+NBeYFfZYUcuQc7w2VQZf2yVsNL+bccQTfWWMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlDYVjxhc/Jq3xwZT310nOfZTewhdzHyVCzJZRO29QY=;
 b=c95G6ANoh3tomPQga+LN+lS7wuOXnqvCzUgn6QhgEceV/AuFXRt3C29nO007Voe8o0QRrXrc72hpgUQRVPyPd2HhWniVIAbBKiYQYjO68gRDBqPQpndH121O3WoyLMj6UB29S0w8H0EpjEcsuskgAhj5tu0Gh8ny214pQWACy2gs/0Gs4NxQZugF8Xew3pRTcPUfgxtWgmTheA3+FCvG1A1fxRFTzIqQ0yk6GG7sxBp2o0hYYP5PGxVETmtB86bVhzWSh+pgfr3yungdiRZ84X0D5KpZj/gRIJsuPIrTpZavRfiQ1r/RLOMs9Ncdoj6LWhHc9CbizDQaGO48VdOdFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by DSVPR11MB9889.namprd11.prod.outlook.com (2603:10b6:8:45d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 11:41:23 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 11:41:23 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] cups: fix CVE-2026-27447
Date: Tue, 28 Apr 2026 17:10:53 +0530
Message-Id: <20260428114053.3136319-1-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=yes
X-ClientProxiedBy: TYCP286CA0364.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::8) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|DSVPR11MB9889:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bfe88ca-f92c-48ae-75c4-08dea51b12c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|56012099003|18002099003|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	/elmdi1t4ZDdUl2WlUxpwTj3HtQlguRY0sNqMdOM4q1V8aujE3uimKMDrkeM4ijlEmaqCwfmyLn7BC53/34mT5bKIAQ+URP4oPZFM549UVd1wnV7yKQRBRepYlCwH7Oscy1ux/q1tafqYz8khyvPUF8ka65A2oPfSpDa3qxviSrvMzp+jeNmzNqMLPasP5TN3q/KD658z/2wVPxbr8K0kacVt48vh9BRulyZaZEX+qKIP0v0WzorldPfBCVreg4SPlPfHqLfoyCpn6JR0woinakyoOHpOy2LWAScCRoQOggpW1CQ9D0MR24KhmLUaaujk/pDmiJhLbrAeeZ9LK+qxA8utDB3+kWahHbp2nKAqoRhpS3fsHOYqto8M+GSoRu81JjvHpCyhPgEMkH2/W6m9cWOKIYYKpkxRCnPYaQLFkMuufLscWjCJFmDktYWRmzE0y7F9hboFAR67kU/lHQAEmiNsJ97nesub4KuETJK8WdkDN3BGqHhgnsTuRHz/YAN6yw44CyF0jxZpKArF8aur0xkGWi3ZE6PObz82xL9HMYEFpWN6iK1Tw0eF6NvyLCCm+3pr3wvA16rh9dvDzbYcqIp2wXnXSvrsdXyOBumGPROhQI1ac5ewG5fD8kYuYqkXzCKAk9YNp/F6u7sGs9LVS8ikbLrHIa4hcuxDUrq2gs3BqpQVcbksYAv2ZdD+mGEGX2IFplxnZBmre4bu7mOwCelOLfslMDDFO0SZ66cFOGzESpcUawVJX6cL86dI0IOUSm3ReZk3bwrH0OTPqwson3CUW9Mi34fiHDwKLH9AcqMYcX9sy3CNVBYhFtvyFux
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(56012099003)(18002099003)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DP70XlhAZdc8I6Y8ZRlNmKF2QYZo7bNIv+SzEC1m8lkqi4VfBaEsohE1uOBp?=
 =?us-ascii?Q?zaMMvKRJ5iWeKQQQwN4ZPT4K6pjbZATdnRn09qQL6PvhCP7QNsjA3tfv+6rp?=
 =?us-ascii?Q?zIsnFxyWY42POxn/UARUA9V7K+1QV2e0qk4Ai8/g2EMfp55m8KuT6gcii23n?=
 =?us-ascii?Q?SKD2y/SCpeMzMLa//BnsmCKW/ksTsnGwrvfesLQm6k4xZ5AQocX1+B55Lr8Z?=
 =?us-ascii?Q?tJl61FolciPTFFxQTn3+6t867zfy0rIHPNIxeWaF6k4AAoXNx9gZbZDpKGPB?=
 =?us-ascii?Q?PcPawqYs1M/XNNRolOqJTn7kk0Em4zoU0bmRXedpqj/9FQ1twnOQ3jsBYQn3?=
 =?us-ascii?Q?fgifTI5QgTYSdQIcEAtcCSAeyKGP3o7n56GexsU2LiTGZB1EyJj9e5UaGPfc?=
 =?us-ascii?Q?u8JgHzesEvAyKvYX0iHiA28KXoq8/f0Y/HwbT9ljuzgsZklEbH58QbqUUKR/?=
 =?us-ascii?Q?Q2eOWhXK8XdUhA0m2lZRAMAlKUtIE/0M0mx8BulnU+Sz9fkol1rnxrKQnCL2?=
 =?us-ascii?Q?1R63s6DfApvPfKx0qsJ6PZ99k3PQqLH2tMvejTbTeBtKco/wcK7Ff2IuJt4u?=
 =?us-ascii?Q?Dhi36yV+nzU+oLMVW5eI5qlw+0yab4VVpxbIxP1wkPXr1Ni3l0TNLRJ0np54?=
 =?us-ascii?Q?pqIjWacjOhsD70mM7PdFpXKxM4ZuDNy4nGalAE5uhMU/Mynxo/k9EzM/3pK/?=
 =?us-ascii?Q?FfgKy5olITWME1H/BlpKAgnAkJ0MVZJSO7Jb4/pOYw1oSpEuKy8f6S9UB9uT?=
 =?us-ascii?Q?8cCzzwpqDZCUOd59/eYsnU495zbwctqNRnfWiCo0JK25/dh8CWA5Gki2m9I9?=
 =?us-ascii?Q?zZTke+78381/scNqJx8PFP2hQ9v1R7RdAvSuezrr/5s6GOouOQcF6gB1R0oP?=
 =?us-ascii?Q?S6THhQFf54zU1i02qQzSjaRIkkZ3rl39zpFTJA6MdJF2NBWZFYGmRDkmBEV0?=
 =?us-ascii?Q?9UCxMoXGPyA1nlVj+xhC9NVozm7u3PxtWTRCi10244cAsJo6NJixE2FJFd+p?=
 =?us-ascii?Q?N0FEKcAZAJGTQPf1AUaZduVvDdRU2pQso+Bn/+0n6nFcEU8lCdx/cefa/A9Y?=
 =?us-ascii?Q?cQ3m7QEG3hFvUAlaw4i1AzzUQIyXNtUQX+dOtC+1SZZaQbBySMqPDkcgXlof?=
 =?us-ascii?Q?oflW5Bq87V4ck1UoSkgfoFzT/+wdVgJXGTSz26XOaAGiS9/Y0xm6Z0c9zK0n?=
 =?us-ascii?Q?+OXvc9p0Q7y6hpY8+Wq73W1IKqIXQFQE/NzdQQrRPkM6IyKFi+SYbxBqK2Vq?=
 =?us-ascii?Q?PMRxtFKb04vV/KkIve8l/tPGmu9O/oO4wXvYE2McHhKs6vCHMWo52inVCNH2?=
 =?us-ascii?Q?ib9qUW2qMggXLFz0tvBbbhyS6qtyADwx9N84dP/g7ZE7kjAEhtlAVtx2PuoF?=
 =?us-ascii?Q?StVRjj9Y+gRYkTsemVo4L13IVfYS3Ivq2u3YYXWJr2aqMRJTf5Adqj5VrqwD?=
 =?us-ascii?Q?kLh6QlFyI+mm4+DdlieUijzNvnfr0Idf+9VpJDBc+tgFHfsnHTDR7DnD031R?=
 =?us-ascii?Q?Cz3BwfbTpfkwNCZ0y/k1AR8X/YFbg41iwdX5Zyp1XwIzjlX/YShb2+r5DskI?=
 =?us-ascii?Q?SUz/hX6z+tcW1ZFj8nvRgui36jwZm6LJDOC3FYo0BWgi4NQ6+W79pxoEC1pU?=
 =?us-ascii?Q?vMNf1G2ZrhucgROQvGqUwKQ6I4ruwgGYnnTWhbPo6RUEgH3rWcBnNPoYwIx3?=
 =?us-ascii?Q?vlM4+Yn8PMnUx3y+49hlSv9N7jPCo3CQEaxb3PtllKrvAxdPjvRCf1VCoCOY?=
 =?us-ascii?Q?N6iv8lmbnVz2va5RwYcGx9Y9nPYkjO9iecFvkp3bC1mWt0yVGTjF?=
X-Exchange-RoutingPolicyChecked: 
	UgBFxRfZtbroN0Vnmede4yPwvkZE7eYT828V0YN7c3Vy8gDl42ZKvvhdRPqloQulAYK8E5h7x5WN9gMl3f1JBG2pzeI+AaP/at2RZc2ldAKONZRN9UDRSAwvgzuJ7xF6arx+hZbNWrBTRZptU+U+41AvL75u9gkBqlYye9T8R9ykWzg6lX2iMILUJQP7ga9ekBA/U8r/Awq5SZs2TQQ8BN0BGArG3Yg/GhkcP6oc9BbOnK6Vst1Y0ZKKugBFFicziANfAzavVU2q/F+iPHXpdX8+G77W0otHIPSTGMsFW0TGHpFTbKsGzlQHTFjDD1ONV01TW1on/8H/HE9bjoW/8A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfe88ca-f92c-48ae-75c4-08dea51b12c0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 11:41:23.2448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sA3tSJOz5SPhgNE1GEJEmHy9aow8meC/CppRDvwUH8TZyiz9AtHem6I1TWxKLYqSDeWUD/TPyggg+o/YmSRVM9ZtW1uRvjQTse3u+1DM1LYIdOlqqgv61qFVvK1gOWdk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9889
X-Proofpoint-ORIG-GUID: pJjiBtsioCejpYwBuAT90TgaYXyBx2c-
X-Proofpoint-GUID: pJjiBtsioCejpYwBuAT90TgaYXyBx2c-
X-Authority-Analysis: v=2.4 cv=RN6D2Yi+ c=1 sm=1 tr=0 ts=69f09ce6 cx=c_pps
 a=lvbo/KN+lEuTaduVXZ84Bg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=WN52PlUurRMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=F_ubicZDAAAA:20 a=t7CeM3EgAAAA:8
 a=_cb5lnDNjOrN61fj1-0A:9 a=3ZKOabzyN94A:10 a=xE34mhsjmDcA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNSBTYWx0ZWRfX2FfeNci8CFVy
 XDr6vJivEcHOO/mgXDwMFs9sfPf3uA/Bk2GLqlS9mbRT/zOwGvceX7NiIX/HuVMlnUdjUgaJDMa
 sKwv+hPtXHDvaZ+EMoNI/vVQskFLRO+cpEnzYZ3e6/YizWBIYp6unD0Fqh2+Kpf9DOSRmY7Mw5t
 zw78VQ5y56UbngXtxv3I6Uyn1ILk3TXi2hef6cDpsoQJnjxQmC+wBUhkUp8GyjiRn037IQJYjy3
 ek8jFh7R0L6UCGiAOyiq48WnvJCLYYunwgOf90aO2NgDBR3NIh/xVYFgj+wJs78vm2XdMg96cjI
 ywTK5LKDf6N2zvjcWeT9gLe4udpHfl7Yf4L4hwV0felID/ihyUkYprZ1p7EG4Sq3Ka2lu3QEHfL
 4+CFZIMo9eXfIGWfc0QIjT7/QLTNihoGyy5DDoCcfl4ODY76egoUzkAo8HF5ZfHkCwBqVmd/Hbz
 3X5L/6wDIZtu1exZ+/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280105
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63SA3gS23814829
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 11:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236055

In versions 2.4.16 and prior, CUPS daemon (cupsd) contains an authorizati=
on bypass
vulnerability due to case-insensitive username comparison during authoriz=
ation checks.
The vulnerability allows an unprivileged user to gain unauthorized access=
 to
restricted operations by using a user with a username that differs only
in case from an authorized user.

Reference:
[ https://nvd.nist.gov/vuln/detail/CVE-2026-27447 ]
[ https://github.com/OpenPrinting/cups/security/advisories/GHSA-v987-m8hp=
-phj9 ]

Upstream-Status: Backport
[ https://github.com/OpenPrinting/cups/commit/88516bf6d9e34cef7a64a704b85=
6b837f70cd220 ]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2026-27447.patch            | 102 ++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index 2724ce72fb..e3562c10dd 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,6 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-${=
PV}-source.tar.gz \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
+           file://CVE-2026-27447.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch b/meta/=
recipes-extended/cups/cups/CVE-2026-27447.patch
new file mode 100644
index 0000000000..a4d444078b
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
@@ -0,0 +1,102 @@
+From 99750490becf1ce88a280451e056d09fe765c5c3 Mon Sep 17 00:00:00 2001
+From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+Date: Fri, 24 Apr 2026 11:22:22 +0000
+Subject: [PATCH] CVE-2026-27447: The scheduler treated local user and gr=
oup
+ names as case-insensitive.
+
+CVE: CVE-2026-27447
+
+Upstream-Status: Backport [ https://github.com/OpenPrinting/cups/commit/=
88516bf6d9e34cef7a64a704b856b837f70cd220 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ scheduler/auth.c | 33 ++++++++++++++++-----------------
+ 1 file changed, 16 insertions(+), 17 deletions(-)
+
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index bd0d28a..c05b1b8 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -1,7 +1,7 @@
+ /*
+  * Authorization routines for the CUPS scheduler.
+  *
+- * Copyright =C2=A9 2020-2024 by OpenPrinting.
++ * Copyright =C2=A9 2020-2026 by OpenPrinting.
+  * Copyright =C2=A9 2007-2019 by Apple Inc.
+  * Copyright =C2=A9 1997-2007 by Easy Software Products, all rights res=
erved.
+  *
+@@ -1184,7 +1184,7 @@ cupsdCheckGroup(
+   group =3D getgrnam(groupname);
+   endgrent();
+=20
+-  if (group !=3D NULL)
++  if (user && group)
+   {
+    /*
+     * Group exists, check it...
+@@ -1198,7 +1198,7 @@ cupsdCheckGroup(
+       * User appears in the group membership...
+       */
+=20
+-      if (!_cups_strcasecmp(username, group->gr_mem[i]))
++      if (!strcmp(user->pw_name, group->gr_mem[i]))
+ 	return (1);
+     }
+=20
+@@ -1209,25 +1209,24 @@ cupsdCheckGroup(
+     * belongs to...
+     */
+=20
+-    if (user)
+-    {
+-      int	ngroups;		/* Number of groups */
++    int		ngroups;		/* Number of groups */
+ #  ifdef __APPLE__
+-      int	groups[2048];		/* Groups that user belongs to */
++    int		groups[2048];		/* Groups that user belongs to */
+ #  else
+-      gid_t	groups[2048];		/* Groups that user belongs to */
++    gid_t		groups[2048];		/* Groups that user belongs to */
+ #  endif /* __APPLE__ */
+=20
+-      ngroups =3D (int)(sizeof(groups) / sizeof(groups[0]));
++    ngroups =3D (int)(sizeof(groups) / sizeof(groups[0]));
+ #  ifdef __APPLE__
+-      getgrouplist(username, (int)user->pw_gid, groups, &ngroups);
++    getgrouplist(user->pw_name, (int)user->pw_gid, groups, &ngroups);
+ #  else
+-      getgrouplist(username, user->pw_gid, groups, &ngroups);
++    getgrouplist(user->pw_name, user->pw_gid, groups, &ngroups);
+ #endif /* __APPLE__ */
+=20
+-      for (i =3D 0; i < ngroups; i ++)
+-        if ((int)groupid =3D=3D (int)groups[i])
+-	  return (1);
++    for (i =3D 0; i < ngroups; i ++)
++    {
++      if ((int)groupid =3D=3D (int)groups[i])
++       return (1);
+     }
+ #endif /* HAVE_GETGROUPLIST */
+   }
+@@ -1836,8 +1835,8 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Conn=
ection */
+ 	 name;
+ 	 name =3D (char *)cupsArrayNext(best->names))
+     {
+-      if (!_cups_strcasecmp(name, "@OWNER") && owner &&
+-          !_cups_strcasecmp(username, ownername))
++      if (!_cups_strcasecmp(name, "@OWNER") && owner && pw &&
++           !strcmp(pw->pw_name, ownername))
+ 	return (HTTP_OK);
+       else if (!_cups_strcasecmp(name, "@SYSTEM"))
+       {
+@@ -1849,7 +1848,7 @@ cupsdIsAuthorized(cupsd_client_t *con,	/* I - Conn=
ection */
+         if (cupsdCheckGroup(username, pw, name + 1))
+           return (HTTP_OK);
+       }
+-      else if (!_cups_strcasecmp(username, name))
++      else if (pw && !strcmp(pw->pw_name, name))
+         return (HTTP_OK);
+     }
+=20
--=20
2.40.0


