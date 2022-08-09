Return-Path: <alban.bedel@aerq.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DEFC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 13:49:38 +0000 (UTC)
Received: from mx-relay88-hz1.antispameurope.com
 (mx-relay88-hz1.antispameurope.com [94.100.133.254])
 by mx.groups.io with SMTP id smtpd.web12.12096.1660052975419622890
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 06:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aerq.com header.s=hse1 header.b=YUOfSuIY;
 spf=pass (domain: aerq.com, ip: 94.100.133.254,
 mailfrom: alban.bedel@aerq.com)
Received: from mail-he1eur01lp2057.outbound.protection.outlook.com
 ([104.47.0.57]) by mx-relay88-hz1.antispameurope.com;
 Tue, 09 Aug 2022 15:49:31 +0200
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=T8aNokB0kX6YG87DdhFgCrHiC7D9iMSAhSuw1+tM07r7hKrQH7i0Ze0MnMDzRM2gSgZHyLjtjlHxY3iTko/TG0syBiizCMymWvcJlP+tTXuLdIsEyqGw36Hkd/GJsvXw9os634K6Dcv45bUO94q+UBR0JvElMfNEwySNOvAu52XbSd4iRlSvttxVjuG/4uOaSFujEEA9x5hyKp1NooT2O5vtDrsYt5D+eTgKtAw7E6a/GhwSLMTZSqrG2O3Whry2pHFOzPMY/bRSGrwmgvM0teATWhNoJ4MbZq+FsHO3ObkIeUsSnDfA/dWuQD5dwTbmiYWI00Cb1kxjIXv9Y/A0EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqfjHa1NOebVu4lFvqmdkcoIZnjkRoRVqQQJXNmJilc=;
 b=A/IvxLA2m78sT7GuxoRR+DO4jxji2Ahpz+BZYdPNqUiGmPh96BLDy2QDiGTmwrdMCsmCkSIjkQhxyQFgwR9bdzqjFJl8dx8+EqquX300rIKZ4SdS1tQhK2HhIYI0Nw1DJrzMdpY7qXL6F7l8s/p9i/98aod0fCkWqn2jnQuktqYO+BTJZArKI3iuluOazMzaZkM3jWoD911lMUKTRZ3BE28AbSiixqkmgixXV7Pv85oLGKRQiaNF5Ukpuiet0y6ahS8Ug8unLzDCpiqqk75NLqyRJzMAQ9fLDjEDprJc6EfA1sum1C3Com/dxEDfhr1amUY3Gww1mgIPSjsHRbx+AA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.40.229.156) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=aerq.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=aerq.com; dkim=pass (signature was verified)
 header.d=l2task.onmicrosoft.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=aerq.com] dkim=[1,1,header.d=aerq.com]
 dmarc=[1,1,header.from=aerq.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqfjHa1NOebVu4lFvqmdkcoIZnjkRoRVqQQJXNmJilc=;
 b=aVsG9ucbi0P7tZSt+Ax16Q1P9v8Mv9JUuU2hwcR8VQ4BWvxyjtMnUylUQnBXxk8HQMF+oJ9PrSU8LFy8fYDF1eBbySKv5oHWeQob1JyR8NkMtpea9zZOGZRrvIAH/qomXAr0fsGaeTte6fH47/f6zqlbgzbJFxYzR3z2l2xhDJo=
Received: from FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::15)
 by HE1PR10MB1788.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:7:61::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 9 Aug
 2022 13:48:46 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1f:cafe::c7) by FR3P281CA0080.outlook.office365.com
 (2603:10a6:d10:1f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.7 via Frontend
 Transport; Tue, 9 Aug 2022 13:48:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.40.229.156) smtp.mailfrom=aerq.com; dkim=pass (signature was verified)
 header.d=l2task.onmicrosoft.com;dmarc=fail action=quarantine
 header.from=aerq.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 aerq.com discourages use of 104.40.229.156 as permitted sender)
Received: from eu1.smtp.exclaimer.net (104.40.229.156) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5504.16 via Frontend Transport; Tue, 9 Aug 2022 13:48:44 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (104.47.5.58) by
	 eu1.smtp.exclaimer.net (104.40.229.156) with Exclaimer Signature Manager
	 ESMTP Proxy eu1.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Tue, 9 Aug 2022 13:48:45 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 11450440
