Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9A1D3C912
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 14:27:53 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16951.1765376865395643766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 06:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PhGmd/09;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42e2e671521so4412855f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 06:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765376864; x=1765981664; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lACOc705hsk6Q1W7KrajJpnR3w/3/mHpLYUHwm8YH+w=;
        b=PhGmd/0911/TXmlIwzdXBn6+xrJ510Ak9NQexm3fx2yeWk6XMtuxImTOL+JpbpNHuK
         15tMMTfnwOuATtL1m6BYU6YBpYrtSAfv9f7/9wTVMMbEUnZoi98LOcjWI3Kkw4ATSmYK
         iorWDbhxSRmokdYMo1MIKeZYM2uxr0bQpeRgjEvNyecDmykXDEDONsZ+MriXEQZqi0hf
         0vGOcpW9IK3kC2WB79+APsTbM5tQTx3SxoD149YglgC+VGPg087snGyO6k7f9zfabuCY
         6EnO0mffOuiABcoCWj4rBhUsXxnL4tD0tWq891okeHEauyHM6QW0TVEZlr6R6ga8Jwnc
         rbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765376864; x=1765981664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lACOc705hsk6Q1W7KrajJpnR3w/3/mHpLYUHwm8YH+w=;
        b=EtDHk+5NQxIngJjc81Hyd9OH+HWEfiXDS1mZZRVnNYwcytOfbg1hkkJBKkQZsUejKx
         7WBEKHTFTy4LW0ko55sxIUkGDtUThAPnxwFjlN4/qbgr18HmfG9wV0vsvIul/2x1ASzp
         uELh7u2pFZfBbsZJS6V1IzRwbO3z+/LkQUSxsosX7AAl4qCBUNuSQx4Q4rYNKBb8amD+
         ZCFmN8z9zqIjO6i53OkSBJpkbgVu0CH8OoUSjDzFJNOw8svjnQ4XvhfzrdwuAYcVdHKL
         AH5wbt345rqatJYXGDGf3ikgx8vlTg5hqxjUM4ognnwl1NsTFMUSP8gVuNyZXjgrTIRS
         4n+w==
X-Forwarded-Encrypted: i=1; AJvYcCV1kaLxPGykvOeWNgUhtpR8c4B3KeX6CBrL7MTD87/jqU5c26F9H4RI4+7UiJEhTTdUZdF0nGC89IrY7noC4ePEZQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzJRj9IAVVKoCZNYZjrGkIfuikdEG2+E9FhrPf9DyYwPnsJuH94
	XwTL1AcScABgTg5I1/HA1Gqqh5NA6XZBAkD5yALamALewK+34yMDUG1L
X-Gm-Gg: AY/fxX5IU1UNXvz5PIuZfa2yC+IdJtvDBwUg0l/StLnxFQdnLIvMjL9ttTuhKJRavNt
	Vi3fOYIF03XF7CwdNDH1Q3ByB+t7yhhYLr7hHlgUtUw+7zi/g3DWwu1antQypnkEUmZTY4Q7O6T
	hnjO3UJDOsnEYwXeSQsMiM7Ii9AbGOy25BZrcod6H+H8UqccDeFYcRgvYiMnKBkCMFUF2b61BOT
	1X+KrhFTpOTe7kYdSORVLqp3XPnNyyhUAscfJVeHanXlv01aaETI3v3eIGq1CK4dZhRiXKtdTMY
	cGwQB8iJOD2ZZt5Cd9xoIQWO5yMEdQ1DjockOhO+8d9cmtp27faKj+07Dk7mI3PVQiC2eAtAVkR
	jrAtyD8nGml6er7kPVAK5d6agUDyLuevSOB1CYvEYYysMxTQl6gEHJ3skFDJaYk6DZXwETimVll
	azava99aMjKE8stLvC5VU=
X-Google-Smtp-Source: AGHT+IGzDJ4DmiKby+q9h0dF8cTSHc4Tpz/qqMKV7oqKfZT5HqW5XGYkiFwAnXDjklLKgBGaYMWPcA==
X-Received: by 2002:a05:6000:220e:b0:3f2:b077:94bc with SMTP id ffacd0b85a97d-42fa39cdf46mr2577842f8f.4.1765376863386;
        Wed, 10 Dec 2025 06:27:43 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e29sm38489880f8f.32.2025.12.10.06.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 06:27:42 -0800 (PST)
