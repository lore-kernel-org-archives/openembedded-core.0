Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A175E1088E7F
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 05:23:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4595.1773897805930756379
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 22:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=im29nqlK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7538356787=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5E05W1239379
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 05:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=NLzF2B5JKxo2CA8pVUdD
	0aEQMMlAzw8BKrqmG87k/8U=; b=im29nqlKiSfwoUYeeOrkyp1q3YVLFspHMied
	wMNbeqPz80ZshyHW1p9L7jW6bDpkRffeRWDTHGa+9KApoKF8ycmbgYG/3pO4+KOC
	XxwW/ThjbTNhgqKhPdy8O0Id3cgZfSkSLUuYCorsf1oSRFjZDRgkNAxorFbiX7en
	A8rqE3BLE5LmG9kJSO8ow7x2AFMd8BtdAk72Hgl2RRibHTreZ033VCNWSqVoT7pR
	bOSYXhOp6n7jHYSyCERP4WtZDS+fZSREnAMgryLYewmVhP3V8fO5An1INQ+j14ax
	juGGamd6K1bo8tzj4/DCl2zqotxr6aiM5epwrSEGC1DgPxGG0w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011003.outbound.protection.outlook.com [40.107.208.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cy9anteer-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 05:23:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFG811dvPQwW7pY1BusLrbs6wYwmbKuJG7PQXuGRTzRis4dA8BIuHkWL33ozvjpwolTEPGSgW7jijXTHNaazpohqLbcT7oWfukxAiczrMSXWkPDaAZTN2mAlMthoZGPDyVMg1JUckeZFLkBm9Zfjly8OSkBgY2KrSoci324BcEX0UlbVRrxgDCFZ8IfPj85IDHqDogxwz1Nf/EG88RF9SqI0Uq6MC6OMtGgc7NV/btCjFVQL+yedcX3WPFoTZUC8bC6t8Npvb74deLW8Rh5sjDPwKhLuyizQI5oLsI5tyjCzYpL8274DdckMEDpJbizJE+0ueA4sCc7s8pPpeAcFFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLzF2B5JKxo2CA8pVUdD0aEQMMlAzw8BKrqmG87k/8U=;
 b=TucFSx7NUlAjfq5VG1JAzrPEMuTQw5e4fbqu12MhHAgCoVYnNg/lVyi8+MlqGpUjJpeW8+wj9rYloXY1mJv+Cu4UfR2ldAGahbo8pre8dfdqrORU6Bd/nMtC8Fegd3pdllERqgjGtGwPCos+c8x7nE4qj+hCdocd4ZJCBONc+k19o97RrvmniOPBZdtfPRWaLXs9LKfcbpDmjPHZxj5R4ySJwdNkmGzf+AyhN94a6ofm3kS1XizJYrKOXoOg4nvzTggF2EGga4NZnHFtlCDW74ah+1BgabwD/SXGGiAQdvzLFvMLIKRaZGRCr2sBBZIGI5FJ26kQiQj8JRa/4XL7xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA2PR11MB5180.namprd11.prod.outlook.com (2603:10b6:806:fb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 05:23:21 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 05:23:21 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libsoup: fix CVE-2025-32049/CVE-2026-1539
Date: Thu, 19 Mar 2026 13:22:34 +0800
Message-Id: <20260319052234.2373580-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0078.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::11) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA2PR11MB5180:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b4a574-8fe0-49aa-a1a0-08de8577a286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	TwU2Yy3b8QpGoLph5xKjturI2rij9P10KF4yomV/tOEGPofvMvaxJAVGFWD0UAT28vIuI5PwAZ+Qe+pHqaAuAyst/zP9zdsI9rSRjtDwIR8nX8hC5N9X4SkIlk+Y3EP5AfWzaUCSm/ZHu8nCC8h9su73yASa0pKOviliDOCz5JRyoqiQH+XgtnFHU8AV1bYl34om5djWcrtU4VJyeVsChQ7IkDx9Xdw7h4nhyPXPDo0Q8qcmcr/6SKmS33S1jEgWR0Nom0lwhLTehZo8y+nLaqLzbplM47SU1quTuOGvDLntvz4x9l0ndkE9x+uY0R2czwOsLMnlSV2hGk5dchqXS/NJm5bL1lhou9gRj4u+RGvIOLYeeB46i3jyNCoitcCieisvPzcj+31rWySd5HlivfckFl7YUFvgF2hrgAOWGkvZ4okjMjHQByhDxJREPgf0ATz6g++tbzNTMmnyq0nU4UXiLa1BbIh22oHZ9dkSy1ZTe4BjbY1cEvFYHSCjZt+uZlaEr5MNwbeyVJrvi+XI26rFR7jBaO4a9vSbRSdPJQYONJvvm8xrwdXQ+J/sLs0XyMybDx+Jkt9tOZx2Nt8ffv1PJsqpMtTDhFy1Ytz3chWnt3N6v2ywr5Bfdus9AN1UrujIfj7U47Km1yITJgYrssWKB0YIQCvqKR1s1jgncq9gpUkd5FBeHtfx9KIO1MCP7C5Z0uSNLipnZ5J0fmDlct9pVOuxjn65gHkJ1hMdjeH6+WifQs43/syA9159ZsXR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?spbjKj8O0NYnizVLtqkwicczkbY0myiCAHFmDqHtEOUgAuorsfPCpjqVQMuz?=
 =?us-ascii?Q?ZgvOqqQCZ6EAtt5EenggILSF1U0WJruGRCEcBjbkAxv9o9kegsPB2Chby5ZH?=
 =?us-ascii?Q?R+dcrQ77yQdei7dx8Dgrs8K/48nNVQ+ONaIcpjXqqjaTx3iAbzDR0QYYSPgz?=
 =?us-ascii?Q?jifqleWhAhDL0lgGGN8eR+AWdMPZq3oamLPbuOa3xwpDmSZEJ9C+4nWCjdch?=
 =?us-ascii?Q?buDJ6VaHLJwwE2msPPguShnuVrGX9zUG4seBwCwtrj9vTRCH7HNXwKC6zpFF?=
 =?us-ascii?Q?FAgylk2GfSzCe0wJpjqkNt20slUug9wMHemARCxW0B3YVD16ROiSFL70TdkT?=
 =?us-ascii?Q?Rc8G0iMJbAMIxx3aROcyTAe4L8z5lT2VmtFS9VR1Y0k2OEXyxZIznzDCmR1i?=
 =?us-ascii?Q?EO0Rx+2ZLuh8Xm9bRwN8MolZ1AvVMOCLPssDszcLD46zeUU3dl1pO05VtUJG?=
 =?us-ascii?Q?8SAcqkBHMIxWeNn10WHhvXcxZcGUc94iN2mWlf7C4PldcEzhaAFvZT3ZU/sE?=
 =?us-ascii?Q?INgIaP6yjLxL05xw7cV9+tvc3/2gXk6DQRH6P1BIrKbpx0HQ/ZIHVeoZYVH6?=
 =?us-ascii?Q?q5Ck3a8Pny8n3IeFSvkb+kl0cxcVVNkCBdvln6ATv/FHCy5cyuT3r35WUftt?=
 =?us-ascii?Q?yPhAh+/1NmPQ/W/Q6ImXE4qfrTGl/otXQhVIMxrkfchL3uQ+crMW1n3uByn0?=
 =?us-ascii?Q?6cj0IIvhCu33kri/wsuQORUXd5k2HV237SUWSbkuQtAidvfzatZ0jaI0/RNf?=
 =?us-ascii?Q?DNsIu2QaEA7hzV6VzCF3F617awxoKA1zM7EH2gCfjbJq4Bo4eU5jpgqK3SYd?=
 =?us-ascii?Q?qbTqYpisIewNcUPSegYv/XzVAmoJuM7m7H5ZBx3oe7ndaud2qV9230AUURMg?=
 =?us-ascii?Q?wQ+EirwutorpnBrZJXNthyuKSqw3BtywZNNavsVKGEaaB/yLlqDMODb55VtY?=
 =?us-ascii?Q?im61s3OlveXgUF1zskBn0BcjQZbb7oetF0awpKA8CkJFly3IHmUPf5O/D/at?=
 =?us-ascii?Q?T8vjlsaN9AJmLtnBhmnbJxVL+cN6UU78MnADsW6djl6rjar2JU0qwGnjhzD6?=
 =?us-ascii?Q?5YLOUF8PWN0vbB/KCw+rCKW7GBTRoEmKSERrdXIVY5p1E+b+xJyLONcxgs1l?=
 =?us-ascii?Q?2aqfuOuXRcVgfGCGbOCZzXiSiiFzMWguxe07UXsCwKzLfRgaN+norGpGtb9i?=
 =?us-ascii?Q?bFTtlPSvo8iVv8TRb5rwC2EJhrhVYhO7Gh8zN5IhAyMaqAi+W0xTQivgl2sr?=
 =?us-ascii?Q?Na6CVh6PfdXaQLlMuY90v6x+1IFM3doQBFZcIf2wJdLZN384hSSywuxwO0Cs?=
 =?us-ascii?Q?Ja4gn8/xcN5S85x4LF/EbJ8XF0sHyU7tgkfTNZzarDKtpAtO5i1pgkOZgj0Z?=
 =?us-ascii?Q?mPxiJaetguh8HixyV03RlDSUYGpoU0Hpbmu59WYJNtZZqbM4bMjAxBAeBopU?=
 =?us-ascii?Q?jsyF4GVkEb3e8flY6woh+yXfNgGpHkTbDXcLbnisX7zN6bzitTLsgDQx8wHg?=
 =?us-ascii?Q?6alGL3mCm207WHMGzueZWsQ2MBbga8oSTPJ8EPLeA+BMmsuM4ZIk1cnElQh5?=
 =?us-ascii?Q?PwXmU9HAVIhc977BnlaekXzIdkmjNYAHf8tJmX/30xPN8aGg7l5dcvf+eYmD?=
 =?us-ascii?Q?9fJNj9C0jXLuPDXb9l7xA6PqNhjpjoi4Kplr/NXDLVo5lEpgUIvNUZqcqqD0?=
 =?us-ascii?Q?ShdZ2Qt0DlOKF0t9/jQabEZuGxOLDJCPsbgWDYwSt7cWBtj0Qc9XzjFJfCQA?=
 =?us-ascii?Q?CgZ3/zOGSJULPtr8bX8ij07xPhqJhgI=3D?=
X-Exchange-RoutingPolicyChecked: 
	RWR0I9BbZYNSeH1kgPYLPaxxhRxIviH8N1QTTAX7cwmiBwAilruWU/UCGpohCrTOvS9jkq+5LynLt/ghpoDjk3QjpTZtuXx4U3TZd9ooOAZakmGw1m6Ik2HgvTeEctD3b8dgIB0vpRCIP2LXeJUZkQd1CfRzIB6VQ//mjr/xFbq0wMn7HYo2WntdoUgp+RlMxR51REp1GTavf+oYIu48RWYbs5QOizHITfWx2RXEfdt5bNulCJXThs0EJqTBUshp60s8p7Y+5DurPFyr5rzcAOEdoymprYWhGAM9hm6qXHPbS4GIVIigQ2rEsg4H245f42iVfHmZxaFTYcawfRajBA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b4a574-8fe0-49aa-a1a0-08de8577a286
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 05:23:21.1599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5A5Pt6QrKLJIfQAJLNCfHtHq+FJj6D7/sx8abwSMkB9sjj0pdilBX6Npw/TX4sD4XsIOXPzCidp3OHkixKZfCXAmg1KN1roCMgHrRPCvdZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5180
X-Authority-Analysis: v=2.4 cv=IrMTsb/g c=1 sm=1 tr=0 ts=69bb884c cx=c_pps
 a=8jXpZF9zWVkTg+MA9bOgkg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=GHR8O2WEAAAA:20
 a=LRLYrf9nAAAA:8 a=t7CeM3EgAAAA:8 a=vggBfdFIAAAA:8 a=20KFwNOVAAAA:8
 a=V2sgnzSHAAAA:8 a=9S7YBWU92JA5Z5-U8LQA:9 a=Qnh2Jy1CevoyJw2Q:21
 a=lqcHg5cX4UMA:10 a=ctNd1-se8QBkj9sPkfQg:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-ORIG-GUID: z55hQgt60cpFOdp3vJYr7M89HTc7YxAm
X-Proofpoint-GUID: z55hQgt60cpFOdp3vJYr7M89HTc7YxAm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAzOSBTYWx0ZWRfX26cL4KO1y7h9
 9VpRs1Ni6IkYk/S1w/Y4Y1UTdcvKqe3JCivsydpvVFmUjyx8d2ydro1xRTU05QXekzUYsSbghYS
 zKzTgdexXuKFzSiEKApJrqdMjqljX1Hsh7pTHjKWupQb8uH4uHr0OAbaso8XW3AMQ6+GCuyuTcU
 QRgi3VpwlACg2xwnlenavLXgeMwE+CpkZchQrYjSHoyhmgsXBgoKIMNePViweSOv3xHlBzkeF51
 E96Hh0qt9Oml92/7pcSVWuwewLLRs3zgn3puoIJ84TTngdqsXHGlvcHtKG2BL0ee20Z1iETg1x7
 UBzCdi+SNQ7q1R/hwiyrfxyQzbtuLumQ10cKqidwuC7fwZJbp9ya8tA/+uBrJyNi/VI7lZNIaG4
 /yn0QBC9Ycf3WExRbzKYIW0m6oyc4X9OWupFHBJfAXyRQTllAUFTokvRhC+PV6tQYg3BML5B27D
 V1Cyz2uTwihalATbnKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 05:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233461

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/390
https://gitlab.gnome.org/GNOME/libsoup/-/issues/489

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup/CVE-2025-32049-1.patch    | 229 ++++++++++++++
 .../libsoup/libsoup/CVE-2025-32049-2.patch    |  34 ++
 .../libsoup/libsoup/CVE-2025-32049-3.patch    | 133 ++++++++
 .../libsoup/libsoup/CVE-2025-32049-4.patch    | 291 ++++++++++++++++++
 .../libsoup/libsoup/CVE-2026-1539.patch       |  97 ++++++
 meta/recipes-support/libsoup/libsoup_3.6.6.bb |   7 +
 6 files changed, 791 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32049-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32049-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32049-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32049-4.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-1539.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-1.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-1.patch
new file mode 100644
index 0000000000..adec7b3cf0
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-1.patch
@@ -0,0 +1,229 @@
+From 46338bccc2ad9c34f892af19123f64ca2d9d866f Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Wed, 24 Jul 2024 15:20:35 +0200
+Subject: [PATCH 1/4] websocket: add a way to restrict the total message size
+
+Otherwise a client could send small packages smaller than
+total-incoming-payload-size but still to break the server
+with a big allocation
+
+Fixes: #390
+
+Change SOUP_AVAILABLE_IN_3_8 to SOUP_AVAILABLE_IN_3_6
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/db87805ab565d67533dfed2cb409dbfd63c7fdce]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/websocket/soup-websocket-connection.c | 106 +++++++++++++++++-
+ libsoup/websocket/soup-websocket-connection.h |   7 ++
+ 2 files changed, 110 insertions(+), 3 deletions(-)
+
+diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/websocket/soup-websocket-connection.c
+index 36e8459..a4fc36e 100644
+--- a/libsoup/websocket/soup-websocket-connection.c
++++ b/libsoup/websocket/soup-websocket-connection.c
+@@ -78,6 +78,7 @@ enum {
+ 	PROP_KEEPALIVE_INTERVAL,
+ 	PROP_KEEPALIVE_PONG_TIMEOUT,
+ 	PROP_EXTENSIONS,
++	PROP_MAX_TOTAL_MESSAGE_SIZE,
+ 
+         LAST_PROPERTY
+ };
+@@ -120,6 +121,7 @@ typedef struct {
+ 	char *origin;
+ 	char *protocol;
+ 	guint64 max_incoming_payload_size;
++	guint64 max_total_message_size;
+ 	guint keepalive_interval;
+ 	guint keepalive_pong_timeout;
+ 	guint64 last_keepalive_seq_num;
+@@ -164,6 +166,7 @@ typedef struct {
+ } SoupWebsocketConnectionPrivate;
+ 
+ #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
+ #define READ_BUFFER_SIZE 1024
+ #define MASK_LENGTH 4
+ 
+@@ -696,8 +699,8 @@ bad_data_error_and_close (SoupWebsocketConnection *self)
+ }
+ 
+ static void
+-too_big_error_and_close (SoupWebsocketConnection *self,
+-                         guint64 payload_len)
++too_big_incoming_payload_error_and_close (SoupWebsocketConnection *self,
++                                          guint64 payload_len)
+ {
+         SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
+ 	GError *error;
+@@ -713,6 +716,24 @@ too_big_error_and_close (SoupWebsocketConnection *self,
+ 	emit_error_and_close (self, error, TRUE);
+ }
+ 
++static void
++too_big_message_error_and_close (SoupWebsocketConnection *self,
++                                 guint64 len)
++{
++	SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
++	GError *error;
++
++	error = g_error_new_literal (SOUP_WEBSOCKET_ERROR,
++				     SOUP_WEBSOCKET_CLOSE_TOO_BIG,
++				     priv->connection_type == SOUP_WEBSOCKET_CONNECTION_SERVER ?
++				     "Received WebSocket payload from the client larger than configured max-total-message-size" :
++				     "Received WebSocket payload from the server larger than configured max-total-message-size");
++	g_debug ("%s received message of size %" G_GUINT64_FORMAT " or greater, but max supported size is %" G_GUINT64_FORMAT,
++	         priv->connection_type == SOUP_WEBSOCKET_CONNECTION_SERVER ? "server" : "client",
++	         len, priv->max_total_message_size);
++	emit_error_and_close (self, error, TRUE);
++}
++
+ static void
+ close_connection (SoupWebsocketConnection *self,
+                   gushort                  code,
+@@ -973,6 +994,12 @@ process_contents (SoupWebsocketConnection *self,
+ 		switch (priv->message_opcode) {
+ 		case 0x01:
+ 		case 0x02:
++			/* Safety valve */
++			if (priv->max_total_message_size > 0 &&
++			    (priv->message_data->len + payload_len) > priv->max_total_message_size) {
++				too_big_message_error_and_close (self, (priv->message_data->len + payload_len));
++				return;
++			}
+ 			g_byte_array_append (priv->message_data, payload, payload_len);
+ 			break;
+ 		default:
+@@ -1111,7 +1138,7 @@ process_frame (SoupWebsocketConnection *self)
+ 	/* Safety valve */
+ 	if (priv->max_incoming_payload_size > 0 &&
+ 	    payload_len > priv->max_incoming_payload_size) {
+-		too_big_error_and_close (self, payload_len);
++		too_big_incoming_payload_error_and_close (self, payload_len);
+ 		return FALSE;
+ 	}
+ 
+@@ -1428,6 +1455,10 @@ soup_websocket_connection_get_property (GObject *object,
+ 		g_value_set_pointer (value, priv->extensions);
+ 		break;
+ 
++        case PROP_MAX_TOTAL_MESSAGE_SIZE:
++		g_value_set_uint64 (value, priv->max_total_message_size);
++		break;
++
+ 	default:
+ 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+ 		break;
+@@ -1486,6 +1517,10 @@ soup_websocket_connection_set_property (GObject *object,
+ 		priv->extensions = g_value_get_pointer (value);
+ 		break;
+ 
++	case PROP_MAX_TOTAL_MESSAGE_SIZE:
++		priv->max_total_message_size = g_value_get_uint64 (value);
++		break;
++
+ 	default:
+ 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+ 		break;
+@@ -1716,6 +1751,26 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+                                       G_PARAM_CONSTRUCT_ONLY |
+                                       G_PARAM_STATIC_STRINGS);
+ 
++	/**
++	 * SoupWebsocketConnection:max-total-message-size:
++	 *
++	 * The total message size for incoming packets.
++	 *
++	 * The protocol expects or 0 to not limit it.
++	 *
++	 * Since: 3.8
++	 */
++        properties[PROP_MAX_TOTAL_MESSAGE_SIZE] =
++                g_param_spec_uint64 ("max-total-message-size",
++                                     "Max total message size",
++                                     "Max total message size ",
++                                     0,
++                                     G_MAXUINT64,
++                                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++                                     G_PARAM_READWRITE |
++                                     G_PARAM_CONSTRUCT |
++                                     G_PARAM_STATIC_STRINGS);
++
+         g_object_class_install_properties (gobject_class, LAST_PROPERTY, properties);
+ 
+ 	/**
+@@ -2186,6 +2241,51 @@ soup_websocket_connection_set_max_incoming_payload_size (SoupWebsocketConnection
+ 	}
+ }
+ 
++/**
++ * soup_websocket_connection_get_max_total_message_size:
++ * @self: the WebSocket
++ *
++ * Gets the maximum total message size allowed for packets.
++ *
++ * Returns: the maximum total message size.
++ *
++ * Since: 3.8
++ */
++guint64
++soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *self)
++{
++	SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
++
++	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);
++
++	return priv->max_total_message_size;
++}
++
++/**
++ * soup_websocket_connection_set_max_total_message_size:
++ * @self: the WebSocket
++ * @max_total_message_size: the maximum total message size
++ *
++ * Sets the maximum total message size allowed for packets.
++ *
++ * It does not limit the outgoing packet size.
++ *
++ * Since: 3.8
++ */
++void
++soup_websocket_connection_set_max_total_message_size (SoupWebsocketConnection *self,
++                                                      guint64                  max_total_message_size)
++{
++	SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
++
++	g_return_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self));
++
++	if (priv->max_total_message_size != max_total_message_size) {
++		priv->max_total_message_size = max_total_message_size;
++		g_object_notify_by_pspec (G_OBJECT (self), properties[PROP_MAX_TOTAL_MESSAGE_SIZE]);
++	}
++}
++
+ /**
+  * soup_websocket_connection_get_keepalive_interval:
+  * @self: the WebSocket
+diff --git a/libsoup/websocket/soup-websocket-connection.h b/libsoup/websocket/soup-websocket-connection.h
+index f047c0a..ea0cb58 100644
+--- a/libsoup/websocket/soup-websocket-connection.h
++++ b/libsoup/websocket/soup-websocket-connection.h
+@@ -88,6 +88,13 @@ SOUP_AVAILABLE_IN_ALL
+ void                soup_websocket_connection_set_max_incoming_payload_size (SoupWebsocketConnection *self,
+                                                                              guint64                  max_incoming_payload_size);
+ 
++SOUP_AVAILABLE_IN_3_6
++guint64             soup_websocket_connection_get_max_total_message_size    (SoupWebsocketConnection *self);
++
++SOUP_AVAILABLE_IN_3_6
++void                soup_websocket_connection_set_max_total_message_size    (SoupWebsocketConnection *self,
++                                                                             guint64                  max_total_message_size);
++
+ SOUP_AVAILABLE_IN_ALL
+ guint               soup_websocket_connection_get_keepalive_interval (SoupWebsocketConnection *self);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-2.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-2.patch
new file mode 100644
index 0000000000..4cb9cf201b
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-2.patch
@@ -0,0 +1,34 @@
+From c00f1e961a17c0af1cd34881f64db2948f32bb65 Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Fri, 20 Sep 2024 12:12:38 +0200
+Subject: [PATCH 2/4] websocket-test: set the total message size
+
+This is required when sending a big amount of data
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/4904a46a2d9a014efa6be01a186ac353dbf5047b]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/websocket-test.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index c924601..1678042 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -615,6 +615,11 @@ test_send_big_packets (Test *test,
+ 	soup_websocket_connection_set_max_incoming_payload_size (test->server, 1000 * 1000 + 1);
+ 	g_assert_true (soup_websocket_connection_get_max_incoming_payload_size (test->server) == (1000 * 1000 + 1));
+ 
++	soup_websocket_connection_set_max_total_message_size (test->client, 1000 * 1000 + 1);
++	g_assert (soup_websocket_connection_get_max_total_message_size (test->client) == (1000 * 1000 + 1));
++	soup_websocket_connection_set_max_total_message_size (test->server, 1000 * 1000 + 1);
++	g_assert (soup_websocket_connection_get_max_total_message_size (test->server) == (1000 * 1000 + 1));
++
+ 	sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
+ 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+ 	WAIT_UNTIL (received != NULL);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-3.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-3.patch
new file mode 100644
index 0000000000..b5ccf374bf
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-3.patch
@@ -0,0 +1,133 @@
+From aa189f8bf0593427c67e0becb13f60f2da2fea26 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Thu, 8 May 2025 16:16:25 -0500
+Subject: [PATCH 3/4] Set message size limit in SoupServer rather than
+ SoupWebsocketConnection
+
+We're not sure about the compatibility implications of having a default
+size limit for clients.
+
+Also not sure whether the server limit is actually set appropriately,
+but there is probably very little server usage of
+SoupWebsocketConnection in the wild, so it's not so likely to break
+things.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/2df34d9544cabdbfdedd3b36f098cf69233b1df7]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/server/soup-server.c                  | 24 +++++++++++++++----
+ libsoup/websocket/soup-websocket-connection.c | 24 +++++++++++++------
+ 2 files changed, 36 insertions(+), 12 deletions(-)
+
+diff --git a/libsoup/server/soup-server.c b/libsoup/server/soup-server.c
+index 63af0cf..023abed 100644
+--- a/libsoup/server/soup-server.c
++++ b/libsoup/server/soup-server.c
+@@ -188,6 +188,16 @@ static GParamSpec *properties[LAST_PROPERTY] = { NULL, };
+ 
+ G_DEFINE_TYPE_WITH_PRIVATE (SoupServer, soup_server, G_TYPE_OBJECT)
+ 
++/* SoupWebsocketConnection by default limits only maximum packet size. But a
++ * message may consist of multiple packets, so SoupServer additionally restricts
++ * total message size to mitigate denial of service attacks on the server.
++ * SoupWebsocketConnection does not do this by default because I don't know
++ * whether that would or would not cause compatibility problems for websites.
++ *
++ * This size is in bytes and it is arbitrary.
++ */
++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
++
+ static void request_finished (SoupServerMessage      *msg,
+                               SoupMessageIOCompletion completion,
+                               SoupServer             *server);
+@@ -952,11 +962,15 @@ complete_websocket_upgrade (SoupServer        *server,
+ 
+ 	g_object_ref (msg);
+ 	stream = soup_server_message_steal_connection (msg);
+-	conn = soup_websocket_connection_new (stream, uri,
+-					      SOUP_WEBSOCKET_CONNECTION_SERVER,
+-					      soup_message_headers_get_one_common (soup_server_message_get_request_headers (msg), SOUP_HEADER_ORIGIN),
+-					      soup_message_headers_get_one_common (soup_server_message_get_response_headers (msg), SOUP_HEADER_SEC_WEBSOCKET_PROTOCOL),
+-					      handler->websocket_extensions);
++	conn = SOUP_WEBSOCKET_CONNECTION (g_object_new (SOUP_TYPE_WEBSOCKET_CONNECTION,
++					  "io-stream", stream,
++					  "uri", uri,
++					  "connection-type", SOUP_WEBSOCKET_CONNECTION_SERVER,
++					  "origin", soup_message_headers_get_one_common (soup_server_message_get_request_headers (msg), SOUP_HEADER_ORIGIN),
++					  "protocol", soup_message_headers_get_one_common (soup_server_message_get_response_headers (msg), SOUP_HEADER_SEC_WEBSOCKET_PROTOCOL),
++					  "extensions", handler->websocket_extensions,
++					  "max-total-message-size", (guint64)MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++					  NULL));
+ 	handler->websocket_extensions = NULL;
+ 	g_object_unref (stream);
+ 
+diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/websocket/soup-websocket-connection.c
+index a4fc36e..f60297c 100644
+--- a/libsoup/websocket/soup-websocket-connection.c
++++ b/libsoup/websocket/soup-websocket-connection.c
+@@ -166,7 +166,6 @@ typedef struct {
+ } SoupWebsocketConnectionPrivate;
+ 
+ #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
+-#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
+ #define READ_BUFFER_SIZE 1024
+ #define MASK_LENGTH 4
+ 
+@@ -1681,9 +1680,10 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 	/**
+ 	 * SoupWebsocketConnection:max-incoming-payload-size:
+ 	 *
+-	 * The maximum payload size for incoming packets.
++	 * The maximum payload size for incoming packets, or 0 to not limit it.
+ 	 *
+-	 * The protocol expects or 0 to not limit it.
++	 * Each message may consist of multiple packets, so also refer to
++	 * [property@WebSocketConnection:max-total-message-size].
+ 	 */
+         properties[PROP_MAX_INCOMING_PAYLOAD_SIZE] =
+                 g_param_spec_uint64 ("max-incoming-payload-size",
+@@ -1754,9 +1754,19 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 	/**
+ 	 * SoupWebsocketConnection:max-total-message-size:
+ 	 *
+-	 * The total message size for incoming packets.
++	 * The maximum size for incoming messages.
+ 	 *
+-	 * The protocol expects or 0 to not limit it.
++	 * Set to a value to limit the total message size, or 0 to not
++	 * limit it.
++	 *
++	 * [method@Server.add_websocket_handler] will set this to a nonzero
++	 * default value to mitigate denial of service attacks. Clients must
++	 * choose their own default if they need to mitigate denial of service
++	 * attacks. You also need to set your own default if creating your own
++	 * server SoupWebsocketConnection without using SoupServer.
++	 *
++	 * Each message may consist of multiple packets, so also refer to
++	 * [property@WebSocketConnection:max-incoming-payload-size].
+ 	 *
+ 	 * Since: 3.8
+ 	 */
+@@ -1766,7 +1776,7 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+                                      "Max total message size ",
+                                      0,
+                                      G_MAXUINT64,
+-                                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++                                     0,
+                                      G_PARAM_READWRITE |
+                                      G_PARAM_CONSTRUCT |
+                                      G_PARAM_STATIC_STRINGS);
+@@ -2256,7 +2266,7 @@ soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *s
+ {
+ 	SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
+ 
+-	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);
++	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), 0);
+ 
+ 	return priv->max_total_message_size;
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-4.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-4.patch
new file mode 100644
index 0000000000..c89637eae2
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-4.patch
@@ -0,0 +1,291 @@
+From 800cbde5e42131bdea3d6f30808b7e034d45d438 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Fri, 16 May 2025 16:55:40 -0500
+Subject: [PATCH 4/4] Add tests for max-incoming-packet-size and
+ max-total-message-size
+
+An even better test would verify that it's possible to send big messages
+containing small packets, but libsoup doesn't offer control over packet
+size, and I don't want to take the time to learn how WebSockets work to
+figure out how to do that manually. Instead, I just check that both
+limits work, for both client and server.
+
+I didn't add deflate variants of these tests because I doubt that would
+add valuable coverage.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/4d00b45b7eebdcfa0706b58e34c40b8a0a16015b]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/websocket-test.c | 213 +++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 196 insertions(+), 17 deletions(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index 1678042..60da66f 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -591,16 +591,9 @@ test_send_big_packets (Test *test,
+ {
+ 	GBytes *sent = NULL;
+ 	GBytes *received = NULL;
++	gulong signal_id;
+ 
+-	g_signal_connect (test->client, "message", G_CALLBACK (on_text_message), &received);
+-
+-	sent = g_bytes_new_take (g_strnfill (400, '!'), 400);
+-	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+-	WAIT_UNTIL (received != NULL);
+-	g_assert_true (g_bytes_equal (sent, received));
+-	g_bytes_unref (sent);
+-	g_bytes_unref (received);
+-	received = NULL;
++	signal_id = g_signal_connect (test->client, "message", G_CALLBACK (on_text_message), &received);
+ 
+ 	sent = g_bytes_new_take (g_strnfill (100 * 1000, '?'), 100 * 1000);
+ 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+@@ -611,23 +604,173 @@ test_send_big_packets (Test *test,
+ 	received = NULL;
+ 
+ 	soup_websocket_connection_set_max_incoming_payload_size (test->client, 1000 * 1000 + 1);
+-	g_assert_true (soup_websocket_connection_get_max_incoming_payload_size (test->client) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 1000 * 1000 + 1);
+ 	soup_websocket_connection_set_max_incoming_payload_size (test->server, 1000 * 1000 + 1);
+-	g_assert_true (soup_websocket_connection_get_max_incoming_payload_size (test->server) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 1000 * 1000 + 1);
+ 
+ 	soup_websocket_connection_set_max_total_message_size (test->client, 1000 * 1000 + 1);
+-	g_assert (soup_websocket_connection_get_max_total_message_size (test->client) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 1000 * 1000 + 1);
+ 	soup_websocket_connection_set_max_total_message_size (test->server, 1000 * 1000 + 1);
+-	g_assert (soup_websocket_connection_get_max_total_message_size (test->server) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 1000 * 1000 + 1);
+ 
+ 	sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
+ 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+ 	WAIT_UNTIL (received != NULL);
+ 	g_assert_true (g_bytes_equal (sent, received));
++	g_bytes_unref (received);
++	received = NULL;
++
++	/* Reverse the test and send the big message to the server. */
++	g_signal_handler_disconnect (test->client, signal_id);
++	g_signal_connect (test->server, "message", G_CALLBACK (on_text_message), &received);
++
++	soup_websocket_connection_send_text (test->client, g_bytes_get_data (sent, NULL));
++	WAIT_UNTIL (received != NULL);
++	g_assert_true (g_bytes_equal (sent, received));
+ 	g_bytes_unref (sent);
+ 	g_bytes_unref (received);
+ }
+ 
++static void
++test_send_big_packets_direct (Test *test,
++                              gconstpointer data)
++{
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 128 * 1024);
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 0);
++
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 128 * 1024);
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 0);
++
++	test_send_big_packets (test, data);
++}
++
++static void
++test_send_big_packets_soup (Test *test,
++                            gconstpointer data)
++{
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 128 * 1024);
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 0);
++
++	/* Max total message size defaults to 0 (unlimited), but SoupServer applies its own limit by default. */
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 128 * 1024);
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 128 * 1024);
++
++	test_send_big_packets (test, data);
++}
++
++static void
++test_send_exceeding_client_max_payload_size (Test *test,
++                                             gconstpointer data)
++{
++	GBytes *sent = NULL;
++	GBytes *received = NULL;
++	gboolean close_event = FALSE;
++	GError *error = NULL;
++
++	g_signal_connect (test->server, "error", G_CALLBACK (on_error_copy), &error);
++	g_signal_connect (test->client, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 128 * 1024);
++
++	soup_websocket_connection_set_max_incoming_payload_size (test->server, 0);
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 0);
++
++	/* The message to the client is dropped due to the client's limit. */
++	sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
++	g_bytes_unref (sent);
++	WAIT_UNTIL (close_event);
++	g_assert_null (received);
++	g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++	g_assert_no_error (test->client_error);
++}
++
++static void
++test_send_exceeding_server_max_payload_size (Test *test,
++                                             gconstpointer data)
++{
++	GBytes *sent = NULL;
++	GBytes *received = NULL;
++	gboolean close_event = FALSE;
++	GError *error = NULL;
++
++	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++	g_signal_connect (test->server, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++	soup_websocket_connection_set_max_incoming_payload_size (test->client, 0);
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 0);
++
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 128 * 1024);
++
++	/* The message to the server is dropped due to the server's limit. */
++	sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++	soup_websocket_connection_send_text (test->client, g_bytes_get_data (sent, NULL));
++	g_bytes_unref (sent);
++	WAIT_UNTIL (close_event);
++	g_assert_null (received);
++	g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++	g_assert_no_error (test->client_error);
++}
++
++static void
++test_send_exceeding_client_max_message_size (Test *test,
++                                             gconstpointer data)
++{
++	GBytes *sent = NULL;
++	GBytes *received = NULL;
++	gboolean close_event = FALSE;
++	GError *error = NULL;
++
++	g_signal_connect (test->server, "error", G_CALLBACK (on_error_copy), &error);
++	g_signal_connect (test->client, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++	soup_websocket_connection_set_max_total_message_size (test->client, 128 * 1024);
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 128 * 1024);
++
++	soup_websocket_connection_set_max_total_message_size (test->server, 0);
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 0);
++
++	/* The message to the client is dropped due to the client's limit. */
++	sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
++	g_bytes_unref (sent);
++	WAIT_UNTIL (close_event);
++	g_assert_null (received);
++	g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++	g_assert_no_error (test->client_error);
++}
++
++static void
++test_send_exceeding_server_max_message_size (Test *test,
++                                             gconstpointer data)
++{
++	GBytes *sent = NULL;
++	GBytes *received = NULL;
++	gboolean close_event = FALSE;
++	GError *error = NULL;
++
++	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++	g_signal_connect (test->server, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++	soup_websocket_connection_set_max_total_message_size (test->client, 0);
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 0);
++
++	/* Set the server message total message size manually, because its
++	 * default is different for direct connection vs. soup connection.
++	 */
++	soup_websocket_connection_set_max_total_message_size (test->server, 128 * 1024);
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 128 * 1024);
++
++	/* The message to the server is dropped due to the server's limit. */
++	sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++	soup_websocket_connection_send_text (test->client, g_bytes_get_data (sent, NULL));
++	g_bytes_unref (sent);
++	WAIT_UNTIL (close_event);
++	g_assert_null (received);
++	g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++	g_assert_no_error (test->client_error);
++}
++
+ static void
+ test_send_empty_packets (Test *test,
+ 			 gconstpointer data)
+@@ -2262,11 +2405,47 @@ main (int argc,
+ 
+ 	g_test_add ("/websocket/direct/send-big-packets", Test, NULL,
+ 		    setup_direct_connection,
+-		    test_send_big_packets,
++		    test_send_big_packets_direct,
+ 		    teardown_direct_connection);
+ 	g_test_add ("/websocket/soup/send-big-packets", Test, NULL,
+ 		    setup_soup_connection,
+-		    test_send_big_packets,
++		    test_send_big_packets_soup,
++		    teardown_soup_connection);
++
++	g_test_add ("/websocket/direct/send-exceeding-client-max-payload-size", Test, NULL,
++		    setup_direct_connection,
++		    test_send_exceeding_client_max_payload_size,
++		    teardown_direct_connection);
++	g_test_add ("/websocket/soup/send-exceeding-client-max-payload-size", Test, NULL,
++		    setup_soup_connection,
++		    test_send_exceeding_client_max_payload_size,
++		    teardown_soup_connection);
++
++	g_test_add ("/websocket/direct/send-exceeding-server-max-payload-size", Test, NULL,
++		    setup_direct_connection,
++		    test_send_exceeding_server_max_payload_size,
++		    teardown_direct_connection);
++	g_test_add ("/websocket/soup/send-exceeding-server-max-payload-size", Test, NULL,
++		    setup_soup_connection,
++		    test_send_exceeding_server_max_payload_size,
++		    teardown_soup_connection);
++
++	g_test_add ("/websocket/direct/send-exceeding-client-max-message-size", Test, NULL,
++		    setup_direct_connection,
++		    test_send_exceeding_client_max_message_size,
++		    teardown_direct_connection);
++	g_test_add ("/websocket/soup/send-exceeding-client-max-message-size", Test, NULL,
++		    setup_soup_connection,
++		    test_send_exceeding_client_max_message_size,
++		    teardown_soup_connection);
++
++	g_test_add ("/websocket/direct/send-exceeding-server-max-message-size", Test, NULL,
++		    setup_direct_connection,
++		    test_send_exceeding_server_max_message_size,
++		    teardown_direct_connection);
++	g_test_add ("/websocket/soup/send-exceeding-server-max-message-size", Test, NULL,
++		    setup_soup_connection,
++		    test_send_exceeding_server_max_message_size,
+ 		    teardown_soup_connection);
+ 
+ 	g_test_add ("/websocket/direct/send-empty-packets", Test, NULL,
+@@ -2421,11 +2600,11 @@ main (int argc,
+ 
+ 	g_test_add ("/websocket/direct/deflate-send-big-packets", Test, NULL,
+ 		    setup_direct_connection_with_extensions,
+-		    test_send_big_packets,
++		    test_send_big_packets_direct,
+ 		    teardown_direct_connection);
+ 	g_test_add ("/websocket/soup/deflate-send-big-packets", Test, NULL,
+ 		    setup_soup_connection_with_extensions,
+-		    test_send_big_packets,
++		    test_send_big_packets_soup,
+ 		    teardown_soup_connection);
+ 
+ 	g_test_add ("/websocket/direct/deflate-send-empty-packets", Test, NULL,
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2026-1539.patch b/meta/recipes-support/libsoup/libsoup/CVE-2026-1539.patch
new file mode 100644
index 0000000000..e887b441df
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2026-1539.patch
@@ -0,0 +1,97 @@
+From 7a70f089e13cc113032b1459286835b72a2986af Mon Sep 17 00:00:00 2001
+From: Carlos Garcia Campos <cgarcia@igalia.com>
+Date: Tue, 20 Jan 2026 13:17:42 +0100
+Subject: [PATCH] Also remove Proxy-Authorization header on cross origin
+ redirect
+
+Closes #489
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/98c1285d9d78662c38bf14b4a128af01ccfdb446]
+CVE: CVE-2026-1539
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-session.c |  1 +
+ tests/httpd.conf.in    |  1 +
+ tests/proxy-test.c     | 34 ++++++++++++++++++++++++++++++++++
+ 3 files changed, 36 insertions(+)
+
+diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
+index 2d34022..386d145 100644
+--- a/libsoup/soup-session.c
++++ b/libsoup/soup-session.c
+@@ -1234,6 +1234,7 @@ soup_session_redirect_message (SoupSession *session,
+         /* Strip all credentials on cross-origin redirect. */
+         if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
+                 soup_message_headers_remove_common (soup_message_get_request_headers (msg), SOUP_HEADER_AUTHORIZATION);
++                soup_message_headers_remove_common (soup_message_get_request_headers (msg), SOUP_HEADER_PROXY_AUTHORIZATION);
+                 soup_message_set_auth (msg, NULL);
+         }
+ 
+diff --git a/tests/httpd.conf.in b/tests/httpd.conf.in
+index 809dc5c..cc0a116 100644
+--- a/tests/httpd.conf.in
++++ b/tests/httpd.conf.in
+@@ -34,6 +34,7 @@ LoadModule ssl_module           @APACHE_SSL_MODULE_DIR@/mod_ssl.so
+ DirectoryIndex index.txt
+ TypesConfig /dev/null
+ Redirect permanent /redirected /index.txt
++Redirect permanent /Basic/realm1/redirected https://127.0.0.1:47525/index.txt
+ 
+ # Prefer http1 for now because most of the tests expect http1 behavior.
+ Protocols http/1.1 h2
+diff --git a/tests/proxy-test.c b/tests/proxy-test.c
+index d730c8a..68c97ac 100644
+--- a/tests/proxy-test.c
++++ b/tests/proxy-test.c
+@@ -269,6 +269,39 @@ do_proxy_redirect_test (void)
+ 	soup_test_session_abort_unref (session);
+ }
+ 
++static void proxy_auth_redirect_message_restarted (SoupMessage *msg)
++{
++        if (soup_message_get_status (msg) != SOUP_STATUS_MOVED_PERMANENTLY)
++                return;
++
++        g_assert_null (soup_message_headers_get_one (soup_message_get_request_headers (msg), "Proxy-Authorization"));
++}
++
++static void
++do_proxy_auth_redirect_test (void)
++{
++        SoupSession *session;
++        SoupMessage *msg;
++        char *url;
++
++        SOUP_TEST_SKIP_IF_NO_APACHE;
++        SOUP_TEST_SKIP_IF_NO_TLS;
++
++        session = soup_test_session_new ("proxy-resolver", proxy_resolvers[AUTH_PROXY], NULL);
++
++        url = g_strconcat (HTTP_SERVER, "/Basic/realm1/redirected", NULL);
++        msg = soup_message_new (SOUP_METHOD_GET, url);
++        g_signal_connect (msg, "authenticate", G_CALLBACK (authenticate), NULL);
++        g_signal_connect (msg, "restarted", G_CALLBACK (proxy_auth_redirect_message_restarted), NULL);
++
++        soup_test_session_send_message (session, msg);
++        soup_test_assert_message_status (msg, SOUP_STATUS_OK);
++
++        g_free (url);
++        g_object_unref (msg);
++        soup_test_session_abort_unref (session);
++}
++
+ static void
+ do_proxy_auth_request (const char *url, SoupSession *session, gboolean do_read)
+ {
+@@ -402,6 +435,7 @@ main (int argc, char **argv)
+ 
+ 	g_test_add_data_func ("/proxy/fragment", base_uri, do_proxy_fragment_test);
+ 	g_test_add_func ("/proxy/redirect", do_proxy_redirect_test);
++        g_test_add_func ("/proxy/auth-redirect", do_proxy_auth_redirect_test);
+ 	g_test_add_func ("/proxy/auth-cache", do_proxy_auth_cache_test);
+         g_test_add_data_func ("/proxy/connect-error", base_https_uri, do_proxy_connect_error_test);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.6.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
index f9dd5311a4..981e74d816 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -11,6 +11,13 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 
 SRC_URI[archive.sha256sum] = "51ed0ae06f9d5a40f401ff459e2e5f652f9a510b7730e1359ee66d14d4872740"
 
+SRC_URI += "file://CVE-2025-32049-1.patch \
+            file://CVE-2025-32049-2.patch \
+            file://CVE-2025-32049-3.patch \
+            file://CVE-2025-32049-4.patch \
+            file://CVE-2026-1539.patch \
+"
+
 PROVIDES = "libsoup-3.0"
 
 inherit gettext gnomebase upstream-version-is-even gobject-introspection gi-docgen vala
-- 
2.34.1


