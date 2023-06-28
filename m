Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F162EB64DC
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 15:15:48 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.19235.1687965345634604332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 08:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nsNUG5sG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687965342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0By2dAd9geYHt0sjUM9ztEtHPzlF0jc0mvlLerGLIEc=;
	b=nsNUG5sGn2+hcG91oQz6TXRc1AauUxkSGx3WH56oKC/huTZ+3SzMITRMm6BAHvQ7B6Ii6D
	KciEwbnEyQ2g6MHkNHYyHTgQOq7Lmrm2EWvvGxkvi5DQJKv30iE0ldPrCxW2uS6tTQKdm4
	uB8Fn7NYaoO6Is3XZzoRmhB+v9wTcUlP98XNutbQFvNny7MN4fPZ42sVMyjNUHx92MuSnK
	S4l8Tb8nQ033ns/zpKQEeP55mBa1bCOqMyUaV9sGlYGCL+HKNfo0+unngpIaFGLHvtUnl1
	+uVXU8B2aV9TMPPvNdd1Ep8QV9vNaDVTu9P8T/PR9Bgm5fdkyC4sNM7y9kLLAw==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3264160002;
	Wed, 28 Jun 2023 15:15:42 +0000 (UTC)
Date: Wed, 28 Jun 2023 17:15:41 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] bonnie++: New recipe for version 2.0
Message-ID: <20230628151541240e8c06@mail.local>
References: <f9be76642c5464c317ad0aac165a0970ec95da04.1687780832.git.joerg.sommer@navimatix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9be76642c5464c317ad0aac165a0970ec95da04.1687780832.git.joerg.sommer@navimatix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 15:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183592

Hello,

On 26/06/2023 14:00:32+0200, J�rg Sommer via lists.openembedded.org wrote:
> Newer versions of bonnie get published on
> <https://doc.coker.com.au/projects/bonnie/>. Unfortunately, the new version
> doesn't compile with g++�11 which requires *fix-csv2html-data.patch* and
> configure fails due to cross compilation which gets fixed
> with *fix-configure-lfs.patch*
> 
> Signed-off-by: J�rg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../bonnie/bonnie++/fix-configure-lfs.patch   |  37 ++++
>  .../bonnie/bonnie++/fix-csv2html-data.patch   | 181 ++++++++++++++++++
>  .../bonnie/bonnie++_2.00a.bb                  |  33 ++++
>  3 files changed, 251 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.patch
>  create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.patch
>  create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb

You certainly need to add a maintainers.inc entry for this new recipes,
else oe-selftest is going to complain.

