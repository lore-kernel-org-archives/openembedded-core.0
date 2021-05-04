Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.9027.1620147674556532992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 10:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=x2VRWLvM;
 spf=pass (domain: burtonini.com, ip: 209.85.128.53, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f53.google.com with SMTP id 4-20020a05600c26c4b0290146e1feccd8so1812832wmv.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 May 2021 10:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YSC37s1y1ejX9C5XUXLmJS38fir6guNd1zrQJNBceOs=;
        b=x2VRWLvMT7LP63aTNLknZoopg07gr8ZMvKSBem2CNaagV33BPztKRxTwDYn/LA8LxK
         C2N4Mpz8ANtDbn4T24+uBfJi7bmU3vDISprYKzb/G73ToW5YNlPvkbsPjfgdZpyALuHm
         ZWvKhxTVBaVFbWPHRJKS3EO3zQ3LBAduYkMlH+ikUPqGtlP8Ph3d4yx7sQCQVgrVo5mQ
         GzDKNuJK+ChJ0CsMGvfNP1VgjQPsEya2b2Jf6rI/2kcD+U7/+VYK+0mjRnFj9AWynCRN
         mUISsMygKYilJdLfnLgS6roiQmtKe24bg6X2bnEQ5VQaF3FAWOJViGupTyymzleAAoTS
         iAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YSC37s1y1ejX9C5XUXLmJS38fir6guNd1zrQJNBceOs=;
        b=Id4V+irmmkQCf60K26bgGT2Xkq/8OXFWDNXlRsJfnWicMAEKp1P2N9GLSCyJtOm6lP
         9GE5Qi1vNHChWKa7RXrYcAgC42fO8qpJlXao5djJlxjVn/bAUVSP3N/UQARgT5geIpFU
         VC3gI9p2uyiXuUxPM1tGoFwtZ3B/s8JET3iZvE/enQZ2+Lx18ev9ZCnaiMQ5fCTwRJH1
         KpGvL4SyfQBqGFTME3CoprdJ1q2DfhBa+7yy+Vd4lQHap46mKSQum8L/7UuZAi6sogvb
         /+uhN0KHErZCXKQCWwi5m5YiQh4Gl6CjrJBi0ZdlryErS1fet0//TZzHlA8KW5PfeTeJ
         OxOg==
X-Gm-Message-State: AOAM533OUOEB7SBiaZ5cYO80fpuX1giAk26D6ud0R0CzzOuWLFme8hFh
	sJly/gzVEqxf4mr5cpi2FIImYIBPHzdaHqzyth2USQ==
X-Google-Smtp-Source: ABdhPJwMgDYsdsinVfN8Ujxq8grwuAprgGpzrXubbU141/lDzGuDaDs+w69jgE79kMMPveEAloFuDdymcWnh4ae1QcY=
X-Received: by 2002:a1c:c385:: with SMTP id t127mr22118623wmf.169.1620147672998;
 Tue, 04 May 2021 10:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210423180254.706537-1-alex.kanavin@gmail.com> <20210423180254.706537-4-alex.kanavin@gmail.com>
In-Reply-To: <20210423180254.706537-4-alex.kanavin@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 4 May 2021 18:01:02 +0100
Message-ID: <CAAnfSTsz5L60dtRGqCAam_1DCV3Lhb40GZ+8HMvEGC8RitwgKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/7] oeqa/selftest: transition to weston images
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

First, I love to see this. :)

However, using this as a convenient starting point: if both nodistro
and Poky have OpenGL enabled then there's no test cases for the non-GL
configuration anymore, which is important for headless systems, of
which there are many.  Whilst I agree that graphical systems that
don't support modern rendering in some way are on the way out, this
trend isn't across all of our target platforms.

Can you add a configuration to the autobuilder along the like of
poky-altconfig that does at least one build without GL?
core-image-base as a *minimum* but a core-image-sato should continue
to work.

Ross

