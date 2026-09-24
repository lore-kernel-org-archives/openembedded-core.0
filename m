Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC32C9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 09:26:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3788.1790242006694419614
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 02:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nqXmcfT6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3727e5c76d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5dgka160409
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 09:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=5JAXBfXYi
	IX6CsxX8dTRc9jw0BmhP44vHmRfENl5LpY=; b=nqXmcfT6FrVNLg/scl29LUiBi
	fBo1Mc8iV6uEMtiurZsPPIPBNGeuuP+QrrrFRB2cgg8se7qXgVK2pSaLv0IW20GB
	Nt9tvqDAIt9HDqQNmXF7eumPXanticBR9+ffTuMM+0OcD8rwBTurC2KK+sfVw/uj
	AuGgGJ/QWIBQ0YwgORHcqAw+emqBexOPn46UBWituXK3eos3cY0JFcqgtcYmQqKx
	fEClm80x7A2W096aMQKqvE9HdCbEJtrSECmwhslXGeYiqJUnsGfVQOjMuUiR7CSa
	RcMrnKBlYctffAAeQw32zFawXXpCtpO80o9xM8J1fvyN3u7H5ohHkyv7nKqEQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022078.outbound.protection.outlook.com [40.93.195.78])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gup35mbhj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 09:26:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLxikS5BoiqL5fA+MMIYgJgxE66nhUxkhYkAshxHLe3+wWZZc3CRZ3TaZwHrBCJlxNtewE75S6j/KxzP4ig9pK17AJyYmJgoqiU9ur8JGuAbFZiXmlZJdxz8MgBk2JP2KU167qhHdp8D/xvUfaVTXxbvhhrZ1k1sb0kqiVKibqa7KFq5nBxC+PqDdGNBFfmsWVVcDNweg7rQhLZWgRiENRdg/bQhwBnexWoi2BhwWxRuQpu+ur8rWAf7PioSZXQL0bPRckpp6LeiN2lznoeQnDLIWHLcxdgDIoG24NfGsFalwj+6IUBTST8HxgihnvrD47sqt5Ue7CNYtxt5awFYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JAXBfXYiIX6CsxX8dTRc9jw0BmhP44vHmRfENl5LpY=;
 b=vnz//BGX8mSFHoP1CC1KHnNABCeVB7yD3BfzsaHuBhyMJ7YBXrY+hFPDpsgKD0YU1nEGYU7mXmA/9GrKQ3lwepOcBF9G91pIPoYTWV/4APRx7Qt1L6Np5Gjeg7SGMnwgnNUHF/SGG+4H61KghBSI5SaHCCwIeBkJ1dvfGfUqSunARtBJQeo19hBHG9u4tuoXTlWbGAi8NcBU7lAclnd+J4Pp1XijLTmuhAGuIbR9jA5f6PR/vkI1dZMEP5Gw/j87VehH34q6n6ZGbNuZgcR5J4+bQd83qsIu2RPRJ6iq3B81Fg+3SWG3dxaDAFXCCAxYMVI9+7eRwDXnCL+pA2BnkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by SJ0PR11MB4830.namprd11.prod.outlook.com (2603:10b6:a03:2d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 09:26:41 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 09:26:41 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        yoann.congal@smile.fr
