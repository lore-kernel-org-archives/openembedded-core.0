Return-Path: <Roopa.Kalmath@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4202ECC6B08
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3504.1791885540478423454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P8cA9sH9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4746a55667=roopa.kalmath@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D2VBdt076962
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 02:59:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=A2fmL9TNZq4QtMPKk+iKQkDegIJXSYjuZBY5ALhUpV8=; b=P8cA9sH9r37/
	y/1NC3MJ3gjzkw8VFpnOqzw+E0cWGyq17Cyn/b7h439JXF0ZDahgANLgPhO9h8kF
	XMMATkaMOpdMx4QGhDyYmEHjpgaUhrMRy1cPonc9eWQqS+/GIYDErbpn1bKNhjUF
	E2VslsMAI4a31TS321qsjc2zHM/RkE2Nil6RQA/weNMGntroN9JtXvlTKnlB3BpO
	KfJNgYgH3Mtd/lAjkxrtJHTH5oY1EY8PlpY0pBudFJPPuA2QMJ3glv5N2SwK6SW8
	EKwgoBian41Irs2I2+Qx+qYSxCxxEq22yJJ2xoa1sAUmRWDYKIDhGN/X1Iiht9xw
	cPviN4PFSw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023129.outbound.protection.outlook.com [40.93.196.129])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h7gn1bmkv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 02:58:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8JAgli3rWxtFiDhTIoVDxrhkuDRxAn4M30f5bcb8OUAJuL5Fi+T9JXi/elo/GMvUArDIXoXgvHQzNnJjzDCC0cnexGuFkaeT8kaiv4U7ydRCZJs46TklIpQUC3bi/5FLyTbb/+P9DJsBVxT2FRB+UNJOmB3kbQ+S0VidTh73/2t8Y7gggel1tu2fJ+eX2dG1HmRNRg4gqLBfuL3LYlh+IT7lMvhSbH8VkrFxxYoeuB39v88gYvjawcaO6FwW7a0Os3HGhrC7rvCCAgs+xGBnBqpqFOCwTkrcr7lt5AZ0pFb8zMCz+bmHC+Dr8bmS/wF/SsB+SRW41K5BNmhEuNV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2fmL9TNZq4QtMPKk+iKQkDegIJXSYjuZBY5ALhUpV8=;
 b=NdKHZZTmfz3Y3e4ID/QyvL7gY2Rs3w65yUA9U9cHjLYQgAUsn3Tt3QdZvw1/u2mvXZGaulGxOLupfzdU62Ujlozr13wX00Xcs8IcRhfB/rvN2sAuTKNRXNZDDU60U/SmCXahxoDqgno2cCj03ehL1P1vFbcjdG9zF/0kj9/4/uaD4UxJ6JX4ManislV2gkqmdmYpJIHDSy0tWAlHevP2usaoZRMIZ1/Vufazdl0jEIFlm0DqFqQuT8br8WZ98mcHVFsYFrx56pl+1bDqUS3JX5viThLo9lv0paQSblcnYtdYjny/Ngmvv0cW1r2QZwX5HWKsVyn6Ck9/pFTxYuE2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24) by IA1PR11MB6291.namprd11.prod.outlook.com
 (2603:10b6:208:3e5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Tue, 13 Oct
 2026 09:58:56 +0000
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb]) by SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 09:58:56 +0000
From: Roopa Kalmath <Roopa.Kalmath@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v3] u-boot: fix CVE-2026-29009
Date: Tue, 13 Oct 2026 15:28:33 +0530
Message-ID: <20261013095833.780884-1-Roopa.Kalmath@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20261012111417.3043587-1-Roopa.Kalmath@windriver.com>
References: <20261012111417.3043587-1-Roopa.Kalmath@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0038.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::13) To SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB796993:EE_|IA1PR11MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 11008704-b343-40ee-a53e-08df29109841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|10067099003|56012099006|260925022911599003|6133799003|11063799006|261009223027099003|260925021911599003|260925021311599003|38350700014|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	c2Mlm6Y63ddftAoNJ32pvVcJukEp5vOf05iYaF5d9BHCZvMO6aP4eKRHRkyKWIkT8lmZMrpEoyv6Uk2bN5hwORaTHYJOpVi2jiRciGAmyAV3tHwshacUbkAelTE4ZDRK9IroV5KqBFS9NiRPiCpg93cVKy3hb2LgNOg2NdPBHnwkTlpWEdV7vuTGC62/rI4DhN7h+/RXhfoHuSBhcZ5vBRcnCscre2ZynyKrf/xdtK7/erAC9Cu3Mg1YZ83s9uzbhnSmfPE5x+PWDSr9ulbd5qny0ZhDIsTj9gZ8y/kp2KsXHHFBFwsuGSpievss+pf7Xa5RgPO5tD+CQybgAVTBqZxQ2hN/vGrOT/bjJIiuIqUCxMF4YLjWPYvRLTKjs6hHME0vUi8MouXB++RCW/RS9VSWkchN/1WgOrcl+q+weWuomP9uByT4x93RrZC5brm1Ry29ZsQJiJwF3vip9ma0/aifagHmS960YLq/SFakuC75Ix14elQzuiLyMU5/jT2wDef3JQBcWOwWPn2sQ0AcuMQdJD9p0pJ4+uhUe/qJM8M4kMRHflklJdopHWDws6zSF7n1sgyRhgku2sMvj55KwlM9kLeKu6eV/xzT11OlYgWLhg2FnLfkYxLjhvhLVmoG6LqHaJq2vNUunsPRguNDwystjAHy1HhCpj2UvYkDPnk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB796993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(260925022911599003)(6133799003)(11063799006)(261009223027099003)(260925021911599003)(260925021311599003)(38350700014)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xRr+poGfZFSZZ913vEKgyxHMn+nIdVs5edkBvGZdh3LmNJV5iYRJR4LNYf1H?=
 =?us-ascii?Q?aW0EP4Nx2xtjjO4oAEesrlmSFLacxaJzxkTSIuTrNQCjJMAqq2o2nK9H9OVD?=
 =?us-ascii?Q?iWeiQFYXpLSspwYr7gl2ZA369LNO7BVktOuEvprhQ+hu8dEjd+h+3kdZASxx?=
 =?us-ascii?Q?TsOCz4iT754reJptmVd/AoozyCgFMENxkaPFCrcYBgHHcG4awRpS+sRNUBqz?=
 =?us-ascii?Q?1pJ1Im7CapzoLTgJ6LteqlwSX/taejIY+uBxwcfvCtdrGJmfjqhpcjJIFtwv?=
 =?us-ascii?Q?AsLxKpOfI9RHNhs3paPMktmnZXIsqHRWLcHoBHNoRJLVZiRujUnLzr9jn2Oj?=
 =?us-ascii?Q?72TT4O6JfmF3BIf98ffuwI9WjN2ryXbCkIIeMlqv9od59fLIWPGnVL1FHQjN?=
 =?us-ascii?Q?9PJYHhmovmm4zdcAqww2ELllhmbi/th/WUpijKTNmxd44vBBF6nc7dFKZymO?=
 =?us-ascii?Q?n0J4/NHknNrlQp8rvyjgGoEY3b+u5sxcH1j/5usXoFznpxNLIVLZxotlXfg6?=
 =?us-ascii?Q?Le2wjls1GcSbPBiZ2YYmN0/mH8PfXu0Hxu8Si6sKEZv5/kKhdbUmUCIB0hcn?=
 =?us-ascii?Q?l2DNiUxEnakvgrVjDKWYbDLY09hhbPTmRdfWj+aB9z9BR/4sz0iIJhOnRzpw?=
 =?us-ascii?Q?ovNzbVyF9SVg+eJd7unITztIrhj3ue1WZbtQssw5bP7OGdkVBKee+Yg9uQaD?=
 =?us-ascii?Q?NdCzzjy9V0m3TXDo+tq5taDHCNcYmnpJwYkNWv03UWWMPctu6cEk7df/nHCj?=
 =?us-ascii?Q?Rw6lIoaNK8/LO/Vjm7+a2yduEPpPhRJruI6Z3kRWZX0UACTGx6jaXWyqM6Mf?=
 =?us-ascii?Q?dgDh19Yj7WAj6ajQO6ZpsLECZ+fflGDDC55iLC87gtNK+hf0cO3aJhL2rsuI?=
 =?us-ascii?Q?arl9glctFkn9wDtaH8sWxw5oglXCKZGWCJUh3I+ir6SJ9A04L45T0o31GIMj?=
 =?us-ascii?Q?1NoYhgwsSXgTSSkSVTY7/gS3RUNyvGiqT3JM3SoScwfZvtTIBH6bfuPn8whC?=
 =?us-ascii?Q?pHcVRTB9KrFVuCgNraA0oU9WCwvlBs57wRdTK0YgsIq2gEp7RDoTSBKwM3/e?=
 =?us-ascii?Q?ke2coRk2cX/sR9Z5xXxih/l/JQQcboYoZ4r+uVdscgoRmuJAejrJqwdacifr?=
 =?us-ascii?Q?vQRRW9A91uRH0Df937RSyNGBedphxOBgr6LasAs272eLOXbtCpMDSdL1ErST?=
 =?us-ascii?Q?OfF0BfItGwzx/MxQo72ppWZmjsd0tx+5/tVk7BdUfUbpcOcGekJ7TbAjjJ91?=
 =?us-ascii?Q?CMOWxAff8LluqbnTd4jb0ifIMFNte2MhxfdhckffQHZ59zzp4VMJudT/9Fdk?=
 =?us-ascii?Q?Te/WIG2q4q4SO6efEMRAxLSIeneY3WCenCllsIpTqEgIsaK+/qomut6nctZl?=
 =?us-ascii?Q?e9QxMj71IUy1rigq003sUTNbQcGpe0DNyUjxHhyiAe73SOU+frg/n1tsdLU2?=
 =?us-ascii?Q?yMBVC6AgpdS8zlgY2Z2+tLZq2l5J5I6Ru5l4m/CtImkdpJJy18glYvt/nKob?=
 =?us-ascii?Q?8e/eJrqGJ1OiN23p5e9++9kmxhSgsBtnDI41atK88nsGpfD6N/Bg1LchCZQF?=
 =?us-ascii?Q?6W1+Tmw4aA2+G+eAU54FFKyWeD3Uv7/1HIwT4Ct+1V5+C3zlhQ+/qcOorYeY?=
 =?us-ascii?Q?Kq/Sgl5325w/FIGSLcjDl9xnEey3GpVam7cqQEOjTeMj3ncB2WK7DaxFz3x8?=
 =?us-ascii?Q?+XSVDc+4S++fptjCqfF5QVhuD3LF9vWleiy2yzbS/Slz0VlKMk6fLq7d/XpS?=
 =?us-ascii?Q?qJ5dICE1UOZ/UF3G1pY64DfKE+3eVsE=3D?=
