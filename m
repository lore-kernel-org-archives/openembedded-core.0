Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80048C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 12:44:29 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.60])
 by mx.groups.io with SMTP id smtpd.web08.6404.1646397868027054110
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 04:44:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=SKGR4f3y;
 spf=pass (domain: outlook.com, ip: 40.92.90.60,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4hBXoiFi8qSFYj1uvtYBxqYHDkW0S2yX3xPwYbvOEoi1UfBU8xhzK6MSOmV3s7AANBqFXX7hYH1pfTdzw6Ts7rS5uEI7Fgyt+7xudYN22ksW9Iwg+vjBKEyTiJkaLGqvtjqBAad2HiOWKT3w0q3wQ48RHk9TnhKfhgmFp48W8CLaXhp/SZTD5oZOKTYNdxcLPFTeAeEvCrB3VdF7TRdv5sEzdLg80AlH/TBsq566LQD2JXIETPzI0Ufg4PA97DWmhdaag1BrwGiuk0H7FX2wnZKTKI6rEWajqO1dnMoMHd3EOoAW9v8nYqN3Qp55hOgvbNUNHnnSped5kMU86TqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pB4lCPvVZcLQRjckLrvD+1H5cVjOnQDRz+tWMflcv1U=;
 b=MUCW8ealH1eNgZZCB5ylIxiG0JHatxgWfD10Po6doiYwYINtV/DcqOXiROpawDDfu6eZ+mPBNryzWpVoxBK3e965vR2IRSpLVtK/Gl/cDm1oCvao2ePLbKgWIaUXsJkyce3+hfjj5w7FLLTNaz7v8anyQEzMsViazoM9UZtKJ27Jt1EP0jMqsFHG0wsQ8+49iPqKj76RUq3U2wEHlqLh3V/ljpHjzUmi49KCkQRdobHk17U60xoSs9NRMjk8Rwrb3ZYFuCr8dcC7wnWWbeiK0lKQ629DYLDQv8Pq5Sdu0N+Xft7XBmjB0bpS5NtwGk0wJPUaSB06axTOKtvcW8Ow6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pB4lCPvVZcLQRjckLrvD+1H5cVjOnQDRz+tWMflcv1U=;
 b=SKGR4f3yERZgTx6VtbWx6jLOSALc+Q/Zp9D+u9lKGq4FIewA/DICZw+YtChPYn+f4s8QlKWwHjal3RDIAq3Hukjga4F35JGPQJoSOJqVImVnUmhqQaxnudlAaz7XTOsGOep8ti79dI7ojrsDjqGljBYlw3ctibzehgoU93IyU1ObFRvbTJJmKUUPeM4REQVPXG7U9fSEOTNV9w4Gh71N8wWiEvwEdCiyN/DP/re6YAPF4fLStQRkgauwRNqREJSFvQVpU/qNwB9c57wiIR6o5MYtxjNx6VQswCix1pdj2HkTQUlyS22/V4JAqorfaXeiJGWptBi+aWjBss+v0u1qkw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by DB8PR09MB3753.eurprd09.prod.outlook.com (2603:10a6:10:115::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Fri, 4 Mar
 2022 12:44:24 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 12:44:24 +0000
Message-ID: 
 <AM9PR09MB4642E1F4D179551C41AB9217A8059@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Fri, 4 Mar 2022 13:44:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] classes: add setuptools3_legacy
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20220304115525.2240283-1-ross.burton@arm.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: <20220304115525.2240283-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [FvwXt0/HgO08akwoT/4r0OFGxEXk35ySoKBc0VTn0rtpMfwgRojXgDgc5ixmE1eS]
X-ClientProxiedBy: AM5PR0301CA0003.eurprd03.prod.outlook.com
 (2603:10a6:206:14::16) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <66a4a1fd-12d0-0612-4755-0d3a303973f5@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdb3e1c4-a150-4159-ab55-08d9fddcb634
X-MS-TrafficTypeDiagnostic: DB8PR09MB3753:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EFTVFm7XrX1zAsFP4bCaYRsPYPSa+4HuRVLgKSb9eiAXdR7GAitLLr0y8LcmxVQ3vJgZcGOm5V2JPCdzaVUkpcL8oI7SONGel8osx/D36GJl5aPBn7wKw8YiNODjRjpYHc+O1Tuwb3PxgwT0wZ5voeerdkSdGePc77uSFhm7kWwRpVpPLCTOb+AkohutNUua/KFP1TKn5WKtEOt/fFAk3kclDnhCZR74BH4kEp2NiFW9uKZqvluht40bTyGToeYFrdTvJ2/PddsCb86YBKUJZ/M4OpiYJMnikyXnGw+QU3x+gqZWZT7gx2fDo6IcUJOxWDW90rVamBjLJo2J19NQhn5ySl7fC95v/9NDXgobufxBwof3tii1mSu9FeAvccFvPD9CtfsoqLhyUJtl08sT1zEX+89msFvCQZ1m8xLcAtsPUFayj9cK5JKY6vyRacdrlPaY4nStzpqTBiN3fxoymKNOrS72Y/IZBDGA8ODdpCxUoCyTe21o7XwgqGD9HgSA3IpIFs/t3bn267jZGUie+aoYcrq4ujxL1OxVQ1Z7ZcSpg5OGU/3USeBiWeEEem0NeLzb44Z44GFWJWmQJJc+0SJqhUKR8ERYkL8i57xUx2vAnYnvlebic/ylwZG5nLDdf8BpYdeljdU0wJGoFedez7BCzk3tTk216obuz6l6vF8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cmtIUW5iM0ZPbjdsVCtrWW4yd1VRUk9qSjdPekt0UHN3SzJiK3MwVmhnZjdr?=
 =?utf-8?B?RWE1TlNHSE1YdFNlalcwbm9iR25MekY4WGVJUmV5UXN1SW95RE1Dc0p5cWhD?=
 =?utf-8?B?NUp3bkxEdWppdStXUzZFM3NQR2s2YnZ5M0REdW5ja2NoSkhZSDNCcWMrT2J5?=
 =?utf-8?B?b3lwZ3hWYXR5L2tXTDRhUGZkNFlFdTRLejdNei9BRTFld2c2R3hQb0NHai9U?=
 =?utf-8?B?aDNBaWFCbElIY1htbGxuYkk2NjFaNUgyMFFqbHpRUjZxZ0podForOTlkVGJ5?=
 =?utf-8?B?MXlDWjhrK21RYjlQZmtYTFRqMC9wY2w0T0ZlT28vdzBQMlAxS1IyQTRGc0xQ?=
 =?utf-8?B?UXgxS3NaR2hEbHRXMjVZS0lzdXZxMG1TZUswK3hxejhLSE4vVTY0M0FRa3dJ?=
 =?utf-8?B?TUMrdk9qNFlRWk5hVEVJR1FRKzdkLzczVXhoRzlBRlFCODRQVHErYjFRc1ox?=
 =?utf-8?B?QmFlaWVMcW1sNXBTRWpUOWwyekNpZXkwTnl4d1BiaTMxaFlHL0lBeW9tNVJG?=
 =?utf-8?B?T0xSWGtlQzFCZTVicG1BUFRvQnpFd2tjUFU5eE1jYm5TaGhkU0tLa0pJeTZI?=
 =?utf-8?B?a2E3a2wvaXRqY2M3dkZzalVuamhSaUlua054V0lDbFZRNkNqTzN1YUl3RFFu?=
 =?utf-8?B?WHczMmlaKytma3lNL2JHamJweEFnWEtMM1Q2Y2VIbk10MStHQzJPcnA1YVp1?=
 =?utf-8?B?Y2hOeWlxWkxoRGpiZlE1RW5jSHpzUExCOGs4RHJhUC9qN0c1VTV2eUF1VjZK?=
 =?utf-8?B?THl5bVhmRDB4RVM3TUtRV2hsNURwRFdpdnBncVJrbXFPUElySi85TzhjRENH?=
 =?utf-8?B?Ylh1U1owR05WQ0MwVDgyMUxzMSt3ZTU1QkxMcnJDZlp4Vmxoa2hncGFrZFNm?=
 =?utf-8?B?ekt1cVEwbjIwTTJhYUo1OGZlamdNTWtGd0dDcmN0RktkMEhkS290bmt1dDlZ?=
 =?utf-8?B?ZGRFQk9BR1U5Ny8ydkFPeks4RHp4YktkR1p1OFV3bjY5aDJ5WXlibzArOE5R?=
 =?utf-8?B?d0lWajQreVgyNkhUR2NIZXhKZ3pyKzdVVzFUaWpxSDB0V0FjaUh2S25lSzBZ?=
 =?utf-8?B?UElRVjMzQ2lRdkpXNkpQNjhBNklTQXVOYmlVaGRwMGlVVDlRd2lkT0orNnRV?=
 =?utf-8?B?Yy9QWEE0SkhycUlZK0JCZzFvWXRDTEFnRHdsandEMUYwYmx6K3p0WlpoZ0JP?=
 =?utf-8?B?WEpZRHBTNWVLd1NrT09sbE50SzZqK3d5NzdQSFltU3NlVUZQeFBrbDF0OU9F?=
 =?utf-8?B?allaNFdLd0RqWTJrVitNUGpQOHNTdkVtNmNCbFIvYXAveFpMTFRvSHRScWZl?=
 =?utf-8?B?UHk0VndwNk1CZjN4RTJCRSthdkhQbjNrV3Ywa2c3dFJTK3dwRFhMZDNxY1RQ?=
 =?utf-8?B?c3BEMElUdloreUE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cdb3e1c4-a150-4159-ab55-08d9fddcb634
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 12:44:24.4662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB3753
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 12:44:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162716

For me that would be a candidate to be added to meta-python, or are 
there any core recipes that currently break because of the new behavior?

Furthermore the variables names are the same, so if people accidentally 
(or due to complex injection trees/classes/distro settings/whatever have 
new setuptools3 and this class here in the same recipe, things become 
rather unpredictable - as of now there are the same but surely they will 
start to diverge at one point.

While we are at it pypi class needs a fallback too, because for me this 
is the standard way of packaging python recipes and new class points to 
the new setuptools implementation - so if we want to have this here, we 
might need a fallback for pypi class as well


On 04.03.22 12:55, Ross Burton wrote:
> Following a good discussion with PyPA upstream[1] the migration of the
> setuptools3.bbclass to use bdist_wheel+pip turns out to be more complex
> than thought.
> 
> Essentially, we're midway through a lot of changes: the future of Python
> packaging is wheels and pip, but those by design are not as flexible as
> traditional distutils and setup.py.
> 
> Specifically, with traditional distutils the package can implement its
> own install task and write arbitrary files (such as init scripts).  With
> wheels this is explicity impossible, so packages that do this cannot use
> the new setuptools class and must continue to use the build/install tasks
> as before.
> 
> This class is the old setuptools behaviour, bought back. However, as
> distutils and the setuptools install task are both deprecated and will
> soon be removed entirely, any users of this class should be moving to an
> alternative build tool, be it a modern Python tool which works with
> wheels, or a non-Pythonic tool such as Meson.
> 
> [1] https://github.com/pypa/packaging-problems/issues/576
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/classes/setuptools3_legacy.bbclass | 78 +++++++++++++++++++++++++
>   1 file changed, 78 insertions(+)
>   create mode 100644 meta/classes/setuptools3_legacy.bbclass
> 
> diff --git a/meta/classes/setuptools3_legacy.bbclass b/meta/classes/setuptools3_legacy.bbclass
> new file mode 100644
> index 0000000000..5a99daadb5
> --- /dev/null
> +++ b/meta/classes/setuptools3_legacy.bbclass
> @@ -0,0 +1,78 @@
> +# This class is for packages which use the deprecated setuptools behaviour,
> +# specifically custom install tasks which don't work correctly with bdist_wheel.
> +# This behaviour is deprecated in setuptools[1] and won't work in the future, so
> +# all users of this should consider their options: pure Python modules can use a
> +# modern Python tool such as build[2], or packages which are doing more (such as
> +# installing init scripts) should use a fully-featured build system such as Meson.
> +#
> +# [1] https://setuptools.pypa.io/en/latest/history.html#id142
> +# [2] https://pypi.org/project/build/
> +
> +inherit setuptools3-base
> +
> +B = "${WORKDIR}/build"
> +
> +SETUPTOOLS_BUILD_ARGS ?= ""
> +SETUPTOOLS_INSTALL_ARGS ?= "--root=${D} \
> +    --prefix=${prefix} \
> +    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
> +    --install-data=${datadir}"
> +
> +SETUPTOOLS_PYTHON = "python3"
> +SETUPTOOLS_PYTHON:class-native = "nativepython3"
> +
> +SETUPTOOLS_SETUP_PATH ?= "${S}"
> +
> +setuptools3_legacy_do_configure() {
> +    :
> +}
> +
> +setuptools3_legacy_do_compile() {
> +        cd ${SETUPTOOLS_SETUP_PATH}
> +        NO_FETCH_BUILD=1 \
> +        STAGING_INCDIR=${STAGING_INCDIR} \
> +        STAGING_LIBDIR=${STAGING_LIBDIR} \
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
> +        build --build-base=${B} ${SETUPTOOLS_BUILD_ARGS} || \
> +        bbfatal_log "'${PYTHON_PN} setup.py build ${SETUPTOOLS_BUILD_ARGS}' execution failed."
> +}
> +setuptools3_legacy_do_compile[vardepsexclude] = "MACHINE"
> +
> +setuptools3_legacy_do_install() {
> +        cd ${SETUPTOOLS_SETUP_PATH}
> +        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> +        STAGING_INCDIR=${STAGING_INCDIR} \
> +        STAGING_LIBDIR=${STAGING_LIBDIR} \
> +        PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
> +        build --build-base=${B} install --skip-build ${SETUPTOOLS_INSTALL_ARGS} || \
> +        bbfatal_log "'${PYTHON_PN} setup.py install ${SETUPTOOLS_INSTALL_ARGS}' execution failed."
> +
> +        # support filenames with *spaces*
> +        find ${D} -name "*.py" -exec grep -q ${D} {} \; \
> +                               -exec sed -i -e s:${D}::g {} \;
> +
> +        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
> +            if [ -f "$i" ]; then
> +                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${SETUPTOOLS_PYTHON}:g $i
> +                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
> +            fi
> +        done
> +
> +        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
> +
> +        #
> +        # FIXME: Bandaid against wrong datadir computation
> +        #
> +        if [ -e ${D}${datadir}/share ]; then
> +            mv -f ${D}${datadir}/share/* ${D}${datadir}/
> +            rmdir ${D}${datadir}/share
> +        fi
> +}
> +setuptools3_legacy_do_install[vardepsexclude] = "MACHINE"
> +
> +EXPORT_FUNCTIONS do_configure do_compile do_install
> +
> +export LDSHARED="${CCLD} -shared"
> +DEPENDS += "python3-setuptools-native"
> +
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162715): https://lists.openembedded.org/g/openembedded-core/message/162715
> Mute This Topic: https://lists.openembedded.org/mt/89547022/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