Subject: [scarthgap][PATCH v2] glibc: Fix CVE-2026-6238
Date: Thu, 24 Sep 2026 02:26:22 -0700
Message-ID: <20260924092622.374719-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::12) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|SJ0PR11MB4830:EE_
X-MS-Office365-Filtering-Correlation-Id: db25bd1a-2b2d-4613-61f6-08df1a1df137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|13003099007|38350700014|3023799007|6133799003|10067099003|5023799004|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	+4ySu/aMV7uFVF/QmW7hh1x/rnEdoyZ+4jsdsRb2wgLmVe6/MWjoCdhZ6jExO2Qngo+eeWKwK3Zi3OONFcl+EoeknyyAbLIhvT0+sDPbVyHPVmf15QoZc9hlgozyjQbEEKkEwOoqUvJoK+fjWxJxMbrrbS6Ds9y26BsqLmy6YwbZjVGSoKhz9IXOhnUDx2QHCrc36munaYTfY0h29osBIV4SaXr0lmSe33+LoHhKucDDPBJKOHl4B+2BIgiD13s0+k/WrwFz9TytYxDIjAzst8b88xTN/ofHUEx2O9fFKeiT3VuRbfqA2Pu+XQw8v9yDcFMIq5gF+afDxbZqE7S/7lP0e57/0CpOigS7jW2EydC0nTR0cJ67lkqokFRf14JVdqLUVSoXuD72JAyWIVyCgkjiAOlMvkiOGWY0e5so6EDg5V7G2rMP8uZO9E1m9eWVZe5D18xh/ocb8RPoFLGTG+nabXYjCANWUeXXij8q/hFAjWbQx0/IcVGshLBIj5ycco0BgpaBBYotLS6dGXTBWJNaKWJHWCR8DPScGNHPz/6vYuf/QByRlDIfLr926zG2KHvc9nJYHO6fDiVv/vGgTBmpJ0rlTJRdBIR9toTROdSoMweLg7xcm/QOEe+gdXZQ3Vure/6ejMo9MKbxMgoGTKQeg+7bmQ+z9YScN219Kn0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(13003099007)(38350700014)(3023799007)(6133799003)(10067099003)(5023799004)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d0iT0X+zVU+YzKp2yL5pLB6zq+t2b70bZLvJchcvza7GICq6NKfON0sQWRja?=
 =?us-ascii?Q?HkEhUTg80PcAozUrNWXMPyB0oPV/96ERpswgTdv4i5LEaQ0I+yuFrdfC3dZ8?=
 =?us-ascii?Q?rNbysQmvDUX3OX9+Rm0sSOXigr2MVLf7s0WkZpiYxFmmYhdTiM3bXL0SBb6p?=
 =?us-ascii?Q?KMbHVU9heFdwHHCxREuxc8vAJ3YkR69LUQ1+2QOneY+jl6YZkNTvIxrpC9aQ?=
 =?us-ascii?Q?PyFarqkM/xGBliQ6IiY8Of2FllByudtn/4qZI//0SLQUNb/RHKBrXTG3zqmH?=
 =?us-ascii?Q?4apF8o7nSBS8S1AQhFzByBuMvGPCCiBKWe6zKkXg7dnVtdOfE+j6HTsOWMON?=
 =?us-ascii?Q?S4GillF1v13ErJaHZGqWThFeC7mdJv5kvGnuGu3E6loz04nu7mBqCAzqhCmD?=
 =?us-ascii?Q?1gJ69VeU9/Jhrvp4L4LUBJXfz8AV7QLxz9e0QDmDhq6DBCc8aANeOot7yLsg?=
 =?us-ascii?Q?4fvqiQeFwx+Vq3UM43BZwoLvvIe3FQiiIJ0he+dYC9kaq6pzFgbKMt78MkTA?=
 =?us-ascii?Q?6OuvcEDjRvu3zIRAa2tuQYk1R6Kix57LW5JHzED22X/JMqXeHQIh9m9LzUpE?=
 =?us-ascii?Q?GtSuRpx3oXXWBq/c6isQydX5Bsk16KFGUy4wdiUiVJ6HPE+VMwlfCCsmMBTG?=
 =?us-ascii?Q?KMuiLkyMis00+5J6WydbXLzsMyVDbyaUjoiblcXu0zU3mjw+ekWE7d57dZd7?=
 =?us-ascii?Q?HKfq5hG1xGtgO4KJ06T8+UB9TrEK8TWtr44PpBW4FbFIoG6UTS1kPm4QKylx?=
 =?us-ascii?Q?C72kiQLiVoScDWLPYWFeYXrWUcsYUlwGJP3ol/35rmi1gD17J46cc2nddl3i?=
 =?us-ascii?Q?kh1N3b5+/RRPtt2A1+BmX3qFNWnTpoJQm90As9WU6GX9covn/2qJnzblfJxQ?=
 =?us-ascii?Q?qZDquFFnr9RQm4JniKVbZUPL6udSxbPHFeX9nXEttp/mgjfqvEzZBRPQGcE/?=
 =?us-ascii?Q?EkIt/iYzCUbCm+MQxwdeivosD7G1YqjHAEHYEy9+RqRd+gOffk9HRsRmOnix?=
 =?us-ascii?Q?4ZghkCg28byDGDEskK86rIMFHCAz9FgDRjhU5Cdeeuq8iALOE03DyrIFRpyh?=
 =?us-ascii?Q?dSBEQQHNb1I0cZ18HI/rVxY2Asc7qNKoqiQeaSA2CKx7PfOXq8zRYw6wCoDr?=
 =?us-ascii?Q?71bv+3q9vDkPj4C++3op1ZB0QhUz6iayaCUlpy5ZKADzgBydxwxF18JPalhW?=
 =?us-ascii?Q?es5vJ/yBP3MjfyNSW/IlZiY3+tptxvoFEQ9AKI4NsXYajHwqCrxULr3YV7r5?=
 =?us-ascii?Q?4w9BPTCD1ehS5loWs3GgZzOdZ+4GglDbM6vcDoAT3WomaQlW5Ayrvg2/0oCi?=
 =?us-ascii?Q?LBSQ8igNkmK05xKoJLESRCCrs0cFXbwj+FWmUkNpCNgz38YtOosLub5yvgFR?=
 =?us-ascii?Q?h1vCBkj2E8y7zc9NaN5T9myCebTgT2edsqdsgvh48L7UV7T9J3VWstjrdTX4?=
 =?us-ascii?Q?lWXhHfkL3aMgx/G2xgvFxhr8vGnKLGIJI7XdnKQ/w/CL0cYNkMOrps68/npK?=
 =?us-ascii?Q?UJhDiXWAC7LBiB3tEKDrj+WnSSDi42pRlzMGSfd+B9y2W5cxIeAgQckiuEY/?=
 =?us-ascii?Q?SLwlbOZdp0gsdJUGu1jMFVALthvDfQCuf1FNzhouYQocFg1pX6BvmkP7Nokq?=
 =?us-ascii?Q?Mp6GqGSYoP+xg7b2yxSFu91IuG4hd8Q7N7wSCdLRk1JUh8btI+chQrYHPqnB?=
 =?us-ascii?Q?w0SnKLayDcn8uogm0sqGCcbWY3JiiXp19x4KaKzKers/C2v50WVZPV0cyK3K?=
 =?us-ascii?Q?iwBO9KCJ9jx5WCRt2IVW+wVvIAXwR09fJePdJ+IWceAvtrE+MgKe?=
X-Exchange-RoutingPolicyChecked: 
	OEYX/Ge+zcEsxQpFdRrkrOEdALO0SI47oenBUduxwajFDFfoYeQwUABKLUhPcUEh2n/g5eXnLV9dN6hk9jBd5m5oCR8DmarCKR8JcU1Bys37GdY7mvLzlx6tQQ7JrR/ZyZLdFKb92YtvDq317EFQ/dgw2yKi/tcomgjFJ6s7qSmkp/bSxU1moz9TkyTj6udz4RG8i56tz2NUUOFICL092D6MTmApCxkqrrQs2N8QprY07szaICOGm5UDaf4hHTRzlY94p0CdPp/v+lUSE1qoAmOjM+dSaDSUgLr/he/BD1cTUzFn9RGaN29TlgWDfR5zNN0i2ZSm8gDhRmmO7fHqKw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db25bd1a-2b2d-4613-61f6-08df1a1df137
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 09:26:41.5887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zkkf4UICjKSRuDK5WRA7DCeIwvUDMkFOIc4dEnnl+jSQcZAYsFmfr/T2Vr0QNhmjsiFLC8P8zMCUQ/i9Rb6SSvqQNoe1whSTZGtOHEugnWlZCn/cruOIDlw7ZVUrgt4D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzOSBTYWx0ZWRfX4+gtID2nbXaZ
 6AHNY9LIi1lJNBTUT68NjX90cjzrIJ4CtRpU0Y8ys8FsDw4IQjLbZrjbVtDcNE5d/DulHQg3aDk
 wJ2I7ySr7+/xTXqAhNa6szUAKloy30SQaXqo2HwlYoTuuKLWbbjK
