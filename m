Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8232CD5BA8
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:26:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16410.1779175557863277854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WdRvhMff;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9599376d2f=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5F2wN3076794
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 00:25:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Q0PvPsfSeoj+1CzpiYx7CxzeXYg5X7NUj4Nm9LrnP/Y=; b=
	WdRvhMffN4Ae13otcAbNsFxniWAn2TnYJ9jLke0dug7zDHfvOp8rRSmtwVm1RGDm
	Noyjnza4QOq1woaynPdHHj3/stZI4L7+patOSJAhjKkDHlblvJa7BXFs+51iy7Ib
	Pga6njq9Myahgyx75CE50eJ+kqjDtIfkryUFNTqO1kwDYfu96Uo+n+vABwntt71y
	EHS7rZZltG3pMqNKNBVJQcKmBkQgbbco04bUo68QDFYylvNipdwM+CBTYzGAKEEV
	yeJO0imjx107nG6jZ23yH9HDSO6/370iuQQRMcplVdtvKyqVu84fSyBTJ9zcOr+F
	N/ExBTAMs/0wlFTDOoPEjg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3gaxe8-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 00:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GszOGqo/71pvQZ4Sb7EuWF8rTRtX1B6+GeiPsTzWbqo46cdFmOzLM0kXSCMCb5i96HkLVy4YnC+hD5OpnJ+Duo2EXiqEWTkC1tx7cv+xOodY8Tp+v0fJQjA0Hadrunj1XJ5wVxKmDrKsVPvI03NEvnbZI/ZCoBwncSRUAPH+eEj8AS4Yb8LNs9Gjv3V9gPeXa7/HMi/MvVOfRPrN2lmWgVsefstakRxZyGAF7P0971qmSEnb4eNNPlz/2Rhee0ugR0+N3AuEGC+9e8xjt4/W6/Nq0CAeZLKzN5hoQAxyLtjEFGppHfvMB+QXLPWuYpf2fBexb75jCs4SOa5yWqgz9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0PvPsfSeoj+1CzpiYx7CxzeXYg5X7NUj4Nm9LrnP/Y=;
 b=GfFwqcTPkdlLbXt1hYq4TFDyxjnazAIzsUOQuKDlOMzkKlO7JJW2ORGMqAEIpY18iuc2cVputi+WHROl3rlNkGdtFq9Xf9GyE+CBBlZesZsYtys5qeWz6QY6PlNtJTopf1pm8tWE2xIHVNFc4HCqNfK47Gga067v4r7hvhGRmY+vyVk7exAjZiQIlWX0M/VN7WarRvu5apeCUqzZEsGZtWCJb0mCow4IvXeuUcWfPgZLu/nXcVI5RU7zhtVPTRV/FfqlaujyhMGDucCxhL2+sPFdtlOtLQoro/c1zb2KNu6uiEDjJvYmf8Z8riCtg/65SVxvs5X7UMvsBu9+S8/G9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 IA1PR11MB8175.namprd11.prod.outlook.com (2603:10b6:208:44f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 07:25:53 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 07:25:53 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v3 07/12] gcc-runtime: avoid passing MULTIBUILDTOP to libatomic
