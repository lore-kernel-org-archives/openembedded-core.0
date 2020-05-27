Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.105])
 by mx.groups.io with SMTP id smtpd.web10.2906.1590602911406038133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 11:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=SoJzdJx0;
 spf=pass (domain: outlook.com, ip: 40.92.16.105, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0w61lt29jDDaimJPMf1f5r5AALAtxvSwrAp+a1KvIgRK71XZ4Wfhi4KE7YWLFJSWYCwTPf56JnxgVYJ/c1PvZF3JYRQyti4L3MATFT8ojA50SuEr7l0nD2rQjMmzVXundotekxhCWQ4oqCbGqWArD79gL8/fvF41NH2fY3Do20D1MMOwDyOSCENrSP+buX28JFCwVTmTKPXvytnaFXIki23p++AsNOhG5bMfZWKtpVVZL3sWqihwPQv+34soILnqGhi7jqhahlowtVOuqP+cdIxuBA71Z3Bde3jvVPnP5L3sJs1z4msuaQ6LQGdMmtZZ0jfoRSiZYEyoeUlUSNsCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xpDBbgZGOnjF5L3PPXgD37Iqz3TzDvX3BthNSSeZxw=;
 b=E2sp4vxB53j+ljtapyb4zM58bIGaX+ERJzNHBCphl9ox7sjNZNjm10Q6UOwBxfj3FY5ETgjTWMpBXEBuknPEgLmuYwzwgSo35b3k+Z6QcEf3zTDS5pvh13ylIKeW6QgwrxEYhtbP+kSFYfeiXeqiMpM7ud8+i4zpUQU47g5eHJeUkUVd7VH2hJchXFZuVQl7XJcpwHFI4nOzGNaANihhn/dAwf38guer6SA2zd0bpETKe8KX1AWlsyLPwEZss+a63kspUkd/fsz/n587pQ/OAbP287JZOhbf8nkS+ax2HhpThzp4kiHX6Eg8ouZXlwXFXxO9/GufOmObuCL8RACmsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xpDBbgZGOnjF5L3PPXgD37Iqz3TzDvX3BthNSSeZxw=;
 b=SoJzdJx0kEMPlmjJgkNLf2clp9WDS67CbBi9EX4k5VsO/Zhs1srYhQZ69kkaUu7Zc9IwqJ9B8BBfZgFuI8A8Fo38J9Cdmiun2r8xM89OnlIspQQ3FUjrv5SUqv6PJ/JK0uRPeLpaDWzbTSO1den1ja28J6AsSG0K6tOATSQKdX8bnlsv4RFd6B3NqluBVF7TbtyeHS1TPhz4dgBuLHy+NzQShJir7tH+Bj9Cw++nRe08oUXTHPVPpInp0xQ8PknvEM9MSd7NWSyh8+j2rXO9nvtIKs2bw9vB8PM5lv5ZVMfSH8vvUDBz6Oqtr8MEGYQGlihrDAhsZkcRLlZ3p64crA==
Received: from DB8EUR06FT021.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::47) by
 DB8EUR06HT108.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::415)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Wed, 27 May
 2020 18:08:28 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc35::4c) by DB8EUR06FT021.mail.protection.outlook.com
 (2a01:111:e400:fc35::185) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Wed, 27 May 2020 18:08:28 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:B9AD417407CFF17CA8B61B774A26D7E7FB65245E7BCD7127B5F36F100400AD60;UpperCasedChecksum:D7FAA5170669B10335287D60D22242CF016BD2016483F4154E25A369A356DD78;SizeAsReceived:7460;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 18:08:28 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] qemurunner: fix ip fallback detection
Date: Wed, 27 May 2020 20:07:58 +0200
Message-ID: <AM7PR05MB688189D4BE75ADA25C483E95A8B10@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM5PR04CA0016.eurprd04.prod.outlook.com
 (2603:10a6:206:1::29) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200527180758.21879-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.32.141) by AM5PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:206:1::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Wed, 27 May 2020 18:08:27 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200527180758.21879-1-kweihmann@outlook.com>
