Return-Path: <alban.bedel@aerq.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93E9C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 08:36:06 +0000 (UTC)
Received: from mx-relay93-hz2.antispameurope.com
 (mx-relay93-hz2.antispameurope.com [94.100.136.193])
 by mx.groups.io with SMTP id smtpd.web12.9386.1660034163229298796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 01:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@aerq.com header.s=hse1
 header.b=JBq6HCbK;
 spf=pass (domain: aerq.com, ip: 94.100.136.193,
 mailfrom: alban.bedel@aerq.com)
Received: from mail-db8eur05lp2113.outbound.protection.outlook.com
 ([104.47.17.113]) by mx-relay93-hz2.antispameurope.com;
 Tue, 09 Aug 2022 10:36:00 +0200
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=XHIfmslPIckW2N0EYs26Pdqx8g4sYbCXt5CXM1H+G3ajsgGJE8Z4KsV23LSzkIlTNGp5o1h5cwQZCWEsr0Ad/wf1KWFqO4Wsqi9bSYkVY6wJJqjR6zoskX2RQJ/Fh2+wnrlXneiSlg/lnHBKl7coBcCm0VK5Cwu/AtGeAEfWebFfYckOiU//KY2fT643jDQsgNGpot4w/YXfSeWbqR9KK+e/8w1mZOAA0I5EWbCMNiZlwovCleMAbFokUK2MXui19oLiDg65iJWfBVAATh80BL+My1fuGqUb9EtOa7+49foeycNkyJ2f141bEDW0zLUWYE5cLpBVI2THiH/y2fn7og==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AIiNstEMU8vy6Uudu6ro0UXt/Z46QdtkDpb1ppp9Vs=;
 b=XImQJIqO4tuWV6jnZxR5lfox6J6bFGD4N5H1vL78a/LS39OxLMzeAVqzr4139aHZh9PESHADMqFAZASosw1eXDVZe/i7M/fDnawEejtYelKda8Ao0PiVY79WYIVNAQqu7JoNbbuvtY7l/Gmmq2pZkL9JW4DgCtoe1vgwUnNRvvbpo0O/JY/HwoJtHN0TAph6pEP3OOjLb0f0nPp8JOWZCn7l32A2cfQdV4t46EW2tydBlvYe6SGAfdoKuju8mF/qjqT0E1io+jSHqtpJFAE3B94ohKe8J38M3uOg2Pe/EFllGVfPoCGf2w3iJ4+sRPQrVY/EY8/SVSa17q4xiceYEA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.40.229.156) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=aerq.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=aerq.com; dkim=fail (body hash did not verify)
 header.d=l2task.onmicrosoft.com; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AIiNstEMU8vy6Uudu6ro0UXt/Z46QdtkDpb1ppp9Vs=;
 b=DVXa+dj3t4saDIjazBswyal9+FAcnAFb78PS/UFhjjAMHoCEevA7NHfM0/EeT05D3TTaxakpc+eFfp/S+4KMB/Hh+HMoi/3qfNKvnenzWS6r5ztsYVOPnLf1h91HrAa+/Yqpnfabm5QQyezsQ6cisQ5h3UDctUAAoJYB6JO+s5I=
Received: from AS9P250CA0008.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::10)
 by AM9PR10MB4037.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 08:35:53 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:532:cafe::ed) by AS9P250CA0008.outlook.office365.com
 (2603:10a6:20b:532::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21 via Frontend
 Transport; Tue, 9 Aug 2022 08:35:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.40.229.156) smtp.mailfrom=aerq.com; dkim=fail (body hash did not verify)
 header.d=l2task.onmicrosoft.com;dmarc=fail action=quarantine
 header.from=aerq.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 aerq.com discourages use of 104.40.229.156 as permitted sender)
