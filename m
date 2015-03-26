Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 676DB6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 08:29:26 +0000 (UTC)
Received: by labe2 with SMTP id e2so39476765lab.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 01:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=6aGw70OXUP3J01mnDbAW0D3T3KTJ0nt7MiOt+kLLXY4=;
	b=PVVWXdsCQG1NN/otDcXoFS6vZpn6D+qlPgweirE5o0RIUKa/mGTMoqttCBFvGx8DU3
	B+L9vh5DCEyDzhXxg71xYB2DZx5YD3mlIzhyYRUJ07U5ThwTee8srT0TV6s4hD14Ts/I
	i8u6g+L+s7JA+GmLJicd5hYM+JhfhJ64/zO2Ykibgqhl98yAsVFV/EKh5YLF35Cobjsd
	WCPVgkRA5Z6qvlCNaXwVBCj5Q3R5YJ9+yQ6DXiXMgYCAFvBPxdUpIUrwSIooP/hnL800
	T7hLJgQI9lJg1uk0mdRnBS3ogiXzDSEafBC1tvhU1xiVql3NAyQgaaPZMz8qoft11Z4I
	jTrA==
X-Gm-Message-State: ALoCoQmv4mtNNsLH+68MlnCFVORl6tS6XyM17jFHaDcssFOCXiMpWNnnvcA66NDgJsU11NqnDZHP
X-Received: by 10.152.43.229 with SMTP id z5mr12122201lal.48.1427358566454;
	Thu, 26 Mar 2015 01:29:26 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id lf1sm1094799lab.42.2015.03.26.01.29.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Mar 2015 01:29:25 -0700 (PDT)
Date: Thu, 26 Mar 2015 09:29:23 +0100
From: Anders Darander <anders@chargestorm.se>
To: Bruno Bottazzini <bruno.bottazzini@intel.com>
Message-ID: <20150326082923.GA7370@ad.chargestorm.se>
Mail-Followup-To: Bruno Bottazzini <bruno.bottazzini@intel.com>,
	openembedded-core@lists.openembedded.org
References: <bruno.bottazzini@intel.com>
	<1427320163-9262-1-git-send-email-bruno.bottazzini@intel.com>
	<1427320163-9262-4-git-send-email-bruno.bottazzini@intel.com>
MIME-Version: 1.0
In-Reply-To: <1427320163-9262-4-git-send-email-bruno.bottazzini@intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] systemd: split modules into packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Mar 2015 08:29:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Bruno Bottazzini <bruno.bottazzini@intel.com> [150325 22:50]:

> if one wants to launch a simple deamon, most modules are not
> required.
> He will be able to save space and exclude unwanted packages
> from the final image.

I like this, though I've got a few questions that I just noticed.

> -PACKAGECONFIG ??= "xz ldconfig \
> +PACKAGECONFIG ??= " \
> +                   gcrypt \
> +                   kmod \
> +                   ldconfig \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'blkid', 'blkid', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'efi', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'lz4', 'lz4', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'xz', 'xz', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'libidn', 'libidn', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}"

It might be worth noting that xz has gone from being explicitly enabled,
to depend on a DISTRO_FEATURES.

>  # Sign the journal for anti-tampering
>  PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
>  # regardless of PACKAGECONFIG, libgcrypt is always required to expand
>  # the AM_PATH_LIBGCRYPT autoconf macro
> -DEPENDS += "libgcrypt"

Just to double-check, as this been fixed upstream or patched locally?
If you're removing that explicit DEPENDS, the comment above should also
be removed.

>  PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
> -PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"

Why do you remove networkd as a PACKAGECONFIG?

>  PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
>  PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
>  PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
> @@ -101,17 +123,36 @@ rootprefix ?= "${base_prefix}"
>  rootlibdir ?= "${base_libdir}"
>  rootlibexecdir = "${rootprefix}/lib"

> -# The gtk+ tools should get built as a separate recipe e.g. systemd-tools
>  EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
>                   --with-rootlibdir=${rootlibdir} \
>                   --with-roothomedir=${ROOT_HOME} \
> -                 --disable-coredump \
> +                 --enable-coredump \
> +                 --disable-introspection \
> +                 --disable-kdbus \
> +                 --disable-manpages \
>                   --disable-introspection \
>                   --disable-kdbus \
>                   --enable-split-usr \
>                   --without-python \
>                   --with-sysvrcnd-path=${sysconfdir} \
>                   --with-firmware-path=/lib/firmware \
> +                 --enable-libcurl \
> +                 --enable-ldconfig \
> +                 --enable-backlight \
> +                 --enable-binfmt \
> +                 --enable-bootchart \
> +                 --enable-firstboot \
> +                 --enable-hostnamed \
> +                 --enable-localed \
> +                 --enable-logind \
> +                 --enable-machined \
> +                 --enable-networkd \

Why is networkd always enabled?

> +                 --enable-quotacheck \
> +                 --enable-randomseed \
> +                 --enable-resolved \

Why are you enabling resolved here? We have a PACKAGECONFIG taking care
of enabling/disabling this.

> +                 --enable-rfkill \
> +                 --enable-sysusers \
> +                 --enable-vconsole \
>                 "

Regarding EXTA_OECONF in general, it seems that we're enabling lots of
stuff that we have PACKAGECONFIG's for.

There's also a number of other things here that probably should be
PACKAGECONFIG's.

>

I'll try to take a closer look at the actual splitting if I can get some
time for that.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

