Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D289471BFC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 12:11:17 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3JCBAqP008852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 19 Apr 2018 13:11:12 +0100
Message-ID: <1524139870.18865.86.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chin Huat Ang <chin.huat.ang@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 19 Apr 2018 13:11:10 +0100
In-Reply-To: <1524116800-25332-1-git-send-email-chin.huat.ang@intel.com>
References: <1524116800-25332-1-git-send-email-chin.huat.ang@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] toolchain-scripts: preserve host path in environment setup script
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
X-List-Received-Date: Thu, 19 Apr 2018 12:11:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-04-19 at 13:46 +0800, Chin Huat Ang wrote:
> The environment setup script generated in the build directory has host paths
> filtered, sourcing this script will break runqemu as it requires host
> /bin/stty. To resolve this, the script generation now sets the PATH variable
> to include the original values obtain from BB_ORIGENV.
> 
> [YOCTO #12695]
> 
> Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
> ---
>  meta/classes/toolchain-scripts.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index eeb320d..75f76d9 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -62,7 +62,7 @@ toolchain_create_tree_env_script () {
>  	script=${TMPDIR}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
>  	rm -f $script
>  	touch $script
> -	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${PATH}' >> $script
> +	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${@d.getVar("BB_ORIGENV", False).getVar("PATH", False)}' >> $script
>  	echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
>  	echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
>  	echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script

Hi,

Could you test something like this please?:

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index eeb320d15a8..1f6d1aa2bf4 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -62,7 +62,8 @@ toolchain_create_tree_env_script () {
        script=${TMPDIR}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
        rm -f $script
        touch $script
-       echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${PATH}' >> $script
+       echo ". ${COREBASE}/oe-init-build-env ${TOPDIR}" >> $script
+       echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:$PATH' >> $script
        echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
        echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
        echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script

Cheers,

Richard

