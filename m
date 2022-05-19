Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B381C433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 12:48:39 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.45])
 by mx.groups.io with SMTP id smtpd.web09.7015.1652964509605155007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 05:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=bCx2qhqu;
 spf=pass (domain: arm.com, ip: 40.107.21.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=E89GUOl5iB4DkwVtTGUzoIqSVWBFP/hrGHUqpGu3hpQgsO9WXfeaHAkNI3KvEWE8lD7/UxRp1KuHix5pfzE47IF/W1XNaIXkynb9D7IRjNJtbFYtFtToqR3+J67RIY7yU8fjbxieyvlDZ1fLvGjlX9QdOvN0cQMGU0shpbl8NpaBG5M3NYP2+mhQJptEycCH34JG2cHh3BJHN18kUBPsj/RnfapKeHzRZyqE7ZaKYXAXsG+twqHjuFIANhwMzmRz4pqZtH77R8QeyFQI3RIOvL0wntRx83EmiKsH5uhaDMP9WPxN2FDzgzTaSxLA1T5+8IXnBhrn/EehuVoyC1dP2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYMHUu8Vm29JJwz1qfPjpNgPrRslbUNQ4GVgbA4OVPY=;
 b=fzpzE+iUI7pjzlPgY3cC/hZeTcY0WMVoSM8xfmkEfyLhJ9FpLLgQoold2bWJJkz7LGe3ZxMTt2PnVFTEZDD9gMTci6+rpy6AX/KuPBDrJKQSa72KLkirTNQAWrqBOrMAHuEFH/7i92haAOJv89ngUSSB28Ur+7AkAd6Y1f+OR67v8Tz/Bqbmt5NbGMUTZDkbp7r3/g9LIrUdypX7HE5KeztVBGosBGMMrvdL+wkd/kgc3JYa7ylHUNq1Ao/OYRcN+K/eYaGXOj+CXXBfl7kNwok4R7J4v0Azh0gL5MJEJYoZ7pJSGU5wOBlENHAf91Gio5qvE2i0nXDXCfVXFtYTUQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYMHUu8Vm29JJwz1qfPjpNgPrRslbUNQ4GVgbA4OVPY=;
 b=bCx2qhqupnhYVnu47Ul+5OYnf0O6vhkqpVbGjhzwAmgaRx/cGOLCZgyEHj47NApo010UKqWCNp6IccmBecOebt91/OJbIn5yXfjS3kBdmw+32NbRTcLs+vaMKHNb91cukWgmEGEwBKRFD6RB5bmF4bcWhoyUnNTwxx8i0S+M7hQ=
Received: from DB9PR05CA0007.eurprd05.prod.outlook.com (2603:10a6:10:1da::12)
 by AM6PR08MB3925.eurprd08.prod.outlook.com (2603:10a6:20b:a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 19 May
 2022 12:48:25 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::6a) by DB9PR05CA0007.outlook.office365.com
 (2603:10a6:10:1da::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15 via Frontend
 Transport; Thu, 19 May 2022 12:48:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Thu, 19 May 2022 12:48:24 +0000
Received: ("Tessian outbound 6580ae46f51e:v119");
 Thu, 19 May 2022 12:48:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: de28538fe4c85a33
X-CR-MTA-TID: 64aa7808
Received: from 76eff9ccb737.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3A982577-0CE0-4876-880F-20C4979B2516.1;
	Thu, 19 May 2022 12:48:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 76eff9ccb737.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 19 May 2022 12:48:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4r/jPc9cUKcm0bflPmkW0JKmLWJ3uN29qTrYMQfkkr6KpHXTxl0wvXo4OzIJ+DLHk82iY/BVfRNFFpOiZoI0A8qfc3siCBgVC2EBXz4xKnW734kk5vzMNJxcsrRU5K+t6EyjfsA8lUWLMUF1U/EbCP0xmTIjSo5LsmHB7WAveO0eaD16DWLC/jGGehlg99ZPKZNKEht6Rutqq/G+aBrV1Nlgu7p8179tf7kSN41dFpK/eVo9i41Uyi+Wac6Om8swmRDJwNVGvz5mDKwsAlkMuP0qQFynZXi4oUMzYyHkwWqiK6yVFYI7rw5P74VGlNFMjVN9QtBh8Np2q1RBM/xqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYMHUu8Vm29JJwz1qfPjpNgPrRslbUNQ4GVgbA4OVPY=;
 b=Dxup3jLFuDA1WDYjY1ZxocQ2DWXVMBFcQo/sJG5yH5bEHJyWogXpjwrB6rgbHzsuC47ienNvnW5py4TWIii8AZrwo9neIGcXo/8/OFgB01XNv7oLCfmRL5TKN/LWGHELhoPKygz60EgEjO1ybYlDg7UgB4xI3VUZiMRTLn0bzts1vlr+pFHAB771fn+2sREvjCHt9BbrJvQEjPzqwoWPC5EXc9Hc+KwHuUOCi809a8YZ89jN3JKHLDN/CXPNioegnhtyaRXsENb23iF764LPi5HUe9RHO+9WEfLqPxhNiWLxpdUdVsWOyfxKYR3xrKOrNMLGjXJkEXIE1yg4pMlMsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYMHUu8Vm29JJwz1qfPjpNgPrRslbUNQ4GVgbA4OVPY=;
 b=bCx2qhqupnhYVnu47Ul+5OYnf0O6vhkqpVbGjhzwAmgaRx/cGOLCZgyEHj47NApo010UKqWCNp6IccmBecOebt91/OJbIn5yXfjS3kBdmw+32NbRTcLs+vaMKHNb91cukWgmEGEwBKRFD6RB5bmF4bcWhoyUnNTwxx8i0S+M7hQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB8079.eurprd08.prod.outlook.com (2603:10a6:10:385::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Thu, 19 May
 2022 12:48:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d%9]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 12:48:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	swat <swat@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
Subject: Re: Investigating a hung job on the autobuilder - a HOWTO
Thread-Topic: Investigating a hung job on the autobuilder - a HOWTO
Thread-Index: AQHYa34Iz0y1f+N7y0OGADzM6wv5QK0mJaJM
Date: Thu, 19 May 2022 12:48:15 +0000
Message-ID: 
 <PA4PR08MB74119DD966F3B18569BE2994E8D09@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: 
 <c0af13a185147f7296122e016a349d3089bcc71b.camel@linuxfoundation.org>
In-Reply-To: 
 <c0af13a185147f7296122e016a349d3089bcc71b.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1f10ee57-2447-4352-c290-08da3995dd1c
x-ms-traffictypediagnostic: 
	DB4PR08MB8079:EE_|DBAEUR03FT028:EE_|AM6PR08MB3925:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB39252DAC8FB18EDEF60C1B88E8D09@AM6PR08MB3925.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6eTy1CAxzvEiNEClZLOAB5TXxZ/qyDxAT17BNVLT+CsTfzyB6VtBilyfzDA+Xm4zxJp94v9N7DjpXfM7Fbyk7nkPooIzcVmGxAZcJft4Sf+ZkCuFT15JdaXcP3F9nwZZMJVf6N3xv//bhwaKD70i2Na0ZyyvZtFHZCEQ7gCqIQSTr8Laj90/D35U7L2NLRJ8kZ4MXPi/jNO1sjMPyHitZ2ZSyPvFj8YpDDe98/e9I3XPUbM9+wM/niGrzlnk23CllYI9njiQplwEuOqKX1PlNcke/opTtrDHGNgjybQR20jJTp4EAxrY7ZVFPvaE/hvzNW/+oVniAEBXahioueCTqBmdmwFnuVw8+QMiF4ocswMSw34nJZ/kb0qKD8ML8MOHwWPtYCC7FK0uY18QNxeMiuPd97S9s4nsv+H5ASzZLXrfAors3N0642bApjE26EJs2I9db3jmky5a8Y1FAMlH8j5guqQ0dDyR5CO/E9U2HIxJx8/yCG1zS8zeWt9tGXwOnhS9f/L3CXmRSbCfXXCrOkAUPciHKmp0ez74JhfS8grbvsPC3cYxZOpbbRLHVVuP7RovWmTvM1GKkTp1SY4vQNUnh0VBHgtPnTzrvTlgi/L5kHA3+8HxhV2C774iapP1DV8UdDqHtD7ADRLC63/sIUDO0qL3Ys2DwcbImXY2UtlYbQH9SZ8cD2jAcCEV5n3o3SGULCioThN454JmobiiRueFxTteHBK3UKmp2V2wC2ANVYwD/h+9cp6rvvWTDLNQQRcP7Tb47AiMUFg8drotnh7ngUY5bI9+j9ShFnDZ6SA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(8676002)(86362001)(66556008)(4326008)(71200400001)(2906002)(55016003)(66446008)(966005)(5660300002)(66476007)(7696005)(6506007)(53546011)(8936002)(122000001)(186003)(66946007)(83380400001)(76116006)(9686003)(33656002)(54906003)(91956017)(110136005)(38100700002)(30864003)(316002)(38070700005)(26005)(52536014)(166002)(64756008)(579004);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB74119DD966F3B18569BE2994E8D09PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8079
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4f02c322-4d4c-43eb-c632-08da3995d757
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QUykp9Y+2AtMRWhb0nNMBmOydTKND7gkwQrClMJ8AWFSOu8wsZekdhGPYjsBNxNiC+hcKoLGI9GqnsPH01ApQaBa31mfckx7oeedJFpx8fTEgcak5JkbNSfRQAMwRp6I0pEII9LxVpe9I/3c34Na3auB6z5o/Bj/pcMdSq2UzsUMNJQ3OBHIefTTwffwM0D2jr/HC+7QUj4q6sRqkQRsVXg9pzsr+jUJ+GgiX55ceZSEMtFpssT7v0i2kkomdbMLOKh6PqgpOqzoUQr/Zm4+JEvDEmKAVJF/gCKG5y0pK72WpbMoM39XLNwQEwV3g97C+BPC/u3n+xF2PW7bSpWFuQ8+xBDYvPVLxjLM3kRxncHwrylY3BpJHhqqsu1Vf7QjucLyLJ1xjsFBewop39q7akD105gjTXYJWHfWDsYRwIo5OZMHVx4d/7I1a1e2UET58f4+i1miwEdIgPro5G9aiWHiBVSKt2drHSv3nAF7qi3fq8Mxik/T95pHAc3Hv/00rhK1EY6SaJ1GFPkJDUhfByOedkeDHsPNDRkNnIILlOLsaFWcvo1LBeFRL//zMDoZKcZfPKyIFkjYCxcu75+kLt/Vqabc8IVry9MUGlmuNeq87Ab9xZsfMO3U63Y4oN06j+jLvQW1EGUxBnRCoB9FsuAxy/a5PKlAj1qE7TKIkSfFMsiHBnWm0bGcFd+nWsp4I98Y/l3Apex/Hcw/m5EX90kvY8goyS7yok9od7wHYSnaxlABvyU0VuDIScWWYM8T
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(86362001)(55016003)(110136005)(36860700001)(70206006)(8676002)(26005)(33656002)(70586007)(5660300002)(30864003)(8936002)(508600001)(53546011)(52536014)(4326008)(81166007)(2906002)(966005)(7696005)(356005)(54906003)(336012)(186003)(6506007)(40460700003)(316002)(107886003)(166002)(47076005)(82310400005)(83380400001)(9686003)(579004)(559001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 12:48:24.8906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1f10ee57-2447-4352-c290-08da3995dd1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3925
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 12:48:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165886

--_000_PA4PR08MB74119DD966F3B18569BE2994E8D09PA4PR08MB7411eurp_
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

A little script I have locally which is useful for finding bitbake instance=
s:

for PID in $(pgrep '^Cooker$'); do
                pstree -p -l $PID
                echo
done

Output from a build I just fired:

Cooker(2380890)=80=88=80Cooker(2380899)
                =84=80Worker(2381485)=80=88=80Worker(2402174)
                                  =86=80attr:patch(2401804)=80=80=80sh(2402=
170)
                                  =86=80bash-completion(2401738)
                                  =86=80bzip2:patch(2401753)
                                  =86=80cracklib:patch(2401737)
                                  =86=80curl-native:unp(2401716)=80=80=80sh=
(2401909)=80=88=80tar(2401930)
                                  =81                                      =
  =84=80xz(2401929)
                                  =86=80cve-update-db-n(2390133)
                                  =86=80edk2-firmware:u(2401360)
                                  =86=80flex:patch(2401736)
                                  =86=80gcc-source-12.1(2401703)=80=80=80sh=
(2401764)=80=88=80tar(2401778)
                                  =81                                      =
  =84=80xz(2401777)
                                  =86=80glib-2.0-native(2401763)=80=80=80sh=
(2402164)
                                  =86=80glibc:patch(2401705)=80=80=80sh(240=
2159)=80=80=80quilt(2402175)
                                  =86=80gnutls-native:u(2401717)=80=80=80sh=
(2401938)=80=88=80tar(2402023)
                                  =81                                      =
  =84=80xz(2402020)
                                  =86=80initscripts:pat(2401783)=80=80=80sh=
(2402167)
                                  =86=80libcap-ng:patch(2401757)=80=80=80sh=
(2402173)
                                  =86=80libffi:patch(2401755)=80=80=80sh(24=
02160)=80=80=80xargs(2402177)=80=80=80sed(2402181)
                                  =86=80libpam:unpack(2401745)
                                  =86=80libtirpc:patch(2401750)
                                  =86=80libtool-cross:p(2401719)
                                  =86=80libxcrypt:patch(2401725)
                                  =86=80libxml2-native:(2401734)
                                  =86=80linux-libc-head(2401701)=80=80=80sh=
(2401818)=80=88=80tar(2401824)
                                  =81                                      =
  =84=80xz(2401823)
                                  =86=80linux-yocto:ker(2400552)=80=80=80ru=
n.do_kernel_c(2400801)
                                  =86=80lz4-native:comp(2400716)=80=80=80ru=
n.do_compile.(2400804)=80=80=80make(2400842)=80=80=80make(2400866)=80=80=80=
gcc-10(2400925)=80=88=80as(2401679)
                                  =81                                      =
                                                                 =84=80cc1(=
2401678)
                                  =86=80ncurses:patch(2401729)=80=80=80sh(2=
402156)=80=80=80quilt(2402178)
                                  =86=80openssl:patch(2401816)
                                  =86=80opkg-utils:patc(2401721)
                                  =86=80python3-native:(2401712)=80=80=80sh=
(2402155)=80=88=80tar(2402180)
                                  =81                                      =
  =84=80xz(2402179)
                                  =86=80update-rc.d:pat(2401914)
                                  =86=80util-linux-libu(2401747)
                                  =86=80xz:patch(2401774)=80=80=80sh(240216=
5)
                                  =86=80zlib:unpack(2401723)
                                  =84=80{Worker}(2381486)

Ross

From: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.or=
g>
Date: Thursday, 19 May 2022 at 13:43
To: swat <swat@lists.yoctoproject.org>, openembedded-core <openembedded-cor=
e@lists.openembedded.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Alexandre Belloni <alexandre=
.belloni@bootlin.com>, Ross Burton <Ross.Burton@arm.com>
Subject: Investigating a hung job on the autobuilder - a HOWTO
Investigating a hung job on the autobuilder

We've yet another hung job on the autobuilder. I thought I'd write down
what I did to investigate it so others can learn how to do it and so I
can remember next time I need to do it too.

The problem was this job:

https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/4563

qemuarm64-armhost running on an aarch64 worker, hung in do_testsdkext
for core-image-minimal. To get further you need ssh access. We do give
out ssh access to people who need it.

ssh to ubuntu1804-arm-1.yocto.io and then "sudo -iu pokybuild" lets us
have a look at what is going on. Easy first step is:

$ ps ax | grep armhost
28429 ?        S      0:00 python3 /home/pokybuild/yocto-worker/qemuarm64-a=
rmhost/yocto-autobuilder-helper/scripts/run-config qemuarm64-armhost /home/=
pokybuild/yocto-worker/qemuarm64-armhost/build/build lucaceresoli/master-ne=
xt ssh://git@push.yoctoproject.org/poky-contrib --sstateprefix  --buildapps=
rcrev  --publish-dir  --build-type full --workername ubuntu1804-arm-1 --bui=
ld-url https://autobuilder.yoctoproject.org/typhoon/#builders/97/builds/456=
3 --results-dir /srv/autobuilder/autobuilder.yocto.io/pub/non-release/20220=
517-8/testresults --quietlogging --stepname test-targets --phase 2
28430 ?        S      0:00 /bin/sh -c . ./oe-init-build-env; /home/pokybuil=
d/yocto-worker/qemuarm64-armhost/yocto-autobuilder-helper/scripts/checkvnc;=
 DISPLAY=3D:1 bitbake core-image-minimal:do_testimage core-image-sato:do_te=
stimage core-image-sato-sdk:do_testimage core-image-sato:do_testsdk  core-i=
mage-minimal:do_testsdkext core-image-sato:do_testsdkext -k
28460 ?        Sl     0:32 python3 /home/pokybuild/yocto-worker/qemuarm64-a=
rmhost/build/bitbake/bin/bitbake core-image-minimal:do_testimage core-image=
-sato:do_testimage core-image-sato-sdk:do_testimage core-image-sato:do_test=
sdk core-image-minimal:do_testsdkext core-image-sato:do_testsdkext -k
28462 ?        Sl     6:43 bitbake-server /home/pokybuild/yocto-worker/qemu=
arm64-armhost/build/bitbake/bin/bitbake-server decafbad 3 5 /home/pokybuild=
/yocto-worker/qemuarm64-armhost/build/build/bitbake-cookerdaemon.log /home/=
pokybuild/yocto-worker/qemuarm64-armhost/build/build/bitbake.lock /home/pok=
ybuild/yocto-worker/qemuarm64-armhost/build/build/bitbake.sock 0 None 0
28504 ?        Sl     0:17 python3 /home/pokybuild/yocto-worker/qemuarm64-a=
rmhost/build/bitbake/bin/bitbake-worker decafbad
28515 ?        SNs    0:00 python3 /home/pokybuild/yocto-worker/qemuarm64-a=
rmhost/build/bitbake/bin/bitbake-worker decafbad
29659 pts/1    S+     0:00 grep armhost
38713 ?        SN     0:00 /bin/sh -c . /home/pokybuild/yocto-worker/qemuar=
m64-armhost/build/build/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.=
0-r0/testsdkext/environment-setup-cortexa57-poky-linux > /dev/null; devtool=
 sdk-install meta-extsdk-toolchain
38719 ?        SN     0:01 /home/pokybuild/yocto-worker/qemuarm64-armhost/b=
uild/build/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdke=
xt/buildtools/sysroots/aarch64-pokysdk-linux/usr/bin/python3 /home/pokybuil=
d/yocto-worker/qemuarm64-armhost/build/build/tmp/work/qemuarm64-poky-linux/=
core-image-minimal/1.0-r0/testsdkext/sysroots/aarch64-pokysdk-linux/usr/bin=
/devtool sdk-install meta-extsdk-toolchain

i.e. looking for processes that are running in that build directory.

The relevant part of the process tree from "ps axjf":

 PPID   PID  PGID   SID TTY      TPGID STAT   UID   TIME COMMAND
    1  3501  3500  3500 ?           -1 Sl    6000   2:29 /usr/bin/python3 /=
usr/local/bin/buildbot-worker start /home/pokybuild/yocto-worker/
 3501 28429 28429  3500 ?           -1 S     6000   0:00  \_ python3 /home/=
pokybuild/yocto-worker/qemuarm64-armhost/yocto-autobuilder-helper/scripts/
28429 28430 28429  3500 ?           -1 S     6000   0:00      \_ /bin/sh -c=
 . ./oe-init-build-env; /home/pokybuild/yocto-worker/qemuarm64-armhost/yoc
28430 28460 28429  3500 ?           -1 Sl    6000   0:32          \_ python=
3 /home/pokybuild/yocto-worker/qemuarm64-armhost/build/bitbake/bin/bitbake
    1 28462 28461 28461 ?           -1 Sl    6000   6:43 bitbake-server /ho=
me/pokybuild/yocto-worker/qemuarm64-armhost/build/bitbake/bin/bitbake-serv
28462 28504 28461 28461 ?           -1 Sl    6000   0:17  \_ python3 /home/=
pokybuild/yocto-worker/qemuarm64-armhost/build/bitbake/bin/bitbake-worker
28504 28515 28515 28515 ?           -1 SNs   6000   0:00      \_ python3 /h=
ome/pokybuild/yocto-worker/qemuarm64-armhost/build/bitbake/bin/bitbake-wor
28515 38713 28515 28515 ?           -1 SN    6000   0:00          \_ /bin/s=
h -c . /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work
38713 38719 28515 28515 ?           -1 SN    6000   0:01              \_ /h=
ome/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work/qemuarm6

so the hung process is 38719.

I did have a look at the log files in the build directory but in this
case I didn't find anything. The bitbake-cookerdaemon.log in particular
can sometimes help. I had a look at the open files for the process:

$ ls /proc/38719/fd -la
total 0
dr-x------ 2 pokybuild pokybuild  0 May 19 12:08 .
dr-xr-xr-x 9 pokybuild pokybuild  0 May 19 11:59 ..
lr-x------ 1 pokybuild pokybuild 64 May 19 12:08 0 -> /dev/null
l-wx------ 1 pokybuild pokybuild 64 May 19 12:08 1 -> 'pipe:[122175861]'
l-wx------ 1 pokybuild pokybuild 64 May 19 12:08 2 -> 'pipe:[122175861]'
lr-x------ 1 pokybuild pokybuild 64 May 19 12:08 4 -> 'pipe:[122140435]'

but nothing interesting there.

I couldn't use strace as the permissions weren't setup for that without
root. We don't normally give out that access but to debug this I went
ahead and looked with strace:

strace -p 38719
strace: Process 38719 attached
futex(0xffff9c2da2bc, FUTEX_WAIT_BITSET_PRIVATE|FUTEX_CLOCK_REALTIME, 0, NU=
LL, 0xffffffff

so it is stuck in a futex. I then went ahead and tried gdb:

gdb -p 38719

BFD: warning: /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tm=
p/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools=
/sysroots/aarch64-pokysdk-linux/usr/bin/python3.10.real: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
BFD: warning: /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tm=
p/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools=
/sysroots/aarch64-pokysdk-linux/lib/libc.so.6: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
Reading symbols from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/b=
uild/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/bui=
ldtools/sysroots/aarch64-pokysdk-linux/lib/libc.so.6...(no debugging symbol=
s found)...done.

(gdb) bt
Python Exception <class 'gdb.error'> Call Frame Instruction op 45 in vendor=
 extension space is not handled on this architecture.:
#0  0x0000ffff9bd1e16c in ?? ()
   from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work=
/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools/sysro=
ots/aarch64-pokysdk-linux/lib/libc.so.6
Call Frame Instruction op 45 in vendor extension space is not handled on th=
is architecture.

I've abbreviated the initial output. We can see that it is using python
3.10 from within builtdools tarball within an eSDK and we have no debug
symbols. The lack of a backtrace was worrying, after consulting some
ARM experts it was concluded the version of gdb was too old for the
newer glibc in buildtools.

After much thinking, I decided to enable and build a gdb-native. I did
something horrible and moved the lock and sock files out the way and
then a "bitbake gdb-native" in the same build directory. We don't have
a gdb-native recipe however adding a BBCLASSEXTEND =3D "native", a
PACKAGECONFIG to enable python in the native case and disable LLTNGUST
for native. A "bitbake gdb-native -c addto_recipe_sysroot" made it
available in the gdb-native WORKDIR where I could then run it from:

/home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work/aarch64=
-linux/gdb-native/12.1-r0/recipe-sysroot-native/usr/bin/gdb -p 3871

I did try using gdb-cross-aarch64 but that wouldn't attach to local
processes.

Sadly there were no symbols so the backtrace output was still not
useful other than seeing we were in some libpthread function
(unsurprisingly). I realised I could go into the python3-nativesdk
workdir, find the nativesdk-python3-dbg package (I used the deb) and
then copy the .debug files from that into the
testsdkext/buildtools/sysroots/aarch64-pokysdk-linux/usr/lib/ directory
for the python libs.

With that, I got some more interesting output:

(gdb) bt
#0  0x0000ffff9bd1e16c in ?? ()
   from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work=
/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools/sysro=
ots/aarch64-pokysdk-linux/lib/libc.so.6
#1  0x0000ffff9bd20d88 in pthread_cond_wait ()
   from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work=
/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools/sysro=
ots/aarch64-pokysdk-linux/lib/libc.so.6
#2  0x0000ffff9c0db3a8 in drop_gil (ceval=3Dceval@entry=3D0xffff9c2da208 <_=
PyRuntime+344>, ceval2=3Dceval2@entry=3D0xaaab09af3f20,
    tstate=3Dtstate@entry=3D0xaaab09ab9ba0) at ../Python-3.10.4/Python/ceva=
l_gil.h:182
#3  0x0000ffff9bfc8708 in eval_frame_handle_pending (tstate=3D0xaaab09ab9ba=
0) at ../Python-3.10.4/Python/ceval.c:1185
#4  _PyEval_EvalFrameDefault (tstate=3D0xaaab09ab9ba0, f=3D0xffff9445edd0, =
throwflag=3D<optimized out>) at ../Python-3.10.4/Python/ceval.c:1775
#5  0x0000ffff9c0de0a8 in _PyEval_EvalFrame (throwflag=3D0, f=3D0xffff9445e=
dd0, tstate=3D0xaaab09ab9ba0)
    at ../Python-3.10.4/Include/internal/pycore_ceval.h:46