Message-ID: <b1e90355-721c-4942-aaca-209e43e29096@gmail.com>
Date: Wed, 10 Dec 2025 15:27:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 5/5] dnf5: bump to 5.3.0.0
To: adam.duskett@amarulasolutions.com,
 openembedded-core@lists.openembedded.org
References: <20251210110340.3631065-1-adam.duskett@amarulasolutions.com>
 <20251210110340.3631065-5-adam.duskett@amarulasolutions.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251210110340.3631065-5-adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 14:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227477

On 12/10/25 12:03, Adam Duskett via lists.openembedded.org wrote:
<SNIP>
> diff --git a/meta/recipes-devtools/dnf/dnf_5.3.0.0.bb b/meta/recipes-devtools/dnf/dnf_5.3.0.0.bb
> new file mode 100644
> index 0000000000..961e889fdb
> --- /dev/null
> +++ b/meta/recipes-devtools/dnf/dnf_5.3.0.0.bb
> @@ -0,0 +1,196 @@
> +SUMMARY = "DNF package manager rewritten in C++, using libsolv as a dependency resolver"
> +DESCRIPTION = "\
> +    DNF5 is a command-line package manager that automates the process of \
> +    installing, upgrading, configuring, and removing computer programs in a \
> +    consistent manner. It supports RPM packages, modulemd modules, and comps \
> +    groups and environments. \
> +"
> +HOMEPAGE = "https://github.com/rpm-software-management/dnf5"
> +BUGTRACKER = "https://github.com/rpm-software-management/dnf5/issues"
> +CVE_PRODUCT = "RPM:Dnf5"

While the cpe-vendor is matched case-insensitive way, product matching
is case-sensitive, it should be lowercase. Also, there seem to be at
least 2 valid CVE_PRODUCTS:
$ sqlite3 nvdfkie_1-1.db "select vendor, product from products where
product like 'dnf5';"
rpm|dnf5
rpm-software-management|dnf5

> +SECTION = "base"
> +
> +LICENSE = "GPL-2.0-or-later & LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "\
> +    file://COPYING.md;md5=9733192df318d0f806fd668b92ba0ba6 \
> +    file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +    file://lgpl-2.1.txt;md5=4b54a1fd55a448865a0b32d41598759d \
> +"
> +
> +DEPENDS = "\
> +    fmt \
> +    glib-2.0 \
> +    json-c \
> +    libcomps \
> +    libmodulemd \
> +    librepo \
> +    libsolv \
> +    libtoml11 \
> +    libxml2 \
> +    sqlite3 \
> +    util-linux \
> +"
> +
> +SRC_URI = "\
> +    git://github.com/rpm-software-management/dnf5.git;branch=main;protocol=https \

You could add ;tag=${PV} at the end.

> +    file://0002-cmake-set-CMP0190-to-OLD.patch \
> +    file://0003-Do-not-hardcode-system_cachedir.patch \
> +    file://0004-add-support-for-gcc-12-and-below.patch \
> +    file://0005-fix-string-concatenation-errors-for-musl.patch \
> +    file://0006-add-missing-headers-for-musl.patch \
> +    file://0007-Define-FNM_EXTMATCH-for-musl.patch \
> +    file://0008-libdnf-fix-arm-arch-mapping-issues-for-qemuarmv5.patch \
> +"
> +SRC_URI:append:class-native = " file://0001-Do-not-hardcode-the-systemd-unit-directory.patch"
> +SRCREV = "c6a42c2e7e9ee0a04d46e6820a5962925a99b085"
> +
> +UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
> +
> +inherit bash-completion cmake gettext pkgconfig siteinfo systemd
> +inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3targetconfig', '', d)}
> +
> +PACKAGECONFIG[dnfdaemon-client] = "-DWITH_DNF5DAEMON_CLIENT=ON,-DWITH_DNF5DAEMON_CLIENT=OFF,sdbus-c++"
> +PACKAGECONFIG[dnfdaemon-server] = "-DWITH_DNF5DAEMON_SERVER=ON,-DWITH_DNF5DAEMON_SERVER=OFF,sdbus-c++"
> +PACKAGECONFIG[plugins] = "-DWITH_DNF5_PLUGINS=ON,-DWITH_DNF5_PLUGINS=OFF,curl sdbus-c++ zlib"
> +PACKAGECONFIG[plugin-actions] = "-DWITH_PLUGIN_ACTIONS=ON,-DWITH_PLUGIN_ACTIONS=OFF"
> +PACKAGECONFIG[plugin-appstream] = "-DWITH_PLUGIN_APPSTREAM=ON,-DWITH_PLUGIN_APPSTREAM=OFF,appstream"
> +PACKAGECONFIG[plugin-expired-pgp-keys] = "-DWITH_PLUGIN_EXPIRED_PGP_KEYS=ON,-DWITH_PLUGIN_EXPIRED_PGP_KEYS=OFF,gnupg"
> +PACKAGECONFIG[plugin-manifest] = "-DWITH_PLUGIN_MANIFEST=ON,-DWITH_PLUGIN_MANIFEST=OFF,sdbus-c++ libpkgmanifest"

