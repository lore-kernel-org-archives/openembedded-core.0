Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6705C531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 20:51:50 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28327.1784926305290134645
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 13:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=M/8ZNmfu;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=b7sX5ZlB;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: rs@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66OGsiYj3607880;
	Fri, 24 Jul 2026 15:51:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=tlRPN07CIMLrIP1C4/uAzntkPINsbKQvCcIZR6QUQ
	bc=; b=M/8ZNmfuD/3crtPAKxCfgduk6Ial3OcXzwmCBQU7j8C4ZzGS2mXKlN+Sq
	iDIqFY09vuoJNnb6tr4aDJ/Ca7wdflgVDyoTvyrs6hs2T7lsX6ULOWAAd438zDpP
	+Y6NylPi4/6GQimnR4AwkMN8VYnWDP2wMHBJmmdLR0PzxlUA4UAKysEyXVnmY7GF
	N2hNBSLMS5CHI4NmHevXsn2etlLsT3MH2Dok0ZU1540pZf1KWZKxo3GL6xsCqHNk
	pHz7tAEDr1ND+Vq3N3paFmno1oOKiZB523+4KJT5wXxQqjfxPgYzXQvPyFbh4Gkq
	fXF7yLsq4TWnR0CBq0A1YSBkiaCxg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013010.outbound.protection.outlook.com [40.93.201.10])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fm8k7jdbj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 15:51:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQzW05BEWLKmj1zYjpxfMUkgF3jJJmPEaDloB3vqnv5WYcNkUyYo4GEyvVtC+e49Q5uIeaXW6RKYI5LDXWFkNaeo9fAo1cKZ/wCQwdT9Ss9j0aagglBe45/fbnJnTVeMNJ0fYPrYNK59s5+aA74OOXBrKKKL95ukYGg5DVS6+sGdCFddea9Z0pwnslFbU3cqSY4AAWy/LpkkOTVjXA6pPPWRnyyeaNeUinn7Yf307VGRgHa1fj4aWy+G4tVqczGP8I+PjcQq5MwdmhyLtHfWJZiGMoJhekn/bohUZ3gu0+BEgSuDIi9tjHR7ei3qMXxVzY9b5i3r2IUeTNo6v2q7Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlRPN07CIMLrIP1C4/uAzntkPINsbKQvCcIZR6QUQbc=;
 b=FppL/tYfFpFGp6PSwiwDjAj1d9xNWYQ5wdb2MLrhIGih/clPn8XWiTd+6MJBa0Egad1Ekxk5B2fFnoOFiDvoMeP4D/KR4uArt+zs3Bm73VCI5Ob/3SALZibEGK5NTdKp8p0OPqsgN7I46HLMVvaEFeTrGp94FhvWR2XvJNfrrw2Z+vgd+lffYcG6gdzlgp1rD14bEyJU7OOYsLcpEH4L0b0+JnrZPU3EztOXiw2ooMqtMV4Gy0Jo5czg6T8Xf8gPWv9iQi2o53gJIbwuZ1yChNPAvp+dbWn8JqQAYxdu/KzATXBRJJHLUSzJhWMVungk5FTFOrx+oTDDijtni+Eznw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlRPN07CIMLrIP1C4/uAzntkPINsbKQvCcIZR6QUQbc=;
 b=b7sX5ZlBiUi1RBLdPMW5//VJVdW/W4gBjjuKczZduXaRW8NjYdicAH7U5r3Bha8yRRWSaUgmz0U1WtnkD/fPVDDwiYdJQWqzXwEpOIqzSt/ZKlk3w723bQmlNENhM3kQnx/wX+qgjQZw3UdMG6OTM1xZwWpwtL2dKqZkIXbnIf0=
