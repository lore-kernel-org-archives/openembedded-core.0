Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F0CC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 11:07:10 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66545.1782990425127942512
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 04:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=hzlRkLdy;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=r8Bxcayp;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6628bp4U1954271;
	Thu, 2 Jul 2026 06:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=HXpljLrDDq8hCrcC87ycMMIZiMnMGDjTFeCvk9eDw
	o8=; b=hzlRkLdy+x8ZZppJ+dkwWohfApHL5U9dGkdAS+TZrg6T01AQ4CtaE2uhk
	9Q4vglCYS2jfyZ0E5NLkw08nD5EdE54PRHh6O5xDZhYP/pUtJNGje4773BrU85yf
	+N91idwNlU/Ys/izdzdmiCoSScYtUIODc1fURAfQhoT0zUGIhaZldGI4xgvIYj8P
	NcBaAOB0Sm/fG/oweH3zeq3ckF1Cl1Wc7tgnW3rpj6tKBrSUxAcaPcREyOgmOq3G
	xCw3nfzJj2A4D79CGamGQFTAiOvLW0cMJVZ25CHm4SWEYkzbSa/fAvUW8GYPLUih
	fva8wD34EQ43+7VsspTHJChUXdyeg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f5mn58nq6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 06:07:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIFYEFONQRjfjGoBnca8HXCLsFzjLTMf9IjUwKeVMYHJcJcj+Xl/O5xsTKfm6Wd3mgg+xe2rgN2eaRcwjbKocio13GI+GV8dsnXtzJH66h2SwB0b5FvP+3/IxrSbDuhifJ1ztDe5p1nn9Henpt2VUC42OZnGIP99U6189MaNUppddjAw3jtm/9LHtG/w0e05NW86LoqzfMoqrnQewh1+7sSZ+HA0PBql4j7U0pPPIsKPwmM4rdL68v9dzu3WjytHTMIeu27Pw7Yz8xghZASNW1z28MmqByht9fcjLlf4xj95fwp9o5srfXi835e28garTLZhSHE2jM6UsBJWCoHu2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXpljLrDDq8hCrcC87ycMMIZiMnMGDjTFeCvk9eDwo8=;
 b=kG04KiASNf3LuFQI05safw8LQDAVYeSIJ8MZ/DZJKj79qeG4b167Mo09lwYPNn/och1OObva98c3P3i5FcGYb0dRJwB+MfHolvL+HaMd7eGwwwfki8OAJxEOpHcVisoi2bL7zv0jVF4jC6HyD9pAZ41OgyAYjlZ1BMnuyUh0EpXxpQRUD96XlY03kmWLZtCFB/OAlxp92U0q1m0DMYS4bxKV4q0OCsPZHow/v5cMiHgTCTnzhWD1J7w2lEfhue4798ZgFLqAlDwYB44omr3sFy9PPi3qBQQHnBppb3+DL/5Q1+r/7zxNzNOwP6hwG7mzsT9ND2cKw6+0WTOciO4Zxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXpljLrDDq8hCrcC87ycMMIZiMnMGDjTFeCvk9eDwo8=;
 b=r8Bxcaypb7jiVo8B8tEX83CQSyaWUhX6oU4JQx82otvPrSvvtjbRMZCvsf7OmfQa2yVnIbGz2qnyc1pDoeg83pYn6GaY/s/sJ3C/UFUdD2llKwJfbWgvJpja0eAmwFw12AN2wNLxxO8MFDo1bpnAh7I0MbzVCRxW2fZGfCzt26g=
