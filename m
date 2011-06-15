Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWmLj-0007qF-L7 for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 11:25:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5F9LwWa024797
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 10:21:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24221-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 10:21:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5F9LjIP024790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 10:21:50 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <3cb6265fcaa2fb18ced5c2ccddfcc4de7852d63b.1308108460.git.liezhi.yang@windriver.com>
References: <cover.1308108460.git.liezhi.yang@windriver.com>
	<3cb6265fcaa2fb18ced5c2ccddfcc4de7852d63b.1308108460.git.liezhi.yang@windriver.com>
Date: Wed, 15 Jun 2011 10:21:44 +0100
Message-ID: <1308129704.15712.368.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/4 V2] Share gcc work directories
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
X-List-Received-Date: Wed, 15 Jun 2011 09:25:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Robert,

This is looking good, just one further problem:

On Wed, 2011-06-15 at 14:33 +0800, Robert Yang wrote:
>    * The configure option --with-build-sysroot=${STAGING_DIR_TARGET} can
>      replace the sed command.

Sadly I'm not sure it can.

>  
>  EXTRA_OECONF = "${@['--enable-clocale=generic', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']} \
>                  --with-gnu-ld \
> +                --with-build-sysroot=${STAGING_DIR_TARGET} \
>                  --enable-shared \
>                  --enable-languages=${LANGUAGES} \
>                  --enable-threads=posix \
> @@ -88,25 +89,20 @@ do_configure () {
>  	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
>  	
>  	# teach gcc to find correct target includedir when checking libc ssp support
> -	sed -i 's:^\([ 	]*\)glibc_header_dir=\"${with_build_sysroot}/usr/include\":\1glibc_header_dir=\"${with_build_sysroot}${SYSTEMHEADERS}\":g' ${S}/gcc/configure.ac
> -	sed -i 's:^\([ 	]*\)glibc_header_dir=\"${with_build_sysroot}/usr/include\":\1glibc_header_dir=\"${with_build_sysroot}${SYSTEMHEADERS}\":g' ${S}/gcc/configure

Here, a hardcoded "/usr/include" in the gcc makefiles is being replaced
by ${SYSTEMHEADERS} which could be /some/other/path/include. These two
are therefore not equivalent. Did you try a "bitbake meta-toolchain"
with this patch series? 

I suspect configure needs to use ${includedir} to build this path
instead of hardcoding it.

Cheers,

Richard





