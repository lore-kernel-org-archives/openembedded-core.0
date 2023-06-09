Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF8CC7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 15:21:49 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.73])
 by mx.groups.io with SMTP id smtpd.web10.16175.1686324102213705568
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 08:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DC77Xgaa;
 spf=pass (domain: arm.com, ip: 40.107.21.73, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMNOWb525mCHxmmrh1jQSQQJC5LkHD/P/aoOrdPbJTs=;
 b=DC77Xgaawt5TowpdbLmaj8QTN64670S+LCKO/zuF3jAfvGeJmaCV88EQKXM2UJBIuO1F9DUWtdDvTYQ6DH6RZD/e++4MPE4uH4NHpm2c/jyq3qX+fo0J7I9Or3B198W0Vbb1v1hWhIazJV65rDYSxSQtm3ZV31W2m47EykHtmpo=
Received: from AS9PR07CA0046.eurprd07.prod.outlook.com (2603:10a6:20b:46b::9)
 by AS8PR08MB7695.eurprd08.prod.outlook.com (2603:10a6:20b:520::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Fri, 9 Jun
 2023 15:21:35 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46b:cafe::17) by AS9PR07CA0046.outlook.office365.com
 (2603:10a6:20b:46b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.14 via Frontend
 Transport; Fri, 9 Jun 2023 15:21:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.26 via Frontend Transport; Fri, 9 Jun 2023 15:21:34 +0000
Received: ("Tessian outbound 99a3040377ca:v136"); Fri, 09 Jun 2023 15:21:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e04f777d559968d4
X-CR-MTA-TID: 64aa7808
Received: from af1f9005262a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CC4AA129-A61B-4F3C-AD3E-A01781E45F4C.1;
	Fri, 09 Jun 2023 15:21:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id af1f9005262a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 09 Jun 2023 15:21:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bk9VmY0bM1GYIEyujC0e02QcUc1JMbZJplFPzf4+n+xZlcUICOZ5xoacZWRsLvO+bW9wBF5u5+6JxP4iDDMaxTXCGe+4SF5/i70O3RJq/TPp8981QGuFNllgleZaX9nk/Ae7BeQSrz0Nr+kXzx4Tv8nHF8fX7C/6FfWzY7eKqTLMxRbdfpR/4E6LDg8/MFwAk5J33OdTcXlc89RH8Zjt/azGfGFVTx2+eP+GHwMQ2SWDA3X2vELgCmjuZdeA7GS7wUfDTzhOFMzbEjeEQssk/IwVD1Xz9Edwa0tiuI4H1d7FOmGHsLEBIbnbkvzfa1Xmqp8q+EHfUR7nIwBqSFs70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMNOWb525mCHxmmrh1jQSQQJC5LkHD/P/aoOrdPbJTs=;
 b=OQky9jTG8y/peaPQiyWvtOe37dMzZ5G2lw6Zqv5lQ4pAUAj8r+MCqUgZXuzLELuVXBqwGM1rjBCHTunteQMLeO5VA19qLopRaBDbT2L3CSYmGBXOfspDRHNlTUF4sSMR6f83D/i5A0YNuOsHY1QcAMgbBpUxqjPTsB1Hnn3+GpcQcqcw0uCfmPqeK/+tApfCcc1w0tRrXhdV8t6U+K1uKOVP1iE2GViHsW8bY0PHOlo9oXOhCu/cOD42M0MUKUY46NU7bTrGyoXWxAY08Cgaz/v2UjxuMYjwM1+I4XQFOpdhOMKI1bhwuXxYLEZ1tzXpkOYubyy1Bs9V5uJINsEamg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMNOWb525mCHxmmrh1jQSQQJC5LkHD/P/aoOrdPbJTs=;
 b=DC77Xgaawt5TowpdbLmaj8QTN64670S+LCKO/zuF3jAfvGeJmaCV88EQKXM2UJBIuO1F9DUWtdDvTYQ6DH6RZD/e++4MPE4uH4NHpm2c/jyq3qX+fo0J7I9Or3B198W0Vbb1v1hWhIazJV65rDYSxSQtm3ZV31W2m47EykHtmpo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8664.eurprd08.prod.outlook.com (2603:10a6:10:400::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 15:21:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 15:21:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: Trevor Gamblin <tgamblin@baylibre.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] util-linux: upgrade 2.38.1 -> 2.39
Thread-Topic: [OE-core][PATCH v2] util-linux: upgrade 2.38.1 -> 2.39
Thread-Index: AQHZlWBbxrTJpYEBHEqM6uzGJmZyEq9+RCiAgANFtgCAARdvAA==
Date: Fri, 9 Jun 2023 15:21:25 +0000
Message-ID: <17C46AFD-0C14-4E74-A081-E17F11331906@arm.com>
References: <20230602144124.923028-1-tgamblin@baylibre.com>
 <20230606204249afd53fbb@mail.local> <202306082241067d52a916@mail.local>
In-Reply-To: <202306082241067d52a916@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8664:EE_|AM7EUR03FT063:EE_|AS8PR08MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: c061ea41-7908-4b19-a827-08db68fd3655
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 q3VLAHClA8dsPAhXQRPDnlucZnOm7TItRzQejQXGsRcGWABJq8iBqTTgKTDLgWxYSqgg1NkecCvZwwVUlebrXzw8K8I7xzvXnDDZeC1V81b61T0VCb+ZlE90hsd8wdsGU5IC9gscwM23NMFQcxA3u0lgtwCE+A680kSVnyhcCYY8VDmHXI4OrrXmZCGVc+IpvwDDXdOpeGr/u7hdlZi8AAJFYrifLZqYtfax28pLyknmGx6EodQqghGAbZN1lvRsswjLN0X6mAuf6DmxQrxC26MAn2bbaS2SUISLLO5YxAD4vzVK/ecsun5ZGRLV5C2dZXAF7kQXW76asFfzBkQw0Afv3hdFnrkNXAtC6kzs+Pr/jyuwpZ6wIMXXb51pje8M715jho6IQrry4T3R1MU3KDPBHdKeQV8j9NR6VqLDm2emFLBEHjtoFbUDj8vK33o2GPgs5nJkf+TZww7mjP3nKSyBjg5YGKFQylduQK5KEkbBiY7aNfL03/+UO1LqclV2emw1FLMONuzedXGqqsxsPIIGv9nnwYKyUkNDcIa2hHUvZEz83Vjzg0LcT+127cLt39eNhXzrTshdoKB/u9nx3R/fuSDNqc3cbYA2krq00m9lmts9x/q19tHai+d3IFYY959jXAQRqGCqLSmWOWWDme80AxwPM8cTjcNReFyiZVgvbVF3GCqPJvbwbq9xBq7H
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(136003)(346002)(366004)(376002)(451199021)(2906002)(30864003)(83380400001)(2616005)(122000001)(36756003)(33656002)(86362001)(38100700002)(6486002)(41300700001)(5660300002)(316002)(8676002)(38070700005)(54906003)(8936002)(478600001)(966005)(66946007)(71200400001)(91956017)(66556008)(66446008)(64756008)(4326008)(66476007)(76116006)(6506007)(53546011)(6512007)(66899021)(6916009)(26005)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <591EF774D483BB44A7B0CC27352898B7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8664
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c2713b8b-f010-4950-4963-08db68fd3065
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/X/bhpvQnq+MgOFeOepKN36zlQCP5us8gMk8ouI5P6xSpfbBqR9dx7lbhHGJ4hudIvmqHoCKyPchHGiHbfuV8cRPf+08caag/jtjYEUzq7tjtYTwT5pOnMEKI9+H40gY/Yy2Tv2koh0adIJymvZgN+KTWxf9OB5ImoPf9VgpuEHZvsqB51fQ7pGF9gUj7KveHtNv0Ra8Rie79nFH8z90mjOyHjPVafkrGjiDWFkKj8wK27qdQrPQrpJTZTIUEydqIINo/XqNc8hqD4qMq0cxf06TGgGMnRTkMA4KVB3Vr1Y0GSCwMiMabQewoOyPji+pvWnzqrnlglEzZnpRKSAbQ8rPAgHOSlSXSaWHGlhQQd8wdZ5FTKlfUZlVgBkDjIkAtzvxx3HZqMw0BfnKaMec80OR2RIjkpnX7KfeFFK3x0+IQSWCvuNQevnEaao/lKMqHqnAhNKNAfAq+AgHC3anehOsFCQno/FVMmFBsr8RGqEe4gNNV4NLpjGqWgqiWreFfuedCIbU0+afcFMKefmFRUbMGjo+IcvVqV8YPL7L+xlKPqUjeTHb/xXByZjrfSfjcK8fCtMlCr+0GUvGGkWWG7yyX+/BJZrRT1XWbMeBQYKeMLC+POL+A0xHYZwrQlUFKNES1qTbVw7cOeBkdKw2jJ6rkQOEhDhBf28ZB3uvXz+i2Ej7kHJtDK1Y8TSUBr25IEugW5OuaE6sDU4C3EiLaJemsQ63gxaOn8Q2Tk+hcRE9zyWUCZcUkM+KR2O96vkcUcMu/7NEcJ7HFIxZEZB8Cw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199021)(36840700001)(40470700004)(46966006)(2616005)(36756003)(30864003)(2906002)(82310400005)(33656002)(86362001)(66899021)(40480700001)(966005)(47076005)(6486002)(36860700001)(186003)(83380400001)(336012)(5660300002)(6512007)(26005)(6506007)(81166007)(82740400003)(478600001)(40460700003)(54906003)(4326008)(316002)(70586007)(70206006)(8676002)(41300700001)(356005)(6862004)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 15:21:34.9873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c061ea41-7908-4b19-a827-08db68fd3655
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7695
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 15:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182560

Yeah, we should hold off on this, util-linux 2.39 is a bit broken: https://=
lore.kernel.org/distributions/87jzwfyahp.fsf@alyssa.is/T/#t.

Ross

> On 8 Jun 2023, at 23:41, Alexandre Belloni via lists.openembedded.org <al=
exandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>=20
> On 06/06/2023 22:42:49+0200, Alexandre Belloni wrote:
>> Hello,
>>=20
>> This causes multiple failures:
>>=20
>> Mips and ppc:
>>=20
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/7198/s=
teps/12/logs/stdio
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/7196/s=
teps/13/logs/stdio
>>=20
>> | mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32r2 -f=
stack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-securit=
y -Werror=3Dformat-security -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64 --sy=
sroot=3D/home/pokybuild/yocto-worker/qemumips/build/build/tmp/work/mips32r2=
-poky-linux/util-linux/2.39-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../util=
-linux-2.39  -include config.h -I../util-linux-2.39/include -DLOCALEDIR=3D\=
"/usr/share/locale\" -D_PATH_RUNSTATEDIR=3D\"/run\" -D_PATH_SYSCONFSTATICDI=
R=3D\"/usr/lib\"    -fsigned-char -fno-common -Wall -Wextra -Waddress-of-pa=
cked-member -Wdiscarded-qualifiers -Wformat-security -Wimplicit-function-de=
claration -Wmissing-declarations -Wmissing-parameter-type -Wmissing-prototy=
pes -Wnested-externs -Wno-missing-field-initializers -Wold-style-definition=
 -Wpointer-arith -Wredundant-decls -Wsign-compare -Wstrict-prototypes -Wtyp=
e-limits -Wuninitialized -Wunused-but-set-parameter -Wunused-but-set-variab=
le -Wunused-parameter -Wunused-result -Wunused-variable -Werror=3Dsequence-=
point -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmac=
ro-prefix-map=3D/home/pokybuild/yocto-worker/qemumips/build/build/tmp/work/=
mips32r2-poky-linux/util-linux/2.39-r0/util-linux-2.39=3D/usr/src/debug/uti=
l-linux/2.39-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/qemumips=
/build/build/tmp/work/mips32r2-poky-linux/util-linux/2.39-r0/util-linux-2.3=
9=3D/usr/src/debug/util-linux/2.39-r0  -fmacro-prefix-map=3D/home/pokybuild=
/yocto-worker/qemumips/build/build/tmp/work/mips32r2-poky-linux/util-linux/=
2.39-r0/build=3D/usr/src/debug/util-linux/2.39-r0  -fdebug-prefix-map=3D/ho=
me/pokybuild/yocto-worker/qemumips/build/build/tmp/work/mips32r2-poky-linux=
/util-linux/2.39-r0/build=3D/usr/src/debug/util-linux/2.39-r0  -fdebug-pref=
ix-map=3D/home/pokybuild/yocto-worker/qemumips/build/build/tmp/work/mips32r=
2-poky-linux/util-linux/2.39-r0/recipe-sysroot=3D  -fmacro-prefix-map=3D/ho=
me/pokybuild/yocto-worker/qemumips/build/build/tmp/work/mips32r2-poky-linux=
/util-linux/2.39-r0/recipe-sysroot=3D  -fdebug-prefix-map=3D/home/pokybuild=
/yocto-worker/qemumips/build/build/tmp/work/mips32r2-poky-linux/util-linux/=
2.39-r0/recipe-sysroot-native=3D  -c -o tests/helpers/test_enosys.o ../util=
-linux-2.39/tests/helpers/test_enosys.c
>> | ../util-linux-2.39/tests/helpers/test_enosys.c:57:6: error: #error Unk=
nown target architecture
>> |    57 | #    error Unknown target architecture
>> |       |      ^~~~~
>> | make: *** [Makefile:10075: tests/helpers/test_enosys.o] Error 1
>> | ERROR: oe_runmake failed
>>=20
>>=20
>> oe-selftest:
>>=20
>> 2023-06-05 23:49:03,868 - oe-selftest - INFO - incompatible_lic.NoGPL3In=
ImagesTests.test_core_image_full_cmdline_weston (subunit.RemotedTestCase)
>> 2023-06-05 23:49:03,870 - oe-selftest - INFO -  ... FAIL
>>=20
>> ERROR: core-image-weston-1.0-r0 do_rootfs: Package util-linux-sulogin ca=
nnot be installed into the image because it has incompatible license(s): GP=
L-3.0-or-later
>> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/oe-sel=
ftest-debian/build/build-st-2841616/tmp/work/qemux86_64-poky-linux/core-ima=
ge-weston/1.0-r0/temp/log.do_rootfs.428774
>> NOTE: recipe core-image-weston-1.0-r0: task do_rootfs: Failed
>> ERROR: Task (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/=
recipes-graphics/images/core-image-weston.bb:do_rootfs) failed with exit co=
de '1'
>> ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Package util-linux cann=
ot be installed into the image because it has incompatible license(s): GPL-=
3.0-or-later
>> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/oe-sel=
ftest-debian/build/build-st-2841616/tmp/work/qemux86_64-poky-linux/core-ima=
ge-full-cmdline/1.0-r0/temp/log.do_rootfs.554152
>> NOTE: recipe core-image-full-cmdline-1.0-r0: task do_rootfs: Failed
>> ERROR: Task (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/=
recipes-extended/images/core-image-full-cmdline.bb:do_rootfs) failed with e=
xit code '1'
>>=20
>>=20
>=20
>=20
> Also, new ptest failures:
>=20
> {'util-linux': ['lsfd:_--inet_option',
>                'mount:_fstab-fallback:_[04]_subdir',
>                'mount:_fstab-fallback']}
>=20
>> On 02/06/2023 10:41:24-0400, Trevor Gamblin wrote:
>>> util-linux's ChangeLog file simply points to the git log, and there are
>>> numerous changes between 2.38.1 and 2.39:
>>>=20
>>> https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/log
>>>=20
>>> There is a notable license change - README.licensing adds the
>>> BSD-2-Clause variant between these versions, but there is no
>>> corresponding file in Documentation/licenses; it's been added it under
>>> LICENSE in the recipe along with a reference to the common-licenses
>>> version. The README.licensing file also lists GPL-3.0-or-later for
>>> some of the code, so add it as well and include a checksum.
>>>=20
>>> Two patches were removed since they're included in 2.39 upstream.
>>>=20
>>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>>> ---
>>> v2 properly deletes the two patch files instead of simply removing them
>>> from the recipe.
>>> ...d_2.38.1.bb =3D> util-linux-libuuid_2.39.bb} |  0
>>> meta/recipes-core/util-linux/util-linux.inc   | 10 ++--
>>> .../0001-check-for-sys-pidfd.h.patch          | 53 -------------------
>>> ...configure.ac-Improve-check-for-magic.patch | 40 --------------
>>> ...til-linux_2.38.1.bb =3D> util-linux_2.39.bb} |  0
>>> 5 files changed, 5 insertions(+), 98 deletions(-)
>>> rename meta/recipes-core/util-linux/{util-linux-libuuid_2.38.1.bb =3D> =
util-linux-libuuid_2.39.bb} (100%)
>>> delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-check-f=
or-sys-pidfd.h.patch
>>> delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-configu=
re.ac-Improve-check-for-magic.patch
>>> rename meta/recipes-core/util-linux/{util-linux_2.38.1.bb =3D> util-lin=
ux_2.39.bb} (100%)
>>>=20
>>> diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb =
b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb
>>> similarity index 100%
>>> rename from meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
>>> rename to meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb
>>> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes=
-core/util-linux/util-linux.inc
>>> index 3868b1c41d..f9e6fb7d21 100644
>>> --- a/meta/recipes-core/util-linux/util-linux.inc
>>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>>> @@ -6,16 +6,18 @@ disk partitioning, kernel message management, filesys=
tem creation, and system lo
>>>=20
>>> SECTION =3D "base"
>>>=20
>>> -LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause & BSD=
-4-Clause"
>>> +LICENSE =3D "GPL-3.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later &=
 BSD-2-Clause & BSD-3-Clause & BSD-4-Clause"
