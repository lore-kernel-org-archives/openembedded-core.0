Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00D8E65DA3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 08:42:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s778gU39022417
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Aug 2014 01:42:30 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 7 Aug 2014 01:42:29 -0700
Message-ID: <53E33BFB.7040407@windriver.com>
Date: Thu, 7 Aug 2014 16:42:35 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1407357515-6147-1-git-send-email-paul.gortmaker@windriver.com>
In-Reply-To: <1407357515-6147-1-git-send-email-paul.gortmaker@windriver.com>
X-Originating-IP: [128.224.162.187]
Subject: Re: [PATCH] coreutils: drop patch that unconditionally mangles manpages
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
X-List-Received-Date: Thu, 07 Aug 2014 08:42:34 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2014 04:38 AM, Paul Gortmaker wrote:
> commit 841ec528ec04e64bd09ff10f8d9ad2d6e3aac05d ("coreutils: update
> to upstream version 9.21") added a patch which bypassed the check
> for perl and hence defaults to using the dummy man page for all
> of the coreutils manpages.  This results in all manpages looking like:
>
>    NAME
>         chmod - a GNU coreutils 8.22 program
>
>    DESCRIPTION
>         OOOPS!   Due to the lack of perl on the build system, we were unable to
>         create a proper manual page for chmod.
>
> It is unclear why the test was disabled, but since it clearly
> causes the manpages to be useless, we need to drop this patch.
>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>
> diff --git a/meta/recipes-core/coreutils/coreutils-8.22/dummy_help2man.patch b/meta/recipes-core/coreutils/coreutils-8.22/dummy_help2man.patch
> deleted file mode 100644
> index 4757f52aa0be..000000000000
> --- a/meta/recipes-core/coreutils/coreutils-8.22/dummy_help2man.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Upstream-Status: Inappropriate [disable feature]
> -
> -Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> -diff -Nurd coreutils-8.21/man/local.mk coreutils-8.21/man/local.mk
> ---- coreutils-8.21/man/local.mk	2013-02-05 16:01:21.000000000 +0200
> -+++ coreutils-8.21/man/local.mk	2013-03-23 09:12:53.360470192 +0200
> -@@ -19,11 +19,11 @@
> - EXTRA_DIST += man/help2man man/dummy-man
> -
> - ## Graceful degradation for systems lacking perl.
> --if HAVE_PERL
> --run_help2man = $(PERL) -- $(srcdir)/man/help2man
> --else
> -+#if HAVE_PERL
> -+#run_help2man = $(PERL) -- $(srcdir)/man/help2man
> -+#else
> - run_help2man = $(SHELL) $(srcdir)/man/dummy-man
> --endif
> -+#endif
> -
> - man1_MANS = @man1_MANS@
> - EXTRA_DIST += $(man1_MANS:.1=.x)
> diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes-core/coreutils/coreutils_8.22.bb
> index d5373ae9d66a..b19c1691eb10 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.22.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
> @@ -14,7 +14,6 @@ inherit autotools gettext texinfo
>   
>   SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>              file://remove-usr-local-lib-from-m4.patch \
> -           file://dummy_help2man.patch \
>              file://fix-for-dummy-man-usage.patch \
>             "
>   

There's some build failure about coreutils on autobuilder that might be 
caused by this patch.
Please take a look at it.

Below is a link to the log.
https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/201/steps/BuildImages_1/logs/stdio

//Chen Qi