#6  _PyEval_Vector (tstate=3D0xaaab09ab9ba0, con=3D0xffff95a20050, locals=
=3D<optimized out>, args=3D<optimized out>, argcount=3D<optimized out>,
    kwnames=3D<optimized out>) at ../Python-3.10.4/Python/ceval.c:5065
#7  0x0000ffff9c13a35c in _PyObject_VectorcallTstate (nargsf=3D922337203685=
4775809, kwnames=3D0x0, args=3D0xffffd3ebd780, callable=3D0xffff95a20040,
    tstate=3D0xaaab09ab9ba0) at ../Python-3.10.4/Include/cpython/abstract.h=
:114
#8  PyObject_CallOneArg (arg=3D0xffff95ac8130, func=3D0xffff95a20040) at ..=
/Python-3.10.4/Include/cpython/abstract.h:184
#9  handle_weakrefs (old=3D0xaaab09af4190, unreachable=3D0xffffd3ebd748) at=
 ../Python-3.10.4/Modules/gcmodule.c:887
#10 gc_collect_main (tstate=3Dtstate@entry=3D0xaaab09ab9ba0, generation=3Dg=
eneration@entry=3D2, n_collected=3Dn_collected@entry=3D0xffffd3ebd800,
    n_uncollectable=3Dn_uncollectable@entry=3D0xffffd3ebd808, nofail=3Dnofa=
