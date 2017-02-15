Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 178E277240
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 10:12:33 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v77so7365464wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 02:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Gl2eGedGHMS/ZPqfBZkL8V5COYeMwbFGZPdAXI7oqBg=;
	b=ZI5ch559+OsN0EhzWXp63jFiRLYpA/8eQb9E13fGS40WLvzd/dMx7eFXrDlBdClJJ0
	C08J2bSiQQBwk+X0O7JgMVSoSw0BSngcx83f2NqPo+6JOXTUlVqnVCJLd11zCZgTWysH
	MhUsyeKOSdkbRk2R+zqlvb2ddr5g//+DhZF2ZuvrzseV0nPpCc+VWK+5kfXepVGXXzs8
	OBqOwYhhnyGtBWehxzxXWzZK12XZj7ulz9oA0YavyaBuxgsjicYI+Z7+T6U7U6t3vkWs
	P+4P1lfgHFf6CGSNg4B+KiamV8HAMH8GndMkRT6A3eUo/StfnxR4senqsfrS4yPX5NAe
	qwxA==
X-Gm-Message-State: AMke39liRfpsNiXgIC18PrcB3bGKYszIw9/6tJ8lhDzhnoYq+8m5TMr2HC7kci/Ha7jX/A==
X-Received: by 10.28.95.4 with SMTP id t4mr7524734wmb.87.1487153553388;
	Wed, 15 Feb 2017 02:12:33 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h75sm4247538wrh.37.2017.02.15.02.12.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 Feb 2017 02:12:32 -0800 (PST)
Message-ID: <1487153551.2824.1.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 10:12:31 +0000
In-Reply-To: <7f5d277329d262fe7e9723aacba2dc20768380b9.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
	<7f5d277329d262fe7e9723aacba2dc20768380b9.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.22.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH 31/36] image.bbclass: do not uninstall update-alternatives from readonly rootfs
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
X-List-Received-Date: Wed, 15 Feb 2017 10:12:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-02-13 at 17:06 +0200, Alexander Kanavin wrote:
> dnf insists that it cannot be done:
> 
> Error: package libglib-2.0-0-1:2.50.2-r0.i586 requires /bin/sh, but none
> of the providers can be installed
>   - package libdnf1-0.2.3+git0+367545629c-r0.i586 requires libglib-2.0-0
> >= 2.50.2, but none of the providers can be installed
>   - package bash-4.3.30-r0.i586 requires update-alternatives-opkg, but
> none of the providers can be installed
>   - package busybox-1.24.1-r0.i586 requires update-alternatives-opkg, but
> none of the providers can be installed
>   - package dnf-2.0.0+git0+f0093d672d-r0.i586 requires libdnf1, but none
> of the providers can be installed
>   - conflicting requests
>   - problem with installed package dnf-2.0.0+git0+f0093d672d-r0.i586

Can this change be made dependent on DNF, please?

Update-alternatives once run is not useful on read-only rootfs, and its
database wastes a lot of space (in the target file system) for no benefit.

Cheers,
Andre'



> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/image.bbclass             | 2 +-
>  meta/lib/oeqa/selftest/buildoptions.py | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index b5a4fb4a337..ca0d0a8c0d1 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -33,7 +33,7 @@ ROOTFS_BOOTSTRAP_INSTALL = "${@bb.utils.contains("IMAGE_
> FEATURES", "package-mana
>  
>  # These packages will be removed from a read-only rootfs after all other
>  # packages have been installed
> -ROOTFS_RO_UNNEEDED = "update-rc.d base-passwd shadow ${VIRTUAL-
> RUNTIME_update-alternatives} ${ROOTFS_BOOTSTRAP_INSTALL}"
> +ROOTFS_RO_UNNEEDED = "update-rc.d base-passwd shadow
> ${ROOTFS_BOOTSTRAP_INSTALL}"
>  
>  # packages to install from features
>  FEATURE_INSTALL = "${@'
> '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATUR
> ES', d), d))}"
> diff --git a/meta/lib/oeqa/selftest/buildoptions.py
> b/meta/lib/oeqa/selftest/buildoptions.py
> index d40eb007ded..1801511913b 100644
> --- a/meta/lib/oeqa/selftest/buildoptions.py
> +++ b/meta/lib/oeqa/selftest/buildoptions.py
> @@ -22,12 +22,12 @@ class ImageOptionsTests(oeSelfTest):
>          bitbake("core-image-minimal")
>          log_data_file = os.path.join(get_bb_var("WORKDIR", "core-image-
> minimal"), "temp/log.do_rootfs")
>          log_data_created = ftools.read_file(log_data_file)
> -        incremental_created = re.search("NOTE: load old install solution
> for incremental install\nNOTE: old install solution not exist\nNOTE:
> creating new install solution for incremental install(\n.*)*NOTE:
> Installing the following packages:.*packagegroup-core-ssh-openssh",
> log_data_created)
> +        incremental_created = re.search("Installing  : packagegroup-core-
> ssh-openssh", log_data_created)
>          self.remove_config('IMAGE_FEATURES += "ssh-server-openssh"')
>          self.assertTrue(incremental_created, msg = "Match failed in:\n%s"
> % log_data_created)
>          bitbake("core-image-minimal")
>          log_data_removed = ftools.read_file(log_data_file)
> -        incremental_removed = re.search("NOTE: load old install solution
> for incremental install\nNOTE: creating new install solution for
> incremental install(\n.*)*NOTE: incremental removed:.*openssh-sshd-.*",
> log_data_removed)
> +        incremental_removed = re.search("Erasing     : packagegroup-core-
> ssh-openssh", log_data_removed)
>          self.assertTrue(incremental_removed, msg = "Match failed in:\n%s"
> % log_data_removed)
>  
>      @testcase(286)
> -- 
> 2.11.0
> 

