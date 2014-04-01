Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 694F46E6FA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 10:51:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s31ApGlp015916; Tue, 1 Apr 2014 11:51:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id M8Rn9DC8Q0cl; Tue,  1 Apr 2014 11:51:16 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s31ApCNB015911
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 1 Apr 2014 11:51:14 +0100
Message-ID: <1396349467.1432.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Florin Sarbu <florin.sarbu@windriver.com>
Date: Tue, 01 Apr 2014 11:51:07 +0100
In-Reply-To: <1396346945-3782-1-git-send-email-florin.sarbu@windriver.com>
References: <1396346945-3782-1-git-send-email-florin.sarbu@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman.inc: Add PACKAGECONFIG support for bluez5
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
X-List-Received-Date: Tue, 01 Apr 2014 10:51:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-01 at 13:09 +0300, Florin Sarbu wrote:
> Currently connman can only RDEPEND on bluez4.
> This patch adds support for having bluez5 in PACKAGECONFIG
> and get connman RDEPEND on bluez5 if desired.
> 
> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
> ---
>  meta/recipes-connectivity/connman/connman.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index b3147c9..53a6a4f 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -32,7 +32,7 @@ EXTRA_OECONF += "\
>  
>  PACKAGECONFIG ??= "wispr \
>                     ${@base_contains('DISTRO_FEATURES', 'wifi','wifi', '', d)} \
> -                   ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluetooth', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', '3g','3g', '', d)} \
>  "
>  
> @@ -42,6 +42,7 @@ PACKAGECONFIG ??= "wispr \
>  
>  PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
>  PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, bluez4"

You renamed the option above but didn't here and hence broke bluez4.
This is not the quality of patch expected at -rc time for a release :(.

Cheers,

Richard

> +PACKAGECONFIG[bluez5] = "--enable-bluetooth, --disable-bluetooth, bluez5"
>  PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
>  PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
>  PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
> @@ -114,6 +115,7 @@ RPROVIDES_${PN} = "\
>  RDEPENDS_${PN} = "\
>  	dbus \
>  	${@base_contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '', d)} \
> +	${@base_contains('PACKAGECONFIG', 'bluez5', 'bluez5', '', d)} \
>  	${@base_contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '', d)} \
>  	${@base_contains('PACKAGECONFIG', '3g','ofono', '', d)} \
>  	xuser-account \
> -- 
> 1.9.1
> 