Received: from eu1.smtp.exclaimer.net (104.40.229.156) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5504.16 via Frontend Transport; Tue, 9 Aug 2022 08:35:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (104.47.14.52)
	 by eu1.smtp.exclaimer.net (104.40.229.156) with Exclaimer Signature Manager
	 ESMTP Proxy eu1.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Tue, 9 Aug 2022 08:35:52 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 7545130
X-ExclaimerImprintLatency: 557884
X-ExclaimerImprintAction: 9068a2a0b5ca4a34a653a27223d1de1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sx/n1f0z19nQuZDvL40tMqhCJ2deG2PVq4OgGIhkM6Y+ML8dRiRuGb0u9OCczw6Pr+haHRdRPZ0u7OGqoClBzZCSJaY1s/KEWppuRw8jcxO9qUB9pwLl1Y51ZzPXAOjbeBg7eBVivrlPNiQGnLW3VGg6t2MUC77uIkA8N60pycuqQwkX7tYqOAHOF5RG0gzxBNAOFq5Oi49hf4JvRNGq2rkjETZTGtbWUeJC1ZiiabzquD6kTkAUSNGfnXgcaupL0eHxtBTDr/v9aVp3sKwuN5FvM9HK53gJLl/wPtUG2czvLof94Uux6OHRvro/JVhlcBdTusiWOrljVMyU1EJl4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pA8r2ls2EU7YlpIOacaX8CfwEir8BBzb45gB9o3+5Q=;
 b=NbP0wvT7SO/h8FRzjHD8Ryg4OJXUv4RWgDo4+5tGLIyTPBC4HTkO1OI9LBGabPXTF0CiTfLmJM0pRddz3eVOP2QAamfxql0nQqyvT2JOtRWQxiYyHLwKrhyjx4RF9loqDBkE7t9jMk7C1NDA/Nc8rml5U4R5SQBRCe3MrhJClgjjmJvJoPSDrcFqbdHKp0JvsqVdELGsas5ttiDhFfwetDMnUSkCeAfbcKkZ6y7ITcn0FW0BTJp/AELM7f45MGYCcaBlaFimC58hjW+QvDoWlT/Q3Zbeqy8rHB5iVaoLloYNi3v8pqQYrnEkRqUWmcHqkwpbT40bzIBI1FWNL54z4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pA8r2ls2EU7YlpIOacaX8CfwEir8BBzb45gB9o3+5Q=;
 b=dzm4gTfKU6xXimMXrEVJPEYWoXMlAOVppCzbLHEVllDZnCA/5qnUtdU49cFXwQdB7Gta2ORh5tz16bFnUAKtKh7z/cJSrBAC60DuPM5lb5p9TnnMfDI+e7AoNt+h1kA5gVimh0nNq6gP8MtRGYJOejXrtRuKk6cM7cBPWWhCu3g=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aerq.com;
Received: from AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:405::24)
 by PAXPR10MB4962.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:204::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 08:35:48 +0000
Received: from AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c38:536b:7cd4:5bf9]) by AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c38:536b:7cd4:5bf9%4]) with mapi id 15.20.5504.021; Tue, 9 Aug 2022
 08:35:48 +0000