il@entry=3D0) at ../Python-3.10.4/Modules/gcmodule.c:1281
#11 0x0000ffff9c13abfc in gc_collect_with_callback (tstate=3Dtstate@entry=
=3D0xaaab09ab9ba0, generation=3Dgeneration@entry=3D2)
    at ../Python-3.10.4/Modules/gcmodule.c:1413
#12 0x0000ffff9c13b1e4 in PyGC_Collect () at ../Python-3.10.4/Modules/gcmod=
ule.c:2099
#13 0x0000ffff9c117538 in Py_FinalizeEx () at ../Python-3.10.4/Python/pylif=
ecycle.c:1781
#14 Py_FinalizeEx () at ../Python-3.10.4/Python/pylifecycle.c:1703
#15 0x0000ffff9c1181e8 in Py_Exit (sts=3D0) at ../Python-3.10.4/Python/pyli=
fecycle.c:2858
#16 0x0000ffff9c11cbc0 in handle_system_exit () at ../Python-3.10.4/Python/=
pythonrun.c:775
#17 _PyErr_PrintEx (tstate=3D0xaaab09ab9ba0, set_sys_last_vars=3Dset_sys_la=
st_vars@entry=3D1) at ../Python-3.10.4/Python/pythonrun.c:785
#18 0x0000ffff9c11cbfc in PyErr_PrintEx (set_sys_last_vars=3Dset_sys_last_v=
ars@entry=3D1) at ../Python-3.10.4/Python/pythonrun.c:880
#19 0x0000ffff9c11cc0c in PyErr_Print () at ../Python-3.10.4/Python/pythonr=
un.c:886
#20 0x0000ffff9c11d280 in _PyRun_SimpleFileObject (fp=3Dfp@entry=3D0xaaab09=
ab2540, filename=3Dfilename@entry=3D0xffff95cbe6b0, closeit=3Dcloseit@entry=
=3D1,
    flags=3Dflags@entry=3D0xffffd3ebda48) at ../Python-3.10.4/Python/python=
