Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26ECC433EF
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 07:37:25 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.20])
 by mx.groups.io with SMTP id smtpd.web09.21305.1637912243901518134
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 23:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=Car6ZpUx;
 spf=pass (domain: outlook.com, ip: 40.92.89.20,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qq1DzrgBDNimgNv9v8iwBkdW9CpHH9jd02k3IUZg2wEHbJmDk1+WI5LD549hadjqWLdzDSPJ+A5xGy/gg+6Cvn2vNkwA9q8PH+ZWT8adR8QtTM0dndPtyNXgOwYktiIiH0tfY4uMKbN3TYexmiHhrI0lgDV+2vTNpsXh5IboAqRErfXnljOXLVWdPH9DrYxlR3BgnUmpXmm0Qc6ml3oR8t/hbCz+tS2t+adSf6f7D8vJ0SsriPJ4ExspS17UdplCMpsauewye+eiWbiNAqvHZF/tCd340VI4ldUGnI4JkcDQJS++QprFgdQovXLGCdfOnSxgxNbufmFAkkHb05sujA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbcEs8UkYLa8/zb+cNseOF9fwhaPfw7hJEYR2QxJbpk=;
 b=DKbNHZq/4H62Ue/+dgfY7gZGw9K9jaPFppQU1mA4ZH/8D9IzQj2RVYc3zo++hGeskpFtQ/eYbr4bFka7AM/9hII7T52bekXo3XUrUlqTStejhQH4RbWn095a7NvUQm56JeNDbDoBGV0Yp2Ce3uWyUYKkxq/yoczjw/CUw1bsH4irOE9ofunzZ5EvGJBuv026uKGBFrJYs0PGhgFIS6pP20m5OTeFGoxH17Obe1FGf2/fi8ydbUY2g+uIfiqPXIDELd3se2bakjYpZdRGE2ec3Yuw9XzpyLUHGRJcaHEm6Sl+N3yj/dBw04YMhhgSA3v2WIQkCuv0xGDMCAuMDp4cBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbcEs8UkYLa8/zb+cNseOF9fwhaPfw7hJEYR2QxJbpk=;
 b=Car6ZpUxLVc4UMLawRoAb4YJvNHiWq4jp2+EbMXeFs1AQ4FZcAzWEYa7UvjI6MSWht2HU/Og7hz79flqM24QBExc4Y7yCvrySH7KrnOycau7Koarf8QxBdIdzVrNXdeB+TA/7LDG7+VOrMx7+CeXw1BN0IIUU2QarEZL00zH1i74RXQ0ei+lO7G6Z7F5BK9tLr1WhgbsFXeUfukuvJRiUNgWVdronn80p8R8aNfh/5HP0s6k+TLh6T6/No2Pq2nRjHqnm+l0FxX+AvnL1kaNhbZZg2wHX6kHLuyKu1KTQQZsQEnrypicsksuqy5MEeA5HgorQR5FuAXbtI3lo1n10g==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM9PR09MB5043.eurprd09.prod.outlook.com (2603:10a6:20b:305::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 07:37:21 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%3]) with mapi id 15.20.4734.020; Fri, 26 Nov 2021
 07:37:21 +0000
Subject: Re: [OE-core] [RFC PATCH 02/26] setuptools: refactor for no distutils
 bbclasses
To: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
References: <cover.1637900380.git.timothy.t.orling@intel.com>
 <ccb8f5e5b91450066e8cd677ba7552b0518df760.1637900380.git.timothy.t.orling@intel.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642085E4B0028C36F228346A8639@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Fri, 26 Nov 2021 08:37:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <ccb8f5e5b91450066e8cd677ba7552b0518df760.1637900380.git.timothy.t.orling@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [LrdkGN9VNSRxcOJ3/L/7hzx3wvOhuQ8db2LMZ9Yuj7u+9asc1PuQiPiPs969yvzF]
