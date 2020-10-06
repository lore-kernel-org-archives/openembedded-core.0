Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.829.1602000471879732735
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 09:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SPrZSAGw;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id c23so6333448qtp.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 09:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=550DHI7xhe0pqlkZCrqnPqFqD4YmxHnSDEQiowS4oXM=;
        b=SPrZSAGwx3wbbGyBqO9g50UB0Duk57qDbcOh8ncSxtevC83BJzSxSAV3VATuk6PX1u
         rGX0jSCBwc1Dupv4Oz0WIPU0v0gjoNc1zoY/EY7qZ89hPwYNELyWMd6AXWt0hXHk/xKZ
         d+LEpNv9M74Aon5m4/0NmtVrFK8Cr521dgXAxM0D1duAcmWZfS8VjgMCNP4ybuXTY/UV
         dMooQJO1hrRACPsCUkMdRvsBDhgDelnBpyMD2w98lCTqtdKi+NlFCuDM/KCfJm6awytH
         Bme66uVw5w/MHOlMH9yWGH6qMtLS8gtUSM2rAuR3So8YdKET9R1gNMVFgG+DCjErLq0Z
         Z4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=550DHI7xhe0pqlkZCrqnPqFqD4YmxHnSDEQiowS4oXM=;
        b=ACYyI6AdoJ+tjlfqj3Sxsmg1xI0/m4Cx6baG5NzZRwp5YtGRewWHyoNkTY4eUEW59h
         1LjwDUBvZKrmQ8clXxH6AYKXeUR1Z/Sa847A7p2e/OwqZg04GwwrhvZMZu+49H4BwxuZ
         dHRe/w6YJLEGTGDgHmx+kCOvzHQFZLr9Rbh5xVIIjwQANsW3YnYrvWTwY1KC6NCBBYTH
         3Z+UVe3fhQbkOz+fcu8Vp6T32cStbsQo2fdKIpt9/3ukir49BHg21JLIgH+UONRv3ML+
         INwAwKyLETtZMDOhYs3oHuAAxo1JJk9dzx9Ps6w6DAZN0rHDN8R1zyehQJj0P8xjc80f
         0QBg==
X-Gm-Message-State: AOAM531i8OFJkrfq59BnOxNqlEpsdCLx5TsDV9tOcLxe1lyKyqHh049b
	V+it0ZDm5m56wigVWgX4lxDFcWrlHP+8H08TTpw=
X-Google-Smtp-Source: ABdhPJzGpWWsB8INZdhbSsjHz2cq+OSx+bf9GTdt9gW+9ZjRUleBo/++g7au5dwvYI9KOGOi8a6kzdQEpNaGlQkx5yU=
X-Received: by 2002:aed:22d4:: with SMTP id q20mr5872042qtc.194.1602000470641;
 Tue, 06 Oct 2020 09:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201006104034.800021-1-yann@blade-group.com>
In-Reply-To: <20201006104034.800021-1-yann@blade-group.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 6 Oct 2020 09:07:24 -0700
Message-ID: <CAMKF1soZ3kKOaj0C8iOgjApCC6ijNwMSYJCXixxksK2hrEnNuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: fix llvm-config to work again with multilib
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"

in master we have llvm 10 but the patch seems to be accessing
llvm9.0.1 dir, that seems incorrect to me.