Date: Tue, 19 May 2026 00:25:29 -0700
Message-ID: <20260519072534.24588-8-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|IA1PR11MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a31d94e-13c3-45af-0d6e-08deb577dbb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|22082099003|18002099003|56012099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	bxSQlRbVYXcfUZ207w3I4738T64/onM7d2XULFq9UTpmTlJObswaMVGm6W0D+sAw8c5JXBX2mp7fVv6/UzKDvJB9mwMdByuREXHZ5srTrba5FXZcqvO3JLF2niimqJSwCJ/5gdwF/io62wA1g+xzu2O2R5pOpzipX90qyXMzXrTPlFZCP6agdIVYVsr95sZ+s4JdGJvqq26BYyalbA00en4aRFS2BeKdv8xGwG7hcoigYvm7Ia5hLaFiLTTnmrqnq6OoXyEXQ66X8Fk/ALI+dtsf9DsGNUBcoFN5wpHfsPY0JFcrBcpqJ3wclb5UnpZunzuIYeIezvv9mSm4pXk0obzIU0Y4cRRFhFEwqRUPGWttHx/JOms+v7eQc0al2nZfadyTCZzh1LP7N++z1BGk13ZOC4ddscHMV7q68HxgNQ40Tx8l8teDZ1/K/qrj+pnLhxpTNqi70gQYN5fuSEgyYVDPhDgFb0ylJOlEM7tiQAZPcVWEVFcgr3wPPWigv1E3ai5i1fmV/6F/ZQ0VyL12j4Iwh57uVozDHffwIJTNTPMWYQr+4I5H2a5YTgTy8mhJ8x/j/2VjZ5p70BmdU9XXcARTdLOdwy8hYoKinkUQjDR2tWqZ5JMt2RRT33Ybdb1Rs+qDjVWm06QWh+4/gK51/dhIlE6LHw9BX36XJDIoUs4WwVusx0wH5YcdO+GhJKOnfQVzl9a/oLavv8ZX9AKaqXKkYyUTLQeJyBDasBD3jGk+s6Xp2UnqCzuk9/jwvNBg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tHvE2yrGEf6p9e7tzPF+BQCMQlP5fF0xCWvf7q6ooJznwTYJeJHlui6Y8QXd?=
 =?us-ascii?Q?tlmgyriv+WADBzmCiiiFMvq7mNptJWhKGroYFFvoSrgg7Glpx4A5Jh2ED0Dj?=
 =?us-ascii?Q?sRUNer5KUQdggOcwWyzMjO62dtZprYKi5XHyMcpnBV0wkY76mg5LE8hP13wZ?=
 =?us-ascii?Q?yXx9x6RvzagZRK68igtddg6dqotsra9fNj7rTF8upNk30XutlTy6lUT+J5pF?=
 =?us-ascii?Q?UhZXAlQXMPv0+ELcWiyZW3/aEIgKhTL6mFa9Rxhe452gC5xpNcPfk3/MSacQ?=
 =?us-ascii?Q?KCVBNw6pmLFxchM71ugNFbVtqF7NtDSql5Q4yR4sqoy4IXZh3HUfQqFlYin5?=
 =?us-ascii?Q?78c7CoTPk0F4z8GRUNm4VF+yaif58+qqmUU/8BTWWgQQf7H1wBGTmfmI3WHD?=
 =?us-ascii?Q?RDhktIbQEQnlJoDXoQIoHiuqFTYkR5lhMj61fiE9V6mU0jC2KAMKIHn7aqJh?=
 =?us-ascii?Q?Ly4t6bEFbiuN5juCGAg5ZLd4urrQc671YUakO5Jp8IcTBQF6peSlFlesKKCh?=
 =?us-ascii?Q?+iIWMTN67XQGUwtoJO7FP6l9G3z3fPQpSiHdDVEA7sHXgkHBIpOx3uBvZvn0?=
 =?us-ascii?Q?q3wbEnxSsWOSxX+ksCxOKEQ7287wsuNoUMztdBUmcBZ/uLuVNcvATbATEO/u?=
 =?us-ascii?Q?UgBbjEqapiLZvM6Vldy/ur9SE/cQnaw5kXlT36Qubj5pZkFJWiUS1qM0X6Ln?=
 =?us-ascii?Q?0ZtSqvybtUjFGJU8GPfEgvtGOiAd2019/Le2cYaMzHU/lxK4OVB/gD7yA18R?=
 =?us-ascii?Q?xhcPP8mUir+22Br2KE+6QeLXCF6+WJ0NAFOl7HQSa9RPIaPH/4C2+TUMnIp/?=
 =?us-ascii?Q?VV+vOG4PbUIsy3tmBz3lnSWj+NzuAy33Gse5KubVDArNKn4wZ7/OpHIePDbZ?=
 =?us-ascii?Q?a0WHwg7BWDSP57oCqrpz5CX8cpwiWM9BXVV73CNcqQcS3inx90P6BgYRlpVo?=
 =?us-ascii?Q?pUv0LIETygMYTEDm3CZC90gGZzPrQF+Epklv0ToXvjt70RH2VOGBfnrq8R60?=
 =?us-ascii?Q?7ZwVNaqqSr5s3CsDeFjqwlYQ0vSHWBr1fhfhnAa31q6cBEdcX9LKVCDVyHCh?=
 =?us-ascii?Q?Usy4YLSDMfwCvDX+k4LPs7r3nXKgvf1WmXEEVDJ42DyvPF84zW/MH3+GhatA?=
 =?us-ascii?Q?OgYOEXQjoqD04DIJgunCtpY2KVOy9k9kAFE8XrXpoyAwJcZFrfP6tpfZz+AO?=
 =?us-ascii?Q?w8nQUawad0gg42U85fCI8AfKI4XSpiYMIjFjithGMisW9v2fesMcoT7qCV+V?=
 =?us-ascii?Q?mDjgXqZ7u31vrnHc4+pGEBegy2U6/FQE6off2Uj7rOKmchY/CyuvuvwLe7Kt?=
 =?us-ascii?Q?PvDlLvPz/F32a2O7UDo0hhLjmdlSTzauFpBNRmPgIFWCYl+NwDuhjHwmfeWy?=
 =?us-ascii?Q?9MnkkHMtVxWsRRFNBxs1MIIvW5vVjDihYqp/TyPtDa0sMe9Hf1Q8WKpufuXw?=
 =?us-ascii?Q?YTlpWLuDuRxFOv5cenP60SKWsvJqvQXv/6qOHYyzUTSInZozsu5pmETrbwfx?=
 =?us-ascii?Q?au/b5gZryr9HooKEh8aTLi00FcTHVSvSue1imA+VjqYjmHQYvzO001gj6dZ4?=
 =?us-ascii?Q?ObzE6aFNOfa7msB4f2m8gmawKqfaAPKWWDJZnWHW1XhuzEnyOnjk4H+A52+D?=
 =?us-ascii?Q?uO43k7/XkfX2CnIderQDQmB8z6e6gX2hrUs5QoGhWfCyH/ehzJdpNII4ORB9?=
 =?us-ascii?Q?IcY0N5IWkJCqlv0SCloYVtvB+vGJ1IDrBwqCGB9yTvIypBPAvsr8E0G2J3wb?=
 =?us-ascii?Q?JZjDuYKK2uqJsh1xi9awUxW71aB6A34=3D?=