>>> LICENSE:${PN}-libblkid =3D "LGPL-2.1-or-later"
>>> LICENSE:${PN}-libfdisk =3D "LGPL-2.1-or-later"
>>> LICENSE:${PN}-libmount =3D "LGPL-2.1-or-later"
>>> LICENSE:${PN}-libsmartcols =3D "LGPL-2.1-or-later"
>>>=20
>>> -LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D0fd5c050c6187d2bf0=
a4492b7f4e33da \
>>> +LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D12ae7768a65ec8f2e4=
4d930df9cb43fa \
>>>                     file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a42=
63 \
>>> +                    file://Documentation/licenses/COPYING.GPL-3.0-or-l=
ater;md5=3D1ebbd3e34237af26da5dc08a4e440464 \
>>>                     file://Documentation/licenses/COPYING.GPL-2.0-or-la=
ter;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>>>                     file://Documentation/licenses/COPYING.LGPL-2.1-or-l=
ater;md5=3D4fbd65380cdd255951079008b364516c \
>>> +                    file://${COREBASE}/meta/files/common-licenses/BSD-=
2-Clause;md5=3Dcb641bc04cda31daea161b1bc15da69f \
>>>                     file://Documentation/licenses/COPYING.BSD-3-Clause;=
md5=3D58dcd8452651fc8b07d1f65ce07ca8af \
>>>                     file://Documentation/licenses/COPYING.BSD-4-Clause-=
UC;md5=3D263860f8968d8bafa5392cab74285262 \
>>>                     file://libuuid/COPYING;md5=3D6d2cafc999feb2c2de84d4=
d24b23290c \
>>> @@ -35,8 +37,6 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-lin=
ux/v${MAJOR_VERSION}/util-lin
>>>            file://run-ptest \
>>>            file://display_testname_for_subtest.patch \
>>>            file://avoid_parallel_tests.patch \
>>> -           file://0001-check-for-sys-pidfd.h.patch \
>>> -           file://0001-configure.ac-Improve-check-for-magic.patch \
>>>            "
>>>=20
>>> -SRC_URI[sha256sum] =3D "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3eb=
d6a0ecaa4c5117e84f"
>>> +SRC_URI[sha256sum] =3D "32b30a336cda903182ed61feb3e9b908b762a5e66fe14e=
43efb88d37162075cb"
>>> diff --git a/meta/recipes-core/util-linux/util-linux/0001-check-for-sys=
-pidfd.h.patch b/meta/recipes-core/util-linux/util-linux/0001-check-for-sys=
-pidfd.h.patch
>>> deleted file mode 100644
>>> index 19f57f14bc..0000000000
>>> --- a/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.=
h.patch
>>> +++ /dev/null
>>> @@ -1,53 +0,0 @@
>>> -From 548bc568f3c735e53fb5b0a5ab6473a3f1457b91 Mon Sep 17 00:00:00 2001
>>> -From: Khem Raj <raj.khem@gmail.com>
>>> -Date: Sun, 7 Aug 2022 14:39:19 -0700
>>> -Subject: [PATCH] check for sys/pidfd.h
>>> -
>>> -This header in newer glibc defines the signatures of functions
>>> -pidfd_send_signal() and pidfd_open() and when these functions are
>>> -defined by libc then we need to include the relevant header to get
>>> -the definitions. Clang 15+ has started to error out when function
>>> -signatures are missing.
>>> -
>>> -Fixes errors like
>>> -misc-utils/kill.c:402:6: error: call to undeclared function 'pidfd_sen=
d_signal'; ISO C99 and later do not support implicit function declarations =
[-Wimplicit-function-declaration]
>>> -        if (pidfd_send_signal(pfd, ctl->numsig, &info, 0) < 0)
>>> -
>>> -Upstream-Status: Submitted [https://github.com/util-linux/util-linux/p=
ull/1769]
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ----
>>> - configure.ac          | 1 +
>>> - include/pidfd-utils.h | 4 +++-
>>> - 2 files changed, 4 insertions(+), 1 deletion(-)
>>> -
>>> -diff --git a/configure.ac b/configure.ac
>>> -index a511e93de..fd7d9245f 100644
>>> ---- a/configure.ac
>>> -+++ b/configure.ac
>>> -@@ -342,6 +342,7 @@ AC_CHECK_HEADERS([ \
>>> - sys/mkdev.h \
>>> - sys/mount.h \
>>> - sys/param.h \
>>> -+ sys/pidfd.h \
>>> - sys/prctl.h \
>>> - sys/resource.h \
>>> - sys/sendfile.h \
>>> -diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
>>> -index eddede976..d9e33cbc5 100644
>>> ---- a/include/pidfd-utils.h
>>> -+++ b/include/pidfd-utils.h
>>> -@@ -4,8 +4,10 @@
>>> - #ifdef HAVE_SYS_SYSCALL_H
>>> - # include <sys/syscall.h>
>>> - # if defined(SYS_pidfd_send_signal) && defined(SYS_pidfd_open)
>>> -+#  ifdef HAVE_SYS_PIDFD_H
>>> -+#   include <sys/pidfd.h>
>>> -+#  endif
>>> - #  include <sys/types.h>
>>> --
>>> - #  ifndef HAVE_PIDFD_SEND_SIGNAL
>>> - static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *in=
fo,
>>> -    unsigned int flags)
>>> ---=20
>>> -2.37.1
>>> -
>>> diff --git a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-=
Improve-check-for-magic.patch b/meta/recipes-core/util-linux/util-linux/000=
1-configure.ac-Improve-check-for-magic.patch
>>> deleted file mode 100644
>>> index 00611fe578..0000000000
>>> --- a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve=
-check-for-magic.patch
>>> +++ /dev/null
>>> @@ -1,40 +0,0 @@
>>> -From 263381ddd46eea2293c70bc811273b66bc52087b Mon Sep 17 00:00:00 2001
>>> -From: Mateusz Marciniec <mateuszmar2@gmail.com>
>>> -Date: Fri, 19 Aug 2022 14:47:49 +0200
>>> -Subject: [PATCH] configure.ac: Improve check for magic
>>> -
>>> -Check whether magic.h header exists before defining HAVE_MAGIC.
>>> -
>>> -Despite library availability there still can be missing header.
>>> -Current test doesn't cover that possibility which will lead compilatio=
n
>>> -to fail in case of separate sysroot.
>>> -
>>> -Upstream-Status: Backport
>>> -[https://github.com/util-linux/util-linux/commit/263381ddd46eea2293c70=
bc811273b66bc52087b]
>>> -
>>> -Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
>>> -Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
>>> ----
>>> - configure.ac | 6 ++++--
>>> - 1 file changed, 4 insertions(+), 2 deletions(-)
>>> -
>>> -diff --git a/configure.ac b/configure.ac
>>> -index daa8f0dca..968a0daf0 100644
>>> ---- a/configure.ac
>>> -+++ b/configure.ac
>>> -@@ -1570,8 +1570,10 @@ AC_ARG_WITH([libmagic],
>>> - )
>>> - AS_IF([test "x$with_libmagic" =3D xno], [have_magic=3Dno], [
>>> -   AC_CHECK_LIB([magic], [magic_open], [
>>> --    AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagi=
c present.])
>>> --    MAGIC_LIBS=3D"-lmagic"
>>> -+    AC_CHECK_HEADER(magic.h, [
>>> -+      AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libma=
gic present.])
>>> -+      MAGIC_LIBS=3D"-lmagic"
>>> -+    ])
>>> -   ])
>>> - ])
>>> - AC_SUBST([MAGIC_LIBS])
>>> ---=20
>>> -2.37.1
>>> -
>>> diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta/r=
ecipes-core/util-linux/util-linux_2.39.bb
>>> similarity index 100%
>>> rename from meta/recipes-core/util-linux/util-linux_2.38.1.bb
>>> rename to meta/recipes-core/util-linux/util-linux_2.39.bb
>>> --=20
>>> 2.40.1
>>>=20
>>=20
>>>=20
>>>=20
>>>=20
>>=20
>>=20
>> --=20
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>=20
> --=20
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182523): https://lists.openembedded.org/g/openembedde=
d-core/message/182523
> Mute This Topic: https://lists.openembedded.org/mt/99287629/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


