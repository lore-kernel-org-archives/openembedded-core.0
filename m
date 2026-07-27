Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6276EC54F52
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43755.1785192983697257378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=M/K8JM5k;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1668b11650=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RLx3jx1688372
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ChkSXHBN90OlHgTVmPukZEsj2cKzcbqwXqvI6ioPI3s=; b=
	M/K8JM5kgFJqIJMluuoWycRMlaGXg+8TcQIJlTnXgRPWIbxloMH3moW5cCh+2wWq
	MDNaez7IJhbjyYVdNW9Spmr8EUd7agfd2QZFFwaKSLWc10/cHi5uO5jH5miZaS3e
	2u3ek6lf8gz4hMfOHrcWnmzDIr0Jx939FSNKZSxyVDcH0LROozwtIkY0Rufe0UjD
	XapsbT9UE+OWWzumdsvNerBOyjp8IVRVHgnQe77QVqaIhz40MhKN15w1OHA1gfwI
	1eSX7qhYwPhLeVVYYLgwt2RMU+g4xYIJ6Uwc54ElmBrAQEtWc4agHIjd4HufVEOc
	0AMQqul+1oQmdvg/zbopow==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012012.outbound.protection.outlook.com [40.107.209.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fmvnf2s9c-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 15:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhFmLUMfIpFZjdjLm6eASgPeLufm1Es2CMbTLDmj4LmpVqyCpW42rfD8yAyUIcdiVa44SgWr03LvEzKdlSdOJ7Tca3BLynBXasjUKdapx4CbIOsLUwFTO0uF4a0ubBvDBGYHTgLwV20K41gz/3LwYpGi5YUbr1780zsAudl9qc8u45DZkNK5ScJCMAKguEqu+zww6St0m9L8ocwVvTDbDbBoeFd2j8ucAKNgWemSNqJwMIdbQJa/FYl8Dy3W5pNsj5ndVGOa3uz/3X/4gpP8yUtGOyPadG4JOcpJgrF9d9j2nXl3Fb53/ZkJng0FrHZBelm9wJUzOaEKPCNCxov20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChkSXHBN90OlHgTVmPukZEsj2cKzcbqwXqvI6ioPI3s=;
 b=Q7eGtIwDFIkmdxt+SEIfk9An/I9Rl/+6pETHPSzIaN57Th7CbhyBFnNCVtw8JrhRixMgiXIIuektzjq+SbfDgr4SIqFoTYd/zuGqyf0MugegO8epL4fRPA9loPl8bG2UfgHbCkzmA28WbKum0sO5tGOGNRZ/exuMjsbdRnqWyMMfwbc1+37feIOiw9LvbdPZ+S/Rwy7qCxe/rW3z6jnS/lpmHMIu0sg1YLPhT6CH/bk1unQZx5GPCjJoBeuhwSJMtrByNGZW6+tKIPPsESMKxVggMYDvEdq8eC6c2Bg0AHI7DbAYmNJOFgWpVvWXbmiswqclvnYqC9B5r4AtiTOC9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA0PR11MB7259.namprd11.prod.outlook.com (2603:10b6:208:43c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 22:56:19 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 22:56:19 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v10 3/8] lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or musl
Date: Mon, 27 Jul 2026 15:55:55 -0700
Message-ID: <20260727225602.342005-4-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260727225602.342005-1-sumanth.gavini@windriver.com>
References: <20260727225602.342005-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a03:505::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA0PR11MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a413f77-bc89-4ef4-9a29-08deec324584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|10067099003|11063799006|56012099006|6133799003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	zoyEmnlBP6+jDi8RWYFJKXiJUSf8xl/SsYh7x0zP2t+3sZ6HiV40uCvq4e5RkSTVH7cUxq6Y948JVogkUzVjdPXz7M3Dv1+jqMIN3Hyy7cV+3Xxs4Fw/zB5VctWWGASJvG7hyTTGPYjOj0yz7VcP0my/cmHIMe+lA8mxCJDW75bQVbjfhbqschkFfW8OeyD/y/0O19jAZqRHA9cQCzYKFDrmhyaOKgak87vm5GUZrHefr2L7g76yyWnOw5ZYDPGSuJ4/QldBiPtrkqEfAYMdGrqU+EXKJvkMYSz258tq7ikkcvbD5GqytOmDrFGe7TFdzMsvJBbd+69kqkxjiUI1YLlsA053edz4IYf6OB2otlHN4NlmjB5BxUj5FH/14MFWNYACI1bM8yOaU57n9ci87HeJXLwip4ZkpNZHCDaiatxlPNlQl+lu4KpHDBhRVnGo0RwVC2T06vTcPIpaTGDEjXAPNUHW5Js2h5FeFvXbRqsNI/aLeEbkGwSxjzzBXIRcdY/mROUnro9q6UtanjOD6lm6M5t7yhEWYPMizbm29KiL8hiDa4L2qlx/Uda1VzFy9OIatuKREHT1TVnvISgeOQNXhWNkuHug6oA/cCslLnRu+f2wT3dIp+M8mIqFHs29Hgeox7zI4qevNsoSmQ0QLFfr2Rs4xBk5EGWTZnwgKIeVi8DXzw3q9HD9bYW7O4X+7Q4hAziik4VTD9rW76egU1/H115nT0s14lwLsXQBAs8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WxO2hkCFRBT26E6GXLDNJOJ1i6Z0YaQz2mH+xJuqQQcgRTLT9vysviITHVWE?=
 =?us-ascii?Q?nJx4defMW0DWn+U7qFJ0toWI6B+RoYPq+QprrGCk8Aj5ikosDjxt6UaxPG1S?=
 =?us-ascii?Q?+nhMh5baAaRN0rDQlyYz73TAU6fyvdtyHiIRmFFaBEHgTqZtFi9snsUDTx+3?=
 =?us-ascii?Q?GZUIvimNVRJve/Ev9+61jpWjFykxQeWra60dFXoGoO+vwQtxNrxuEcitbQPj?=
 =?us-ascii?Q?i/WtWHPPPmbqpsTHjVRqUo20Z73AKnSDqQdsRCTuBJEsS4WXDaMpGcPSkjX1?=
 =?us-ascii?Q?FLKhk0NP0Jw8VlMyNa+JiUGjnGLROVnfVKYZLpoSYtJ4QQ2nmezIVH73GA2x?=
 =?us-ascii?Q?9H/K1XetaLVGm9M/H4K2K4w8CgV7fOlBcteqOWQmUOwfkPAIlx430fPdLWO7?=
 =?us-ascii?Q?4SHSPxfgG1nd1uNinSP1jSbpGeHY479/BbvKjsuaGSU6SniUmB27GE5bsZaY?=
 =?us-ascii?Q?WchNnD9SYhkbo1fr9O9wyqqPg90CQXCw5/4aS/N4Ecc11PW/WVnymd3TdRyo?=
 =?us-ascii?Q?kMU/VKIk6EYUhsEc3Eqo6/jb7RBoT9O4Lk/UOXiP6zk1sc+d6ZrhnvnCyye6?=
 =?us-ascii?Q?HByP12FamX4bx3b0YpcLJZkEaXlWBbKcQTFyGLyFnL3oy1PFPzLd27Pz2ecR?=
 =?us-ascii?Q?C7YboPO2ILjCgMZVKDqSb094AI10YpcN0UKbPGEOcxcfRhGfJGMpu1pt0dOp?=
 =?us-ascii?Q?X5xl0Fa0gwesdpGAp+z52b0oMWT5FeAXSViUAbvAcWfv9oEhsJZ0iR/NFo7M?=
 =?us-ascii?Q?kLpKqFkW5Yxtq8M/TDvaysVKK+jD8jxhjFnXrQmS7GtO/PJbtcFBIjQC0RD2?=
 =?us-ascii?Q?o12C5tpzD4icwiz0jCTUe24ho63XqRV4mMEaAUV723YBlHLmUPv1hsAB4lks?=
 =?us-ascii?Q?xNf+4+Ct2GEIlCctxD8R/ji8havfsOEUSAVb5janLvxhBe3n7IjTTJb3kPC5?=
 =?us-ascii?Q?MaFGFFpJ6TfCdM4sHjf/7i/XsRrpQUWywJegVJtL0Ms4tF/I/H+iRvhxVPoZ?=
 =?us-ascii?Q?DHkxThFKiHV6OBj1VAzld3B6JfZGSb6V+1r4X5b2pyCp+V0aDExvEOs9YWZ+?=
 =?us-ascii?Q?H8xRLisFqXZ7wD6ibFkictfhhpGwqzeGTG7U0m5Kvw5ZbT5xKT6TXhWlbyxj?=
 =?us-ascii?Q?fNg98aQEmpmHT80MznWqmZFSHXLZP5XL6M3Ispt8gTWeH7fRyZlDk8NS+5wn?=
 =?us-ascii?Q?/TqOdHmu17emCUYC4OJdBTn7reld5YtXDuxAkoYsp5pUtMT6GHVcHP7fjbIA?=
 =?us-ascii?Q?57bioZRDRahdZhZ/voPIg24uz9PNcT2arGk4W1a8wnrLHUwE0wnsdTzwmKgl?=
 =?us-ascii?Q?rl1NG9safqC4aYZWWbfQYSPgw2tKkpO/3VvSnc5SHqtFMaLA7LTkYLHS+p5M?=
 =?us-ascii?Q?NYEdPTyPejmtdvzac72wLoR9pIe0EtCPW4hYbnBuymD7jq1l6FqupvUrPzq/?=
 =?us-ascii?Q?5BU3tAk3RCeLgZqXVRmO6CWYgsgfA4etXLDjpaqlpulZfw+ENV7GSk2hoar8?=
 =?us-ascii?Q?IXdD1EIVs+mW6bm8iPRH3nlOu6J6f/cpdTG1FpZOWIMqp9M86C73H5bTO94i?=
 =?us-ascii?Q?deAdZ1boCxxyyzpbQ2K9R1HtRIEpn/pqAdndbfRBmbVKgOOXX+KeSPtqdc4E?=
 =?us-ascii?Q?Y6AAnL2jePQhyOPwbZWpTimdM+xi/r6dDEetZN+hZ0I9wjsSDrTNM1pDMVPR?=
 =?us-ascii?Q?OB3al5NVpfbF12wzZHtio2jncD9QVNEWKnSiWhSq93curddjLdHEIcyx5vf8?=
 =?us-ascii?Q?3C9PjpOPopZPQ9V+NHFbNxcBrsrP6uI=3D?=
X-Exchange-RoutingPolicyChecked: 
	OmVyaElgUqjqApL/4knwhZHXTHgMHXj29v3/UjtAJbNhSuFONpVwz/xZEb08853SExNhcZ3NFUsW35wXlIOMnKPldSa7enycHP/dmqXFzmKQhFj5zHvGMDk6sEDel7KpmKmGsoCH4U7KZHAdfxe5yUc6bngZVtEXpkcyrzVePq00xLGvUrinDm38c0XWaDaVgIbPEoF0HUpieGLRLYDiFHHNKxAWcc/Y9Jh5Cw/i3p6iX9hnJv9jDYXJReVI8fsm/g799kIc68SMF1yJU1+Roubr7oHp/SfNHv4f7YGEV3vVUMZ7oTKiirS4R5K1XlIjGPME7P7C0MDOenGfFp/AAw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a413f77-bc89-4ef4-9a29-08deec324584
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 22:56:19.3029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8R9mVMYfX2bCJXxZkKLQjoQnVXwt8mzGCNN8wmJ5W3YBZTH+9e5yQE315eqGRhbIly9HNAjjn4v17RrLmZ3DB5MsbR8Lnxw8ATaUXrUaIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7259
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDIwNSBTYWx0ZWRfXxvYGwcNX0+fp
 m9Vh6ky4Ht0f8+HpM5KJMQsLCIkv0P7mF1cgttkpiZZ+PbVOl440WpixFE+rleMmMtrNpI6xfyO
 Ybj5GnCivC+dwhFJoFZ2Kt5/gBS45/zZdavksDnXcYu14npwXFYP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDIwNSBTYWx0ZWRfX4WAlLFblyXqq
 JW5jhE1GqHEa0WBbiPLRBKPBaTBKb/v94szKPh1kqmW/WHmguJTKn70wTiTlzZ5gBnWyBCQrA/x
 qr9I1zAOFwlqbUtoSlQDlM+qvxYJgnsr1mbds9J3mjSmPMHaEc3VTMvKqY4zzmoQzP4sgliw5Lw
 G0XQkrXfKD3dMsqlztT/fbzVqlk/cc/crNbXKMUOpSvjyYTfT5J3ZR9iZGYPt1A8oKRqtQY7KQk
 JJ03g+LVfyv8tGL61LVJZwzB0p06HHk12Nv1u2FitL3mnEPIXBm2aNu/vlmSGB0UAVQ1VgvOeAB
 Y6B3IaC2rfC1LxwVcQ/DxXfZoLKIYT1MqAwHtOkZatvRGSIwWbaHoybH4SUsmeEbX5XvSSYZu2q
 5BpviUSjq9VQ8X7lNZSdt9xJgMIhtxhuaZXDBZ4Css/QXbVnbm0Q2f4Mqa7jNvkspAPRVMZW41Z
 114Pl4IbAL6FSIqfS8A==
X-Proofpoint-GUID: PT7gY3AZCI321bRwt9U1FSZv7Rxxl-bb
X-Authority-Analysis: v=2.4 cv=M7x97Sws c=1 sm=1 tr=0 ts=6a67e217 cx=c_pps
 a=ul7AMzggcqKAecwK2qVOCw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=YcdC0ctDMGJcGoIPl8kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: WFa8GZD3K2a--kKpr-qcVs2aHJF19l6W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_06,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270205
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242124

Fixed:
$ bitbake core-image-full-cmdline:do_testimage
%post(busybox-1.38.0-r0.x86_64_v3): execv(/bin/sh) pid 679
error: failed to exec scriptlet interpreter /bin/sh: No such file or directory

It is because busybox and libc6 depends on each other, busybox' elf files
depends on libc6, and libc6's postin depends on busybox' /bin/sh, the do_rootfs
works well is because dnf-native has set RPM_NO_CHROOT_FOR_SCRIPTS=1, but it
would be failed without it.

In rpm 4.20.1, it let the installed files' Requires win, so it installed
busybox firstly, but in rpm 6.0.1, it let the postin's Requires win since
postin would run immediately after the files are installed, this does make
sense, so it installed busybox (which provides /bin/sh required by libc6'
postin) firstly, then we got the errors. I couldn't find which commit made this
change because a lot of files and functions are refactored during 4.20.1 and
6.0.0 (not .1), I also tried bisect, but failed because a lot of do_patch or
do_configure/do_compile failures for each build.

For libc6's the postin is:

  #!/bin/sh
  if [ x"$D" = "x" ]; then
      if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
  fi

This doesn't make sense for libc6 since there is no /bin/sh or ldconfig when
libc6 is not ready yet, so just not add ldconfig_postinst_fragment for glibc
to fix the problem.

And also remove the workarounds in oeqa/runtime/cases/dnf.py, they are not
needed any more since the loop dependency is fixed.

Similar to musl.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py                    | 3 ++-
 meta/recipes-core/glibc/glibc-package.inc | 5 +++++
 meta/recipes-core/musl/musl_git.bb        | 4 ++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index d047e41a78..8ccd89a190 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1853,7 +1853,8 @@ def process_shlibs(pkgfiles, d):
                     if s[0] not in shlib_provider:
                         shlib_provider[s[0]] = {}
                     shlib_provider[s[0]][s[1]] = (pkg, pkgver)
-        if needs_ldconfig:
+        if needs_ldconfig and \
+                not bb.utils.to_boolean(d.getVar('SKIP_LDCONFIG_POSTINST_FRAGMENT:%s' % pkg)):
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
             postinst = d.getVar('pkg_postinst:%s' % pkg)
             if not postinst:
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 3d721d8f69..bea841b047 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -298,6 +298,11 @@ pkg_postinst:nscd () {
 		fi
 	fi
 }
+
+# Avoid loop dependencies between /bin/sh and libc.so.6
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 CONFFILES:nscd = "${sysconfdir}/nscd.conf"
 
 SYSTEMD_PACKAGES = "nscd"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 3aec643c40..057113bf16 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -80,4 +80,8 @@ LEAD_SONAME = "libc.so"
 INSANE_SKIP:${PN}-dev = "staticdev"
 INSANE_SKIP:${PN} = "libdir"
 
+# Avoid loop dependencies between /bin/sh and libc.so
+SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} = "1"
+do_package[vardeps] += "SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN}"
+
 UPSTREAM_CHECK_COMMITS = "1"