X-ClientProxiedBy: AM0PR01CA0118.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::23) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <a4f946fb-9307-f502-2c8b-b0054c36f28a@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM0PR01CA0118.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Fri, 26 Nov 2021 07:37:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38f81491-7b83-4c8c-93cb-08d9b0af94ce
X-MS-TrafficTypeDiagnostic: AM9PR09MB5043:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G3d5N4V+vwAvLSz12Cnr2wd4Hj6kr413dBTJtiHeL4bGK14crBrhfAHYFr9IAhE6M5S22GDB6TJ3zgZ4cINlqwICxZImyOrWetcOV5h+YarPzIdyOqMCkNsc+5pXin3Iipt26LmOWuSofPdNCZnVv/1m0SBe4QJLSrh4fgchNYno9ha+Ljo1isIMDRMoMnACZ8MNU/xge9m9btu8mItF1cNyMt8gpXzWUkZRcygTAHR2rupfjpZHCuBqW6lFKozU0q1Xjt0VTwfEcIdelDHcNOrbDoa6eTm5qzM6WBNwzoNpzEvKIrgMcnDo72agykYaNLEl/KqdqmGuE7bEdaEzXtl0Yk8KDeeGGbpu6+fIQcZkhs6rPtt9M4BSq3u15e7AQHAGRRxRKkfdujMrULwa8ROdE7c1t6YA/u6WQvN1+pj52VPbTpSegvILMkKvGdN61gARm7RWgl0CwxRt93udg4V/hfjJb+guPL+xxW5iZMeZYRapiMU0tPivqp8AwIBvSqHmyxsiGcYGkewniqBSohs+SPJlaiOeigIajtdmAHhgsm5liyE2M9CiKjjdylqa+NzPwnUspuc9HTByUyY2Xg5HKyILAl4J0flKd0JEbupVTn+XUzXf0Kiw0kcgZJOvjh9eIesdRq+InkDFWzQqrswzR+J48o7DQlu/Z/FRKWA=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aiYBNO9ICIROYXE+7v7azrf0zzrswNHIHbFoK4qgU3kp0Gn/H8wkwaP4s3w1UKCrJabtI9aBQNTZgoXdUICBk8ri3rN80OsjEP+d5OCc1OcMcUDWO5GFMI70Ib0YozVQ2MUq+BRc/JmuRs1xUU7Tv0FuQ1DwHQK+LmdzAflpvlyifqMaKcp6df22QmHazK5go3FVSeVLItiPAcmLwadkOqEDvLzk4zZ7ld+QGo22Oo7rGjF5yozh3l+AE6dNk6Ncxww10/RB2TQ4bzduWfAv4a4jh6DSXpDgVTnjpsUFQeoRj/2K+nuDBG99+WXoRfmxdytycLy6v/9cBog11BcgInSoKxw/2e/CPYTKbu+GqFjYDEFb9QpulXC/wNVUMU/Gcd+Mo9CQPm4BOUTXYTvf1QGT5w+NSQsd4CG2WdgLpZ2kEmcgGyAsBRRCCzGx2dieDRPJHAu/yuuSqw4/2Vh1WAKnG/mIsGGgmkzW1L4RsdErZJjdXh+c34P9Q/tXqDF0dhTmnhCAOkIRhufZmQquVBHtsD6xFYSqF0YSUB6zU1TGklMxA4X198bXyHvkx+iQmskaijW9kgvDN/WhFlj6cyY3qRkVwm0rnEpogbuzTCcOYXkg4uGVajSVXqbgTTfUVbLqiZ5HknmcGZPBISxiHhGukfx3JYjS7L8vi+438QsXVYyuq8O764T3t6keAcHE0nOG+V5ucDd8pRhQ4H4EoHOb//7QSH82R0JhWJG9PDCZ3Zau58c0K+4DzVrXyyB3TMMKG2nFI1anHpF11rWSGg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 38f81491-7b83-4c8c-93cb-08d9b0af94ce
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 07:37:21.6168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR09MB5043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 07:37:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158825



