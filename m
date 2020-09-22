Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.952.1600787728540473183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 08:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=Q8UiMMCm;
 spf=fail (domain: prevas.dk, ip: <nil>, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZ4nkYIIg5Xpv2Ab7ZGFt5TvKV20Pled35oG3BLau4qmNNL0BubSm25Fz/tjtUZ/QckMUJRGC4fYOMPTErHOZl15SpH10RnMQFh9zY1nN37nCY074hwA+/JnL9Ej149R13zCwlhwu8+Av5KFBt/AAU1MvrD28BCz1VBEQsahT3A3iBLBDXinkhGfkqzvr16Gsm0wWkwVJ7ep/sXJxZOqC/UpUZZKEjd4IFKyYYEdiIigB4Inx2vFq1q1iVeAv1c9x34nIq0o0imCU8Ohf7r0+iy+w/YjB3OFZ2Un1KvdLmze/Zolm0+wV8i0VSmCX1wyGrCAxc17OJ6F9PdbmJSvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2QVyJ5cF5Btdr9/GbT/yFnBqv8H7yopqqMQ+ZkPYGw=;
 b=gyqOVpZrxIB0UwIuPiXyUEmLnj6sVnPVXLy7fhWHwCQOfN0DD7KNnxhnS95xHgpjKzArymzNtfdoRjoZSKBoCGtfxqgqG+nDYynhyatoEdMK885oXvTZJ5EPXje10Dtmd937V1Sl+o4A8bXPtZP9qp2Tw5JQbOQ5wFsT6wP4sqfqj+VcdLnTb0BqdlK7G9wKBTVlv1XNp/HFGrd4rbZRrn8w3A9lqJKz3Wy1Hx5yzJsvAnDdTazAi1kaHdY25cJXuy0xLal0DvT4gWZBVVGRHK6yl8bK1upmjlnJBY71VJ1pUFeRMvcVi7J8uryZxHPRGuQOuGWK9DC95v0ugOJ+4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2QVyJ5cF5Btdr9/GbT/yFnBqv8H7yopqqMQ+ZkPYGw=;
 b=Q8UiMMCmuARKOpikD5LIlYSNPIA0KzVGAkCzG5XQrO+efFMybSUplaISLLlcFZjNc8xBjWdkgqoEGsPnDIr4DfeHP9FGGn82UIAq/iLzhGnfyBTj7FQ0x1cSr4wM60k7zi4bIYpAFFU7PON77SPvBuq2t1zQl9LZtaD+YCR7SC8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3441.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Tue, 22 Sep
 2020 15:15:27 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::19ee:8c9b:b371:abb2]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::19ee:8c9b:b371:abb2%2]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 15:15:27 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: parkch98@gmail.com,
	Steve Sakoman <steve@sakoman.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [RFC PATCH 3/4] kernel-yocto.bbclass: remove now unnecessary externalsrc workaround
