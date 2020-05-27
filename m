Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.704.1590559606905396081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 23:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector2 header.b=ScRvyE7J;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 spf.creamailer.com}: limit exceeded (domain: vaisala.com, ip: <nil>, mailfrom: nandor.han@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMUAtdY6m9x+9mat0Jn+mbe+uY3B1J1IXvvyRPvVKHGRyi99shhjkYRsRKaX609rZooqQfz9oPi1fHKmNeSshfrBqeYrydCO6+jh3TK/ZR9ZMrEkXPMCArSsQI0VjkHa26ZzGWx6wEQdTKYEolLSzzpl9aGC8sgYbxlmeGbu2+rH6hOHIPDXwmMz1iRZly036gM0IJ/zcgiYV6SgjoT0gtComLKGVG4TOL8TshljcVaFhbgu410EhDecIejP+r/Lm8N111gL79cbyZsVNQLQHeJq7AF3Q33IKrs0r0+KZ3Zd/1BXdMHIfJBA7jeE8b5o4ldOdR5xqcA4oQZbCjlZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wicAuE1p3Llz380WOqJERjf8nsNlSP2l2X5+fkYNeUg=;
 b=jXfsJqH3ZLdS73R3pfvuS4kcRM8wd7olvr+4+s1bnNoeU/1QlNXHU26jnfIGsmtjbFw6DvKsuiz64dCSA1J+qJ6xBEjrmpHzRf4K65Z0KFpVaX1WnWI38zdrmbGcFPkpu+HCDv7yhnM7tTCa+pe6hCJFvftI1B8EZgFxYV2qoSPriSfEyUkrssPzokwWMCHd8gex2JFfPRCRHcalNVa0i7y72SwX57MynsaFvmC44B2uM+0EzRnJr0b/wuPgSMjAtQyi2VqzVtWyrE1PK0LEK3Z4/DekVSwP/+nKT50ADHtTdgZmLVZLdPsOFNfLGF3W3wyPLZbygM4gOPrVPqymjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wicAuE1p3Llz380WOqJERjf8nsNlSP2l2X5+fkYNeUg=;
 b=ScRvyE7JNev1ALZhnWDYX8dnkGpN0jAu3ygvwZvz/lesHFnZorB5TXyir8e7a5GR94E0JkLF72r/rIxqDibB6yYn0bU/cOypZpzR+qx0h7Ooyk4A1UsmmLPytrlynewyTwlBeEXhtE4PdKcICDFQyQqZUomMbrp8i8s6tuLGyPE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com (2603:10a6:7:8a::22)
 by HE1PR0602MB3257.eurprd06.prod.outlook.com (2603:10a6:7:24::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 27 May
 2020 06:06:45 +0000
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::a972:752a:8780:fe40]) by HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::a972:752a:8780:fe40%7]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 06:06:44 +0000
From: "Nandor Han" <nandor.han@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Nandor Han <nandor.han@vaisala.com>
Subject: [OE-core][PATCH v7 1/3] python-fdt: add a recipe for `python3-fdt` package
Date: Wed, 27 May 2020 09:05:59 +0300
Message-ID: <d3fb2feb20c81d92f54cd09bdca2b095cb6954b9.1590559408.git.nandor.han@vaisala.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1590559408.git.nandor.han@vaisala.com>
References: <cover.1590559408.git.nandor.han@vaisala.com>
X-ClientProxiedBy: HE1PR1001CA0014.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:3:f7::24) To HE1PR0602MB3449.eurprd06.prod.outlook.com
 (2603:10a6:7:8a::22)
