Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A25CD6E61
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 19:59:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8349.1780343986852615621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 12:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LvaCA7oE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06123b62e6=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651GxKrR3929350
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jun 2026 19:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=N7Rp2RBJ6x1zGgP+HxrltQj4w28Sbefhj3g4jVXM6sg=; b=LvaCA7oEnYeE
	5YmCI/oHaRcCktOcEkwjqy7ddTB+2eBALFRjM5884yUZKJA+eS7lUyMXnKkM0VNl
	+20/sgkNxTGrU1zVsNPvEgRC+2WHCA61d4quEdskB4kw8PRRIrhvzOVOWOOynaX0
	c/jbI/1HIn11hgM5tD0rAdzfjgglKnlo6k7i8Z78MM690ZAi04VWGLZ5G0jhM/2A
	VMaVE2Ni2jtv4UgdRxPWt7GsYS1DErLY3hJn1qAtuWLAEpBntmMzbmyY5ItGvN1Z
	jtZLuAXVYWQE8f1OfcpelsFMppvSym2INZJk1u1TXoPOrxNBWkFj1R4GW0QYoPx/
	5S5sIRot2g==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efn403qtu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 19:59:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tw8GJQcgOXMO3JIeQQipeSe+ail8XFBe61zLpWgs2pP94PhkoGwFegbnVHtvpoiV3iX+CsPAz0tXHAOWrq29cztkrG0SIvhvrAPNGzszmgrZqawmbqjy3yRcvqqoHYAquJjQqm3Oko1iqaa4H3E5qo3iFiiYoOq3O3snmvCb+19mZYqeRzG7O/TPHwoBDspXp16/OxE4S37h2W0h1RcEja4A72YF5jzFyC0SY0bIzeVTbbUQriXB4LAYH7QQrhPaenPoRsVwZ6/9LbrSWHQVNtiKFirRJ6F4kwicvf/0bgSHRis/3KaCMLMMZur8IzMpzf8vXWHusRyZTfVVob3Gbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7Rp2RBJ6x1zGgP+HxrltQj4w28Sbefhj3g4jVXM6sg=;
 b=MgWoPpjxV8NpNsab57K7fzbxJmONvM3hVx+c284NJ8K4PpEAdifQ1UlTnb3B29odPkDZnuoYhiomi78Hqo6Y/4j/C99w1zW2obkgNg2+5xM0NieLwA38N7CEH2/ihvo61Z0Q+p9UrUGnjbZDCEuwSR8rMwsPOwdztJCXo8ZWyOR1dbSCFtML+JMnfC51vWbnT+rwGWnFrolCVZK8R82nT9erKTQiWz9fb2t6yigPjJpcoP8pXvySUr8hAJAX8OKcQti6pgldi6tKxVZo5uLSbpSQ/XTUKIjbH46fZuOuKtFP+m+8qeEzBAlWZ/JNbcUjcYzeNL1AjtdBpfWnDWFb3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by SJ5PPF8F93806F5.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::845) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Mon, 1 Jun 2026
 19:59:42 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.21.0071.010; Mon, 1 Jun 2026
 19:59:42 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6][wrynose] cups: fix CVE-2026-34979
