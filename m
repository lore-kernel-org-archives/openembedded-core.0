Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3CC7F050
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 07:59:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6C7voU9028453
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Jul 2019 00:58:42 -0700
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 12 Jul 2019 00:58:25 -0700
To: <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <CAJTo0LZ=1YBJQ69jTYVDnz+LFBX9eN3V6LfnK46fxTJUb=nH0g@mail.gmail.com>
	<1554165783-46226-1-git-send-email-changqing.li@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <b4ecf37e-6bb7-6328-4863-5901e6155db1@windriver.com>
Date: Fri, 12 Jul 2019 16:11:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1554165783-46226-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.148]
Subject: Re: [PATCH V2] llvm: fix link error for powerpc
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
X-List-Received-Date: Fri, 12 Jul 2019 07:59:34 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I'm recently getting llvm build failure on qemuppc. After reverting this 
patch, the build succeeds.
My host is ubuntu16.04.

I'm also wondering why autobuilder does not detect the build failure. No 
world build for qemuppc?

Best Regards,
Chen Qi

On 04/02/2019 08:43 AM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> fix below link error for powerpc
>
> lib/libLLVMSupport.a(CommandLine.cpp.o): in function `llvm::cl::opt_storage<(anonymous namespace):
> :HelpPrinterWrapper, true, true>::setLocation(llvm::cl::Option&, (anonymous namespace)::HelpPrinterWrapper&) [clone .isra.189]':
> /usr/src/debug/llvm/8.0-r0/git/llvm/include/llvm/Support/CommandLine.h:1218:(.text.startup+0x5c):
> relocation truncated to fit: R_PPC_PLTREL24 against symbol `llvm::errs()' defined in .text section in lib/libLLVMSupport.a(raw_ostream.cpp.o)+8000
> lib/libLLVMSupport.a(CommandLine.cpp.o): in function `setLocation':
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/recipes-devtools/llvm/llvm_git.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
> index d2ea927..a35ea4a 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> @@ -88,6 +88,8 @@ EXTRA_OECMAKE_append_class-nativesdk = "\
>                     -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
>                    "
>   
> +CXXFLAGS_append_class-target_powerpc = " -mlongcall"
> +
>   do_configure_prepend() {
>   # Fix paths in llvm-config
>   	sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-config/llvm-config.cpp



