Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.5456.1587240652144551058
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 13:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aEutuKDL;
 spf=pass (domain: konsulko.com, ip: 209.85.221.65, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f65.google.com with SMTP id d17so7115702wrg.11
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 13:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=3z9yakyevygOcKQc/2Id/BsDG9i5r/lxfwev0wW2c94=;
        b=aEutuKDL9d4ajJtdseTREE/vFQggZvxTBwYZFw6pZHPDRxhMJosnS2Ayt475mVNnve
         RprdY3c3ML0WpOjWnn6X8QjfZKWaI6FKz67lg36DKy6x7AVQROuVcP+/bWEgCY7LFHPF
         YqwuaXuytbxFVVsEwiJPhO9BIUNDD+QjBOZp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=3z9yakyevygOcKQc/2Id/BsDG9i5r/lxfwev0wW2c94=;
        b=nEFJT2jcnLiD8o2+p5TrmiddF1XN3ztxAFC0f6caXvAucMOzmVWzdRWFc/LOlsyeRm
         Potsim2sujro7lYGuHK+JgAQeV/a90nv70wY1gYa8n0hP/F0uFJwhr7QdUGcn1l0sHT0
         0pK7Y0UY6qWQqDmyQ4LcU/1j6H7gIxlLfaFhowGjNgOWkFUtwGQT1NzjpBfpZnJUU+S6
         MgQ7/ggkQnRotMmhcSiXTtd99Be/5GebkFbz4S74VbVwFjJwp97RWZtc8mv+4FBykQI6
         wZNe8YI2zguT8fp86ppyLjKBgGrWx26hMIiKLhXXOFnCPQVf90pPywCydbWMexvIYFk+
         4BKA==
X-Gm-Message-State: AGi0PuaArcpUvCV+qGdgRD8t/uWZwytITG2ZURc4tpseI0nMZVyNgjj6
	BvhEXIrgNmJChHHlx7S/o7FWQA==
X-Google-Smtp-Source: APiQypLApsXrZVp6eYemHixOlsmFtHUxEE533V/47nvDpYyWJm9GoWfT6zEJFT1iVJcwT2CtOvQnQw==
X-Received: by 2002:adf:f282:: with SMTP id k2mr10022498wro.133.1587240650778;
        Sat, 18 Apr 2020 13:10:50 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id a20sm15297773wra.26.2020.04.18.13.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 13:10:50 -0700 (PDT)
Date: Sat, 18 Apr 2020 21:10:46 +0100
From: "Paul Barker" <pbarker@konsulko.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6 10/10] oeqa: wic: Add more tests for include_path
Message-ID: <20200418211046.01deeb05@ub1910>
In-Reply-To: <20200414133614.1830058-11-ricardo@ribalda.com>
References: <20200414133614.1830058-1-ricardo@ribalda.com>
	<20200414133614.1830058-11-ricardo@ribalda.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Apr 2020 15:36:14 +0200
Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:

> Make sure permissions are respected.
> 
> Add new test for orig/destination option.
> 
> Cc: Paul Barker <pbarker@konsulko.com>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>  meta/lib/oeqa/selftest/cases/wic.py | 64 ++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> index 8ef08c3d77..1036269b64 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -486,15 +486,77 @@ part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
>              res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part1))
>              files = extract_files(res.output)
>              self.assertNotIn('test-file', files)
> +            self.assertEqual(True, files_own_by_root(res.output))
>  
> -            # Test partition 2, should not contain 'test-file'
> +            # Test partition 2, should contain 'test-file'
>              res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part2))
>              files = extract_files(res.output)
>              self.assertIn('test-file', files)
> +            self.assertEqual(True, files_own_by_root(res.output))
>  
>          finally:
>              os.environ['PATH'] = oldpath
>  
> +    def test_include_path_embeded(self):
> +        """Test --include-path wks option."""
> +
> +        oldpath = os.environ['PATH']
> +        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
> +
> +        try:
> +            include_path = os.path.join(self.resultdir, 'test-include')
> +            os.makedirs(include_path)
> +            with open(os.path.join(include_path, 'test-file'), 'w') as t:
> +                t.write("test\n")
> +            wks_file = os.path.join(include_path, 'temp.wks')
> +            with open(wks_file, 'w') as wks:
> +                rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
> +                wks.write("""
> +part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-image-minimal-mtdutils export/"""
> +                          % (include_path))
> +            runCmd("wic create %s -e core-image-minimal -o %s" \
> +                                       % (wks_file, self.resultdir))
> +
> +            part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
> +
> +            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part1))
> +            files = extract_files(res.output)
> +            self.assertIn('test-file', files)
> +            self.assertEqual(True, files_own_by_root(res.output))
> +
> +            res = runCmd("debugfs -R 'ls -p /export/etc/' %s 2>/dev/null" % (part1))
> +            files = extract_files(res.output)
> +            self.assertIn('shadow', files)

This fails if `shadow` isn't part of the image:

2020-04-18 21:00:01,411 - oe-selftest - INFO - test_include_path_embeded (wic.Wic)
2020-04-18 21:00:14,102 - oe-selftest - INFO -  ... FAIL
2020-04-18 21:00:14,103 - oe-selftest - INFO - Traceback (most recent call last):
  File "/home/pbarker/Projects/Yocto/poky/meta/lib/oeqa/selftest/cases/wic.py", line 529, in test_include_path_embeded
    self.assertIn('shadow', files)
AssertionError: 'shadow' not found in [...]

> +            self.assertEqual(True, files_own_by_root(res.output))
> +
> +        finally:
> +            os.environ['PATH'] = oldpath
> +
> +    def test_include_path_errors(self):
> +        """Test --include-path wks option error handling."""
> +        wks_file = 'temp.wks'
> +
> +        # Absolute argument.
> +        with open(wks_file, 'w') as wks:
> +            wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils /export")
> +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
> +                                      % (wks_file, self.resultdir), ignore_status=True).status)
> +        os.remove(wks_file)
> +
> +        # Argument pointing to parent directory.
> +        with open(wks_file, 'w') as wks:
> +            wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils ././..")
> +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
> +                                      % (wks_file, self.resultdir), ignore_status=True).status)
> +        os.remove(wks_file)
> +
> +        # 3 Argument pointing to parent directory.
> +        with open(wks_file, 'w') as wks:
> +            wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils export/ dummy")
> +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
> +                                      % (wks_file, self.resultdir), ignore_status=True).status)
> +        os.remove(wks_file)
> +
>      def test_exclude_path_errors(self):
>          """Test --exclude-path wks option error handling."""
>          wks_file = 'temp.wks'



-- 
Paul Barker
Konsulko Group
