Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 14F2E760AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 19:01:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0MJ1X4N020655
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Jan 2016 11:01:33 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Fri, 22 Jan 2016 11:01:33 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1453483030.6378.24.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56A27C8C.8000403@windriver.com>
Date: Fri, 22 Jan 2016 13:01:32 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453483030.6378.24.camel@linuxfoundation.org>
Subject: Re: [PATCH] uninative: Fix conflicts with normal sysroot
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
X-List-Received-Date: Fri, 22 Jan 2016 19:01:35 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 1/22/16 11:17 AM, Richard Purdie wrote:
> Currently this code installs into the standard sysroot, however this causes
> some conflicts when linking since the linker can look specifically for
> versioned .so files (e.g. like libpthreads.so.0). This breaks builds
> of util-linux-native for example.
> 
> The easiest solution is to install uninative into its own separate sysroot.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
> index fe1e89b..8686159 100644
> --- a/meta/classes/uninative.bbclass
> +++ b/meta/classes/uninative.bbclass
> @@ -1,6 +1,6 @@
>  NATIVELSBSTRING = "universal"
>  
> -UNINATIVE_LOADER ?= "${@bb.utils.contains('BUILD_ARCH', 'x86_64', '${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2', '${STAGING_DIR_NATIVE}/lib/ld-linux.so.2', d)}"
> +UNINATIVE_LOADER ?= "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"

Have you considered changing the name of the ld.so for the uninative so that
there is no way it can conflict with the host system.

This would require a minor patch to the uninative linker/compiler to use the new
name -- and of course above to know it as well.

This might be a useful safety to prevent the system from every falling back to
the /lib/... version.

--Mark

>  UNINATIVE_URL ?= "unset"
>  UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.bz2"
> @@ -41,7 +41,8 @@ python uninative_eventhandler() {
>                  fetcher.download()
>              except Exception as exc:
>                  bb.fatal("Unable to download uninative tarball: %s" % str(exc))
> -        cmd = e.data.expand("mkdir -p ${STAGING_DIR}; cd ${STAGING_DIR}; tar -xjf ${UNINATIVE_DLDIR}/${UNINATIVE_TARBALL}; ${STAGING_DIR}/relocate_sdk.py ${STAGING_DIR_NATIVE} ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${STAGING_BINDIR_NATIVE}/patchelf-uninative")
> +
> +        cmd = e.data.expand("mkdir -p ${STAGING_DIR}-uninative; cd ${STAGING_DIR}-uninative; tar -xjf ${UNINATIVE_DLDIR}/${UNINATIVE_TARBALL}; ${STAGING_DIR}-uninative/relocate_sdk.py ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux/patchelf-uninative")
>          try:
>              subprocess.check_call(cmd, shell=True)
>          except subprocess.CalledProcessError as exc:
> @@ -51,6 +52,8 @@ python uninative_eventhandler() {
>  
>  SSTATEPOSTUNPACKFUNCS_append = " uninative_changeinterp"
>  
> +PATH_prepend = "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:"
> +
>  python uninative_changeinterp () {
>      import subprocess
>      import stat
> 
> 


