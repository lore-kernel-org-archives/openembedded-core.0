Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.704.1590559606905396081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 23:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector2 header.b=m9fFDdAz;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 spf.creamailer.com}: limit exceeded (domain: vaisala.com, ip: <nil>, mailfrom: nandor.han@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wfgmkio2XSkH2QPmMc7wDYjCyGDRDYE0TjPgKKQb1P50sqMvtsoV347LDxi9bnWc0EV2xSG6nEQiuatU5ymZuSzuAvv7so/+8WxHC7AE5TNnttulpfmzMgC7vCz2wY6mjq9c3xiusjXG0U8SMLGWIRQT6RSVTAwoD8DLpQPI2G0lOM9QWDTtvN44yLjcTeE5H1bWM3l4/QzkrXNblPwxa0b8ss9fpNQkKCPcV71FnIm1pcYZUk7jp7oyN/5wb+az9cYJ/qyVg8hLDZR9dnCXVHbnxoXFAHJgDc5voavwFMO5OiVfot6ZeMYzwzxJneNF69XVlOT2r19emqNLR5ZERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjRRPJzv2UKpwFrfaBj9YK4zvOnrOa2wlZXJJIAsjF0=;
 b=IyMCWO/neQhfpUqhPtNfINnNzIefJ4NG+bVbpk/VfRQrewGuWNe74o/5pZn+/z0U8L38XifFHVuxt2iD8udZThNer2NIqB6KHGetJ0mpVTJZS6gV9Xlyv5qxo5smXT0uEuYDPd20f22+0AD0kO9S0LJw4oCOkGexxurNgWIACkyWP6hk+0snOmB7XF2TX6tyP9Jjb2z6B1pQ0ybaObN6lzm4jld54U1jwS9flYmnfb1GO2cRJxezbUfMF6yho7ONzdbf33f+nWEi9FFTgnNBQk7XW7xKrLlifd7ckhGQu+de+omN1D6+Vrj6bwPsjyewJmm6FiVNvKzbvd9XjTlG0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjRRPJzv2UKpwFrfaBj9YK4zvOnrOa2wlZXJJIAsjF0=;
 b=m9fFDdAztw+JVoAkSXiLs1E+Fo0OpKi2yxDE2+mBNy/Ihu2kkgUHVEeH8VkS0Cs/itP4xGiDwXU1EmZwKKs3Y4EPlg8v/BRvbRzCt6zaybEwQtLvn58Ouxcp+0sUYVYbnfDYjySJ4WM2ocvAEn8CTLw05xxpCc83F8VAta+gq0M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com (2603:10a6:7:8a::22)
 by HE1PR0602MB3257.eurprd06.prod.outlook.com (2603:10a6:7:24::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 27 May
 2020 06:06:44 +0000
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::a972:752a:8780:fe40]) by HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::a972:752a:8780:fe40%7]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 06:06:44 +0000
From: "Nandor Han" <nandor.han@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Nandor Han <nandor.han@vaisala.com>
Subject: [OE-core][PATCH v7 0/3] Add a new bbclass that abstracts the generation of FIT blobs
Date: Wed, 27 May 2020 09:05:57 +0300
Message-ID: <cover.1590559408.git.nandor.han@vaisala.com>
X-Mailer: git-send-email 2.24.1
X-ClientProxiedBy: HE1PR1001CA0014.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:3:f7::24) To HE1PR0602MB3449.eurprd06.prod.outlook.com
 (2603:10a6:7:8a::22)
