Return-Path: <alban.bedel@aerq.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F77C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 11:41:41 +0000 (UTC)
Received: from mx-relay50-hz1.antispameurope.com
 (mx-relay50-hz1.antispameurope.com [94.100.133.225])
 by mx.groups.io with SMTP id smtpd.web11.9759.1648122098963951581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 04:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aerq.com header.s=hse1 header.b=nW5kLKAW;
 spf=pass (domain: aerq.com, ip: 94.100.133.225,
 mailfrom: alban.bedel@aerq.com)
Received: from mail-am5eur03lp2056.outbound.protection.outlook.com
 ([104.47.8.56]) by mx-relay50-hz1.antispameurope.com;
 Thu, 24 Mar 2022 12:41:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2XCahpO8ZaWKqxxQPPpKtYAgzhiNmcTVw5MBQFrfek=;
 b=nIWELMF+pCCb28JgYm7cx7DERoUbQFzROQavKLi1LzAzzgYwMtbUW8ug1VHZmKVIAlYGKPqP2D77l0p3+fpHgh0OmTLgujfkQy7RKMvKdlPP2PFk+kvAvXzRenjyks2Y2TzFfphpQzNwBIM8yNcr8b5ffkPs9zU85sIW30PjUeM=
Received: from DB6PR0801CA0056.eurprd08.prod.outlook.com (2603:10a6:4:2b::24)
 by AS8PR10MB5042.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:341::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 24 Mar
 2022 11:41:30 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::e8) by DB6PR0801CA0056.outlook.office365.com
 (2603:10a6:4:2b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Thu, 24 Mar 2022 11:41:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.40.229.156) smtp.mailfrom=aerq.com; dkim=fail (body hash did not verify)
 header.d=l2task.onmicrosoft.com;dmarc=fail action=quarantine
 header.from=aerq.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 aerq.com discourages use of 104.40.229.156 as permitted sender)
Received: from eu1.smtp.exclaimer.net (104.40.229.156) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5102.18 via Frontend Transport; Thu, 24 Mar 2022 11:41:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.170)
	 by eu1.smtp.exclaimer.net (104.40.229.156) with Exclaimer Signature Manager
	 ESMTP Proxy eu1.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Thu, 24 Mar 2022 11:41:30 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 5476076
X-ExclaimerImprintLatency: 691357
X-ExclaimerImprintAction: 566dab4072a54ac0be9a83e2e6c3878a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QghC1o1ypNOzDvVbzc2h862H/W6FsBOmCIOqToEl61pLDw5dJ0/COqNHWnn1tUYmqw1pPHCeMSN5/f+tOs04VqGGBMn91UjP/8XU1auIgXZO7CLCP3v7KhWIdjwl4QSxs2jG+HKHmB6RKexYisLIMz1iLjmMwEuPaDiAA3QgHm/67kWwUf27TQO0mouLAv7/LVpHMeAS/Y4cl3GmZ11ucME2AHX9M7/PymgQrDR2V3kaszUlMhB+hh2raJedTUs4iGNFPdu5LWR0+kql0HtS7t3tQYfQt67q0VsbM2h5vI+iNrobkkZo2hCg7DkhAkBcgdWc4n5y/s3GTksunm0Zdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IqVLAKaKK96zi25oh0hTb5s9/u6YXH9YU7Up9mnWYk=;
 b=fiyEefcrb88hwnDfxmgwHeGVZtdRcqp5ON5N7jObiX3ZodcvOU5adQKO/OetdJ2o7OibSGqMFcN9wEQ5pNC8eZYdWcyOHfmncGbH4GF9uBINo8SwWTwhV1hd5DtpzrfTW7DL+msgcim6ZJefwzCgkucd5KoR0s19oQJqwRHHihmLb56N7mGQN7bH5T233k+wwn6thVxeywVvbzuaWlAT9pDPvHptcdOBAU9Js+81rAUMzv8YReltfMVjE5WWoFBuDJuV7HUTAfCFEZaiyEH0zR42xuHmusgVkDegOHMY4LbEgOlCscRrFycS7nwl6Oup0f6HBO5nfESM42kHh07qKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IqVLAKaKK96zi25oh0hTb5s9/u6YXH9YU7Up9mnWYk=;
 b=KmdXJyPevdK0GgtAhEAR5yNR9HueGLnzh4F1A3FeDnzLCDi7O7Th6c4kjoqhcezDPhdC67FmaKirXpzIREeZAfd+elunmH2zETkgQlB26eR0oMNkX3GloO996EsH+u8gR2CpZMB6s9Rgm9VFTSbhUaHbm0Fq+lFlGD6tqDUBfDY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aerq.com;
Received: from AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:405::24)
 by VI1PR1001MB1007.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:69::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Thu, 24 Mar
 2022 11:41:27 +0000
Received: from AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::182e:1e00:a19c:1c93]) by AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::182e:1e00:a19c:1c93%7]) with mapi id 15.20.5102.016; Thu, 24 Mar 2022
 11:41:26 +0000
