Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7F34D77009
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 15:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t83FD9kj003540; Thu, 3 Sep 2015 16:13:09 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Y-g5jSZN7K3L; Thu,  3 Sep 2015 16:13:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t83FCuX9003535
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 3 Sep 2015 16:13:07 +0100
Message-ID: <1441293176.24871.118.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Date: Thu, 03 Sep 2015 16:12:56 +0100
In-Reply-To: <9f749745e56f33bc00d0e08dd4951840b29a557d.1441291646.git.joshua.lock@collabora.co.uk>
References: <cover.1441291646.git.joshua.lock@collabora.co.uk>
	<9f749745e56f33bc00d0e08dd4951840b29a557d.1441291646.git.joshua.lock@collabora.co.uk>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/9] systemd: remove hard-coded paths in FILES entries
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
X-List-Received-Date: Thu, 03 Sep 2015 15:13:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-03 at 15:58 +0100, Joshua Lock wrote:
> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> ---
>  meta/recipes-core/systemd/systemd_219.bb | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> index 4d32fd5..fbd86e8 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -306,10 +306,10 @@ FILES_${PN} = " ${base_bindir}/* \
>                  ${exec_prefix}/lib/sysctl.d \
>                  ${exec_prefix}/lib/sysusers.d \
>                  ${localstatedir} \
> -                /lib/udev/rules.d/70-uaccess.rules \
> -                /lib/udev/rules.d/71-seat.rules \
> -                /lib/udev/rules.d/73-seat-late.rules \
> -                /lib/udev/rules.d/99-systemd.rules \
> +                ${base_libdir}/udev/rules.d/70-uaccess.rules \
> +                ${base_libdir}/udev/rules.d/71-seat.rules \
> +                ${base_libdir}/udev/rules.d/73-seat-late.rules \
> +                ${base_libdir}/udev/rules.d/99-systemd.rules \
>                 "
>  
>  FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
> @@ -327,7 +327,7 @@ RRECOMMENDS_${PN} += "systemd-serialgetty systemd-vconsole-setup \
>  
>  PACKAGES =+ "udev-dbg udev udev-hwdb"
>  
> -FILES_udev-dbg += "/lib/udev/.debug"
> +FILES_udev-dbg += "${base_libdir}/udev/.debug"

From what I remember, this is intentional and this change likely breaks
multilib. You don't want two sets of rules on a multilib system.

Cheers,

Richard




