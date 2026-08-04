Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB17BC55ABE
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:08:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9708.1785816517928237838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iKvOIDkW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2676761eb7=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6743XEZx2879141
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Aug 2026 21:08:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ChkSXHBN90OlHgTVmPukZEsj2cKzcbqwXqvI6ioPI3s=; b=
	iKvOIDkW7dw+GEYxYM48XhuWyM5RoUQO0KWn8Ks8chA9pCiXgh3wpTY3WjLy/OfL
	oOo2t1tvHJTcxplZQO8x3O/HCfetj+BZjuk173LGrMMw/RKOyXHDzEJiOW5fTy16
	35RZIL9fnU/mnHSTWdqebLUDkjWSTKGfhUqOLXdTZHl3FZcD1YIzGQMlfQpTGEwQ
	DDjC6lJH5uOnI0pZ90xqoQmgdQWep/2Sp/9h6OqcbqDG6WDF+iFDp4Jk423gt3FW
	I//RBKqJQ8OWgCsd/DehTUjCHGHMZCZypizyJeSGHMtnYx0/J234+k4hcYnVj+4+
	SDf4ucWvAF3VZHyM0oaUPw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011064.outbound.protection.outlook.com [52.101.57.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsgah3ae4-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 21:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xT3BVKKp+v/sD6ax+RlKLrXNSAKJ420SSHOkgnNY713z/ce7FnPHAgGJcPbjb6US6C04Is0pyDYmy6xoCFyVfBRf/QpCEA6SpVuG8NEibFP8WpONLULfE3vegoZycJpJKJX9KoaQJ/hO7TrqWwFs7g1RZoWAj7Zwp81BhaFm/C0NfqTXw2uVBQJipaCcaQHe4P/z8LRXcsRxeT7wbpgI4H/W7lGds3DVNX00iq2zANOqIYvPuU4bG+YFmK8yD95rtBIHXGDO+oadMYzgxkwLEIZ+F7pwinBEjWWh4KuOJRnWBPNm5eepceobaoSsUkdWo2gXlaiwBjrJay9Fd6F0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChkSXHBN90OlHgTVmPukZEsj2cKzcbqwXqvI6ioPI3s=;
 b=mK41RcdxFpYLU1Mz244wDaNIdhI01tIZJNM4hO4ATxKNDUoQAdzZDN+tsjMozGxGgVg5W0HINQxw7ZbJHEuK3GsVHaWrHSRRBqQ+Tbr3JtyeHbpV/tPQvrPGR1P8pZxUnoHV6LS/SuKVXZP5AlKo/Cww9911obBhjh5Qmi1sQteyOfawHF9dDdh11HLAjAek6Oevqss/EstvRNy3ekZ3rOlGIi0RutJVK0BR2r2hwgSQT6rkHXmq46BB7kQuk1rh6W5Ud6gNDsPmXurhczWQNA6t1XygWoxLIctp/ORE+jx0TAyepaqT0OERoH+K5byN27U6dzfxetiV3M6hB/+5fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 04:08:32 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 04:08:32 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v12 3/8] lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or musl