X-ExclaimerImprintLatency: 507982
X-ExclaimerImprintAction: 8af861d0346246ac9918ff94f3b63660
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ur7iKqglpiuQXCoCeI6sSVfH8zvkojbURWMORwb1up4zlnSIe1PLOBPfgkU+l99p/qG+cI7OXBpLaE8O2G33grSmRYsc/G6UmPxZP2X+/RSKWCiav1t+rtb1J1vueEc/lrNj/kIaWQypI8zvf+XZddjRdU85DileGP7mamdBETOWTlqrzRPbw+rwvMEG5tavYalHC1nLGrp1P6AxsveIEOewFIhRNffeg3mReN14CJ9ND2NX/oiaQV1Gn9x3Ln7XMNRC4iqD/f1SXVtNJSJ3n1FeNsOGv35hWd08KS/iPU6bwyjp0upJCIsFQoAIMQ3ZUrYZA/NoHyCdGrzBP3CD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqfjHa1NOebVu4lFvqmdkcoIZnjkRoRVqQQJXNmJilc=;
 b=oV8vClLnemQ1kx5W4IadCXsqou5PHHtH+M5JuW0fNgDn/qj0ISHv5LFF3jOW4nmxj1HAwOa3pR0XA7SO3HlaSRYUKd3QV1t9o6oO3/LU/05iIFXL4BGPFyjnkArkyx8m9gUNXCAs2aUZ5ZCxwOsqb67VN38GlrofkkgZeBCq+5R/cZ7A6Cv+955boy0dw8yGjJwBs2gpujDOB1Enf+1p/94P7AUHVGh26vmJ+A1WQtbT6Owt2GIRAvHoSXiyUXVOQueIogdouMz06X71U2Qb652eqTqzJ1l1b8aalE73ImJgZiTY1+BbYMrgf37OfncV0oAn3i2lmJyljdPsAYAhMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqfjHa1NOebVu4lFvqmdkcoIZnjkRoRVqQQJXNmJilc=;
 b=aVsG9ucbi0P7tZSt+Ax16Q1P9v8Mv9JUuU2hwcR8VQ4BWvxyjtMnUylUQnBXxk8HQMF+oJ9PrSU8LFy8fYDF1eBbySKv5oHWeQob1JyR8NkMtpea9zZOGZRrvIAH/qomXAr0fsGaeTte6fH47/f6zqlbgzbJFxYzR3z2l2xhDJo=
Received: from AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:405::24)
 by DB8PR10MB3676.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Tue, 9 Aug
 2022 13:48:42 +0000
Received: from AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c38:536b:7cd4:5bf9]) by AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c38:536b:7cd4:5bf9%4]) with mapi id 15.20.5504.021; Tue, 9 Aug 2022
 13:48:35 +0000
From: "Bedel, Alban" <alban.bedel@aerq.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sstate: Don't abort if installing a sstate
 package fails
Thread-Topic: [OE-core] [PATCH] sstate: Don't abort if installing a sstate
 package fails
Thread-Index: AQHYq8sGGxlFKNbXLk6jPcCD7wm7yq2mRTcAgABQogA=
Date: Tue, 9 Aug 2022 13:48:35 +0000
Message-ID: <51ea51600d49617d2f6c3b09d7684b205db517e2.camel@aerq.com>
References: <20220809083527.1221635-1-alban.bedel@aerq.com>
	 <42071e5296d8b1df2e55086df95296d1eccbe5bc.camel@linuxfoundation.org>
In-Reply-To: 
 <42071e5296d8b1df2e55086df95296d1eccbe5bc.camel@linuxfoundation.org>
