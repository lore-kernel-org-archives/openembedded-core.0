Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 57A63755F4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Sep 2015 06:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8Q6wwR4015632; Sat, 26 Sep 2015 07:58:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PCQfqhQsGgqw; Sat, 26 Sep 2015 07:58:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8Q6wk9R015620
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 26 Sep 2015 07:58:58 +0100
Message-ID: <1443250726.19044.209.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Franco <alejandro.franco@linux.intel.com>
Date: Sat, 26 Sep 2015 07:58:46 +0100
In-Reply-To: <1443221651-7364-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1443221651-7364-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: randy.e.witt@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] AB random failure: libpcre-native split_and_strip
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
X-List-Received-Date: Sat, 26 Sep 2015 06:59:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-09-25 at 17:54 -0500, Alex Franco wrote:
> Error handling: adding file-native as a dependency to libpre recipe
> should guarantee a consistent, and more importantly POSIX-compliant
> version of the "file" command is always used when checking the file
> "pcre-config" within the isELF function in staging.bbclass.
> 
> Following the POSIX behavior, file returns 0 and continues, when an
> error is found while checking a file.
> 
> Debug: in cases where file may still fail, the resulting error will
> now be logged along with the split_and_strip_files failure.

I like the improvement in debug, I'm not sure the other part of this
will solve the problem though. We've seen this error on recipes other
that libpcre and also, which systems do you think doesn't have a
POSIX-compliant version of the file?

Cheers,

Richard

> [YOCTO #8144]
> 
> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
> ---
>  meta/classes/staging.bbclass                 | 2 +-
>  meta/recipes-support/libpcre/libpcre_8.37.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index 967eddd..554c2e4 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -77,7 +77,7 @@ python sysroot_strip () {
>          ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
>  
>          if ret:
> -            bb.error("split_and_strip_files: 'file %s' failed" % path)
> +            bb.error("split_and_strip_files: 'file %s' failed\nError: %s" % (path, result))
>              return type
>  
>          # Not stripped
> diff --git a/meta/recipes-support/libpcre/libpcre_8.37.bb b/meta/recipes-support/libpcre/libpcre_8.37.bb
> index bcfc9e9..1a2024d 100644
> --- a/meta/recipes-support/libpcre/libpcre_8.37.bb
> +++ b/meta/recipes-support/libpcre/libpcre_8.37.bb
> @@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "51679ea8006ce31379fb0860e46dd86665d864b5020fc9cd19e71260ee
>  S = "${WORKDIR}/pcre-${PV}"
>  
>  PROVIDES += "pcre"
> -DEPENDS += "bzip2 zlib"
> +DEPENDS += "bzip2 zlib file-native"
>  
>  PACKAGECONFIG[pcretest-readline] = "--enable-pcretest-libreadline,--disable-pcretest-libreadline,readline,"
>  
> -- 
> 2.5.3
> 



