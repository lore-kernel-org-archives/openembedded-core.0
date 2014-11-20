Return-Path: <paul.betafive@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id AF63370620
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 11:56:59 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id m20so1934932qcx.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 03:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=R+lUP01pkdYw4fDxHj5tZu3OLO6cZPNWABEFoSRQgFM=;
	b=dP9BAVxAjLeIUubO/KqCmuodhfPvCwGTdcrlFfQqOxhfs1lZdtfcidOMn1yhJXiz/4
	2wFZ9P/+EhycDxvx9WlIvVl17/YbSXzENjQ3Pag1zApQUB+lCpPA6qMMv4duIhMmsn94
	hgSd98NoVOq7eKKfHga11aNDHZVwEm+ritQFnDqEtWIN2Q/m2bO1HEMfeyD5aeC45ZuM
	H7ERe4nq2jZ3n/tG6D8+Rru1cl62YsD0qvpsnXCsxGG8uDht1U0uKj/RwAt8xPnmw0dr
	JsbRncuS5WIBuYfMnfoePNp/3UuExxtlAAj56zm6v3iqRhxwnwHW+qNySIHZpve5htfK
	F/iA==
X-Received: by 10.224.120.3 with SMTP id b3mr60791723qar.9.1416484619607; Thu,
	20 Nov 2014 03:56:59 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.143.146 with HTTP; Thu, 20 Nov 2014 03:56:19 -0800 (PST)
In-Reply-To: <1416452807-22721-1-git-send-email-jian.liu@windriver.com>
References: <1416452807-22721-1-git-send-email-jian.liu@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 20 Nov 2014 11:56:19 +0000
X-Google-Sender-Auth: Xbjn3Uy_pzk3p2IQ951vIq2llL4
Message-ID: <CANyK_8eo2MypK6Niq=Fzfc7z-wKvH8W26WKGqx2zG+AaFC8pNA@mail.gmail.com>
To: Jian Liu <jian.liu@windriver.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lsof: the compiler version fault
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
X-List-Received-Date: Thu, 20 Nov 2014 11:56:59 -0000
Content-Type: text/plain; charset=UTF-8

On 20 November 2014 03:06, Jian Liu <jian.liu@windriver.com> wrote:
> When using cross compiler to build the package "lsof" on a host,
> the value of LSOF_CCV in version.h genegrated by the Makefile
> is the version of the compiler on the host while it should be
> the version of cross compiler.
>
> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> ---
>  .../lsof/files/compiler-version-fault.patch                 | 13 +++++++++++++
>  meta/recipes-extended/lsof/lsof_4.87.bb                     |  4 +++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/lsof/files/compiler-version-fault.patch
>
> diff --git a/meta/recipes-extended/lsof/files/compiler-version-fault.patch b/meta/recipes-extended/lsof/files/compiler-version-fault.patch
> new file mode 100644
> index 0000000..bf22f4b
> --- /dev/null
> +++ b/meta/recipes-extended/lsof/files/compiler-version-fault.patch
> @@ -0,0 +1,13 @@
> +diff -Nur lsof_4.87_src.orig/dialects/linux/Makefile lsof_4.87_src/dialects/linux/Makefile
> +--- lsof_4.87_src.orig/dialects/linux/Makefile 2008-04-15 21:30:04.000000000 +0800
> ++++ lsof_4.87_src/dialects/linux/Makefile      2014-09-09 14:15:27.208165334 +0800
> +@@ -77,7 +77,8 @@
> +       @rm -f version.h
> +       @echo '#define  LSOF_BLDCMT     "${LSOF_BLDCMT}"' > version.h;
> +       @echo '#define  LSOF_CC         "${CC}"' >> version.h
> +-      @echo '#define  LSOF_CCV        "${CCV}"' >> version.h
> ++      @LSOF_CCV=`${CC} -v 2>&1 | sed -n 's/.*version \(.*\)/\1/p'` &&\
> ++      echo "#define   LSOF_CCV        \"$${LSOF_CCV}\"" >> version.h
> +       @echo '#define  LSOF_CCDATE     "'`date`'"' >> version.h
> +       @echo '#define  LSOF_CCFLAGS    "'`echo ${CFLAGS} | sed 's/\\\\(/\\(/g' | sed 's/\\\\)/\\)/g' | sed 's/"/\\\\"/g'`'"' >> version.h
> +       @echo '#define  LSOF_CINFO      "${CINFO}"' >> version.h

This patch needs 'Upstream-status' and 'Signed-off-by' tags as
described in http://openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations.
Giving a short description of the patch within the patch file itself
is also encouraged.

> diff --git a/meta/recipes-extended/lsof/lsof_4.87.bb b/meta/recipes-extended/lsof/lsof_4.87.bb
> index 03fee16..9de3f33 100644
> --- a/meta/recipes-extended/lsof/lsof_4.87.bb
> +++ b/meta/recipes-extended/lsof/lsof_4.87.bb
> @@ -5,7 +5,9 @@ SECTION = "devel"
>  LICENSE = "BSD"
>  PR = "r0"
>
> -SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
> +SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2 \
> +       file://compiler-version-fault.patch \
> +       "
>
>  SRC_URI[md5sum] = "80e2a76d0e05826db910ec88e631296c"
>  SRC_URI[sha256sum] = "dfdd3709d82bc79ccdf3e404b84aafa9aede5948642a824ecaefd0aac589da2c"
> --
> 1.8.5.2.233.g932f7e4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

