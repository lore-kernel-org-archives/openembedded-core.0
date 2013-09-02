Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 026AC6BC01
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 11:22:30 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r82BZ0mo013299; Mon, 2 Sep 2013 12:35:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id H9J6PIyvgazX; Mon,  2 Sep 2013 12:35:19 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r82BZGNS013308
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 2 Sep 2013 12:35:17 +0100
Message-ID: <1378120938.1059.184.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 02 Sep 2013 12:22:18 +0100
In-Reply-To: <1373152387-19393-3-git-send-email-Martin.Jansa@gmail.com>
References: <1373152387-19393-1-git-send-email-Martin.Jansa@gmail.com>
	<1373152387-19393-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 3/4] package.bbclass: add SHLIBSSEARCHDIRS to define where to search for shlib providers
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
X-List-Received-Date: Mon, 02 Sep 2013 11:22:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-07-07 at 01:13 +0200, Martin Jansa wrote:
> * when package contains some files matching "^.*\.so", but in directory
>   not default linker search paths (e.g. /opt/package/bundled-lib/libfoo.so)
>   don't register it as libfoo provider, because it's possible that there
>   is different package providing libfoo.so in ${libdir} and that would
>   be better shlib provider for other packages to depend on
> * recipes providing libs intentionally in some other directory can
>   define own SHLIBSSEARCHDIRS value
> 
> [YOCTO #4628]
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/package.bbclass | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 6c3ca56..3713fd3 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1307,6 +1307,9 @@ SHLIBSDIRS = "${@getshlibsdirs(d)}"
>  SHLIBSDIR = "${TMPDIR}/pkgdata/${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/shlibs"
>  SHLIBSWORKDIR = "${PKGDESTWORK}/shlibs"
>  
> +# default search path when searching for shlibs provided by package
> +SHLIBSSEARCHDIRS ?= "${baselib} ${libdir}"
> +
>  python package_do_shlibs() {
>      import re, pipes

Did you end up setting SHLIBSSEARCHDIRS for many recipes out of
interest?

Cheers,

Richard