On Tue, Oct 6, 2020 at 3:41 AM Yann Dirson <yann.dirson@blade-group.com> wrote:
>
> From: Yann Dirson <yann@blade-group.com>
>
> Newer llvm versions have changed the logic for finding libraries,
> which prevents Mesa from building with PACKAGECONFIG[gallium-llvm]:
>
> See https://bugzilla.yoctoproject.org/show_bug.cgi?id=13937
>
> This patch comes from meta-amd, which exhibits one such situation.
>
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  ...-llvm-allow-env-override-of-exe-path.patch | 96 +++++++++++++++++--
>  1 file changed, 87 insertions(+), 9 deletions(-)
>
>
> Note that I took the updated patch from meta-amd without a change, and
> I'm dubious about the [OE-Specific] tag in patch metadata.
>
>
> diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
> index b01b8647c9..417eaf0aa1 100644
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
> @@ -35,3 +38,78 @@ index 7ef7c46a262..a4f7ed82c7b 100644
>     // This just needs to be some symbol in the binary; C++ doesn't
>     // allow taking the address of ::main however.
>     void *P = (void *)(intptr_t)GetExecutablePath;
> +@@ -284,7 +291,7 @@ int main(int argc, char **argv) {
> +   // bin dir).
> +   sys::fs::make_absolute(CurrentPath);
> +   CurrentExecPrefix =
> +-      sys::path::parent_path(sys::path::parent_path(CurrentPath)).str();
> ++      sys::path::parent_path(sys::path::parent_path(sys::path::parent_path(CurrentPath))).str();
> +
> +   // Check to see if we are inside a development tree by comparing to possible
> +   // locations (prefix style or CMake style).
> +@@ -293,7 +300,7 @@ int main(int argc, char **argv) {
> +     DevelopmentTreeLayout = CMakeStyle;
> +     ActiveObjRoot = LLVM_OBJ_ROOT;
> +   } else if (sys::fs::equivalent(CurrentExecPrefix,
> +-                                 Twine(LLVM_OBJ_ROOT) + "/bin")) {
> ++                                 Twine(LLVM_OBJ_ROOT) + "/bin/llvm9.0.1")) {
> +     IsInDevelopmentTree = true;
> +     DevelopmentTreeLayout = CMakeBuildModeStyle;
> +     ActiveObjRoot = LLVM_OBJ_ROOT;
> +@@ -307,37 +314,45 @@ int main(int argc, char **argv) {
> +   std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir, ActiveLibDir,
> +               ActiveCMakeDir;
> +   std::string ActiveIncludeOption;
> ++  // Hack for Yocto: we need to override the multilib path when we are using
> ++  // llvm-config from within a target sysroot.
> ++  std::string Multilibdir = std::getenv("YOCTO_ALTERNATE_MULTILIB_NAME");
> ++  if (Multilibdir.empty()) {
> ++    Multilibdir = "/lib/llvm9.0.1" LLVM_LIBDIR_SUFFIX;
> ++  }
> ++
> +   if (IsInDevelopmentTree) {
> +-    ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include";
> ++    ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include/llvm9.0.1";
> +     ActivePrefix = CurrentExecPrefix;
> +
> +     // CMake organizes the products differently than a normal prefix style
> +     // layout.
> ++
> +     switch (DevelopmentTreeLayout) {
> +     case CMakeStyle:
> +-      ActiveBinDir = ActiveObjRoot + "/bin";
> +-      ActiveLibDir = ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX;
> ++      ActiveBinDir = ActiveObjRoot + "/bin/llvm9.0.1";
> ++      ActiveLibDir = ActiveObjRoot + "/lib/llvm9.0.1" + LLVM_LIBDIR_SUFFIX;
> +       ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
> +       break;
> +     case CMakeBuildModeStyle:
> +       ActivePrefix = ActiveObjRoot;
> +-      ActiveBinDir = ActiveObjRoot + "/bin/" + build_mode;
> ++      ActiveBinDir = ActiveObjRoot + "/bin/llvm9.0.1/" + build_mode;
> +       ActiveLibDir =
> +-          ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX + "/" + build_mode;
> ++          ActiveObjRoot + "/lib/llvm9.0.1" + LLVM_LIBDIR_SUFFIX + "/" + build_mode;
> +       ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
> +       break;
> +     }
> +
> +     // We need to include files from both the source and object trees.
> +     ActiveIncludeOption =
> +-        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/include");
> ++        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/include/llvm9.0.1");
> +   } else {
> +     ActivePrefix = CurrentExecPrefix;
> +-    ActiveIncludeDir = ActivePrefix + "/include";
> ++    ActiveIncludeDir = ActivePrefix + "/include/llvm9.0.1";
> +     SmallString<256> path(StringRef(LLVM_TOOLS_INSTALL_DIR));
> +     sys::fs::make_absolute(ActivePrefix, path);
> +     ActiveBinDir = path.str();
> +-    ActiveLibDir = ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
> ++    ActiveLibDir = ActivePrefix + Multilibdir;
> +     ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
> +     ActiveIncludeOption = "-I" + ActiveIncludeDir;
> +   }
> +--
> +2.20.1
> +
> --
> 2.28.0
>
>
> 
>
