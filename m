Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8B36D6F8A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 10:15:17 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s31AFCgO014419; Tue, 1 Apr 2014 11:15:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WYrzjuvcfNHO; Tue,  1 Apr 2014 11:15:12 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s31AF7oj014414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 1 Apr 2014 11:15:09 +0100
Message-ID: <1396347302.14790.103.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kai Kang <kai.kang@windriver.com>
Date: Tue, 01 Apr 2014 11:15:02 +0100
In-Reply-To: <af0d72274577463847f43551a9caf743314be414.1396343261.git.kai.kang@windriver.com>
References: <cover.1396343261.git.kai.kang@windriver.com>
	<af0d72274577463847f43551a9caf743314be414.1396343261.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] util-linux-native: Remove SYS_setns system call in linux kernel 2.6.x
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
X-List-Received-Date: Tue, 01 Apr 2014 10:15:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-01 at 17:09 +0800, Kai Kang wrote:
> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
> 
> __NR_setns is not defined in linux kernel 2.6.x. To linux kernel 3.0,
> this variable is defined. It has been shown that no native tools use
> this syscall, so it is safe to make this substitution
> 
> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 6 ++++++
>  1 file changed, 6 insertions(+)

This is horrible. Firstly "no native tools use this syscall" - how did
you check that? I suspect you perhaps mean "no native tools in OE-Core
at this time"? How would we know when one is added?

Secondly, this should not be done as a sed, it should be a patch with a
description. This means when we upgrade util-linux, it doesn't silently
stop working or do something unintended.

Cheers,

Richard

> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index ad7aac7..0f065b4 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -112,6 +112,12 @@ RPROVIDES_${PN}-dev = "util-linux-libblkid-dev util-linux-libmount-dev util-linu
>  SYSTEMD_PACKAGES = "${PN}-uuidd"
>  SYSTEMD_SERVICE_${PN}-uuidd = "uuidd.service"
>  
> +do_compile_prepend_class-native() {
> +	if [ `uname -r | grep "2.6."` ]; then
> +		sed -i 's:return syscall(SYS_setns:fprintf(stderr,"Kernel does not support setns");\n\treturn 1;\n//return syscall(:g' ${S}/include/namespace.h
> +	fi
> +}
> +
>  do_compile () {
>  	set -e
>  	install ${WORKDIR}/MCONFIG ${S}/MCONFIG
> -- 
> 1.8.1.2
> 



