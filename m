Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.71])
 by mx.groups.io with SMTP id smtpd.web12.11257.1593785964731888585
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=On0ZwDBq;
 spf=pass (domain: windriver.com, ip: 40.107.223.71, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5WI6L3B95xio5DvoBwc7/95G7+CtkrQTSBztFgEeXQcagnycUaO6j5tAD8QHaZqJRmNpOdEiqmS8W/ZKVS2VmjDjpOj6GR9FiEwWVRpbCSNyG7YcBM+fPVw/QpjMAGvP4ZH9E9nqK0nN+b8MToEmRu3VCHPMDH2BKDHlgKltBZQ4whe5mfa3tdCTU0NIMJxv3zST7g7V8OkFMZ2GyoEEqxiLNfBjOFSoH9hg/+ZE1hV3pEox/U8sFc/1ZvregueN12Cy8fPI+w2SflZzBDkGVNpKOApIsyI6FbSMDuCPJNJakmPYMegqH0DVylz9Ab0K6ADm76hxVrdurbF3XyeUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAyshxqN4JWjqWLrxC0HiHWmvarXQ1KcZgFvzYSOzq4=;
 b=ATkW7G/a2xg0qAygPt0vAsmvnOki/Nr2Gq/QwWOWWoBYEk8iMS6CtCxRY8Sx81LAyNomEiEZ9fWeIo1ZanSg4FA5e54vQPaf1ZLhhRc6HyPUZuwkGjS9kcGoG158z9MxnXPrOKKSOMcdbtTAUdgdUpqq1aZAfL651bvr8WIUZazmF+BLY4O+lYaXF/wYdqBVD09TzRyS6S/jTgOI3VLbh3aaRPJ6isxx/TQkBEwnMo++4plgCp55/VzDpWJqDhkT1IeA9bzX9JKnNCt4k5tI7lWlNRur/u7ioARv1Op9ZQ3RVQ+pG1hyxxNIjTkV+/eUTs9zotgCBER1w6dFNo7Vfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAyshxqN4JWjqWLrxC0HiHWmvarXQ1KcZgFvzYSOzq4=;
 b=On0ZwDBq/xTUjVsTM8UBvuAHCVVzrZQwGRrLuGYVVUros2diUg2TISw68PJ1uzicPYZBbsNWpyNUOH8Jt0sWGEvEV94QQPatj8pw76W42wRwI71VWZa3LXXY7iYsSBrOArWBIuHQEw3GEoPKuornD5o/cdihITuoV6H1illHKjI=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB2728.namprd11.prod.outlook.com (2603:10b6:a02:ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Fri, 3 Jul
 2020 14:19:22 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702%4]) with mapi id 15.20.3153.028; Fri, 3 Jul 2020
 14:19:22 +0000
Subject: Re: [OE-core][PATCH v4] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
 richard.purdie@linuxfoundation.org
References: <161E42A233FD1E16.6183@lists.openembedded.org>
Message-ID: <894d3fcf-2a68-e521-1a79-95210dc5e234@windriver.com>
Date: Fri, 3 Jul 2020 22:19:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <161E42A233FD1E16.6183@lists.openembedded.org>
X-ClientProxiedBy: HK2P15301CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::27) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2P15301CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.1 via Frontend Transport; Fri, 3 Jul 2020 14:19:20 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 695ceb96-002f-459c-850e-08d81f5c146f
X-MS-TrafficTypeDiagnostic: BYAPR11MB2728:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2728D3F7CFBA5E4DF2B7C30CE46A0@BYAPR11MB2728.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7f/loVBMnkc7YQfLOfwPqw6DYmlqnSgmdARTu8EWKDqGmJo33m1vzieU8q4tWEN7/Tm6IXb89HWD4Z7Bimc5XBJARms7//a5hElzhjqWYDa99GK57BG5Sil/E/ifaRSU7tWyt6xVZ7LDgAh97jx1TZK/l0PtqRLsWbvi6K7vBYjeBOWrP2wMXu6NHn7CZHaka7j8IsPBGAuGDNt9ay428bsAdpEbgZJsuM1HiQnwMmyTYX2pUD4kWyl+7WK/A3zqxekaiTrdWjNhH/YvjP1UksyNADGBH1USB39VMcJCW+pH06a3Yyx4tobPxwFhngvodLX3LIYvnAQDSnLjDaWXXnCjG9z2G5b6Uwtb+xtXmEb/2zpBDy/kHjloRAmq+dada5LLoSjXnawL4fbTTjvG4I3xCA2MKVbSCimmr8m1Km1ZK/2G16bMlQCGAsyDzRNsYEls13iSpD6D9ULPwJjSUXr/Gf9D48JexyEnw0O+FeYqhAs6Kj84oiVZETdSRGF2pdSGgkp+hMfw6cYegcVx8w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(396003)(136003)(376002)(39850400004)(366004)(16526019)(6486002)(186003)(36756003)(6706004)(53546011)(31686004)(8936002)(6666004)(316002)(52116002)(2616005)(16576012)(478600001)(956004)(26005)(966005)(66476007)(66556008)(2906002)(66946007)(5660300002)(31696002)(83380400001)(8676002)(86362001)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	T1c3UhhHz/TzdlxDSCfq0FFy1PJbLOeoxPi6rRf7zhCmN/FGZx9aOU5bPPftvALJXsIkH/XEOHDiIu7rhGbxvXYO09vw0fcxy1JNlm+PcPcxknsLuP6ULk5tWRw5t3kMX9mvHnELnm6J6B9TY3bRPYYq5HrfnY5HbcOGRWcc7VaQTlPCQIOsSF9cJB7atuB/0Kwyxd/W/GqyYgrjP0rEtDFY6xVzYJOMPIbpxtUx1omQHoQuCZc7aVYTW6lOwRkZPHuocQIA+G3iXjpLDZlEFr4MAd8netUvQWJx4rMYn7FVOiOWvK9QTdxTNGXmS1cjBV8UbLl8iDzaWmcEvy9mZx9uwvaKTawfL6HHftzrtYLNhIUHuGHbk2MCEXxEIQaNXrAfHEAjIn5UNVoi8K8zIqG993q4eEEl2JaT0y9mYOp5P+3xPZBI9S9V+ED3tu3dh6RFAbhsKZPzo0+vcEfrys4f3hopo6LvvSwlZG5aFXA=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695ceb96-002f-459c-850e-08d81f5c146f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:19:21.7148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0JxZT63PMIxvymNnShC09WkaykYoBHnDL1nhcHvlayU2rHGTY9HCGjjxNguTF+Mu9ZXNXmvsoMrz6IXFgBFyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2728
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