Accept-Language: en-DE, de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aerq.com;
X-MS-Office365-Filtering-Correlation-Id: 15bbd79c-4921-4021-eb6c-08da7a0de0e1
x-ms-traffictypediagnostic: 
	DB8PR10MB3676:EE_|VE1EUR03FT027:EE_|HE1PR10MB1788:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 E9Q5ZltIs6huFNTNkbzcPoOnMVGt2KI3QtLY7AiQWTCfqrRm23cgjsKZNGMYsF5WgG+sLpRbltIlZ9qDBN20pkZ8ScxTZF/LVxNhngSgwu6v5xHbKL5C0Q4gs5xOcmB1/Luxn0vmiMnHQX6+SzgKeOZQeVUIo6BYtzKPND1HA5aCGZVLA6Do9JpTyZVPSZjxzJPeBOnznWvjbOSFdMS3EBTBrIs94zZwFf+53zUYU8F7zEEMAp/mOVKuHwpqOItE0FzTAayKOC+z4D11VS8wVc2Xxq4i1AehGtTPctVz3/jRB9o3sesjIZUMXp7sT6638mlDS8Qa2L/Sa4RmsNUrJekAYTZUt921oNPovBi5/EeRFp0AWriRTTy+B0LWOc+snXPXgbBcbeqK6/nnZz71CU5UoSfhZy7Qjrz3/a5CkZtw8gfuHGB1tm1ClVOgRpH+KNwrUUk+qIhB/VSYw0qsr1QvaipdHx6njnAqBdzwLZ8j/ViQ0aKFXJv9G8JJT0Gjh316rckMpGYDaXKxnjuETPeqEy/D2er5758mu1L8SE8Dr1qmBYWX2zf4jNC/ELC6dbT15zbzO89nEt4n0ThS2vLmY8729OcpQQYGTPBPYWEo7FgJV8M8m6e7cdMhCUO39228/f72AK8A+sKZwlP7bPnPRm9maxbSbr5/QZ/nTTmBOVnT7hkElt+KNTgEgdF/QnJ4+aUqr8MaA/vB+/bDt93tlEYgz/C6lOhGl9KD7SEvuarwkpZA2o6kp1ZUgAKLGrefBJ5jZYUsYxgXZhH/5De9mqC12a7bjRWvPscOhg8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(396003)(39850400004)(376002)(136003)(64756008)(76116006)(66946007)(66556008)(8936002)(122000001)(66476007)(5660300002)(8676002)(38100700002)(66446008)(6486002)(186003)(478600001)(110136005)(91956017)(71200400001)(36756003)(2616005)(2906002)(6512007)(316002)(41300700001)(6506007)(83380400001)(38070700005)(82960400001)(86362001);DIR:OUT;SFP:1102;
