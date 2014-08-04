Return-Path: <pab@pabigot.com>
X-Greylist: delayed 434 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Aug 2014 13:26:13 UTC
Received: from p3plsmtpa12-05.prod.phx3.secureserver.net
	(p3plsmtpa12-05.prod.phx3.secureserver.net [68.178.252.234])
	by mail.openembedded.org (Postfix) with ESMTP id 65A7F60167
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 13:26:13 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa12-05.prod.phx3.secureserver.net with 
	id adJx1o0081mTNtu01dJxCf; Mon, 04 Aug 2014 06:18:59 -0700
Message-ID: <53DF8840.8010305@pabigot.com>
Date: Mon, 04 Aug 2014 08:18:56 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>, 
	openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1406891040-8738-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1406891040-8738-1-git-send-email-koen@dominion.thruhere.net>
Subject: Re: cups: fix host contamination issue
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
X-List-Received-Date: Mon, 04 Aug 2014 13:26:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2014 06:04 AM, Koen Kooi wrote:
> -I/usr/include would end up in CFLAGS if /usr/bin/gcrypt-config is
> present on the host systemd.
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Yes, http://patches.openembedded.org/patch/77153/ should (IMO) supersede 
this.

It's my follow-up after Ross disliked 
http://patches.openembedded.org/patch/75403/ because it patched a 
generated file.

Peter

>
> ---
> ...crypt-config-from-the-host-it-leads-to-SS.patch | 28 ++++++++++++++++++++++
>   meta/recipes-extended/cups/cups_1.7.4.bb           |  1 +
>   2 files changed, 29 insertions(+)
>   create mode 100644 meta/recipes-extended/cups/cups/0001-don-t-use-gcrypt-config-from-the-host-it-leads-to-SS.patch
>
> diff --git a/meta/recipes-extended/cups/cups/0001-don-t-use-gcrypt-config-from-the-host-it-leads-to-SS.patch b/meta/recipes-extended/cups/cups/0001-don-t-use-gcrypt-config-from-the-host-it-leads-to-SS.patch
> new file mode 100644
> index 0000000..c37fd0c
> --- /dev/null
> +++ b/meta/recipes-extended/cups/cups/0001-don-t-use-gcrypt-config-from-the-host-it-leads-to-SS.patch
> @@ -0,0 +1,28 @@
> +From bfcc8b85fd1b204a3bb50d7246b3adb6da57da00 Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Fri, 1 Aug 2014 12:59:38 +0200
> +Subject: [PATCH] don't use gcrypt-config from the host, it leads to  SSLFLAGS=-I/usr/include
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +Upstream-status: Inapprotiate [OE-specific]
> +---
> + configure | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 7d1e31d..01cda33 100755
> +--- a/configure
> ++++ b/configure
> +@@ -8411,9 +8411,6 @@ fi
> +             if $PKGCONFIG --exists gcrypt; then
> + 	        SSLLIBS="$SSLLIBS `$PKGCONFIG --libs gcrypt`"
> + 	        SSLFLAGS="$SSLFLAGS `$PKGCONFIG --cflags gcrypt`"
> +-	    elif test "x$LIBGCRYPTCONFIG" != x; then
> +-	        SSLLIBS="$SSLLIBS `$LIBGCRYPTCONFIG --libs`"
> +-	        SSLFLAGS="$SSLFLAGS `$LIBGCRYPTCONFIG --cflags`"
> + 	    fi
> + 	fi
> +     fi
> +--
> +1.9.0
> +
> diff --git a/meta/recipes-extended/cups/cups_1.7.4.bb b/meta/recipes-extended/cups/cups_1.7.4.bb
> index 9dae986..c15facb 100644
> --- a/meta/recipes-extended/cups/cups_1.7.4.bb
> +++ b/meta/recipes-extended/cups/cups_1.7.4.bb
> @@ -2,5 +2,6 @@ require cups.inc
>   
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5e50cb4b8f24b04636b719683a9102d"
>   
> +SRC_URI += "file://0001-don-t-use-gcrypt-config-from-the-host-it-leads-to-SS.patch"
>   SRC_URI[md5sum] = "1a2295c2b2d2f422db2e50f40ed2fb99"
>   SRC_URI[sha256sum] = "358fc7f22395a9ba07efcfc0d34a057ab5e9182b6e3297f71263a6b68fb41378"
>
>