Received: from BLAPR03CA0033.namprd03.prod.outlook.com (2603:10b6:208:32d::8)
 by BN0PR10MB4838.namprd10.prod.outlook.com (2603:10b6:408:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 20:51:31 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::a4) by BLAPR03CA0033.outlook.office365.com
 (2603:10b6:208:32d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 20:51:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 20:51:29 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 15:51:29 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 15:51:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 15:51:29 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OKpTZD345965;
	Fri, 24 Jul 2026 15:51:29 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Jul 2026 15:51:29 -0500
Message-ID: <DK73K96LZH3I.HPB679ANMAW6@ti.com>
Subject: Re: [OE-core] [PATCH v2] bitbake.conf: Extend distro feature
 usrmerge to merge bin+sbin
From: Randolph Sapp <rs@ti.com>
To: =?utf-8?q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>,
        <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <mathieu.dubois-briand@bootlin.com>, <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <18C52E3640016A00.1442561@lists.openembedded.org>
 <amMqIdRgjjuYsnAI@navimatix.de>
In-Reply-To: <amMqIdRgjjuYsnAI@navimatix.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|BN0PR10MB4838:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d80c788-1145-43ac-951a-08dee9c55656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|13003099007|56012099006|4143699003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	g5O+PUU69g70rBuGur7dL4K/va1fZFh4awL+VVziL5A55IidAXE2Oo608LDFebTZ2zxBlSoT8DEvIoEGSKfQYbkDMlqdkkNbPFJ5DYJ9P0sy6NL5aONT5lO6303NloiR5zIQdVL0a2vgFkIL9JS8pWwZ/cZ60uWszfVRp42tx/6ApGdqy/sDXQqb7XTnLS7Z9jotf8DnXwYx6O78XzV6v9BLkCMReYDO298SVuIs23o0rhp61TuDEqSK5mmTrNHUU11IfXIlAmls93wfvZzhsvybXlxYjkFJgm0/6nXuiZfsde7cjGLJXkQbkaXKtS4NM4BUKjv5smSRfz57YQr1ElECHrnM5tjQLvJREB8kI6ObDDFwD8HkwOl58+u/z4R680daq2R5qyK3T/cEuXDfDETh9TocePqK1qGOEY2ZtnxQl/kwsU5j5+3ZKqoFuPStXNeqPY3P/GS/evl1yAU95+El2UFnMfpUQCc8H7FMjmjskVu8o+4inP/Ppsi65oFzRyGJ13ojKi2qo4NhrTPiNV+g2EEZUbgC8mNnq0gi8LSjrtrikS6bU1zXFZJ3nAg4JLx5q2LDlEjO805Ie1csD9BTZMHfC1tvQ9PUf3BDH0DRw5kd/mLR18WHG4K82m9pm7CYQ5VB952Ykfqf8RTgMg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(13003099007)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Ln4lO3Xm+StD2owNvnS4Ia2cjmqJFoRcMxtp3vA3+MqI4gYaumu1Hpm4UnUhBwagvZzet/G20SH1m9igxe7WtXP3rnZBbneEi6SFjMHQUzqtLApOTZw6rl7eawi57GISzYRMH9pzrp17uKuSka0luHzGOWofs8DsJ5ykJ1+Lm8sLY+Dnvu0oDabTIaCnJg8smHY11o3w0Scr9xCCBBQTvo0vSQ7UrsYt+sXA4ODUExPqBYkChfdCCmejOLhLvjyT/6dUGs/DDxO8+3VFiJPAqMNawMAX2Mcvle/7jAfxpzpjK4VWyUQ2IUv05QiylMYsijJAIffV4+RyJFxyNZvSjJKyxJU7cFPPDJuyEs894/dWlsH85FXFwbZefgMXojGO+QAHhpgC0FrxY+IOyk7mXEeROSoJNBoSKGVrmE76aFOKh4w9DVQorsaE9UDPwTea
X-Exchange-RoutingPolicyChecked: 
	paGaoIO9KGRluwZ5kBw13zBhaeeeMfVaEYJH+d9HKMKSHMj3u7ANKWyFCKCiKNHuT0Ffy13HCT0lLQ8uLv3wVN1KKsuY8wcuG09rgllRTgx4o13F325iA6fHnDyMUsijopia3d+P+OwMsmz0qTAMLqiHyDUKWFgfBYIs36s9v+Halvasf/oCSlewSNPdngf8bBP5LcD7QhrcgybPbx/oVT36l0ID3DMUokBHjsc3yf6CWoXh6J/InRGiiDXUC5/6WOoVEeoLEkTF6NNlqjXDBHjbIWJcq+e2lJ5C8kiUfCa2m5V9vRui7JvidDg5xbfByVyfiMkVmuufXWDu6egjBA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 20:51:29.8409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d80c788-1145-43ac-951a-08dee9c55656
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4838
X-Proofpoint-GUID: HmZm9gi4XxQ6bKVUPC89scK55ZvwCGou
X-Authority-Analysis: v=2.4 cv=bJYm5v+Z c=1 sm=1 tr=0 ts=6a63d058 cx=c_pps
 a=dDG42FMqTjgm/c7QxIpGBg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=Br9LfDWDAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=sozttTNsAAAA:8 a=9BqAwVqSCzb4uCu5MeoA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: HmZm9gi4XxQ6bKVUPC89scK55ZvwCGou
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE4NyBTYWx0ZWRfXwgbYc+fILiy3
 0UcgPTJECDpnzD9oL0yz7/cET/VTP6Mr8Jd2r9nfoywqizqI4DQdXhSVoIC4WW8794fCxvoWupR
 qVJzOd9WzGFiuFD0DKQ8NsV4qL17qI65Y4d/Trbpn0cv60XGee6TpfTkHT/7rCrJ/JsHnH08ioX
 38NyGx5SUoyTRhqqi7Hmv91aSF4TjdlOigNMEN7qO1dkyAMlPc39J1NtxasAAYk/cdwH5FH5y1b
 U0/bHakLvH2IyZ0iOuzM5mJ3fqrIGXpSyBe+GkygB/JJDgHXQeOBBHIjxrMUZB2IhcftfgDseiy
 fj7oL24mtqmwlf96tFLwg5cqoX9u9zoH65gCLy4qExaTXi9aWKZE5kgrOugO+JNjURFTgkQRrX6
 JftN1MZQ0HHjL4LC8YWQQ3Zd2yXR7JS/m3C2tTJzXOTb8LSiNZQWflihFwG18jJ6zHvC+xE9GQv
 yf7eNDKy9X1FlR+uWBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE4NyBTYWx0ZWRfX26DU7K+Ruc4P
 nh8e/yzTtGGHKaz/Y7V/rEeVyRsjo87DSQvyBYiu6Kg4zqGXyy/VEw5hAbmO3Q2aME2HohyRiKj
 9LOnmwg91ER6W4OxaKzaDjONlor4JZw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240187
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 20:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241950

On Fri Jul 24, 2026 at 4:05 AM CDT, J=C3=B6rg Sommer wrote:
> J=C3=B6rg Sommer via lists.openembedded.org schrieb am Fr 24. Jul, 11:00 =
(+0200):
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> The split of bin and sbin became more artificial over time, and it is no
>> longer clear why programmes goes into the one or the other directory; e.=
g.
>> forever normal users have used sendmail in /usr/sbin, and fdisk and mkfs
>> learned to operate on files to create images long ago.
>>=20
>> Because systemd drives this movement to have only /usr/bin and symlink /=
bin,
>> /sbin and /usr/sbin to there, the usrmerge feature (started by systemd t=
oo)
>> should be extended to include the binmerge. For a system with split bin/=
sbin
>> `systemctl status` reports the system as tainted for *unmerged-bin.*
>>=20
>> Override most sbin variables to point to their bin equivalent when
>> usermerge is enabled, with the exception being base_sbindir_native and
>> sbindir_native. There is no guarantee the host machine is using this
>> filesystem scheme.
>>=20
>> This check was added to systemd back in 2024 [2].
>>=20
>> [1] https://gitlab.archlinux.org/archlinux/packaging/packages/filesystem=
/-/blob/main/PKGBUILD
>> [2] https://github.com/systemd/systemd/commit/844863c61e7b501097da84a1e4=
d1e4a6aa6d9f0d
>>=20
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>> ---
>>=20
>> I took Randolph's version and reworked it a bit. But the idea stays the =
same.
>
> This is a follow-up to <20260408195024.1874335-2-rs@ti.com>
> https://lists.openembedded.org/g/openembedded-core/message/234858

Thanks for taking this forward J=C3=B6rg. My main build machine is too slow=
 to look
at Yocto right now. Trying to requisition more hardware.