X-Proofpoint-ORIG-GUID: mm2cYE4l3J_v_TNBo7IGpXHDOMaVzNGu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzOSBTYWx0ZWRfX+rJG0/INAyWq
 BDsGrL7Hu+mqwfsPVUKBgNsG1KUSC+YB43/RyWQ7ag9S7wdCjWjjbGx8lTbaTUEQGBGfFRB64AK
 ZSe0j77cLsY48Vt8MfJFV46IblYBrgUNmgDNqm7JDt+pMBisW1v+DkjZDhOnukdwRQzQ+hViMv5
 mBmzgldPDScokyqRkxVnWkFreaq6JxjswuWbh/m4Rk9YSaQ64d869G5HtxebvcAQTKrmXO2fVF6
 38/0nAvpfcqWI/+S6MD2MI4RNDNi0443VXP3Pb/WgyEOMlwVJhQOmVN+u36Us3dWMjuhcq24nII
 JuJQTId2ruoTMuHT9mdb0f8WP71da73DDL8xQnYJxdqu4a/Ik/1wPmk55dPyGkHq5ouFS8otSzL
 yoI2Fubhn8i1wbATHPyEYsr99vrl8jF2dXZToxi2vF7MBhQTwyiORu3J4xasptc3g4ATSmSpK9a
 /gnPbXYhu0oelXAYXBw==
X-Proofpoint-GUID: jo5zCWhJa_denpIPoQx_ZqqLKn7S3RRO
X-Authority-Analysis: v=2.4 cv=DKMacCNb c=1 sm=1 tr=0 ts=6ab4ecd5 cx=c_pps
 a=yg3rYln4nUvKBXPnFt2I5w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=CCpqsmhAAAAA:8
 a=20KFwNOVAAAA:8 a=PYnjg3YJAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8
 a=KKAkSRfTAAAA:8 a=QIhr-27iAAAA:8 a=_1PXsdjXBSCVEG2DD7AA:9
 a=A6A4XJsNDs4oZvV8:21 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=cvBusfyB2V15izCimMoJ:22 a=cgaYBWEFosGJW4rWv5Lf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 09:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246576

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Backport six commits from upstream glibc to fix CVE-2026-6238.

4ba0b79b95 resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
a7b60d23bb resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
cd0db208d5 resolv: Check for inet_ntop failure in ns_sprintrrf
d58415eb17 resolv: Improve formatting of unknown records in ns_sprintrrf
f69b7f95e3 resolv: Fix ns_sprintrrf formatting of class, type values (bug 34289)
360f352c9a resolv: Declare __p_class_syms, __p_type_syms for internal use

The upstream patch series [PATCH 0/5] contains five commits:
  1/5: Update GLIBC-SA-2026-0012 to mention A6 records (doc only)
  2/5: resolv: Check for inet_ntop failure in ns_sprintrrf
  3/5: resolv: Remove incorrect parts of TSIG handling from ns_sprintrrf
       (CVE-2026-5435)
  4/5: resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
  5/5: resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)

For this backport:
- Patch 1/5 is skipped (documentation-only change to advisories,
  upstream glibc itself does not backport this to older releases)
- Patch 3/5 (CVE-2026-5435) is already patched in scarthgap sources
- Patches 2/5, 4/5, and 5/5 are backported as:
  0028-CVE-2026-6238-0004.patch (inet_ntop failure check)
  0029-CVE-2026-6238-0005.patch (buffer overread fix - CVE-2026-6238)
  0030-CVE-2026-6238-0006.patch (test case for bug 34033, bug 34069)

However, the test case (tst-ns_sprintrr) from patch 5/5 failed on
scarthgap's glibc 2.39 due to missing prerequisite commits. Three
additional patches were backported to resolve the test failure:
  0025-CVE-2026-6238-0001.patch (Declare __p_class_syms, __p_type_syms for internal)
  0026-CVE-2026-6238-0002.patch (Fix ns_sprintrrf formatting of class, type values)
  0027-CVE-2026-6238-0003.patch (Improve formatting of unknown records in ns_sprintrrf)

CVE-2026-6238 fixes buffer overreads in ns_sprintrrf affecting A6 and
LOC record handling. The vulnerable LOC record handling was introduced
before glibc 2.0, while A6 record handling was added in glibc 2.7.

Reference:
https://inbox.sourceware.org/libc-alpha/cover.1777546194.git.fweimer@redhat.com/
https://nvd.nist.gov/vuln/detail/CVE-2026-6238
https://sourceware.org/bugzilla/show_bug.cgi?id=34069

Testing Results:
             Before    After    Diff
PASS         4896      4897     +1
XPASS        4         4         0
FAIL         372       372       0
XFAIL        16        16        0
UNSUPPORTED  224       224       0

Changes in testcases:

testcase-name                                before  after
resolv/tst-ns_sprintrr(new)                    -     PASS

commit - 4ba0b79b95 resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
+PASS: resolv/tst-ns_sprintrr
Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../glibc/glibc/0025-CVE-2026-6238-0001.patch |  59 +++
 .../glibc/glibc/0026-CVE-2026-6238-0002.patch |  81 ++++
 .../glibc/glibc/0027-CVE-2026-6238-0003.patch |  58 +++
 .../glibc/glibc/0028-CVE-2026-6238-0004.patch |  73 ++++
 .../glibc/glibc/0029-CVE-2026-6238-0005.patch |  69 ++++
 .../glibc/glibc/0030-CVE-2026-6238-0006.patch | 382 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   6 +
 7 files changed, 728 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0027-CVE-2026-6238-0003.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0028-CVE-2026-6238-0004.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0029-CVE-2026-6238-0005.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0030-CVE-2026-6238-0006.patch

