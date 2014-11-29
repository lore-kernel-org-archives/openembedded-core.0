Return-Path: <lpapp@archlinux.us>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8617025A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Nov 2014 08:46:01 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id hq12so3474559vcb.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Nov 2014 00:46:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:cc:content-type;
	bh=pPj+LQaMi4OA6QNN+TtPkEciW0aUCzbPDBFN8b9pkK0=;
	b=lELVZOmVCHxzIodTbs94Zmz/jb0hCec7vJ1ljSq+HUzkhEZIoTbeK/sfBZKRVO//OP
	Edlf7FlQTdXFqrPeNugBGVOg3rF5FMx95LgvBsflYOk/Il03sWagLnYvLl4ddunUEmEU
	kwQbSGbH2R48JDbdXqX7yR21dkpP/QhwxxLaB8frrBxrQ0uo+fovqI6/grrlAql4STow
	PY4rJNNJELLcVsLiwy7CoRmWrgnbdWfy+NlyA7NyoPAZ3zbW1deNld7FwQSWqs9m+ISB
	PF7jeV+eAM8ndMbhNbYst23ulggZrPWdQVw7j/n1f8ZOV3PgiZX06WJp7o6k0xs82sEr
	HGVA==
X-Gm-Message-State: ALoCoQlvJm17Fq+KGyaJY/PGCa5VMRAD43NgKJDuF2Gvgv7J+a9JVR037qb0UsrcoEVv7lzH1HWc
MIME-Version: 1.0
X-Received: by 10.52.243.41 with SMTP id wv9mr20651692vdc.20.1417250762385;
	Sat, 29 Nov 2014 00:46:02 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.31.188.129 with HTTP; Sat, 29 Nov 2014 00:46:02 -0800 (PST)
Date: Sat, 29 Nov 2014 08:46:02 +0000
X-Google-Sender-Auth: H3Xne-t9pfVhO-EVjHs4l9QEs2Y
Message-ID: <CAOMwXhPV+N=m+VBZhk70DzZBAXt_QDjMhxm=sy+R9aO1zNpWNA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCHv3] toolchain-script: Add support for ccache builds with the SDK
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
X-List-Received-Date: Sat, 29 Nov 2014 08:46:04 -0000
Content-Type: text/plain; charset=UTF-8

Including both Richard Purdie and Saul Wold as they were the main
criticizers last time in the beginning of September when I submitted
the first version of this patch.

On Thu, Nov 27, 2014 at 5:40 PM, Laszlo Papp <lpapp@kde.org> wrote:
> It is necessary to have an SDK for developers who build their software with
> ccache to speed up the compilation. Without resolving this, unfortunately the
> compilation will fail for them.
>
> Signed-off-by: Laszlo Papp <lpapp@kde.org>
> ---
>  meta/classes/toolchain-scripts.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index d5b9675..9836db4 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -19,6 +19,7 @@ toolchain_create_sdk_env_script () {
>                 EXTRAPATH="$EXTRAPATH:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_ARCH}${TARGET_VENDOR}-$i"
>         done
>         echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}'$EXTRAPATH':$PATH' >> $script
> +       echo 'export CCACHE_PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}'$EXTRAPATH':$CCACHE_PATH' >> $script
>         echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
>         echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig' >> $script
>         echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
> @@ -37,6 +38,7 @@ toolchain_create_tree_env_script () {
>         rm -f $script
>         touch $script
>         echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${PATH}' >> $script
> +       echo 'export CCACHE_PATH=${STAGING_DIR_NATIVE}/usr/bin:${CCACHE_PATH}' >> $script
>         echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
>         echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
>         echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
> --
> 2.1.3
>

