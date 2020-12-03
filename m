Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.1723.1607022477442191674
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 11:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k6HAnCra;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id q22so3171094qkq.6
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 11:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aQHuHWIx4hdBc1fJU/ohWdRQ5vUiU6hKWB8+fYsQiFM=;
        b=k6HAnCranh5UGxnxvukUHEl5FTXdpluRdYv6aIUbphb2GwFTOzNABWttVHEvqiobBv
         YGn0WynlPS5CljlisAe8jRVeiCrqRv/j7yg2GN52iUERVJxCy9gm1vNf9A8sc0zSmGLU
         fZTbUmn5ShGIOKlMsJqzSTysDx7AZBz0u/VdX73mdxoQqw/776EwV2olS/ZRg0DyEOQw
         ssIzCbCyDURsfjnLLcVbLte54rx95AjUS1b+WfrHit6PQYgrmL5pKfRlSKR0Q95ab3Ns
         6kEc+dQwSKrF9H1Rw4hhruVwzIRDXHiFyl7KVjNO+CbtCWaok3EZLwTfKVjEbINusHnA
         HyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aQHuHWIx4hdBc1fJU/ohWdRQ5vUiU6hKWB8+fYsQiFM=;
        b=U0s+ahWjZEcr7mLFE8SzANKTWzFssv5jo0XXTT8CRVoRbGvVaslhCjm3tA3EL5Dthy
         n/qlnmw+CsbRAsBowncLTUSjkpvAm+AYJySsmF/fPViGfB/1eYjbKkMSp6lwMoVY3bL0
         gmrRVn5qPw6BgCe/Msw7DyZWh20MMINoQoabq6VJkR1eyy3sGyUPk4ilefc/PbtvFI2Q
         DA7ZjR20VLB8s18+LbiGk50RUuNasGNqDC6MvDFLq5Bho31QKRxzP/qWnMWxGPnZnam3
         y1X+89fEpBCBSUir+yAqNyEbThoCBz8NWfPsBArsjgYlf3Qh0CzFtuSolAx2vN7/5p7Y
         Sdbw==
X-Gm-Message-State: AOAM531LBhXMeNgQknYuyFPjjtpZNBfhK7iXBWx57nSBBajxne2vBTFE
	oO9hPUz6BQhtOXUauTDXEd5QtPt85OPvyD42164=
X-Google-Smtp-Source: ABdhPJy3A3i3n9IYysGjpF0ltPAHd7eM71KUpGXCZzXHp7dXk829zyBYIbBnDJ9e7P8LlrSIA9SFk0xDq8RX9/KmtYg=
X-Received: by 2002:a37:8943:: with SMTP id l64mr4418353qkd.212.1607022476497;
 Thu, 03 Dec 2020 11:07:56 -0800 (PST)
MIME-Version: 1.0
References: <20201203133727.12936-1-alex.kanavin@gmail.com> <20201203133727.12936-2-alex.kanavin@gmail.com>
In-Reply-To: <20201203133727.12936-2-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Dec 2020 11:07:30 -0800
Message-ID: <CAMKF1spavgHqm9YuCqo3mr-=kRGzW-J60T4gTQ5=uoBn98Hb9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/11] kea: fix reproducibility
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 3, 2020 at 5:37 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...er_unittest_support.cc-do-not-write-.patch | 27 +++++++++++++++++
>  meta/recipes-connectivity/kea/kea_1.7.10.bb   | 29 +++++++++++--------
>  2 files changed, 44 insertions(+), 12 deletions(-)
>  create mode 100644 meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
>
> diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
> new file mode 100644
> index 0000000000..226bc5b311
> --- /dev/null
> +++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
> @@ -0,0 +1,27 @@
> +From 9985a03f13da4d7bb0a433f7305d2ffae3d82a27 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 10 Nov 2020 15:57:03 +0000
> +Subject: [PATCH] src/lib/log/logger_unittest_support.cc: do not write build
> + path into binary
> +
> +This breaks reproducibility and is needed only in unit testing.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + src/lib/log/logger_unittest_support.cc | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/lib/log/logger_unittest_support.cc b/src/lib/log/logger_unittest_support.cc
> +index 58dbef8..9a2929c 100644
> +--- a/src/lib/log/logger_unittest_support.cc
> ++++ b/src/lib/log/logger_unittest_support.cc
> +@@ -84,7 +84,7 @@ void initLogger(isc::log::Severity severity, int dbglevel) {
> +     const char* localfile = getenv("KEA_LOGGER_LOCALMSG");
> +
> +     // Set a directory for creating lockfiles when running tests
> +-    setenv("KEA_LOCKFILE_DIR", TOP_BUILDDIR, 0);
> ++    //setenv("KEA_LOCKFILE_DIR", TOP_BUILDDIR, 0);
> +

does this test then work or do we also need to ensure that
KEA_LOCKFILE_DIR is set to somewhere in /run dir
via Compiler flags or some such

> +     // Initialize logging
> +     initLogger(root, isc::log::DEBUG, isc::log::MAX_DEBUG_LEVEL, localfile);
> diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-connectivity/kea/kea_1.7.10.bb
> index 1d011ace78..c9a11908e5 100644
> --- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
> +++ b/meta/recipes-connectivity/kea/kea_1.7.10.bb
> @@ -7,18 +7,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=68d95543d2096459290a4e6b9ceccffa"
>
>  DEPENDS = "boost log4cplus openssl"
>
> -SRC_URI = "\
> -    http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
> -    file://0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch \
> -    file://kea-dhcp4.service \
> -    file://kea-dhcp6.service \
> -    file://kea-dhcp-ddns.service \
> -    file://kea-dhcp4-server \
> -    file://kea-dhcp6-server \
> -    file://kea-dhcp-ddns-server \
> -    file://fix-multilib-conflict.patch \
> -    file://fix_pid_keactrl.patch \
> -"
> +SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
> +           file://0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch \
> +           file://kea-dhcp4.service \
> +           file://kea-dhcp6.service \
> +           file://kea-dhcp-ddns.service \
> +           file://kea-dhcp4-server \
> +           file://kea-dhcp6-server \
> +           file://kea-dhcp-ddns-server \
> +           file://fix-multilib-conflict.patch \
> +           file://fix_pid_keactrl.patch \
> +           file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
> +           "
>  SRC_URI[sha256sum] = "4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
>
>  inherit autotools systemd update-rc.d upstream-version-is-even
> @@ -50,6 +50,11 @@ do_configure_prepend() {
>      sed -i "s:@abs_top_srcdir@:@abs_top_srcdir_placeholder@:g" ${S}/src/bin/admin/kea-admin.in
>  }
>
> +# patch out build host paths for reproducibility
> +do_compile_prepend_class-target() {
> +        sed -i -e "s,${WORKDIR},,g" ${B}/config.report
> +}
> +
>  do_install_append() {
>      install -d ${D}${sysconfdir}/init.d
>      install -d ${D}${systemd_system_unitdir}
> --
> 2.29.2
>
>
> 
>