run.c:462
#21 0x0000ffff9c11d50c in _PyRun_AnyFileObject (fp=3Dfp@entry=3D0xaaab09ab2=
540, filename=3Dfilename@entry=3D0xffff95cbe6b0, closeit=3Dcloseit@entry=3D=
1,
    flags=3Dflags@entry=3D0xffffd3ebda48) at ../Python-3.10.4/Python/python=
run.c:90
#22 0x0000ffff9c1389c0 in pymain_run_file_obj (skip_source_first_line=3D0, =
filename=3D0xffff95cbe6b0, program_name=3D0xffff95dce3d0)
    at ../Python-3.10.4/Modules/main.c:353
#23 pymain_run_file (config=3D0xaaab09af4290) at ../Python-3.10.4/Modules/m=
ain.c:372
#24 pymain_run_python (exitcode=3D0xffffd3ebda44) at ../Python-3.10.4/Modul=
es/main.c:587
#25 Py_RunMain () at ../Python-3.10.4/Modules/main.c:666
#26 0x0000ffff9c138e6c in pymain_main (args=3D0xffffd3ebdb20) at ../Python-=
3.10.4/Modules/main.c:696
#27 Py_BytesMain (argc=3D<optimized out>, argv=3D<optimized out>) at ../Pyt=
hon-3.10.4/Modules/main.c:720
#28 0x0000ffff9bccb234 in ?? ()
   from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work=