X-Exchange-RoutingPolicyChecked: 
	oGtVadbOW0F9DDEy+5rvyBeCW1VuxyPBYKNota56Z4ev/3KAi2mWLDYrHBkRmsAp1C76/g7NBYLNNyre4F/L3e0LcBk4Es//uE3Vyb3Mce1KYoFaoMp2/frC2HgZpyA85r+XyjDqOYe0CrfnluVPeL5L3ldgENiaRvGVlGMVUU+obt7N094AGw7a2aJBFfXkJFg88lk6mF3N0JR5TgaWOp1oR7rPCtSKKPwqUCTsHS73UeZhi0Xbffe/EG8x3lcVJ9LeSgr+SF8kobi9oGbSNQJnE9DBo7eARFM8ESYuA4fFuRn58ws52aG3Hmjp0j+0i5LT5yXSCBNXeH1Az//hAA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11008704-b343-40ee-a53e-08df29109841
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB796993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 09:58:56.2510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBHg3N9XmxyAsrs1SWxBqrfPNLsIUnkKPDc9ZR6DsttpYGOhwZ1kwbWDXxN9iVJAuNgmwwGsxzpo33rLjO0+Y6vQV928UZmrzwCOMPpgp5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
X-Authority-Analysis: v=2.4 cv=KcNHIgYD c=1 sm=1 tr=0 ts=6ace00e3 cx=c_pps
 a=R6SrqWxOsMs7v49b6WFfjw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=1VxDqnHFAAAA:8
 a=PYnjg3YJAAAA:8 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=7CQSdrXTAAAA:8 a=5VOAlF2PV3f620FalIoA:9 a=aZ5uHUMKh6B-zo3GvD48:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 2VdNqOWcJ1zJvUqE7vsqTExUPTLjWece
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX70YXxpcZO5i9
 bqv23kEL8wMN2pN+GjEfIR0/W7a9417qBxmrSE6b9/z2372VSQX89Z+Niqk/boxwgz8rA71yoUd
 eo48cBJKYzZ+k+80it6BpK+csDzHcZjpImzPW25LGRNvqai6LpAr
