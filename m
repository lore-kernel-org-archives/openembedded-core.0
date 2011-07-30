Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnG0b-0002cc-0N
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 22:19:41 +0200
Received: by pzk1 with SMTP id 1so8586096pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2011 13:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=e3N8/H7DKvlbrnem26tEyQPa/3X+gwMXI85SzH3rKPw=;
	b=XHS8ZHD/Mkrh5C1vEa4ze95P3f967DLROEGOUmnbJICXu2Z+Q4O271WFqi1xY2V/3T
	zZuziWJRx8mSGsrTyUHLS4tO3lRI+6MvHkbkr0Q0XHqGALXh5fp9LIDkamDdNqfKe9+O
	BWm7Oc9Yb0Y/vUFl5mNsYUIvjxDvOCVfzCyqo=
Received: by 10.142.249.37 with SMTP id w37mr1338875wfh.448.1312056285821;
	Sat, 30 Jul 2011 13:04:45 -0700 (PDT)
Received: from perseus.localnet (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id v17sm2007880wfd.5.2011.07.30.13.04.44
	(version=SSLv3 cipher=OTHER); Sat, 30 Jul 2011 13:04:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jul 2011 13:04:43 -0700
Message-ID: <8412099.jsFY4PXuMf@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <8d920461c0a2d050b30d99d5a5ce464af6209f40.1311950827.git.lianhao.lu@intel.com>
References: <86e74f97a7eea07d74dafa632c053da2d37e03eb.1311950827.git.lianhao.lu@intel.com>
	<8d920461c0a2d050b30d99d5a5ce464af6209f40.1311950827.git.lianhao.lu@intel.com>
MIME-Version: 1.0
Subject: Re: [RFC BUG #1236 2/2] eglibc: Modify ldd script according to multilib config.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Jul 2011 20:19:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, July 29, 2011 10:57:27 PM Lianhao Lu wrote:
> Part fix of [BUGID #1236].
> 
> 1. Collect all the values for RTLDLIST for the current multilib
> configuration to modify the ldd scripts.
> 
> 2. Collect all the values for KNOWN_INTERPRETER_NAMES for the current
> multilib configuration.

why is this needed ?  eglibc build system has mechanism to emit
correct ld.so names into RTLDLIST. If its missing something then
it should be fixed in eglibc. This list will require to be maintained
all the time weather you add a new architecture or ld.so is revved up

> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/recipes-core/eglibc/eglibc-ld.inc  |   53
> +++++++++++++++++++++++++++++++ meta/recipes-core/eglibc/eglibc.inc     |  
>  1 +
>  meta/recipes-core/eglibc/eglibc_2.13.bb |    6 +++-
>  3 files changed, 59 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-ld.inc
> 
> diff --git a/meta/recipes-core/eglibc/eglibc-ld.inc
> b/meta/recipes-core/eglibc/eglibc-ld.inc new file mode 100644
> index 0000000..ad60964
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-ld.inc
> @@ -0,0 +1,53 @@
> +def ld_append_if_tune_exists(d, infos, dict):
> +	tune = d.getVar("DEFAULTTUNE", True) or ""
> +	libdir = d.getVar("base_libdir", True) or ""
> +	if dict.has_key(tune):
> +		infos['ldconfig'].add('{ "' + libdir + '/' + dict[tune][0] + '",' +
> dict[tune][1] + ' }') +		infos['lddrewrite'].add(libdir+'/'+dict[tune]
[0])
> +
> +def eglibc_dl_info(d):
> +	ld_info_all = {
> +		"mips": ["ld.so.1", "FLAG_ELF_LIBC6"],
> +		"mips64-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
> +		"mips64": ["ld.so.1", "FLAG_ELF_LIBC6"],
> +		"mipsel": ["ld.so.1", "FLAG_ELF_LIBC6"],
> +		"mips64el-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
> +		"mips64el": ["ld.so.1", "FLAG_ELF_LIBC6"],
> +		"mips-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
> +		"mips64-nf-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
> +		"mips64-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
> +		"mips64el-nf-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
> +		"mips64el-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
> +		"powerpc": ["ld.so.1", "FLAG_ELF_LIBC6"],
> +		"powerpc-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
> +		"powerpc64": ["ld64.so.1", "FLAG_ELF_LIBC6"],
> +		"powerpc64-nf": ["ld64.so.1", "FLAG_ELF_LIBC6"],
> +		"core2": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
> +		"core2-64": ["ld-linux-x86-64.so.2", "FLAG_ELF_LIBC6"],
> +		"x86": ["ld-linux.so.2", "FLAG_ELF_LIBC5"],
> +		"x86-64": ["ld-linux-x86-64.so.2", "FLAG_ELF_LIBC6"],
> +		"i586": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
> +	}
> +
> +	infos = {'ldconfig':set(), 'lddrewrite':set()}
> +	ld_append_if_tune_exists(d, infos, ld_info_all)
> +	variants = d.getVar("MULTILIB_VARIANTS", True) or ""
> +	for item in variants.split():
> +		localdata = bb.data.createCopy(d)
> +		#Fix ME. OVERRIDES not work, we have to set DEFAULTTUNE to TUNENAME
> +		#overrides = localdata.getVar("OVERRIDES", False) +
> ":virtclass-multilib-" + item +		#localdata.setVar("OVERRIDES", 
overrides)
> +		if localdata.getVar("BBEXTENDVARIANT", True) == item:
> +			tunename=localdata.getVar("TUNENAME", False) or ""
> +		else:
> +			tunename=localdata.getVar("TUNENAME_virtclass-multilib-" + item, 
False)
> or "" +		if tunename != "":
> +			localdata.setVar("DEFAULTTUNE", tunename)
> +		ld_append_if_tune_exists(localdata, infos, ld_info_all)
> +
> +	infos['ldconfig'] = ' '.join(infos['ldconfig'])
> +	infos['lddrewrite'] = ' '.join(infos['lddrewrite'])
> +	return infos
> +
> +ALL_KNOWN_INTERPRETER_NAMES = "${@eglibc_dl_info(d)['ldconfig']}"
> +RTLDLIST = "${@eglibc_dl_info(d)['lddrewrite']}"
> diff --git a/meta/recipes-core/eglibc/eglibc.inc
> b/meta/recipes-core/eglibc/eglibc.inc index 1b2e630..0ed4359 100644
> --- a/meta/recipes-core/eglibc/eglibc.inc
> +++ b/meta/recipes-core/eglibc/eglibc.inc
> @@ -1,4 +1,5 @@
>  require eglibc-common.inc
> +require eglibc-ld.inc
> 
>  STAGINGCC = "gcc-cross-intermediate"
>  STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-intermediate"
> diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb
> b/meta/recipes-core/eglibc/eglibc_2.13.bb index 41fe7c7..b1bfbf1 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
>  SRCREV = "14157"
> 
>  DEPENDS += "gperf-native"
> -PR = "r9"
> +PR = "r10"
>  PR_append = "+svnr${SRCPV}"
> 
>  EGLIBC_BRANCH="eglibc-2_13"
> @@ -199,6 +199,10 @@ do_compile () {
>  			rpcgen -h $r -o $h || oewarn "unable to generate header for $r"
>  		done
>  	)
> +
> +	echo "Adjust dynamic loader list to ${EGLIBC_DYNAMIC_LOADERS}"
> +	[ -z "${RTLDLIST}" ] && return
> +	sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\).*$#\1"${RTLDLIST}"#'
>  }
> 
>  require eglibc-package.inc
-- 
Khem Raj


