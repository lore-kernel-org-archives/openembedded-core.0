Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sm3iW-0005wt-Rp for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 16:04:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q63DrWQ6013918;
	Tue, 3 Jul 2012 14:53:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12674-07; Tue,  3 Jul 2012 14:53:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q63DrN2r013911
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 3 Jul 2012 14:53:25 +0100
Message-ID: <1341323601.3906.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 03 Jul 2012 14:53:21 +0100
In-Reply-To: <4460a45a7ab14ef1075dd5a1ba27075e11d036b7.1340873279.git.kai.kang@windriver.com>
References: <cover.1340873279.git.kai.kang@windriver.com>
	<4460a45a7ab14ef1075dd5a1ba27075e11d036b7.1340873279.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/2] initscripts: use update-alternative to handle file functions
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
X-List-Received-Date: Tue, 03 Jul 2012 14:04:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-06-28 at 17:35 +0800, Kang Kai wrote:
> lsb need a more abundant /etc/init.d/functions file to handle lsb test.
> Use update-alternative to install file funtions in package initscripts,
> when package lsbinitscripts installed the file functions of
> lsbinitscripts will be used.
> 
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  meta/recipes-core/initscripts/initscripts_1.0.bb |   10 ++++++++--
>  1 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index 829694b..78c27a3 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
>  SECTION = "base"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> -PR = "r134"
> +PR = "r135"
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  
> @@ -37,6 +37,12 @@ SRC_URI_append_arm = " file://alignment.sh"
>  
>  KERNEL_VERSION = ""
>  
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY = "90"
> +ALTERNATIVE_${PN} = "functions"
> +ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
> +
>  HALTARGS ?= "-d -f"
>  
>  do_configure() {
> @@ -60,7 +66,7 @@ do_install () {
>  	install -d ${D}${sysconfdir}/default
>  	install -d ${D}${sysconfdir}/default/volatiles
>  
> -	install -m 0644    ${WORKDIR}/functions		${D}${sysconfdir}/init.d
> +	install -m 0644    ${WORKDIR}/functions		${D}${sysconfdir}/init.d/functions.${BPN}
>  	install -m 0755    ${WORKDIR}/bootmisc.sh	${D}${sysconfdir}/init.d
>  	install -m 0755    ${WORKDIR}/checkroot.sh	${D}${sysconfdir}/init.d
>  #	install -m 0755    ${WORKDIR}/finish.sh		${D}${sysconfdir}/init.d

Won't the code in the class handling this renaming itself?

Cheers,

Richard




