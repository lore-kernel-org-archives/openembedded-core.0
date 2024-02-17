Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711D1C48260
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 02:59:45 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.3281.1708138781766278271
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 18:59:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fHgEYlgW;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-59fb0b5b47eso176920eaf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 18:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708138781; x=1708743581; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXYkLWIEBbQ/mEEnksFagxWdtyje7Wp80UJxJbxU+Gk=;
        b=fHgEYlgWxgPLybeSW6HJPOCs9Pl5/iLoXSfFuL5wbFKLfDUb2TzNujVy217Ic1JOxo
         uHWQx67L6OKY8tbg2vwI1W26J3GdQrI1KPdFdPgaPtIOnb1VnQFl0iXxEevzKOUnV7qR
         z8dQuELj98OfsgHi6JA56Rxz6OLI5dUIHG2J3yxmYyA9NrS7/3YbdrePCtUhBcxswYX0
         rkVS8ylvScINaDAUQpSPxNftMMu6kCUyzaSCqorZKa9ztbTMBBLEWeHwNUj7QGaXVTCM
         4oayVz3EZE9D1unp+xjdKWYQhcNxW64qqbBmskidGQxGTe/aZiqz2M7ORfuw0w+A9JKB
         d3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708138781; x=1708743581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fXYkLWIEBbQ/mEEnksFagxWdtyje7Wp80UJxJbxU+Gk=;
        b=Af2sDko3tprCcpr+D6Tk58u0ylqQlh72ECvTOfDkBClEg8IQoFtQdDFXiwLQkaHVjN
         TlIkZlXlSYeBRyj8Z25SZC0YNI6IG5uwXfbGz0fkF6bU3rYC5x2WIyvITg7SuC5TKjar
         7+Py33cMEDOmrfae/Wzynd4SczeSK7F1a6aQh0RLD6fbmo9+jmOOa1aGj3i1CuVbf58E
         Jf6e66qe4lwjWzyuRPPGgstStQX3esgThqM+V0/dI8qyu0u3szU/DnV++NSb0rrfSkRN
         5agElcODB2DeiQQco4eMLKjnbjNW6gK/tDfRzqDX4N5Zn4u/mBBtmpGlbodl8Ha7t1T5
         WO8g==
X-Forwarded-Encrypted: i=1; AJvYcCX5zwKDnFbCGdPq9Fzq8ExbQ0v16xqExoPPr65NjttXw/5ArF94mVojq1wwccIcDlOIixrvNZzbfgcZXU3BFLkEAfbFPphpTQeeB4UGLmrsSm48STKhfcPh
X-Gm-Message-State: AOJu0YzoA864O+AxxFEa1vC4LnRslhT7nLQFSuGrxDldPQRNL3Fe6CQo
	/FIxm2Qi0m7bqXM5nHGU06FSMNkNCI095Cz7/whttss9zaUOqZ0D
X-Google-Smtp-Source: AGHT+IEU5P5+NmxcESrvWGWtJvu0tJEbvBvUwIpnZh2GRUw+OsEA+eR51n0mlc7cZSNu59KAGPh7Rw==
X-Received: by 2002:a05:6358:5f13:b0:176:520c:c6a with SMTP id y19-20020a0563585f1300b00176520c0c6amr7564670rwn.9.1708138780851;
        Fri, 16 Feb 2024 18:59:40 -0800 (PST)
Received: from ?IPV6:2601:646:9d80:4380:4858:1eb3:c11a:9a45? ([2601:646:9d80:4380:4858:1eb3:c11a:9a45])
        by smtp.gmail.com with ESMTPSA id z2-20020a634c02000000b005dc816b2369sm621306pga.28.2024.02.16.18.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 18:59:40 -0800 (PST)
Message-ID: <33de869a-1a09-41c9-be4b-6de1d0c29417@gmail.com>
Date: Fri, 16 Feb 2024 18:59:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 7/9] swig: upgrade 4.1.1 -> 4.2.0
To: Anuj Mittal <anuj.mittal@intel.com>,
 openembedded-core@lists.openembedded.org
References: <20240216114034.109257-1-anuj.mittal@intel.com>
 <20240216114034.109257-7-anuj.mittal@intel.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20240216114034.109257-7-anuj.mittal@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 02:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195811

this can be tricky for many apps depend on it subtly might fail. Perhaps 
doing an extended world build with this might be good.

