Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id E69DD73BB8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 20:01:33 +0000 (UTC)
Received: by layy10 with SMTP id y10so136432780lay.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 13:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=GuXbrj+6pI3SucFfoGIEspNmxbIwFB3/KAl6KNvwnSY=;
	b=VeV8plqM1blVb2lILl66rofqL9gOcwgQ1tbCLj1WXd9pjSmvQRTMYK7eWjwhtdLASX
	112OkvMw33cx3mW3dm1M9yZkcHqdBpnzenS059omkzgmWkyzAbizSmfZAA/oZbxmZ8S1
	daMTKtC5rJ2r5eVqDAo97JGbFeDPrIl44ukgM0zwReEapCv7WjHyjWXiWYyIjEnItLOt
	UY5DGVL8lTlPkCtuFuq06mZfUbOqqKVZQGJwi1Bs3eHFRQeiMnz77K/4/V0e11XjFlOw
	6XzIQMljyY0uS/13aXy+VISO3LVcN2H9JnsgPnFDSTsgatMkPDtcsNx4BYv+wO94U+h4
	F1nQ==
X-Gm-Message-State: ALoCoQkzoyn9EwbF3LARAyhNwhpcpm1GUAXrvtYQnzt6uxNMFDMcezcjTA+J4Zd3u9xGdYQWU8Bm
X-Received: by 10.152.21.170 with SMTP id w10mr14034192lae.27.1430856093720;
	Tue, 05 May 2015 13:01:33 -0700 (PDT)
Received: from ad.chargestorm.se (2.71.103.47.mobile.tre.se. [2.71.103.47])
	by mx.google.com with ESMTPSA id pn1sm4271553lbc.6.2015.05.05.13.01.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 May 2015 13:01:32 -0700 (PDT)
Date: Tue, 5 May 2015 22:01:29 +0200
From: Anders Darander <anders@chargestorm.se>
To: Bruno Bottazzini <bruno.bottazzini@intel.com>
Message-ID: <20150505200129.GA7291@ad.chargestorm.se>
Mail-Followup-To: Bruno Bottazzini <bruno.bottazzini@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1430775804-30845-1-git-send-email-bruno.bottazzini@intel.com>
	<1430775804-30845-4-git-send-email-bruno.bottazzini@intel.com>
MIME-Version: 1.0
In-Reply-To: <1430775804-30845-4-git-send-email-bruno.bottazzini@intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 3/3] systemd: split modules into packages
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
X-List-Received-Date: Tue, 05 May 2015 20:01:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Bruno Bottazzini <bruno.bottazzini@intel.com> [150504 23:43]:

> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> index b4bff18..2da74dc 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -60,9 +60,89 @@ LDFLAGS_append_libc-uclibc = " -lrt"
>  GTKDOC_DOCDIR = "${S}/docs/"

>  PACKAGECONFIG ??= "xz ldconfig \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'gcrypt', 'gcrypt', "", d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'kmod', 'kmod', "", d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'blkid', 'blkid', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'efi', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'lz4', 'lz4', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'libidn', 'libidn', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}"
> -
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'glib', 'glib', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'blkid', 'blkid', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'efi', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'kmod', 'kmod', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'polkit', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'smack', 'smack', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'ima', 'ima', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'apparmor', 'apparmor', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'qrencode', 'qrencode', '', d)} \

NAK.

I like the split of systemd into smaller packages, but NAK for this
version. We're not going to add all this to DISTRO_FEATURES...

Add all the PACKAGCONFIG options, but enable only those that either were
enabled before, or where we have a real DISTRO_FEATURE to check for.
Dpn't add a new DISTRO_FEATURE for every PACKAGECONFIG.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

