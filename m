Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2EF4360069
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 17:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3AH4eEG019814; 
	Mon, 10 Apr 2017 18:04:45 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id g436X3t7EQut; Mon, 10 Apr 2017 18:04:45 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3AGrsmg017921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 10 Apr 2017 17:53:55 +0100
Message-ID: <1491843234.783.2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 17:53:54 +0100
In-Reply-To: <af3b44b2cc2be0771d70599286fa55d6ec3629bf.1491557671.git.liezhi.yang@windriver.com>
References: <cover.1491557671.git.liezhi.yang@windriver.com>
	<af3b44b2cc2be0771d70599286fa55d6ec3629bf.1491557671.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: "Bartosh, Eduard" <eduard.bartosh@intel.com>
Subject: Re: [PATCH 7/8] qemuboot.bbclass: add two vars for use by runqemu
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
X-List-Received-Date: Mon, 10 Apr 2017 17:04:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-04-07 at 02:47 -0700, Robert Yang wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> Add STAGING_DIR_TUNCTL_NATIVE and STAGING_DIR_QEMU_BINDIR_NATIVE so
> that
> runqemu could find 'tunctl' and 'qemu-xxx' binaries to run correctly.
> 
> [YOCTO #11266]
> [YOCTO #11193]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

Hi Robert/Qi,

Unfortunately this can't work as we can't use binaries directly from
the sysroot-components directory if they link to any libraries. tunctl
is ok but qemu links against libfdt.so.1 which isn't there. If the
system has its own copy, it may happen to work by luck but if it
doesn't, or the system version is incompatible we'd see failures.

So I'm afraid we need to find a different solution.

Cheers,

Richard

>  meta/classes/qemuboot.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/qemuboot.bbclass
> b/meta/classes/qemuboot.bbclass
> index 2870388dfb..ac52ef295e 100644
> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -70,12 +70,15 @@ QB_DRIVE_TYPE ?= "/dev/sd"
>  # Create qemuboot.conf
>  addtask do_write_qemuboot_conf after do_rootfs before do_image
>  IMGDEPLOYDIR ?= "${WORKDIR}/deploy-${PN}-image-complete"
> +STAGING_DIR_TUNCTL_NATIVE = "${STAGING_DIR}-
> components/${BUILD_ARCH}/qemu-helper-native"
> +STAGING_DIR_QEMU_BINDIR_NATIVE = "${STAGING_DIR}-
> components/${BUILD_ARCH}/qemu-native/usr/bin"
>  
>  def qemuboot_vars(d):
>      build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
>                  'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
>                  'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
> -                'STAGING_DIR_HOST']
> +                'STAGING_DIR_HOST', 'STAGING_DIR_TUNCTL_NATIVE',
> +                'STAGING_DIR_QEMU_BINDIR_NATIVE']
>      return build_vars + [k for k in d.keys() if k.startswith('QB_')]
>  
>  do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
> -- 
> 2.11.0.rc2.dirty
> 