X-Proofpoint-GUID: 2VdNqOWcJ1zJvUqE7vsqTExUPTLjWece
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX7fH6LqlLMnCf
 58DTJ4pjbuL58roIhooMNuFgm4WK4JUUZZoq2SVJeEiMnwmjnX8olntWIDX4ujJ+2fZaXGL0aoP
 AWPjVe8xKvc3t0d7X9XByR7Dnw7BrZHAJhy1/PqrM8I50Pns8vNxjyCZwkaJaFkDXDUDVcM41S8
 AAcIUjvmI6t9aVEbKdMpIdyPtg+vMkRN6TuFcuqFqSvHP79pR8+5WToKcfLNMj5zPH4BoqLzaQB
 bogy2QA19ka8PbugBUw53RDMPJcba1/bmhQqFgtRmXqRdP4ShxMXSMu7i3Ctm7rXz/qT3QRagZU
 T10cULzcstRvz0NO5gFiOmInBkryeZKCjYJxLPBW13T2oGqpbz8vLB7szID3Yr5g1ajXMDSmICh
 JE6anvX+gqzRjG2l/rMPyJaIMb9d7SCby8LhNN2ZrZ0uNfqEzHYlX0DmVz4HtRcKnl67CtBAMdD
 +RKV81lKB2moEBvuSOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 09:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247712

