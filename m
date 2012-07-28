Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Sv4iD-0000XM-SL
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 12:57:33 +0200
Received: from localhost ([127.0.0.1]:57304 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Sv4X2-000088-Vn
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 10:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=A2L3PScgq1AJr5jsr7BZqkQpHgY=; b=mLYfUc682Q1H+v81tCuZUthmtWLe
	gacIn2XepOYQCsx2lgU/e+orvZSup86OUx+DQz2TEfQVCyZ5gTu/YqIq5PjZMbER
	mV9jxjhACYWXRb6fTVEiumUX9K+gzDMimtzGqUmp8wAKGtGwdlq388wPTgvTRm/5
	DZlhIfE3vEIWqF0=
Received: from cpc2-cmbg15-2-0-cust171.5-4.cable.virginmedia.com
	([86.26.12.172]:49772 helo=[192.168.1.113])
	by eumx.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <ml@communistcode.co.uk>)
	id 1Sv4SC-0008Un-R2 for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 10:41:00 +0000
Message-ID: <5013C1BB.9020504@communistcode.co.uk>
Date: Sat, 28 Jul 2012 11:40:59 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
	<4d738395bf7cd05c924a9facf9677bab784cb1b6.1341763346.git.raj.khem@gmail.com>
In-Reply-To: <4d738395bf7cd05c924a9facf9677bab784cb1b6.1341763346.git.raj.khem@gmail.com>
Subject: Re: [PATCH 08/19] bison: Fix for gets being removed from eglibc 2.16
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Sat, 28 Jul 2012 10:57:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2012 17:10, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../recipes-devtools/bison/bison/remove-gets.patch |   20 ++++++++++++++++++++
>   meta/recipes-devtools/bison/bison_2.5.bb           |    6 ++++--
>   2 files changed, 24 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/bison/bison/remove-gets.patch
>
> diff --git a/meta/recipes-devtools/bison/bison/remove-gets.patch b/meta/recipes-devtools/bison/bison/remove-gets.patch
> new file mode 100644
> index 0000000..2dfa00f
> --- /dev/null
> +++ b/meta/recipes-devtools/bison/bison/remove-gets.patch
> @@ -0,0 +1,20 @@
> +gets has been removed from eglibc 2.16
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +Index: bison-2.5/lib/stdio.in.h
> +===================================================================
> +--- bison-2.5.orig/lib/stdio.in.h	2012-07-04 09:09:48.336532195 -0700
> ++++ bison-2.5/lib/stdio.in.h	2012-07-04 09:10:22.868533884 -0700
> +@@ -180,8 +180,10 @@
> + /* It is very rare that the developer ever has full control of stdin,
> +    so any use of gets warrants an unconditional warning.  Assume it is
> +    always declared, since it is required by C89.  */
> ++#if defined gets
> + #undef gets
> + _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
> ++#endif
> +
> + #if @GNULIB_FOPEN@
> + # if @REPLACE_FOPEN@
> diff --git a/meta/recipes-devtools/bison/bison_2.5.bb b/meta/recipes-devtools/bison/bison_2.5.bb
> index fc3bb6d..687f06a 100644
> --- a/meta/recipes-devtools/bison/bison_2.5.bb
> +++ b/meta/recipes-devtools/bison/bison_2.5.bb
> @@ -9,14 +9,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>   SECTION = "devel"
>   DEPENDS = "bison-native flex-native"
>   
> -PR = "r1"
> +PR = "r2"
>   
>   BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
>   	   file://m4.patch \
>   	  "
>   
>   SRC_URI = "${BASE_SRC_URI} \
> -        file://fix_cross_manpage_building.patch "
> +           file://fix_cross_manpage_building.patch \
> +           file://remove-gets.patch \
> +          "
>   
>   SRC_URI[md5sum] = "687e1dcd29452789d34eaeea4c25abe4"
>   SRC_URI[sha256sum] = "722def46e4a19a5b7a579ef30db1965f86c37c1a20a5f0113743a2e4399f7c99"

Hi Khem,

This patch doesn't fix the Bison gets issue for me, I had to create a 
patch that removed the line altogether to get it to compile 
successfully. Even though gets isn't present on my system it still 
matches the #if defined gets and tries to #undef gets which results in 
an error.

However, I don't think removing the line altogether is the correct fix 
for the global userbase...

Regards,
Jack.


