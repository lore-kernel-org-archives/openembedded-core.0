Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TsDaG-0006F1-C1 for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 15:21:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07E6dCK005072;
	Mon, 7 Jan 2013 14:06:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04131-05; Mon,  7 Jan 2013 14:06:35 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07E6WmU005066
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 7 Jan 2013 14:06:33 GMT
Message-ID: <1357567595.25855.25.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Mon, 07 Jan 2013 14:06:35 +0000
In-Reply-To: <c7eeaf9b46dd9c854603f2c5e3157799390ab76d.1357290320.git.hongxu.jia@windriver.com>
References: <cover.1357290320.git.hongxu.jia@windriver.com>
	<c7eeaf9b46dd9c854603f2c5e3157799390ab76d.1357290320.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass:specify the order of do_rootfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 14:21:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-01-05 at 08:45 +0800, Hongxu Jia wrote:
> The task of do_populate_lic use "bb.build.exec_func" to execute shell function
> "sstate_create_package", and "bb.build.exec_func" use ${B} as default dir to cd
> and execute the shell function. At this place, B = "${WORKDIR}/${BPN}-${PV}/",
> and "${WORKDIR}/${BPN}-${PV}/" is removed by task do_rootfs.
> 
> When we use more than one bitabke to run tasks, there is a chance that do_rootfs
> and do_populate_lic are being executed at the same time. So we should explicity
> specify the order of do_populate_lic and do_rootfs to let "${WORKDIR}/${BPN}-${PV}/"
> could be correctly used and removed.
> 
> [YOCTO #3674]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/image.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index d3a416d..c2dab36 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -472,4 +472,4 @@ do_package_write_ipk[noexec] = "1"
>  do_package_write_deb[noexec] = "1"
>  do_package_write_rpm[noexec] = "1"
>  
> -addtask rootfs before do_build
> +addtask rootfs before do_build after do_populate_lic

Lets not add pointless ordering constraints.

sstate_create_package[dirs] = "${SSTATE_BUILDDIR}"
sstate_unpack_package[dirs] = "${SSTATE_INSTDIR}"

in sstate.bbclass should resolve this and another similar possible race.

Cheers,

Richard