Backport commit[1] which fixes this vulnerability as mentioned NVD
report in [2].

[1] https://git.u-boot-project.org/u-boot/u-boot/-/commit/d6694018eaddefac6aae974f9cec72fd6e58f1bc
[2] https://nvd.nist.gov/vuln/detail/cve-2026-29009

Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
---
 .../u-boot/files/CVE-2026-29009.patch         | 38 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2026.01.bb     |  4 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch b/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
new file mode 100644
index 0000000000..afdbc80519
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2026-29009.patch
@@ -0,0 +1,38 @@
+From 2b88f08722584cf235f7dacaa190af3d24deb40f Mon Sep 17 00:00:00 2001
+From: Roopa Kalmath <Roopa.Kalmath@windriver.com>
+Date: Fri, 9 Oct 2026 08:38:23 +0000
+Subject: net: nfs: fix buffer overflow in nfs_readlink_reply()
+
+CVE: CVE-2026-29009
+
+Upstream-Status: Backport [https://git.u-boot-project.org/u-boot/u-boot/-/commit/d6694018eaddefac6aae974f9cec72fd6e58f1bc]
+
+Fixes: cf3a4f1e86 ("net: nfs: Fix CVE-2019-14195")
+Cc: stable@vger.kernel.org
+Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
+Reviewed-by: Jerome Forissier <jerome.forissier@arm.com>
+Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
+---
+ net/nfs.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/net/nfs.c b/net/nfs.c
+index 537d4c62..9b628ecf 100644
+--- a/net/nfs.c
++++ b/net/nfs.c
+@@ -698,11 +698,15 @@ static int nfs_readlink_reply(uchar *pkt, unsigned len)
+ 
+ 		strcat(nfs_path, "/");
+ 		pathlen = strlen(nfs_path);
++		if (pathlen + rlen >= sizeof(nfs_path_buff))
++			return -NFS_RPC_DROP;
+ 		memcpy(nfs_path + pathlen,
+ 		       (uchar *)&(rpc_pkt.u.reply.data[2 + nfsv3_data_offset]),
+ 		       rlen);
+ 		nfs_path[pathlen + rlen] = 0;
+ 	} else {
++		if (rlen >= sizeof(nfs_path_buff))
++			return -NFS_RPC_DROP;
+ 		memcpy(nfs_path,
+ 		       (uchar *)&(rpc_pkt.u.reply.data[2 + nfsv3_data_offset]),
+ 		       rlen);
diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
index 9610d9e8fe..8dd15cf9cd 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
@@ -3,7 +3,9 @@ require u-boot.inc
 
 DEPENDS += "bc-native dtc-native gnutls-native python3-pyelftools-native"
 
-SRC_URI += "file://CVE-2026-46728.patch"
+SRC_URI += "file://CVE-2026-46728.patch \
+            file://CVE-2026-29009.patch \
+"
 
 CVE_STATUS[CVE-2026-33243] = "cpe-incorrect: NVD currently maps this CVE to denx:u-boot, but that mapping is incorrect for U-Boot; the U-Boot-side FIT issue is tracked separately as CVE-2026-46728 and is fixed by the included U-Boot backport."
 
-- 
2.49.1