Return-Path: nandor.han@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.vaisala.com (82.181.11.213) by HE1PR1001CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:3:f7::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Wed, 27 May 2020 06:06:43 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [82.181.11.213]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42b7c30f-9a7a-4bfa-2996-08d802042168
X-MS-TrafficTypeDiagnostic: HE1PR0602MB3257:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB3257E0B5033113B0E04CE7C885B10@HE1PR0602MB3257.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 04163EF38A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dtnxfSh/xcYuNsc7V2DGJDSt2+1PpqUZEVrPlNtH5+BdGm1FsltzpWO0ccI9H/esoUky10p5cS2LhxESpBnxjtz4if6NTxJB1yBRrlrJc6sJSakImOIgENHqn0Gz/udX29vqT4XtYoZ4ETwBZHIsiiAOQmce0c5tvrkbpN61+vom6m8Pk4lFG5ZXXQEL7OyGSoGYqHLRrle0dJ5/x9KaYKaM8X/6pz3ChzmnbTZe6lB4F277/w1Uvv0pjyTJ/yvDmadubnlXFO02xAmmx8bD/2FFPiMyS8kaVZLbITfxSE9TjcdXtAkErZJ4u+c47Q8C/GAIOJPmi63x7DyCrJbt9NbgSs/rT621Bj5UNAm4asMDe0A0t+UyGG4+9J2zJYeB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3449.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(376002)(39850400004)(396003)(346002)(4326008)(86362001)(8676002)(16526019)(186003)(66946007)(66476007)(66556008)(83380400001)(44832011)(5660300002)(956004)(2616005)(6666004)(107886003)(36756003)(478600001)(26005)(6486002)(2906002)(6916009)(52116002)(7696005)(8936002)(316002)(136400200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	884f0PJ+tVnz5Ctd43UwVieiAEZoULUO8ldcR8QZZSBEp+0pfV7nP7C7kcSamzCiW0sGjSkdWZSwyt4dQA/XWu0zq9bgawr06+pOhpZyDRovjGFaUNo85W85yIuSjYsmsr9djaRbx6duu2K80olhCycLo/pABwN6f3JaXjK1atc5tzSt6FK8iLBQhma666tm71OHU6yVMT0rVXyjSx0v8wkkw67JNTNOfKR7ImjFqQDt10xg8j3bJuXNAWWwod6flozGKiS5E8IX5beP3Xuen1cCQrmMqSaDUfqSTIdf7Bh1ablHuWovdRxGqOzjPPxV+ni3HXfNjRCrjaSVujO5hMV75yThoZYl8wdYlab7dxpU6yB5Q+m6zpfkM+lB0ctFYqMUcw0OWGNF4exBihZLSt7BENYF6fymlfMnfmB1OgDbRPGBPJPsWg01M1CK+cUhqnOcrlnP2FglSDHEeTZGJIvR+jlkGLCLxD7akhBKZEw=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b7c30f-9a7a-4bfa-2996-08d802042168
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 06:06:43.8743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+Qt5B4SF7DIO+a9xufQ8UTNleZSi29FxkP/z4VUxUyiDzcXnWOJS0PcZm7nmtP8rpU2lphrKpT/xa9+2/RRBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB3257
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Description
----------
Add a new class and unittest for generating FIT blobs.


Testing
-------

    1. linux-yocto_5.4.bbappend was modified to have the following configur=
ation:

    ```
    inherit fit-image

    KERNEL_IMAGE_NODE[name] =3D "kernel"
    KERNEL_IMAGE_NODE[description] =3D "${PF}"
    KERNEL_IMAGE_NODE[data] =3D '/incbin/("./arch/${ARCH}/boot/zImage")'
    KERNEL_IMAGE_NODE[type] =3D "kernel"
    KERNEL_IMAGE_NODE[arch] =3D "${ARCH}"
    KERNEL_IMAGE_NODE[os] =3D "linux"
    KERNEL_IMAGE_NODE[compression] =3D "none"
    KERNEL_IMAGE_NODE[load] =3D "${UBOOT_LOADADDRESS}"
    KERNEL_IMAGE_NODE[entry] =3D "${UBOOT_ENTRYPOINT}"
    KERNEL_IMAGE_NODE[hash] =3D "sha256"

    FDT_IMAGE_NODE[name] =3D "fdt"
    FDT_IMAGE_NODE[description] =3D "FDT blob"
    FDT_IMAGE_NODE[data] =3D '/incbin/("./arch/${ARCH}/boot/dts/am335x-bone=
.dtb")'
    FDT_IMAGE_NODE[type] =3D "flat_dt"
    FDT_IMAGE_NODE[arch] =3D "${ARCH}"
    FDT_IMAGE_NODE[compression] =3D "none"
    FDT_IMAGE_NODE[hash] =3D "sha256"

    CONF1_CONF_NODE[name] =3D "conf"
    CONF1_CONF_NODE[description] =3D "Linux kernel and FDT blob"
    CONF1_CONF_NODE[kernel] =3D "kernel"
    CONF1_CONF_NODE[fdt] =3D "fdt"

    FIT_IMAGES_NODE =3D "KERNEL_IMAGE_NODE FDT_IMAGE_NODE"
    FIT_CONFIGURATIONS_NODE =3D "CONF1_CONF_NODE"
    FIT_CONFIGURATIONS_NODE[default] =3D "${@d.getVarFlag('CONF1_CONF_NODE'=
, 'name') or ""}"
    ```
    2. Build the kernel: `bitbake virtual/kernel`
    3. Verify that `image-fit.itb` is present in the build directory: PASS
    4. Disassemble the image using the command: `dtc -I dtb -O dts image-fi=
t.itb`
    5. Verify that the FIT source contains the expected configuration: PASS
    6. Run the unittest using the command: `oe-selftest --run-tests fit_ima=
ge.FitImage`
    7. Verify that is successfully: PASS
    ```
    2020-05-26 16:54:34,996 - oe-selftest - INFO - SUMMARY:
    2020-05-26 16:54:34,996 - oe-selftest - INFO - oe-selftest () - Ran 13
    tests in 1956.639s
    2020-05-26 16:54:34,997 - oe-selftest - INFO - oe-selftest - OK - All
    required tests passed (successes=3D13, skipped=3D0, failures=3D0, error=
s=3D0)
    ```        =20
=20

    Changes since v1:
    ----------------
    - Change the format of short-log to "<target>: <summary>"

    Changes since v2:
    ----------------
    - rename the file from `fit-image` to `fit_image` to successfully expor=
t the class functions.
    - adding new sanity checks.
    - add missing dependency.
    - fix a variable reference in a debug log.
   =20
    Changes since v3:
    ----------------
    - unit-test added
    - class updated to support also properties for U-Boot image

    Changes since v4:
    ----------------
    - remove a wrong patch

    Changes since v5:
    ----------------
    - something went wrong with generation of the patches. regenerate

    Changes since v6:
    ----------------
    - fix the shortlog for one of the patches

Nandor Han (3):
  python-fdt: add a recipe for `python3-fdt` package
  classes: Add a new bbclass that abstracts the generation of FIT blobs
  selftest: add a unit-test for fit-image bbclass

 .../fit-image-test/files/dt-fake.dtb          |   3 +
 .../fit-image-test/files/zImage-fake          |   3 +
 .../fit-image-test/fit-image-test.bb          |  17 +
 meta/classes/fit_image.bbclass                | 387 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/fit_image.py     | 212 ++++++++++
 .../python/python3-fdt_0.2.0.bb               |  14 +
 6 files changed, 636 insertions(+)
 create mode 100644 meta-selftest/recipes-test/fit-image-test/files/dt-fake=
.dtb
 create mode 100644 meta-selftest/recipes-test/fit-image-test/files/zImage-=
fake
 create mode 100644 meta-selftest/recipes-test/fit-image-test/fit-image-tes=
t.bb
 create mode 100644 meta/classes/fit_image.bbclass
 create mode 100644 meta/lib/oeqa/selftest/cases/fit_image.py
 create mode 100644 meta/recipes-devtools/python/python3-fdt_0.2.0.bb

--=20
2.24.1

