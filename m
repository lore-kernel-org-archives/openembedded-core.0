Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.1996.1602175406628475810
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 09:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MSxn9tkJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id q63so7712218qkf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vWn6T9BPlkUW8/Gn2blYo+9sJ07KbjK5u+R1BBMdFC8=;
        b=MSxn9tkJ+jUYe5WQJEER5TvpuhExLfHe4bnZ9MN9RHmxRVGlMSMf26LsddtrtxZSMu
         20LSQmSdOXBNat2MmP7IgIjivfGxEpx4UCDo+K4Wr9TEGAZKxsEnFy1/rPAutzgwdRn1
         o40SmjIkk1f2V9uzhiHdfrIU9O4/OfugXO+XtSDHe/k/mZMfgTksGl4Hp3iOtqmeA+g3
         ybrg3jDGOcC2RKgwQ11G2ENk9oNkfgoUDYsbBq+wC8tdvOkIc8Ztv5PrKUgSqLjbtF5A
         v1e5TMQC38+kETw55nlt3cuOmJpJfmTW98FbYGK77fIAVTfKo1ZR/Z4NKQSdV+WT7HY1
         As4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vWn6T9BPlkUW8/Gn2blYo+9sJ07KbjK5u+R1BBMdFC8=;
        b=GeVtfv9STzly99XfBosyeY7F5ScRcKn5GENLSoOnGi1G/YPK2Kz8BzhhKObvnpF+hg
         G5c4+qktisCt/cqxk4WwMrG+ZGc9bht2SjlSRjQ3KxAh8vQv2egfJzlHB1+k9aMx4/OS
         J4YKREXZEPXSFfyETVkqkYJeiy9jQpv2ZetkfAtjHT9PaeCs1ZgSEfdh7n0aAOlL3I+E
         nDa2IrO4p7Gzjk0dCLfteHHY578SErV9jC0dBPjHkfT7e/Y3Pkun3/lW/cTL5il0XjvP
         k7tYC1x/8YvZ/kSCm3rJ40RkKo05+AX0OP/qIj9OJgNtND8TlCCf4hVSkHIYwy95baUh
         GrNQ==
X-Gm-Message-State: AOAM533U4czh2whi6B0wFiwv7lDAnyp7ME+zFVUTPzyNDF9t6MGTO+Kf
	mexHyeqWJS5eCh/gLCOgm85Ru4Znugk8eU/GlVs=
X-Google-Smtp-Source: ABdhPJyKox5Rjh6xp+lhs6cQgObhT4ATlrKRTznY/0Ld5DNLYiCwRTA/KsHvFieQbBM4Kzj+Dt+wfUadDECV1RuSwnM=
X-Received: by 2002:a05:620a:c07:: with SMTP id l7mr9528680qki.9.1602175405561;
 Thu, 08 Oct 2020 09:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201008103852.803147-1-yann@blade-group.com>
In-Reply-To: <20201008103852.803147-1-yann@blade-group.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 8 Oct 2020 09:42:59 -0700
Message-ID: <CAMKF1so-Aztsdp0z542+ZXk3yN7XZo2ginr5DsRyfaMk-CoGNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] llvm: fix llvm-config to work again with multilib
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"

I do not like the llvm version to the x.y.z accuracy being hardcoded
in code, this is going to be error prone whenever we update recipe. I
wonder if we can replace it with LLVM_VERSION_STRING

