Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2ADDD6E630
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 21:00:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u27L09ND006481
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 7 Mar 2016 13:00:09 -0800
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 7 Mar 2016 13:00:09 -0800
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1457381519-30481-1-git-send-email-ross.burton@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56DDEBD8.5090500@windriver.com>
Date: Mon, 7 Mar 2016 15:00:08 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1457381519-30481-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] rpm: fix races over rpmqv.c in parallel builds
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
X-List-Received-Date: Mon, 07 Mar 2016 21:00:10 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/7/16 2:11 PM, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Tested and it works.

If I need to spin a V6, I'll include this -- otherwise it should be added on
it's own.

--Mark

> ---
>  .../recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch | 37 +++++++++++++++-------
>  1 file changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch b/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
> index b3c14fd..b2437a8 100644
> --- a/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
> +++ b/meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
> @@ -1,4 +1,7 @@
> -rpm: compile rpmqv.c instead of rpmqv.cc
> +From e8bae261615e19ff8a28683765c9539cfb22a086 Mon Sep 17 00:00:00 2001
> +From: Joe Slater <jslater@windriver.com>
> +Date: Thu, 17 Jul 2014 18:14:54 -0700
> +Subject: [PATCH 1/9] rpm: compile rpmqv.c instead of rpmqv.cc
>  
>  Some versions of gcc, 4.4.5 for example, will put a reference to __gxx_personality_v0
>  into rpm.o and rpmbuild.o.  This means we must link with g++, and the Makefile we
> @@ -10,28 +13,38 @@ Upstream-Status: Inappropriate [other]
>  
>     When linking with g++ is really necessary, the upstream package will do that.
>  
> +Also instead of symlinking files in two places, which can and does race in
> +parallel builds, simply refer to the file's full location [RB]
> +
>  Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +---
> + Makefile.am | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
>  
> -Index: rpm/Makefile.am
> -===================================================================
> ---- rpm.orig/Makefile.am
> -+++ rpm/Makefile.am
> -@@ -202,14 +202,16 @@ rpm_LDFLAGS =		@LDFLAGS_STATIC@ $(LDFLAG
> +diff --git a/Makefile.am b/Makefile.am
> +index 1dade0a..55f8669 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -201,15 +201,13 @@ rpm_SOURCES =		build.c
> + rpm_LDFLAGS =		@LDFLAGS_STATIC@ $(LDFLAGS)
>   rpm_LDADD =		rpm.o $(myLDADD)
>   rpm.o:	$(top_srcdir)/rpmqv.c
> - 	ln -sf $< rpmqv.cc
> -+	ln -sf $< rpmqv.c
> +-	ln -sf $< rpmqv.cc
>  -	$(COMPILE) -DIAM_RPMBT -DIAM_RPMDB -DIAM_RPMEIU -DIAM_RPMK -DIAM_RPMQV -o $@ -c rpmqv.cc
> -+	$(COMPILE) -DIAM_RPMBT -DIAM_RPMDB -DIAM_RPMEIU -DIAM_RPMK -DIAM_RPMQV -o $@ -c rpmqv.c
> ++	$(COMPILE) -DIAM_RPMBT -DIAM_RPMDB -DIAM_RPMEIU -DIAM_RPMK -DIAM_RPMQV -o $@ -c $^
>   
>   rpmbuild_SOURCES =	build.c
>   rpmbuild_LDFLAGS =	@LDFLAGS_STATIC@ $(LDFLAGS)
>   rpmbuild_LDADD =	rpmbuild.o $(myLDADD)
>   rpmbuild.o:	$(top_srcdir)/rpmqv.c
> - 	ln -sf $< rpmqv.cc
> -+	ln -sf $< rpmqv.c
> +-	ln -sf $< rpmqv.cc
>  -	$(COMPILE) -DIAM_RPMBT -o $@ -c rpmqv.cc
> -+	$(COMPILE) -DIAM_RPMBT -o $@ -c rpmqv.c
> ++	$(COMPILE) -DIAM_RPMBT -o $@ -c $^
>   
>   .syntastic_c_config: Makefile
>   	@echo $(COMPILE) | tr ' ' '\n' | sed -e '1d' > $@
> +-- 
> +2.7.0
> +
> 


