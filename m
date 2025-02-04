Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7613C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:18:27 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.116065.1738675107115826958
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 05:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JexLP9oV;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-543e47e93a3so5903859e87.2
        for <Openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 05:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738675105; x=1739279905; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gY0L7L5i2m+fAoThlpRZHdKqoSKU6S9whP3E95Li6N4=;
        b=JexLP9oV0tOccy/pUuP5nFXzCCivWHPlMrilEDCadv4V5f8bEpRlfsoPEVRk/X8wCn
         1evsIOAggsQALdEHtIVCSKLArpKKHHFR0zo8iUuGOi+xTBDiQW7hAZINcyx+Jo5Jz3Ib
         bn5G3uD5KwIz817J76gBbzUGHzWyFhnlFc4Qg/iNp7PHTaXbUooNr4hSDr7Nlv0d0bXk
         nMjNlRvtn/PdYukcb/jFl9MQYoerh5y9Ojon6eYtzCX3g9Kefc/HaPc7ys73UjZon4Lw
         ztVlVXRt5BMUoM+sKi1hcuuaZUPkB/nYY5CVVZbZbUlu6dIrP9B2jKVEgb7goi5I+P/h
         OXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738675105; x=1739279905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gY0L7L5i2m+fAoThlpRZHdKqoSKU6S9whP3E95Li6N4=;
        b=X2ArOkauV2y/6foTwglqF4JIDjjilQKq87NpERKRyNBh1GqK3uday7rhtYZv0lRaOw
         Uts6cw076+gszSo2mCQip2a+3htqqHHX/z3OFvyiPk9EIQzdwKs8hD6Zy+SwDnO5cGXR
         SVHtThklCzMVNg1A3LLGbOThZ3W/QLNk1TMBsV9LTGzQkQqgpY14cH7GWtTHaBFus4Al
         4NywIjv58ya1FNTB34cnac53h+Ph3LuUMwjYYcqu7tD0VjV1j2NtqGSWrXcSlrRMLrUn
         vfW6vVSRX9nXaY6PybflHYGfdDzngfNDQKJ81V/MeDl07esR8Z19+fa4IeuJ7pJeM+eb
         vr2w==
X-Gm-Message-State: AOJu0YzqxSGesZDjDSf2elyfg+OF2Hb/61jVBhtlJBZK0fWcXhvh9D8L
	dmsPVobCps6HA5uiKkHHGbLri2WQcZ0mSUByfA5tavGj3AiFqhmKaxBDdE3iAfY=
X-Gm-Gg: ASbGncuD3j7b9iI3rQeTg8fvWWO3mu3IchcmsJ3lEPhPb4ND8GwxLgc/3HT0J4Ak1pb
	YfquldpCwy5X1ekIz6e78d2kBXWCAKhNIAoUAq6DX/24EJJMOJgi2bxA9te2XYmlBhr51OiFacT
	fue4OC8LRhz+7PXjH6MB7G70nGy9IRZV+7MLC5KoXTh2R2F9sTeOkebdrxtoKa1zoWOrUj8q3iR
	At28mBjVFjXJelH0X4US9Mm6HnXSP+8C8N/8YotYVVLoNNnMhQg2IIs6LdtykI6eE0GY3h50Vqg
	ZvqasMJT/r1F3+THxP+KsaePv3r0e6nd1LS1VGUR
X-Google-Smtp-Source: AGHT+IGwV0OUiIsgW6+DRIEPYak/AO5boyp/7fOiqRaBTALFGKnx9V6R98dtiX+1e/mLpwkNDa5png==
X-Received: by 2002:a05:6512:224d:b0:543:9a5c:1906 with SMTP id 2adb3069b0e04-543e4beab13mr7682499e87.17.1738675104860;
        Tue, 04 Feb 2025 05:18:24 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb0795sm1566946e87.149.2025.02.04.05.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:18:23 -0800 (PST)
Date: Tue, 4 Feb 2025 15:18:21 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: uvv.mail@gmail.com
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Build the systemctl executable
Message-ID: <Z6ITnblSwyvezrQT@nuoska>
References: <20250204105315.84079-1-uvv.mail@gmail.com>
 <20250204105315.84079-3-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204105315.84079-3-uvv.mail@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 13:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210790

Hi,