Date: Mon,  3 Aug 2026 21:08:10 -0700
Message-ID: <20260804040815.1499699-4-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260804040815.1499699-1-sumanth.gavini@windriver.com>
References: <20260804040815.1499699-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|SJ1PR11MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: fd7eb0b3-f96d-431f-867d-08def1de0bcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|23010399003|376014|1800799024|38350700014|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ZQU7F/Uh6Fj+soqRGjuBjF0VJ7VzX3FtUdPkVgP2zuSw5+xWc1p2PGdgaDzWbtxlBCNq34X3AeNx5UTHqGW2xtKDlCKwOswMyToDRTQ2Xaz0sa09cx58vIq/UKYItDg2j5TQajT9TTAJCzbBxU656maTNvgeVW8jHrSMp9suB9kQ4kEmwEMNwGClYxIF8y4k+ZUETleaHS7WFwUTYg4PoJN1LPDYeVL6DhivdMk02PSxMAVasv/Ur5pyJGdTnZSxjrr99IjE/Pylb3Qcg6zIkkkLi6T1GbCSY6HGBzyDaHJ+tOw0otLf1Y7TQIsThBU4w1D9zypWdvnKa+4hv7mkuuquCp8Rbqcq9ixEi/wIQtcJ9gsUSpDWguU3GWBDvnhpRZWKGRgA+DwecbxtkgtrkXShbawHzr/IakqdNF3YspHwfRowXCOmPOqUAvPILN+8tUm912kmZekvaqYWMyEpoRrLUXlwihfkNzPkPqZwqV/B3+Y2nJmihlKC9fw95TCaPTCSmX9FxB2OcG7j+o0BeBAd5HJeo38qazd6HFSdLw4/B5cTe/aTG+KQEbP7SvqsdVkjO55FehrKVb4pmbXUantKEjBD4OjYqMiPFbQ6PsgJFTxb+SxCBnkfaX6g1GNPpkU7n8RO5y5kd1ixMMXDZQ5fA9PLZonxSsujaGXJO/Q1d0lCnpwJk/tAKjGuf8CjKMLXZOjy0jKjaxe3EqprWRfna6WyZc+QDhK6tADG/QM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(376014)(1800799024)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BeoDWAEdTcbYoU3kl0uprzSG9gp5hJV2skc0+XSo2O0+i2zCkSXGtlWfvNY/?=
 =?us-ascii?Q?YetDJsZ7mYjaL31erGX9qnVztwNwjCxasQmcaa0k5X1u+5DyXVCe6WEkr2Tl?=
 =?us-ascii?Q?+ywrU2TY7j4RsQsrkpEr6Ab/JVrtzEMSZbastSAWWGkC84npLkO4HSslUR+V?=
 =?us-ascii?Q?ojMz+6ZSikCh6m/2H7vdrRmPi9foZhF8SKq18pzfYa+T/+xyEmlgrIm7jo4E?=
 =?us-ascii?Q?m9qv/UGbHfUclkBByd2tuXXDyYzSHWSf9Wwj0JH8VOHlE/SGsCai9UB7Epbk?=
 =?us-ascii?Q?jp5e1sQBi1lg2tOzMhbSHrzBqwl0GumwRdWlLooOHTNnNpfzZjBIci9SMfuU?=
 =?us-ascii?Q?o1NVqVUFkOEJrY7a+KshZMVMI79kUnWSUwaFVSPI8ERvcLhBwP3IYmC6q2WP?=
 =?us-ascii?Q?+WuF80rdxa3HAxLshRHG9GKJQ/vBZGh8pNuSp3IqyNjtY05SOfMvABQtNK9c?=
 =?us-ascii?Q?PlW9S5en8e+Mpd4nRWuia+J8/bB4+SARFt6oCRb99PNgsd5afcw1oIwNey8m?=
 =?us-ascii?Q?m5C+J0YrTtZvZvQqk3XZ9Juarva/KJF1JfrSHF7T7QA1Z2z9skjbTeNKbJEF?=
 =?us-ascii?Q?4d8VzP3phbmEEipugRWODS+f5HG3BXpIUw3MSD6NNjK98OHd3vnDuDYXo+GM?=
 =?us-ascii?Q?Sh9esnQsWvcHM/BkOcvoaU/DHMHoD2OdF63GG6sKHbgLdsQY00Bvnk9qdvbh?=
 =?us-ascii?Q?cgCqJxiUtx2vmSwlN5H46EVwrhJCVESEqSmo8FrhcjTGVEuAOWKXu9ZrVu+F?=
 =?us-ascii?Q?Vt6oYqn3IG4V7JzeuR6K+cbGQnQLLX8ow50UQqDprUYVO7pZSB7514YfGYu8?=
 =?us-ascii?Q?H/Pfh7/YMiaa4wlOS+H5IgsDlqhN/NysyQiKNRxJ5Ege/YB/He7DRC/t1mlU?=
 =?us-ascii?Q?g6bZTm6GROyAtkjgAByG0qkXvJ0LG0GzKCtIPeQcNt4K7Ev32pza2qD/Ln0W?=
 =?us-ascii?Q?22ZWB7W1qPNm3Oxv/wj1U0v1W7qv0BVk8MMfTF0X+/VlKIh24tksI0snFDLh?=
 =?us-ascii?Q?YSsSKEsKPqbcKtq0AMrnTSShQHnDsQvu1yJvrOOq7GTJ1H6q3/tXasSBQCOK?=
 =?us-ascii?Q?vz3ESu+HaLu8gPVsXOsSrAat8dJtvUN7xy5ZfrK8UDeqUnGleiGBE5qLnEe4?=
 =?us-ascii?Q?Q5NsPbAF3JhJOBRoLTYwVDwekMRGSy/KXhz2fJf81Km4/jOshVhiWCSMrfFc?=
 =?us-ascii?Q?/3cUSIBmM4yQgdnjZS0zLnt5415xPfxvtOcxNnVL/f/mN5GoiYGvrOofGxzK?=
 =?us-ascii?Q?qxmVtaTtSRrpDi+rE6m+JF+ikpamrPzZm90P5/wJozwIU3mNbOWrk6AlHBmq?=
 =?us-ascii?Q?fnPdUCIfeEqYDAH/y2uu+gJ2F9W0VlkbmBUYicIGB47h55LGoPhvWhLff9sg?=
 =?us-ascii?Q?movRTO3D25PhrEEklYa6yY2ut/VYDfL+j35or3G1q812BRoSUwNrG2k+sITH?=
 =?us-ascii?Q?cy1ZIKmyuVQCUBJNLRtU2KnYhW3UqBAXl92HCIJDvUALO1KuqtbK5NFYCA1U?=
 =?us-ascii?Q?uiILbtRFuKGyFFLWsZxn5MmGtizAETgMspinf2v2k1pZh3VLibHc9vzcMbVA?=
 =?us-ascii?Q?ufJVPWXWKdUH/Zf93GHBDD6aTROSQS0eEqZ44LOYRYNtbujtFm10zwGttl8s?=
 =?us-ascii?Q?dz3pLdtiJvZF1mbll/UkHPaZTbP0YOHN57HlWclQqEYEYF1UMEMACQNL+27H?=
 =?us-ascii?Q?8MR/bppXCDgFBTJ5/jNOjqv5a3WWRKJ4o9DAC8NYMtog5Pbbv/4knpdpYhqL?=
 =?us-ascii?Q?PVzn0eMx55/6CxNkLPtlprb7I1fMVOk=3D?=
