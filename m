Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB842CF256F
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 16:26:20 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.14003.1728750371644653225
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Oct 2024 09:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CyUlnPpb;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539983beb19so3396594e87.3
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 09:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728750370; x=1729355170; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wocaRRlQc5Y01bWiZGrXZ/Vy47P5BSpdJYzxaOIpwRg=;
        b=CyUlnPpbYlrm/L2toms869t+DIcs1h1cUdAhlqqYwggtiFKRNYCjmzOck2oZeJ4Hx8
         2+gg/kpFqe4C50ep7XCLUoSydnk/CLG3GbTBRu/qSaGA7tm1vMW6sBUFIp76mi48pcHg
         pQMTi5X4MTJ6Z/S1hly+0B/kTQV+fCRaF57/E+NntIWN09MhtWvAf5Evuwm1Cug4Cwjy
         ePwsjbaar1nD40GC5AnGmaos4O6LktT1r40FPnQMtwBT8nWye+Z3AgwpA75wMndc+Aoj
         KLc5kNPittkS28I8JcahtHMTSB2FbikIGOhVtIKjAtAFs1Jt8HBhd+FQ+MSzd+e4vkwQ
         E+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728750370; x=1729355170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wocaRRlQc5Y01bWiZGrXZ/Vy47P5BSpdJYzxaOIpwRg=;
        b=BpkyvhvKt2YL9J+LDzkL+NeIMIEwROdanGP7a/gGUhKgc5ko3TokyL6oTYCd6lo5fc
         Npdd8KlF0L63da7y19v7Sf+kEEFGkkBSqVlmWZkROK/hr/Pdwku/hBKstRKK4zA+Bf78
         hIHO21C92AY3h5Em0AJZmdl/dC/xZgery+FIThPE2S6vdJ6IiGB0ndTs0Gs0q9bRXFV6
         drUscrgAjczJhcvCwf0BhiUD54SgSU4d5VXfa8HSzCYJ2pkP/+j3quSwvLlFZhLHwlLZ
         1FKQUkBaIkoRkxbv7WNNiQzQSoACzpMQJ2yob0v0vHoicslzafrcTgxfM9EjMZ919et5
         vqdw==
X-Gm-Message-State: AOJu0Yxw6hNyrBWTfvqPR77VSGVxkB7dD8dFTdljEAPwxjR5YqaBNpVs
	OW7gs3ke67+vstRyJZWxXj0PVuadqBgE5JS30BYrCpFRp3G/E3IqdQmIaAoGg0V1oKWT64iee1g
	wBYHLbim+KDqEwqCoU7dOfDLoHJA=
X-Google-Smtp-Source: AGHT+IGH6/wfOtFZ3Sp/qHHGrIX7x3R0FXp8rdXMkM5hJ4R9e8Sj8/WWCSJCBXK7BdO+d/6wCtIwxcQewL87zfpUYS0=
X-Received: by 2002:a05:6512:1290:b0:539:a4ef:675a with SMTP id
 2adb3069b0e04-539da4f62d2mr2849026e87.34.1728750369251; Sat, 12 Oct 2024
 09:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241010160623.2880937-1-ross.burton@arm.com> <20241010160623.2880937-10-ross.burton@arm.com>
In-Reply-To: <20241010160623.2880937-10-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 12 Oct 2024 18:25:57 +0200
Message-ID: <CANNYZj8387GLS8gUL8Y+ZSbS4mNNBW99SauLXvxC=Te2DRQ28g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 10/11] insane: use oe.cachedpath.CachedPath
 instead of os.path
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 16:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205708

After this merged, seemingly random package_qa errors started
appearing, check sub-fails here:
https://valkyrie.yoctoproject.org/#/builders/29/builds/257

