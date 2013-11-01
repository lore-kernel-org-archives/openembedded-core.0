Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B1B226BB2F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 15:19:03 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1FIp0S005421; Fri, 1 Nov 2013 15:18:51 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0v7CE2i6o05g; Fri,  1 Nov 2013 15:18:51 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1FIjMZ005415
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Nov 2013 15:18:47 GMT
Message-ID: <1383319121.6271.50.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: blloyd <blloyd@familyhonor.net>
Date: Fri, 01 Nov 2013 15:18:41 +0000
In-Reply-To: <2e9cfab0ee89692c85b78802b1804aa3e7856ef8.1383197850.git.blloyd@familyhonor.net>
References: <cover.1383197850.git.blloyd@familyhonor.net>
	<2e9cfab0ee89692c85b78802b1804aa3e7856ef8.1383197850.git.blloyd@familyhonor.net>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] Enhancements to allow core file debugging to work properly from devices
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
X-List-Received-Date: Fri, 01 Nov 2013 15:19:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-10-31 at 01:54 -0500, blloyd wrote:
> gdb includes a script to make generating core files trivial.  Add a package to allow inclusion of this script in images.  GDB also requires symbols that are usually stripped from the threads library to properly generate a core dump.  Therefore, ensure when gdb is installed the necessary debug file is also present so gdb is fully functional.
> 
> Signed-off-by: blloyd <blloyd@familyhonor.net>
> ---
>  meta/recipes-devtools/gdb/gdb-common.inc | 12 +++++++-----
>  meta/recipes-devtools/gdb/gdb.inc        |  9 ++++++++-
>  2 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> index 6954954..02eef85 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -61,8 +61,10 @@ do_install_append() {
>  	rm -rf ${D}${datadir}/locale
>  }
>  
> -RRECOMMENDS_gdb_append_linux = " glibc-thread-db "
> -RRECOMMENDS_gdb_append_linux-gnueabi = " glibc-thread-db "
> -RRECOMMENDS_gdbserver_append_linux = " glibc-thread-db "
> -RRECOMMENDS_gdbserver_append_linux-gnueabi = " glibc-thread-db "
> -
> +# Unfortunately, for gdb multi-threading to function reliably it must have the eglibc debug symbols
> +# which are a part of the eglibc-dev package.  So we have added a dependency on that here.
> +RRECOMMENDS_gdb_append_linux = " glibc-thread-db eglibc-dev "
> +RRECOMMENDS_gdb_append_linux-gnueabi = " glibc-thread-db eglibc-dev "
> +RRECOMMENDS_gdbserver_append_linux = " glibc-thread-db eglibc-dev "
> +RRECOMMENDS_gdbserver_append_linux-gnueabi = " glibc-thread-db eglibc-dev "
> +RDEPENDS_gcore_append = " gdb "

Aren't they part of the -dbg package, not -dev?

You also need to put "gdb: " at the start of the commit message summary
as per the commit message guidelines. It may be worth splitting this
change into two commits too.

Cheers,

Richard


