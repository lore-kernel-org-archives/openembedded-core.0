Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.83])
 by mx.groups.io with SMTP id smtpd.web10.11047.1613061134875057234
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 08:32:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Sop9Qov+;
 spf=pass (domain: windriver.com, ip: 40.107.75.83, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOQ9tbrz3sSautqtG0kexI0FAtiJW/bVK3PKv//nYcmgG06CuI4wF5VyCWj2HAOcUo+aT5IgHWSAVfZuIIBdiLZdRLMzQHGtCYnCPfPgFViBg9JvUmowRlG8zvRHnzDi1+I02yTyq1KyUCRO9sRlpUtHDBR2LvKniN3TC4tvOwCOlCuCxhi9xWn3t5rWj5PHZu4LlkuUhDyVYCgBSpxPcM4O0gJYUXEYXJNgorhbj83Isp/Zuq+kstF+4Qse8Mf1Tjnj94/05O5JKEs+reE29hJwj3kCW0rER6h1ZIv++JcqoGNTR47Bs9oc8Bf4qREyUJbYC4a0nfFbBhzQoBpdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAmDczG1gCZ7ChRt4DmhJDUdNvVyOKI9lK6EgnHm8FE=;
 b=gHm82FwMaHM38mkj1ta37HlzEsBhww1z95gsDleavkEdvyR9UecAvGT03PXbULmXk+wfnMVzGXUX56lu4Stk/PgodirIOYGcn7UsF6VuA4C9RGLiLFdwtOwiXW9QLR4dHNbq37fXb80kZ2ErZ41/CW8D9tvzfOeyFxmiyYDvwZr2tKSttIYdHNqR4pv9MV/q75dWv5tkD90RwW3hcimwtIT6mBVIZJerJPYFfuZ5fYoD8d3nWJdEXX7e5uZ+0yBmEH/d8ztRO/OWsttqJ/o33NdsJm/OPlMqsZLhZ0iDqJbLb6/Jb+ySJI0/TfnoJMS4ILcj0fmulMMAj5IOisRMqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAmDczG1gCZ7ChRt4DmhJDUdNvVyOKI9lK6EgnHm8FE=;
 b=Sop9Qov+Qn5qQn0Gs+J2zvNZfIXt3x0dkjxSgSwq9sqjghjcAFD5nrZ5BZtHh3VGwLCrd0jcWyollE1LsO0e4/wBdePjbCIciydh1LTe8CphkPl5lVxUz+D4uDNZSAaaQXZA04LLSy2BV/frGx/heVXQtBgYvQbayn/nnqk9eBA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB4801.namprd11.prod.outlook.com (2603:10b6:303:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 11 Feb
 2021 16:32:13 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f%4]) with mapi id 15.20.3846.027; Thu, 11 Feb 2021
 16:32:13 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 0/2] Enable QMP Dumping for testimage