/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools/sysro=
ots/aarch64-pokysdk-linux/lib/libc.so.6
#29 0x0000ffff9bccb30c in __libc_start_main ()
   from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work=
/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools/sysro=
ots/aarch64-pokysdk-linux/lib/libc.so.6
#30 0x0000aaaaca8cd9b0 in _start ()

I did try "py-bt" but that wasn't present. This can be fixed by
ensuring the source for python3-native is present ("bitbake python3-
native -c patch"), then

source build/tmp/work/aarch64-linux/python3-native/3.10.4-r0/Python-3.10.4/=
Tools/gdb/libpython.py

within gdb will add the python extensions. We can then get:

(gdb) py-bt
Traceback (most recent call first):
  File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work=
/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools/sysro=
ots/aarch64-pokysdk-linux/usr/lib/python3.10/_weakrefset.py", line 39, in _=
remove
    def _remove(item, selfref=3Dref(self)):
  Garbage-collecting

i.e. it is in python garbage collection. This probably means a
multiprocessing.Lock() or threading.Lock() was left in the locked state
by some other process/thread which exited and this has hung the build.

I still haven't worked out how to know *which* lock this is or how to
debug any further but I was quite pleased to even be able to debug this
to this point.

If anyone does have any further tips on this it is currently still
running in case we can figure out which lock it is/was.

Cheers,

Richard
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_PA4PR08MB74119DD966F3B18569BE2994E8D09PA4PR08MB7411eurp_
Content-Type: text/html; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dkoi8-r">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">A little script I have locally which is useful for finding bitbake =
instances:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">for PID in $(pgrep '^Cooker$'); do<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; pstree -p -l $PID<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; echo<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">done<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Output from a build I just fired:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Cooker(2380890)=80</span><span lang=3D"EN-US" style=3D"font-size:11=
.0pt;font-family:&quot;MS Gothic&quot;;mso-fareast-language:EN-US">=88</spa=
n><span style=3D"font-size:11.0pt;mso-fareast-language:EN-US">=80Cooker(238=
0899)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; =84=80Worker(2381485)=80</span><span lang=3D"EN-US"=
 style=3D"font-size:11.0pt;font-family:&quot;MS Gothic&quot;;mso-fareast-la=
nguage:EN-US">=88</span><span style=3D"font-size:11.0pt;mso-fareast-languag=
e:EN-US">=80Worker(2402174)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80attr:patch(2401804)=80=80=80sh(24021=
70)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80bash-completion(2401738)<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80bzip2:patch(2401753)<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span lang=
=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS Gothic&quot;;mso-=
fareast-language:EN-US">=86</span><span style=3D"font-size:11.0pt;mso-farea=
st-language:EN-US">=80cracklib:patch(2401737)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80curl-native:unp(2401716)=80=80=80sh(=
2401909)=80</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-famil=
y:&quot;MS Gothic&quot;;mso-fareast-language:EN-US">=88</span><span style=
=3D"font-size:11.0pt;mso-fareast-language:EN-US">=80tar(2401930)<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =81&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =84=
=80xz(2401929)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</span><span lang=
=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS Gothic&quot;;mso-=
fareast-language:EN-US">=86</span><span style=3D"font-size:11.0pt;mso-farea=
st-language:EN-US">=80cve-update-db-n(2390133)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80edk2-firmware:u(2401360)<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80flex:patch(2401736)<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80gcc-source-12.1(2401703)=80=80=80sh(=
2401764)=80</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-famil=
y:&quot;MS Gothic&quot;;mso-fareast-language:EN-US">=88</span><span style=
=3D"font-size:11.0pt;mso-fareast-language:EN-US">=80tar(2401778)<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=81&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =84=
=80xz(2401777)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80glib-2.0-native(2401763)=80=80=80sh(=
2402164)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80glibc:patch(2401705)=80=80=80sh(2402=
159)=80=80=80quilt(2402175)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span lang=
=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS Gothic&quot;;mso-=
fareast-language:EN-US">=86</span><span style=3D"font-size:11.0pt;mso-farea=
st-language:EN-US">=80gnutls-native:u(2401717)=80=80=80sh(2401938)=80</span=
><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS Gothic=
&quot;;mso-fareast-language:EN-US">=88</span><span style=3D"font-size:11.0p=
t;mso-fareast-language:EN-US">=80tar(2402023)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =81&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =84=
=80xz(2402020)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80initscripts:pat(2401783)=80=80=80sh(=
2402167)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span lang=
=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS Gothic&quot;;mso-=
fareast-language:EN-US">=86</span><span style=3D"font-size:11.0pt;mso-farea=
st-language:EN-US">=80libcap-ng:patch(2401757)=80=80=80sh(2402173)<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80libffi:patch(2401755)=80=80=80sh(240=
2160)=80=80=80xargs(2402177)=80=80=80sed(2402181)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80libpam:unpack(2401745)<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80libtirpc:patch(2401750)<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80libtool-cross:p(2401719)<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80libxcrypt:patch(2401725)<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80libxml2-native:(2401734)<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80linux-libc-head(2401701)=80=80=80sh(=
2401818)=80</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-famil=
y:&quot;MS Gothic&quot;;mso-fareast-language:EN-US">=88</span><span style=
=3D"font-size:11.0pt;mso-fareast-language:EN-US">=80tar(2401824)<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =81&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =84=
=80xz(2401823)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80linux-yocto:ker(2400552)=80=80=80run=
.do_kernel_c(2400801)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80lz4-native:comp(2400716)=80=80=80run=
.do_compile.(2400804)=80=80=80make(2400842)=80=80=80make(2400866)=80=80=80g=
cc-10(2400925)=80</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font=
-family:&quot;MS Gothic&quot;;mso-fareast-language:EN-US">=88</span><span s=
tyle=3D"font-size:11.0pt;mso-fareast-language:EN-US">=80as(2401679)<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=81&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=84=80cc1(2401678)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80ncurses:patch(2401729)=80=80=80sh(24=
02156)=80=80=80quilt(2402178)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span lang=
=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS Gothic&quot;;mso-=
fareast-language:EN-US">=86</span><span style=3D"font-size:11.0pt;mso-farea=
st-language:EN-US">=80openssl:patch(2401816)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80opkg-utils:patc(2401721)<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80python3-native:(2401712)=80=80=80sh(=
2402155)=80</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-famil=
y:&quot;MS Gothic&quot;;mso-fareast-language:EN-US">=88</span><span style=
=3D"font-size:11.0pt;mso-fareast-language:EN-US">=80tar(2402180)<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =81&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =84=
=80xz(2402179)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80update-rc.d:pat(2401914)<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80util-linux-libu(2401747)<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80xz:patch(2401774)=80=80=80sh(2402165=
)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;MS =
Gothic&quot;;mso-fareast-language:EN-US">=86</span><span style=3D"font-size=
:11.0pt;mso-fareast-language:EN-US">=80zlib:unpack(2401723)<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =84=80{Worker}(238=
1486)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Ross<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">richard.purdie@linu=
xfoundation.org &lt;richard.purdie@linuxfoundation.org&gt;<br>
<b>Date: </b>Thursday, 19 May 2022 at 13:43<br>
<b>To: </b>swat &lt;swat@lists.yoctoproject.org&gt;, openembedded-core &lt;=
openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc: </b>Luca Ceresoli &lt;luca.ceresoli@bootlin.com&gt;, Alexandre Bello=
ni &lt;alexandre.belloni@bootlin.com&gt;, Ross Burton &lt;Ross.Burton@arm.c=
om&gt;<br>
<b>Subject: </b>Investigating a hung job on the autobuilder - a HOWTO<o:p><=
/o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">Investigating a hung job on the autobuilder<br>
<br>
We've yet another hung job on the autobuilder. I thought I'd write down<br>
what I did to investigate it so others can learn how to do it and so I<br>
can remember next time I need to do it too.<br>
<br>
The problem was this job:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/97/build=
s/4563">https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/4=
563</a><br>
<br>
qemuarm64-armhost running on an aarch64 worker, hung in do_testsdkext<br>
for core-image-minimal. To get further you need ssh access. We do give<br>
out ssh access to people who need it.<br>
<br>
ssh to ubuntu1804-arm-1.yocto.io and then &quot;sudo -iu pokybuild&quot; le=
ts us<br>
have a look at what is going on. Easy first step is:<br>
<br>
$ ps ax | grep armhost<br>
28429 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; S&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 0:00 python3 /home/pokybuild/yocto-worker/qemuarm64-armhost/yocto-au=
tobuilder-helper/scripts/run-config qemuarm64-armhost /home/pokybuild/yocto=
-worker/qemuarm64-armhost/build/build lucaceresoli/master-next ssh://git@pu=
sh.yoctoproject.org/poky-contrib
 --sstateprefix&nbsp; --buildappsrcrev&nbsp; --publish-dir&nbsp; --build-ty=
