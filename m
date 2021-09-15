Received: from forward105p.mail.yandex.net (forward105p.mail.yandex.net [77.88.28.108])
 by mx.groups.io with SMTP id smtpd.web12.4909.1631696301196765897
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 01:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=mail header.b=BszDaFyg;
 spf=pass (domain: zhukoff.net, ip: 77.88.28.108, mailfrom: pavel@zhukoff.net)
Received: from sas1-912050a65b23.qloud-c.yandex.net (sas1-912050a65b23.qloud-c.yandex.net [IPv6:2a02:6b8:c14:3983:0:640:9120:50a6])
	by forward105p.mail.yandex.net (Yandex) with ESMTP id 4CC692FD8FD6;
	Wed, 15 Sep 2021 11:58:17 +0300 (MSK)
Received: from sas2-34ddad429748.qloud-c.yandex.net (sas2-34ddad429748.qloud-c.yandex.net [2a02:6b8:c08:b787:0:640:34dd:ad42])
	by sas1-912050a65b23.qloud-c.yandex.net (mxback/Yandex) with ESMTP id INgrzuCo1G-wGDimWbs;
	Wed, 15 Sep 2021 11:58:17 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail; t=1631696297;
	bh=mEtubS49sF1bqR+e57qaAQbS10JqHJlCspg4t/JSVYI=;
	h=In-reply-to:Subject:From:To:Date:References:Reply-To:Message-ID:
	 Cc;
	b=BszDaFygEgAAwW7Lwb+4wlHKiylDveTh+rho3oohNbzNvLq2u79dj7+u5Ul1A5u9y
	 YvLDKV/HdK6k8LzEa8VsJlg8xVdgy/vJGprohLvpiqUQYSuGZ27rCQSNbXGUovra9/
	 Om5dOIU1r3WwODSNo50gW1PLJLU6a/vcrlKHYdd8=
Authentication-Results: sas1-912050a65b23.qloud-c.yandex.net; dkim=pass header.i=@zhukoff.net
Received: by sas2-34ddad429748.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id UGwn21ZlRV-wFvu4goW;
	Wed, 15 Sep 2021 11:58:16 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
References: <87k0jrzghc.fsf@gentoo.zhukoff.net> <YUGw3PclF4eWtwT9@piout.net>
User-agent: mu4e 1.4.15; emacs 27.2
From: "Pavel Zhukov" <pavel@zhukoff.net>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] weston: wrapper for weston modules argument
Reply-To: pavel@zhukoff.net
In-reply-to: <YUGw3PclF4eWtwT9@piout.net>
Date: Wed, 15 Sep 2021 10:58:13 +0200
Message-ID: <87y27yqkpm.fsf@gentoo.zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed

Hello Alexandre,

Rebased and resent v2. I'm sorry about that. Something went wrong 
with my
mail client setup. Used git send-email this time.


On 2021-09-15 at 10:37 CEST, Alexandre Belloni wrote...
> Hello Pavel,
>
> I'm sorry but your patch has been mangled and I didn't manage to 
> apply
> it, do you mind sending it again?
>
> On 08/09/2021 09:14:23+0200, Pavel Zhukov wrote:
>> 
>> Due to custom option parser implementation weston accepts only 
>> one
>> argument of a given type. As the result if multiple modules add
>> multiple --modules agruments only last will be used. This fix
>> introduces wrapper around modules in terms of weston-init to 
>> prepare
>> proper modules argument for weston and adds systemd-notify 
>> module into
>> weston-init module to support Type=notify in systemd service 
>> file.
>> 
>> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
>> ---
>> .../recipes-graphics/wayland/weston-init/weston-start | 11 
>> +++++++++++
>> .../wayland/weston/systemd-notify.weston-start        |  9 
>> +++++++++
>> meta/recipes-graphics/wayland/weston_9.0.0.bb         |  5 
>> +++++
>> 3 files changed, 25 insertions(+)
>> create mode 100644
>> meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
>> 
>> diff --git 
>> a/meta/recipes-graphics/wayland/weston-init/weston-start
>> b/meta/recipes-graphics/wayland/weston-init/weston-start
>> index 0b93dc964a..0f1bc4c29d 100755
>> --- a/meta/recipes-graphics/wayland/weston-init/weston-start
>> +++ b/meta/recipes-graphics/wayland/weston-init/weston-start
>> @@ -21,6 +21,14 @@ add_weston_argument() {
>> # Add openvt extra argument
>> add_openvt_argument() {
>> 	openvt_args="$openvt_args $1"
>> +
>> +}
>> +## Add module to --modules argument
>> +add_weston_module() {
>> +	if [[ "x${weston_modules}" == "x" ]]; then
>> +		weston_modules="--modules "
>> +	fi;
>> +	weston_modules+="${1},"
>> }
>> 
>> if [ -n "$WAYLAND_DISPLAY" ]; then
>> @@ -68,6 +76,9 @@ if [ -d "$modules_dir" ]; then
>> 
>> 		# process module
>> 		. $m
>> +		if [[ x"{$weston_modules}" != "x" ]]; then
>> +			add_weston_argument "${weston_modules}"
>> +		fi;
>> 	done
>> fi
>> 
>> diff --git
>> a/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
>> b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
>> new file mode 100644
>> index 0000000000..a97e7b38d9
>> --- /dev/null
>> +++ 
>> b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
>> @@ -0,0 +1,9 @@
>> +#!/bin/sh
>> +  +# SPDX-FileCopyrightText: Huawei Inc.
>> +# SPDX-License-Identifier: Apache-2.0
>> +
>> +
>> +if [[ -x "/usr/lib/weston/systemd-notify.so" ]]; then
>> +        add_weston_module "systemd-notify.so"
>> +fi
>> diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb
>> b/meta/recipes-graphics/wayland/weston_9.0.0.bb
>> index 1f1d62ea7c..59ab217a3b 100644
>> --- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
>> +++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
>> @@ -9,6 +9,7 @@ SRC_URI =
>> "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>>            file://weston.png \
>>            file://weston.desktop \
>>            file://xwayland.weston-start \
>> +           file://systemd-notify.weston-start \
>
>> file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
>> \
>
>> file://0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
>> \
>>            file://0001-meson.build-fix-incorrect-header.patch \
>> @@ -111,6 +112,10 @@ do_install:append() {
>> 		install -Dm 644 ${WORKDIR}/xwayland.weston-start
>> ${D}${datadir}/weston-start/xwayland
>> 	fi
>> 
>> +	if [ "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 
>> 'yes', 'no', d)}" =
>> "yes" ]; then
>> +		install -Dm 644 
>> ${WORKDIR}/systemd-notify.weston-start
>> ${D}${datadir}/weston-start/systemd-notify
>> +	fi
>> +
>> 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'launch', 
>> 'yes', 'no', d)}" =
>> "yes" ]; then
>> 		chmod u+s ${D}${bindir}/weston-launch
>> 	fi
>> -- 
>> 2.31.1
>> 
>
>> 
>> 
>> 


-- 
Pavel