This patch can make ensure that unversioned kernel image symlink will be
added to the rootfs during do_install by post install and it can fall
back to make a copy if the unversioned kernel image symlink creation
fails on target.

I have done the basic test on my board and the oe-selftest for this
patch. The test passed.


$ oe-selftest -r efibootpartition.GenericEFITest.test_boot_efi
2020-07-03 10:16:29,211 - oe-selftest - INFO - Adding layer libraries:
2020-07-03 10:16:29,211 - oe-selftest - INFO -=20
/buildarea/raid0/yxu2/repo/poky/poky/meta/lib=20

2020-07-03 10:16:29,211 - oe-selftest - INFO -=20
/buildarea/raid0/yxu2/repo/poky/poky/meta-yocto-bsp/lib=20

2020-07-03 10:16:29,212 - oe-selftest - INFO -=20
/buildarea/raid0/yxu2/repo/poky/poky/meta-selftest/lib=20

2020-07-03 10:16:29,212 - oe-selftest - INFO - Running bitbake -e to=20
test the configuration is valid/parsable=20

2020-07-03 10:16:43,055 - oe-selftest - INFO - Adding: "include=20
selftest.inc" in=20
/buildarea/raid0/yxu2/repo/poky/poky/1285-st/conf/local.conf=20

2020-07-03 10:16:43,055 - oe-selftest - INFO - Adding: "include=20
bblayers.inc" in bblayers.conf=20

2020-07-03 10:16:43,056 - oe-selftest - INFO - test_boot_efi=20
(efibootpartition.GenericEFITest)=20

2020-07-03 11:40:03,056 - oe-selftest - INFO - Keepalive message=20
=20

2020-07-03 12:29:28,901 - oe-selftest - INFO -  ... ok
2020-07-03 12:30:46,074 - oe-selftest - INFO -=20
----------------------------------------------------------------------=20

2020-07-03 12:30:46,074 - oe-selftest - INFO - Ran 1 test in 8055.415s
2020-07-03 12:30:46,074 - oe-selftest - INFO - OK
2020-07-03 12:30:51,602 - oe-selftest - INFO - RESULTS:
2020-07-03 12:30:51,602 - oe-selftest - INFO - RESULTS -=20
efibootpartition.GenericEFITest.test_boot_efi: PASSED (7965.85s)=20

2020-07-03 12:30:51,617 - oe-selftest - INFO - SUMMARY:
2020-07-03 12:30:51,617 - oe-selftest - INFO - oe-selftest () - Ran 1=20
test in 8055.416s
2020-07-03 12:30:51,617 - oe-selftest - INFO - oe-selftest - OK - All=20
required tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D=
0)


Cheers=EF=BC=8C

Yanfei


On 7/3/20 9:55 PM, Xu, Yanfei wrote:
> From: Yanfei Xu <yanfei.xu@windriver.com>
>=20
> Some filesystems don't support symlink, then you will get failure wh
> you install or update the kernel rpm package. Now we use a copy of
> image for these filesystems instead of symlink.
>=20
> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>   meta/classes/kernel.bbclass | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 20a0135fc9..b01c1699ae 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -94,6 +94,25 @@ python __anonymous () {
>           d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kna=
me, typelower))
>           d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-$=
{KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>           d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
> +        d.setVar('pkg_postinst_%s-image-%s' % (kname,typelower), """set=
 +e
> +if [ -n "$D" ]; then
> +    ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/null 2=
>&1
> +else
> +    ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
> +    if [ $? -ne 0 ]; then
> +        echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlin=
ks, falling back to copied image (%s)."
> +        install -m 0644 ${KERNEL_IMAGEDEST}/%s-${KERNEL_VERSION} ${KERN=
EL_IMAGEDEST}/%s
> +    fi
> +fi
> +set -e
> +""" % (type, type, type, type, type, type, type))
> +        d.setVar('pkg_postrm_%s-image-%s' % (kname,typelower), """set +=
e
> +if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
> +    rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
> +fi
> +set -e
> +""" % (type, type, type))
> +
>  =20
>       image =3D d.getVar('INITRAMFS_IMAGE')
>       # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is =
set to 0,
> @@ -385,9 +404,6 @@ kernel_do_install() {
>   =09install -d ${D}/boot
>   =09for imageType in ${KERNEL_IMAGETYPES} ; do
>   =09	install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IM=
AGEDEST}/${imageType}-${KERNEL_VERSION}
> -	=09if [ "${KERNEL_PACKAGE_NAME}" =3D "kernel" ]; then
> -	=09	ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${i=
mageType}
> -	=09fi
>   =09done
>   =09install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>   =09install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>=20
>=20
>=20
>=20