X-TMN: [eL6vuLb7pBhS1T6JTRPHAw2NbAUUK7QY]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 2e519395-f6c1-49d0-0d8b-08d80268f4cd
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtzOb0hghQ0oanQPJePt1aihKLc6r/1S/KFf0yvXsxkJpPUJbFwRKETTK+Bvzvr0CNLIXsQYSsQ4lHLTFlJdRcgp10Me13e9hGMDSafbl8lGHg+mHOmw4awJsnNI1J5zlWT1vY3yIR6ijWJVL1OML1SId9nH5ahkKyObAa7X9zc9FQP5V5Yo+Ln9ifoG8F6+W9MwTQYCW1PtLvER8QjxE3KzuhslsFxWUeTS8dNXTNYcJ+kNIEevc8RQCQMPe5xEKRypsJS8nrT2fmPuPgAUPET2gntCpkePvrp2G+ICqJYz1uujTG2DDEi2wEGUNAb7IR4aK1LGfitfe9WYJ3LZTYPMISqaTdCrp37P7OLLGDfcDsEc5LNVCp4OlgsrlwAgrZx2BdiTzKN8pQsLeAbxmiIr3GkoqJWtDBxvlqumxQWtdx9BGHFKHzE0ALsO1DRKGkfXUKCF0egZUAhC5WxUDyY4hr8P8TD9bgrj08ivS3BfzKsP2jCMufkpreNS5fdGGuuxrUrhm9uc4qC3UJjFpdSXkagd8hOqxzZHi9EwTJHaSMREtgJppy63OZJ5jfwEKHXrAcnE5YZaQnzikn067amT3DV8UlZepf+ekU7SIE0A9y2/7EZ9uxyGfnbbBXOFkjXZXn7LZ7VgkJsYGXy84fc8+A1imjPioAaXdnQTpxfEoFho7F1v1J6CmSME2YayWu1BQ/AwO5dE5FKDLdqSrF9Zw/+xxr11S9P5V13e9AcnRg==
X-MS-TrafficTypeDiagnostic: DB8EUR06HT108:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1ILFlOn0nNJFGkA7wVyh+FTs5/I9obCKc8z1l4EEBHlB+8kNPPFjC3Oh0NM5r+4V7E7Iew+IX761xAnxLB3riD49pepOiqbfrWRd2wjCv9X/7UHHj4CKVV/31TMJk0W+XPkSuAi2LkJaC0d11md3gp4cJ+TKmt1XMm3MLKYwsR0DQhRHrd8XL5ar4ArmEE0XgJlfdsT3NqP6R2d6rarygA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	18svww3UtsNzTsDxVIikLE3oCtelDcVLAgaQepZSnY29Ui6QYlxuC986ByMoTOEeM4RcMNQYSBLBgW9tx9H5V8giBV3QNAd3m9VfVizdiXG2XkU6G8U7ZdbBbEKTYdYxARRHYHEVPcUMmczi2JOOpg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e519395-f6c1-49d0-0d8b-08d80268f4cd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 18:08:28.3174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT108
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

When falling back from detecting ip from /proc/./cmdline the
output of runqemu is acutally
'Network configuration: ip=3D192.168.7.2::192.168.7.1::255.255.255.0'
which doesn't match the given regex and leading to run failure, although
IP is detectable.
Fix regex by inserting an optional 'ip=3D' prefix to first IP

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemuru=
nner.py
index 4b74337652..992fff9370 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -290,7 +290,7 @@ class QemuRunner:
                 self.logger.debug("qemu cmdline used:\n{}".format(cmdline)=
)
             except (IndexError, ValueError):
                 # Try to get network configuration from runqemu output
-                match =3D re.match(r'.*Network configuration: ([0-9.]+)::(=
[0-9.]+):([0-9.]+)$.*',
+                match =3D re.match(r'.*Network configuration: (?:ip=3D)*([=
0-9.]+)::([0-9.]+):([0-9.]+)$.*',
                                  out, re.MULTILINE|re.DOTALL)
                 if match:
                     self.ip, self.server_ip, self.netmask =3D match.groups=
()
--=20
2.20.1