X-Exchange-RoutingPolicyChecked: 
	WGjmOyewZjrNZKBCE3JDkMnbwh9wd9pv3RHnPUOt+ZCjzPxQc5J6xDywN46zllqQscvOvOtFN2NC1dVYNCZnkuKCGlrlxIAXIZ8HYdORGuO72PdVXEiKmqnY4H9JGebTmxIIPXt6uqLPV8N1t1L67sgdMUo0MexYzkHH8HaYbd7GHkW7LBSajDCMyuB36980QIixwaI5CbTDGrh1CriTpbP8nDpg9zu+yiKC8xXPmglA+OVtBX/qvie7/p3oH3HI/ttoqZzGbt2D2qTCx+hvdoV/E4dos5WMaQP9I449EjzNgwsmIHKaJyx50KXygsL7DWIEkrPG4xAKDNHnMQ0zog==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a31d94e-13c3-45af-0d6e-08deb577dbb1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:25:52.5844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYWOH6njv0/rCLNGeXxi8VujZQPMCC499gJJSpKQX5vwBwC/HBJtLY+thCHLdtFGjCeeuByvbIJuZr8+e2cpHL7YEcFu8G5FKMx3Ik5oZWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8175
X-Proofpoint-GUID: B3zjtzvI2_PMHnOfS8QGjLyVxbZTuQA8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MiBTYWx0ZWRfXw5I0P5I9rvhZ
 iJt1vhOwDVuIHNG3f1ccRvBu3pnUtax5QVqFs6JzL4Sem82ScyCVqMZOKTqnAG2qOB2kMkwGDF5
 tBCXW/7dFeI6d6DzMao72JGrPEU1E4V0A8JLiKphb/fSIL3nSY6xI2cDiROAfSesSFIMidG1zAc
 pcO6WLUeyrW8kT158N+MMpE9DA/XL/1Id91cV1kMYacIshCnBuqVeqJJdQCKngV0Y8XZYdc4yzG
 vNKOp0lbn6Stxox5nUGbO4yTlL7Vqf1ZakDG06CLRxAQ2jtIdSApBdpxRjoPIuN8vFTrsxLh8Lc
 kI8gl0hSs27gXdbNfJpcmKcZmxQOz1/ojJZOe0nQBSR7NVOm7oNWQ+8id9hj9F9dNbZzLpgd4qH
 gdGcz0UBISNtEj4Jrs9FhqJ5gPuXPAX3/cGnG0hr867Ju+KCLB5TEZpCrt9D/Rbxh5Iz2PJi/3g
 MNnxEHPomWazVPaY6TQ==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0c1085 cx=c_pps
 a=LdSsacNKwWtvIYfRw5AjOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=ggAbHpMFlleW2AOwp04A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: B3zjtzvI2_PMHnOfS8QGjLyVxbZTuQA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237280

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

libatomic constructs gcc_objdir using `pwd` and assumes
MULTIBUILDTOP is relative. Passing an absolute MULTIBUILDTOP
from OE results in malformed paths during libtool install
operations in both compile and install stages.

Avoid passing MULTIBUILDTOP for libatomic and use the upstream
default handling instead.

Link: https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 30b2832c82..e305180c64 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -83,14 +83,22 @@ do_configure[depends] += "${COMPILERDEP}"
 do_compile () {
 	for d in libgcc ${RUNTIMETARGET}; do
 		cd ${B}/${TARGET_SYS}/$d/
-		oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/
+		if [ "$d" = "libatomic" ]; then
+			oe_runmake
+		else
+			oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/
+		fi
 	done
 }
 
 do_install () {
 	for d in ${RUNTIMETARGET}; do
 		cd ${B}/${TARGET_SYS}/$d/
-		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
+		if [ "$d" = "libatomic" ]; then
+			oe_runmake 'DESTDIR=${D}' install
+		else
+			oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
+		fi
 	done
 	install -d ${D}${datadir}/gdb/auto-load/${libdir}
 	mv ${D}${libdir}/libstdc++*-gdb.py ${D}${datadir}/gdb/auto-load/${libdir}
-- 
2.49.0