diff --git a/meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.patch b/meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.patch
new file mode 100644
index 0000000000..504803317b
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.patch
@@ -0,0 +1,59 @@
+From 360f352c9a6da545d798ef3015e73ca114f0d230 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 19 Jun 2026 18:22:20 +0200
+Subject: [PATCH] resolv: Declare __p_class_syms, __p_type_syms for internal
+ use
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-6238
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=360f352c9a6da545d798ef3015e73ca114f0d230]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ include/resolv.h   | 5 +++++
+ resolv/res_debug.c | 4 ----
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/include/resolv.h b/include/resolv.h
+index 4dbbac38..d5ad9994 100644
+--- a/include/resolv.h
++++ b/include/resolv.h
+@@ -70,6 +70,11 @@ libc_hidden_proto (__libc_res_nameinquery)
+ extern __typeof (__res_queriesmatch) __libc_res_queriesmatch;
+ libc_hidden_proto (__libc_res_queriesmatch)
+ 
++extern const struct res_sym __p_class_syms[];
++libresolv_hidden_proto (__p_class_syms)
++extern const struct res_sym __p_type_syms[];
++libresolv_hidden_proto (__p_type_syms)
++
+ /* Variant of res_hnok which operates on binary (but uncompressed) names.  */
+ bool __res_binary_hnok (const unsigned char *dn) attribute_hidden;
+ 
+diff --git a/resolv/res_debug.c b/resolv/res_debug.c
+index dab5283b..6f03e414 100644
+--- a/resolv/res_debug.c
++++ b/resolv/res_debug.c
+@@ -389,8 +389,6 @@ p_fqname(const u_char *cp, const u_char *msg, FILE *file) {
+  * that C_ANY is a qclass but not a class.  (You can ask for records of class
+  * C_ANY, but you can't have any records of that class in the database.)
+  */
+-extern const struct res_sym __p_class_syms[];
+-libresolv_hidden_proto (__p_class_syms)
+ const struct res_sym __p_class_syms[] = {
+   {C_IN,    (char *) "IN"},
+   {C_CHAOS, (char *) "CHAOS"},
+@@ -425,8 +423,6 @@ const struct res_sym __p_update_section_syms[] attribute_hidden = {
+  * Names of RR types and qtypes.  The list is incomplete because its
+  * size is part of the ABI.
+  */
+-extern const struct res_sym __p_type_syms[];
+-libresolv_hidden_proto (__p_type_syms)
+ const struct res_sym __p_type_syms[] = {
+   {ns_t_a,      (char *) "A",     (char *) "address"},
+   {ns_t_ns,     (char *) "NS",    (char *) "name server"},
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.patch b/meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.patch
new file mode 100644
index 0000000000..ae2662df2c
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.patch
@@ -0,0 +1,81 @@
+From f69b7f95e3694177546faec25d88bb266885c3b8 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 19 Jun 2026 18:22:20 +0200
+Subject: [PATCH] resolv: Fix ns_sprintrrf formatting of class, type values
+ (bug 34289)
+
+The p_class and p_type results could overwrite each other if both
+were unknown.  Format unknown values with CLASS and TYPE prefixes,
+as in RFC 3597.  Handle A6 separately because it cannot be added
+to __p_type_syms for ABI reasons.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-6238
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=f69b7f95e3694177546faec25d88bb266885c3b8]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ resolv/ns_print.c | 38 +++++++++++++++++++++++++++++++++-----
+ 1 file changed, 33 insertions(+), 5 deletions(-)
+
+diff --git a/resolv/ns_print.c b/resolv/ns_print.c
+index fffed4b3..59c34553 100644
+--- a/resolv/ns_print.c
++++ b/resolv/ns_print.c
+@@ -78,6 +78,24 @@ ns_sprintrr(const ns_msg *handle, const ns_rr *rr,
+ }
+ libresolv_hidden_def (ns_sprintrr)
+ 
++/* Writes the class/type symbol NUMBER to *BUF, using the name from
++   *SYMS if possible.  If NUMBER is not found in *SYMS, print the
++   number with PREFIX.  */
++static int
++addsym (const struct res_sym *syms, int number, const char *prefix,
++	char **buf, size_t *buflen)
++{
++  for (; syms->name != NULL; syms++)
++    if (number == syms->number)
++      {
++	T (addstr (" ", 1, buf, buflen));
++	return addstr (syms->name, strlen (syms->name), buf, buflen);
++      }
++  char tmp[20];
++  int len = snprintf (tmp, sizeof (tmp), " %s%d", prefix, number);
++  return addstr (tmp, len, buf, buflen);
++}
++
+ /*%
+  *	Convert the fields of an RR into presentation format.
+  *
+@@ -128,11 +146,21 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 	/*
+ 	 * TTL, Class, Type.
+ 	 */
+-	T(x = ns_format_ttl(ttl, buf, buflen));
+-	addlen(x, &buf, &buflen);
+-	len = SPRINTF((tmp, " %s %s", p_class(class), p_type(type)));
+-	T(addstr(tmp, len, &buf, &buflen));
+-	T(spaced = addtab(x + len, 16, spaced, &buf, &buflen));
++	{
++	  char *start = buf;
++
++	  T (x = ns_format_ttl (ttl, buf, buflen));
++	  addlen (x, &buf, &buflen);
++	  T (addsym (__p_class_syms, class, "CLASS", &buf, &buflen));
++	  if (type == ns_t_a6)
++	    /* A6 is not part of __p_type_syms, which is exported.
++	       Adding A6 there would change its size.  Handle it here.  */
++	    T (addstr (" A6", 3, &buf, &buflen));
++	  else
++	    T (addsym (__p_type_syms, type, "TYPE", &buf, &buflen));
++
++	  T (spaced = addtab(buf - start, 16, spaced, &buf, &buflen));
++	}
+ 
+ 	/*
+ 	 * RData.
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc/0027-CVE-2026-6238-0003.patch b/meta/recipes-core/glibc/glibc/0027-CVE-2026-6238-0003.patch
new file mode 100644
index 0000000000..f2df3d3b5e
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0027-CVE-2026-6238-0003.patch
@@ -0,0 +1,58 @@
+From d58415eb17d457a160af99f9e8ab164404ca151b Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 19 Jun 2026 18:22:20 +0200
+Subject: [PATCH] resolv: Improve formatting of unknown records in ns_sprintrrf
+
+Do not add the "unknown RR type" comment.  After adding the TYPE
+prefix, the number is largely redundant.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-6238
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=d58415eb17d457a160af99f9e8ab164404ca151b]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ resolv/ns_print.c | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/resolv/ns_print.c b/resolv/ns_print.c
+index 59c34553..4f4f06b6 100644
+--- a/resolv/ns_print.c
++++ b/resolv/ns_print.c
+@@ -115,7 +115,6 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 
+ 	const char *comment;
+ 	char tmp[100];
+-	char errbuf[40];
+ 	int len, x;
+ 
+ 	/*
+@@ -500,20 +499,18 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+
+ 		break;
+ 	    }
+-
+ 	default:
+-		snprintf (errbuf, sizeof (errbuf), "unknown RR type %d", type);
+-		comment = errbuf;
++		comment = "";
+ 		goto hexify;
+ 	}
+ 	return (buf - obuf);
+  formerr:
+-	comment = "RR format error";
++	comment = " ; RR format error";
+  hexify: {
+ 	int n, m;
+ 	char *p;
+ 
+-	len = SPRINTF((tmp, "\\# %u%s\t; %s", (unsigned)(edata - rdata),
++	len = SPRINTF((tmp, "\\# %u%s%s", (unsigned)(edata - rdata),
+ 		       rdlen != 0U ? " (" : "", comment));
+ 	T(addstr(tmp, len, &buf, &buflen));
+ 	while (rdata < edata) {
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc/0028-CVE-2026-6238-0004.patch b/meta/recipes-core/glibc/glibc/0028-CVE-2026-6238-0004.patch
new file mode 100644
index 0000000000..16d594fc0d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0028-CVE-2026-6238-0004.patch
@@ -0,0 +1,73 @@
+From cd0db208d56a2cecd528b8ae96df752ba5344d9a Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 19 Jun 2026 18:22:20 +0200
+Subject: [PATCH] resolv: Check for inet_ntop failure in ns_sprintrrf
+
+This makes the output more consistent (either failure or complete
+output) and helps with systematic testing with varying buffer
+sizes.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-6238
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=cd0db208d56a2cecd528b8ae96df752ba5344d9a ]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ resolv/ns_print.c | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/resolv/ns_print.c b/resolv/ns_print.c
+index 882a86e5..19082bf2 100644
+--- a/resolv/ns_print.c
++++ b/resolv/ns_print.c
+@@ -140,8 +140,9 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 	switch (type) {
+ 	case ns_t_a:
+ 	  if (rdlen != (size_t)NS_INADDRSZ)
+-			goto formerr;
+-		(void) inet_ntop(AF_INET, rdata, buf, buflen);
++		  goto formerr;
++		if (inet_ntop (AF_INET, rdata, buf, buflen) == NULL)
++		  return -1;
+ 		addlen(strlen(buf), &buf, &buflen);
+ 		break;
+ 
+@@ -307,9 +308,10 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 	    }
+ 
+ 	case ns_t_aaaa:
+-	  if (rdlen != (size_t)NS_IN6ADDRSZ)
+-			goto formerr;
+-		(void) inet_ntop(AF_INET6, rdata, buf, buflen);
++		if (rdlen != (size_t)NS_IN6ADDRSZ)
++		  goto formerr;
++		if (inet_ntop (AF_INET6, rdata, buf, buflen) == NULL)
++		  return -1;
+ 		addlen(strlen(buf), &buf, &buflen);
+ 		break;
+ 
+@@ -400,7 +402,8 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 			goto formerr;
+ 
+ 		/* Address. */
+-		(void) inet_ntop(AF_INET, rdata, buf, buflen);
++		if (inet_ntop (AF_INET, rdata, buf, buflen) == NULL)
++		  return -1;
+ 		addlen(strlen(buf), &buf, &buflen);
+ 		rdata += NS_INADDRSZ;
+ 
+@@ -452,7 +455,8 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 			if (rdata + pbyte >= edata) goto formerr;
+ 			memset(&a, 0, sizeof(a));
+ 			memcpy(&a.s6_addr[pbyte], rdata, sizeof(a) - pbyte);
+-			(void) inet_ntop(AF_INET6, &a, buf, buflen);
++			if (inet_ntop (AF_INET6, &a, buf, buflen) == NULL)
++			  return -1;
+ 			addlen(strlen(buf), &buf, &buflen);
+ 			rdata += sizeof(a) - pbyte;
+ 		}
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc/0029-CVE-2026-6238-0005.patch b/meta/recipes-core/glibc/glibc/0029-CVE-2026-6238-0005.patch
new file mode 100644
index 0000000000..bc64f042e5
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0029-CVE-2026-6238-0005.patch
@@ -0,0 +1,69 @@
+From a7b60d23bbb56eaef59f4962e4140062e552600a Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 19 Jun 2026 18:22:20 +0200
+Subject: [PATCH] resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
+
+Check that the RDATA payload does not require more than RDATALEN
+bytes while processing it.  The fixes cover A6, LOC records.
+(CERT, TKEY, TSIG were fixed before, by switching to the generic
+formatter.)
+
+The vulnerable LOC record handling was first introduced before
+glibc 2.0, in commit ee188d555b8c32ad9704a7440cab400af967292f.
+
+CERT, TSIG, TKEY handling came with commit
+b43b13ac2544b11f35be301d1589b51a8473e32b, released with glibc 2.2.
+
+A6 record handling was introduced in commit
+91633816430e7ec5a19fe3ff510a7c4822a9557e ("* resolv/ns_print.c
+(ns_sprintrrf): Handle ns_t_a6 and ns_t_opt."), which went into glibc
+2.7.
+
+This fixes bug 34069.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-6238
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=a7b60d23bbb56eaef59f4962e4140062e552600a]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ resolv/ns_print.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/resolv/ns_print.c b/resolv/ns_print.c
+index 882a86e5..d5da99d6 100644
+--- a/resolv/ns_print.c
++++ b/resolv/ns_print.c
+@@ -316,7 +316,8 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 	case ns_t_loc: {
+ 		char t[255];
+ 
+-		/* XXX protocol format checking? */
++		if (rdlen != 16)
++		  goto formerr;
+ 		(void) loc_ntoa(rdata, t);
+ 		T(addstr(t, strlen(t), &buf, &buflen));
+ 		break;
+@@ -449,13 +450,14 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 
+ 		/* address suffix: provided only when prefix len != 128 */
+ 		if (pbit < 128) {
+-			if (rdata + pbyte >= edata) goto formerr;
++			unsigned int bytelen = sizeof(a) - pbyte;
++			if (edata - rdata < bytelen) goto formerr;
+ 			memset(&a, 0, sizeof(a));
+-			memcpy(&a.s6_addr[pbyte], rdata, sizeof(a) - pbyte);
++			memcpy(&a.s6_addr[pbyte], rdata, bytelen);
+ 			if (inet_ntop (AF_INET6, &a, buf, buflen) == NULL)
+ 			  return -1;
+ 			addlen(strlen(buf), &buf, &buflen);
+-			rdata += sizeof(a) - pbyte;
++			rdata += bytelen;
+ 		}
+ 
+ 		/* prefix name: provided only when prefix len > 0 */
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc/0030-CVE-2026-6238-0006.patch b/meta/recipes-core/glibc/glibc/0030-CVE-2026-6238-0006.patch
new file mode 100644
index 0000000000..7b6b2aa319
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0030-CVE-2026-6238-0006.patch
@@ -0,0 +1,382 @@
+From 4ba0b79b9596e5a4951cc9eaa1546a55e543e083 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 19 Jun 2026 18:22:20 +0200
+Subject: [PATCH] resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
+
+This test case covers both input buffer overreads and output buffer
+overflows.  It should systematically cover these issues.
+
+I used code auto-generation for updating the test expectations for
+truncated RDATA in TXT, ISDN records, after writing the rest
+of the test by hand.
+
+Assisted-by: LLM
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-6238
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=4ba0b79b9596e5a4951cc9eaa1546a55e543e083]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ resolv/Makefile          |   2 +
+ resolv/tst-ns_sprintrr.c | 329 +++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 331 insertions(+)
+ create mode 100644 resolv/tst-ns_sprintrr.c
+diff --git a/resolv/Makefile b/resolv/Makefile
+index 79a1b9647f..130d8b51e0 100644
+--- a/resolv/Makefile
++++ b/resolv/Makefile
+@@ -92,6 +92,7 @@ tests += \
+   tst-ns_name \
+   tst-ns_name_compress \
+   tst-ns_name_pton \
++  tst-ns_sprintrr \
+   tst-res_hconf_reorder \
+   tst-res_hnok \
+   tst-resolv-aliases \
+@@ -323,5 +324,6 @@ $(objpfx)tst-ns_name: $(objpfx)libresolv.so
+ $(objpfx)tst-ns_name.out: tst-ns_name.data
+ $(objpfx)tst-ns_name_compress: $(objpfx)libresolv.so
+ $(objpfx)tst-ns_name_pton: $(objpfx)libresolv.so
++$(objpfx)tst-ns_sprintrr: $(objpfx)libresolv.so
+ $(objpfx)tst-res_hnok: $(objpfx)libresolv.so
+ $(objpfx)tst-p_secstodate: $(objpfx)libresolv.so
+diff --git a/resolv/tst-ns_sprintrr.c b/resolv/tst-ns_sprintrr.c
+new file mode 100644
+index 0000000000..34739b5924
+--- /dev/null
++++ b/resolv/tst-ns_sprintrr.c
+@@ -0,0 +1,329 @@
++/* Tests for the ns_sprintrr function.
++   Copyright (C) 2026 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <arpa/nameser.h>
++
++#include <alloc_buffer.h>
++#include <arpa/inet.h>
++#include <libc-diag.h>
++#include <stdbool.h>
++#include <string.h>
++#include <support/check.h>
++#include <support/next_to_fault.h>
++
++#include <stdio.h>
++
++/* Regions that test_one_record uses for input and output.  */
++static struct support_next_to_fault ntf_in;
++static struct support_next_to_fault ntf_out;
++
++/* This is used by test_one_record to construct the packet.   */
++static const char packet_prefix[] =
++  /* DNS response with one question, one answer record.  */
++  "AA\x81\x80\0\1\0\1\0\0\0\0"
++  /* Question: www.example.org/IN/ANY.  */
++  "\3www\7example\3org\0\0\xff\0\1"
++  /* Response: compression reference.  */
++  "\xc0\x0c";
++
++/* Use ns_sprintrr to format a DNS record (starting with
++   packet_prefix) of type RTYPE, with a record payload of RDATALEN
++   bytes starting at RDATA.  Check successful formatting against
++   EXPECTED.  Try various truncated input and output buffers to catch
++   overreads and buffer overflows, using ntf_in and ntf_out above.  */
++static void
++test_one_record (uint16_t rtype, const char *rdata, size_t rdatalen,
++                 const char *expected)
++{
++  struct rr_header
++  {
++    uint16_t typ;
++    uint16_t cls;
++    uint32_t ttl;
++    uint16_t rdatalen;
++    uint16_t pad;
++  } hdr =
++    {
++      .typ = htons (rtype),
++      .cls = htons (ns_c_in),
++      .ttl = htonl (86400),     /* One day.  */
++      .rdatalen = htons (rdatalen),
++    };
++  enum { hdrlen = offsetof (struct rr_header, pad) };
++  TEST_COMPARE (hdrlen, 10);
++
++  /* Construct the packet from packet_prefix, hdr, and rdata.  */
++  unsigned char packet[512];
++  size_t packetlen;
++  {
++    struct alloc_buffer buf = alloc_buffer_create (packet, sizeof (packet));
++    alloc_buffer_copy_bytes (&buf, packet_prefix, sizeof (packet_prefix) - 1);
++    alloc_buffer_copy_bytes (&buf, &hdr, hdrlen);
++    alloc_buffer_copy_bytes (&buf, rdata, rdatalen);
++    packetlen = sizeof (packet) - alloc_buffer_size (&buf);
++  }
++
++  /* Parse the record.   */
++  ns_msg msg;
++  TEST_COMPARE (ns_initparse (packet, packetlen, &msg), 0);
++  ns_rr rr;
++  TEST_COMPARE (ns_parserr (&msg, ns_s_an, 0, &rr), 0);
++
++  /* Try sizes up to this limit.  Go a bit beyond the expected size to
++     check for errors.  */
++  size_t max_result_size = strlen (expected) + 16;
++
++  bool success = false;
++  for (size_t result_size = 1; result_size <= max_result_size; ++result_size)
++    {
++      char *result_start = ntf_out.buffer + ntf_out.length - result_size;
++      memset (result_start, 'X', result_size);
++
++      /* ns_sprintrr was deprecated in 2.34.  */
++      DIAG_PUSH_NEEDS_COMMENT;
++      DIAG_IGNORE_NEEDS_COMMENT (4.9, "-Wdeprecated-declarations");
++      int ret = ns_sprintrr (&msg, &rr, NULL, NULL, result_start, result_size);
++      DIAG_POP_NEEDS_COMMENT;
++
++      if (ret > 0)
++        {
++          TEST_COMPARE_STRING (result_start, expected);
++          TEST_COMPARE (ret, strlen (expected));
++          success = true;
++        }
++      else
++        {
++          TEST_VERIFY (!success);
++          TEST_COMPARE (ret, -1);
++        }
++    }
++  TEST_VERIFY (success);
++
++  /* Test with truncated RDATA.   */
++  for (size_t rdata_size = 0; rdata_size <= rdatalen; ++rdata_size)
++    {
++      size_t truncated_packet_size = packetlen - rdatalen + rdata_size;
++      unsigned char *packet_start
++        = ((unsigned char *) ntf_in.buffer + ntf_in.length
++           - truncated_packet_size);
++      memcpy (packet_start, packet, truncated_packet_size);
++      /* Patch in the updated RDATA length field.  */
++      uint16_t new_rdatalen = htons (rdata_size);
++      memcpy (packet_start + truncated_packet_size - rdata_size - 2,
++              &new_rdatalen, 2);
++
++      ns_msg msg;
++      TEST_COMPARE (ns_initparse (packet_start, truncated_packet_size, &msg),
++                    0);
++      ns_rr rr;
++      TEST_COMPARE (ns_parserr (&msg, ns_s_an, 0, &rr), 0);
++
++      size_t result_size = strlen (expected) + 1;
++      char *result_start = ntf_out.buffer + ntf_out.length - result_size;
++      memset (result_start, 'X', result_size);
++
++      /* ns_sprintrr was deprecated in 2.34.  */
++      DIAG_PUSH_NEEDS_COMMENT;
++      DIAG_IGNORE_NEEDS_COMMENT (4.9, "-Wdeprecated-declarations");
++      int ret = ns_sprintrr (&msg, &rr, NULL, NULL, result_start, result_size);
++      DIAG_POP_NEEDS_COMMENT;
++
++      /* This flag indicates whether the output is syntactically
++         correct.  In some cases, truncation may still yield a valid
++         payload.  */
++      bool broken = rdata_size < rdatalen;
++      switch (rtype)
++        {
++        case ns_t_wks:
++          /* WKS records use all trailing bytes for the port bitmap.  */
++          broken = rdata_size < 5;
++          break;
++        case ns_t_nsap:
++          /* Uses all bytes that are available.  */
++          broken = false;
++          break;
++        case ns_t_txt:
++          /* Truncation produces a valid payload if it occurs right
++             after a complete string in the TXT payload.  */
++          broken = false;
++          for (size_t pos = 0; pos < rdata_size; )
++            {
++              unsigned int slen = rdata[pos] & 0xff;
++              if (pos + 1 + slen > rdata_size)
++                {
++                  broken = true;
++                  break;
++                }
++              pos += 1 + slen;
++            }
++          break;
++        case ns_t_isdn:
++          /* The second field is optional.  If it is present, it must
++             not be truncated.  */
++          broken = rdata_size < 6 || (rdata_size > 6 && rdata_size < rdatalen);
++          break;
++        case ns_t_a6:
++          /* The first A6 subtest contains a trailing domain name,
++             which is ignored and not formatted.  */
++          if (rdata_size > 0 && rdata[0] == 0)
++            broken = rdata_size < 17;
++          break;
++        case ns_t_cert:
++        case ns_t_tkey:
++        case ns_t_tsig:
++          /* Only generic printing, which does not validate anything.  */
++          broken = false;
++          break;
++        }
++
++      if (broken)
++        {
++          if (strstr (result_start, "RR format error") != NULL)
++            /* No further checks if an error indicator has been added
++               to the output.  */
++            ;
++          else
++            TEST_COMPARE (ret, -1);
++        }
++      else
++        TEST_VERIFY (ret > 0);
++    }
++}
++
++static int
++do_test (void)
++{
++  ntf_in = support_next_to_fault_allocate (512);
++  ntf_out = support_next_to_fault_allocate (256);
++
++#define T(rtype, rdata, expected) \
++  test_one_record (rtype, rdata, sizeof (rdata) - 1, expected)
++  T (ns_t_a, "\xc0\0\2\1", "www.example.org.\t1D IN A\t\t192.0.2.1");
++  T (ns_t_cname, "\4www1\4prod\xc0\x10",
++     "www.example.org.\t1D IN CNAME\twww1.prod.example.org.");
++  T (ns_t_hinfo, "\5first\6second",
++     "www.example.org.\t1D IN HINFO\t\"first\" \"second\"");
++  T (ns_t_isdn, "\5first\6second",
++     "www.example.org.\t1D IN ISDN\t\"first\" \"second\"");
++  /* Bug: Extra space at the end in the text representation of ISDN RRs.  */
++  T (ns_t_isdn, "\5first", "www.example.org.\t1D IN ISDN\t\"first\" ");
++  T (ns_t_soa,
++     "\2ns\xc0\x10\12hostmaster\xc0\x10"
++     "\0\0\0\1\0\0\0\2\0\0\0\3\0\0\0\4\0\0\0\5",
++     "www.example.org.\t1D IN SOA\tns.example.org. hostmaster.example.org. (\n"
++     "\t\t\t\t\t1\t\t; serial\n"
++     "\t\t\t\t\t2S\t\t; refresh\n"
++     "\t\t\t\t\t3S\t\t; retry\n"
++     "\t\t\t\t\t4S\t\t; expiry\n"
++     "\t\t\t\t\t5S )\t\t; minimum\n");
++  T (ns_t_mx, "\0\xa\2mx\xc0\x10",
++     "www.example.org.\t1D IN MX\t10 mx.example.org.");
++  T (ns_t_px, "\0\xa\3px1\xc0\x10\3px2\xc0\x10",
++     "www.example.org.\t1D IN PX\t10 px1.example.org. px2.example.org.");
++  T (ns_t_x25, "\4X.25",
++     "www.example.org.\t1D IN X25\t\"X.25\"");
++  T (ns_t_txt, "\1A\2BC\3DEF",
++     "www.example.org.\t1D IN TXT\t\"A\" \"BC\" \"DEF\"");
++  T (ns_t_nsap, "",
++     "www.example.org.\t1D IN NSAP\t");
++  T (ns_t_nsap, "\1",
++     "www.example.org.\t1D IN NSAP\t01");
++  T (ns_t_nsap, "\1\2",
++     "www.example.org.\t1D IN NSAP\t01.02");
++  T (ns_t_nsap, "\1\2\3",
++     "www.example.org.\t1D IN NSAP\t01.0203");
++  T (ns_t_nsap, "\1\2\3\4",
++     "www.example.org.\t1D IN NSAP\t01.0203.04");
++  T (ns_t_nsap,
++     "\1\2\3\4\5\6\7\10\11\12\13\14\15\16\17\20\21\22\23\24\25\26\27\30\31\32"
++     "\33\34\35\36\37\40\41\42\43\44\45\46\47\50\51\52\53\54\55\56\57\60\61"
++     "\62\63\64\65\66\67\70\71\72\73\74\75\76\77\100\101\102\103\104\105\106"
++     "\107\110\111\112\113\114\115\116\117\120\121\122\123\124\125\126\127"
++     "\130\131\132\133\134\135\136\137\140\141\142\143\144\145\146\147\150"
++     "\151\152\153\154\155\156\157\160\161\162\163\164\165\166\167\170\171"
++     "\172\173\174\175\176\177\200\201\202\203\204\205\206\207\210\211\212"
++     "\213\214\215\216\217\220\221\222\223\224\225\226\227\230\231\232\233"
++     "\234\235\236\237\240\241\242\243\244\245\246\247\250\251\252\253\254"
++     "\255\256\257\260\261\262\263\264\265\266\267\270\271\272\273\274\275"
++     "\276\277\300\301\302\303\304\305\306\307\310\311\312\313\314\315\316"
++     "\317\320\321\322\323\324\325\326\327\330\331\332\333\334\335\336\337"
++     "\340\341\342\343\344\345\346\347\350\351\352\353\354\355\356\357\360"
++     "\361\362\363\364\365\366\367\370\371\372\373\374\375\376\377",
++     "www.example.org.\t1D IN NSAP\t"
++     "01.0203.0405.0607.0809.0A0B.0C0D.0E0F.1011.1213.1415.1617.1819.1A1B"
++     ".1C1D.1E1F.2021.2223.2425.2627.2829.2A2B.2C2D.2E2F.3031.3233.3435.3637"
++     ".3839.3A3B.3C3D.3E3F.4041.4243.4445.4647.4849.4A4B.4C4D.4E4F.5051.5253"
++     ".5455.5657.5859.5A5B.5C5D.5E5F.6061.6263.6465.6667.6869.6A6B.6C6D.6E6F"
++     ".7071.7273.7475.7677.7879.7A7B.7C7D.7E7F.8081.8283.8485.8687.8889.8A8B"
++     ".8C8D.8E8F.9091.9293.9495.9697.9899.9A9B.9C9D.9E9F.A0A1.A2A3.A4A5.A6A7"
++     ".A8A9.AAAB.ACAD.AEAF.B0B1.B2B3.B4B5.B6B7.B8B9.BABB.BCBD.BEBF.C0C1.C2C3"
++     ".C4C5.C6C7.C8C9.CACB.CCCD.CECF.D0D1.D2D3.D4D5.D6D7.D8D9.DADB.DCDD.DEDF"
++     ".E0E1.E2E3.E4E5.E6E7.E8E9.EAEB.ECED.EEEF.F0F1.F2F3.F4F5.F6F7.F8F9.FAFB"
++     ".FCFD.FEFF");
++  T (ns_t_aaaa, "\x20\x01\x0d\xb8\0\0\0\0\0\0\0\0\0\0\x12\x34",
++     "www.example.org.\t1D IN AAAA\t2001:db8::1234");
++  /* Example from RFC 1876.  The loc_ntoa format is different from the
++     official text representation.  */
++  T (ns_t_loc,
++     "\000\063\026\023\211\027\055\320\160\276\025\360\000\230\215\040",
++     "www.example.org.\t1D IN LOC"
++     "\t42 21 54.000 N 71 06 18.000 W -24.00m 30.00m 10000.00m 10.00m");
++  T (ns_t_naptr,
++     "\0\1\0\2\5flags\7service\2.*\5naptr\xc0\x10",
++     "www.example.org.\t1D IN NAPTR\t1 2 \"flags\" \"service\" \".*\""
++     " naptr.example.org.");
++  T (ns_t_srv,
++     "\0\1\0\2\0\x50\4www1\xc0\x10",
++     "www.example.org.\t1D IN SRV\t1 2 80 www1.example.org.");
++  T (ns_t_rp, "\3rp1\xc0\x10\3rp2\xc0\x10",
++     "www.example.org.\t1D IN RP\trp1.example.org. rp2.example.org.");
++  T (ns_t_wks, "\xc0\0\2\1\6\0\0\0\0\0\0\0\0\0\0\200",
++     "www.example.org.\t1D IN WKS\t192.0.2.1 6 ( \n\t\t\t\t80 )");
++  T (ns_t_cert, "\0\1\x04\xd2\0blob",
++     "www.example.org.\t1D IN CERT\t\\# 9 (\n"
++     "\t00 01 04 d2 00 62 6c 6f 62 )\t\t\t; .....blob");
++  T (ns_t_tkey, "\4algo\0\0\0\0\1\0\0\0\2\0\3\0\4"
++     "\0\5\xa1\xa2\xa3\xa4\xa5\0\3\xb1\xb2\xb3",
++     "www.example.org.\t1D IN TYPE249\t\\# 30 (\n"
++     "\t04 61 6c 67 6f 00 00 00 00 01 00 00 00 02 00 03 ; .algo...........\n"
++     "\t00 04 00 05 a1 a2 a3 a4 a5 00 03 b1 b2 b3 )\t; ..............");
++  T (ns_t_tsig, "\4algo\0"
++     "\0\20\xdd\xcd\x64\x10\xe9\x21\x34\x1a\x8e\xe0\xa1\x9a\x30\xfc\x3b\xd1"
++     "\0\2\0\3\0\5other",
++     "www.example.org.\t1D IN TSIG\t\\# 35 (\n"
++     "\t04 61 6c 67 6f 00 00 10 dd cd 64 10 e9 21 34 1a ; .algo.....d..!4.\n"
++     "\t8e e0 a1 9a 30 fc 3b d1 00 02 00 03 00 05 6f 74 ; ....0.;.......ot\n"
++     "\t68 65 72 )\t\t\t\t\t; her");
++  T (ns_t_a6,
++     "\0\x20\x01\x0d\xb8\0\0\0\0\0\0\0\0\0\0\x12\x34\6prefix\xc0\x10",
++     "www.example.org.\t1D IN A6\t0 2001:db8::1234");
++  T (ns_t_a6,
++     "\0\x20\x01\x0d\xb8\0\0\0\0\0\0\0\0\0\0\x12\x35",
++     "www.example.org.\t1D IN A6\t0 2001:db8::1235");
++  T (ns_t_a6, "\200\6prefix\xc0\x10",
++     "www.example.org.\t1D IN A6\t128  prefix.example.org.");
++  T (ns_t_a6, "\x20\0\0\0\0\0\0\0\0\0\0\x12\x36\6prefix\xc0\x10",
++     "www.example.org.\t1D IN A6\t32 ::1236 prefix.example.org.");
++#undef T
++
++  support_next_to_fault_free (&ntf_in);
++  support_next_to_fault_free (&ntf_out);
++  return 0;
++}
++
++#include <support/test-driver.c>
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 88ad5e44e8..d31c865641 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -57,6 +57,12 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-qemu-stale-process.patch \
            file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch \
            file://0024-CVE-2026-5435.patch \
+           file://0025-CVE-2026-6238-0001.patch \
+           file://0026-CVE-2026-6238-0002.patch \
+           file://0027-CVE-2026-6238-0003.patch \
+           file://0028-CVE-2026-6238-0004.patch \
+           file://0029-CVE-2026-6238-0005.patch \
+           file://0030-CVE-2026-6238-0006.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.49.0


