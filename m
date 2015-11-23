Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7C52F60617
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 13:47:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tANDlS8Q003342
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Nov 2015 05:47:29 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 23 Nov 2015 05:46:26 -0800
To: Ming Liu <liu.ming50@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <1448232011-30195-1-git-send-email-liu.ming50@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <565318B0.20508@windriver.com>
Date: Mon, 23 Nov 2015 08:46:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1448232011-30195-1-git-send-email-liu.ming50@gmail.com>
Cc: darren@dvhart.com, Ming Liu <peter.x.liu@external.atlascopco.com>,
	yue.tao@windriver.com
Subject: Re: [PATCH] kernel-devsrc: add 'make scripts' postinstall
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
X-List-Received-Date: Mon, 23 Nov 2015 13:47:46 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-11-22 05:40 PM, Ming Liu wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> Run 'make scripts' inside qemu in order to create script binaries that
> needed by external modules build on the target.
>
> This 'make scripts' might fail in some cases, for instance, if toolchain or
> make command is not installed on the target, but the postinstall should
> always succeed, it will not break the package installation so the behaviour
> is consistent.

What about just making the package depend on the toolchain ? That was
the approach that I was going to take .. but haven't gotten there yet.

The compilation step worried me at first, but since devsrc is already
quite heavy, adding the extra dependency and compile phase shouldn't be
a big issue.

For Yocto 2.1, I'm changing the packaging of the kernel source, headers
and development chunks. But this change shouldn't be an issue with that.
I'll let you know when I get a bit further along with that work.

>
> [YOCTO #6630]

Once minor 'nit .. if you are submitting a change for a bug that
is assigned to me .. why haven't I heard anything about it until
now ?

Bruce

>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>   meta/recipes-kernel/linux/kernel-devsrc.bb | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 196c8c7..8b366c3 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425
>   inherit linux-kernel-base
>
>   # Whilst not a module, this ensures we don't get multilib extended (which would make no sense)
> -inherit module-base
> +inherit module-base qemu
>
>   # We need the kernel to be staged (unpacked, patched and configured) before
>   # we can grab the source and make the source package. We also need the bits from
> @@ -71,6 +71,17 @@ do_install() {
>   # Ensure we don't race against "make scripts" during cpio
>   do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>
> +pkg_postinst_${PN} () {
> +	if [ -n "$D" ]; then
> +		${@qemu_run_binary(d, '$D', '${bindir}/make')} \
> +			-C $D${KERNEL_SRC_PATH} O=$D${KERNEL_SRC_PATH} scripts
> +	else
> +		make -C ${KERNEL_SRC_PATH} O=${KERNEL_SRC_PATH} scripts \
> +			>/dev/null 2>&1 || true
> +	fi
> +}
> +
>   PACKAGES = "kernel-devsrc"
>   FILES_${PN} = "${KERNEL_SRC_PATH}"
> +DEPENDS = "qemu-native"
>   RDEPENDS_${PN} = "bc"
>