Content-ID: <7FC6560192A15C4FB6D17F7789B09388@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3676
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5d79f753-867a-49c5-7d83-08da7a0ddb2e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xaT8YIVIP6tU9ikPpXmvM5po3wxqh0PU0BfjQu5oemDrjkJSR60BUAwJmbjsq5ZrfREAZ8rVBCIS6pDYKpuCbQZkGA40PLQWDqdDcBKy/4mamRARrSfjTV05JKa2vWS4T+pjA/UFtsBdB17bkRgdtykElFgEXtf+HXSAZUDZ3MHT3YjArvX0KdoLgpytDFxJo0CdTDc0cSUQq3SjPF75V7DhOdR4u0yRw9Q2u0NbRALK66TUnIArIe1uwLnC5Ae1xF6ehfQRFSkH9my3PqbtABC/0toZTby6SxnISKjbfkEu5bGWwRMFT7rs060nmH8NStRL7padNx8UXEWmTiSMDClDdwew5JOWG6a60hsdgeE/b5IUSAWnLXJ2Pnhcmc4vUy081Zd+27K8XWWQqQ2QnKuxaPNDaA0HRO1pVvkiVozLFxVWqvdP2g9FhfElhioNGwaXUuOuA55bK0XHiVmcOtmp0LSJB1w+VSc9i0rT8JdlHtZhjQoV+SEiHNNBodY7ma30CKUYFapcbt1TXep0TJnougUEqRW/1aAZueMxSzMsYcRiP6hi5HzmekqvmKo7OL0uQ+OuBg/tdb669+Co/hiCiKYmBg/B4AWdr/q12jqMGVnZmWP9IwyInjlLnwwwehhomHCT1phj8CA5KdW/kBqI4j7P0YAkqc0wKSho8aJA3kiBbLH3IerxFlBtfrf+aoL/CKW4+68acZaHMEkuLzZLN6h+x+UE/MfrOElyEGfNHy7HKOGkGlaNiwbd+BwKGtCkQvtUgohp44DeNZCRjQ==
X-Forefront-Antispam-Report: 
	CIP:104.40.229.156;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu1.smtp.exclaimer.net;PTR:eu1.smtp.exclaimer.net;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39850400004)(346002)(136003)(46966006)(36840700001)(7596003)(82960400001)(82740400003)(356005)(7636003)(26005)(336012)(478600001)(6486002)(2616005)(186003)(6512007)(6506007)(47076005)(41300700001)(86362001)(82310400005)(36756003)(70586007)(8676002)(5660300002)(316002)(70206006)(110136005)(36860700001)(40480700001)(83380400001)(2906002)(8936002);DIR:OUT;SFP:1102;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 13:48:44.9297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 15bbd79c-4921-4021-eb6c-08da7a0de0e1
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[104.40.229.156];Helo=[eu1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR10MB1788
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg="sha-256"; boundary="----61365926C2CFE1EA607365CD37F2E206"
X-cloud-security-sender: alban.bedel@aerq.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-crypt-policy: TRYSMIME
X-cloud-security-Mailarchiv: E-Mail archived for: alban.bedel@aerq.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
 mx-relay88-hz1.antispameurope.com with 10C2072001A
X-cloud-security-connect: 
 mail-he1eur01lp2057.outbound.protection.outlook.com[104.47.0.57], TLS=1,
 IP=104.47.0.57
X-cloud-security-Digest: 560b6c65ebd0b7b3ee302c2f81da2683
X-cloud-security-crypt: smime sign status=06 sign_complete
X-cloud-security: scantime:2.888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=aerq.com; h=from:to
	:subject:date:message-id:references:in-reply-to:content-id
	:content-transfer-encoding:mime-version:content-type; s=hse1;
	 bh=EtqlZGUgNpkOy+pOBrBqMPzNf1YXzM0g16Hy/X1/vDc=; b=YUOfSuIY1cHH
	0SXMow0UOGkBs03LIYtcEqBjNi5bxObUzBn4x4wkJvfBj6w8nNsPrl2QkD6Sb5Z/
	VEhS/IkFMnPw1ibWr+kbYdYd3aMuyGXrcw+e9QxP2AMkkXImj7EFK0YDnL0aeWBz
	pwo0kSbgKGMKL3qLbiwVsL4Rf0jUF/P1SAndwwZcXCRtHStVh5Vy4eW6eNwihCXA
	IitGzJYFEb5sX0Is9iN7ypG1iFPwQd87EPwLnfs81cBvb8gtlap+7PGHL9DVDZat
	hPk6ukoo+0WfD3Xbfbn8f741MPhx8X1Y2RfSKGGtaZQniiQ3z2VVfVTqGjVrQ2YO
	E+N5YPNfoQ==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 13:49:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169151

This is an S/MIME signed message

------61365926C2CFE1EA607365CD37F2E206
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sstate: Don't abort if installing a sstate
	package fails
Date: Tue, 9 Aug 2022 13:48:35 +0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FC6560192A15C4FB6D17F7789B09388@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

T24gVHVlLCAyMDIyLTA4LTA5IGF0IDA5OjU5ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gVHVlLCAyMDIyLTA4LTA5IGF0IDEwOjM1ICswMjAwLCBBbGJhbiBCZWRlbCB2aWENCj4g
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBDdXJyZW50bHkgaWYgdGhlIGluc3Rh
bGxhdGlvbiBvZiBhIHNzdGF0ZSBwYWNrYWdlIGZhaWxzIHRoZSB3aG9sZQ0KPiA+IGJ1aWxkIGlz
IGFib3J0ZWQgYWx0aG91Z2ggYml0YmFrZSBjb3VsZCBqdXN0IGZhbGxiYWNrIG9uIHJ1bm5pbmcg
dGhlDQo+ID4gcmVhbCB0YXNrLg0KPiA+IA0KPiA+IFRvIGZpeCB0aGlzIGlzc3VlIHdlIHJlcGxh
Y2UgdGhlIGNhbGwgdG8gYmIuZmF0YWwoKSBpbg0KPiA+IHNzdGF0ZV9zZXRzY2VuZSgpIHdpdGgg
YSBzaW1wbGUgc3lzLmV4aXQoKSB0byBwYXNzIHRoZSBlcnJvciB0byBiaXRiYWtlDQo+ID4gd2l0
aG91dCBhYm9ydGluZyB0aGUgYnVpbGQuIFRoZSBlcnJvciBtZXNzYWdlIHRoYXQgd2FzIHBhc3Nl
ZCB0bw0KPiA+IGJiLmZhdGFsKCkgaXMganVzdCByZW1vdmVkIGFzIGFsbCBlcnJvciBwYXRoIGFs
cmVhZHkgY29udGFpbnMgYQ0KPiA+IHdhcm5pbmcgb3Igbm90ZS4NCj4gPiANCj4gPiBUaGVuIHRv
IGZ1cnRoZXIgaW1wcm92ZSB0aGUgYnVpbGQgcmVzaWxpZW5jZSB3ZSBhZGQgYSB0cnkgYmxvY2sg
YXJvdW5kDQo+ID4gdGhlIHNzdGF0ZSBwYWNrYWdlIHVucGFja2luZy4gSWYgaXQgZmFpbHMsIGZv
ciBleGFtcGxlIGJlY2F1c2UgdGhlDQo+ID4gcGFja2FnZSB3YXMgY29ycnVwdGVkLCB3ZSBub3cg
cHJpbnQgYSB3YXJuaW5nIGFuZCBvcHRpb25hbGx5IHJlbW92ZQ0KPiA+IHRoZSBicm9rZW4gcGFj
a2FnZSB0byBhbGxvdyBpdCB0byBiZSByZWJ1aWx0LiBUaGUgY2xlYW5pbmcgb2YgYnJva2VuDQo+
ID4gcGFja2FnZXMgY2FuIGJlIGRpc2FibGVkIGJlIHNldHRpbmcgdGhlIFNTVEFURV9DTEVBTl9C
Uk9LRU5fUEFDS0FHRVMNCj4gPiB2YXJpYWJsZSB0byAwLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEFsYmFuIEJlZGVsIDxhbGJhbi5iZWRlbEBhZXJxLmNvbT4NCj4gPiAtLS0NCj4gPiDCoG1l
dGEvY2xhc3Nlcy9zc3RhdGUuYmJjbGFzcyB8IDIwICsrKysrKysrKysrKysrKystLS0tDQo+ID4g
wqAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL3NzdGF0ZS5iYmNsYXNzIGIvbWV0YS9jbGFz
c2VzL3NzdGF0ZS5iYmNsYXNzDQo+ID4gaW5kZXggZGU2ZTdmYTk2MDhhLi4wNjk5MDE0ODNiYjIg
MTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9jbGFzc2VzL3NzdGF0ZS5iYmNsYXNzDQo+ID4gKysrIGIv
bWV0YS9jbGFzc2VzL3NzdGF0ZS5iYmNsYXNzDQo+ID4gQEAgLTEwOCw2ICsxMDgsOSBAQCBTU1RB
VEVfU0lHX1BBU1NQSFJBU0UgPz0gIiINCj4gPiDCoCMgV2hldGhlciB0byB2ZXJpZnkgdGhlIEdu
VVBHIHNpZ25hdHVyZXMgd2hlbiBleHRyYWN0aW5nIHNzdGF0ZSBhcmNoaXZlcw0KPiA+IMKgU1NU
QVRFX1ZFUklGWV9TSUcgPz0gIjAiDQo+ID4gwqANCj4gPiArIyBXaGV0aGVyIHRvIHJlbW92ZSBi
cm9rZW4gc3N0YXRlIHBhY2thZ2VzDQo+ID4gK1NTVEFURV9DTEVBTl9CUk9LRU5fUEFDS0FHRVMg
Pz0gIjEiDQo+ID4gKw0KPiA+IMKgU1NUQVRFX0hBU0hFUVVJVl9NRVRIT0QgPz0gIm9lLnNzdGF0
ZXNpZy5PRU91dGhhc2hCYXNpYyINCj4gPiDCoFNTVEFURV9IQVNIRVFVSVZfTUVUSE9EW2RvY10g
PSAiVGhlIGZ1bGx5LXF1YWxpZmllZCBmdW5jdGlvbiB1c2VkIHRvDQo+ID4gY2FsY3VsYXRlIFwN
Cj4gPiDCoMKgwqDCoCB0aGUgb3V0cHV0IGhhc2ggZm9yIGEgdGFzaywgd2hpY2ggaW4gdHVybiBp
cyB1c2VkIHRvIGRldGVybWluZQ0KPiA+IGVxdWl2YWxlbmN5LiBcDQo+ID4gQEAgLTM3NSw5ICsz
NzgsMTggQEAgZGVmIHNzdGF0ZV9pbnN0YWxscGtnKHNzLCBkKToNCj4gPiDCoMKgwqDCoCBzc3Rh
dGVpbnN0ID0gZC5nZXRWYXIoIlNTVEFURV9JTlNURElSIikNCj4gPiDCoMKgwqDCoCBkLnNldFZh
cignU1NUQVRFX0ZJWE1FRElSJywgc3NbJ2ZpeG1lZGlyJ10pDQo+ID4gwqANCj4gPiAtwqDCoMKg
IGZvciBmIGluIChkLmdldFZhcignU1NUQVRFUFJFSU5TVEZVTkNTJykgb3IgJycpLnNwbGl0KCkg
Kw0KPiA+IFsnc3N0YXRlX3VucGFja19wYWNrYWdlJ106DQo+ID4gLcKgwqDCoMKgwqDCoMKgICMg
QWxsIGhvb2tzIHNob3VsZCBydW4gaW4gdGhlIFNTVEFURV9JTlNURElSDQo+ID4gLcKgwqDCoMKg
wqDCoMKgIGJiLmJ1aWxkLmV4ZWNfZnVuYyhmLCBkLCAoc3N0YXRlaW5zdCwpKQ0KPiA+ICvCoMKg
wqAgdHJ5Og0KPiA+ICvCoMKgwqDCoMKgwqDCoCBmb3IgZiBpbiAoZC5nZXRWYXIoJ1NTVEFURVBS
RUlOU1RGVU5DUycpIG9yICcnKS5zcGxpdCgpICsNCj4gPiBbJ3NzdGF0ZV91bnBhY2tfcGFja2Fn
ZSddOg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICMgQWxsIGhvb2tzIHNob3VsZCBydW4g
aW4gdGhlIFNTVEFURV9JTlNURElSDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmIuYnVp
bGQuZXhlY19mdW5jKGYsIGQsIChzc3RhdGVpbnN0LCkpDQo+ID4gK8KgwqDCoCBleGNlcHQgYmIu
cHJvY2Vzcy5FeGVjdXRpb25FcnJvcjoNCj4gPiArwqDCoMKgwqDCoMKgwqAgYmIud2FybigiRmFp
bGVkIHRvIGluc3RhbGwgc3N0YXRlIHBhY2thZ2UgJXMsIHNraXBwaW5nDQo+ID4gYWNjZWxlcmF0
aW9uLi4uIiAlIHNzdGF0ZXBrZykNCj4gPiArwqDCoMKgwqDCoMKgwqAgb2UucGF0aC5yZW1vdmUo
c3N0YXRlaW5zdCkNCj4gPiArwqDCoMKgwqDCoMKgwqAgaWYgYmIudXRpbHMudG9fYm9vbGVhbihk
LmdldFZhcigiU1NUQVRFX0NMRUFOX0JST0tFTl9QQUNLQUdFUyIpLA0KPiA+IFRydWUpOg0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJiLndhcm4oIlJlbW92aW5nIGJyb2tlbiBzc3RhdGUg
cGFja2FnZSAlcyIgJSBzc3RhdGVwa2cpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2Uu
cGF0aC5yZW1vdmUoc3N0YXRlcGtnKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9lLnBh
dGgucmVtb3ZlKHNzdGF0ZXBrZyArICcuKicpDQo+ID4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBG
YWxzZQ0KPiA+IMKgDQo+ID4gwqDCoMKgwqAgcmV0dXJuIHNzdGF0ZV9pbnN0YWxscGtnZGlyKHNz
LCBkKQ0KPiA+IMKgDQo+ID4gQEAgLTc2Myw3ICs3NzUsNyBAQCBkZWYgc3N0YXRlX3NldHNjZW5l
KGQpOg0KPiA+IMKgwqDCoMKgIHNoYXJlZF9zdGF0ZSA9IHNzdGF0ZV9zdGF0ZV9mcm9tdmFycyhk
KQ0KPiA+IMKgwqDCoMKgIGFjY2VsZXJhdGUgPSBzc3RhdGVfaW5zdGFsbHBrZyhzaGFyZWRfc3Rh
dGUsIGQpDQo+ID4gwqDCoMKgwqAgaWYgbm90IGFjY2VsZXJhdGU6DQo+ID4gLcKgwqDCoMKgwqDC
oMKgIGJiLmZhdGFsKCJObyBzdWl0YWJsZSBzdGFnaW5nIHBhY2thZ2UgZm91bmQiKQ0KPiA+ICvC
oMKgwqDCoMKgwqDCoCBzeXMuZXhpdCgxKQ0KPiA+IMKgDQo+ID4gwqBweXRob24gc3N0YXRlX3Rh
c2tfcHJlZnVuYyAoKSB7DQo+ID4gwqDCoMKgwqAgc2hhcmVkX3N0YXRlID0gc3N0YXRlX3N0YXRl
X2Zyb212YXJzKGQpDQo+IA0KPiBIb3cgYXJlIHlvdSBjb3JydXB0aW5nIHNzdGF0ZSBmaWxlcz8g
VGhleSdyZSBtb3ZlZCBpbnRvIHBsYWNlDQo+IGF0b21pY2FsbHkgYXQgdGhlIGVuZCBvZiBwcm9j
ZXNzaW5nIHNvIHRoaXMgc2hvdWxkIGJlIHJlYWxseSBoYXJkIHRvDQo+IGRvLg0KDQpXZSBhcmUg
c3RpbGwgaHVudGluZyBmb3IgdGhpcyBwcm9ibGVtLCBidXQgYXMgaXQgaGFwcGVuIG9uIGEgc2hh
cmVkIGJ1aWxkDQpzZXJ2ZXIgd2l0aCBzZXZlcmFsIHVzZXJzIGl0IGlzIG5vdCB0cml2aWFsIHRv
IGZpbmQgd2h5IHRoaXMgaXMgaGFwcGVuaW5nLg0KDQo+IEFzIHN1Y2gsIEknbSByZWx1Y3RhbnQg
dG8gdGFrZSBhbnkgcGF0Y2ggbGlrZSB0aGlzIGFzIGl0IHNpbXBseQ0KPiBzaG91bGRuJ3QgaGFw
cGVuLCBhbmQgaWYgaXQgZG9lcywgdGhlcmUgYXJlIGJpZ2dlciBpc3N1ZXMgd2hpY2ggbmVlZCB0
bw0KPiBiZSBmaXhlZC4NCg0KSSBraW5kIG9mIGV4cGVjdGVkIHRoaXMgYW5zd2VyIGFzIEknbSBm
dWxseSBhd2FyZSB0aGF0IHRoaXMgaXMgb25seSBhIGJhbmQNCmFpZC4gT24gdGhlIG90aGVyIGhh
bmQgc3N0YXRlcyBhcmUgc3VwcG9zZWQgdG8gYmUgYW4gb3B0aW9uYWwgb3B0aW1pc2F0aW9uLCBz
bw0KSSBmaW5kIGl0IHZlcnkgYW5ub3lpbmcgdG8gaGF2ZSB0aGVtIGtpbGwgdGhlIHdob2xlIGJ1
aWxkIHdoZW4gc29tZXRoaW5ncyBnb2VzDQp3cm9uZy4gRXZlbiBtb3JlIHNvIHdoZW4gaXQgdHVy
bmVkIG91dCB0aGF0IGJpdGJha2UgZnVsbHkgc3VwcG9ydCBmYWxsaW5nIGJhY2sNCnRvIHRoZSBy
ZWFsIHRhc2sgYW5kIGl0IGlzIGp1c3QgT0UgdGhhdCBlbmZvcmNlIGEgZmFpbHVyZSBpbnN0ZWFk
IG9mDQpvdXRwdXR0aW5nIGEgd2FybmluZyBhbmQgZmluaXNoaW5nIHRoZSBidWlsZC4NCg0KV291
bGQgeW91IGNvbnNpZGVyIGEgcGF0Y2ggd2hlcmUgdGhpcyBmYWxsYmFjayB3b3VsZCBiZSBvcHRp
b25hbCBhbmQgdHVybmVkDQpvZmYgYnkgZGVmYXVsdD8NCg0KQWxiYW4NCg==

------61365926C2CFE1EA607365CD37F2E206
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIOJwYJKoZIhvcNAQcCoIIOGDCCDhQCAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGgggstMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkq
hkiG9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkx
FDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5l
dHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRo
b3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2Fs
Zm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqS
vysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEib
ivHbSuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHK
RhBhVFHdJDfqB6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFb
me/SoY9WAa39uJORHtbC0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManR
y6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMC
AwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh2JvAnfKyA2bLMB0G
A1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMCAYYwEgYD
VR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwu
dXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5
LmNybDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNl
cnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcw
AYYZaHR0cDovL29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEA
QUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFu
SUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TEoGg65FWM89YN5yFT
vSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav2VuQVHwp
Tf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn
2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZG
Xq6F2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMG
quITn/2fORdsNmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmd
WC+XszE19GUi8K8plBNKcIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4
hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVnLernF6pthJrGkNDPeUI05svq
w1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggUVMIID/aADAgECAhAV
Bbr0bzRtpXqrU7KDa4UuMA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEb
MBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgw
FgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENs
aWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIxMTIw
NzAwMDAwMFoXDTI0MTIwNjIzNTk1OVowJTEjMCEGCSqGSIb3DQEJARYUYWxiYW4u
YmVkZWxAYWVycS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDD
bGac2SHb2eIa+m3KUo/AJiZDcBR5eFitNMqkBYGzLH3NwmL+2qbl5vKerZ+M3jaS
sFeMmr6P9lXTjSR4Qkcdv+ZmTUNTaJ/vLFqEgWx+sCszay9KK5TM5w4tpkCQLX1T
4Fiuans6EUUPZETMfjKBjLafMenQuGZdn/ul9a0DrkgsEe/qJUNnhsRXzY8zd4mm
mcTaiqI7elLXQelS7FUaWh/BTSjd6c+hFW8YvYxFLEsTp1di/PcBOlb9VgD4+/D4
zxHDQkfsJ7xiy/Xig3PbZmmhF/T4d9hab1YrVv1rXJqKbtjZyG7Cfsdwfz9Tsodj
HEFItk2dLR5ROV6LRWR7AgMBAAGjggHNMIIByTAfBgNVHSMEGDAWgBQJwPL8C9qU
21/+K9+omULPyeCtADAdBgNVHQ4EFgQU7sc2WNoWAgmlONb7GCP/BCyMuEwwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQG
CCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUH
AgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0
dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0
aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEF
BQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0
aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0
cDovL29jc3Auc2VjdGlnby5jb20wHwYDVR0RBBgwFoEUYWxiYW4uYmVkZWxAYWVy
cS5jb20wDQYJKoZIhvcNAQELBQADggEBAF9U2htHftfPRwJwvN9bFBpXNA69+Em1
a4zxDLR77PMBkmc8pwgbl12rBuwJ9BzUsOgeCLfdCmQiurLsnGhrvGj1JV7L1s8e
S5vKKemLAnPZJ0czTzQeIGlLY0ZAvBWbgkjmWLpsOjeZmLOOMFLTDa/5QZzDXo/E
ZmvxqRqsfirSYWVzKWdIoIbpfBIdqMM5sj/p+L9vXDle3143c+orA+1L6tp/7Mw6
tFIzedrBWu4wv4XgGb5OuouhiBL8+fzVlsY67M04A/6lQ83eJXEn3JM7GCMIPIdj
N7fLO4fWbhwndi+1xdmlTY679FwT+mpoPXVARs7OOLxuuitpqPdw4jwxggK+MIIC
ugIBATCBqzCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hl
c3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVk
MT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5k
IFNlY3VyZSBFbWFpbCBDQQIQFQW69G80baV6q1Oyg2uFLjANBglghkgBZQMEAgEF
AKCB5DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0y
MjA4MDkxMzQ5MzBaMC8GCSqGSIb3DQEJBDEiBCA1Fo/pA6ZMeM9Ew6JItjlTP2D+
BW3iibbT/IBaOj7OIzB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjALBglg
hkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG
9w0BAQEFAASCAQAF0w18h4PiDtpCL9PZLb6z4r8cv50l0ennX8rn7QQMI1UKruUZ
39nACrLi/GXCiM2lDFUce1NOijhJBE388s4xUwXoowovIO5ir1VyKaGnhW6KSlhp
2fV65h3TiuBActT2QDSCm1aqYQtESwtKgrQ785EH073/BEtD332Zj8XL7VIrnDyD
GQHEqC8EHT1HJ28mrUWle5nAV293pW3jH7IgpfWdaKz7Z5AX4fCn05gylb6Z8tyd
0CpIcNsEZxTlwtKof+XLDjqfzQw+/SjIyYgsLwLmcaJ40cWXW7/8CKMP97HilJu5
r7ON/EboyEy1ZUyv9UeoLJzomZTLddW9Fo48

------61365926C2CFE1EA607365CD37F2E206--


