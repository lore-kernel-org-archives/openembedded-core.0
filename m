Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.1325.1590517214988658965
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 11:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector2 header.b=bGIazkj/;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 spf.creamailer.com}: limit exceeded (domain: vaisala.com, ip: <nil>, mailfrom: nandor.han@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdXdQBdXf0iy26NYq9nnV7IHfbnksYk0lJPoXAuDBwqiCWXX0vTa8HZAGQaCLghIJ402u3LliikQnlyXd5JWDhw8uPYb7J7pPLNbbW7eqv8DCv69SLOgL4i7ZC64JgLTwtP3lklE3ysk5lLY3tU/WGHPxKdOL8mGXciFD/eydpbgAwzv9sFU+tIQO3uZ4kL2z+/9cs4Gwl6as3UER4u5IrZtHHzNkxohBqM8mv+qPX1HxMmhwAILLCA1LhEjHvzo8ac6CYXCkvjxt7Wq1RjWHyabPEccvpMbwJIG1xQrtDqgHm9zP58uG1nH3tnWLdBYhcn/dfEDDIx0NnDAuZ/r7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAb8C79JEAQA9wmzhc5k4YVZgTHYnwUBrRWKvE7jAVc=;
 b=gwlApARXJQtlqxSQHOHaZ4psIBHPlwpX7rS0umj/a9U5QTho2Xh4tg9/Kppse9AIeasycq9ueiBHItzBEqfgUXIsWyruyve41AQ8pz2Ydeqd52vaOb8p4mIWws2cojFo+fajkiB2AcwgEVvIWRvXSexAmXKWe5/233Q5fLlT2KTrE5qQx7gATDjC9Ag3/oFHt5WFCTLL/3R8WeBnXZ3nW5woRELL2/ffQC8T6LqCSWwFdEMo4km1oWHV9f3I0q1XFvITjZmVMBe9YCHBpFlBlUytbLseRHtEutCe4KqcCDwAg/YXdm7VZoohGOFLO69dJyAh476sH4RliEW+f6nCaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAb8C79JEAQA9wmzhc5k4YVZgTHYnwUBrRWKvE7jAVc=;
 b=bGIazkj/lgmQp5nQNiIK6378W0ZM+1Xq7SL7PpGGvW9duyYwW9BgpcJLPARhMBTWnu34g9OQMc5ptZkYifNRZ8lY8m5f67TcuIAxaXQZ7eDQzIk1GFZXxTWiNZXU5vhHyZpXMFEC8J6kgRoFe6Hw17TbQiLXCnqsEV6vij5Z2UI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com (2603:10a6:7:8a::22)
 by HE1PR0602MB3403.eurprd06.prod.outlook.com (2603:10a6:7:81::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Tue, 26 May
 2020 18:20:10 +0000
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::a972:752a:8780:fe40]) by HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::a972:752a:8780:fe40%7]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 18:20:10 +0000
From: "Nandor Han" <nandor.han@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Nandor Han <nandor.han@vaisala.com>
Subject: [OE-core][PATCH v6 0/3] Add a new bbclass that abstracts the generation of FIT blobs
Date: Tue, 26 May 2020 21:19:53 +0300
Message-ID: <cover.1590517053.git.nandor.han@vaisala.com>
X-Mailer: git-send-email 2.24.1
X-ClientProxiedBy: HE1PR05CA0160.eurprd05.prod.outlook.com
 (2603:10a6:7:28::47) To HE1PR0602MB3449.eurprd06.prod.outlook.com
 (2603:10a6:7:8a::22)
Return-Path: nandor.han@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.vaisala.com (82.181.11.213) by HE1PR05CA0160.eurprd05.prod.outlook.com (2603:10a6:7:28::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24 via Frontend Transport; Tue, 26 May 2020 18:20:10 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [82.181.11.213]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97486e8d-a51c-4477-ea17-08d801a16ce8
X-MS-TrafficTypeDiagnostic: HE1PR0602MB3403:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB3403E00A40C948A330CB242485B00@HE1PR0602MB3403.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 041517DFAB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F6dQOndqUbAmBuK17fQIH6aZYfZJi+bEeTsZRsSSHcCpA4htuXqHrHT+8jVUa1uH7vprtNoi+YIjjWqjoMvUtQhzktvO8y04nL5gfI9aGiUUBbewjKWJHtbGwAnauBo696NVWfTVvKqhIBs8mnQHRyPyhWAp6x8RxVguy11Wwq3dyuBwe1Ddpjy16GufPPuQjtZXbZT22qIBc17Z4IR2A1IxGHarFYw6BuBeqxG9O+u0YYwm4/Qb0TiKKZnKfoTHTElWU8u90d+99uiZyj+a1HyPgJtf7tRgfu2XLobAM+QB9yuTmsdI/YklRMkbOdsYd4b6p42k4asXcPFPjV7E4t5fuMvGXeYSBjd7JHi/PmqyrUwkslfAEbtAbNUkdLgi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3449.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(396003)(39840400004)(376002)(366004)(8676002)(4326008)(2616005)(107886003)(316002)(956004)(36756003)(8936002)(6916009)(26005)(52116002)(7696005)(66946007)(66476007)(478600001)(66556008)(6666004)(16526019)(2906002)(186003)(6486002)(5660300002)(86362001)(44832011)(136400200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1C20rfySmxcw5kn2kN5slPPu8OP7XcUeQcihwCzrcAF/T4CPS2G8ySqLHpMRy4dJurg7G719WMH0rhHH53MSx9zn0FTXyvDg9u0tYhYRpkPwSlA6H0SHpu4G2uN4335D9Nx4/YhDx4ZJ+NApcv9O8lB5es7CZsYaxboPs4BbBib0sUN1JiPXGhPfga1YI5Cl09MtNbtSZ8YPRE/PcjTd2z0dktCJVNy6HJcjC3xSOUkwBVzLFvEhmTeCfHxdN9D3thCzpC/SWME1Z+Pa2He9HLQW2bkBuPfJhWPGPfcj0anmpD2QGeRL2m8GLtnF0F8XU+rwjSujdzzChoxqqTThl8V5CsoiUDg8B8Oyqh5HO17RlqAdUlUulZ7F2yR6QjVLydJXtL/jRswjXtLdf08du5cilkoOJ4DPegI4vIs6Ou05mjk3IjOjwWDS7iu/5gzfZOmyFar1FZWGrHam9l+tdCiByrgkaSgIvtKMVmDehA0=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97486e8d-a51c-4477-ea17-08d801a16ce8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2020 18:20:10.3200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdMLV8Qjv6jmNawfyQlp8YpcODLXvnNVvuhW4aiA48ke/GcFpoy2mCyl6fMetIyUy3zOyXY5xqzPwC8SUoy7Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB3403
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


Nandor Han (3):
  Add a recipe for `python3-fdt` package
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

