Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B87BC4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 15:57:57 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.70])
 by mx.groups.io with SMTP id smtpd.web11.15321.1707494275246555830
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 07:57:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=XrsQb4Vm;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=XrsQb4Vm;
 spf=pass (domain: arm.com, ip: 40.107.13.70, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=U/m3XX4yfrQSs9N/tW9bMKmq2jCICeIcnR0NvtKD/urHNADf2xVpUOlPqZOtKEqAM431cRHohOWed/XEK+xIjw5K4ty6Y6WkZYvbnVC6URP74WiBzQm3bghNiWcSVmZq+i1w3BMX5u89qHXcz8joJiNpPlPXqOgzWLazIMC0VEq5DHfj2cf0WZYdSxBLUhieZIlXI9FkSD1tY+v1m3jibqjOcfoXTCYR2+B/CVOADqOe49y6CRh0apqCbIUOyEEqO9ap0PgilLCWWKTaLeo0Jb/tiD28IwX7chPU0/UptxJe7lfWDLob7Hoq0EZXsVIV7Ayer+dsdLff0Kjx7/R4JA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ERjKQGlapYRQufI+s/s21dl3lZRkpsJLCZ3wz2YMAo=;
 b=n4bJq4tWK6xuF4JQxeG92xN9O0RUislhcphz4RkiKXiVkJuDoX+ctCDsDNUYeq+Trfsk5K5vPkM5Ctm4v9eR97WtCJgENYMOSB07HeqhuLqNd+VFuZ4vs4ddVrHJd7fHbkma2MBeZnsllYvMrTtTIphRI4900dJxduQnFw9yvrYJJimHxvRJd3CNZGV4+vJY0yyNkaNDKEpLSSfQoH7V/hPPDFQR6MRluYFuGZZGNGY5wOYJMY90nsZjL97uJtyEt3gES8NzEcR+PFT1vEZ1c2NNsxclCdoIeBbv10xom7/AHED8wlwwZbBC4MDHMzS6bxLYjt4RHOWq4lRGUV93AA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ERjKQGlapYRQufI+s/s21dl3lZRkpsJLCZ3wz2YMAo=;
 b=XrsQb4Vm+WnVSbdKsA5/jomEDU9YgC5brU4HfcCyDt4mCG+8UUEdUEM+6vbBbCQVvwwlip8VUp64uhgYQ6/olYU9DnNTy3rQJsBU65vqIoFDS1cGIumv3XdWjF719aT43OeDb5d7ooC2EM8gYGpefgnTjwIEs1vmvKBAIAZPcPM=
Received: from DBBPR09CA0042.eurprd09.prod.outlook.com (2603:10a6:10:d4::30)
 by AS8PR08MB8733.eurprd08.prod.outlook.com (2603:10a6:20b:565::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37; Fri, 9 Feb
 2024 15:57:51 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:d4:cafe::fb) by DBBPR09CA0042.outlook.office365.com
 (2603:10a6:10:d4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.43 via Frontend
 Transport; Fri, 9 Feb 2024 15:57:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Fri, 9 Feb 2024 15:57:50 +0000
Received: ("Tessian outbound c87008563c51:v228"); Fri, 09 Feb 2024 15:57:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c0ff832e32c44b30
X-CR-MTA-TID: 64aa7808
Received: from b70522679ce8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8191F3DB-2D67-4154-B9FD-622A0E7CB9D1.1;
	Fri, 09 Feb 2024 15:57:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b70522679ce8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 09 Feb 2024 15:57:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tga7wSX6P0st36cV5DRDULrfPynm9wXKG5c6ZbyvUoOLGjIrRt/fDp37UsdOKRojGsuUHw9JMXcsRLZZX0NN3y0sK1qh9a1xAzlVz0I4b07vg0YNvLhKFo6QLQUIRLxN7ZcWzi2pHB4Ok+jdCtKQZaLMlltHtIUoCzKZkQByzneApJEKz8NeDQE2j/nkXCyGC25uirteNKqJrSNfrvtQdkgdXRf4qaq5P0F+kP0hc+iftm+JCTCKqDqgGoQop9oxhzYJ46SwAIlMCKiblzsJRghV2n3bsHR/Bm0duR7aV1aMObPRLTGkN1F9H0LBjKdrV7LhLsNjN4GyJzJBmS5W+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ERjKQGlapYRQufI+s/s21dl3lZRkpsJLCZ3wz2YMAo=;
 b=nmwDLXv3EnCP4P2MEhftCjJGizfK2LMgA9+Z2Qp2QIX7ewSRZEzfo+BJlTrFqJce+D8CJonF0KfR4t2qb0FZ+RPu8Ys3SPb/dVYST+MEbs0vewGnn2e+5R0KokqhlVgyXKSGcDiu1+kPl328LE1TA7kAiQ0QwnBiN8sCPf4gLPWLPA89xnxRj311gsB1EUDnfz4Xu4wuTiN8PPu2iJMUz7Wicg76ukxkU6X9IdrLCqOGuokGn0LVINnllvTT87aIu9XwPe5v3hJXY3CF/g+8HYvT7ro6lv0+6ZtmMDTKOZ/+LWMxyuEhMV4nt4pHO7OpXc5g4N5fP9B/ZEN6Wxnr6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ERjKQGlapYRQufI+s/s21dl3lZRkpsJLCZ3wz2YMAo=;
 b=XrsQb4Vm+WnVSbdKsA5/jomEDU9YgC5brU4HfcCyDt4mCG+8UUEdUEM+6vbBbCQVvwwlip8VUp64uhgYQ6/olYU9DnNTy3rQJsBU65vqIoFDS1cGIumv3XdWjF719aT43OeDb5d7ooC2EM8gYGpefgnTjwIEs1vmvKBAIAZPcPM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7722.eurprd08.prod.outlook.com (2603:10a6:10:391::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37; Fri, 9 Feb
 2024 15:57:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7270.024; Fri, 9 Feb 2024
 15:57:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "michalwsieron@gmail.com" <michalwsieron@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: raise_sanity_error if /tmp is
 noexec
Thread-Topic: [OE-core] [PATCH] sanity.bbclass: raise_sanity_error if /tmp is
 noexec
Thread-Index: AQHaW2G5Vbj6eVh5jEauzyJ1CS0h4bECKpkA
Date: Fri, 9 Feb 2024 15:57:39 +0000
Message-ID: <94AE8BC1-9AA9-4DFB-B7B6-80CC83897ACD@arm.com>
References: <20240209140939.186588-1-michalwsieron@gmail.com>
In-Reply-To: <20240209140939.186588-1-michalwsieron@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7722:EE_|DU2PEPF0001E9C4:EE_|AS8PR08MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 216fccd0-9314-4280-eb72-08dc2987de5f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 C48X3TgZdvTwIKvUH0q6Lra6Pz6q2Eq0k9KgbVcNYYROPN4/MdMDTS2oX3cRWYI3tToDvmD8Ir9xJKdJpjPT/gSdyNTDVbzrQO1otFu/2D2HnxFySixdlbcRmb+JmMK6figLo2B3EnRpdYWZ6op98BMPZhAxRdaMgYOPs4GD82hl6qKoaOWxC9sSs885vhbV1WEUh1/B2WUCghpLgTdEL+TJ9Vz7L160nKLixT4rN6UqzN/PSRG8Zaci36dPj/lN6Iq24DMakVUBN7SMxR+xm7kr7p6WQC2WUgMZDMe3Mg5W4TtmRWs3p/rvILxY/jFulCIzMH9SJCQLypX74Tsu/DyFDXH8MNC0guG7DRSEQw6EUenFIEDHKSlpOtfAEWo0PmtbIXGELjJHmA+e4Hmv2XfFl04wf9cEM1gr0XNQiYtFsKpjqX8zQ1yCQlEhXQxsmbLMPUm+Pr6osFcWwq70IJ8205C7JEMSeh+dNI6EYOmkkz1d4T2olg2KzJdQLCFjTOhRfd7fhK8WZfWE1NZuFoguwYCCou44Y5owWPckkMcofdCFDzB2Mihu24iDyihd8nubydTTIt6//S5jRaXTcdDsjXT15W1xUuv08TC2xA5NgkXbw4Kq0bhmcKFjBE3B
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(41300700001)(26005)(2616005)(86362001)(4744005)(478600001)(2906002)(76116006)(38070700009)(6486002)(66556008)(64756008)(316002)(6916009)(5660300002)(8676002)(6512007)(8936002)(4326008)(36756003)(66476007)(71200400001)(66446008)(66946007)(53546011)(6506007)(33656002)(122000001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DE46CF2E4867ED499A88A4426B733D0A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7722
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1bd0437f-2e07-4637-cefd-08dc2987d76e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IbD3kPAMeHuIvlR2RgAvTWBRMQ/TJ5ILM0pGiT/WXYm0GI2mid2vV9KeEO+uDKLh/Joww/+Wg+nE80hNpN62OMS1j9Yr7V86VfEqYoujqCZBlivWz6HYJd2voOy92gdskY2Zq/fb49/nZ7PpWfn0J1LdNdeUn0ct1jK61vxPobcr5rYkwmc/sUWO6CVsW1NTYRr4+Se3b0bdruEpxnURF4qEg/JFkvWPkYiA12LRpTzp+uaEvY3Jt2zL7HmM6JGTf51jEQVTVvGFMB1x1dBa8blxzDcJeG8351VIpd6XF30Vbg6+JiQdKwoTxzR1lJgVEQCeRCGpTScayLNvI55uRXIJswpWxQYi2MVxKcLdufJg//gmHdQYNxLTt34n0vDXzHad3YHiATKc9XQd8AMcz03VITgnW4twySXZg/giw+sGEezjlzOA1id7qEMbaAtnSvscqerhytaYiuJsNEOEhuE5Vu6KzTFWuaTMrgxikI/RZmtj6MaFOe++AUhYHxENl/bzXJd/V9Wr/i6zu2kBLKwdXTYCXn6wiSU0JiCAwGVQNJ8W76+y+vjLxFAoxcoe0pEaeFhROcw/BfOqjSQNTsEe8lGt2jLFCQdaS8wtpVw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(82310400011)(64100799003)(1800799012)(186009)(451199024)(46966006)(36840700001)(40470700004)(41300700001)(86362001)(6862004)(4326008)(8676002)(5660300002)(336012)(2616005)(6486002)(478600001)(36756003)(6506007)(33656002)(6512007)(53546011)(70586007)(70206006)(26005)(316002)(2906002)(8936002)(4744005)(356005)(82740400003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 15:57:50.7919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 216fccd0-9314-4280-eb72-08dc2987de5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8733
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 15:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195233

On 9 Feb 2024, at 14:09, Michal Sieron via lists.openembedded.org <michalws=
ieron=3Dgmail.com@lists.openembedded.org> wrote:
> +    # Ensure /tmp is NOT mounted with noexec
> +    with open("/proc/mounts", "r") as f:
> +        for line in f:
> +            # format is described in fstab(5)
> +            _, fs_file, _, fs_mntops, *_ =3D line.split()
> +
> +            # we only want to check /tmp
> +            if fs_file !=3D "/tmp":
> +                continue
> +
> +            # iterate through the options from the end
> +            for opt in reversed(fs_mntops.split(",")):
> +                if opt =3D=3D "noexec":
> +                    raise_sanity_error("/tmp shouldn't be mounted with n=
oexec.", d)
> +

Alternatively, this is neater:

os.statvfs("/tmp").f_flag & os.ST_NOEXEC

Ross=