From: Alban Bedel <alban.bedel@aerq.com>
To: OE-core <openembedded-core@lists.openembedded.org>
CC: Alban Bedel <alban.bedel@aerq.com>
Subject: [PATCH] packagegroup: Properly track the enabling of complementary
 packages
Date: Thu, 24 Mar 2022 12:41:14 +0100
Message-ID: <20220324114114.1665034-1-alban.bedel@aerq.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0131.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::16) To AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:405::24)
X-MS-Office365-Filtering-Correlation-Id: 82545d5b-043c-4e9c-1de5-08da0d8b3ce4
X-MS-TrafficTypeDiagnostic: 
	VI1PR1001MB1007:EE_|DB5EUR03FT011:EE_|AS8PR10MB5042:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR10MB504254D39AF500B047C344E596199@AS8PR10MB5042.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xxAKW/R9pJTIhS45gVxXa3dTG9rfI9xqjWXe/0MIzM5niSZUfYm9VHyaHSJNEAvheGUiMbZogoBp11Wyy1iH/AmfsNtlb6H5p+NkVrr6HHyAjf4vQXC7o/WFPU4JyzAiUut+zS1q97gTpcp1ijm9NEtr4rNtDPHypgyf2x97EYGJ4MYrr9uDwBhDKRGCCF6y3bAB4yM/OgYyHICscS1JQ92FkRJU9H5d/DPPutkTGCNeCnLT9qL6abIPwOXOjiZ3eNt0gXHoNg390uJCg0wsDc1ONTQsgvBuzZrRC+Nyqxu+V8HvSmsf0wnPlp04r+WW4FDzvHDYVqUAj454Ta2yocnBlHQFaMH18I6g1UmuM1zBmmBarddk4h+P1d/L9ARoqYHl12+RFLD3jY0uhMixeUpcqRQpBNVfyFlyhz4/2Dg+Vxl2EqT7JV55JrjnkWXvssNwVHydt/0HlvqHJfNC4rhT03RXKP4LdwcZ9oOhJndig1GqM0kuF9Z2Rdp9djR2I5dDA6sXQifK1+6GR3+f1x00q6aFie1+cyt15g3JCVmwuK/zyBMVnUc8c3lSzbYagSGfgE0b2xeq6MbXEpHG1ECTbgtzgFHBhvTXCkA9N7BPDFUUN7LGrQdc28n4FB7GiFVO3zsvMRjOq2wUhiLsXA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(396003)(376002)(136003)(346002)(39840400004)(366004)(8936002)(5660300002)(38100700002)(52116002)(6506007)(6512007)(66476007)(86362001)(44832011)(6666004)(82960400001)(2906002)(66556008)(4326008)(83380400001)(8676002)(66946007)(107886003)(1076003)(316002)(2616005)(186003)(36756003)(6916009)(6486002)(508600001);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR1001MB1007
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fd3c5fa7-ac04-4f3f-69b1-08da0d8b3ac1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1xAbEc0kgYB7/Q5RvbhsNTy5KREgBN2gXZPhNEkdi7pnZv5LRoJ7WqmvYlmuqlZTXsV1gvldgPrtbYiKKWCzhUqDY0sCZ5NGjb98LB8bO3Odu6wCcWyCmSgyBwt8yLzJhAcXgdec0di/kmzpPgo0eGWs2lH1rDt2hs+mgR8WQpGAbHN4i/4ozs/gatDr0Z6Gh0ylg1BBzPBZFlPl6EMHoMbHm0ndph9Oi+2S51ws4xE9HUXqd58B7+TgjQpVhYF8rQryqCl1qCunfPo/8+EtKMEIUztuIbUBJ4egL2mc2ZFTITHYEekJwvm1oIw++rCXLZs1MgCM9yUjoNgvBdyzOqf1sfvR0kjIiLE7v1+JtWGzNNYkXzYaA5MF0AX7X+LdlEzW7rnd4FEF6s1JtlbLqS8gKEpAWwU8lLDp9yrkp/2qGyziS2RUfFX83vtbi/S8ASsefuuJ+3MTHqcYArbOSTD1rV1TEcjuKyTKP2xX/phbfgaQPvu5JTscKNIFh7MJ7UrBzZebfWpFgq3QMW22H5mf0YHQqiD63908g/8Yk+C76AdzUwr+OxwCVdK8Jyu2ZakLhEWppHfHKtvUQV76qG+SHcfN+RGY7VDil4WX2mTP2otjLafZ3DVvXI6xu++hQVUGnQk2hZWqJJzUZTwRj6R21ImKWCDtt0rvD6N12wr31kAiaiBUDucmaIoe1RRA
X-Forefront-Antispam-Report: 
	CIP:104.40.229.156;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu1.smtp.exclaimer.net;PTR:eu1.smtp.exclaimer.net;CAT:NONE;SFS:(13230001)(4636009)(396003)(39840400004)(136003)(376002)(346002)(46966006)(36840700001)(26005)(6916009)(8676002)(70586007)(70206006)(1076003)(2616005)(336012)(82960400001)(47076005)(316002)(4326008)(40480700001)(83380400001)(82310400004)(8936002)(186003)(44832011)(5660300002)(86362001)(107886003)(6512007)(2906002)(6506007)(6666004)(7636003)(356005)(7596003)(6486002)(36860700001)(508600001)(36756003);DIR:OUT;SFP:1102;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 11:41:29.7997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 82545d5b-043c-4e9c-1de5-08da0d8b3ce4
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[104.40.229.156];Helo=[eu1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5042
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg="sha-256"; boundary="----F24459C8279C3BAB4DF344CE48B35937"
X-cloud-security-sender: alban.bedel@aerq.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-crypt-policy: TRYSMIME
X-cloud-security-Mailarchiv: E-Mail archived for: alban.bedel@aerq.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
 mx-relay50-hz1.antispameurope.com with 0524C1643604
X-cloud-security-connect: 
 mail-am5eur03lp2056.outbound.protection.outlook.com[104.47.8.56], TLS=1,
 IP=104.47.8.56
X-cloud-security-Digest: bf2176691fe4ff36d2d92368de75f142
X-cloud-security-crypt: smime sign status=06 sign_complete
X-cloud-security: scantime:1.915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=aerq.com; h=from:to:cc
	:subject:date:message-id:content-transfer-encoding:mime-version
	:content-type; s=hse1; bh=OjI/DZ4SPLsveCNzOjYC0X17RlRMFrzlaZJQmd
	CAWug=; b=nW5kLKAWlc5EaPVlEHq0qlVe78MYoCP5XleIz//b9916Bor14+LCkt
	nV0Ix7HKuy2Ep8pLn2SuIoifeXXcyazAwJE/D3F1n72bkiVdA2sTuvpjkGYwDdHT
	FzunTGmvZ4qHLivzkl00GXk/dlyMaM5R/4TEWv6OU1oGdMkVim96lyrcDtAmkr/N
	vJR3oawwY6xe7B2RMkHGl6/GNb/M2smWgQM0NnxYTlV0l0jadBRa5ikuJHenT/AN
	0z1gsDT+SATxDjrr2xFaTxy3pq/4dfUMDfoR/eE1KoqtachcpE/i2XkvwYq3uKDw
	VrYMuchE76oHOfUGZnksmYQS2SjnGTRA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 11:41:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163606

This is an S/MIME signed message

------F24459C8279C3BAB4DF344CE48B35937
To: OE-core <openembedded-core@lists.openembedded.org>
CC: Alban Bedel <alban.bedel@aerq.com>
Subject: [PATCH] packagegroup: Properly track the enabling of complementary packages
Date: Thu, 24 Mar 2022 12:41:14 +0100
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
MIME-Version: 1.0

The set of packages included in a packagegroup depend on the
PACKAGEGROUP_DISABLE_COMPLEMENTARY variable and, if that variable is
not set to '1', on DISTRO_FEATURES. As this magic happen in a python
function it can't be detected by the dependency system. We have to add
these variables to the PACKAGEVARS list to have them added to the
do_package vardeps list.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
---
 meta/classes/packagegroup.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.=
bbclass
index 557b1b6382ba..cffdaadbde0e 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -31,9 +31,11 @@ python () {
         packages =3D [pkg + suffix for pkg in packages
                     for suffix in types]
         d.setVar('PACKAGES', ' '.join(packages))
+        d.appendVar('PACKAGEVARS', ' DISTRO_FEATURES')
     for pkg in packages:
         d.setVar('ALLOW_EMPTY:%s' % pkg, '1')
 }
+PACKAGEVARS +=3D 'PACKAGEGROUP_DISABLE_COMPLEMENTARY'
=20
 # We don't want to look at shared library dependencies for the
 # dbg packages
--=20
2.32.0

------F24459C8279C3BAB4DF344CE48B35937
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
MjAzMjQxMTQxMzRaMC8GCSqGSIb3DQEJBDEiBCBdS7hoZQ93LwDVVmObhDN7jo9s
++BmphSscw9G22v1wDB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjALBglg
hkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG
9w0BAQEFAASCAQARffzzZYyh8I2JZbJ+D3qJd3CEKndACTr/jrCxnNNAEtyjYz9+
elOotYFIJTViPYHr6B4809xbCdIE6DAzv4XrLAtEJ1hhFZgQr3vaa4ptWfRZN52x
s8XNILUi+wQXB75b7NBV7J7FDYlXpeq0HfzU63pz/ORa4AQV0vU+hiYGhEQsGVUP
wVb2vPQkpjlUzXQV4XqGJvTB0+p7NrUiJhZtGdHwSoyHk/vpBxYCj9i3uB6rOWZC
fl+3z/RwiZQ/wKX4tMLOzMlWuww4wUMRj6FxgeObFR8VvpJlOb1T8eQfjsQ5Chhl
HEWbPnd6nU0msFS7Tw6Zz/3X7wij4brvSA5q

------F24459C8279C3BAB4DF344CE48B35937--


