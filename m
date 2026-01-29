Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D0CD358F2
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 09:58:06 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11721.1769680679582182308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 01:57:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M+VuSBng;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5014b7de222so9094651cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 01:57:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769680678; cv=none;
        d=google.com; s=arc-20240605;
        b=XHjKPJIGKzO6NyO3Zz8eHok2cFHjJcZhXixPJWm5FhhZ4EH2ViJgA+5/TcfBhaT7SI
         XK4KzvllTB7QSdVXDDLNHLtpc/8kuu4/xZ6ljSfjGh23R2VUJwrgOLWMnICJS7olqU3X
         cMvIQ8V6TL49paOGZs0ZCAE6amUORwuobxV1MK0q1un1rEhpBE/y8rkJ2sWgkm0EFpNP
         FSwErPhKkpUa+oByvtL9tFcvrofl1wcky/lE1OR75AB3l0H3bmW54aIBIlyikloZ3uyq
         flIaX+qssunQTOYiPzrREcFdDSSlQXoz8pL4iQrt+lZNLz8mrUxc0rfs1Abrk/cnPXoK
         35eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VywBhHQe/uATiuqt2Purj3b0mr5jT/T8wve2a0zNm/0=;
        fh=85FywoQ4TyE09dpZ07ihji6RE1UFygBEWt/2b8ei3sM=;
        b=XCtXqMcq8QBcH+IJ1lO4U8cd0qYvGe8wku3TwNT+MhIxA0GN5npR+14omV9cTE7OFA
         GIDVI6mOqnMN8ndAapTpr0sgpBtd/MlV6sM4ZwySZYNwxBgfYKz9x2GEyDcVHvA5mDS9
         BEmO0smZDxYawvgwwzQDQHuzqsqD4742APexXLlKMuiInnlpuXFUl5Xm9L3EKjcIurLB
         g2Wtr6FdDcQKq/vDNgcyva+VK2nR92UREVglIpRMcAWGuWQCsBBj6UeZPZLDd2/kL+hY
         wWaZJjpImwMky1KmMDFsbtdRJJGfVPE8FfLerf0TDA99g0Vx9mgnq3ICHiOKkOp6StIS
         dpgw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769680678; x=1770285478; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VywBhHQe/uATiuqt2Purj3b0mr5jT/T8wve2a0zNm/0=;
        b=M+VuSBngWdOVrhTWPbEzXeArrIhTxTFgaIoe4MnMmON08CLt6qWmZCi4zq1xv5FBBT
         +U1VInfOHcr0FmNhQqoWlEW25MS7RxhM8F+cmQTnQV0/1ibaHQ7WDCVwr94qs73sX2WB
         Tbho+tI89LK2g35LtnAx3i8BVinR0uz2RUokHCY7hiTg6mD5gjNqrNyq2Rc06HPDxa44
         4TDKx5HKJu+KgQj/gaMfk0IHzm26r9q+p6V0TSBwmTvDzmXXj3d550p2Y7IVq2Ohh/cr
         xS0JGk2bKLNBhEfoRWhoNH6VZ8k3exE4P5gp7LSa3bDeKb3jA8V2KtFQuWEOIBo/CJdZ
         ib3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769680678; x=1770285478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VywBhHQe/uATiuqt2Purj3b0mr5jT/T8wve2a0zNm/0=;
        b=u+bOLjmyYV8IgZSJpsuqVny+zVRJvab9gbU7ja4wBmc1qWSWDONa+jAarZUPwii5Yi
         PTC9Wluv09WBEi6T1p/4iTfx3nHhymyc54hdh8prVzPoeap2diGigdwIyp/w39lvfoHL
         tMS3n2uFSjm4GM6nLzoye2hRzrrEfUqoYXsMu0QDWFjwAVtwZEb84kB0Tny4Mi/buNOE
         01j1Vi2rRSD0YRm8gCnqDrP9KS6Mn/2Wv8X466fBkyXOzsoQT+B/ayNYjNyaeiuKSc9V
         fNVj6YpWQuyLiexYswoy28yBb92Y+Zck3LduJ5ijrIXbLrmjVGVknJrNCk706tWnls6C
         PR0w==