Received: from SA9P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::26)
 by DS0PR10MB7456.namprd10.prod.outlook.com (2603:10b6:8:160::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 11:07:00 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:25:cafe::54) by SA9P221CA0021.outlook.office365.com
 (2603:10b6:806:25::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Thu, 2
 Jul 2026 11:07:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 11:07:00 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 06:06:59 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 06:06:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 06:06:59 -0500
Received: from [10.249.32.189] ([10.249.32.189])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 662B6xek3212912;
	Thu, 2 Jul 2026 06:06:59 -0500
Message-ID: <7d417ca8-2f7d-4930-a5a5-7d8c0647e683@ti.com>
Date: Thu, 2 Jul 2026 06:06:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] kernel-fit-image: Add KERNEL_DTBVENDORED support
 for FIT_CONF_DEFAULT_DTB
To: <adrian.freihofer@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20260630190445.3062430-1-reatmon@ti.com>
 <59e632d359f41c211f1bcdf10c36b4652e1f3ea6.camel@gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <59e632d359f41c211f1bcdf10c36b4652e1f3ea6.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|DS0PR10MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: a9189c99-0584-43f5-c674-08ded82a0a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|4022899009|36860700016|13003099007|22082099003|18002099003|4143699003|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	ppvzoe01BFqnvY/h1SstXX0y8TTZ8rKx0tltyKJPHsanW7Fkf4oyA+XheXjcaleL2SN8HMhLZlVxqH6HUepCUbQvNGpXVPdTj1USqtyOzZu+GUEw2PaEhgzCmlRcD3+vi24V26K3glvFsbbQ4rdZgT0VAE212q09Y+MHQKl/xzF4aklUTj+ITnXxaIkcCX67sSxEQVTLX/0caFWNHF8wcI2+iCYTpF1UaWaJwsL/jur+t9Lhq48jjxhB+wQrbANRhHm9lc2hzGOnWaRkNQfczf+gkbdtTzcpvs7zpqSjWLKNE8ZZZaq0nCXqmu6oWx/tSRnHddPyNZu5FGCe1LwRHpiV+Zi92oqmZZeLIjspzd6yL9EcBhxJUi9ycrY810QBRwVc/nLLEC7B1/wc//tozYf7C3ukVjRr7YVupmAAP+l91qvF9WhvqHXcjzxyUQr26IeP12Jxc9gs6L/uUudyKuraxGFDbC7qjDE0ITZoPRAQHQ6Nl4DsnqDUAIhYVMunfAoYpk2LyDnpA5R+jU/9/nivdxfLc2nP3+XRfEVhPEyXyd9rKxHHUCvVURJ6oNuWCxqaMDwFi95KMSjfVZtpjOpRDtYPOYqMf86ovxLj5gJY7besRQcc3Z4dCYC1znXbnUbF+mK8nVA+evcR/K3N74GU/IyT41sN2UXCiY6Y9Bf5HQn1c0x4qbzd/as5GMNWbB6KO9ok4a74e0sPoF1q+A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(4022899009)(36860700016)(13003099007)(22082099003)(18002099003)(4143699003)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eZgvNz6tSKHgUA53dPYzPPcf5Fkm5MRSBs7PWvcyd2SXGqU/xQclQDircOEtgRnA4NXMhLMmGmoDPFE2AMg4gXItlFNJ6k/VwRzro/UPOgsuTzwY7G1mdT5AmREtF48AgiaZK58XKHla6XJyfoqqiFJu+1ZxECp93JoW+X7cdGDyqNTc2yjNX3DEqTlKMSt/XwVuhm7ONHFaYym5I/QSXWA5tZXEptA1SjzeEnFmPmsRzG1Yk1Jao7fRzPG20mu1rUv2DacrEPuR7nPSBLBGltEfwsOpg6TUTwKvylnxUA0p5pEe8dEkmOFkqXXCbdZJEOq0Bg7zhWZchVIJRX37OElbY9c/31HFDJakVW4N8QYFRhNyKbZkqJ+UuaWq6+JlKVTaQ9GAKbBHVOpSltXVLYJivVAtsApDIo+91kIkTVoVYH733Inh1ot6MiXoJOuN
