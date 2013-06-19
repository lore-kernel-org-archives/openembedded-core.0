Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BBF786007B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 08:13:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5J8IiNV006628; Wed, 19 Jun 2013 09:19:42 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hGJoOO13sd9V; Wed, 19 Jun 2013 09:19:42 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5J8Jck4006670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 19 Jun 2013 09:19:40 +0100
Message-ID: <1371629601.20823.161.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kai Kang <kai.kang@windriver.com>
Date: Wed, 19 Jun 2013 09:13:21 +0100
In-Reply-To: <d1dac9ed8f9cfe6b533e5676d766e2efeb12195a.1371619993.git.kai.kang@windriver.com>
References: <cover.1371619993.git.kai.kang@windriver.com>
	<d1dac9ed8f9cfe6b533e5676d766e2efeb12195a.1371619993.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] strace: update to 4.8
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
X-List-Received-Date: Wed, 19 Jun 2013 08:13:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-06-19 at 13:34 +0800, Kai Kang wrote:
> Update strace to 4.8.
> 
> * Update License file.
> * Remove the backport patches which are already in version 4.8.
> * Add file git-version-gen from git repo. Without this file configure
>   fails.
> * Add libaio and acl to PACKAGECONFIG for target package. Make libaio as a
>   dependency by default which could be covered easily.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>

[...]

> diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-devtools/strace/strace_4.8.bb
> new file mode 100644
> index 0000000..eb9f660
> --- /dev/null
> +++ b/meta/recipes-devtools/strace/strace_4.8.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION = "strace is a system call tracing tool."
> +HOMEPAGE = "http://strace.sourceforge.net"
> +SECTION = "console/utils"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=124500c21e856f0912df29295ba104c7"
> +PR = "r0"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
> +           file://git-version-gen"
> +
> +SRC_URI[md5sum] = "c575ef43829586801f514fd91bfe7575"
> +SRC_URI[sha256sum] = "f492291f07a7c805c07a8395cce1ea054a6401ad414f4cc12185672215e1d7f8"
> +inherit autotools
> +
> +PACKAGECONFIG_class-target ?= "libaio"
> +PACKAGECONFIG_class-target += "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
> +
> +PACKAGECONFIG[libaio] = ",,libaio,"
> +PACKAGECONFIG[acl] = ",,acl,"

Are there not --enable/--disable type options we can pass into configure
here to ensure build are deterministic?

Please also send this with move detection enabled in git so we get a
diff rather than a file removal/addition correctly shown (-M option to
git format-patch for example).

Cheers,

Richard

> +
> +export INCLUDES = "-I. -I./linux"
> +
> +do_configure_prepend() {
> +	cp ${WORKDIR}/git-version-gen ${S}
> +}
> +
> +do_install_append() {
> +	# We don't ship strace-graph here because it needs perl
> +	rm ${D}${bindir}/strace-graph
> +}
> +
> +BBCLASSEXTEND = "native"