Date: Thu, 11 Feb 2021 08:28:08 -0800
Message-ID: <20210211162810.3702567-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:300:13d::15) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MWHPR20CA0005.namprd20.prod.outlook.com (2603:10b6:300:13d::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend Transport; Thu, 11 Feb 2021 16:32:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cbb949d-3be1-4acc-9a95-08d8ceaa9623
X-MS-TrafficTypeDiagnostic: CO1PR11MB4801:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB48019718B3ABE84536D218ECEE8C9@CO1PR11MB4801.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V+2NYwCRcUsV1FGHybqcRgaFW7OYCns4dED8tdehKe5Aki5/0lWp2NwzQGBkUdoiw4yv0n5ZtRjoXhQH7aWS0rD6UXtxBYyeyYadd6HOQUjDJacFdgvhnP2aGmNlNPFI9djjdpGNG8T9Y3Aro/v91I7dY0ic/pr3nxEh2hUDAwLzRYGW4U5qoBpCbumT8QyyESMZeeNcXMdUivzNhEp3PGT4C84hrdJhxLnDxIJS0X60RbtdtiP9OCmalEmC2rreMU6odh05m/FX3Az0yNbesHJIluZ1+HUl9IKuTm78TrpBwbwIwKdWnSaqK+uLv8f4y4+psvkfDY/qZa7/RQ6vWLzv4+Tuvxc2ksOooFV7O5ej6rmwNK67iJqvnSLn2E2yOtr3QB/FMLsoV9kUy0n2Qei3m5296bPrjw0wXYZXCH3vWqq3ObgTupt4ZXInEq0lkSY73Ie6I0BIfA7q8VG17me1EpXIdkY1z5/CGBkY7I4jnOHy4QQwyEf5pZpKqSQgqsLzUt8y3EdNYeRFbtQ55A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(346002)(376002)(366004)(44832011)(6916009)(316002)(2616005)(956004)(6512007)(86362001)(2906002)(6666004)(83380400001)(26005)(478600001)(8936002)(8676002)(186003)(6506007)(16526019)(36756003)(66556008)(1076003)(66946007)(66476007)(5660300002)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?7F3VyU61DwLEen7t9ZVNbO1E/rce+qWJP+EnIOfKFF8HsNV0TsqoH/GtO/84?=
 =?us-ascii?Q?RO8w1hySTsZweSp2GLUkgy2Ly6Vum/mkZWGN5L+pBzsezQpOAKEx/3+YXVU1?=
 =?us-ascii?Q?ftCs24L3q9mbQcRrYglBNPB74tZI/KzrdkQILGIep1Ys3AHPjP7GV/Ls1lMU?=
 =?us-ascii?Q?Jl5ypHlg7MOtomyFYY+jpRmXnyIAInsTs/DnsNxvtonAXN95iiquXH9WO/Kh?=
 =?us-ascii?Q?cFfbZWfAlsojb0KIesatNrcHY6ckqDY/ZW1XHAQuhEZvkSs+h6mM42oDjS//?=
 =?us-ascii?Q?zCqt0J1onXID03u+IjQukd96okzQ7htsEDs0wkAFbab9u9ahEl1Ep4Qq2czD?=
 =?us-ascii?Q?4enCS6RsREpqQjYe48J02K58rAnTyT3mUtTOvrKLpDEkOVBlOeFFgiFnOPaB?=
 =?us-ascii?Q?aaxNDcfKhgltbtqVcgu4xI+D36gXsaCDOHhV87BlMC1ekU63BCLVO0WpDqf0?=
 =?us-ascii?Q?c0B1vsLHN+/OuT6jUmKPmoXk1xS9IbXpRKmiQrFYjtSJyBedjZwbHfC78F2f?=
 =?us-ascii?Q?XvBGduJ+/6/ogMHUrH9/dgIURFgEWV+HorkN2NZNZLAMoiEC1cV+i4psQqJt?=
 =?us-ascii?Q?xguX58gPj3GDHbgIS3jC701qm9cjgI2SvwczAbG1mi6USN/ufUIXCm4lE9L6?=
 =?us-ascii?Q?H6bw6q/3DxTwqIRC5jZoe6D4dAij/7/SEAZDUPXF/EyxDINC59jyRGnVMMTE?=
 =?us-ascii?Q?ZFntE3WNB9Ay2231izWGFZ+JqXY6foGFNzB0F4uPA6tN8KAT2Jj9RqGpJv0v?=
 =?us-ascii?Q?O5JkN/LhsnQ3VpNVIoNWunOHaUjAthB8P+52B1/hTen5QDLXtGVXcd0dAo64?=
 =?us-ascii?Q?N+DzyNYUnkHLcQznGMHsFq78XgKDJvdMt80jIixhzcPHWFw9cVt3IZI4pthc?=
 =?us-ascii?Q?zvkf57dHHyQxxB60zXlFlHH1/DMkq/pm0FXaf/d/mVhM6Qb6hd6UIYDXDvYH?=
 =?us-ascii?Q?Vln5qEzsjdkd3UQ+C0a6d1sfiXXfj584AX+2BINtp6u8aXCmT0vK4vNUng+I?=
 =?us-ascii?Q?jWeKN1v4NsO/SlsGV5B8XvtCki4Wteo7e5u7Z/bjWie34xJNcndN/1s8N36D?=
 =?us-ascii?Q?eoVnYOKkDLRt4Txd3bmRyoWa8+ONuijncurDMLApw+PTdx5Bg3/dH66X1YKc?=
 =?us-ascii?Q?hD27nasmO0PZMcfTCfFIajiu2xULzvg2yp+r0eAJdUcsfa/P6oDkj0MyQZcw?=
 =?us-ascii?Q?fChNcC2V3vK2vpPyYIhe8OI+Z7wth9JvsJ7CL0sFivvCAB5CtQtpB/5fl2RR?=
 =?us-ascii?Q?jiZHDu4RdGoKs8o4GRfXMDWKWKZtbuoygAkAQRGj/Wrqs0T+MBg1wcyXSpqo?=
 =?us-ascii?Q?7tPOVUG1bxhSKqVXhUC2EwY7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbb949d-3be1-4acc-9a95-08d8ceaa9623
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 16:32:13.3683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CReudpHLfEQ48XFupRVSKTvwYVGSs6CdYU/AJy6q43TD3ERNLDZlqmnIlIqR/OESo/mNBnZ8zYVDu+PKyKNILg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4801
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This is the third pass at enabling getting debug information from
QEMU via the Qemu Machine Protocol interface. The Qemu source provides
a qmp.py module which I current install in tmp/hosttools as a known
location. I am sure there are various possible locations.

The initial commands that I issue to qmp with a failure is detected
is: query-status and query-block. The output goes into formated json
files as follows:

tmp/log/runtime-hostdump/202101061054_qmp
=E2=94=9C=E2=94=80=E2=94=80 qmp_00_query-block
=E2=94=9C=E2=94=80=E2=94=80 qmp_00_query-status
=E2=94=9C=E2=94=80=E2=94=80 qmp_01_query-block
=E2=94=94=E2=94=80=E2=94=80 qmp_01_query-status

Comments welcome, I tested this by calling the monitor_dump code=20
directly in the target/ssh.py code instead of waiting for a given
failure.

This version has some additional warning out out in qemurunner to
try and find issues with the CentOS-8 virtgl selftest failure. I
there is some timing failure with the qemu process exiting.

Sau!

Saul Wold (2):
  qemu-system-native: install qmp python module
  qemurunner: Add support for qmp commands

 meta/classes/testimage.bbclass                |  6 ++++
 meta/lib/oeqa/core/target/qemu.py             |  6 ++++
 meta/lib/oeqa/core/target/ssh.py              | 17 +++++++++-
 meta/lib/oeqa/targetcontrol.py                |  3 ++
 meta/lib/oeqa/utils/dump.py                   | 31 +++++++++++++++++--
 meta/lib/oeqa/utils/qemurunner.py             | 29 ++++++++++++++++-
 .../qemu/qemu-system-native_5.1.0.bb          |  4 +++
 7 files changed, 91 insertions(+), 5 deletions(-)

--=20
2.25.1


Saul Wold (2):
  qemu-system-native: install qmp python module
  qemurunner: Add support for qmp commands

 meta/classes/testimage.bbclass                |  6 ++
 meta/lib/oeqa/core/target/qemu.py             |  6 ++
 meta/lib/oeqa/core/target/ssh.py              | 17 +++++-
 meta/lib/oeqa/targetcontrol.py                |  3 +
 meta/lib/oeqa/utils/dump.py                   | 31 +++++++++-
 meta/lib/oeqa/utils/qemurunner.py             | 56 ++++++++++++++++++-
 .../qemu/qemu-system-native_5.2.0.bb          |  5 ++
 7 files changed, 118 insertions(+), 6 deletions(-)

--=20
2.25.1