X-Exchange-RoutingPolicyChecked: 
	K4znGF1ycohTkukXiH4Z1OFASB1dXxSDXhYbDjHhS1gIhXwbM067TN0o9MCvQ9AxsLN+kvFDcx0v1U0eyuL3UeK7n+hbrGCReZ1TabJyB/TRkTb1B6tBZc5Fksq59Xls0lTamG98JDySlNzwnZWT7OrOMWOmK2jNey0+n6hdBolsPiQeCS6hgs2ucdF6HfOJvEhc/xU/9Jx1ZplILfijUYtW+6OhOYWfl96xabCp5OXM4kUhQGWvBOe0Jxs/fwAOC0BA8WPS+jL5PD4Pq3P5goAcdvtboHaRdsSaXYFBjLD9SB+Fbi+CQXCK9IU4M6QgldbJnM/wyATW4Y6XRJHevQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 11:07:00.5394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9189c99-0584-43f5-c674-08ded82a0a4a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7456
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExNSBTYWx0ZWRfX39HSHJ4pNzGi
 UzDs7d5DCryr8bDNFKJPXh/3KA/F2MutXWFek43yPPPryqBEYNmrKAuEC/tCFdgLpQF4U55JCAC
 AP469PyvE56aVk2eprmNzCOSsNuu3/SQ/3m/rKbHcuIwCPxDRNbf/YmAYCyU3V2FCTyz0P0nyFa
 +AtO7MOGpujE5d2SpImkHHUORHF2Wuki06Sz6Buq9av09shTj3iDTGRgSt0c6YCg9E+TDVxCHTR
 ng4ceqcjM7xbH7vzUOluLzIg1TqZEd6AEublVcp1OXD6vWu9I+q7smEZNRZKulZ4/igKKKXCvNF
 z9NG/jrw/0HVBlFcyJF5MdgQDUhxCZ6HsAaDdPfbXYlryqVgaMqO3FBaIX4sRocWFTGQrSUg/sI
 W+DjW04l+9QnU9UnZNoHtuo0KlqsSvu/UUibwl2C9y1021NEBRfjk7xPsmiqoX+wOArYnwFAmcQ
 SPL4FmXEieN13qRT7oA==
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a464657 cx=c_pps
 a=zclsoE7mv10+eI8hWvbpiQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=sozttTNsAAAA:8 a=LVTnExVuWlbiAb2-9rsA:9 a=PRpDppDLrCsA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExNSBTYWx0ZWRfX7FnmjtcJPBys
 x1Ny/U3vnQbkLiYq8RvqfXp1QyBMwD8nLsxRkDO0EiUxIDDnPaXcyHRB35kOqHFnJ6ryK+6kgZt
 NZi8+eiBcRTqTSS7rgbhblUYtssg7Rg=
X-Proofpoint-GUID: H4PGbnKZnjxCh2gNm7WTI-V3voAZOARc
X-Proofpoint-ORIG-GUID: H4PGbnKZnjxCh2gNm7WTI-V3voAZOARc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020115
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0380145.ppops.net id 6628bp4U1954271
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 11:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240032