On 26.11.21 05:35, Tim Orling wrote:
> Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
> ---
>   meta/classes/setuptools3-base.bbclass | 31 +++++++++++++
>   meta/classes/setuptools3.bbclass      | 67 ++++++++++++++++++++++++++-
>   2 files changed, 97 insertions(+), 1 deletion(-)
>   create mode 100644 meta/classes/setuptools3-base.bbclass
> 
> diff --git a/meta/classes/setuptools3-base.bbclass b/meta/classes/setuptools3-base.bbclass
> new file mode 100644
> index 00000000000..5098ae9d64e
> --- /dev/null
> +++ b/meta/classes/setuptools3-base.bbclass
> @@ -0,0 +1,31 @@
> +DEPENDS:append:class-target = " ${PYTHON_PN}-native ${PYTHON_PN}"
> +DEPENDS:append:class-nativesdk = " ${PYTHON_PN}-native ${PYTHON_PN}"
> +RDEPENDS:${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
> +
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
> +
> +# LDSHARED is the ld *command* used to create shared library
> +export LDSHARED  = "${CCLD} -shared"
> +# LDXXSHARED is the ld *command* used to create shared library of C++
> +# objects
> +export LDCXXSHARED  = "${CXX} -shared"
> +# CCSHARED are the C *flags* used to create objects to go into a shared
> +# library (module)
> +export CCSHARED  = "-fPIC -DPIC"
> +# LINKFORSHARED are the flags passed to the $(CC) command that links
> +# the python executable
> +export LINKFORSHARED = "${SECURITY_CFLAGS} -Xlinker -export-dynamic"
> +
> +FILES:${PN} += "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
> +
> +FILES:${PN}-staticdev += "\
> +  ${PYTHON_SITEPACKAGES_DIR}/*.a \
> +"
> +FILES:${PN}-dev += "\
> +  ${datadir}/pkgconfig \
> +  ${libdir}/pkgconfig \
> +  ${PYTHON_SITEPACKAGES_DIR}/*.la \
> +"
> +inherit python3native python3targetconfig
> +
> diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
> index 8ca66ee708e..4b8eca3f96e 100644
> --- a/meta/classes/setuptools3.bbclass
> +++ b/meta/classes/setuptools3.bbclass
> @@ -1,4 +1,69 @@
> -inherit distutils3
> +inherit setuptools3-base
>   
> +B = "${WORKDIR}/build"
> +distutils_do_configure[cleandirs] = "${B}"

I hope this will be removed in a later patch, as the function name 
doesn't match the rest of the class code function naming.
Or this here deserves a in code explantion

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
> +setuptools3_do_configure() {
> +    :
> +}

Why do we need to export an empty function?
Wouldn't it make sense to use noexec here?

> +
> +setuptools3_do_compile() {
> +        cd ${SETUPTOOLS_SETUP_PATH}
> +        NO_FETCH_BUILD=1 \
> +        STAGING_INCDIR=${STAGING_INCDIR} \
> +        STAGING_LIBDIR=${STAGING_LIBDIR} \
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
> +        build --build-base=${B} ${SETUPTOOLS_BUILD_ARGS} || \
> +        bbfatal_log "'${PYTHON_PN} setup.py build ${SETUPTOOLS_BUILD_ARGS}' execution failed."
> +}
> +setuptools3_do_compile[vardepsexclude] = "MACHINE"

Please append or += here otherwise manipulation done to this function 
vardepexclude done *before* the inherit in the recipe will be lost, 
without people noticing that easily

> +
> +setuptools3_do_install() {
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
> +setuptools3_do_install[vardepsexclude] = "MACHINE"

Same here about the vardepexclude

> +
> +EXPORT_FUNCTIONS do_configure do_compile do_install
> +
> +export LDSHARED="${CCLD} -shared"
>   DEPENDS += "python3-setuptools-native"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158798): https://lists.openembedded.org/g/openembedded-core/message/158798
> Mute This Topic: https://lists.openembedded.org/mt/87313857/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