pe full --workername ubuntu1804-arm-1 --build-url
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#builders/97/builds=
/4563">https://autobuilder.yoctoproject.org/typhoon/#builders/97/builds/456=
3</a> --results-dir /srv/autobuilder/autobuilder.yocto.io/pub/non-release/2=
0220517-8/testresults --quietlogging
 --stepname test-targets --phase 2<br>
28430 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; S&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 0:00 /bin/sh -c . ./oe-init-build-env; /home/pokybuild/yocto-worker/=
qemuarm64-armhost/yocto-autobuilder-helper/scripts/checkvnc; DISPLAY=3D:1 b=
itbake core-image-minimal:do_testimage core-image-sato:do_testimage core-im=
age-sato-sdk:do_testimage
 core-image-sato:do_testsdk&nbsp; core-image-minimal:do_testsdkext core-ima=
ge-sato:do_testsdkext -k<br>
28460 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sl&nbsp;&nbsp;&nbsp;&nbsp=
; 0:32 python3 /home/pokybuild/yocto-worker/qemuarm64-armhost/build/bitbake=
/bin/bitbake core-image-minimal:do_testimage core-image-sato:do_testimage c=
ore-image-sato-sdk:do_testimage core-image-sato:do_testsdk core-image-minim=
al:do_testsdkext
 core-image-sato:do_testsdkext -k<br>
28462 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sl&nbsp;&nbsp;&nbsp;&nbsp=
; 6:43 bitbake-server /home/pokybuild/yocto-worker/qemuarm64-armhost/build/=
bitbake/bin/bitbake-server decafbad 3 5 /home/pokybuild/yocto-worker/qemuar=
m64-armhost/build/build/bitbake-cookerdaemon.log /home/pokybuild/yocto-work=
er/qemuarm64-armhost/build/build/bitbake.lock
 /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/bitbake.sock 0 =
None 0<br>
28504 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sl&nbsp;&nbsp;&nbsp;&nbsp=
; 0:17 python3 /home/pokybuild/yocto-worker/qemuarm64-armhost/build/bitbake=
/bin/bitbake-worker decafbad<br>
28515 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SNs&nbsp;&nbsp;&nbsp; 0:0=
0 python3 /home/pokybuild/yocto-worker/qemuarm64-armhost/build/bitbake/bin/=
bitbake-worker decafbad<br>
29659 pts/1&nbsp;&nbsp;&nbsp; S+&nbsp;&nbsp;&nbsp;&nbsp; 0:00 grep armhost<=
br>
38713 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SN&nbsp;&nbsp;&nbsp;&nbsp=
; 0:00 /bin/sh -c . /home/pokybuild/yocto-worker/qemuarm64-armhost/build/bu=
ild/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/envi=
ronment-setup-cortexa57-poky-linux &gt; /dev/null; devtool sdk-install meta=
-extsdk-toolchain<br>
38719 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SN&nbsp;&nbsp;&nbsp;&nbsp=
; 0:01 /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work/=
qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools/sysroo=
ts/aarch64-pokysdk-linux/usr/bin/python3 /home/pokybuild/yocto-worker/qemua=
rm64-armhost/build/build/tmp/work/qemuarm64-poky-linux/core-image-minimal/1=
.0-r0/testsdkext/sysroots/aarch64-pokysdk-linux/usr/bin/devtool
 sdk-install meta-extsdk-toolchain<br>
