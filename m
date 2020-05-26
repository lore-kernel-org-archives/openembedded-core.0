Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.71])
 by mx.groups.io with SMTP id smtpd.web12.823.1590515895168852608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 10:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector2 header.b=TAWBu6GO;
 spf=pass (domain: vaisala.com, ip: 40.107.1.71, mailfrom: nandor.han@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsvzACHnrI/MTMGtJs+OAuY2huqEQcqhmhOf3eHZM1UoON7FU6EbZVt5jv2Uug2fZoQu3iWJiEaHx1gCu3ke/5drSHUqo2yJMUQqdknmMM1c3qLcAZ51XkUlbhu6w4EyCU484sD4pFH4dDt6pYSTEVvI5XKSpM7Fhbi4UqT34dIDrO6Ix+9ssGfOqqFEV1XhSfqycfk2qCXy8d+W1pO4XRyY8Qi08moMbtftLBg6QKGSeXMHrqcEQX+Dpu/f/WbpQb09plIoQQzOZSdgiyzRKsDZk8Jq7QC0BBHW/8INeb+GS5WmpWwWocJkjfZjDhYuhmpd/MiOraptEKyRa8eJYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aex5XXf3fAnYQusDF0YrsETDADdMGwssE+6EROpZNzQ=;
 b=Qhj7dw8WWSDIxiXbXJ6p43dM0S2AHT/S88cVjitYBbxRMdfxaTriC90GyKcwiEbNL3OiLWGk1aegGYw0MpiMZC5VLzlcmSqfchCaDkfWJoTYV+AhBjGXvGBpQ6Ow87O+QmueWohIftx661/2exmTUZfW6ylO1pyUJmS+Gku52nGdjcwo4gANAYYgZs0wE5Qb4Mf2mAf9PEn2AYRX7tII42ROsS9k8bP6NoEIh43jpgdjzPOa7OqglQrvwiZYdnfX2yjWZ9XN1HdRXvEioK2T9/UW2RVhOZhdx3Ex2H005BpXES4HfzVMMp2FnXdeOTE+fpDTL/9I2hZEefYeh51E/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aex5XXf3fAnYQusDF0YrsETDADdMGwssE+6EROpZNzQ=;
 b=TAWBu6GOnJvDJWGR3w+qVtcNOzpQGEFRPjP7es4wpMNJ8Ri1FJsntVLWWykQUl2liiXjAucsHKWLEO+Nq85gyauDNfhYDABsFca3ADinhIClUpN5jEqkaVsLW9RoruKEGXOVFUjBikWhnHNMgaL0hzG9SJ93biUtVvpbtwQPMDc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com (2603:10a6:7:8a::22)
 by HE1PR0602MB2892.eurprd06.prod.outlook.com (2603:10a6:3:dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Tue, 26 May
 2020 17:58:12 +0000
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::a972:752a:8780:fe40]) by HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::a972:752a:8780:fe40%7]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 17:58:12 +0000
From: "Nandor Han" <nandor.han@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Nandor Han <nandor.han@vaisala.com>
Subject: [OE-core][PATCH v4 0/3] Add a new bbclass that abstracts the generation of FIT blobs
Date: Tue, 26 May 2020 20:57:53 +0300
Message-ID: <cover.1590515635.git.nandor.han@vaisala.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200326214308.1042374-1-nandor.han@vaisala.com>
References: <20200326214308.1042374-1-nandor.han@vaisala.com>
X-ClientProxiedBy: HE1PR0101CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::34) To HE1PR0602MB3449.eurprd06.prod.outlook.com
 (2603:10a6:7:8a::22)
Return-Path: nandor.han@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.vaisala.com (82.181.11.213) by HE1PR0101CA0024.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24 via Frontend Transport; Tue, 26 May 2020 17:58:11 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [82.181.11.213]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5255a39c-75f8-4bcd-68c7-08d8019e5b31
X-MS-TrafficTypeDiagnostic: HE1PR0602MB2892:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB289272DB76473D33D6D2883785B00@HE1PR0602MB2892.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 041517DFAB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pNQVH/rQ1mZN0E9CLdRCj2h2LE2KVre1helXF6A3ozO1Exw7UltcVbrS1RA0smcVLH7rD+SqoUhPuF0QsuJcYv3caAg+OGn1zJKeXjqGgvssGChrtJJBtllzDxb6xtLnmjxcTfSszKYuuDvsAeJx6pJsIurEk9God7oE8wX3mxBtmZsWXx4hZdUoKt11p2N+ZXz77azoT70lPVmGsFH/9BU7Zg/sPNGdCFnRSMnk1t8UUFWaZlmzRq0NI/XcWwd8G25jSwsmZcPWPG8lY+Zx2bIdfGQIWBs/ILYY0NXYws/I8ntf0r7cfMLk4m6a6BFg/mXwAgiJLs436AK+Ty9yVWD+yp2w9NMgtz6FbHCl0kxOa3pAIREK33r+/o5qtbgR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3449.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(376002)(136003)(39840400004)(396003)(316002)(5660300002)(6486002)(86362001)(8676002)(6666004)(4326008)(8936002)(36756003)(26005)(16526019)(186003)(66946007)(2906002)(6916009)(7696005)(2616005)(107886003)(52116002)(66556008)(44832011)(66476007)(956004)(478600001)(136400200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	KvxuOAKqKE+8FCDPePBgkBRhK99vcBuTT2Ns+KeI5QyaZF0VP4fg3hVZUi8uQGkO/GDjoDhLiKxwHbKTUwCnIznUIBLgbtr4zrE2XjTAWFn/vFeLPyb5lp9QrIDgaBgAkNX5xMPOONW2X4bT2IGOtvdfhExNPq+OzfPoVOo4ATMhdghccTNqh+AxBLI+lm09N+ZtBBnU1z240NdkeDwSkdK7E1GCgsFu/5/O80ydxAi4pxkoFyHvDHo52yiQxQZipyv0aVCS9oIKh7y6G4wKntuCnCYkBf+7R93VZzdA+fwTBNI/qh84fg4IOvDjTplRSDR490Xh8UAK9cj863U5Fq8LGyGamLLlPcPXjkJltzUgaCxHDMZDKBCmawdc6WYUiHnO9VTln03JZywqBcl8LqBYcIUftfpBeHo4f4zIAgMAeAyJ7Aj85Mnn3ywMW01jnbp/6IFM51B47E44QDeGdPsuLzg1mDtbX+lcx2062Lo=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5255a39c-75f8-4bcd-68c7-08d8019e5b31
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2020 17:58:12.5826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OpEVSyzNfw6Yg4CpOuUN2YxIMzHtFnJg5bhuG6o3D/fNMWA9m6DlJohEh3maVgZdPsmS9tuuVA71VMV020BkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB2892
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

