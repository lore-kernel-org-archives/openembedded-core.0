Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAF9C28D13
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 12:17:29 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.87])
 by mx.groups.io with SMTP id smtpd.web11.23140.1661429839397908419
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 05:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=MrUFlGAV;
 spf=pass (domain: arm.com, ip: 40.107.21.87, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PMEabCoMq4oq/O+X9u7xJcHyRmCbTzS4y6Lq7PzZVbyAPbAsRWT06gRWnxt8xMkVSScICE8pxwl9PzaWZubRlqBHaCujX0nMi0Dxo9+9r+I6YbEoVGq6w9Dze27WGm8pYsiyvQX21SEDde0Hovz/NYZwlgSipNVIQ2Ca+WpR52nKPxDDvawGQqymoWdSKAj1q9b3Z4DWc2/rYCH7sn28MtaEPLWdz+5DZsBBy8nrmUnYlk9jLFm5c9rppo6hVobTLWhOlIczoWQevOf9zvdn9tfplZJwLOGwGLBlLlK0y4nuDaylvLE63xy+0wJRr7s7ujjqnGBuJuPgMzeU8RgMGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aa7XXRihL1wRNpijDi4w4qVht2oQeTSBIkG9MupkT4c=;
 b=Vy97/Rgiyz0oLH/CpKGD3Ok4wOPcYOAgJNwq85nzj3mv69ug1bDlhIY/tyAHcPV4AJnh0xr4fzBg7dH5jHguFDN1hmV1drylvh4Oi2RhKkPvaJU47e2GiSVL7cw58b+tMrl0dYegR0uo+Bcq30MZXswXu6WbaDxuV82A5t3a57ru2b/EWnOi4RDY2fUSYWbbiFiGsAD+5XcOOhfsSTVotrRXuQk2MuymdNbJcOhp03xnFBNvzzBC6aGH1MXBKzPgPR6lcZlIRw7UAoLowtfTtZVUARX8znZ3GC9aFpQkr25PKQGuwWCrVKbuzO1IxULztCfr7mF94dKT6BhpoLLjOA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aa7XXRihL1wRNpijDi4w4qVht2oQeTSBIkG9MupkT4c=;
 b=MrUFlGAVYyCfD5jGINIlFQyYph7VFId2fPQ7hyBYDJyyNFtGtV1yncCWDRtg84h2zrJUOy50zvFf1tDwxmOKM0eP5X0M+/0Wb6WFoB0/iF7Ba3cYoUDGxulOf5AwUXmeisM6uIN8xGoFITDd9d+aW092YNv8KUZbfQ8KWgKxqOs=
Received: from AS4P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::12)
 by AM8PR08MB6466.eurprd08.prod.outlook.com (2603:10a6:20b:363::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 12:17:15 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5db:cafe::6f) by AS4P189CA0021.outlook.office365.com
 (2603:10a6:20b:5db::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Thu, 25 Aug 2022 12:17:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Thu, 25 Aug 2022 12:17:15 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Thu, 25 Aug 2022 12:17:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b2d419a0ba612398
X-CR-MTA-TID: 64aa7808
Received: from 15b76f17a4b3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 10144B71-9557-439D-8369-BBACC5424B6D.1;
	Thu, 25 Aug 2022 12:17:08 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 15b76f17a4b3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 25 Aug 2022 12:17:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdPSdAl9JQSa1d4GjyziInZ1nTF3Sfp7DCE4fST1zcueUPy1MEy4+JmOJg/A5bG24NwbGC3PukEO+1aqbS13AXfuwLjZq2TfYJYBrOPYTOTFBQNTuiydEkpgcemcI6RR+8R10Xz5YGRsSYM1kA3OzUvyuRHLnmxZzmcCcp9KavgQ5lQ7TuSPUfI+gSK58iDpadjx9BZcTCoVojbBOZIxgdtFs/rqG9si2r/jFEpHJ+Ga00fxV2I2z4zxJUu3E4diLSR9vmvpgA1JFiwAXOZnamIy/Sp9Sxcbn4lcFnJHdd1NhQlKQshVNN2dcmtPTWS0h7bEzHByLlalA0DXvZXZ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aa7XXRihL1wRNpijDi4w4qVht2oQeTSBIkG9MupkT4c=;
 b=aZtRcbN9hWCpykMvg1Nduh9X578Iyx0rHY3y9STKy9s0yRWJykmpra9KwY954gXo60/4bZVcD56pIb20h2GI9hWT8cj7krcVgekdl2OgJZ7Naih8+gAqld0ANHBeKeMuMtGgs8Lx5C27/xevrCZVUF8Jhjfz3VLNo8Q9gbH/D1SMvuIQxNkZTj28Pg5/S9CDux0cR549aZM+ybne+3++Cu24wikcjUGMDfRo8SDesMWm2JeL25kX9bAXohzYIzRBlSwSUV6ti9eM3uTbDZo7lX3JK4xLoa4wASCYUjuNi/HEkFEeEFCeW2oRWXixytAQBwMOYhrJVRsG9+1DkeXRMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aa7XXRihL1wRNpijDi4w4qVht2oQeTSBIkG9MupkT4c=;
 b=MrUFlGAVYyCfD5jGINIlFQyYph7VFId2fPQ7hyBYDJyyNFtGtV1yncCWDRtg84h2zrJUOy50zvFf1tDwxmOKM0eP5X0M+/0Wb6WFoB0/iF7Ba3cYoUDGxulOf5AwUXmeisM6uIN8xGoFITDd9d+aW092YNv8KUZbfQ8KWgKxqOs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB6185.eurprd08.prod.outlook.com (2603:10a6:10:207::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 12:17:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c%9]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 12:17:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCHv2] connman: add PACKAGECONFIG to support iwd