File: '/srv/pokybuild/yocto-worker/musl-qemux86/build/meta/classes-global/insane.bbclass',
lineno: 439, function: package_qa_check_buildpaths
     0435:    """
     0436:    import stat
     0437:    global cpath
     0438:    # Ignore symlinks/devs/fifos
 *** 0439:    mode = cpath.lstat(path).st_mode
     0440:    if stat.S_ISLNK(mode) or stat.S_ISBLK(mode) or
stat.S_ISFIFO(mode) or stat.S_ISCHR(mode) or stat.S_ISSOCK(mode):
     0441:        return
     0442:
     0443:    tmpdir = bytes(d.getVar('TMPDIR'), encoding="utf-8")
Exception: AttributeError: 'bool' object has no attribute 'st_mode'

Alex

On Thu, 10 Oct 2024 at 18:06, Ross Burton via lists.openembedded.org
<ross.burton=arm.com@lists.openembedded.org> wrote:
>
> The insane QAPATHTESTs make many os.stat() calls, the majority of which
> are redundant with caching as the initial sweep does a stat() on every
> entry to determine if it is a file or a directory, and from then on each
> test that does further stat()s is redundant as the tree doesn't change.
>
> Switch os.stat() and friends (os.path.isfile(), etc) to use a common
> oe.cachedpath.CachedPath() instance that is shared between all of the
> functions, meaning only one stat is done.
>
> In my test case of ltp:do_package_qa, this reduces the time taken from
> 44s to 37s.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes-global/insane.bbclass | 42 ++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> index bec349e97cc..2d69bdec8d3 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -82,7 +82,9 @@ def package_qa_clean_path(path, d, pkg=None):
>
>  QAPATHTEST[shebang-size] = "package_qa_check_shebang_size"
>  def package_qa_check_shebang_size(path, name, d, elf):
> -    if elf or os.path.islink(path) or not os.path.isfile(path):
> +    global cpath
> +
> +    if elf or cpath.islink(path) or not cpath.isfile(path):
>          return
>
>      try:
> @@ -167,8 +169,8 @@ def package_qa_check_dev(path, name, d, elf):
>      """
>      Check for ".so" library symlinks in non-dev packages
>      """
> -
> -    if not name.endswith("-dev") and not name.endswith("-dbg") and not name.endswith("-ptest") and not name.startswith("nativesdk-") and path.endswith(".so") and os.path.islink(path):
> +    global cpath
> +    if not name.endswith("-dev") and not name.endswith("-dbg") and not name.endswith("-ptest") and not name.startswith("nativesdk-") and path.endswith(".so") and cpath.islink(path):
>          oe.qa.handle_error("dev-so", "non -dev/-dbg/nativesdk- package %s contains symlink .so '%s'" % \
>                   (name, package_qa_clean_path(path, d, name)), d)
>
> @@ -179,7 +181,8 @@ def package_qa_check_dev_elf(path, name, d, elf):
>      check that the file is not a link and is an ELF object as some recipes
>      install link-time .so files that are linker scripts.
>      """
> -    if name.endswith("-dev") and path.endswith(".so") and not os.path.islink(path) and elf:
> +    global cpath
> +    if name.endswith("-dev") and path.endswith(".so") and not cpath.islink(path) and elf:
>          oe.qa.handle_error("dev-elf", "-dev package %s contains non-symlink .so '%s'" % \
>                   (name, package_qa_clean_path(path, d, name)), d)
>
> @@ -422,9 +425,9 @@ def package_qa_check_buildpaths(path, name, d, elf):
>      explicitly ignored.
>      """
>      import stat
> -
> +    global cpath
>      # Ignore symlinks/devs/fifos
> -    mode = os.lstat(path).st_mode
> +    mode = cpath.lstat(path).st_mode
>      if stat.S_ISLNK(mode) or stat.S_ISBLK(mode) or stat.S_ISFIFO(mode) or stat.S_ISCHR(mode) or stat.S_ISSOCK(mode):
>          return
>
> @@ -469,7 +472,8 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf):
>      """
>      Check that the package doesn't contain any absolute symlinks to the sysroot.
>      """
> -    if os.path.islink(path):
> +    global cpath
> +    if cpath.islink(path):
>          target = os.readlink(path)
>          if os.path.isabs(target):
>              tmpdir = d.getVar('TMPDIR')
> @@ -760,14 +764,19 @@ def qa_check_staged(path,d):
>                          oe.qa.handle_error("pkgconfig", error_msg, d)
>
>              if not skip_shebang_size:
> +                global cpath
> +                cpath = oe.cachedpath.CachedPath()
>                  package_qa_check_shebang_size(path, "", d, None)
> +                cpath = None
>
>  # Walk over all files in a directory and call func
>  def package_qa_walk(checkfuncs, package, d):
> +    global cpath
> +
>      elves = {}
>      for path in pkgfiles[package]:
>              elf = None
> -            if os.path.isfile(path) and not os.path.islink(path):
> +            if cpath.isfile(path) and not cpath.islink(path):
>                  elf = oe.qa.ELFFile(path)
>                  try:
>                      elf.open()
> @@ -915,11 +924,12 @@ def package_qa_check_deps(pkg, pkgdest, d):
>
>  QAPKGTEST[usrmerge] = "package_qa_check_usrmerge"
>  def package_qa_check_usrmerge(pkg, d):
> +    global cpath
>      pkgdest = d.getVar('PKGDEST')
>      pkg_dir = pkgdest + os.sep + pkg + os.sep
>      merged_dirs = ['bin', 'sbin', 'lib'] + d.getVar('MULTILIB_VARIANTS').split()
>      for f in merged_dirs:
> -        if os.path.exists(pkg_dir + f) and not os.path.islink(pkg_dir + f):
> +        if cpath.exists(pkg_dir + f) and not cpath.islink(pkg_dir + f):
>              msg = "%s package is not obeying usrmerge distro feature. /%s should be relocated to /usr." % (pkg, f)
>              oe.qa.handle_error("usrmerge", msg, d)
>              return
> @@ -985,10 +995,11 @@ def package_qa_check_empty_dirs(pkg, d):
>      empty.
>      """
>
> +    global cpath
>      pkgd = oe.path.join(d.getVar('PKGDEST'), pkg)
>      for dir in (d.getVar('QA_EMPTY_DIRS') or "").split():
>          empty_dir = oe.path.join(pkgd, dir)
> -        if os.path.exists(empty_dir) and os.listdir(empty_dir):
> +        if cpath.exists(empty_dir) and os.listdir(empty_dir):
>              recommendation = (d.getVar('QA_EMPTY_DIRS_RECOMMENDATION:' + dir) or
>                                "but it is expected to be empty")
>              msg = "%s installs files in %s, %s" % (pkg, dir, recommendation)
> @@ -1018,8 +1029,9 @@ HOST_USER_GID := "${@os.getgid()}"
>  QAPATHTEST[host-user-contaminated] = "package_qa_check_host_user"
>  def package_qa_check_host_user(path, name, d, elf):
>      """Check for paths outside of /home which are owned by the user running bitbake."""
> +    global cpath
>
> -    if not os.path.lexists(path):
> +    if not cpath.lexists(path):
>          return
>
>      dest = d.getVar('PKGDEST')
> @@ -1029,7 +1041,7 @@ def package_qa_check_host_user(path, name, d, elf):
>          return
>
>      try:
> -        stat = os.lstat(path)
> +        stat = cpath.lstat(path)
>      except OSError as exc:
>          import errno
>          if exc.errno != errno.ENOENT:
> @@ -1105,13 +1117,14 @@ python do_package_qa () {
>      if not packages:
>          return
>
> -    global pkgfiles
> +    global pkgfiles, cpath
>      pkgfiles = {}
> +    cpath = oe.cachedpath.CachedPath()
>      pkgdest = d.getVar('PKGDEST')
>      for pkg in packages:
>          pkgdir = os.path.join(pkgdest, pkg)
>          pkgfiles[pkg] = []
> -        for walkroot, dirs, files in os.walk(pkgdir):
> +        for walkroot, dirs, files in cpath.walk(pkgdir):
>              # Don't walk into top-level CONTROL or DEBIAN directories as these
>              # are temporary directories created by do_package.
>              if walkroot == pkgdir:
> @@ -1159,6 +1172,7 @@ python do_package_qa () {
>
>      package_qa_check_libdir(d)
>
> +    cpath = None
>      oe.qa.exit_if_errors(d)
>  }
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205419): https://lists.openembedded.org/g/openembedded-core/message/205419
> Mute This Topic: https://lists.openembedded.org/mt/108932135/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

