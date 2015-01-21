Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 098B672B9A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 17:12:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 21 Jan 2015 08:58:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="443258622"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.5.201])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Jan 2015 08:47:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Viguera, Javier" <Javier.Viguera@digi.com>
Date: Wed, 21 Jan 2015 17:01:12 +0000
Message-ID: <1466506.mcZXEbMHsI@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0AA80E@dor-sms-xch01.digi.com>
References: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0AA80E@dor-sms-xch01.digi.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Broken toolchain/SDK installation (master and dizzy)
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
X-List-Received-Date: Wed, 21 Jan 2015 17:12:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 21 January 2015 11:18:18 Viguera, Javier wrote:
> Seems that there is a problem with the toolchain installation script when
> you try to install it in a path which is not the default one but is derived
> from it (i.e. the default path is a prefix of the real installation path)
> 
> To reproduce it I just used poky as layer, configured a project for qemuarm
> and built a toolchain with:
> 
> # bitbake -c populate_sdk core-image-minimal
> 
> Once finished I installed the toolchain:
> 
> $ ./poky-glibc-x86_64-core-image-minimal-armv5te-toolchain-1.7.sh
> Enter target directory for SDK (default: /opt/poky/1.7):
> /opt/poky/1.7-custom You are about to install the SDK to
> "/opt/poky/1.7-custom". Proceed[Y/n]?Y ...
> 
> If we now have a look at the environment file
> (/opt/poky/1.7-custom/environment-setup-armv5te-poky-linux-gnueabi):
> 
> export
> SDKTARGETSYSROOT=/opt/poky/1.7-custom-custom/sysroots/armv5te-poky-linux-gn
> ueabi export
> PATH=/opt/poky/1.7-custom-custom/sysroots/x86_64-pokysdk-linux/usr/bin:/opt
> /poky/1.7-custom-custom/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux
> -gnueabi:$PATH export
> CCACHE_PATH=/opt/poky/1.7-custom-custom/sysroots/x86_64-pokysdk-linux/usr/b
> in:/opt/poky/1.7-custom-custom/sysroots/x86_64-pokysdk-linux/usr/bin/arm-pok
> y-linux-gnueabi:$CCACHE_PATH export
> CONFIG_SITE=/opt/poky/1.7-custom-custom/site-config-armv5te-poky-linux-gnue
> abi export
> OECORE_NATIVE_SYSROOT="/opt/poky/1.7-custom-custom/sysroots/x86_64-pokysdk-
> linux" export OECORE_ACLOCAL_OPTS="-I
> /opt/poky/1.7-custom-custom/sysroots/x86_64-pokysdk-linux/usr/share/aclocal
> " export
> PYTHONHOME=/opt/poky/1.7-custom-custom/sysroots/x86_64-pokysdk-linux/usr
> 
> See the paths are wrong (/opt/poky/1.7-custom-custom)
> 
> Digging into this I see the problem come from
> 'poky/meta/files/toolchain-shar-template.sh' where there are two rounds
> where the environment file is path-fixed. First:
> 
> # fix environment paths
> for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
>         $SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i
> $env_setup_script done
> 
> In my example this first step does the change: /opt/poky/1.7 ->
> /opt/poky/1.7-custom
> 
> But later in this script we have:
> 
> for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
>         $SUDO_EXEC find $replace -type f -exec file '{}' \; | \
>                 grep ":.*\(ASCII\|script\|source\).*text" | \
>                 awk -F':' '{printf "\"%s\"\n", $1}' | \
>                 $SUDO_EXEC xargs -n32 sed -i -e
> "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" done
> 
> This loop finds *again* the 'environment-setup' file and because at this
> point we have the correct path '/opt/poky/1.7-custom' in the environment
> file it matches again against the default dir '/opt/poky/1.7' resulting in
> the replacement: /opt/poky/1.7-custom -> /opt/poky/1.7-custom-custom that
> we have at the end.
> 
> A possible workaround is to filter out the environment file in the second
> loop:
> 
> for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
>         $SUDO_EXEC find $replace -type f -not -name 'environment-setup-*'
> -exec file '{}' \; | \ grep ":.*\(ASCII\|script\|source\).*text" | \
>                 awk -F':' '{printf "\"%s\"\n", $1}' | \
>                 $SUDO_EXEC xargs -n32 sed -i -e
> "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" done
> 
> But I'm not sure if this is the proper fix or not.

I can't necessarily comment on whether this is the best fix, but FWIW I had 
noticed this and filed a bug for it already:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=7032

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