<br>
i.e. looking for processes that are running in that build directory.<br>
<br>
The relevant part of the process tree from &quot;ps axjf&quot;:<br>
<br>
&nbsp;PPID&nbsp;&nbsp; PID&nbsp; PGID&nbsp;&nbsp; SID TTY&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; TPGID STAT&nbsp;&nbsp; UID&nbsp;&nbsp; TIME COMMAND<br>
&nbsp;&nbsp;&nbsp; 1&nbsp; 3501&nbsp; 3500&nbsp; 3500 ?&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -1 Sl&nbsp;&nbsp;&nbsp; 6000&nbsp;=
&nbsp; 2:29 /usr/bin/python3 /usr/local/bin/buildbot-worker start /home/pok=
ybuild/yocto-worker/<br>
&nbsp;3501 28429 28429&nbsp; 3500 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; -1 S&nbsp;&nbsp;&nbsp;&nbsp; 6000&nbsp;&nbsp; 0:00&nbs=
p; \_ python3 /home/pokybuild/yocto-worker/qemuarm64-armhost/yocto-autobuil=
der-helper/scripts/<br>
28429 28430 28429&nbsp; 3500 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; -1 S&nbsp;&nbsp;&nbsp;&nbsp; 6000&nbsp;&nbsp; 0:00&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; \_ /bin/sh -c . ./oe-init-build-env; /home/pokybuild/=
yocto-worker/qemuarm64-armhost/yoc<br>
28430 28460 28429&nbsp; 3500 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; -1 Sl&nbsp;&nbsp;&nbsp; 6000&nbsp;&nbsp; 0:32&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \_ python3 /home/pokybuild/yocto-w=
orker/qemuarm64-armhost/build/bitbake/bin/bitbake<br>
&nbsp;&nbsp;&nbsp; 1 28462 28461 28461 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; -1 Sl&nbsp;&nbsp;&nbsp; 6000&nbsp;&nbsp; 6:43 bit=
bake-server /home/pokybuild/yocto-worker/qemuarm64-armhost/build/bitbake/bi=
n/bitbake-serv<br>
28462 28504 28461 28461 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; -1 Sl&nbsp;&nbsp;&nbsp; 6000&nbsp;&nbsp; 0:17&nbsp; \_ python3 /=
home/pokybuild/yocto-worker/qemuarm64-armhost/build/bitbake/bin/bitbake-wor=
ker
<br>
28504 28515 28515 28515 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; -1 SNs&nbsp;&nbsp; 6000&nbsp;&nbsp; 0:00&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; \_ python3 /home/pokybuild/yocto-worker/qemuarm64-armhost/build/bitb=
ake/bin/bitbake-wor<br>
28515 38713 28515 28515 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; -1 SN&nbsp;&nbsp;&nbsp; 6000&nbsp;&nbsp; 0:00&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \_ /bin/sh -c . /home/pokybuild/yocto-w=
orker/qemuarm64-armhost/build/build/tmp/work<br>
38713 38719 28515 28515 ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; -1 SN&nbsp;&nbsp;&nbsp; 6000&nbsp;&nbsp; 0:01&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \_ /home/pokybu=
ild/yocto-worker/qemuarm64-armhost/build/build/tmp/work/qemuarm6<br>
<br>
so the hung process is 38719.<br>
<br>
I did have a look at the log files in the build directory but in this<br>
case I didn't find anything. The bitbake-cookerdaemon.log in particular<br>
can sometimes help. I had a look at the open files for the process:<br>
<br>
$ ls /proc/38719/fd -la<br>
total 0<br>
dr-x------ 2 pokybuild pokybuild&nbsp; 0 May 19 12:08 .<br>
dr-xr-xr-x 9 pokybuild pokybuild&nbsp; 0 May 19 11:59 ..<br>
lr-x------ 1 pokybuild pokybuild 64 May 19 12:08 0 -&gt; /dev/null<br>
l-wx------ 1 pokybuild pokybuild 64 May 19 12:08 1 -&gt; 'pipe:[122175861]'=
<br>
l-wx------ 1 pokybuild pokybuild 64 May 19 12:08 2 -&gt; 'pipe:[122175861]'=
<br>
lr-x------ 1 pokybuild pokybuild 64 May 19 12:08 4 -&gt; 'pipe:[122140435]'=
<br>
<br>
but nothing interesting there.<br>
<br>
I couldn't use strace as the permissions weren't setup for that without<br>
root. We don't normally give out that access but to debug this I went<br>
ahead and looked with strace:<br>
<br>
strace -p 38719<br>
strace: Process 38719 attached<br>
futex(0xffff9c2da2bc, FUTEX_WAIT_BITSET_PRIVATE|FUTEX_CLOCK_REALTIME, 0, NU=
LL, 0xffffffff<br>
<br>
so it is stuck in a futex. I then went ahead and tried gdb:<br>
<br>
gdb -p 38719<br>
<br>
BFD: warning: /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tm=
p/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools=
/sysroots/aarch64-pokysdk-linux/usr/bin/python3.10.real: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000<br>
BFD: warning: /home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tm=
p/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildtools=
/sysroots/aarch64-pokysdk-linux/lib/libc.so.6: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000<br>
Reading symbols from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/b=
uild/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/bui=
ldtools/sysroots/aarch64-pokysdk-linux/lib/libc.so.6...(no debugging symbol=
s found)...done.<br>
<br>
(gdb) bt<br>
Python Exception &lt;class 'gdb.error'&gt; Call Frame Instruction op 45 in =
vendor extension space is not handled on this architecture.:
<br>
#0&nbsp; 0x0000ffff9bd1e16c in ?? ()<br>
&nbsp;&nbsp; from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/buil=
d/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildt=
ools/sysroots/aarch64-pokysdk-linux/lib/libc.so.6<br>
Call Frame Instruction op 45 in vendor extension space is not handled on th=
is architecture.<br>
<br>
I've abbreviated the initial output. We can see that it is using python<br>
3.10 from within builtdools tarball within an eSDK and we have no debug<br>
symbols. The lack of a backtrace was worrying, after consulting some<br>
ARM experts it was concluded the version of gdb was too old for the<br>
newer glibc in buildtools.<br>
<br>
After much thinking, I decided to enable and build a gdb-native. I did<br>
something horrible and moved the lock and sock files out the way and<br>
then a &quot;bitbake gdb-native&quot; in the same build directory. We don't=
 have<br>
a gdb-native recipe however adding a BBCLASSEXTEND =3D &quot;native&quot;, =
a<br>
PACKAGECONFIG to enable python in the native case and disable LLTNGUST<br>
for native. A &quot;bitbake gdb-native -c addto_recipe_sysroot&quot; made i=
t<br>
available in the gdb-native WORKDIR where I could then run it from:<br>
<br>
/home/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work/aarch64=
-linux/gdb-native/12.1-r0/recipe-sysroot-native/usr/bin/gdb -p 3871<br>
<br>
I did try using gdb-cross-aarch64 but that wouldn't attach to local<br>
processes.<br>
<br>
Sadly there were no symbols so the backtrace output was still not<br>
useful other than seeing we were in some libpthread function<br>
(unsurprisingly). I realised I could go into the python3-nativesdk<br>
workdir, find the nativesdk-python3-dbg package (I used the deb) and<br>
then copy the .debug files from that into the<br>
testsdkext/buildtools/sysroots/aarch64-pokysdk-linux/usr/lib/ directory<br>
for the python libs.<br>
<br>
With that, I got some more interesting output:<br>
<br>
(gdb) bt<br>
#0&nbsp; 0x0000ffff9bd1e16c in ?? ()<br>
&nbsp;&nbsp; from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/buil=
d/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildt=
ools/sysroots/aarch64-pokysdk-linux/lib/libc.so.6<br>
#1&nbsp; 0x0000ffff9bd20d88 in pthread_cond_wait ()<br>
&nbsp;&nbsp; from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/buil=
d/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildt=
ools/sysroots/aarch64-pokysdk-linux/lib/libc.so.6<br>
#2&nbsp; 0x0000ffff9c0db3a8 in drop_gil (ceval=3Dceval@entry=3D0xffff9c2da2=
08 &lt;_PyRuntime+344&gt;, ceval2=3Dceval2@entry=3D0xaaab09af3f20,
<br>
&nbsp;&nbsp;&nbsp; tstate=3Dtstate@entry=3D0xaaab09ab9ba0) at ../Python-3.1=
0.4/Python/ceval_gil.h:182<br>
#3&nbsp; 0x0000ffff9bfc8708 in eval_frame_handle_pending (tstate=3D0xaaab09=
ab9ba0) at ../Python-3.10.4/Python/ceval.c:1185<br>
#4&nbsp; _PyEval_EvalFrameDefault (tstate=3D0xaaab09ab9ba0, f=3D0xffff9445e=
dd0, throwflag=3D&lt;optimized out&gt;) at ../Python-3.10.4/Python/ceval.c:=
1775<br>
#5&nbsp; 0x0000ffff9c0de0a8 in _PyEval_EvalFrame (throwflag=3D0, f=3D0xffff=
9445edd0, tstate=3D0xaaab09ab9ba0)<br>
&nbsp;&nbsp;&nbsp; at ../Python-3.10.4/Include/internal/pycore_ceval.h:46<b=
r>
#6&nbsp; _PyEval_Vector (tstate=3D0xaaab09ab9ba0, con=3D0xffff95a20050, loc=
als=3D&lt;optimized out&gt;, args=3D&lt;optimized out&gt;, argcount=3D&lt;o=
ptimized out&gt;,
<br>
&nbsp;&nbsp;&nbsp; kwnames=3D&lt;optimized out&gt;) at ../Python-3.10.4/Pyt=
hon/ceval.c:5065<br>
#7&nbsp; 0x0000ffff9c13a35c in _PyObject_VectorcallTstate (nargsf=3D9223372=
036854775809, kwnames=3D0x0, args=3D0xffffd3ebd780, callable=3D0xffff95a200=
40,
<br>
&nbsp;&nbsp;&nbsp; tstate=3D0xaaab09ab9ba0) at ../Python-3.10.4/Include/cpy=
thon/abstract.h:114<br>
#8&nbsp; PyObject_CallOneArg (arg=3D0xffff95ac8130, func=3D0xffff95a20040) =
at ../Python-3.10.4/Include/cpython/abstract.h:184<br>
#9&nbsp; handle_weakrefs (old=3D0xaaab09af4190, unreachable=3D0xffffd3ebd74=
8) at ../Python-3.10.4/Modules/gcmodule.c:887<br>
#10 gc_collect_main (tstate=3Dtstate@entry=3D0xaaab09ab9ba0, generation=3Dg=
eneration@entry=3D2, n_collected=3Dn_collected@entry=3D0xffffd3ebd800,
<br>
&nbsp;&nbsp;&nbsp; n_uncollectable=3Dn_uncollectable@entry=3D0xffffd3ebd808=
, nofail=3Dnofail@entry=3D0) at ../Python-3.10.4/Modules/gcmodule.c:1281<br=
>
#11 0x0000ffff9c13abfc in gc_collect_with_callback (tstate=3Dtstate@entry=
=3D0xaaab09ab9ba0, generation=3Dgeneration@entry=3D2)<br>
&nbsp;&nbsp;&nbsp; at ../Python-3.10.4/Modules/gcmodule.c:1413<br>
#12 0x0000ffff9c13b1e4 in PyGC_Collect () at ../Python-3.10.4/Modules/gcmod=
ule.c:2099<br>
#13 0x0000ffff9c117538 in Py_FinalizeEx () at ../Python-3.10.4/Python/pylif=
ecycle.c:1781<br>
#14 Py_FinalizeEx () at ../Python-3.10.4/Python/pylifecycle.c:1703<br>
#15 0x0000ffff9c1181e8 in Py_Exit (sts=3D0) at ../Python-3.10.4/Python/pyli=
fecycle.c:2858<br>
#16 0x0000ffff9c11cbc0 in handle_system_exit () at ../Python-3.10.4/Python/=
pythonrun.c:775<br>
#17 _PyErr_PrintEx (tstate=3D0xaaab09ab9ba0, set_sys_last_vars=3Dset_sys_la=
st_vars@entry=3D1) at ../Python-3.10.4/Python/pythonrun.c:785<br>
#18 0x0000ffff9c11cbfc in PyErr_PrintEx (set_sys_last_vars=3Dset_sys_last_v=
ars@entry=3D1) at ../Python-3.10.4/Python/pythonrun.c:880<br>
#19 0x0000ffff9c11cc0c in PyErr_Print () at ../Python-3.10.4/Python/pythonr=
un.c:886<br>
#20 0x0000ffff9c11d280 in _PyRun_SimpleFileObject (fp=3Dfp@entry=3D0xaaab09=
ab2540, filename=3Dfilename@entry=3D0xffff95cbe6b0, closeit=3Dcloseit@entry=
=3D1,
<br>
&nbsp;&nbsp;&nbsp; flags=3Dflags@entry=3D0xffffd3ebda48) at ../Python-3.10.=
4/Python/pythonrun.c:462<br>
#21 0x0000ffff9c11d50c in _PyRun_AnyFileObject (fp=3Dfp@entry=3D0xaaab09ab2=
540, filename=3Dfilename@entry=3D0xffff95cbe6b0, closeit=3Dcloseit@entry=3D=
1,
<br>
&nbsp;&nbsp;&nbsp; flags=3Dflags@entry=3D0xffffd3ebda48) at ../Python-3.10.=
4/Python/pythonrun.c:90<br>
#22 0x0000ffff9c1389c0 in pymain_run_file_obj (skip_source_first_line=3D0, =
filename=3D0xffff95cbe6b0, program_name=3D0xffff95dce3d0)<br>
&nbsp;&nbsp;&nbsp; at ../Python-3.10.4/Modules/main.c:353<br>
#23 pymain_run_file (config=3D0xaaab09af4290) at ../Python-3.10.4/Modules/m=
ain.c:372<br>
#24 pymain_run_python (exitcode=3D0xffffd3ebda44) at ../Python-3.10.4/Modul=
es/main.c:587<br>
#25 Py_RunMain () at ../Python-3.10.4/Modules/main.c:666<br>
#26 0x0000ffff9c138e6c in pymain_main (args=3D0xffffd3ebdb20) at ../Python-=
3.10.4/Modules/main.c:696<br>
#27 Py_BytesMain (argc=3D&lt;optimized out&gt;, argv=3D&lt;optimized out&gt=
;) at ../Python-3.10.4/Modules/main.c:720<br>
#28 0x0000ffff9bccb234 in ?? ()<br>
&nbsp;&nbsp; from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/buil=
d/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildt=
ools/sysroots/aarch64-pokysdk-linux/lib/libc.so.6<br>
#29 0x0000ffff9bccb30c in __libc_start_main ()<br>
&nbsp;&nbsp; from /home/pokybuild/yocto-worker/qemuarm64-armhost/build/buil=
d/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildt=
ools/sysroots/aarch64-pokysdk-linux/lib/libc.so.6<br>
#30 0x0000aaaaca8cd9b0 in _start ()<br>
<br>
I did try &quot;py-bt&quot; but that wasn't present. This can be fixed by<b=
r>
ensuring the source for python3-native is present (&quot;bitbake python3-<b=
r>
native -c patch&quot;), then<br>
<br>
source build/tmp/work/aarch64-linux/python3-native/3.10.4-r0/Python-3.10.4/=
Tools/gdb/libpython.py<br>
<br>
within gdb will add the python extensions. We can then get:<br>
<br>
(gdb) py-bt<br>
Traceback (most recent call first):<br>
&nbsp; File &quot;/home/pokybuild/yocto-worker/qemuarm64-armhost/build/buil=
d/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/testsdkext/buildt=
ools/sysroots/aarch64-pokysdk-linux/usr/lib/python3.10/_weakrefset.py&quot;=
, line 39, in _remove<br>
&nbsp;&nbsp;&nbsp; def _remove(item, selfref=3Dref(self)):<br>
&nbsp; Garbage-collecting<br>
<br>
i.e. it is in python garbage collection. This probably means a<br>
multiprocessing.Lock() or threading.Lock() was left in the locked state<br>
by some other process/thread which exited and this has hung the build.<br>
<br>
I still haven't worked out how to know *which* lock this is or how to<br>
debug any further but I was quite pleased to even be able to debug this<br>
to this point.<br>
<br>
If anyone does have any further tips on this it is currently still<br>
running in case we can figure out which lock it is/was.<br>
<br>
Cheers,<br>
<br>
Richard<o:p></o:p></span></p>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_PA4PR08MB74119DD966F3B18569BE2994E8D09PA4PR08MB7411eurp_--