X-Gm-Message-State: AOJu0YxJ4ejCPhvTofC+Rhh1d5UFI8AgYSxvQiBWOYz8RikYtJB5W6q7
	ZXc+vHElu+CJoyGVPimJgi3GXBxzQXJBPRP+EFZdBaBEGX02EawM53HqT3CTq/c7f4w9R+KQQ7m
	JSblQc7iMGwlqZJhlr1nPVYFzUiDhPyw=
X-Gm-Gg: AZuq6aI+EckUImIYXXKP+2kxcbwtRtZ7MdHDcgQCgbo2KyGUd6TosihZxpKpUk2bQlW
	KhrY39FNBI2QyfY4zKJgYbD5pqcKyGPx/AkrDQtpAe9Gutk004Q31SHvLZ07vIocZWgGM0fYzV4
	im8Cg0n0S+m5Eq6S3x5ZFfae0a/Y41Rr61YdOZcHkGQUer42LBzVoawjxEONeKNiADLb/hIb5fR
	PceTK0Tcb+1gQNxqjfqyIXGP28k0LSINSbeKeKQU+zOMg8w2WCvSZ7JxEMZLePIcgVdzLfftMpF
	TmJ8WnZNgV1tn6gwRyCCeOx6cW0GJw==
X-Received: by 2002:ac8:5ac4:0:b0:502:a1d7:7d52 with SMTP id
 d75a77b69052e-5032f76d753mr109927121cf.4.1769680678359; Thu, 29 Jan 2026
 01:57:58 -0800 (PST)
MIME-Version: 1.0
References: <20260129030811.104017-1-Qi.Chen@windriver.com>
In-Reply-To: <20260129030811.104017-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 29 Jan 2026 10:57:47 +0100
X-Gm-Features: AZwV_QjH60PqPZzPQlWTYLhsLqLRfsBd8BPpn88mNdycSvFSlZpxmGvs2sqHPqA
Message-ID: <CANNYZj89FNRQXGM6MQUDKhZnTt9in3=i7rgNkh1BnkThUnEtyg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] runqemu: restore support to run without bitbake
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 09:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230127

Apologies, but you can't just hastily undo these because something
broke in your setup. We've made these fixes to solve other problems
and improve usability, so if there's a use case that needs to be
supported, you need to show steps to perform that use case, what you
expect to happen, what actually happens, and whether we need to
introduce tests that ensure this use case works. Then we can work
towards a fix that does not re-introduce the same old problems.

Alex