On 7/2/2026 4:31 AM, adrian.freihofer@gmail.com wrote:
> Hi Ryan
>=20
> On Tue, 2026-06-30 at 14:04 -0500, Ryan Eatmon via
> lists.openembedded.org wrote:
>> When specifying a FIT_CONF_DEFAULT_DTB for a machine, you have to
>> exactly align the name with what will be in the fitImage file or you
>> will get a build error.=C2=A0 If you also turn on KERNEL_DTBVENDORED t=
hen
>> you
>> must also specify the vendor directory as part of the dtb name that
>> you
>> want for the default, but you must manually do the same mapping that
>> the
>> kernel-fit-image class is doing when it generates the fit-image.its
>> file.
>>
>> This patch just adds the same logic to figure out the value for the
>> requested default dtb and eliminate the need to understand the
>> internal
>> mapping of the class.=C2=A0 It should make specifying the value more
>> intuitive.=C2=A0 The same value that you put in the KERNEL_DEVICETREE =
can
>> be
>> used in the FIT_CONF_DEFAULT_DTB and the new code will correctly
>> honor
>> the KERNEL_DTBVENDORED setting.
>>
>> Before:
>>
>>  =C2=A0 KERNEL_DEVICETREE =3D "
>>  =C2=A0=C2=A0=C2=A0 ti/k3-am62p5-sk.dtb \
>>  =C2=A0=C2=A0=C2=A0 ... \
>>  =C2=A0 "
>>  =C2=A0 FIT_CONF_DEFAULT_DTB =3D "ti_k3-am62p5-sk.dtb"
>>
>> After:
>>
>>  =C2=A0 KERNEL_DEVICETREE =3D "
>>  =C2=A0=C2=A0=C2=A0 ti/k3-am62p5-sk.dtb \
>>  =C2=A0=C2=A0=C2=A0 ... \
>>  =C2=A0 "
>>  =C2=A0 FIT_CONF_DEFAULT_DTB =3D "ti/k3-am62p5-sk.dtb"
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>  =C2=A0meta/classes-recipe/kernel-fit-image.bbclass | 15 +++++++++++++=
+-
>>  =C2=A01 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass
>> b/meta/classes-recipe/kernel-fit-image.bbclass
>> index 448a88ccb1..f49838d639 100644
>> --- a/meta/classes-recipe/kernel-fit-image.bbclass
>> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
>> @@ -195,8 +195,21 @@ python do_compile() {
>>                                                  =20
>> loadable_loadaddress,
>>                                                  =20
>> loadable_entrypoint)
>>  =20
>> +=C2=A0=C2=A0=C2=A0 # Figure out if we have a default dtb and if we ne=
ed to honor
>> the
>> +=C2=A0=C2=A0=C2=A0 # KERNEL_DTBVENDORED variable to tweak the name to=
 match what
>> will be
>> +=C2=A0=C2=A0=C2=A0 # in the fitImage.
>> +=C2=A0=C2=A0=C2=A0 default_dtb =3D d.getVar("FIT_CONF_DEFAULT_DTB")
>> +=C2=A0=C2=A0=C2=A0 if default_dtb:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # With vendored DTs, repla=
ce any path separators with
>> underscores,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # this matches the behavio=
r used to generate the dtb entry
>> in other
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # parts of the code.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if d.getVar('KERNEL_DTBVEN=
DORED') !=3D "1":
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
fault_dtb =3D os.path.basename(default_dtb)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
fault_dtb =3D default_dtb.replace('/', '_')
>=20
> This is probably needed in addition to
> https://git.openembedded.org/openembedded-core/commit/?id=3D4297b94c372=
8cd2e320d75b68c508e12ab127719
> if I understand correctly.
>=20
> Would it make sense to move this if else block into a function which
> can be used in both places?

Yes.  It would.  I'll send a v2 with that and a test case as well.


> Regards,
> Adrian
>=20
>> +
>>  =C2=A0=C2=A0=C2=A0=C2=A0 # Generate the configuration section
>> -
>> root_node.fitimage_emit_section_config(d.getVar("FIT_CONF_DEFAULT_DTB
>> "), d.getVar("FIT_CONF_MAPPINGS"))
>> +=C2=A0=C2=A0=C2=A0 root_node.fitimage_emit_section_config(default_dtb=
,
>> d.getVar("FIT_CONF_MAPPINGS"))
>>  =20
>>  =C2=A0=C2=A0=C2=A0=C2=A0 # Write the its file
>>  =C2=A0=C2=A0=C2=A0=C2=A0 root_node.write_its_file(itsfile)
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#239914):
>> https://lists.openembedded.org/g/openembedded-core/message/239914
>> Mute This Topic: https://lists.openembedded.org/mt/120052405/4454582
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:
>> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
>> adrian.freihofer@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

