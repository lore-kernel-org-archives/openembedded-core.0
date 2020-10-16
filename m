Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.75])
 by mx.groups.io with SMTP id smtpd.web10.8117.1602824357206725579
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 21:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=D6KC1Kxv;
 spf=pass (domain: windriver.com, ip: 40.107.76.75, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0HLa94kwmv8IR9olVQIZBoFzyV/xNEWR+zIN1TMYFx2pS81fWPsEPBdMLDnVb79wPgSZrIEo48nWgM16pWegdRpX7iEhA2HdintaCDH63BpAK/Wmy9s6gNLImibXB1vmuS2WcSByauiG3ZQ6c3yUfjEJeiM0kxLI8TVqayiV0K3YRQ/8hhtjpQ2jqKgse8lpYaOEJ2ZcdwV1gAZSr8v6QeVao9b6MVz7W9A9hYChrEFT1PVlQOUb7o0Mos8hqY1A8POKjRUpmCqmx22sdZWmuv6XctyXSn+8il5i/AvnFS/VLkELZBwftPOmdwF5Qpn5H4CZ7dhVn1z1yOk/2joXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvGtjDHKq8WU/r8RxJvyHuSQ2PBlplbuJbEtdpklATY=;
 b=YqpzB5649Ha/nI00rQSRxa/M1E+NzA9ep5sUbnP9raemTfssPfw1izN2SvSYX0HRavE6v4IqpDXpA2wp9FdMFLxuThPxOK9fdvUY6Gtvvr41UypVzpJNJEvz2HC6bPNDd7e8ffbZ9Oix2UTtsQQ9M5YHQ5fy2dnflX+9aGtvwnhgov/WDV5vE/eHu0VE/2DFC5pX7XmEVmZwfFHUJXKtheF2H9/wqjqjiv4I6tHZGAf7LDZQLbnCRbbSDM4jEi7o4DZwABNzpQoBJPKI1r+tnqteSrFUn2bQhbEfUdcLQSh1XjM+w1qQI1dxv5Y4nTGB76VoubskB1gJS5y11OLZUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvGtjDHKq8WU/r8RxJvyHuSQ2PBlplbuJbEtdpklATY=;
 b=D6KC1KxvS/zf8Pctz22hZ+/+giJTpPnN1dd4dUQDSQFUCdWeEOQ2EiO5Q2Cl3qBfM0WdnsEZLh+N8suH2DLfCSY8pWAoAn4gyY7MDiRicnBGN6ng6iY3+EFMJIFxVnznDBPzwqZIkKZnQvir+x9sUqz594MbBNu/L7BOGGkQods=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 16 Oct
 2020 04:59:15 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1%7]) with mapi id 15.20.3455.031; Fri, 16 Oct 2020
 04:59:15 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] cups: use /run instead /var/run in systemd's unit file
Date: Fri, 16 Oct 2020 12:58:56 +0800
Message-Id: <20201016045856.5659-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR06CA0017.apcprd06.prod.outlook.com (2603:1096:202:2e::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Fri, 16 Oct 2020 04:59:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9d3e7ca-0b39-4e82-1502-08d871903a8b
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4845239ECFE118E30BF914C0ED030@SJ0PR11MB4845.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ICZYbsmipl2TlEw2YGcAt33zrcgUBeBt0aCuYJsZNnIgjDVdTuKCbtBn9EwrOTo2guQqE6OOo+rLYGTN88ZLMWmsEpZdZXpoqOoRJI6muZmDKZa/veYgKFDFlgYyEKQAVwD3fuAH+WOCG08gaqMIkd0y8qpZnvKhWjyNNp84ZtY/Aq2yi1oI2Eode36ddvGHmDdGeok1kEQ9XhCrmIJdGzM6bV9I36XMQzLTE/WA7sFanMn3wWWduY7Cx8lAxIoHdEuZ6zqaZ1t3a84+pAKTniE+mpFgeeSxqSy6Qj8r2zx1bB/em5GIw8NgEHdN3qy+M9iJwgSOBv2PnW2uYvoIkfZL16EaOf66+PS6sjeG2GIiwU1RjSjxF3ZCjt0hy5W9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39850400004)(6486002)(2906002)(36756003)(34490700002)(2616005)(5660300002)(6506007)(1076003)(52116002)(86362001)(956004)(66946007)(4744005)(6916009)(16526019)(186003)(26005)(66556008)(316002)(6512007)(6666004)(478600001)(8676002)(8936002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5BoNINBhO4XiJAibZf4GprezvucDe+NeKtQn0JP8N/aNvUWEnpg+KzooQCCsB0IGLk87lEK90JVf+c/Q6bjtQ6ofrslZ8cRcoX1/pvAw3sEwZj6bmtw4aVY6FkshY/BRCQ3oo/XhX90GPK7DzQOVzYO0XKawEyncwOUKhN0DWSnuXoKrnGL53D+nnPPXl6WybJrUIxwSXdyvVpxcUk7hWsqMl4LPzKOQ+sojeiuuVPxqnRBda6KCXuAAw9TKGmd3QOktNClhMRf5vjbnLuq5QbANhN79yj1NKkD895QUmjr6FRH2ozpslu77P9GaYB0nrURsGF7X8Ygwg4AdM2t8Y9e+i+aOsVg45qLKnshkQbCJTIuHxmTAMsdHElEnLK1nVSFIZ0opRAHKpHa5jOcCQlsZt7rKBmQmf4jnx5zPjyc2l2MGidF1ZipT4/BGV1dj0HmO6P4O7uQlEg86F/nTaol9nJxb/VhlcHq5l8w1a5MBf/9mp7LGMChxwUS5a3VA12HRNDsZKIDwKpym9GtntWW4ZTEuqJyDiE5AThMyTxA06FK5Ddp9O5IuCulV94chI8e2N1OhbFb8aAWx9g43S2bC6AKsUCzqVpG4GggBILFLvIvGYn7WlJ2PwSeZpYo6hQe/PY76WkNlCbptl2OLHQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d3e7ca-0b39-4e82-1502-08d871903a8b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 04:59:14.8505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TyvDTbB5A+GiN0+rlLSBIKk/ZmJg7ahaUdV9bcA0960ZhQYhgrQHr2x/NK3cLLN57d3007FKKl4iceH0lzyMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
Content-Type: text/plain

/var/run has been deprecated by systemd, so use /run instead,
as suggested by systemd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/cups.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 1765944568..87870e4aba 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -47,6 +47,7 @@ EXTRA_OECONF = " \
                --enable-debug \
                --disable-relro \
                --enable-libusb \
+               --with-domainsocket=/run/cups/cups.sock \
                DSOFLAGS='${LDFLAGS}' \
                "
 
-- 
2.17.1