On Tue, Feb 04, 2025 at 11:53:15AM +0100, Vyacheslav Yurkov via lists.openembedded.org wrote:
> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
> 
> Instead of the python re-implementation build the actual systemctl from
> the systemd source tree. The python script was used when systemd didn't
> provide an option to build individual executables. It is possible in the
> meantime, so instead of always adapting the script when there's a new
> functionality, we simply use upstream implementation.

Good reason, no objections!

> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  .../systemd/systemd-systemctl-native.bb       |  20 +-
>  ...-meson-add-install-tag-for-systemctl.patch |  25 ++
>  .../systemd/systemd-systemctl/systemctl       | 366 ------------------
>  3 files changed, 33 insertions(+), 378 deletions(-)
>  create mode 100644 meta/recipes-core/systemd/systemd-systemctl/0001-meson-add-install-tag-for-systemctl.patch
>  delete mode 100755 meta/recipes-core/systemd/systemd-systemctl/systemctl
> 
> diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl-native.bb
> index ffa024caef..57bb1ab830 100644
> --- a/meta/recipes-core/systemd/systemd-systemctl-native.bb
> +++ b/meta/recipes-core/systemd/systemd-systemctl-native.bb
> @@ -1,17 +1,13 @@
> -SUMMARY = "Wrapper for enabling systemd services"
> +SUMMARY = "Systemctl executable from systemd"
>  
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +require systemd.inc
>  
> +DEPENDS = "gperf-native libcap-native util-linux-native python3-jinja2-native"
>  
> -inherit native
> +inherit pkgconfig meson native
>  
> -SRC_URI = "file://systemctl"
> +SRC_URI = "file://0001-meson-add-install-tag-for-systemctl.patch"

Hmm, doesn't this overwrite SRC_URI from systemd.inc?

SRC_URI += "file://...patch" would amend the patch file.

> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> -
> -do_install() {
> -	install -d ${D}${bindir}
> -	install -m 0755 ${S}/systemctl ${D}${bindir}
> -}
> +MESON_TARGET = "systemctl:executable"
> +MESON_INSTALL_TAGS = "systemctl"
> +EXTRA_OEMESON:append = " -Dlink-systemctl-shared=false"

I wonder why this tag support is needed since MESON_TARGET already
compiles only the correct executable with static linking. Is it there
just to let meson handle the install step of a single systemctl
executable?

Or does it install more files, like config files too?

I'm comparing this to a draft systemd-boot-native recipe for ukify
which I had and which sets the build target but installs manually:

MESON_TARGET = "ukify"

EXTRA_OEMESON += "-Dnobody-user=nobody \
    -Dnobody-group=nogroup \
    -Drootlibdir=${rootlibdir} \
    -Drootprefix=${rootprefix} \
    -Ddefault-locale=C \
    -Dmode=release \
    -Dsystem-alloc-uid-min=101 \
    -Dsystem-uid-max=999 \
    -Dsystem-alloc-gid-min=101 \
    -Dsystem-gid-max=999 \
"

do_install() {
    install -d ${D}${bindir}/
    install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
}

So the custom do_install() step could be avoided if systemd meson config
would have "install_tag" for ukify too?

Current systemd-boot-native recipe installs/copies the unmodified ukify.py
from source tree and uses that in native. It doesn't run meson build for it
and thus things like version details are incorrect. Also some additional tools
like systemd-measure, systemd-sbsign etc are not compiled so some usecases may
not be supported atm. If those would also include the install tags, then they
could be compiled and installed too, I presume.

> diff --git a/meta/recipes-core/systemd/systemd-systemctl/0001-meson-add-install-tag-for-systemctl.patch b/meta/recipes-core/systemd/systemd-systemctl/0001-meson-add-install-tag-for-systemctl.patch
> new file mode 100644
> index 0000000000..a9b3e62708
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-systemctl/0001-meson-add-install-tag-for-systemctl.patch
> @@ -0,0 +1,25 @@
> +From fbf1ae3b7bd074a8d3bfb741f54b8539123399f1 Mon Sep 17 00:00:00 2001
> +From: Vyacheslav Yurkov <uvv.mail@gmail.com>
> +Date: Sun, 2 Feb 2025 10:13:38 +0100
> +Subject: [PATCH] meson: add install tag for systemctl
> +
> +Upstream-Status: Backport
> +[https://github.com/systemd/systemd/commit/b1e5a7aa3f1e552c56d5adbeed6ff67d88d1e103]

Thanks for getting this upstreamed!

Cheers,

-Mikko