Return-Path: nandor.han@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.vaisala.com (82.181.11.213) by HE1PR1001CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:3:f7::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Wed, 27 May 2020 06:06:44 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [82.181.11.213]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf91e5dd-445f-440c-d682-08d8020421f5
X-MS-TrafficTypeDiagnostic: HE1PR0602MB3257:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB3257911EDABB33D0760E666085B10@HE1PR0602MB3257.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 04163EF38A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iS1qnOOtng2mr4p/YJuOxhdcnANT9UfWFjzy726m6TFwwmXPVtPam9EeJ/PXBr1Pd5nLwp+03NX0w8JP10HmNFG7Zwm9hAY8wpmv4Oy2XnvOShaAkjQo8w+2PutXbEdsCck3bbnzpZNJzTnPzLGOALGFdMH7eeoKX4Fw93bvQdvE9ODt/T7UbDV/6AOLJjYHAttFE/ypfFgCpXwpbts719FZuJrNIPm4dfLY+5ZbXjcQ7GFdt1UUtVJKaDc2C9RyofbbJ8xUGg0G6N6SOLOnw/bwEXy0xuS5XStg90CXn7LnuYYbYFRSOrBjb5EKl00gXruKJ17Q4viZMGaq7uElKet9XpVF+v4dFjqCLH7Nzsm5C9AuGMQ5MeGibCbXLyKNrFa/f+r2aJdpIqJYVFX8OopbnqVH3v3nTCByfkUOqEDp0MWGjF62XoTDt+cIlnRmSF11OVATu7COKeS2HI7R+i1wdYoDPowQDN0v0sb64zQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3449.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(376002)(39850400004)(396003)(346002)(4326008)(86362001)(8676002)(16526019)(186003)(66946007)(66476007)(66556008)(44832011)(5660300002)(956004)(2616005)(6666004)(107886003)(36756003)(478600001)(26005)(6486002)(2906002)(6916009)(52116002)(7696005)(8936002)(316002)(81973001)(136400200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	D/UCP8Ca4UbqomgghjH8rdNfAsaZR1xNa64ncvpT7l5s8OzC4z8hdnfzhW51AXdvXkamitw8ZPEhPqj1zLMI6O76tfmra4jticAy8dxRfyFDuSzmPa1XkBJSnkyalPlO7Pip2Zj0iOItcJ23z9q3MZGoms/iUhuHGw4hIkKp/mbxPAdv+536IQOIiZw2KlcpU1bV41dTe20x4CfuVxxzcn11CnnzZtEZ/p9Po6smk22WbpjhR0ROr+IDP56Ub87ZpnEqMK/VlIBHSzDj3Z2SWdQQSpvQmKxC+YOj9clRAdcX52bf/jU/kF2nQw2iQBB5UuOep4xV+xkp6+4HmwIJxLOHYmaWZKK+m9nGFZSVsDlPnzfVDT10uXpdeqJ6LN0jnIc8VOjRwfMOTNrdtewwFxCp1I9m7tTKoTcgR9/wE5BakM6WbMENuBa3AMpwbmZzGgGpvScNOl6t4rSkJ5K1kpQNpvv2cZp2FL8apTdiAaY=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf91e5dd-445f-440c-d682-08d8020421f5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 06:06:44.7648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gR/qU/R4Yp8M6sy+6bdpmrVpAEnLeV7BfEzGBWt4tjnPPIEGF9eAqxT6KZgqCwKd0x7uEauvQniM2V5X0NB5tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB3257
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The package `python3-fdt` is used for parsing and generating DTBs.

Signed-off-by: Nandor Han <nandor.han@vaisala.com>
---
 meta/recipes-devtools/python/python3-fdt_0.2.0.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-fdt_0.2.0.bb

diff --git a/meta/recipes-devtools/python/python3-fdt_0.2.0.bb b/meta/recip=
es-devtools/python/python3-fdt_0.2.0.bb
new file mode 100644
index 0000000000..040ceba980
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-fdt_0.2.0.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "Library for manipulation of Device Tree Data"
+HOMEPAGE =3D "https://github.com/molejar/pyFDT"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D9a6e=
a5b6c346a830f54cc95f6a2a9245"
+
+SRC_URI[md5sum] =3D "a91daa36b3216f54feeac74ea8e5a475"
+SRC_URI[sha256sum] =3D "b675139346946115513e27b5eed9aa882628ab74ed500bd5e2=
5e122ee0afa2f6"
+
+PYPI_PACKAGE =3D "fdt"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native"
--=20
2.24.1

