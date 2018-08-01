Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC2178CD2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 11:25:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Aug 2018 04:25:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,431,1526367600"; d="scan'208";a="61503018"
Received: from alokpa1x-mobl.gar.corp.intel.com (HELO [10.255.160.68])
	([10.255.160.68])
	by orsmga008.jf.intel.com with ESMTP; 01 Aug 2018 04:25:09 -0700
To: Jaewon Lee <jaewon.lee@xilinx.com>,
	openembedded-core@lists.openembedded.org
References: <1532985713-15283-1-git-send-email-jaewon.lee@xilinx.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <ab3cf6da-5f2a-ef98-92ca-8aaa3721df7f@intel.com>
Date: Wed, 1 Aug 2018 19:25:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1532985713-15283-1-git-send-email-jaewon.lee@xilinx.com>
Subject: Re: [PATCH] devtool-source.bbclass: Support kernel fragments not in SRC_URI
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
X-List-Received-Date: Wed, 01 Aug 2018 11:25:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/31/2018 05:21 AM, Jaewon Lee wrote:
> When using a recipe space kernel-meta, scc files are added through
> SRC_URI, but they may include corresponding kernel fragments that are
> not necessarily in SRC_URI.
> 
> For bitbake, this is not a problem because the kernel-yocto class adds
> the path where the .scc file was found to includes which consequentially
> makes the .cfg file available to the kernel build.
> 
> However, when using devtool, only files specified in SRC_URI are copied
> to oe-local-files in devtool's workspace. So if the cfg file is not in
> SRC_URI, it won't be copied, causing a kernel build failure when trying
> to find it.
> 
> This fix parses local .scc files in SRC_URI, copies the corresponding .cfg
> file to devtool's workdir, and also adds it to local_files so it is
> available when doing a devtool build for the kernel.
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
> index 56882a4..c70fea2 100644
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
> +            if line and line[0] == 'kconf' and line[-1].endswith('.cfg'):
> +              local_files[line[-1]] = os.path.join(os.path.dirname(local_files[key]), line[-1])
> +              shutil.copy2(os.path.join(os.path.dirname(local_files[key]), line[-1]), workdir)
> +          sccfile.close()
> +

Would the patches included in these .scc files also need to be handled
in the same way? Would this also work if there are other scc files
included in a scc file?

Thanks,

Anuj

