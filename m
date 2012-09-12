Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1TBd8K-0002FD-S2
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 04:56:57 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 321F3F811ED; Tue, 11 Sep 2012 20:44:26 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id BA3F9F811E3;
	Tue, 11 Sep 2012 20:44:24 -0600 (MDT)
Message-ID: <504FF70B.7060701@mlbassoc.com>
Date: Tue, 11 Sep 2012 20:44:27 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1346905978.git.raj.khem@gmail.com>
	<5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
In-Reply-To: <5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
Subject: Re: [PATCH 1/4] gcc: Switch SRC_URI to use svn
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
X-List-Received-Date: Wed, 12 Sep 2012 02:56:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-09-05 22:35, Khem Raj wrote:
> svn tar balls are 96M as compared to 1.3G git tars
> its unnessary to suck in that much of data.
>
> Fixes [YOCTO #2908]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

What about this patch?   Carrying around a 1.7GB (Sorry, Khem, that's the size of my tar ball!)
is a bit much, especially when that's what I send to my customers...

> ---
>   meta/recipes-devtools/gcc/gcc-4.7.inc |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index 84c230c..affbd54 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -11,7 +11,7 @@ PR = "r11"
>   # using 4.7.1.0 for upgrade path when we move past 4.7.2 release
>   # then we should drop the last 0 as well.
>
> -PV = "4.7.1.0+git${SRCPV}"
> +PV = "4.7.1.0+svn${SRCPV}"
>
>   # BINV should be incremented after updating to a revision
>   # after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
> @@ -21,7 +21,7 @@ PV = "4.7.1.0+git${SRCPV}"
>
>   BINV = "4.7.2"
>
> -SRCREV = "d07e24f4ab59f264d68d21838795349faab5dede"
> +SRCREV = "190218"
>   BRANCH = "gcc-4_7-branch"
>   FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
>
> @@ -36,7 +36,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>                      file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>   		   file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
>
> -SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};protocol=git \
> +SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};protocol=http \
>   	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
>   	   file://100-uclibc-conf.patch \
>              file://gcc-uclibc-locale-ctype_touplow_t.patch \
> @@ -77,7 +77,7 @@ SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};protocol=git \
>   	   file://libtool.patch \
>   	  "
>
> -S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
> +S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
>   B = "${WORKDIR}/${BRANCH}/build.${HOST_SYS}.${TARGET_SYS}"
>
>   # Language Overrides
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