On 2/16/24 3:40 AM, Anuj Mittal wrote:
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>   ...self-exe-for-swig-swiglib-on-non-Win32-plat.patch | 10 ++++++----
>   ...configure-use-pkg-config-for-pcre-detection.patch |  6 +++---
>   meta/recipes-devtools/swig/swig/determinism.patch    | 12 +++++++++++-
>   .../swig/{swig_4.1.1.bb => swig_4.2.0.bb}            |  2 +-
>   4 files changed, 21 insertions(+), 9 deletions(-)
>   rename meta/recipes-devtools/swig/{swig_4.1.1.bb => swig_4.2.0.bb} (72%)
>
> diff --git a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
> index f27f80ea184..9c6ae389be2 100644
> --- a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
> +++ b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
> @@ -1,4 +1,4 @@
> -From a4a0440a644c6c5e5da096efe3cf05ba309a284f Mon Sep 17 00:00:00 2001
> +From ab0ab5e685bd9077c44fdca5c1a27b0f477444d7 Mon Sep 17 00:00:00 2001
>   From: "NODA, Kai" <nodakai@gmail.com>
>   Date: Sun, 22 Apr 2012 17:01:02 +0900
>   Subject: [PATCH] Use /proc/self/exe for "swig -swiglib" on non-Win32
> @@ -10,9 +10,11 @@ Upstream-Status: Submitted
>   http://sourceforge.net/mailarchive/message.php?msg_id=29179733
>   
>   ---
> - Source/Modules/main.cxx |   24 ++++++++++++++++++++++--
> + Source/Modules/main.cxx | 24 ++++++++++++++++++++++--
>    1 file changed, 22 insertions(+), 2 deletions(-)
>   
> +diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
> +index 8a44921..8250dee 100644
>   --- a/Source/Modules/main.cxx
>   +++ b/Source/Modules/main.cxx
>   @@ -25,6 +25,11 @@
> @@ -27,7 +29,7 @@ http://sourceforge.net/mailarchive/message.php?msg_id=29179733
>    
>    // Global variables
>    
> -@@ -934,9 +939,9 @@ int SWIG_main(int argc, char *argv[], co
> +@@ -886,9 +891,9 @@ int SWIG_main(int argc, char *argv[], const TargetLanguageModule *tlm) {
>    
>      // Check for SWIG_LIB environment variable
>      if ((c = getenv("SWIG_LIB")) == (char *) 0) {
> @@ -38,7 +40,7 @@ http://sourceforge.net/mailarchive/message.php?msg_id=29179733
>        if (!(GetModuleFileName(0, buf, MAX_PATH) == 0 || (p = strrchr(buf, '\\')) == 0)) {
>          *(p + 1) = '\0';
>          SwigLib = NewStringf("%sLib", buf); // Native windows installation path
> -@@ -946,7 +951,22 @@ int SWIG_main(int argc, char *argv[], co
> +@@ -898,7 +903,22 @@ int SWIG_main(int argc, char *argv[], const TargetLanguageModule *tlm) {
>        if (Len(SWIG_LIB_WIN_UNIX) > 0)
>          SwigLibWinUnix = NewString(SWIG_LIB_WIN_UNIX); // Unix installation path using a drive letter (for msys/mingw)
>    #else
> diff --git a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
> index cfcbd8c73ae..9e16caecca1 100644
> --- a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
> +++ b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
> @@ -1,4 +1,4 @@
> -From ffb785ed8d3cac3c28e014b1238d93e2bc1f0c01 Mon Sep 17 00:00:00 2001
> +From 57a15651b46a0f1f84a4dd15d67d104fbfbe3f6e Mon Sep 17 00:00:00 2001
>   From: Koen Kooi <koen.kooi@linaro.org>
>   Date: Tue, 17 Jun 2014 08:18:17 +0200
>   Subject: [PATCH] configure: use pkg-config for pcre detection
> @@ -11,10 +11,10 @@ Upstream-Status: Pending
>    1 file changed, 7 insertions(+), 32 deletions(-)
>   
>   diff --git a/configure.ac b/configure.ac
> -index f88004a..3a2b47c 100644
> +index c060028..a330266 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -57,39 +57,14 @@ AC_MSG_RESULT([$with_pcre])
> +@@ -49,39 +49,14 @@ AC_MSG_RESULT([$with_pcre])
>    
>    dnl To make configuring easier, check for a locally built PCRE using the Tools/pcre-build.sh script
>    if test x"${with_pcre}" = xyes ; then
> diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/recipes-devtools/swig/swig/determinism.patch
> index 84c399182a4..417f0c43178 100644
> --- a/meta/recipes-devtools/swig/swig/determinism.patch
> +++ b/meta/recipes-devtools/swig/swig/determinism.patch
> @@ -1,13 +1,23 @@
> +From 25bf9893ec1f557781eb241508ea1bec959061fe Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Mon, 1 Mar 2021 00:11:10 +0000
> +Subject: [PATCH] swig: Fix reproducibility issue
> +
>   Remove the compiler commandline/platform from the compiled binary as this
>   breaks reproducibilty.
>   
>   Upstream-Status: Inappropriate [OE reproducibiity fix upstream unlikely to take]
>   RP 2021/3/1
>   
> +---
> + Source/Modules/main.cxx | 1 -
> + 1 file changed, 1 deletion(-)
>   
> +diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
> +index 8250dee..415761d 100644
>   --- a/Source/Modules/main.cxx
>   +++ b/Source/Modules/main.cxx
> -@@ -642,7 +642,6 @@ static void getoptions(int argc, char *a
> +@@ -629,7 +629,6 @@ static void getoptions(int argc, char *argv[]) {
>    	}
>          } else if (strcmp(argv[i], "-version") == 0) {
>    	fprintf(stdout, "\nSWIG Version %s\n", Swig_package_version());
> diff --git a/meta/recipes-devtools/swig/swig_4.1.1.bb b/meta/recipes-devtools/swig/swig_4.2.0.bb
> similarity index 72%
> rename from meta/recipes-devtools/swig/swig_4.1.1.bb
> rename to meta/recipes-devtools/swig/swig_4.2.0.bb
> index b9e01752993..2ab4ed006c6 100644
> --- a/meta/recipes-devtools/swig/swig_4.1.1.bb
> +++ b/meta/recipes-devtools/swig/swig_4.2.0.bb
> @@ -4,4 +4,4 @@ SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.pat
>               file://0001-configure-use-pkg-config-for-pcre-detection.patch \
>               file://determinism.patch \
>              "
> -SRC_URI[sha256sum] = "2af08aced8fcd65cdb5cc62426768914bedc735b1c250325203716f78e39ac9b"
> +SRC_URI[sha256sum] = "261ca2d7589e260762817b912c075831572b72ff2717942f75b3e51244829c97"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195754): https://lists.openembedded.org/g/openembedded-core/message/195754
> Mute This Topic: https://lists.openembedded.org/mt/104390933/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

