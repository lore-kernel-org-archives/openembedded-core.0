Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A53C43211
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:07 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37118.1782485760886985631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 07:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=feSTTBws;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=feSTTBws;
 spf=pass (domain: arm.com, ip: 40.107.162.22, mailfrom: luca.fancellu@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lqIjrc+RRXJjAKOC9eTzEXLVnxMPgHMrsXQ3JeR5V18CfA046kaf6hD48lJcWhi5GQY9P70OZ+rFActjzw1J5CdtRQjHHW60ipXRl3Sg3Pt4aLD/BXAViloC7GPGSiZ48vHk2M9s2UGF32Z5dkQJ18AjHOS6HotWGEejxHTc1nu+kCnAFzMA0CthBREZix/FTacjvKfYQbJ/lSyqo2MH6cA0gknKA5NfzpKM97o/k8D9kICsXh1+XP85hdY/+YnlH4td+SzpwJmKjTA//hSaiVuqAsyH+zs9qAn2hY+bSi9RuR0cvZJBm/3HN1Hja4RrEcwIn09AfVE1ZCqd0IsA1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkI54Xq+5Of9NP+KJP9gKCmCp2+l46mmsaHZl99VPSg=;
 b=KlvDGcX8cAfJ6nR31ROXLTq/M1mpByLAxHHeZ1Jne7Q2IItVsfozx2NylLn72+ZUUAi8H7fgwVQjWSAgjU8GB5N+Mk6ZqjE9dCiys+l7aqkF309cmMQbS4EaoNQMlIZnzuDhD8/ahxhGFxzWQ0qe1bIRmwcEYXg3/gkYXc+UQrO4PMI4B4H5YX8B2aoSD6wIT+gL7iYDnoItoEabLFcMxWLlzXm6WBCRIm2YaKIiZARKQQM4acw/OdtzUujsWiHXWCYHcSDPQC8J4q3t39/v3NSZzg3aBRu/PyOtcPe7gG6YTvMGQuVQDuIfmXC2/Bh8E2fFNTyTPbeXKfL83N/V+w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkI54Xq+5Of9NP+KJP9gKCmCp2+l46mmsaHZl99VPSg=;
 b=feSTTBwsdgq47U9qVAK0h/LrN3mNRdUQb6490YL/tDDMV10L3vgUeFL4COx9sJ1YJoEPeMMNcEuxSwM0o1O/MYeseuUqaBBS6jPV9ttTos+Mk45opPLjrpFqxXqST41MGpVcIoAl5mxOSNZrEmeLbvQYwzEHbSa+pDhouaePJAY=
Received: from PA7P264CA0217.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:374::18)
 by AS8PR08MB9839.eurprd08.prod.outlook.com (2603:10a6:20b:614::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 14:55:54 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:102:374:cafe::36) by PA7P264CA0217.outlook.office365.com
 (2603:10a6:102:374::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 14:55:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.0 via
 Frontend Transport; Fri, 26 Jun 2026 14:55:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQThI8MdcmNNdYpM3K05KQYAljeTqXb1Rbz6xbCFNVgFNZqR1vKdDZXbSBja86WrYJt6eIb9jkYoN9Dr+XoRm4EmjJQg1RYfND+owE75fLELujmAJoExHkpP9MyDrflFAHSVW1XnN8+vN075kq2JMxEhujXnVnT1oTjZkeAUwRZvgmrN93z2H8RmsF5bGmcDSmfiVBKo9ttow/DOjr+YpGMdsAHIXWc3RYtZqUmsC5SI6f6m9EPYE2UA52bcLIsL5zIfqHEhIaWxOFhX4NQ2/wkYvHb0q79zwoet6NqTSH30td71iBOnAghUNHRsSzfDAO7uo1NYOu805dPMGjiMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkI54Xq+5Of9NP+KJP9gKCmCp2+l46mmsaHZl99VPSg=;
 b=gI5nSkcu22RCUz+VX4EBpD9sVfjexoY393ZVS/9wZrdY7Ppl7osORhmI524bVfQ3LAN5JabcxV/s9CueaFVnq2zB/tEM+e1T4DWPbF+vclINwn3pgn0Z+CYmkvwSjUKAi4BDHEbLVKZQ/+DwzhVEmHWt/Gpuc58nV58LayfyagNLZQVnKQIbsVqdPdCI/4Hqj1g2pPQH7niL2Oz9BFWCav8Y+4CLoJhjRjl3Ri7mmoKAOKMzGIkfEV8bFIK9QO8crkDCMYN9S/umzWdp428HqxJ3550lNw1FdDVZ1VW/yLJ1vRa/pwrXHBZhdkArEtaHTgUG20sMRXY8yhe0mssdXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkI54Xq+5Of9NP+KJP9gKCmCp2+l46mmsaHZl99VPSg=;
 b=feSTTBwsdgq47U9qVAK0h/LrN3mNRdUQb6490YL/tDDMV10L3vgUeFL4COx9sJ1YJoEPeMMNcEuxSwM0o1O/MYeseuUqaBBS6jPV9ttTos+Mk45opPLjrpFqxXqST41MGpVcIoAl5mxOSNZrEmeLbvQYwzEHbSa+pDhouaePJAY=
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS8PR08MB6390.eurprd08.prod.outlook.com (2603:10a6:20b:31b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 14:54:51 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 14:54:51 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] llvm: Enable MLIR support
Thread-Topic: [OE-core] [PATCH] llvm: Enable MLIR support
Thread-Index: AQHdBLZxzjTrhzY24kusGB1XpsuCcbZQdAaAgABvkoCAAApRAA==
Date: Fri, 26 Jun 2026 14:54:51 +0000
Message-ID: <6D639B9F-A286-4011-88EF-0A485F66B56E@arm.com>
References: <20260625133120.2111653-1-luca.fancellu@arm.com>
 <CANNYZj8L9c48wTyEp38RkCMzi=XQQS9_rr++KJwZvk2fSuTHeQ@mail.gmail.com>
 <60267670-C3C0-4448-B2D8-B7B60E7297D3@arm.com>
 <CANNYZj8jarNnjjVLhW-F7guAz359G6MV5bfod-5VqXqZmi_F-w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8jarNnjjVLhW-F7guAz359G6MV5bfod-5VqXqZmi_F-w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	DU2PR08MB7272:EE_|AS8PR08MB6390:EE_|AM4PEPF00025F9A:EE_|AS8PR08MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: 6065f772-eee6-4865-8c50-08ded39305b6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|38070700021|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info-Original: 
 FENVztJetoqljja4CYVgjVNTczN4NRbYnLWPy0zPSL0xlPzYkazXukznfRlDfZKJVcdrsx556OnheC9Izc0I2WpATWxcO0PqiLuOtLyhJ+w5NyG9YElora2FlM/3f28Wc+uWGx5NO+0Ny5PQHAXskn1q/JqkooLfukx3lHOkxoEc/CZHucTgbw7Cdro+GhnhO66Annx1XSR8wsKjnXx51sZ7p458KbL6SjDkeZSrZK5SkbYoJJgjHSQSVGxgz0jP3E6Kp4/vtJhkvy+Ph/Oov65F25MuXCZEh5QDDMaXtiar9fbdkw+AC2Z0ZNgtz8lVJfx1DlDwMqlJw1np37gTlN7Nd5XW+g/wO+WvPBYR+Nv8HqpFUfDdrHG1f1212K+3A/ZGvy+/jnAf64MLZfd7YdGYLRISYcxBBQgpHk2gmSjU4evlwttegTwZQXq5vWrTEROREF4juyOij1j8itgmNmlPu2nuV+BmJdRFxiUfB3U1OUX0CHRA+rGTfvizRTva5ILDgJsHLacFh+S4jU42ywKX5M1f1DCRrasLzgJyS9BVzcu/QrCEuSFmXOPOWgQI8MT+m3GZ+Fr5w2u7XmAAWQLFx8zeB9z3O7euFgte9sy1QnbXvNsYx2P6my7i1dVMyqkV4WpHHJWXhZ74VI8zx/QGMA4tvDhHVIdR/2gKp1uy1EkVy5jV+i0qBDPidYyBuVDLPCI+oODq1Oru9B/at+dzldHT/YJApZ7LpxHmvuM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(38070700021)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EC433AA370F4A04FA7F53E5FF9B7BAA2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 RniS6N98tPtCzQwyM/BTC0AoQJjpH84mECGF4fz2wgzAUrRRX8LnRzYrnU3weX1uUU8tXhHg2ylIOX3QWtpXINgH9K9yFrYM6C7yQ1+MsVEqZ9NjnBCKGH6LgdqN4UoFsXonMFRqQNRR07oh/A/PcDb8dekoZ8nBLXIS0T+EOI/zxD9OFo9ACY8Y5ZbjiW/4GFGLxmJdLHDNV+NuRUPxIQUDz1i8Eltq3A/rBQ2hjS4A/IGoE13KyVuNICZQjWVbs2CgRGhsB7LYY70Wgk7MHZXBLpzZHSlqdsybi7ZQr7u6ee2gbzF1UclPj6z8PTHgq5pFsAxou394VdFMemWcmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6390
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e1ed896a-5951-46df-c2a8-08ded392e01c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|14060799003|35042699022|1800799024|36860700016|6133799003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	S6zM9voFx9RkOcWstKOnfroHjwcTDfCOH4HFIGNERudzuItRT75FeFUTDJrUJHFfJZI7TFZ8U0hMskt7a+A9AOLXNwD9uHFg3ftA+25zgDWSLtZBIOLl1ea6bYCYwCAl8y1KRXcxbYQbYYr3KL6fLR5zVTnArRgyucBrnAGLwZOy54GSg9ZgeWE5WsR3DoptVKNLs/9vxR1SupXqSX3LZ/6QFONtqr9S9L1VcYPTMO4TMXrAgWjIMMPn6LV4TbJXTLrRR5lTmRkEYHfyjaPzMHj3arpxwc6w1aQ5cJJOZO2usTu10mWhOClTBtpwniUO2JIrrOaVsORLvDXu8AIKPkqqXHZT+B4m4DwBaMBpG48sYMU3loVLS/hyF9QPIkCbM0SxGnhGiNNw/qxOEo/H9Mo4y9Fi2rpxELChLaCXF5WOvL3zNhP0Dhc8B+IEgwHqI9eydxqAA7pxsDCtPs1RrOK/waYC4qdQbQwQ9qmY6U1dXiaqir8vsF4sbIjV9Cu6xS3icVlatNeaEg84upNRSxHdr/Ugv/VXucFZy7zTG+5J6fiKOEhHNVFG+wIJO4gHTWcIrAA54euYtvi4kVE9x5BEzDwy7C1XoBWaumrVpwxCeic2o459mDiFgq1+z1ND3eQ3qLr+DNBRDF4mqSiqZ4ksep7nAXjKGBcwPY8TRbl2MTX6r+vtja6AvHK5m5Tvep2iy15M7aL7/BUjOeMNzg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(14060799003)(35042699022)(1800799024)(36860700016)(6133799003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2s8rsxs/AZXyfK9vdNEzCwCMsd//FLA2iCKJT3BMJFXVee5OzuOVtzORSWx42dl2TQYqwPnvDcePBtZSLzxBqtu4l9amFMTTUyer0tkMxDxhj7vznJpl4R/d9GFD0rZH+0KiypjKCnerhM6MYX7QGHdoBwFjIIryLCpcPy9R5Jsd40NBBlddQMGVe+56XJEGs7C/U7/xidepuHrjeQ6trojDEZySioZZdUcbNRWlwepzclvmVvqNfRr4K3ZJpXSAEuGh1+SBQqUIn1XeVDQd3fv0OWrPmks6wMqX2Bp+ImJGCmLpBItoKnlLiFX9niIwt64YZkeiygngqPI5OTqPGTZu9ePydr2Bkq4p85SWFCUdArwO8Hugjam4mHbP6XRzADSULDSF5tSqYOLAGGgaux9M76i2sbNlfnXhk12Ug61UqgC+EXuBAAnUgMJvjCPx
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 14:55:54.2249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6065f772-eee6-4865-8c50-08ded39305b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9839
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 14:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239640

Hi Alex,

> On 26 Jun 2026, at 15:17, Alexander Kanavin <alex.kanavin@gmail.com> wrot=
e:
>=20
> On Fri, 26 Jun 2026 at 09:39, Luca Fancellu <Luca.Fancellu@arm.com> wrote=
:
>=20
>> I agree that having no in-tree consumer makes the patch weaker. One opti=
on I
>> can add is a small meta-selftest consumer recipe that uses CMake
>> find_package(MLIR CONFIG), links against the exported MLIR targets, and =
builds
>> a tiny program using the TOSA dialect. That would not make MLIR part of =
any
>> default image, but it would give oe-core coverage that the recipe export=
s a
>> usable MLIR SDK/native integration and that the TOSA dialect APIs are av=
ailable.
>>=20
>> If the preference is still that new recipes must have a production oe-co=
re
>> consumer rather than a selftest consumer, then I will drop this.
>=20
> Thanks, that all makes sense, and since oe-core adopted clang, it
> should be providing all parts of it. Oe-core does not need to have a
> 'production' consumer, and a synthetic test is fine, so at least it's
> possible to know it's not completely broken. You need to extend the
> commit message with this information, so it's recorded in git history.
>=20
> The one part that is missing and that I would like to see is a
> 'production' usage of this in some other public layer. Is that being
> developed somewhere? Presumably you're going to use this recipe for
> 'real work', can you show it? The more usage you can show, the
> stronger the case.

Thanks, that makes sense.

For v2 I will extend the commit message with the MLIR/TOSA background and
the oe-core rationale: MLIR is part of llvm-project, its consumers are
version-coupled to LLVM/MLIR CMake exports, and carrying it in oe-core avoi=
ds
downstream layers having to build or package a private LLVM/MLIR copy that =
can
drift from oe-core's LLVM.

I will also add a small selftest consumer recipe which uses
find_package(MLIR CONFIG), links against the exported MLIR targets, and bui=
lds
a tiny program using the TOSA dialect. That should give oe-core coverage th=
at
the recipe is usable without making MLIR part of any default build.

On the production usage: I cannot point to a public OpenEmbedded/Yocto laye=
r
today. The concrete use case that triggered this work is not public yet, an=
d I
am not aware of another public layer consuming LLVM MLIR at the moment, so =
I do
not want to overstate that part.

I still think oe-core is the right place for this because it is an optional=
,
standalone recipe for a component from the same llvm-project source tree th=
at
oe-core already provides. If the lack of a public production consumer makes=
 it
premature, I can hold the patch back until such a consumer is available.
Otherwise I will send a v2 with the expanded commit message and selftest
coverage.

Cheers,
Luca


