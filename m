Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.5559.1587241011302582933
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 13:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.208.194, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f194.google.com with SMTP id e25so5716858ljg.5
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 13:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1svDKAvTYJfIuZvUk5Uti/C38GblnvW3hzAvGa7GQC8=;
        b=jQFaiYS4tQSI9l9ZGlr6CAQLQHDX2kzmb3s90OaT0LghXL4XqIDFNrS+ChYcd8GvBs
         mrmyoJVoVNDKWrD/Fx9lmPrKKXD0lm4P9oiFCBmPIzK0OVf25QJzB3xOVU3g1NZEbLMd
         dWzBT2HAa61Ay+8eoKTOHSFYHVtwU20Bs71rbUcUGNH6BR5oWIGXjixS6G4Pejf8QvsE
         6CUUklskjX1xIG/zAgiJ1972udtiIBN5wb40/Ssfg72sbvruITEN9iWil8hkjhFFRDrc
         4FjiwQBHGlANtTf8+45pSbecRA0YsVFX2U3i8c/+0/+wsjXyhFYdoJmQ7Paly4HanVRJ
         Ts4w==
X-Gm-Message-State: AGi0Pub5ufXXLxvGCUBwyomqF2WZFjy7YbTEJ+XcT1KoKbVCMUtY8P2h
	kWX2v2Lqg23FsXRSdKwPxY7voHmmWwG7TzE+MQw=
X-Google-Smtp-Source: APiQypICE4IVcRyJ9/HAjqxYYjd9x1pa1HfqB4lJEMD/bwwdgmGYcpHSvf14TdRrXo4uVMcACRcwkkMAddnHaqQ1Oaw=
X-Received: by 2002:a2e:9256:: with SMTP id v22mr5455958ljg.286.1587241009387;
 Sat, 18 Apr 2020 13:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200414133614.1830058-1-ricardo@ribalda.com> <20200414133614.1830058-11-ricardo@ribalda.com>
 <20200418211046.01deeb05@ub1910>
In-Reply-To: <20200418211046.01deeb05@ub1910>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Sat, 18 Apr 2020 22:16:33 +0200
Message-ID: <CAPybu_1XmMLGQtJkeWDPU2RmnETfCmWOv7vEfy7NW3tLLLz3WA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6 10/10] oeqa: wic: Add more tests for include_path
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

 Hi Paul



On Sat, Apr 18, 2020 at 10:10 PM Paul Barker <pbarker@konsulko.com> wrote:
>
> On Tue, 14 Apr 2020 15:36:14 +0200
> Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
>
> > Make sure permissions are respected.
> >
> > Add new test for orig/destination option.
> >
> > Cc: Paul Barker <pbarker@konsulko.com>
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/wic.py | 64 ++++++++++++++++++++++++++++-
> >  1 file changed, 63 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> > index 8ef08c3d77..1036269b64 100644
> > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > @@ -486,15 +486,77 @@ part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
> >              res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part1))
> >              files = extract_files(res.output)
> >              self.assertNotIn('test-file', files)
> > +            self.assertEqual(True, files_own_by_root(res.output))
> >
> > -            # Test partition 2, should not contain 'test-file'
> > +            # Test partition 2, should contain 'test-file'
> >              res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part2))
> >              files = extract_files(res.output)
> >              self.assertIn('test-file', files)
> > +            self.assertEqual(True, files_own_by_root(res.output))
> >
> >          finally:
> >              os.environ['PATH'] = oldpath
> >
> > +    def test_include_path_embeded(self):
> > +        """Test --include-path wks option."""
> > +
> > +        oldpath = os.environ['PATH']
> > +        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
> > +
> > +        try:
> > +            include_path = os.path.join(self.resultdir, 'test-include')
> > +            os.makedirs(include_path)
> > +            with open(os.path.join(include_path, 'test-file'), 'w') as t:
> > +                t.write("test\n")
> > +            wks_file = os.path.join(include_path, 'temp.wks')
> > +            with open(wks_file, 'w') as wks:
> > +                rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
> > +                wks.write("""
> > +part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-image-minimal-mtdutils export/"""
> > +                          % (include_path))
> > +            runCmd("wic create %s -e core-image-minimal -o %s" \
> > +                                       % (wks_file, self.resultdir))
> > +
> > +            part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
> > +
> > +            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part1))
> > +            files = extract_files(res.output)
> > +            self.assertIn('test-file', files)
> > +            self.assertEqual(True, files_own_by_root(res.output))
> > +
> > +            res = runCmd("debugfs -R 'ls -p /export/etc/' %s 2>/dev/null" % (part1))
> > +            files = extract_files(res.output)
> > +            self.assertIn('shadow', files)
>
> This fails if `shadow` isn't part of the image:
>
> 2020-04-18 21:00:01,411 - oe-selftest - INFO - test_include_path_embeded (wic.Wic)
> 2020-04-18 21:00:14,102 - oe-selftest - INFO -  ... FAIL
> 2020-04-18 21:00:14,103 - oe-selftest - INFO - Traceback (most recent call last):
>   File "/home/pbarker/Projects/Yocto/poky/meta/lib/oeqa/selftest/cases/wic.py", line 529, in test_include_path_embeded
>     self.assertIn('shadow', files)
> AssertionError: 'shadow' not found in [...]

I though I could assume that /etc/shadow was always part of
core-image-minimal and core-image-minimal-mtdutil. Shall I simply
change it to /etc/passwd?
How did you managed to trigger the error?

Thanks

>
> > +            self.assertEqual(True, files_own_by_root(res.output))
> > +
> > +        finally:
> > +            os.environ['PATH'] = oldpath
> > +
> > +    def test_include_path_errors(self):
> > +        """Test --include-path wks option error handling."""
> > +        wks_file = 'temp.wks'
> > +
> > +        # Absolute argument.
> > +        with open(wks_file, 'w') as wks:
> > +            wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils /export")
> > +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
> > +                                      % (wks_file, self.resultdir), ignore_status=True).status)
> > +        os.remove(wks_file)
> > +
> > +        # Argument pointing to parent directory.
> > +        with open(wks_file, 'w') as wks:
> > +            wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils ././..")
> > +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
> > +                                      % (wks_file, self.resultdir), ignore_status=True).status)
> > +        os.remove(wks_file)
> > +
> > +        # 3 Argument pointing to parent directory.
> > +        with open(wks_file, 'w') as wks:
> > +            wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils export/ dummy")
> > +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
> > +                                      % (wks_file, self.resultdir), ignore_status=True).status)
> > +        os.remove(wks_file)
> > +
> >      def test_exclude_path_errors(self):
> >          """Test --exclude-path wks option error handling."""
> >          wks_file = 'temp.wks'
>
>
>
> --
> Paul Barker
> Konsulko Group
> 



-- 
Ricardo Ribalda