From: Alban Bedel <alban.bedel@aerq.com>
To: openembedded-core@lists.openembedded.org
CC: Alban Bedel <alban.bedel@aerq.com>
Subject: [PATCH] sstate: Don't abort if installing a sstate package fails
Date: Tue,  9 Aug 2022 10:35:27 +0200
Message-ID: <20220809083527.1221635-1-alban.bedel@aerq.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::6) To AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:405::24)
X-MS-Office365-Filtering-Correlation-Id: 0775d885-20f6-43d1-8437-08da79e22bb0
X-MS-TrafficTypeDiagnostic: 
	PAXPR10MB4962:EE_|VE1EUR03FT043:EE_|AM9PR10MB4037:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 f0/JEeKjJbsYvxOUQhatgS7tVi2aHD0w4w++9uR3u0OvmaBGx/hj+k5uSjBY2qN4OFmlWvHH7/4vJAmLlmYgnJFPUao1sdzUOZD8z7FNTEAaruPzML2DaT0YKYeL9Ty5LbPu0/FH3R3JfL7yzPtkcab9znJLXUf8qAk3bzKTnx6vutaSb8nQkF7/qhxNPzoH+jWf5C7r/R4fojm5OfSOUlmlb0wWAv9/UpWmvXJt9bmmHROfOKhdf/GkwDb8tKGs3MO5FZN2DjeOpxzxjsJ1d0dmN3XUl5yCIPdTXSMLmlA387gzrifnUJ+SQHY9qSmLlHCkWUaKy6FHb98L/VN1b6wb4rmUfDBVTX2V4hutE7q3gaAXYztwJv4pGLjbNCGIkSCMABRzanlQZKSCZIJnL6SVgoN9Dl/T2KKTmMhGQVpzgg5nejhOHsgidxKZ1t/WrDRsXNd09jKJr3hCNKiMRQTXkWzwNfAzM2OYT8BjGIWg9FdIbcl4PbcBJD1sd+03erRQyRssthBiUwNnkhuk/fBBwy2M6eEJkXsPRQYZ/im10v4YEv2KC00wFs/hBfqq++BNwaozzoLFE/UMVM+tWrSiHVFDAS+JebMRMTTaNvD9nkGV/PL+hDvSxraf8vhUT7waNRixa8RpPsOulFrOXnFLbv7+eYgQ6FcfsLU+u/IwOzI6RVZRM5jSnG6NJ2PCYDVDe+r3M+tkZ5zEorAgjRLM9jebqmG0CAO2ZtoNLRk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(366004)(39840400004)(136003)(2906002)(36756003)(38100700002)(8936002)(83380400001)(44832011)(5660300002)(66556008)(6916009)(6486002)(316002)(478600001)(6506007)(186003)(107886003)(82960400001)(4326008)(2616005)(8676002)(6512007)(1076003)(52116002)(66946007)(6666004)(41300700001)(66476007)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB4962
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b232c97a-11db-4589-d3e4-08da79e228de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qs9TdwD0IhCzqh6hgi1zzzBpAk6PGGnt/52jvSN0AtjfERVibmXAWEvvs59+x7F5esJmFXdPxd3uecGKQ6AFa0kTQbWWoDN3HRzoLguRrSyCzVtM/PE/S3KSvivKPN5DzURsjiRxibQvRMrNmSdMVCFOk3kP1kgGF/sC3K/ds/o+3MshQtyyaK3fHpllxQyNT9QXukaMtU+4P7v/8lZAdi7Z+oUre+xUw7u3il65Golrk7CkN0aUKIUD5tsLHArYr3gcByrgvrIsKDAowEdr+UDPY2dv8al/N7h4kcoHfXeI5nXjiddQ+LMl51urd4JZMrvV4F4sWmk4f+5wzyhqiXoBfqMBq4Fnfgv69h5mQXki39j3pNxIvc7UXPG2QXRYYyV5Mdq09AlIpfMATsLqILezUtGmx4rhnj1fdTnfeJpu86dYF+fOP5m5B34ok2tU0y7AgvagmlgaczaoAlukCnaLBB3N0SJpYl3w1ivTYfxvifQJ9gb6AE5Wyrmasb001+SoSeLJuZuiODbMDW//Alz9CJY4Xw+0y7bnoTCf+4OYo1aSvHHGFJ9ynPyfXn5KrIRX0MVVivq40GA4qRF5tIfwKX8TiPkbyDvP+L2dxsAPlQSLGaSDJIKfgWbXYT+53UO1DSJdkaEWMpdoTXI4w9O9X14o1vq1ixX1aurWtRlZk+4KyXepufD3BWK/C0nyKnHE3DiiYxRfPD2DoXr3adkgDUStdD6Vcy98KrjFl0xV1sSFdHFLL29E7GW+4gaY92BoT4JYrTjhqSG6yBFtjg==
X-Forefront-Antispam-Report: 
	CIP:104.40.229.156;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu1.smtp.exclaimer.net;PTR:eu1.smtp.exclaimer.net;CAT:NONE;SFS:(13230016)(4636009)(39840400004)(136003)(396003)(376002)(346002)(46966006)(36840700001)(26005)(41300700001)(36860700001)(40480700001)(47076005)(6512007)(186003)(1076003)(2616005)(6666004)(107886003)(36756003)(6506007)(6486002)(83380400001)(6916009)(336012)(316002)(82310400005)(70586007)(44832011)(86362001)(70206006)(8676002)(4326008)(478600001)(5660300002)(8936002)(2906002)(82960400001)(7636003)(356005)(7596003);DIR:OUT;SFP:1102;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 08:35:52.6717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0775d885-20f6-43d1-8437-08da79e22bb0
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[104.40.229.156];Helo=[eu1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4037
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg="sha-256"; boundary="----9C9411957FAEC71354219063C0F256B3"
X-cloud-security-sender: alban.bedel@aerq.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-body-digest: a81e2da104122f57408cb18dc0d7a8f1
X-cloud-security-crypt: load encryption module
X-cloud-security-crypt-policy: TRYSMIME
X-cloud-security-Mailarchiv: E-Mail archived for: alban.bedel@aerq.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
 mx-relay93-hz2.antispameurope.com with 142EC1CA687D
X-cloud-security-connect: 
 mail-db8eur05lp2113.outbound.protection.outlook.com[104.47.17.113], TLS=1,
 IP=104.47.17.113
X-cloud-security-Digest: 24adff15771f3f7e2f82d868cb79a4e3
X-cloud-security-crypt: smime sign status=06 sign_complete
X-cloud-security: scantime:2.295
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=aerq.com; h=from:to:cc
	:subject:date:message-id:content-transfer-encoding:mime-version
	:content-type; s=hse1; bh=TF+djlcgM7TNsQso/5KsJb5cqhzRcySqxfEVJV
	o0t+k=; b=JBq6HCbKIjML88n4ks88zMWCFf9IiAZJV6TAlh/0GvRKZlP/4cqJL9
	BCeaSyY0VjISFD2I2JZSmuT1VAWKegDsltF3r0MWD/KG8HNH9E+q428BdGblnNDq
	AblcApRtc6ealR8m6gVgm/YdCbGKaVeCeEkf46MrdNtuKe1OfVIETHfCSvjZglLR
	nkEQiaI4PUIcvzwMOvClC2cWD5C2Sq5IAPUgbVTpezc10pFnEeKDV9VpdAT5cs9A
	q/sQ/OP8zfVg/TLA1+Gvrqg+ka51Qk2viLFpHhA0A5bHW+BM5UGv/c4PvkD3WNO8
	pP1urQ5hkQy5baKHeRc1WStjxZZiP8Ag==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 08:36:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169140

This is an S/MIME signed message

------9C9411957FAEC71354219063C0F256B3
To: openembedded-core@lists.openembedded.org
CC: Alban Bedel <alban.bedel@aerq.com>
Subject: [PATCH] sstate: Don't abort if installing a sstate package fails
Date: Tue,  9 Aug 2022 10:35:27 +0200
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
MIME-Version: 1.0

Currently if the installation of a sstate package fails the whole
build is aborted although bitbake could just fallback on running the
real task.

To fix this issue we replace the call to bb.fatal() in
sstate_setscene() with a simple sys.exit() to pass the error to bitbake
without aborting the build. The error message that was passed to
bb.fatal() is just removed as all error path already contains a
warning or note.

Then to further improve the build resilience we add a try block around
the sstate package unpacking. If it fails, for example because the
package was corrupted, we now print a warning and optionally remove
the broken package to allow it to be rebuilt. The cleaning of broken
packages can be disabled be setting the SSTATE_CLEAN_BROKEN_PACKAGES
variable to 0.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
---
 meta/classes/sstate.bbclass | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index de6e7fa9608a..069901483bb2 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -108,6 +108,9 @@ SSTATE_SIG_PASSPHRASE ?=3D ""
 # Whether to verify the GnUPG signatures when extracting sstate archives
 SSTATE_VERIFY_SIG ?=3D "0"
=20
+# Whether to remove broken sstate packages
+SSTATE_CLEAN_BROKEN_PACKAGES ?=3D "1"
+
 SSTATE_HASHEQUIV_METHOD ?=3D "oe.sstatesig.OEOuthashBasic"
 SSTATE_HASHEQUIV_METHOD[doc] =3D "The fully-qualified function used to cal=
culate \
     the output hash for a task, which in turn is used to determine equival=
ency. \
@@ -375,9 +378,18 @@ def sstate_installpkg(ss, d):
     sstateinst =3D d.getVar("SSTATE_INSTDIR")
     d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
=20
-    for f in (d.getVar('SSTATEPREINSTFUNCS') or '').split() + ['sstate_unp=
ack_package']:
-        # All hooks should run in the SSTATE_INSTDIR
-        bb.build.exec_func(f, d, (sstateinst,))
+    try:
+        for f in (d.getVar('SSTATEPREINSTFUNCS') or '').split() + ['sstate=
_unpack_package']:
+            # All hooks should run in the SSTATE_INSTDIR
+            bb.build.exec_func(f, d, (sstateinst,))
+    except bb.process.ExecutionError:
+        bb.warn("Failed to install sstate package %s, skipping acceleratio=
n..." % sstatepkg)
+        oe.path.remove(sstateinst)
+        if bb.utils.to_boolean(d.getVar("SSTATE_CLEAN_BROKEN_PACKAGES"), T=
rue):
+            bb.warn("Removing broken sstate package %s" % sstatepkg)
+            oe.path.remove(sstatepkg)
+            oe.path.remove(sstatepkg + '.*')
+        return False
=20
     return sstate_installpkgdir(ss, d)
=20
@@ -763,7 +775,7 @@ def sstate_setscene(d):
     shared_state =3D sstate_state_fromvars(d)
     accelerate =3D sstate_installpkg(shared_state, d)
     if not accelerate:
-        bb.fatal("No suitable staging package found")
+        sys.exit(1)
=20
 python sstate_task_prefunc () {
     shared_state =3D sstate_state_fromvars(d)
--=20
2.34.1

------9C9411957FAEC71354219063C0F256B3
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
MjA4MDkwODM1NTlaMC8GCSqGSIb3DQEJBDEiBCBE8uUnOFR4cR5YGictEfig6ym+
vrgKXFShWNVs5um7XTB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjALBglg
hkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG
9w0BAQEFAASCAQARUOS2ljjUF0EAsqfOlP0GM41ECLLc1uPq4up+jgZKiUJ4ZMO5
Z+Zw2Ugwc2keViLxngvDmpEXSEzUdF5AREtU2NEwPpEcy5Wp0eNW0wHFS9AfHylr
hlC1T4lrO4W+c+v3k2Lru+/GmEHtQ3Eh+ls84ZD6Or66qvgiLZsAszQq5KmAJ5CM
ve3gLXiwod73HKyst/he+qua0VUi2n9p8fdzaKANRaXLZihJ/0SU2TQe6ZpLZL/b
WbkCL7/Lrn1OV7IpJJvJniXwciHzWDUFnMJVthjSXk9MhguuER4YFYSdR4RxTmH3
xRQpQe9GPANH1UlMIu7vpON/FjXwFJ+IP2RG

------9C9411957FAEC71354219063C0F256B3--


