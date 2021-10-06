Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7381C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 10:05:38 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.50])
 by mx.groups.io with SMTP id smtpd.web12.9785.1633514737342202317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 03:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=eTAhp2Ui;
 spf=pass (domain: outlook.com, ip: 40.92.73.50,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrY8SLENIrXg+F00Vhb48Q+dv4ozDeyGImWYeA+hisDE+xfHexN2K+uKog6iZBfd0VII/C2fdKRTWQIAMXRVnnMVfrQmjPcZPm+OvTGo4ffsXnUfMR69lzUA+Eyxwn46WQIUaDyk3Wur4IjFbfdnK2yE9DVUU/WgUSLts5glcslf20fm0DRyUQHk3MyW5POFqiFSZSID4Xdd7gXGmZ/tOIHoy+Diq0m6saLRGjVFW7945vqBot46fDzYuznuo0+EnF/O7INswHAmn5397ipvhiaa2F6UB/uJrl9nnjObrmlc4Ukp4zMA8V1Asl0K053I2DyIFdfXyLPPaBM+jfHC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/mBeazVLY4G2OYZBu86k0rEN2E6fxdjLODQNO9x4aQ=;
 b=m2CSzrMzqGaC0AslRFDBmHm32ihXbcDdHZGuJG4RfJ0M346fmeDwiiAJjfzazHC8X01xEzo9pk2wR5qMfN5llVgAVy1g+KA0sYQY7uxDa+fkdXVhCoPtvD+iyl4XuANVBsFHwqWQolXUqER1+3a5LAL/E6bvw2DNdgV96+T4ec7OjbzC/K/vB3juPPSRF4hPIoIlJVoVYpy2MBJzUFeKYDiNMLaxEib9xSuUynj7/uruJXFyStawc/T4xOEyR20iG4pJhL6EGBskc414fIoDFXnScWm6NMoG8UPYnYoMaOIOx61Etw6If1OznQQlLO8wW6Lj/bUo21yexLK1UJOhQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/mBeazVLY4G2OYZBu86k0rEN2E6fxdjLODQNO9x4aQ=;
 b=eTAhp2Uigp+xNU7I5yFjWSfJrPSybderU2sZp3P7Tvh5djlsl8UTHYr96TkgmdtbaIKivjxYYWHDQn8hIlMU8FqUdJfKVG/8DIOQO62xwGQfy5YBzOjKwYVUFjNTUIQw8Hy1IgiCsqGpktGiFzIqOsV9VBTJRFwoWK5ZceH0ezZjJvraxSpbD36/BLDZdCdDS7gX1JFmmoNxhU2/lioy5NSd/AVUbpKogcaOkB+y9FJlsybHQYXjSOExhQ+wDHhY7WhR5l2mkCBV5RiS1YrNpOyGLFAeiaXn/JjVU93f0p3j0kpYmEHMh5ziiHIwG4CwQYoCIe1wT2sFESuFxtusEg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4226.eurprd09.prod.outlook.com (2603:10a6:208:197::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 6 Oct
 2021 10:05:34 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%4]) with mapi id 15.20.4587.018; Wed, 6 Oct 2021
 10:05:34 +0000
Subject: Re: [OE-core] [dunfell][PATCH] weston-init: Override the systemd
 service by a notify-based one
To: Pavel Zhukov <pavel@zhukoff.net>, openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Pavel Zhukov <pavel.zhukov@huawei.com>,
 Andrei Gherzan <andrei.gherzan@huawei.com>
