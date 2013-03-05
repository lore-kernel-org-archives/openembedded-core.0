Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UCspk-0001Ba-Qu for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 15:27:17 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r25EIXMS001221; Tue, 5 Mar 2013 14:18:33 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YanMzgYykvnD; Tue,  5 Mar 2013 14:18:33 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r25EIOan001165
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 5 Mar 2013 14:18:30 GMT
Message-ID: <1362492625.29587.95.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 05 Mar 2013 14:10:25 +0000
In-Reply-To: <1362403514-10122-1-git-send-email-Martin.Jansa@gmail.com>
References: <1362403514-10122-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] avahi: move systemd support where it belongs
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
X-List-Received-Date: Tue, 05 Mar 2013 14:27:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-04 at 14:25 +0100, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-connectivity/avahi/avahi.inc       | 6 +-----
>  meta/recipes-connectivity/avahi/avahi_0.6.31.bb | 6 ++++++
>  2 files changed, 7 insertions(+), 5 deletions(-)

"where it belongs"? Is this due to the avahi-ui recipe?

Cheers,

Richard

> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> index 3a4547c..51cbe38 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -37,11 +37,7 @@ USERADD_PARAM_avahi-autoipd = "--system --home /var/run/avahi-autoipd \
>                                -c \"Avahi autoip daemon\" \
>                                avahi-autoipd"
>  
> -inherit autotools pkgconfig update-rc.d gettext systemd useradd
> -
> -SYSTEMD_PACKAGES = "${PN}-daemon ${PN}-dnsconfd"
> -SYSTEMD_SERVICE_avahi-daemon = "avahi-daemon.service"
> -SYSTEMD_SERVICE_avahi-dnsconfd = "avahi-dnsconfd.service"
> +inherit autotools pkgconfig update-rc.d gettext useradd
>  
>  EXTRA_OECONF = "--disable-introspection \
>               --with-avahi-priv-access-group=adm \
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
> index cff0974..22731f9 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
> @@ -1,5 +1,11 @@
>  require avahi.inc
>  
> +inherit systemd
> +
> +SYSTEMD_PACKAGES = "${PN}-daemon ${PN}-dnsconfd"
> +SYSTEMD_SERVICE_avahi-daemon = "avahi-daemon.service"
> +SYSTEMD_SERVICE_avahi-dnsconfd = "avahi-dnsconfd.service"
> +
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>                      file://avahi-common/address.h;endline=25;md5=b1d1d2cda1c07eb848ea7d6215712d9d \
>                      file://avahi-core/dns.h;endline=23;md5=6fe82590b81aa0ddea5095b548e2fdcb \




