Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id B64F373DF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 12:27:20 +0000 (UTC)
Received: by iods203 with SMTP id s203so183948449iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 05:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=vlYc81WXahvyNJcclgqLTvyi/TIfV3hr3N8riKyh/K0=;
	b=LGRY95+qd57+FdmFRiHkSvyK8PLCRsYYzC/QZL7gMgFTT2JPAX/FjlvmX0r1EHXTHy
	i7OwbJCVVhHbGJ/77ncJcs2QQcbfmfqCDBgRWL9zDlgBFiZgQlTSwe1mxS1T2WY5nZMx
	WEZRn3aidR8T1GDF+Qep69oPwz8+AOQ2NQ+gTWsGz5sUqJNB+N9qwMxCbQbYDsspJHiN
	mL0Tzi4aXufEf0SP5eH4P+8yQf4p46WHOmEfcQJdhZltqRelvwRRAFb6WYYIQjP+qP5T
	VOg4AokSVmVtqI6gfk9rMsRhW0ULAAHuqdJjA2tLndAt/T3g9/6F6nRbLKE2R67VsPZm
	8yhQ==
X-Gm-Message-State: ALoCoQkzJtvTuXKr5gUu9GSEODi9Akk44efzCkb0Ysyj59SZ3yoOCG8lZoUQx6Lvaz1L2hB9rjUL
X-Received: by 10.107.8.11 with SMTP id 11mr21440974ioi.125.1440505641154;
	Tue, 25 Aug 2015 05:27:21 -0700 (PDT)
Received: from pohly-mobl1 (p57A57DEF.dip0.t-ipconnect.de. [87.165.125.239])
	by smtp.gmail.com with ESMTPSA id o2sm1050390igr.9.2015.08.25.05.27.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Aug 2015 05:27:20 -0700 (PDT)
Message-ID: <1440505638.24929.64.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 25 Aug 2015 14:27:18 +0200
In-Reply-To: <1440417012.3543.16.camel@intel.com>
References: <1440417012.3543.16.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: qemu + initramfs
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
X-List-Received-Date: Tue, 25 Aug 2015 12:27:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-08-24 at 13:50 +0200, Patrick Ohly wrote:
> However, that failed initially with:
[...]
>         Kernel Offset: 0x0 from 0xc1000000 (relocation range: 0xc0000000-0xd07dffff)
>         ---[ end Kernel panic - not syncing: /dev/console is missing or not a character device!
>         Please ensure your rootfs is properly configured
> 
> Searching for the kernel panic led me to:
> http://stackoverflow.com/questions/10437995/initramfs-built-into-custom-linux-kernel-is-not-running
> 
> The hint given there (/dev/console must exist in the initramfs because
> the kernel opens it before executing /init) worked for like this:
> 
> diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
> b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
> index b54cb61..4066beb 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
> @@ -11,9 +11,12 @@ S = "${WORKDIR}"
>  
>  do_install() {
>          install -m 0755 ${WORKDIR}/init-live.sh ${D}/init
> +        install -d ${D}/dev
> +        mknod -m 622 ${D}/dev/console c 5 1
> +        mknod -m 622 ${D}/dev/tty0 c 4 0
>  }
>  
> -FILES_${PN} += " /init "
> +FILES_${PN} += " /init /dev "
>  
>  # Due to kernel dependency
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
> But I am surprised that I had to make such an adjustment. Isn't that
> something that also occurs in other build configurations? Do I perhaps
> miss something which avoids the issue (some kernel configuration
> perhaps)?

This is getting weirder. I checked MACHINE=intel-corei7-64 from
meta-intel with a regular live image (i.e. without my fix above). Some
additional ls debugging commands at the top of the init script show
that /dev/console exists, with a time that changes during each boot.
There's also /dev/0 -> /dev/console and similar entries for 1 and 2.

I know that /dev/ is from the rootfs (i.e. no tmpfs mounted on top of
it) because I still see a fake /dev/rootfs-dev file that I created in
the core-image-minimal-initramfs.

It almost looks like an overlay created or modified file system by the
kernel (because it's there before /init does anything), but I have no
idea what feature might responsible for that. Any hints?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