Date: Tue,  2 Jun 2026 01:27:57 +0530
Message-Id: <20260601195801.4008899-3-Abhishek.Bachiphale@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: eeb1da21-392b-4804-8170-08dec0185208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|11063799006|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	P8bSZrixVQPsoXxp7YxhA/wHu0J17NSvfPVbacDrhtRTcEb0P9o0f6ndtQ29PA7nmd4/A3PSc8ZQqI043fkErAJo5F64eOFMmmkVCuIpNgdHWhqi1fufwIqp/KRMkZz4FMRTFV8HOiUIAoMjRKrTlS8YWsPMwt8QNsTidKA57qK2GrXiLrVSAo9S/PwGoY/snR2Weaz+yRDZ+/Q0nzjwQ8wxghv2VIyQI3debQS7dEC+b0dJ8YH734jkejHrzoPE3y+Qbz/NX+IMHBWmMTH6OifcyyQtlpebKhlDTaABzWwL74GRCtKMXhhKece1hSGtTKtARQipMDeN4lCTAJC6GqcfHfoWPwmMux6jdyL55L8U1QD9oeP6rFyUs+UfhBhn3dSdY7jHJUtyK7n7yktvkF2WRNI/sLM1GSv1uk+T1CW8dSXqMenf4f1sxM34i7ZTOOV+18YhDP6wtJtd+9D/Dmik5OXyeLSkdhKumMPyqkiS+XVwcqgY4dRJ15NgphPXsT8MyZfgalfEw2FY7Y5IlqVK+8oMUmiNCd7aByfKQOeWxPDFtDWzokxXYPaErIOnWqC4Q1p+5e6IzBDUOu6qFXFJjBYx7lNdSs86lxpeighPXATgM78roqtfW+dAsRZfoapXPJN8WEyZTF5qw09LsbBo+JeoFm5kH0yaQzVZDPR7oS+VnaGiqFd2QBgQc4bGC0YMFwz2xE92Q75oZpIpTrn06JJiM/AmRcfj5ynoW6O17Nih4KKhNJ2RzbWisqb6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4z58Ot63X69a6p2epYiyZPiHZfU7Tcxb3l/bQarOzJugMBAEJv0SSlQv4Lqj?=
 =?us-ascii?Q?GOjMvb9kMunaWUYzsmXy5+DzCr3HHwpQD+FnLtjDlxoFOOpumvSu5Z5x24n5?=
 =?us-ascii?Q?yaq8TFyVg049OwFTEvMaPvlBz47lTL0n5UgIZ6BGQCPqs2QJzJRsN3IMYNid?=
 =?us-ascii?Q?Z/SKqW2nvn9ONE4jBo3/M3MEd63ZJ1dYoqrNDaTJEgPonmAknWx1odJvcDcX?=
 =?us-ascii?Q?R3TZ9Zk7iwqwXBgLdXKlZmHwSRFHFMKw1F0jMz2xiVw2Ji9ZPHx2JUppPMgp?=
 =?us-ascii?Q?+BiZLSMRe3jKAeEtoQr4T6pn2gcH4bl0DRU15UlvUhXG9W8tySaIRQWXsqmg?=
 =?us-ascii?Q?O+61f3wDIo3NGmoMSVNox7tZQR/prdOqNTVwuQgD69A/4seDhCVrcm3sJ8Qk?=
 =?us-ascii?Q?En4z4LX7WOM+X+fpRrp4ptDiECCAnjSqCUrUD4J7cQCRtq8PwXzYPXPTfcDg?=
 =?us-ascii?Q?a+gRMW5L6CR7ePAiqgzBl7CifJ0nWHMagNkzURaFHSXhzwPnabl9qsShQPF2?=
 =?us-ascii?Q?uVGaDPOAm/aiz1rHkLWiuq83TbHwm9W3HRlkt789Zxnx5Zsbtx32KwQ7Skcl?=
 =?us-ascii?Q?swTfiHcXPEoa+GOwr8mGTWyxuw1vzz3ljmh6J5tRxswPQnn68yWFDhNp6HFn?=
 =?us-ascii?Q?o0a2hEhjOD3LymDXz74W8VkTsyXqHOjJT2URjJHwPr8ffZbRWl+7SZvNcArM?=
 =?us-ascii?Q?Wr4JuR/7/UBO0acufD10gn3bIYJdf3TW+r9okREUq4L8D3bOqZXc3jZ2KH5F?=
 =?us-ascii?Q?cfosnrtmjyPyS2V+v+0u8YetupeG/wjbS2ONnEt/eEeNH+/RHis78etS6aMt?=
 =?us-ascii?Q?pXRwcPjZc1L+4IeLQ5qVqq2akfwNHtjPJIDdf/P9LIUJIVIysamqjb/PEUVr?=
 =?us-ascii?Q?2O2FEWa9/U7lcPAqQcgwnk7ljFVsvn2YtEaF1LT6oyOYqFJD3nvvC6bNdSMx?=
 =?us-ascii?Q?SG9gzT024/lyZUnynEX5a64EpaPVmhXfkaytN2c5WQid7fwNnw/wJN8fqC1E?=
 =?us-ascii?Q?ie3VQ0mAydMEWP6l2FY541ZxiUtHlD5QmuJ0lNAFa5gl9lffv+H3aO0VQB/f?=
 =?us-ascii?Q?p+eM5r+tO2x5oDfiOOSfmKh/CyPtGyAjVZls1H6Hb1UGCjOGZoV63116Chjh?=
 =?us-ascii?Q?3Me9LOyHUXTfbKRbi4fKTleg0fJgIUP4iELGsw2qUAqhKbMi/xVJJ+nvsuf6?=
 =?us-ascii?Q?jqU/oyY9hm5ssdfvqCGNgumncy/8+oCWP0BpK8nrpKFtAI3/pVas6yfuLAt1?=
 =?us-ascii?Q?2x3fUp8AC4vdT+Axnc6IEKb088WxyTyMuJEiRRRYEDGebwD7QBfRa5tXgli5?=
 =?us-ascii?Q?CDMPuT62xo8wW3TxTKeBe7VHs8lUrsFm0iYE5EAVEJ0fFX/Ng/rxY4S8YGO8?=
 =?us-ascii?Q?LAkND/fZcc28HOssk8bipCTvc65DPvqSx0cwY2cmaY/gy2WzbVXxBzHUDHct?=
 =?us-ascii?Q?AVzQQI6bGFdltzvVL+7N1mM5QV4CKX/4pdG9ko/+o7ZYEdfOO4d1sy7XC+rm?=
 =?us-ascii?Q?OEf+/yaIbEfMw7E2PUYa14ZsIVRFCj9bTByOjTZa5xYXVucNNpqNEUwLXunx?=
 =?us-ascii?Q?e6XzG734IBnkUSHEp+/TYPKffhKsCCWTr/akjy/k6/bnlggjP0vsdDrzEYty?=
 =?us-ascii?Q?s6NQF7LBDs+HqoIPZMfHsy4JxIFdM0uxS9AW9YCWykvVbz1vVV/WRPF6oIUi?=
 =?us-ascii?Q?ppe3xQV0dDQTXlYnu+6pEtEKIyCjs8BGEoFtfdjs4QsCY97Ik7d1e0TpGD7G?=
 =?us-ascii?Q?Ue+kqC715AffayH/1DTIz6/e95my9hC1I1oAwHb2NpLate0HCqAM?=