X-Exchange-RoutingPolicyChecked: 
	QjPXnaMBG7COjyrkD82X7ebEZJV9ZmKvJLMtC4r8TVOQmjNNBB/riPdPXxyhk/rBpcw4oISYRvHujD8Wbo5G1lpJmB5xYzij1s3NzxV/je7rNpxdeLNo4MCax6S0fRsi2ovwrOx3i3gQpovkvQaVhpBLMCNk5rdM6VVa0815v9tjU3cvT+grg1Pt2CcrO8cvl17I9ozpQ5tbZ+sNrlhaqMNvMUmvSwG4CHNZyz9QkFsK75/ONM+3G6Z4Xq8NVffsgPHCdXtrVAwlVxzGgjKe2Bo1ek+sMA2qP/8A3+Fgi6f3T9T4Bn96wOynaTz7XzFKosEivjwuqNpZeQA/o9xvIg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7eb0b3-f96d-431f-867d-08def1de0bcc
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 04:08:31.7884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZ2yHCt5V0Ml6WadYY3PymJF4iCzk8gMa2Rp5qQkUBk8ypWpYk4G0tKkW2VVzGe8xF8qCveh1s69yX337k/hkFic2QoNRtIhdk60ids5kCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cYTiaHDM c=1 sm=1 tr=0 ts=6a7165c5 cx=c_pps
 a=pvXDubuVmAGz8fO+OL2vfg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=YcdC0ctDMGJcGoIPl8kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAyOSBTYWx0ZWRfXyf6Z0EqqpWwa
 yU45oIRP8Lx+FpFVzm1AjIrqLn0XlilUxxH6MQ/7S3zjzTjP7Mt3dmden9k7PQJSeYJNbSpNWlm
 qeW1aEJu24jbjCkfEa3N/UbPmywj3SfTYHa5OwLsO4kNhK4vIhyg+rqYXxt4RGi+HK0wLhzz88p
 MCRh0W2aI7hsgwpnj+JdzmOnGGX+Uy8G98NCC3vw/q/hAQHA+YohaxVdDrDw1B+h0MotAROyj4Q
 6aqv+VoClfPO2m787IoHV0ABJ/mKf/8NYBDcLAy8tSyEGvBVloMxm65FkAssG59SzaGnI62LO0n
 YhoIEXDbRosxj495u1FWQ8EHQ0R2d0d2dQAXmiwEr77W/QkdVpbe6Czjp4AyNsNRwGArx6P28Jt
 aNrZy3fIj0etUvKst/31L3MekfHyz5kMfVVAOFW5ewr0Kf5FEnLGmJUCTXmsw8PypTR35PQzTPb
 eUhGxPeVNjVZJ7AG8vA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAyOSBTYWx0ZWRfX4EjaIYcLGGx1
 QoWWOmgG23idn/ZFodz5J+nEfCH2DgesF7TErbTEyCfwiVI4RSENiOE6E5P2nZ5ygYh7H+TCLmR
 3fhrmPmpY3UWahduSinua14Ntkg3de4dB1gsURp3xjy5yKlc3pe2
X-Proofpoint-ORIG-GUID: nFDh2T7dwq_rlqE_40nUINOzOvQ3cTJT
X-Proofpoint-GUID: -MD394TOOZWjt8YiF041Ad89KdboXfB8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242689

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

