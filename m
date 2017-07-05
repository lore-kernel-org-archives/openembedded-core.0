Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 135D9775DE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 14:28:39 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v65EScwm029663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 5 Jul 2017 15:28:39 +0100
Message-ID: <1499264918.9571.180.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 05 Jul 2017 15:28:38 +0100
In-Reply-To: <35164d05e9ab2505c931424d4b7c7b9fea9c65f8.1499241206.git.kai.kang@windriver.com>
References: <cover.1499241206.git.kai.kang@windriver.com>
	<35164d05e9ab2505c931424d4b7c7b9fea9c65f8.1499241206.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 05 Jul 2017 15:28:39 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/2] bind: disable ecdsa if openssl doesn't support it
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
X-List-Received-Date: Wed, 05 Jul 2017 14:28:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-07-05 at 15:58 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Distro feature 'openssl-no-weak-ciphers' is introduced to disable
> openssl weak ciphers support which include ecdsa. So configure bind
> without ecdsa if openssl doesn't support it.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-connectivity/bind/bind_9.10.3-P3.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
> b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
> index 7eb79b0..e10cffc 100644
> --- a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
> @@ -41,6 +41,7 @@ ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('
> DISTRO_FEATURES', 'ipv6', 'ye
>  EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
>                   --disable-devpoll --enable-epoll --with-gost=no \
>                   --with-gssapi=no --with-ecdsa=yes \
> +                 --with-ecdsa=${@bb.utils.contains('DISTRO_FEATURES'
> , 'openssl-no-weak-ciphers', 'no', 'yes', d)} \
>                   --sysconfdir=${sysconfdir}/bind \
>                   --with-openssl=${STAGING_LIBDIR}/.. \
>                 "
> 

I think there are a few more questions that need answering about this,
like why ecdsa is considered weak but this patch leaves --with-
ecdsa=yes  in there which is confusing at best.

I do think these are best controlled as individual PACKAGECONFIG
options rather than a distro setting which is ambigous (what is
'weak').

Cheers,

Richard

