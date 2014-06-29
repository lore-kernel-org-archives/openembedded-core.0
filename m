Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A07506116C
	for <Openembedded-core@lists.openembedded.org>;
	Sun, 29 Jun 2014 09:05:57 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5T95kWC019685; Sun, 29 Jun 2014 10:05:46 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Nkz9jzr_5N8F; Sun, 29 Jun 2014 10:05:46 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5T95dYu019677
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 29 Jun 2014 10:05:40 +0100
Message-ID: <1404032732.28648.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fabien Chereau <fabien.chereau@intel.com>
Date: Sun, 29 Jun 2014 10:05:32 +0100
In-Reply-To: <1403778002-10155-1-git-send-email-fabien.chereau@intel.com>
References: <1403778002-10155-1-git-send-email-fabien.chereau@intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libusb: add missing build dependency on udev
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
X-List-Received-Date: Sun, 29 Jun 2014 09:06:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-06-26 at 12:20 +0200, Fabien Chereau wrote:
> This fixes the ./configure error in case libusb is built before udev/systemd.
> 
> Signed-off-by: Fabien Chereau <fabien.chereau@intel.com>
> ---
>  meta/recipes-support/libusb/libusb1_1.0.19.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-support/libusb/libusb1_1.0.19.bb b/meta/recipes-support/libusb/libusb1_1.0.19.bb
> index a20e1fc..be2be9d 100644
> --- a/meta/recipes-support/libusb/libusb1_1.0.19.bb
> +++ b/meta/recipes-support/libusb/libusb1_1.0.19.bb
> @@ -6,6 +6,8 @@ SECTION = "libs"
>  LICENSE = "LGPLv2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>  
> +DEPENDS_append = " udev"
> +
>  BBCLASSEXTEND = "native nativesdk"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \

This causes the build to explode with circular dependency issues. How
did you test this?

https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/builds/147/steps/BuildImages/logs/stdio

There is a second error about a missing nativesdk-udev dependency (to
build nativesdk-libusb1) too.

Cheers,

Richard


