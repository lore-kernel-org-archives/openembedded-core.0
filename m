Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDCDE6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 17:51:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3NHprmp000184
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Apr 2018 10:51:53 -0700 (PDT)
Received: from server.local (128.224.20.40) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 23 Apr 2018 10:51:46 -0700
To: Hongxu Jia <hongxu.jia@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1524471238-4908-1-git-send-email-hongxu.jia@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <df7a7e3b-09a9-26ac-8969-bc369f9bc2c4@windriver.com>
Date: Mon, 23 Apr 2018 13:51:45 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1524471238-4908-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH V2] perf: make a copy of kernel source to perf workdir
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
X-List-Received-Date: Mon, 23 Apr 2018 17:51:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-04-23 4:13 AM, Hongxu Jia wrote:
> Since perf modify kernel source which shared by multiple
> recipes, it probably caused kernel-devsrc compile failure
> at world build.
> ...
> |0 blocks
> |cpio: ./tools/perf/arch/arm/util/sedr7ORqk: Cannot stat:
> No such file or directory
> |0 blocks
> ...
> cpio tried to find a file at ${S}/tools/perf and failed
> if the input list is not valid.
> 
> Make a copy of kernel shared source directory into a perf workdir
> could fix the issue.
> 
> Drop `Fix for rebuilding' which is obsolete
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-kernel/perf/perf.bb | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 872b5f0..8b40806 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -61,7 +61,7 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
>   
>   inherit kernelsrc
>   
> -B = "${WORKDIR}/${BPN}-${PV}"
> +S = "${WORKDIR}/${BP}"
>   SPDX_S = "${S}/tools/perf"
>   
>   # The LDFLAGS is required or some old kernels fails due missing
> @@ -119,11 +119,12 @@ do_install() {
>   	fi
>   }
>   
> -do_configure_prepend () {
> -    # Fix for rebuilding
> -    rm -rf ${B}/
> -    mkdir -p ${B}/
> +do_configure[prefuncs] += "git_clone_kernel_source"
> +git_clone_kernel_source () {
> +    git clone --single-branch ${STAGING_KERNEL_DIR} ${S}

I probably would have used "cp -a -r", or similar. Since it
is possible that a kernel may not actually be a git repo (linux-yocto
always is, but that is just one data point).

Also, did you try just copying the tools SRC dir + whatever
infrastructure is needed to build ? That will save us a LOT
of i/o when moving the source around for perf to build.

But outside of those details/mechanics, the approach is sound.

Bruce


> +}
>   
> +do_configure_prepend () {
>       # If building a multlib based perf, the incorrect library path will be
>       # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
>       # build, with a 64 bit multilib, the arch won't match and the detection of a
> 