> 
> diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.patch b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.patch
> new file mode 100644
> index 0000000000..d28e28658c
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-configure-lfs.patch
> @@ -0,0 +1,37 @@
> +diff --git i/configure.in w/configure.in
> +index 080e40c..f2a2bbe 100644
> +--- i/configure.in
> ++++ w/configure.in
> +@@ -82,8 +82,15 @@ void * thread_func(void * param) { return NULL; }
> +   , thread_ldflags="-lpthread"
> +   , thread_ldflags="-pthread")
> + 
> +-AC_SUBST(large_file)
> +-AC_TRY_RUN([#ifndef _LARGEFILE64_SOURCE
> ++AC_ARG_ENABLE(lfs,
> ++      [  --disable-lfs  disable large file support],
> ++      LFS_CHOICE=$enableval, LFS_CHOICE=check)
> ++
> ++if test "$LFS_CHOICE" = yes; then
> ++   bonniepp_cv_large_file=yes
> ++elif test "$LFS_CHOICE" = check; then
> ++   AC_CACHE_CHECK([whether to enable -D_LARGEFILE64_SOURCE], bonniepp_cv_large_file,
> ++      AC_TRY_RUN([#ifndef _LARGEFILE64_SOURCE
> + #define _LARGEFILE64_SOURCE
> + #endif
> + #include <stdio.h>
> +@@ -118,8 +125,12 @@ int main () {
> +   }
> +   close(fd);
> +   return 0;
> +-}], large_file="yes")
> +-if [[ -n "$large_file" ]]; then
> ++}], bonniepp_cv_large_file="yes"))
> ++fi
> ++
> ++AC_SUBST(large_file)
> ++
> ++if [[ -n "$bonniepp_cv_large_file" ]]; then
> +    large_file="#define _LARGEFILE64_SOURCE"
> + fi
> + 
> diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.patch b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.patch
> new file mode 100644
> index 0000000000..78ac347aa8
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++/fix-csv2html-data.patch
> @@ -0,0 +1,181 @@
> +commit 7e9433a56f22426b11cbc9bd80e0debca67c893b
> +Author: J�rg Sommer <joerg.sommer@navimatix.de>
> +Date:   Mon Jun 26 12:38:30 2023 +0200
> +
> +    csv2html: Explicitly reference data in top level
> +    
> +    With g++ 11 *data* became ambiguous with [std::data][1]. Therefore it's
> +    needed to explicitly address the variable from the top level scope.
> +    
> +    [1]�https://en.cppreference.com/w/cpp/iterator/data
> +
> +diff --git a/bon_csv2html.cpp b/bon_csv2html.cpp
> +index e9d9c50..652e330 100644
> +--- a/bon_csv2html.cpp
> ++++ b/bon_csv2html.cpp
> +@@ -87,8 +87,8 @@ int main(int argc, char **argv)
> +     read_in(buf);
> +   }
> + 
> +-  props = new PPCCHAR[data.size()];
> +-  for(i = 0; i < data.size(); i++)
> ++  props = new PPCCHAR[::data.size()];
> ++  for(i = 0; i < ::data.size(); i++)
> +   {
> +     props[i] = new PCCHAR[MAX_ITEMS];
> +     props[i][0] = NULL;
> +@@ -109,7 +109,7 @@ int main(int argc, char **argv)
> +   }
> +   calc_vals();
> +   int mid_width = header();
> +-  for(i = 0; i < data.size(); i++)
> ++  for(i = 0; i < ::data.size(); i++)
> +   {
> + // First print the average speed line
> +     printf("<tr>");
> +@@ -171,23 +171,23 @@ int compar(const void *a, const void *b)
> + 
> + void calc_vals()
> + {
> +-  ITEM *arr = new ITEM[data.size()];
> ++  ITEM *arr = new ITEM[::data.size()];
> +   for(unsigned int column_ind = 0; column_ind < MAX_ITEMS; column_ind++)
> +   {
> +     switch(vals[column_ind])
> +     {
> +     case eNoCols:
> +     {
> +-      for(unsigned int row_ind = 0; row_ind < data.size(); row_ind++)
> ++      for(unsigned int row_ind = 0; row_ind < ::data.size(); row_ind++)
> +       {
> +         if(column_ind == COL_CONCURRENCY)
> +         {
> +-          if(data[row_ind][column_ind] && strcmp("1", data[row_ind][column_ind]))
> ++          if(::data[row_ind][column_ind] && strcmp("1", ::data[row_ind][column_ind]))
> +             col_used[column_ind] = true;
> +         }
> +         else
> +         {
> +-          if(data[row_ind][column_ind] && strlen(data[row_ind][column_ind]))
> ++          if(::data[row_ind][column_ind] && strlen(::data[row_ind][column_ind]))
> +             col_used[column_ind] = true;
> +         }
> +       }
> +@@ -195,22 +195,22 @@ void calc_vals()
> +     break;
> +     case eCPU:
> +     {
> +-      for(unsigned int row_ind = 0; row_ind < data.size(); row_ind++)
> ++      for(unsigned int row_ind = 0; row_ind < ::data.size(); row_ind++)
> +       {
> +         double work, cpu;
> +         arr[row_ind].val = 0.0;
> +-        if(data[row_ind].size() > column_ind
> +-         && sscanf(data[row_ind][column_ind - 1], "%lf", &work) == 1
> +-         && sscanf(data[row_ind][column_ind], "%lf", &cpu) == 1)
> ++        if(::data[row_ind].size() > column_ind
> ++         && sscanf(::data[row_ind][column_ind - 1], "%lf", &work) == 1
> ++         && sscanf(::data[row_ind][column_ind], "%lf", &cpu) == 1)
> +         {
> +           arr[row_ind].val = cpu / work;
> +         }
> +         arr[row_ind].pos = row_ind;
> +       }
> +-      qsort(arr, data.size(), sizeof(ITEM), compar);
> ++      qsort(arr, ::data.size(), sizeof(ITEM), compar);
> +       int col_count = -1;
> +       double min_col = -1.0, max_col = -1.0;
> +-      for(unsigned int sort_ind = 0; sort_ind < data.size(); sort_ind++)
> ++      for(unsigned int sort_ind = 0; sort_ind < ::data.size(); sort_ind++)
> +       {
> +         // if item is different from previous or if the first row
> +         // (sort_ind == 0) then increment col count
> +@@ -239,7 +239,7 @@ void calc_vals()
> +           min_col /= mult;
> +         }
> +         double range_col = max_col - min_col;
> +-        for(unsigned int sort_ind = 0; sort_ind < data.size(); sort_ind++)
> ++        for(unsigned int sort_ind = 0; sort_ind < ::data.size(); sort_ind++)
> +         {
> +           if(arr[sort_ind].col_ind > -1)
> +           {
> +@@ -250,7 +250,7 @@ void calc_vals()
> +       }
> +       else
> +       {
> +-        for(unsigned int sort_ind = 0; sort_ind < data.size(); sort_ind++)
> ++        for(unsigned int sort_ind = 0; sort_ind < ::data.size(); sort_ind++)
> +         {
> +           if(vals[column_ind] == eLatency)
> +           {
> +@@ -263,25 +263,25 @@ void calc_vals()
> +     case eSpeed:
> +     case eLatency:
> +     {
> +-      for(unsigned int row_ind = 0; row_ind < data.size(); row_ind++)
> ++      for(unsigned int row_ind = 0; row_ind < ::data.size(); row_ind++)
> +       {
> +         arr[row_ind].val = 0.0;
> +-        if(data[row_ind].size() <= column_ind
> +-         || sscanf(data[row_ind][column_ind], "%lf", &arr[row_ind].val) == 0)
> ++        if(::data[row_ind].size() <= column_ind
> ++         || sscanf(::data[row_ind][column_ind], "%lf", &arr[row_ind].val) == 0)
> +           arr[row_ind].val = 0.0;
> +         if(vals[column_ind] == eLatency && arr[row_ind].val != 0.0)
> +         {
> +-          if(strstr(data[row_ind][column_ind], "ms"))
> ++          if(strstr(::data[row_ind][column_ind], "ms"))
> +             arr[row_ind].val *= 1000.0;
> +-          else if(!strstr(data[row_ind][column_ind], "us"))
> ++          else if(!strstr(::data[row_ind][column_ind], "us"))
> +             arr[row_ind].val *= 1000000.0; // is !us && !ms then secs!
> +         }
> +         arr[row_ind].pos = row_ind;
> +       }
> +-      qsort(arr, data.size(), sizeof(ITEM), compar);
> ++      qsort(arr, ::data.size(), sizeof(ITEM), compar);
> +       int col_count = -1;
> +       double min_col = -1.0, max_col = -1.0;
> +-      for(unsigned int sort_ind = 0; sort_ind < data.size(); sort_ind++)
> ++      for(unsigned int sort_ind = 0; sort_ind < ::data.size(); sort_ind++)
> +       {
> +         // if item is different from previous or if the first row
> +         // (sort_ind == 0) then increment col count
> +@@ -310,7 +310,7 @@ void calc_vals()
> +           min_col /= mult;
> +         }
> +         double range_col = max_col - min_col;
> +-        for(unsigned int sort_ind = 0; sort_ind < data.size(); sort_ind++)
> ++        for(unsigned int sort_ind = 0; sort_ind < ::data.size(); sort_ind++)
> +         {
> +           if(arr[sort_ind].col_ind > -1)
> +           {
> +@@ -332,7 +332,7 @@ void calc_vals()
> +       }
> +       else
> +       {
> +-        for(unsigned int sort_ind = 0; sort_ind < data.size(); sort_ind++)
> ++        for(unsigned int sort_ind = 0; sort_ind < ::data.size(); sort_ind++)
> +         {
> +           if(vals[column_ind] == eLatency)
> +           {
> +@@ -481,16 +481,16 @@ void read_in(CPCCHAR buf)
> +     free((void *)arr[0]);
> +     return;
> +   }
> +-  data.push_back(arr);
> ++  ::data.push_back(arr);
> + }
> + 
> + void print_item(int num, int item, CPCCHAR extra)
> + {
> +   PCCHAR line_data;
> +   char buf[1024];
> +-  if(int(data[num].size()) > item)
> ++  if(int(::data[num].size()) > item)
> +   {
> +-    line_data = data[num][item];
> ++    line_data = ::data[num][item];
> +     switch(item)
> +     {
> +     case COL_PUT_BLOCK:
> diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb b/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb
> new file mode 100644
> index 0000000000..f31fd09fc4
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_2.00a.bb
> @@ -0,0 +1,33 @@
> +SUMMARY = "Tests large file IO and creation/deletion of small files"
> +HOMEPAGE = "https://doc.coker.com.au/projects/bonnie/"
> +SECTION = "benchmark/tests"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://copyright.txt;md5=cd4dde95a6b9d122f0a9150ae9cc3ee0"
> +
> +SRC_URI = "http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
> +    file://fix-configure-lfs.patch \
> +    file://fix-csv2html-data.patch \
> +"
> +SRC_URI[md5sum] = "3a16b3a91b1d38b6f5561e197f81d870"
> +SRC_URI[sha256sum] = "a8d33bbd81bc7eb559ce5bf6e584b9b53faea39ccfb4ae92e58f27257e468f0e"
> +
> +SCRIPTS = "bon_csv2html bon_csv2txt"
> +EXES = "bonnie++ zcav"
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +# force lfs to skip configure's check, because we are cross-building
> +EXTRA_OECONF:append="--enable-lfs"
> +
> +do_install () {
> +    install -d ${D}/${bindir}
> +    install -d ${D}/${sbindir}
> +    install -m 0755 ${EXES} ${D}/${sbindir}
> +    install -m 0755 ${SCRIPTS} ${D}/${bindir}
> +}
> +
> +PACKAGES =+ "bonnie-scripts"
> +
> +FILES:${PN} = "${sbindir}"
> +FILES:bonnie-scripts = "${bindir}"
> +
> +RDEPENDS:bonnie-scripts += "perl"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183411): https://lists.openembedded.org/g/openembedded-core/message/183411
> Mute This Topic: https://lists.openembedded.org/mt/99785933/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

