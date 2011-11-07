Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RNTI8-0003hW-0f
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 18:47:28 +0100
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 07 Nov 2011 09:41:09 -0800
Received: by wwi36 with SMTP id 36so5045257wwi.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 09:41:08 -0800 (PST)
Received: by 10.227.203.132 with SMTP id fi4mr31088276wbb.6.1320687668430;
	Mon, 07 Nov 2011 09:41:08 -0800 (PST)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117]) by mx.google.com with ESMTPS id
	et20sm28511416wbb.15.2011.11.07.09.41.05
	(version=SSLv3 cipher=OTHER); Mon, 07 Nov 2011 09:41:07 -0800 (PST)
Message-ID: <4EB81830.9010606@intel.com>
Date: Mon, 07 Nov 2011 09:41:04 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320416813-22888-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1320416813-22888-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] lighttpd 1.4.29: rename index.html to avoid clashes with DL_DIR
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
X-List-Received-Date: Mon, 07 Nov 2011 17:47:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2011 07:26 AM, Koen Kooi wrote:
> As Martin Jansa pointed out before, bitbake will silently peek in DL_DIR before FILESPATH and use files from there if found.
>
> The failure mode for lighttpd involves a 404 redirect placing index.html into DL_DIR, which will end up in the lighttpd packages. In my specific case iproute2 hit the linuxfoundation 404 redirect so lighttpd.ipk now serves the linuxfoundation frontpage :)
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-extended/lighttpd/files/index.html    |    1 -
>   .../lighttpd/files/index.html.lighttpd             |    1 +
>   meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb  |    6 +++---
>   3 files changed, 4 insertions(+), 4 deletions(-)
>   delete mode 100644 meta/recipes-extended/lighttpd/files/index.html
>   create mode 100644 meta/recipes-extended/lighttpd/files/index.html.lighttpd
>
> diff --git a/meta/recipes-extended/lighttpd/files/index.html b/meta/recipes-extended/lighttpd/files/index.html
> deleted file mode 100644
> index cd25bf1..0000000
> --- a/meta/recipes-extended/lighttpd/files/index.html
> +++ /dev/null
> @@ -1 +0,0 @@
> -<html><body><h1>It works!</h1></body></html>
> \ No newline at end of file
> diff --git a/meta/recipes-extended/lighttpd/files/index.html.lighttpd b/meta/recipes-extended/lighttpd/files/index.html.lighttpd
> new file mode 100644
> index 0000000..cd25bf1
> --- /dev/null
> +++ b/meta/recipes-extended/lighttpd/files/index.html.lighttpd
> @@ -0,0 +1 @@
> +<html><body><h1>It works!</h1></body></html>
> \ No newline at end of file
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb
> index c1d5f81..9fdb5f6 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb
> @@ -16,10 +16,10 @@ RDEPENDS_${PN} += " \
>                  lighttpd-module-staticfile \
>   "
>
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2 \
> -        file://index.html \
> +        file://index.html.lighttpd \
>           file://lighttpd.conf \
>           file://lighttpd \
>   "
> @@ -48,7 +48,7 @@ do_install_append() {
>       install -d ${D}${sysconfdir}/init.d ${D}/www/logs ${D}/www/pages/dav ${D}/www/var
>       install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
>       install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
> -    install -m 0644 ${WORKDIR}/index.html ${D}/www/pages/
> +    install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
>   }
>
>   FILES_${PN} += "${sysconfdir} /www"

Merged into OE-Core

Thanks
	Sau!