X-Exchange-RoutingPolicyChecked: 
	M12jPISlaYKSonCFI3UAuiUr/Fz1z3WoDSmskJ4sj++BmiLctyeuwdCnFPGH0of4icq4mNeaarS6SUwX5oEwQ4inYlWsn8zQjTf89BV2IE1V/mruNB1YnrGIGjyNnunRs2Q1TnOxaPt4urdPJ4/AA/EtyZjKoaXwd1VnY1VOL2fi91/xU21wN9axqTunBRRxk1tdcdWHu/S1gFqJVOjbRYy3xtdzDgQ89xlx0OVDC/44Cu/eJiJbImdhCAqdh+yTXM8cTYGJJ3YLqMTrR2+NteU/MFHPaFhhA4y7mwrUaMw5Mt2xBThyxfqg76idCJWp+cP/+PF1rz7DdvxgX7pR4w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb1da21-392b-4804-8170-08dec0185208
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 19:59:42.3182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kp0ld941/qFDGbTVDb6rSLOzoR36V9rIOLb6FXWn+LAmsaQ0an29RVzPKqnNimPnUU0ENPdYtWMlRk/KFtn3X3tW/5GThsCxkPsn5o9qK+SoM+m/ws89nEY5BR+/bzoZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8F93806F5
X-Proofpoint-ORIG-GUID: IsBMG9cObFR6ZfjnN66Ldzo7r82BmiV9
X-Proofpoint-GUID: IsBMG9cObFR6ZfjnN66Ldzo7r82BmiV9
X-Authority-Analysis: v=2.4 cv=GI441ONK c=1 sm=1 tr=0 ts=6a1de4b1 cx=c_pps
 a=zHP1L1ZDY46t+2XtVYLmoA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=F_ubicZDAAAA:20
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=aTVoPYTGAAAA:8 a=cs5WjNhK9Um6JCP-w5wA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=rKT3Ez47ESLuxQAP_tCa:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE5NSBTYWx0ZWRfX1I/twSvxLeOa
 Vt2qDpcv55y2hPNLHMFsSwUx41xlvLhqOK0Hbph8sn5Red7D4TErP2aNgMa+3ViROnTyxd40fud
 RJQmmcEdZdvXSVWdY1JYbS9RoirJwVigHQxUl01fehQEuiaILqLYNyHGlE6aSrHfDqqv4Cya83L
 ieMKa7vQAZvybFNt/1vB6exa/PLjzoxFtra5VGa12ElBZCRrdqSgIoyxBCMzf1TBglyxaJg9iG9
 7U1ikgAZY7ePEI5gSByjDu+6wlRENH3cb98AqnDeth3YDAhSwqQ51U5Dyh+GPktWGQFnaJy8088
 s6K/7fLtMZ2slFu9JYjxaShaiRnzb1sw14Bqtvf6qr34fvtHNIVnkzTJQC5+H+siLH9Eh2Dpz9+
 8MVvF6h3zdSi63LJBaXzS/ERwWVnHJ4qwDmgGThKTcaBQMk8gprY4OUoqTbisBP6Bty4p9lPND1
 ZhVYTE7uJ+L12xCRKMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010195
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 19:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237990

