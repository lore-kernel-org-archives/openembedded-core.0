Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id CDD937FB43
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 15:53:15 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t14so7724265wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 07:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=upR0l128SMpk/0GyPUKrLCsj8HPuaETxsQxm6vijsZU=;
	b=VTk8widdZodb7jyGVnTxyQ82grWM8zsvRJTNN2MmwPr1T6F9N6a4FPgCnGs/StgNXK
	hkQRQWbLMAup+X8y4JlrH1P7U8/jYViWe1ykVEytlkYwCd1aZO3cyKMiESYPxbZ+PpH8
	r/lziNgqgRhE/MjpgaNtJFgqIgcgu3MwOtwas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=upR0l128SMpk/0GyPUKrLCsj8HPuaETxsQxm6vijsZU=;
	b=JhiCCcxdn3rLRN+5XWwE0dBkwBoLdz2+Yian81Xl0Ig/qMrxONZdtgHlldtXsmNpH6
	tHy0x9qhcryoDw0BC9D/rZUED0294ApnMsI5ofp2SccUq86DxOjaWDmgoJ/MasfyewKa
	O8Aa/6GK0DPB5kNoDx+iHAXH0zrrjVu7gxNcu4xqq3zrWQmaxzyl3DPlh1dCyqCHpzOL
	3MaMoLtRlxVKL9TLPgZBXGBk7NENt6WcWztcjs6PJRJzMmF9ysYhf0fIXGXawlqVkgFr
	bBD7FwcYcy/ob4Tj1KjFk0QFvCuRnSFM0Hzx8UbrfDvlY3hih+kfR4pJg/Qo2R3+6N3g
	qpcg==
X-Gm-Message-State: APjAAAV6/ROScXHSD0msh3zKkCceGa5TJKIVMfUIyeyPlnRrHXo7IxNC
	3oV4j28X9wK38lNBUWhEG2DQmjQ4fP0=
X-Google-Smtp-Source: APXvYqwTKyhuG7WI/X/T+AdvCMolit6Wof8Q3QWRF8QdkTCTUprbEwrBiCgsXR3loI/wARVhdhQrQA==
X-Received: by 2002:a7b:cf08:: with SMTP id l8mr3539313wmg.169.1579708396314; 
	Wed, 22 Jan 2020 07:53:16 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s10sm57374470wrw.12.2020.01.22.07.53.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 07:53:15 -0800 (PST)
Message-ID: <d3f6ae17e1a4da2e9aea675d37654a1fe0b1df3d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 15:53:14 +0000
In-Reply-To: <20200119185959.406212-4-JPEWhacker@gmail.com>
References: <20200119185959.406212-1-JPEWhacker@gmail.com>
	<20200119185959.406212-4-JPEWhacker@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] oeqa: reproducible: Do not strip packages
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
X-List-Received-Date: Wed, 22 Jan 2020 15:53:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-01-19 at 12:59 -0600, Joshua Watt wrote:
> Do not strip packages when testing reproducible builds. In some cases,
> stripped data differs between builds, but then gets removed. However,
> the contents affect the generation of the GCC build-id, which then
> differs in the resulting ELF files, even though the data that caused
> this is no longer there. Inhibit stripping so that their causes can be
> evaluated.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
> index c00b92d2e90..34462a0b3a4 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -149,6 +149,7 @@ class ReproducibleTests(OESelftestTestCase):
>          config = textwrap.dedent('''\
>              INHERIT += "reproducible_build"
>              PACKAGE_CLASSES = "{package_classes}"
> +            INHIBIT_PACKAGE_STRIP = "1"
>              TMPDIR = "{tmpdir}"
>              ''').format(package_classes=' '.join('package_%s' % c for c in self.package_classes),
>                          tmpdir=tmpdir)

This generates quite the failure list:

 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./all/ca-certificates-dbg_20190110-r0_all.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./all/ca-certificates-dev_20190110-r0_all.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./all/ca-certificates-doc_20190110-r0_all.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./all/ca-certificates_20190110-r0_all.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/acl-ptest_2.2.53-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/attr-ptest_2.4.48-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/bc-doc_1.07.1-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/binutils-doc_2.33.1-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/busybox-ptest_1.31.1-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/coreutils-doc_8.31-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/e2fsprogs-doc_1.45.4-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/elfutils-ptest_0.178-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/ethtool-ptest_5.3-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/flex-ptest_2.6.4-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-dbg_3.24.13-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/gtk+3-src_3.24.13-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/icu-dev_64.2-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libevdev-src_1.8.0-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libgcrypt-dbg_1.8.5-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libgcrypt_1.8.5-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libgtk-3.0_3.24.13-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libidn2-dev_2.3.0-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libinput-dbg_1.14.3-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libinput10_1.14.3-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libx11-locale_1.6.9-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libxml2-ptest_2.9.10-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libxshmfence-dbg_1.3-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/libxshmfence1_1.3-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/m4-ptest_1.4.18-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/mc-doc_4.8.23-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/mc-helpers-perl_4.8.23-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/ncurses-doc_6.1+20190803-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/openssl-doc_1.1.1d-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/openssl-ptest_1.1.1d-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/opkg-utils-doc_0.4.2-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-dbg_5.30.1-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-dev_5.30.1-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-module-config-heavy_5.30.1-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-module-data-dumper_5.30.1-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl-ptest_5.30.1-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/perl_5.30.1-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/sudo-dbg_1.8.29-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/sudo-doc_1.8.29-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/sudo_1.8.29-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/tar-dbg_1.32-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/tar_1.32-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/tcp-wrappers-src_7.6-r10_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/time-doc_1.9-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/xserver-xorg-dbg_1.20.6-r0_amd64.deb
 /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-12270/reproducibleB/tmp/deploy/deb/./core2-64/xserver-xorg_1.20.6-r0_amd64.deb

(I lined wrapped it)

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/629

Cheers,

Richard