On Thu, 29 Jan 2026 at 04:08, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> This patch is basically a revert of the following three patches:
> - 0c10a78796 scripts/runqemu: raise an error when bitbake was not found
> - b931f74442 scripts/runqemu: remove the code block that works around the missing bitbake environment
> - 8197be4dd3 runqemu: ensure that bitbake environment is either returned, or an exception is raised
>
> The comment is also changed to reflect the current usage:
> "invoked from a running bitbake instance" ->
> "invoked from environment with no bitbake (e.g., SDK)"
>
> This code path was deleted by accident based on the reason that nobody
> is using it. But in fact, running runqemu from SDK needs this code path.
> Such case has been supported for years.
>
> A little more history on this code path:
> In 2016/09/09, this code path was introduced[1]. It was introduced
> originally to handle running bitbake inside bitbake situation.
> In 2026/09/19, running runqemu from SDK is supported using this code
> path[2]. This means that this code path was then needed by one more case: SDK.
>
> Supporting running nativesdk-qemu from SDK easily via our script dates back to
> more than 18 years ago, as shown by 'git blame' on the nativesdk-qemu-helper recipe[3].
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=1e8165ea2f19aecdc03ccd102ee44ef0544f0f39
> [2] https://git.openembedded.org/openembedded-core/commit/?id=93649edc034f2540ff55dc9b41638797209cfb9c
> [3] https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  scripts/runqemu | 47 ++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 36 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 32a3d6296a..7e3d11f653 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1007,12 +1007,34 @@ to your build configuration.
>              if not self.bitbake_e:
>                  self.load_bitbake_env()
>
> -            native_vars = ['STAGING_DIR_NATIVE']
> -            for nv in native_vars:
> -                s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
> -                if s and s.group(1) != self.get(nv):
> -                    logger.info('Overriding conf file setting of %s to %s from Bitbake environment' % (nv, s.group(1)))
> -                    self.set(nv, s.group(1))
> +            if self.bitbake_e:
> +                native_vars = ['STAGING_DIR_NATIVE']
> +                for nv in native_vars:
> +                    s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
> +                    if s and s.group(1) != self.get(nv):
> +                        logger.info('Overriding conf file setting of %s to %s from Bitbake environment' % (nv, s.group(1)))
> +                        self.set(nv, s.group(1))
> +            else:
> +                # when we're invoked from environment with no bitbake (e.g., SDK),
> +                # we won't be able to call `bitbake -e`, then try:
> +                # - get OE_TMPDIR from environment and guess paths based on it
> +                # - get OECORE_NATIVE_SYSROOT from environment (for sdk)
> +                tmpdir = self.get('OE_TMPDIR')
> +                oecore_native_sysroot = self.get('OECORE_NATIVE_SYSROOT')
> +                if tmpdir:
> +                    logger.info('Setting STAGING_DIR_NATIVE and STAGING_BINDIR_NATIVE relative to OE_TMPDIR (%s)' % tmpdir)
> +                    hostos, _, _, _, machine = os.uname()
> +                    buildsys = '%s-%s' % (machine, hostos.lower())
> +                    staging_dir_native = '%s/sysroots/%s' % (tmpdir, buildsys)
> +                    self.set('STAGING_DIR_NATIVE', staging_dir_native)
> +                elif oecore_native_sysroot:
> +                    logger.info('Setting STAGING_DIR_NATIVE to OECORE_NATIVE_SYSROOT (%s)' % oecore_native_sysroot)
> +                    self.set('STAGING_DIR_NATIVE', oecore_native_sysroot)
> +                if self.get('STAGING_DIR_NATIVE'):
> +                    # we have to assume that STAGING_BINDIR_NATIVE is at usr/bin
> +                    staging_bindir_native = '%s/usr/bin' % self.get('STAGING_DIR_NATIVE')
> +                    logger.info('Setting STAGING_BINDIR_NATIVE to %s' % staging_bindir_native)
> +                    self.set('STAGING_BINDIR_NATIVE', '%s/usr/bin' % self.get('STAGING_DIR_NATIVE'))
>
>      def print_config(self):
>          logoutput = ['Continuing with the following parameters:']
> @@ -1691,6 +1713,9 @@ to your build configuration.
>          self.cleaned = True
>
>      def run_bitbake_env(self, mach=None, target=''):
> +        bitbake = shutil.which('bitbake')
> +        if not bitbake:
> +            return
>
>          if not mach:
>              mach = self.get('MACHINE')
> @@ -1707,10 +1732,6 @@ to your build configuration.
>          else:
>              cmd = 'bitbake -e %s %s' % (multiconfig, target)
>
> -        bitbake = shutil.which('bitbake')
> -        if not bitbake:
> -            raise OEPathError("Bitbake is needed to run '%s', but it is not found in PATH. Please source the bitbake build environment." % cmd.strip())
> -
>          logger.info('Running %s...' % cmd)
>          try:
>              return subprocess.check_output(cmd, shell=True).decode('utf-8')
> @@ -1722,7 +1743,11 @@ to your build configuration.
>                  cmd = 'MACHINE=%s bitbake -e %s %s' % (mach, multiconfig, target)
>              else:
>                  cmd = 'bitbake -e %s %s' % (multiconfig, target)
> -            return subprocess.check_output(cmd, shell=True).decode('utf-8')
> +            try:
> +                return subprocess.check_output(cmd, shell=True).decode('utf-8')
> +            except subprocess.CalledProcessError as err:
> +                logger.warning("Couldn't run '%s' to gather environment information, giving up with 'bitbake -e':\n%s" % (cmd, err.output.decode('utf-8')))
> +                return ''
>
>
>      def load_bitbake_env(self, mach=None, target=None):
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230110): https://lists.openembedded.org/g/openembedded-core/message/230110
> Mute This Topic: https://lists.openembedded.org/mt/117521005/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