In CUPS versions 2.4.16 and prior, a heap-based buffer
overflow exists in the scheduler when building filter
option strings from job attributes. A malicious IPP
client can trigger this overflow, potentially leading
to memory corruption and denial of service.

Apply upstream fix to ensure safe handling of filter
option strings and prevent buffer overflow.

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-34979.patch            | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34979.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index e739cfa579..78e0495d1c 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -16,6 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
            file://CVE-2026-34978.patch \
+           file://CVE-2026-34979.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34979.patch b/meta/recipes-extended/cups/cups/CVE-2026-34979.patch
new file mode 100644
index 0000000000..eefb2ed43b
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34979.patch
@@ -0,0 +1,57 @@
+From 0ff8897367c7341f2500770c3977038cdd7c0214 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:50:06 -0400
+Subject: [PATCH] Expand allocation of options string.
+
+OpenPrinting CUPS is an open source printing system for Linux and other
+Unix-like operating systems. In versions 2.4.16 and prior, there is a
+heap-based buffer overflow in the CUPS scheduler when building filter
+option strings from job attribute
+
+CVE: CVE-2026-34979
+
+Upstream-Status: Backport [ https://github.com/OpenPrinting/cups/commit/0ff8897367c7341f2500770c3977038cdd7c0214 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ scheduler/job.c | 16 ++++------------
+ 1 files changed, 4 insertions(+), 12 deletions(-)
+
+diff --git a/scheduler/job.c b/scheduler/job.c
+index af6390687..0494d7196 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -4192,18 +4192,6 @@ ipp_length(ipp_t *ipp)			/* I - IPP request */
+ 
+   for (attr = ipp->attrs; attr != NULL; attr = attr->next)
+   {
+-   /*
+-    * Skip attributes that won't be sent to filters...
+-    */
+-
+-    if (attr->value_tag == IPP_TAG_NOVALUE ||
+-	attr->value_tag == IPP_TAG_MIMETYPE ||
+-	attr->value_tag == IPP_TAG_NAMELANG ||
+-	attr->value_tag == IPP_TAG_TEXTLANG ||
+-	attr->value_tag == IPP_TAG_URI ||
+-	attr->value_tag == IPP_TAG_URISCHEME)
+-      continue;
+-
+    /*
+     * Add space for a leading space and commas between each value.
+     * For the first attribute, the leading space isn't used, so the
+@@ -4279,10 +4267,14 @@ ipp_length(ipp_t *ipp)			/* I - IPP request */
+ 
+       case IPP_TAG_TEXT :
+       case IPP_TAG_NAME :
++      case IPP_TAG_TEXTLANG :
++      case IPP_TAG_NAMELANG :
++      case IPP_TAG_MIMETYPE :
+       case IPP_TAG_KEYWORD :
+       case IPP_TAG_CHARSET :
+       case IPP_TAG_LANGUAGE :
+       case IPP_TAG_URI :
++      case IPP_TAG_URISCHEME :
+          /*
+ 	  * Strings can contain characters that need quoting.  We need
+ 	  * at least 2 * len + 2 characters to cover the quotes and
-- 
2.40.0