On Thu, Oct 8, 2020 at 3:39 AM Yann Dirson <yann.dirson@blade-group.com> wrote:
>
> From: Yann Dirson <yann@blade-group.com>
>
> Newer llvm versions have changed the logic for finding libraries,
> which prevents Mesa from building with PACKAGECONFIG[gallium-llvm]:
>
> The problem is visible in mesa/do_configure with this in local.conf:
>
>     PACKAGECONFIG_append_pn-mesa += " gallium-llvm"
>     require conf/multilib.conf
>     MULTILIBS = "multilib:lib32"
>     DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>
> See https://bugzilla.yoctoproject.org/show_bug.cgi?id=13937
>
> This patch comes from meta-amd#dunfell for llvm-9.0.1, adapted for llvm-10.0.1.
>
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  ...-llvm-allow-env-override-of-exe-path.patch | 87 +++++++++++++++++--
>  1 file changed, 78 insertions(+), 9 deletions(-)
>
> I'm dubious about the [OE-Specific] tag in patch metadata, although it
> sure would not be acceptable upstream as-is :)
>
> diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
> index b01b8647c9..98d85eab5d 100644
> --- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
> +++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
> @@ -1,27 +1,30 @@
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -From 61b00e1e051e367f5483d7b5253b6c85a9e8a90f Mon Sep 17 00:00:00 2001
> +From 0570fe02c07244a8724c1e6c0437f893c8aa8e93 Mon Sep 17 00:00:00 2001
>  From: Martin Kelly <mkelly@xevo.com>
>  Date: Fri, 19 May 2017 00:22:57 -0700
> -Subject: [PATCH] llvm: allow env override of exe path
> +Subject: [PATCH 2/2] llvm: allow env override of exe path
>
>  When using a native llvm-config from inside a sysroot, we need llvm-config to
>  return the libraries, include directories, etc. from inside the sysroot rather
>  than from the native sysroot. Thus provide an env override for calling
>  llvm-config from a target sysroot.
>
> +To let it work in multilib environment, we need to provide a knob to supply
> +multilib dirname as well
> +
> +Upstream-Status: Inappropriate [OE-Specific]
> +
>  Signed-off-by: Martin Kelly <mkelly@xevo.com>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Arsalan H. Awan <Arsalan_Awan@mentor.com>
>  ---
> - llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
> - 1 file changed, 7 insertions(+)
> + llvm/tools/llvm-config/llvm-config.cpp | 35 ++++++++++++++++++++++---------
> + 1 file changed, 25 insertions(+), 10 deletions(-)
>
>  diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
> -index 7ef7c46a262..a4f7ed82c7b 100644
> +index bec89fef98c..91b4d6e4c43 100644
>  --- a/llvm/tools/llvm-config/llvm-config.cpp
>  +++ b/llvm/tools/llvm-config/llvm-config.cpp
> -@@ -225,6 +225,13 @@ Typical components:\n\
> +@@ -226,6 +226,13 @@ Typical components:\n\
>
>   /// Compute the path to the main executable.
>   std::string GetExecutablePath(const char *Argv0) {
> @@ -35,3 +38,69 @@ index 7ef7c46a262..a4f7ed82c7b 100644
>     // This just needs to be some symbol in the binary; C++ doesn't
>     // allow taking the address of ::main however.
>     void *P = (void *)(intptr_t)GetExecutablePath;
> +@@ -306,7 +313,7 @@ int main(int argc, char **argv) {
> +   // bin dir).
> +   sys::fs::make_absolute(CurrentPath);
> +   CurrentExecPrefix =
> +-      sys::path::parent_path(sys::path::parent_path(CurrentPath)).str();
> ++      sys::path::parent_path(sys::path::parent_path(sys::path::parent_path(CurrentPath))).str();
> +
> +   // Check to see if we are inside a development tree by comparing to possible
> +   // locations (prefix style or CMake style).
> +@@ -329,40 +336,47 @@ int main(int argc, char **argv) {
> +   std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir, ActiveLibDir,
> +               ActiveCMakeDir;
> +   std::string ActiveIncludeOption;
> ++  // Hack for Yocto: we need to override the multilib path when we are using
> ++  // llvm-config from within a target sysroot.
> ++  std::string Multilibdir = std::getenv("YOCTO_ALTERNATE_MULTILIB_NAME");
> ++  if (Multilibdir.empty()) {
> ++    Multilibdir = "/lib/llvm10.0.1" LLVM_LIBDIR_SUFFIX;
> ++  }
> ++
> +   if (IsInDevelopmentTree) {
> +-    ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include";
> ++    ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include/llvm10.0.1";
> +     ActivePrefix = CurrentExecPrefix;
> +
> +     // CMake organizes the products differently than a normal prefix style
> +     // layout.
> +     switch (DevelopmentTreeLayout) {
> +     case CMakeStyle:
> +-      ActiveBinDir = ActiveObjRoot + "/bin";
> +-      ActiveLibDir = ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX;
> ++      ActiveBinDir = ActiveObjRoot + "/bin/llvm10.0.1";
> ++      ActiveLibDir = ActiveObjRoot + "/lib/llvm10.0.1" + LLVM_LIBDIR_SUFFIX;
> +       ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
> +       break;
> +     case CMakeBuildModeStyle:
> +       // FIXME: Should we consider the build-mode-specific path as the prefix?
> +       ActivePrefix = ActiveObjRoot;
> +-      ActiveBinDir = ActiveObjRoot + "/" + build_mode + "/bin";
> ++      ActiveBinDir = ActiveObjRoot + "/" + build_mode + "/bin/llvm10.0.1";
> +       ActiveLibDir =
> +-          ActiveObjRoot + "/" + build_mode + "/lib" + LLVM_LIBDIR_SUFFIX;
> ++          ActiveObjRoot + "/" + build_mode + "/lib/llvm10.0.1" + LLVM_LIBDIR_SUFFIX;
> +       // The CMake directory isn't separated by build mode.
> +       ActiveCMakeDir =
> +-          ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX + "/cmake/llvm";
> ++          ActivePrefix + "/lib/llvm10.0.1" + LLVM_LIBDIR_SUFFIX + "/cmake/llvm";
> +       break;
> +     }
> +
> +     // We need to include files from both the source and object trees.
> +     ActiveIncludeOption =
> +-        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/include");
> ++        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/include/llvm10.0.1");
> +   } else {
> +     ActivePrefix = CurrentExecPrefix;
> +-    ActiveIncludeDir = ActivePrefix + "/include";
> ++    ActiveIncludeDir = ActivePrefix + "/include/llvm10.0.1";
> +     SmallString<256> path(StringRef(LLVM_TOOLS_INSTALL_DIR));
> +     sys::fs::make_absolute(ActivePrefix, path);
> +     ActiveBinDir = path.str();
> +-    ActiveLibDir = ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
> ++    ActiveLibDir = ActivePrefix + Multilibdir;
> +     ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
> +     ActiveIncludeOption = "-I" + ActiveIncludeDir;
> +   }
> --
> 2.28.0
>
>
> 
>