Date: Tue, 22 Sep 2020 17:15:17 +0200
Message-ID: <20200922151518.1615-4-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200922151518.1615-1-rasmus.villemoes@prevas.dk>
References: <20200922151518.1615-1-rasmus.villemoes@prevas.dk>
X-ClientProxiedBy: AM0PR01CA0131.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::36) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (81.216.59.226) by AM0PR01CA0131.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Tue, 22 Sep 2020 15:15:27 +0000
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04525a70-9b55-48a0-21b6-08d85f0a564b
X-MS-TrafficTypeDiagnostic: AM0PR10MB3441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB3441B893E8648B54A896390F933B0@AM0PR10MB3441.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9he3FRt0aar1XGGEJU5mOew/5bcudhpNf4h05A9cSDL6Qa1lzRiVGOMtW4d8uO2zZp+9HDvnrhkdIHQm1AdppifpH8da8kY4fWL8Fnb0soZT9yDVNr5GsxvxkeRnh1lK4pYSE3FHWi2UF9rB6SKcRorVwXi+tJnxQINID440XqP3czu0evn3Iz4NgGP5cNqiV7PvPR+xPJpImhMmhJrRQGQM624vb1QqXoovp4WWP1wuCmah344CrjucihKCqVWibHs4E1k7tja4JZGToO63Fj4WE7OV9RnmUYc7g0UfN4KkpqshjRy28If0vWthc4Wi2SRXhNbXkky+PEg59KZBcRqovkjBSStWeHlLbn6lekN7YRIZhlAPy4gOv0ds+zNo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39850400004)(396003)(376002)(346002)(366004)(136003)(6506007)(36756003)(186003)(8976002)(6666004)(2906002)(107886003)(5660300002)(1076003)(66556008)(6916009)(8676002)(66476007)(6512007)(478600001)(26005)(66946007)(83380400001)(956004)(86362001)(52116002)(8936002)(44832011)(54906003)(4326008)(6486002)(2616005)(16526019)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	c/XZ9wj6+qWZ+62I8+Rrq4pDttpar2RFsmyryRAauDN8zUyV82Jp4n96pYSwZ4pvlQ8ORWHZ7pP1LEvHN6wZcie/+eeMPFztM/OrKAsiPukXgb/L3nKrYSjw69gOsBr4Ve+cgSJ5BopmV3SWHPNhDCKkIbpTJgi+ERRIeotY17Kvdjp9R14qTox6nreVgqxKksKvfgOlqRysx6KyoCxLeyWZbcs3vjYPCURjSgD7Y4mURVfMH21RG2e/n2EEhlLwIRRhVSzfWvZxsta3XKXL3yz8sFyHBSgw8SGfKrj6+s2h1U2UBXSbXCx9Fc+9B07JncrerY4pyBtQq78kwBxuhccBCHyofUMcc3p3XwEEhp2MJxYJiK4KJ6WiyhfNamWvigOE3HHyTZ5V+M+oqidzfPAH42EvixNA+RqDVnVac6m0lnMrySKvQTJssUknW/wSyFOvHESTUUrO2fAUf9GJiZgRpUTOH/2GrJcz1nU6XxPQneLEKcgjieTb9bgBuK2TlAhoOboyZ47PplRyHDjcy4yzaW7Icbcdc0/rQ1urXaGLYRdT7n/QzIvpSl4uyQy5j4ynWbukzCfEiVSCIBn4VJc+Hwz8X9aW0HPWN49tLXddzmWf3A5xSZsxM61aSosIKiYDG4XfW8yYE+eStRab/A==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 04525a70-9b55-48a0-21b6-08d85f0a564b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 15:15:27.7080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tRBHMYbZsmOEciB5Yi0QEzahjIWfcExWLtIHmrec6Ez2dJZSve8GFq25y4jdPNWLqyoiT59AGHUFLqZoOZ0hUleHa+Yk2BZNkWQEgOZ+KE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3441
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Now that SRCTREECOVEREDTASKS gets marked as noexec rather than being
deltask'ed, do_kernel_configme is still ordered after do_patch (and
recursively, after do_unpack), so this workaround is no longer needed.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/classes/kernel-yocto.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.=
bbclass
index a35c5923df..741b0b961c 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -656,12 +656,6 @@ python () {
     # If diffconfig is available, ensure it runs after kernel_configme
     if 'do_diffconfig' in d:
         bb.build.addtask('do_diffconfig', None, 'do_kernel_configme', d)
-
-    externalsrc =3D d.getVar('EXTERNALSRC')
-    if externalsrc:
-        # If we deltask do_patch, do_kernel_configme is left without
-        # dependencies and runs too early
-        d.setVarFlag('do_kernel_configme', 'deps', (d.getVarFlag('do_kerne=
l_configme', 'deps', False) or []) + ['do_unpack'])
 }
=20
 # extra tasks
--=20
2.23.0

