Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E8C0D744AE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 09:23:22 +0000 (UTC)
Received: from hex ([192.168.3.46]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w729NJ3f023368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 2 Aug 2018 10:23:23 +0100
Message-ID: <38b7a3d77dbb1d5326bc5840828c1f06a165fb1f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jaewon Lee <jaewon.lee@xilinx.com>,
	openembedded-core@lists.openembedded.org
In-Reply-To: <1533169981-15402-1-git-send-email-jaewon.lee@xilinx.com>
References: <1533169981-15402-1-git-send-email-jaewon.lee@xilinx.com>
Date: Thu, 02 Aug 2018 09:51:22 +0100
Mime-Version: 1.0
X-Mailer: Evolution 3.28.1-2 
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v2] devtool-source.bbclass: Support kernel-fragments/patch not in SRC_URI
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
X-List-Received-Date: Thu, 02 Aug 2018 09:23:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-01 at 17:33 -0700, Jaewon Lee wrote:
> When using a recipe space kernel-meta, scc files are added through
> SRC_URI, but they may include corresponding kernel fragments or patches
> that are not necessarily in SRC_URI.
> 
> For bitbake, this is not a problem because the kernel-yocto class adds
> the path where the .scc file was found to includes which consequentially
> makes the .cfg, .patch file available to the kernel build.
> 
> However, when using devtool, only files specified in SRC_URI are copied
> to oe-local-files in devtool's workspace. So if the cfg/patch file is not in
> SRC_URI, it won't be copied, causing a kernel build failure when trying
> to find it.
> 
> This fix parses local .scc files in SRC_URI, copies the corresponding
> .cfg/.patch file to devtool's workdir, and also adds it to local_files
> so it is available when doing a devtool build for the kernel.
> 
> [YOCTO #12858]
> 
> Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
> ---
>  meta/classes/devtool-source.bbclass | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
> index 56882a4..623b335 100644
> --- a/meta/classes/devtool-source.bbclass
> +++ b/meta/classes/devtool-source.bbclass
> @@ -90,11 +90,23 @@ python devtool_post_unpack() {
>                          fname in files])
>          return ret
>  
> +    is_kernel_yocto = bb.data.inherits_class('kernel-yocto', d)
>      # Move local source files into separate subdir
>      recipe_patches = [os.path.basename(patch) for patch in
>                          oe.recipeutils.get_recipe_patches(d)]
>      local_files = oe.recipeutils.get_recipe_local_files(d)
>  
> +    if is_kernel_yocto:
> +      for key in local_files.copy():
> +        if key.endswith('scc'):
> +          sccfile = open(local_files[key], 'r')
> +          for l in sccfile:
> +            line = l.split()
> +            if line and line[0] in ('kconf', 'patch'):
> +              local_files[line[-1]] = os.path.join(os.path.dirname(local_files[key]), line[-1])
> +              shutil.copy2(os.path.join(os.path.dirname(local_files[key]), line[-1]), workdir)
> +          sccfile.close()

You're using two space indentation here but the rest of our code and
our style guide says we use 4 spaces. Could you fix that please?

Its also handy to mention what changed between v1 and v2.

Cheers,

Richard


