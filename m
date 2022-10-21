Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B107FA373D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 15:30:28 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.62])
 by mx.groups.io with SMTP id smtpd.web11.11222.1666366223766506976
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 08:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HAnJqJdE;
 spf=pass (domain: arm.com, ip: 40.107.249.62, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=K2V70iPeEVeI2oCOivM15nYWb2gV7pncG04H7u6PS8KlB+1vCOnlYnAMYozTd19fdgfnicZjiPkK02s72QyKSInjEEUtT5CNwquFOS42LEgX7rLzJKQMNlKMrf2UxLyO75eDwsfP7EJ6Cmt1K1LeQCY0uk5N399g8hheGsG8MY+UXHigk8B3CuT7rExib3JM4gDGmoFFPRk0IJjfYZ9WCnAWfNoiND616GNDUuQfvkfB3Fdow37+OeX7sDGQ7/JgWFPNaupmWN7NBnlO4jGa0AX3Kw7gkQ6edUW2hq+aWeKfqeKQmWlos6C+dqR4HBXvi3yC1e0ThVjJTr9Eh8eh7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5C2q3DgNa7X/DPS4bUtvG6+JJQBHXr6iPizsP3xuDU=;
 b=IvarUkJB26rlB1tqtkAcK5mmUr2sxnbZwyMHWsFeN4xkKjinnCT8N2NY4xG+f/ajrypybavCzQ4Z8+ExXXjGyQYt9T3DoZMv+tc2PzdFK0/yLnsxT2nPuplIFALxcHjHpcSUg4urtBdoE0Nw/qWNgxvo3cG1BrAC5Fpk5a+R0EY79L3ilCyJ+G+2LlnkGpSCZmtY/ZwTnIlJag6N82mG6rXk9kbUX+q5LnL77MrQcQAqUSsrzPUYtUBi1o+slILUOPoz6rIl535OiFwzJYoecC54WHnb74+jfhRW6DyzmFpiU06NmeumzLWM6zaphIw4hd87LQDCy93B/HrRqwGh9Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5C2q3DgNa7X/DPS4bUtvG6+JJQBHXr6iPizsP3xuDU=;
 b=HAnJqJdE/oAFNsO+bznTaoKK+/kdKhEvSYlUpBB+wRaNrzHV4rGhwlJSCfkCOPVEt98F/KhMibN8ss3aMzWLWm7uyB2qDp7T4E1FPZFVPJqqy1XwDJDWgoCk4UKSNhKaBB36JB7umByzuwbclUr6hCmGykzl/hQDezGGI/U1XXs=
Received: from AM5PR04CA0031.eurprd04.prod.outlook.com (2603:10a6:206:1::44)
 by AS1PR08MB7476.eurprd08.prod.outlook.com (2603:10a6:20b:4dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Fri, 21 Oct
 2022 15:30:19 +0000
Received: from AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::ed) by AM5PR04CA0031.outlook.office365.com
 (2603:10a6:206:1::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Fri, 21 Oct 2022 15:30:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT062.mail.protection.outlook.com (100.127.140.99) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 15:30:19 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130"); Fri, 21 Oct 2022 15:30:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2640e9f9156b7978
X-CR-MTA-TID: 64aa7808
Received: from 5addca75c5d6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AA0036D3-B208-4946-AF0E-68DD90F8D8A7.1;
	Fri, 21 Oct 2022 15:30:12 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5addca75c5d6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Oct 2022 15:30:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPPp/wNWKVGZfAQg8BknGCayR0e3JGD8R71m7Zj/VWNoGGMqL2Rj5e75g6wkHzLUJZZfwIukK2NiqgHp8rAcJ48wiPLv2kNFoGbdxlY0K15qMfhyUFzzK40SKGqBYBuhTE+CeY3CBcsiUIBovN8zCzyCRp0UroBVwdPUpnqToDeioctYvh/yC4iHpRcD1W9sfQO0gkCS51F+H7nh3y3mYJDTk/GxaSGpKjNbzwkUC18lz/+C1z4jaE1FpgSkptg8aOpCj6yOdav2efLRBQVguIw74EGhzqfUg4llOtT8TTJQJ3AM7celGVyOB/cJ9Lkb0WnT8V8XWJ1OXIqrWaly3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5C2q3DgNa7X/DPS4bUtvG6+JJQBHXr6iPizsP3xuDU=;
 b=fkZB1rZAH/CWtnjJremQvvDO1KQNyuR/VorGAVGTtfeQ7hV+135kp2891H0fhjKBQcx7P+RlgGCfi2pSDHtR8LB/aYU/Zq1Ux+Uxf8zCdnE1i4lAuPYrLIZZqJe4j03iCRHJTLJSFIQ3k8N7S+oi4M92HLbU5x+8yZ9IgaVo3pJ7NNg671Zym1RuDsVuh0mZ5NELQMhschI/ejexsrC24F0kboTwBOKP/+uf2tErGeDu4rJyL5ic8MDKtxpsJb6jCYwp85jyZeKrv+yz2dlBVzKFvT2YS0izvVua/4uU5DieMtaiiuz59Oqz8iaCtoayAV/ZiPOkWdZcO8GCzXSsrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5C2q3DgNa7X/DPS4bUtvG6+JJQBHXr6iPizsP3xuDU=;
 b=HAnJqJdE/oAFNsO+bznTaoKK+/kdKhEvSYlUpBB+wRaNrzHV4rGhwlJSCfkCOPVEt98F/KhMibN8ss3aMzWLWm7uyB2qDp7T4E1FPZFVPJqqy1XwDJDWgoCk4UKSNhKaBB36JB7umByzuwbclUr6hCmGykzl/hQDezGGI/U1XXs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7887.eurprd08.prod.outlook.com (2603:10a6:20b:52b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 21 Oct
 2022 15:30:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%7]) with mapi id 15.20.5723.033; Fri, 21 Oct 2022
 15:30:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [master][kirkstone][PATCH] gstreamer1.0-libav: fix
 errors with ffmpeg 5.x
Thread-Topic: [OE-core] [master][kirkstone][PATCH] gstreamer1.0-libav: fix
 errors with ffmpeg 5.x
Thread-Index: AQHY5U9uEkI5UWYn5ky6dvZl5DXvnK4Y+WKA
Date: Fri, 21 Oct 2022 15:30:09 +0000
Message-ID: <EC8F43C9-5C4A-423A-8658-19A108FA0545@arm.com>
References: <20221021131639.94436-1-claus.stovgaard@gmail.com>
In-Reply-To: <20221021131639.94436-1-claus.stovgaard@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB7887:EE_|AM7EUR03FT062:EE_|AS1PR08MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: 6afbc73b-e4a9-455f-1276-08dab3792988
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 yuMLeQE3lExdLskFSDJWnbJYbbDetAF6+x6UgJhtewFs03Y33JPfafdFLfRQlC4fsigRYtfaJlGVEnpGscKJhDNCnxNqWvWubKqrnmTonXAkW3NzqMtwPpYyfljXrBV7EldFQTq6sp3139Hxk5dHUQy/EdgB1YpwQ1SqjZ7z1IElDyuX+3XrsxaK9+HM4uqZLl/0zqZ30+nND9pqlpf1AOlRVrStDuxuM1Ugh9s0lHJUGGA8dlbGzM5EaUYyw0Z0B747Osmuiy3lTqass5i8Z3JB7ycs5jLWDOOcgKQeyr6hwUYbvGN5kIWMkPRyZ9f0Gk11CoRcac/LYUUc5hJ55WBSdcgHJK/fxxyHegagI+8ZnkORoSpT0gK/Z5L28fptt+mUZtF6nA9jUKVexxvFaajAVFxuTq0iGKYhTePepX6MqmxPQlz20TXcqBHbnbAEi3Rls1bQSo2AdXM5DeWqGIPu3TEs+LUyOrm+sX0++AQ3L6EQLRu+YZyJ1NxuYAqF869JyiMKtLXfqSnHR7vMniBRgIuqMps2lG8/zsCHgCLVWfUxKjMj6h/K/S1WdADr73W5QXHAZqj4uakj5XG8aJ5dsR8m0eFjoXeoJgV/DsdSsXxwkAC/9Gps7N/QMOAUwqF3NIlJJOtwVVN2Yq2ppe2zX5J/fLvIlfeqIe6o2NgoDM0Q6ezbgmtO/WYvffOfqOOWpT4QpTBk/ETHkWRPfLIdjXH8XBPWG2K5wPye0vyHo4b1z0dcPVkQ6Aoho71zuJxOoWNSlX/1XxWiCDPqsLuH49PcqXzxSPDaDYmypu5TlyRXelouIiauBhKg/jFrsD8UWUG+kwDENP2A6c3dQg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199015)(36756003)(66899015)(33656002)(2906002)(38070700005)(122000001)(8936002)(2616005)(6486002)(5660300002)(71200400001)(4326008)(83380400001)(186003)(38100700002)(26005)(6506007)(966005)(316002)(53546011)(76116006)(66556008)(66946007)(66446008)(478600001)(66476007)(91956017)(6512007)(86362001)(64756008)(6916009)(8676002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <036917BA3413624DB009069361C16E6E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7887
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	88f40156-bc3e-41dc-8a1a-08dab379238b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HTEVMeGC2Y5mVWsuR2iRzfT0NPJMNeqOBi8hV+NF7eBZ90Y0BURjM0DOoOyNxHRqH0QDa/CPKgfHy1cWKdCBv8MP23V7gjcl8w5WAGiNi6fLTlfYGY4XMEYkv+UcjB9iwc//21hSQqs9UdJ4ONSpRBaOc+p2S5/KdFGkfXiZIQrlmMQJovZ3LPMDrsdyVhPWveD2mwYGvtMKrRZOpnw+HhXzWl13tG0IeysYa3Av6zdwfUFPWo6mQtHRLTEL68HdH7AT1XfCeiAmHqHYBYJefPyCppbdXHMdzmXZo+8uR3bX2vL14MjQotyTA17q4kPlDrV08LVoiKHmlrqhCjQRsBLWAi/vT58YOaIr/5CovnMofEweEIsrzK8cIV4G8dSFcmHGnnl6kQ/sGxLY0trrPHdubrbTzd1Lk4hKoiIe8VLrA0LkFG2VdchQ3pN2UByWv788W1n617mM13V48F+rUNVgQbsWC6x1aA7J48p5MHWi7cazVjIXmUQ5z1l4Y9PF/HSFd+fDLaDupyml4TuDwvCkk2iNpovuPuLSkCff7xr70t+PKTzb0quJzr6slIn3h8ounbh+OMvW3itq/kUvDiZoPWceaCVmpXBKiZ3KDSWwqoVV52i3nvqUVOHwfLge9F9S2aaeLzhB4jcnkgS6iZ1YvRSTwjmI+EulbL1LcTFXog+m+5DcbomlVCeMrIIEnl3yPNnRpxeODlRNtm5hC+4RZiKNgshmdYn9ihHGtWr1Xs7e3WQhxbpZhfxrFsnQcq8y8i29OoWEKvk250Am4+6jUL1rJki20nYbo2rXido=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(36840700001)(46966006)(40470700004)(2906002)(2616005)(40460700003)(186003)(41300700001)(6512007)(47076005)(6506007)(83380400001)(53546011)(36860700001)(40480700001)(5660300002)(336012)(26005)(478600001)(6486002)(966005)(8676002)(8936002)(6862004)(4326008)(70206006)(82310400005)(316002)(70586007)(86362001)(36756003)(33656002)(66899015)(356005)(81166007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:30:19.4763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6afbc73b-e4a9-455f-1276-08dab3792988
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7476
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 15:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172025

The patches need your Signed-off-by: alongside the Upstream-Status.

Thanks,
Ross

> On 21 Oct 2022, at 14:16, Claus Stovgaard via lists.openembedded.org <cla=
us.stovgaard=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> Backport of patch already present upstream to fix issues with invalid
> characters for GLIB when combining gstreamer1.0-libav with ffmpeg 5.x.
>=20
> Remove when gstreamer1.0-libav is upgraded to 1.21.1 or above
>=20
> Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
> ---
> ...r-APNG-encoder-property-registration.patch | 82 +++++++++++++++++++
> .../gstreamer/gstreamer1.0-libav_1.20.3.bb    |  4 +-
> 2 files changed, 85 insertions(+), 1 deletion(-)
> create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0=
001-libav-Fix-for-APNG-encoder-property-registration.patch
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-li=
bav-Fix-for-APNG-encoder-property-registration.patch b/meta/recipes-multime=
dia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-r=
egistration.patch
> new file mode 100644
> index 0000000000..bfb33a19d8
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix=
-for-APNG-encoder-property-registration.patch
> @@ -0,0 +1,82 @@
> +From 78a97c1ec35ada76d83fc67d0549ba56c74d8875 Mon Sep 17 00:00:00 2001
> +From: Seungha Yang <seungha@centricular.com>
> +Date: Thu, 7 Jul 2022 22:16:30 +0900
> +Subject: [PATCH] libav: Fix for APNG encoder property registration
> +
> +The AVClass name of Animated PNG in FFmpeg 5.x is "(A)PNG"
> +and it will be converted to "-a-png" through
> +g_ascii_strdown() and g_strcanon(). But GLib disallow leading '-'
> +character for a GType name. Strip leading '-' to workaround it.
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/2724]
> +---
> + ext/libav/gstavcfg.c | 29 +++++++++++++++++++++++------
> + 1 file changed, 23 insertions(+), 6 deletions(-)
> +
> +diff --git a/ext/libav/gstavcfg.c b/ext/libav/gstavcfg.c
> +index c736920..a8635a7 100644
> +--- a/ext/libav/gstavcfg.c
> ++++ b/ext/libav/gstavcfg.c
> +@@ -91,10 +91,19 @@ register_enum (const AVClass ** obj, const AVOption =
* top_opt)
> +   gchar *lower_obj_name =3D g_ascii_strdown ((*obj)->class_name, -1);
> +   gchar *enum_name =3D g_strdup_printf ("%s-%s", lower_obj_name, top_op=
t->unit);
> +   gboolean none_default =3D TRUE;
> ++  const gchar *enum_name_strip;
> +=20
> +   g_strcanon (enum_name, G_CSET_a_2_z G_CSET_DIGITS, '-');
> +=20
> +-  if ((res =3D g_type_from_name (enum_name)))
> ++  /* strip leading '-'s */
> ++  enum_name_strip =3D enum_name;
> ++  while (enum_name_strip[0] =3D=3D '-')
> ++    enum_name_strip++;
> ++
> ++  if (enum_name_strip[0] =3D=3D '\0')
> ++    goto done;
> ++
> ++  if ((res =3D g_type_from_name (enum_name_strip)))
> +     goto done;
> +=20
> +   while ((opt =3D av_opt_next (obj, opt))) {
> +@@ -150,9 +159,8 @@ register_enum (const AVClass ** obj, const AVOption =
* top_opt)
> +       }
> +     }
> +=20
> +-    res =3D
> +-        g_enum_register_static (enum_name, &g_array_index (values, GEnu=
mValue,
> +-            0));
> ++    res =3D g_enum_register_static (enum_name_strip,
> ++        &g_array_index (values, GEnumValue, 0));
> +=20
> +     gst_type_mark_as_plugin_api (res, 0);
> +   }
> +@@ -177,10 +185,19 @@ register_flags (const AVClass ** obj, const AVOpti=
on * top_opt)
> +   GArray *values =3D g_array_new (TRUE, TRUE, sizeof (GEnumValue));
> +   gchar *lower_obj_name =3D g_ascii_strdown ((*obj)->class_name, -1);
> +   gchar *flags_name =3D g_strdup_printf ("%s-%s", lower_obj_name, top_o=
pt->unit);
> ++  const gchar *flags_name_strip;
> +=20
> +   g_strcanon (flags_name, G_CSET_a_2_z G_CSET_DIGITS, '-');
> +=20
> +-  if ((res =3D g_type_from_name (flags_name)))
> ++  /* strip leading '-'s */
> ++  flags_name_strip =3D flags_name;
> ++  while (flags_name_strip[0] =3D=3D '-')
> ++    flags_name_strip++;
> ++
> ++  if (flags_name_strip[0] =3D=3D '\0')
> ++    goto done;
> ++
> ++  if ((res =3D g_type_from_name (flags_name_strip)))
> +     goto done;
> +=20
> +   while ((opt =3D av_opt_next (obj, opt))) {
> +@@ -211,7 +228,7 @@ register_flags (const AVClass ** obj, const AVOption=
 * top_opt)
> +     g_array_sort (values, (GCompareFunc) cmp_flags_value);
> +=20
> +     res =3D
> +-        g_flags_register_static (flags_name, &g_array_index (values,
> ++        g_flags_register_static (flags_name_strip, &g_array_index (valu=
es,
> +             GFlagsValue, 0));
> +=20
> +     gst_type_mark_as_plugin_api (res, 0);
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.=
bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
> index e8da49af99..7a2c0d1365 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
> @@ -11,7 +11,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69333daa044c=
b77e486cc36129f7a770 \
>                     file://ext/libav/gstav.h;beginline=3D1;endline=3D18;m=
d5=3Da752c35267d8276fd9ca3db6994fca9c \
>                     "
>=20
> -SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-$=
{PV}.tar.xz"
> +SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-$=
{PV}.tar.xz \
> +           file://0001-libav-Fix-for-APNG-encoder-property-registration.=
patch \
> +           "
> SRC_URI[sha256sum] =3D "3fedd10560fcdfaa1b6462cbf79a38c4e7b57d7f390359393=
fc0cef6dbf27dfe"
>=20
> S =3D "${WORKDIR}/gst-libav-${PV}"
> --=20
> 2.25.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172015): https://lists.openembedded.org/g/openembedde=
d-core/message/172015
> Mute This Topic: https://lists.openembedded.org/mt/94475275/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