In which layer is libpkgmanifest? I couldn't find it the layer index.

> +PACKAGECONFIG[plugin-local] = "-DWITH_PLUGIN_LOCAL=ON,-DWITH_PLUGIN_LOCAL=OFF"
> +
> +# sdbus-c++ and journalctl integration.
> +PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF,sdbus-c++"
> +
> +# build options - bindings
> +PACKAGECONFIG[python3] = "-DWITH_PYTHON3=ON,-DWITH_PYTHON3=OFF, python3 swig-native"
> +
> +# No sdbus-c++-native package.
> +PACKAGECONFIG:remove:class-native = "\
> +    dnfdaemon-client \
> +    dnfdaemon-server \
> +    plugins \
> +    plugin-manifest \
> +    systemd \
> +"
> +
> +PACKAGE_BEFORE_PN += "\
> +    ${PN}-dnfdaemon-server \
> +    ${PN}-plugins \
> +    ${PN}-python3 \
> +"
> +
> +# manpages generation requires http://www.sphinx-doc.org/
> +EXTRA_OECMAKE:append = " \
> +    -DENABLE_SOLV_FOCUSNEW=ON \
> +    -DWITH_DNF5_OBSOLETES_DNF=OFF \
> +    -DWITH_DNF5=ON \
> +    -DWITH_GO=OFF \
> +    -DWITH_HTML=OFF \
> +    -DWITH_LIBDNF5_CLI=ON \
> +    -DWITH_MAN=OFF \
> +    -DWITH_PERL5=OFF \
> +    -DWITH_PLUGIN_RHSM=OFF \
> +    -DWITH_RUBY=OFF \
> +    -DWITH_TESTS=OFF \
> +"
> +
> +# No sdbus-c++-native package exists so remove all options that depend on it.
> +EXTRA_OECMAKE:append:class-native = " \
> +    -DWITH_DNF5DAEMON_CLIENT=OFF \
> +    -DWITH_DNF5DAEMON_SERVER=OFF \
> +    -DWITH_DNF5_PLUGINS=OFF \
> +    -DWITH_PLUGIN_MANIFEST=OFF \
> +    -DWITH_SYSTEMD=OFF \
> +"
> +
> +# Create a symlink called 'dnf' as 'make install' does not do it, but
> +# .spec file in dnf source tree does (and then Fedora and dnf documentation
> +# says that dnf binary is plain 'dnf').
> +do_install:append() {
> +    ln -rs ${D}/${bindir}/dnf5 ${D}/${bindir}/dnf
> +    install -d ${D}${sysconfdir}/dnf
> +
> +    # DNF always installs service files to /usr/lib/systemd, even if usrmerge is not
> +    # selected. Also, remove systemd files if systemd isn't selected.
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'false', 'true', d)}; then
> +        rm -rf ${D}${libdir}/systemd
> +    fi
> +
> +    # Breaks dnf because the builddep plugin is provided in the
> +    # dnf-plugins-core package which is not available in oe-core.
> +    rm -f ${D}${datadir}/dnf5/aliases.d/compatibility-plugins.conf
> +}
> +
> +do_install:append:${PN}-plugins() {
> +    ln -rs ${D}/${bindir}/dnf5-automatic ${D}/${bindir}/dnf-automatic
> +}

