Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 274A57ECCF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 08:48:32 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id i1so18642443wro.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 01:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=cVGEifNwmWf09BwJ6qFVHzwEpNIY376l9pI2Y/FN5tk=;
	b=b5/dKNzvQYcNfLAAi/RkkxTWr/sZAOf++1K7dL7nz8GOSywxkMoS6nu4Jp5qBVITy2
	Nf6JNij+uuS7Ap+jUcemHiZ1ycWyfK+jf3cDx0FEZbITw/bsDfEPwsRBt7R1c8Gu7F+V
	8hyRaFQgNihBCkD+A+fEB2X1+CfDbB+U2IrEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=cVGEifNwmWf09BwJ6qFVHzwEpNIY376l9pI2Y/FN5tk=;
	b=OZe0fJwehrL7Z/mYbDWO4AoMFXZQkI8Cq2dsSpVIGt2f714I2NtVgXm7zokV356THU
	RpkCf3MKZnQpEZW3A6IsvJ6ObUrUUQMVAZ1n45W4bc662gspWywqiXGlILhzFOuUTlid
	rLzyvo7Za8scWJPpe78mYqqqp17DhhhXXx6cbAuGSMAZDJ1HUlagloUgicu2VjrV38Ag
	sjvVy1dEgsIZ5p1bGcToxKNjcZDqW5ThKLAXLweCtL/WR4SikxFQ67Y91sy8JCJviVym
	gZtvshBkyqNYHccBV/aAx7eP+g0P7u/rzEB2FJmCRurjO+m/l0G3eUWc8HYTo8ovd3bn
	fAiA==
X-Gm-Message-State: APjAAAVUdT3m0aHKDixi9NkSOopZztEx7N0Y9bjcxGZbFoI547fgTY0c
	UWh23Ws72ieQ2KsiF818zNYMog==
X-Google-Smtp-Source: APXvYqyxsCVOKtjVmaY41Avpd0dWko2SNvr9OjDGl3zZ3jf8AwyND3MEpa2rH1WZzzPIQa4JHtQpKg==
X-Received: by 2002:a5d:4f8a:: with SMTP id d10mr1863455wru.276.1570006112865; 
	Wed, 02 Oct 2019 01:48:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 90sm2224552wrr.1.2019.10.02.01.48.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Oct 2019 01:48:32 -0700 (PDT)
Message-ID: <382403668ee4d701c92a03b7d9142ce5dc034a35.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 02 Oct 2019 09:48:30 +0100
In-Reply-To: <1569368723-80048-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1569368723-80048-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Evolution 3.34.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH v4] rpm: make rpm work in toolchain.
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
X-List-Received-Date: Wed, 02 Oct 2019 08:48:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-09-25 at 07:45 +0800, Zheng Ruoqin wrote:
> We need to configure rpm to use package architecture from yocto build
> system.
> 
> Install rpmrc and rpm/platform to ${SDKTARGETSYSROOT} because config
> file in host-sysroot as /opt/poky/2.7+snapshot/sysroots/x86_64-
> pokysdk-linux will be covered by another ARCH which result in
> previous config settings inefficacy.
> 
> To resolve it, put config file in target-sysroot like
> /opt/poky/2.7+snapshot/sysroots/core2-64-poky-linux. As each ARCH has
> its own target-sysroot, config file will not be covered.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/rpm/files/rpm-setup.py | 27
> ++++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_4.14.2.1.bb    | 19 ++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/files/rpm-setup.py
> 
> diff --git a/meta/recipes-devtools/rpm/files/rpm-setup.py
> b/meta/recipes-devtools/rpm/files/rpm-setup.py
> new file mode 100644
> index 0000000000..b3e8a1198c
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/rpm-setup.py
> @@ -0,0 +1,27 @@
> +#!/usr/bin/env python3
> +
> +import os
> +import sys
> +import shutil
> +
> +try:
> +    native_sysroot = os.environ['OECORE_NATIVE_SYSROOT']
> +    sdktarget_sysroot = os.environ['SDKTARGETSYSROOT']
> +except KeyError:
> +    print("Not in environment setup, bailing")
> +    sys.exit(1)
> +
> +target_etc_dir = os.path.join(sdktarget_sysroot, 'etc/rpm')
> +
> +if not os.path.exists(target_etc_dir):
> +    os.makedirs(target_etc_dir)
> +
> +template_file = os.path.join(native_sysroot, 'usr/share/rpm/rpmrc')
> +cross_file = os.path.join(sdktarget_sysroot, 'etc/rpmrc')
> +shutil.copy(template_file, cross_file)
> +
> +template_file = os.path.join(native_sysroot,
> 'usr/share/rpm/platform')
> +cross_file = os.path.join(sdktarget_sysroot, 'etc/rpm/platform')
> +shutil.copy(template_file, cross_file)
> +
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> index c37330eb4c..e1d1951d74 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> @@ -44,6 +44,9 @@ SRC_URI = "git://github.com/rpm-software-
> management/rpm;branch=rpm-4.14.x \
>             file://0001-mono-find-provides-requires-do-not-use-
> monodis-from-.patch \
>             "
>  
> +SRC_URI_append_class-nativesdk = "file://rpm-setup.py \
> +                                 "
> +
>  PE = "1"
>  SRCREV = "4a9440006398646583f0d9ae1837dad2875013aa"
>  
> @@ -113,6 +116,20 @@ do_install_append_class-nativesdk() {
>          done
>  
>          rm -rf ${D}/var
> +        install -d ${D}${datadir}/rpm
> +
> +        cat >${D}/${datadir}/rpm/rpmrc <<EOF
> +arch_compat: ${MACHINE_ARCH}: all any noarch ${PACKAGE_EXTRA_ARCHS}
> +EOF
> +
> +# Arch Info should be fixed as '-' is instead of '_'.
> +        sed -i 's/-/_/' ${D}${datadir}/rpm/rpmrc
> +        cat >${D}/${datadir}/rpm/platform <<EOF
> +${MACHINE_ARCH}-pc-linux
> +EOF

This is heading in the right direction but this patch still makes the
nativesdk-rpm recipe machine specific and we can't do that.

Cheers,

Richard