On Fri, 23 Apr 2021 at 19:03, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> For readonly rootfs tests core-image-weston
> is appended; everywhere else it replaces core-image-sato.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py |  4 ++--
>  meta/lib/oeqa/selftest/cases/buildoptions.py        |  4 ++--
>  meta/lib/oeqa/selftest/cases/imagefeatures.py       |  6 +++---
>  meta/lib/oeqa/selftest/cases/runtime_test.py        |  2 --
>  meta/lib/oeqa/selftest/cases/sstatetests.py         | 10 +++++-----
>  5 files changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
> index f7c356ad09..7ac03f0cec 100644
> --- a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
> +++ b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
> @@ -90,7 +90,7 @@ class RebuildFromSState(SStateBase):
>          self.assertFalse(failed_cleansstate, msg="The following recipes have failed cleansstate(all others have passed both cleansstate and rebuild from sstate tests): %s" % ' '.join(map(str, failed_cleansstate)))
>
>      def test_sstate_relocation(self):
> -        self.run_test_sstate_rebuild(['core-image-sato-sdk'], relocate=True, rebuild_dependencies=True)
> +        self.run_test_sstate_rebuild(['core-image-weston-sdk'], relocate=True, rebuild_dependencies=True)
>
>      def test_sstate_rebuild(self):
> -        self.run_test_sstate_rebuild(['core-image-sato-sdk'], relocate=False, rebuild_dependencies=True)
> +        self.run_test_sstate_rebuild(['core-image-weston-sdk'], relocate=False, rebuild_dependencies=True)
> diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
> index 1859d3222a..754b77defd 100644
> --- a/meta/lib/oeqa/selftest/cases/buildoptions.py
> +++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
> @@ -50,9 +50,9 @@ class ImageOptionsTests(OESelftestTestCase):
>      def test_read_only_image(self):
>          distro_features = get_bb_var('DISTRO_FEATURES')
>          if not ('x11' in distro_features and 'opengl' in distro_features):
> -            self.skipTest('core-image-sato requires x11 and opengl in distro features')
> +            self.skipTest('core-image-sato/weston requires x11 and opengl in distro features')
>          self.write_config('IMAGE_FEATURES += "read-only-rootfs"')
> -        bitbake("core-image-sato")
> +        bitbake("core-image-sato core-image-weston")
>          # do_image will fail if there are any pending postinsts
>
>  class DiskMonTest(OESelftestTestCase):
> diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
> index 6723a8198f..5d4330b48f 100644
> --- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
> +++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
> @@ -240,8 +240,8 @@ USERADD_GID_TABLES += "files/static-group"
>
>      def test_no_busybox_base_utils(self):
>          config = """
> -# Enable x11
> -DISTRO_FEATURES_append += "x11"
> +# Enable wayland
> +DISTRO_FEATURES_append += "pam opengl wayland"
>
>  # Switch to systemd
>  DISTRO_FEATURES += "systemd"
> @@ -262,7 +262,7 @@ PNBLACKLIST[busybox] = "Don't build this"
>  """
>          self.write_config(config)
>
> -        bitbake("--graphviz core-image-sato")
> +        bitbake("--graphviz core-image-weston")
>
>      def test_image_gen_debugfs(self):
>          """
> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
> index b20c5b427b..84c2cb77e8 100644
> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> @@ -128,7 +128,6 @@ class TestImage(OESelftestTestCase):
>          features += 'TEST_SUITES = "ping ssh selftest"\n'
>          self.write_config(features)
>
> -        # Build core-image-sato and testimage
>          bitbake('core-image-full-cmdline socat')
>          bitbake('-c testimage core-image-full-cmdline')
>
> @@ -164,7 +163,6 @@ class TestImage(OESelftestTestCase):
>          features += 'PSEUDO_IGNORE_PATHS .= ",%s"\n' % self.gpg_home
>          self.write_config(features)
>
> -        # Build core-image-sato and testimage
>          bitbake('core-image-full-cmdline socat')
>          bitbake('-c testimage core-image-full-cmdline')
>
> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
> index c46e8ba489..9db2a0bb44 100644
> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> @@ -261,7 +261,7 @@ PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
>  BB_SIGNATURE_HANDLER = "OEBasicHash"
>  """)
>          self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
> -        bitbake("core-image-sato -S none")
> +        bitbake("core-image-weston -S none")
>          self.write_config("""
>  MACHINE = "qemux86"
>  TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
> @@ -273,12 +273,12 @@ PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
>  BB_SIGNATURE_HANDLER = "OEBasicHash"
>  """)
>          self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
> -        bitbake("core-image-sato -S none")
> +        bitbake("core-image-weston -S none")
>
>          def get_files(d):
>              f = []
>              for root, dirs, files in os.walk(d):
> -                if "core-image-sato" in root:
> +                if "core-image-weston" in root:
>                      # SDKMACHINE changing will change
>                      # do_rootfs/do_testimage/do_build stamps of images which
>                      # is safe to ignore.
> @@ -306,7 +306,7 @@ NATIVELSBSTRING = \"DistroA\"
>  BB_SIGNATURE_HANDLER = "OEBasicHash"
>  """)
>          self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
> -        bitbake("core-image-sato -S none")
> +        bitbake("core-image-weston -S none")
>          self.write_config("""
>  TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
>  TCLIBCAPPEND = \"\"
> @@ -314,7 +314,7 @@ NATIVELSBSTRING = \"DistroB\"
>  BB_SIGNATURE_HANDLER = "OEBasicHash"
>  """)
>          self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
> -        bitbake("core-image-sato -S none")
> +        bitbake("core-image-weston -S none")
>
>          def get_files(d):
>              f = []
> --
> 2.30.2
>
>
> 
>