1. Is that ${PN}-plugins override needed? Couldn't it just be part of
the do_install, if the file exists?
2. The cmake file does install[1] a wrapper script[2] with the same name
and location. Does it not have the same function? (I'm asking, it might
be different)

[1]:
https://github.com/rpm-software-management/dnf5/blob/5.3.0.0/dnf5-plugins/automatic_plugin/CMakeLists.txt#L17
[2]:
https://github.com/rpm-software-management/dnf5/blob/5.3.0.0/dnf5-plugins/automatic_plugin/bin/dnf-automatic

> +
> +# Direct dnf-native to read rpm configuration from our sysroot, not the one it was compiled in
> +do_install:append:class-native() {
> +    create_wrapper ${D}/${bindir}/dnf \
> +        SEQUOIA_CRYPTO_POLICY=${STAGING_DATADIR_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \
> +        RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
> +        RPM_NO_CHROOT_FOR_SCRIPTS=1
> +}
> +
> +do_install:append:class-nativesdk() {
> +    create_wrapper ${D}/${bindir}/dnf \
> +        RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm \
> +        RPM_NO_CHROOT_FOR_SCRIPTS=1
> +}
> +
> +SYSTEMD_SERVICE:${PN} = "\
> +    dnf5-makecache.service \
> +    dnf5-makecache.timer \
> +"
> +
> +SYSTEMD_AUTO_ENABLE ?= "disable"
> +
> +# Packages for testing purposes
> +PACKAGES += "${PN}-test-main ${PN}-test-dep"
> +
> +FILES:${PN} += "\
> +    ${bindir}/dnf* \
> +    ${datadir}/dbus-1/system-services/org.rpm.dnf.v0.service \
> +    ${datadir}/dnf5 \
> +    ${datadir}/polkit-1/actions/org.rpm.dnf* \
> +    ${datadir}/polkit-1/rules.d/org.rpm.dnf* \
> +    ${libdir}/dnf5 \
> +    ${libdir}/libdnf5* \
> +    ${sysconfdir}/dnf \
> +"
> +
> +FILES:${PN}-bash-completion += "\
> +    ${datadir}/bash-completion/completions/dnf5 \
> +"
> +
> +FILES:${PN}-dnfdaemon-server += "\
> +    ${systemd_system_unitdir}/dnf5daemon-server.service \
> +    ${datadir}/dbus-1/interfaces/org.rpm.dnf* \
> +    ${datadir}/dbus-1/system.d/org.rpm.dnf* \
> +"
> +
> +FILES:${PN}-plugins += "\
> +    ${systemd_system_unitdir}/dnf-automatic.service \
> +    ${systemd_system_unitdir}/dnf-automatic.timer \
> +    ${systemd_system_unitdir}/dnf5-automatic.service \
> +    ${systemd_system_unitdir}/dnf5-automatic.timer \
> +"
> +
> +FILES:${PN}-python3 += "\
> +    ${libdir}/${PYTHON_DIR}/site-packages/libdnf* \
> +"
> +
> +FILES:${PN}-systemd += "\
> +    ${systemd_system_unitdir}/dnf5-offline-transaction.service \
> +    ${systemd_system_unitdir}/dnf5-offline-transaction-cleanup.service \
> +"
> +
> +RRECOMMENDS:${PN}:class-target += "bash-completion gnupg"
> +RRECOMMENDS:${PN}-test-main = "${PN}-test-dep"
> +ALLOW_EMPTY:${PN}-test-main = "1"
> +ALLOW_EMPTY:${PN}-test-dep = "1"
> +
> +SKIP_RECIPE[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build without package_rpm in PACKAGE_CLASSES due disabled rpm support in libsolv', d)}"

Since it is being updated, could you please also fix this typo: "due" ->
"due to" ?

> +
> +BBCLASSEXTEND = "native nativesdk"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227470): https://lists.openembedded.org/g/openembedded-core/message/227470
> Mute This Topic: https://lists.openembedded.org/mt/116710030/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