References: <20211006100013.24757-1-pavel@zhukoff.net>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46424EB4DACB1420160DF7D6A8B09@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 6 Oct 2021 12:05:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211006100013.24757-1-pavel@zhukoff.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [8Md9mmNBN7T71k/GcbS/FAxXMr2SBDD4DeJbgONMwV8RLcpK3S1tq07zdw44COis]
X-ClientProxiedBy: AS8PR04CA0131.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::16) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <c96ada49-8c4f-e7bd-d76e-32545a06d171@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:400:bc27:b3ce:9dec:8bd7]
 (2a02:3103:205c:400:bc27:b3ce:9dec:8bd7) by
 AS8PR04CA0131.eurprd04.prod.outlook.com (2603:10a6:20b:127::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Wed, 6 Oct 2021 10:05:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18b64094-d2e6-44ff-e4f3-08d988b0d677
X-MS-TrafficTypeDiagnostic: AM0PR09MB4226:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ydcCv4tHamxjeMnZ0lXOAPlBpYUnDVXQRul/r+GcrMQ+ZVqw357Gqo5lW/Psa8CH3ROxO6h9XrcznHGtAk2iAwJ/KQodo75Y046NelHw9QVWX2S1bX8wwQl0HdrCZbl4HCLzwTq/Gf1WU56MF5Mj/lxwHNPfBtscv34qLEbqV+F75D+p7pH3B7BCfIE7asfJo17l9FAIkn2uK6/yonlUsISoOahRbmbT9X7AJSxugwXxd0QW0vXmo0b9Quq3aPrl6uimKHvfoi3SnxHVcHtApSr0Jnt3rr4g+68rThBvATX0/nxsWIKtYKrt2KfpMD4I2onzsPZ/yD7z3J0KGuFpAzg6VAuGHS09OXg5VH3Cw29MBM0RECa4PIfjQt1qIP7+THDgrf8pMCYQ0GldPg2kzjzQ68+CWHcrD9HdgaVjh4BGsxX4DC+VnaKSk2MG074az0PmYE2iywqEIzzjXUppkdkOaEnrv4O3qYHCBi4neqlQcaZmRMn0GoH7rtUrgvokjPHJnoVPVKqLR21tnIWN7w==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	P9Sk6vbLRXiNQwmYzuQXpdAoQdczf1vQ11mTnbWDNiD06G5/GjtNjpjpcynyXxlLazYA+jGPIutP51Mohbdji8cZ8X432qm2EBtA78dGYf1A2zlMP7kuB+etaIH/xTDEZm86D9+d9iI0gOl7FWjT/fHz6pidpS3XVqo0rSwUVRCsDO2/zN1CrtO09YI9TxR+Ky7cKjM/mkAwkwP7Qtn/Ew==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 18b64094-d2e6-44ff-e4f3-08d988b0d677
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 10:05:34.5589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4226
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 10:05:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156683

Without looking to much into the technical details of this patch,
- it should master first (and then be backported to dunfell)
- the patches to need an Upstream-Status field
- changes should be brought to upstream first (and if rejected then a 
proper explanation has to be provided in the patch metadata)

On 06.10.21 12:00, Pavel Zhukov wrote:
> From: Pavel Zhukov <pavel.zhukov@huawei.com>
> 
> Using systemd notify, a service dependency would be more robust. This
> allows, for example, another service to depend on weston-init without
> having to hack a sleep (or similar). This change required more robust
> handling of weston modules argument due to custom argument parser
> impmentation in weston (only last --modules argument is accepted).
> 
> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>   .../wayland/weston-init/weston-start                 | 12 ++++++++++++
>   .../wayland/weston-init/weston@.service              |  6 ++++++
>   .../wayland/weston/systemd-notify.weston-start       |  9 +++++++++
>   .../wayland/weston/xwayland.weston-start             |  3 +--
>   meta/recipes-graphics/wayland/weston_8.0.0.bb        |  6 ++++++
>   5 files changed, 34 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
> 
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
> index ccc7093425..97471df80d 100755
> --- a/meta/recipes-graphics/wayland/weston-init/weston-start
> +++ b/meta/recipes-graphics/wayland/weston-init/weston-start
> @@ -23,6 +23,15 @@ add_openvt_argument() {
>   	openvt_args="$openvt_args $1"
>   }
>   
> +## Add module to --modules argument
> +add_weston_module() {
> +	if [ -z "${weston_modules}" ]; then
> +		weston_modules="--modules "
> +	fi;
> +	weston_modules="${weston_modules}${1},"
> +}
> +
> +
>   if [ -n "$WAYLAND_DISPLAY" ]; then
>   	echo "ERROR: A Wayland compositor is already running, nested Weston instance is not supported yet."
>   	exit 1
> @@ -65,6 +74,9 @@ if [ -d "$modules_dir" ]; then
>   		# process module
>   		. $m
>   	done
> +	if [ -n "${weston_modules}" ]; then
> +		add_weston_argument "${weston_modules} "
> +	fi;
>   fi
>   
>   if test -z "$XDG_RUNTIME_DIR"; then
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.service b/meta/recipes-graphics/wayland/weston-init/weston@.service
> index 39e193014a..70c706d75c 100644
> --- a/meta/recipes-graphics/wayland/weston-init/weston@.service
> +++ b/meta/recipes-graphics/wayland/weston-init/weston@.service
> @@ -1,3 +1,7 @@
> +# SPDX-FileCopyrightText: Huawei Inc.
> +#
> +# SPDX-License-Identifier: Apache-2.0
> +
>   [Unit]
>   Description=Weston Wayland Compositor
>   RequiresMountsFor=/run
> @@ -5,6 +9,8 @@ Conflicts=plymouth-quit.service
>   After=systemd-user-sessions.service plymouth-quit-wait.service
>   
>   [Service]
> +Type=notify
> +NotifyAccess=all

this can be also achieved with a drop-in file, which is less invasive 
then the proposed change

>   User=%i
>   PAMName=login
>   EnvironmentFile=-/etc/default/weston
> diff --git a/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
> new file mode 100644
> index 0000000000..fdb48cb609
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +# SPDX-FileCopyrightText: Huawei Inc.
> +# SPDX-License-Identifier: Apache-2.0
> +
> +
> +if [[ -x "/usr/lib/weston/systemd-notify.so" ]]; then
> +	add_weston_module "systemd-notify.so"
> +fi
> diff --git a/meta/recipes-graphics/wayland/weston/xwayland.weston-start b/meta/recipes-graphics/wayland/weston/xwayland.weston-start
> index b483c97cf1..22984f50a4 100644
> --- a/meta/recipes-graphics/wayland/weston/xwayland.weston-start
> +++ b/meta/recipes-graphics/wayland/weston/xwayland.weston-start
> @@ -2,6 +2,5 @@
>   
>   if type Xwayland  >/dev/null 2>/dev/null; then
>   	mkdir -p /tmp/.X11-unix
> -
> -	add_weston_argument "--modules=xwayland.so"
> +	add_weston_module "xwayland.so"
>   fi
> diff --git a/meta/recipes-graphics/wayland/weston_8.0.0.bb b/meta/recipes-graphics/wayland/weston_8.0.0.bb
> index 0b383f25f3..2b120d7404 100644
> --- a/meta/recipes-graphics/wayland/weston_8.0.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_8.0.0.bb
> @@ -5,9 +5,11 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
>                       file://libweston/compositor.c;endline=27;md5=6c53bbbd99273f4f7c4affa855c33c0a"
>   
> +
>   SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>              file://weston.png \
>              file://weston.desktop \
> +           file://systemd-notify.weston-start \
>              file://xwayland.weston-start \
>              file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
>   "
> @@ -101,6 +103,10 @@ do_install_append() {
>   		install -Dm 644 ${WORKDIR}/xwayland.weston-start ${D}${datadir}/weston-start/xwayland
>   	fi
>   
> +	if [ "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'yes', 'no', d)}" = "yes" ]; then
> +	        install -Dm 644 ${WORKDIR}/systemd-notify.weston-start ${D}${datadir}/weston-start/systemd-notify
> +	fi
> +
>   	if [ "${@bb.utils.contains('PACKAGECONFIG', 'launch', 'yes', 'no', d)}" = "yes" ]; then
>   		chmod u+s ${D}${bindir}/weston-launch
>   	fi
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156682): https://lists.openembedded.org/g/openembedded-core/message/156682
> Mute This Topic: https://lists.openembedded.org/mt/86115689/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