Thread-Topic: [oe-core][PATCHv2] connman: add PACKAGECONFIG to support iwd
Thread-Index: AQHYt7gyU3EZq+KjfkaS2Glnl08vyK2/ib4A
Date: Thu, 25 Aug 2022 12:17:06 +0000
Message-ID: <D7DA9B94-3FFE-4817-9279-3420BB423AC2@arm.com>
References: <20220824125037.4855-1-f_l_k@t-online.de>
In-Reply-To: <20220824125037.4855-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 54374811-eb79-4a0d-73f8-08da8693bf52
x-ms-traffictypediagnostic: 
	DBBPR08MB6185:EE_|VE1EUR03FT005:EE_|AM8PR08MB6466:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 jaRwZZGENCovIGfknRJciIuCnAZi5LmAXKcy2zRtWO1EhRnFxV4B72RrB5kW0oemapgvxNxbKCovnLVn37D9iszpKpIGbUzDOFw+jd5/mM0X90XlypJ5DBvA0wVwxpKPCfmezu0IRGLlaTtKrC3bYFmmNQANwBC1KUBgXcmLyjnVnJeYISzB6Qotnvp2jC4kviMUNUYhczGdzvPXYNNbinccWDPfJwJkVeuNdacCa+qE3iYmtxMHb3p7SgUpnkHadqm5+038DoBbK17dNaP8iUXiYfr0qTthmrr5fY01zcFkYCusO6gwxL3SIpbd/w0W/u1hYLOaMu9+oNvw9EalhkWseeeEVptpSQuMW/UIKMuKqD5y5iw2DZsZ1CUI3rOjcCL/8LckrTzCGEaC715A+7Kqdu+TB4B90D1MQgOk0h+MuiFoc1dmZA/SPJZwRSDLe/71r9TG6tL8PGQrvOCT+sO2sQiwuZr0frwBckPUTeEAjhq7WPXbLYfDxNLKadXxyFNaUyNIOdc2BdCBbVyHwP1D5m0n001q4Pu6ckOLTD4uEu8rl3hZnaJ4bu3paFZCyT2jjNtBabQWasgy66L2M9kq9KXX1kTFfO8yMSfHAzpBWyW1p4JV18LdCN+Cbjkqh2JVJijTCDWP8NI21iqdlF8HCjICJTm+zZa9c/28LWqF6goxjMhfvQxUgXVoMMlpzLohDsiTQzB9nPzqlnB7HErBC/8H8zK+7xe/8hg+2M2mPK3nIqPX0YHEJNpNnIPMN8YYTX18noUYw2Tv9C0d5KcEsblezaurl4AaHBOodEj5n31gY4ntPQLu6/GfaZi4ez01CxxN415z+Wqda+F4b5VtuQIcilSQ3vy0pD7heOAKx8qzQe78kVuCj4UGHygf
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(53546011)(41300700001)(71200400001)(478600001)(2616005)(5660300002)(6512007)(6486002)(26005)(2906002)(186003)(8936002)(316002)(6506007)(6916009)(36756003)(76116006)(33656002)(4326008)(8676002)(66556008)(122000001)(66446008)(966005)(91956017)(86362001)(66476007)(64756008)(66946007)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C5DD9E4FE474744A9404C15B316A168D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6185
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f6058ce2-08cd-4ffa-ccc4-08da8693ba20
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3bRKT9hHpEUrgGQSB72d7msXk4gEIXl400PTsWlNbalPXu/xrnO2zPUwcpT66UbFAJcqxC1Mvvj88Yw37hZvA1iPAiUo42qYmx91fw37kvEu63cB+pY2H9fwRgPmTBCo5Tp9lh8ASA1Q5GCdM2+Vq79LeTBqMiDKL0k+ygewsPigupbHqyDmSaDp/OShnGb5LMcgfBq191fQOlZonerse9YbuAESnSPZTNVo4NDqt2uzhAYTqacAO/EGYb+I2SP/Y2hordbFugeZl3aTFbOjXemTHAcK1hK57091lZluogxrZct4hdvyq8kZlfQ3HAMNCBtAqpgn2014Yx/Pan+AAVJvsV/2RC2DdV7sC7ralDc1J1gl54u/CS3l9dHnyoBVCCbiiDqZMfHoFpwBycrHj1Y5ZSDr+MQOV7Fe4r2aRsXKRVG9j2lEW5cDs0dhK3xUrCJ4P8DqOWwjDq/0tA4dmioTkGrsVIsP7oPyGQSb2tCGwfbUEMqtiObIREBSOhEJdrAqG18RabMiUVpSxdQvo/RVUxqF+T1yz7zLqbffxzRKITcjiTpPrtXiJCPj8iylaraaDDKiggGIvB/UB74HN4/ypTsD74cZco5PPQHgWj1v8R8QgEw1h8i+K2z1u++kG7foVseSUXfMepy0m4D9OHs3TzOeh9QMgDfIc98GPwXRhNKPEQ9R7YfUeczERJN5zWgl1CvjMq+meMYOw+W0/aZVqOPkojxsW8TmfY/QFpbWvLDd+G75JouniGu9qNayLHLLn8TTlBoTXZiJRn/8Gy4FUfbj0gxyIxwCas1dGWY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(346002)(36840700001)(40470700004)(46966006)(41300700001)(5660300002)(8676002)(8936002)(4326008)(316002)(6862004)(33656002)(86362001)(40480700001)(478600001)(6486002)(6512007)(70206006)(966005)(336012)(26005)(36860700001)(47076005)(2616005)(70586007)(186003)(81166007)(356005)(83380400001)(53546011)(82310400005)(6506007)(36756003)(40460700003)(82740400003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 12:17:15.3419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 54374811-eb79-4a0d-73f8-08da8693bf52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6466
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 12:17:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169857

On 24 Aug 2022, at 13:50, Markus Volk via lists.openembedded.org <f_l_k=3Dt=
-online.de@lists.openembedded.org> wrote:
> +# For smooth operation it would be best to start only one wireless daemo=
n at a time.
> +# If wpa_supplicant is running, connman will use it preferentially.
> +# Select either wpa_supplicant or iwd
> +WIRELESS_DAEMON ??=3D "wpa_supplicant"
> PACKAGECONFIG ??=3D "wispr iptables client\
> -                   ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd wif=
i', d)} \
> +                   ${@bb.utils.filter('DISTRO_FEATURES', '3g systemd', d=
)} \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '=
bluez', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'wifi=
 ${WIRELESS_DAEMON}', '', d)} \
> "

This is over-complicating things.  Why is the wifi daemon a special configu=
ration option?  Just have wpa_supplicant in the default PACKAGECONFIG, and =
people who want to use iwd can set PACKAGECONFIG.

> +PACKAGECONFIG[wpa_supplicant] =3D ",,wpa-supplicant,wpa-supplicant"
> +# iwd would be required as a runtime dependency. it is nevertheless give=
n as a recommendation because the recipe for it
> +# is not included in oe-core.
> +PACKAGECONFIG[iwd] =3D "--enable-iwd,--disable-iwd,,,iwd"

This definitely should be RDEPENDS.

Note that if wpa_supplicant and iwd are mutually exclusive, you can express=
 that in the PACKAGECONFIG:

https://docs.yoctoproject.org/ref-manual/variables.html?#term-PACKAGECONFIG

Ross=

