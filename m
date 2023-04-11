Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC16C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 07:14:20 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.7793.1681197254613331067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 00:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=Qqqo0nAU;
 spf=pass (domain: baylibre.com, ip: 209.85.128.45, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f45.google.com with SMTP id hg25-20020a05600c539900b003f05a99a841so11616970wmb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 00:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681197253; x=1683789253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9M3mIX/FMRwFFcwQKnIdln2EevaLFlurOGhzUBLkgbY=;
        b=Qqqo0nAU4q86bRJvgngOIUyMOf33ARrjmZIh8UTI+SeglA3BkegcsXwpTcrJN6ZtoF
         By08xbKBNRBD2r8cdNYMusI/naWEFEa3fxRASjIKGerLbEN+AeXKlL6qOYTPjP/PM3WZ
         tzsbAU55KVw51bR3nh2m1CpjMjgxh5yqwQXV7j4nYDQvgI7Nu+effoXecLVNpOpVbaxv
         8tGpcWTZmDQdn/mLpZ4mbpyiPrujTyxSSFe7VhS3ngCaV0irFe62qUyKWzqeFCc+jt7q
         0VgXqIX7+zaqSqc0YAuNnt/59tJVrxXOjImfLFr0JMUfZozQwaCN/mBCTi6SnkbmyOZG
         168Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681197253; x=1683789253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9M3mIX/FMRwFFcwQKnIdln2EevaLFlurOGhzUBLkgbY=;
        b=RENYeHay1NycDX89nf3ahOm4sWDi4ryd2fX3r4gTm3AcNO4Mi5KEPIPmLH/De0BvvC
         8k+KdWG04MdNVzhEfPb9ife2uKEwtbTyMlPjitlspHKw8DzvQMbR5oqkZ3wrgBoJ/XD5
         Gm7003GlEWQXd6u/tf348OJRLRzd7YiBwQpEn/9YncGF89UsJ3S8HEif/+SdUgcD+EkQ
         nJAo2vlNqusf2WudzvATBFHyqc2qhg7MrKiNTaWxoWYbp9/F2L9sxFJFwj9pjWv+/p4R
         DIXGGkkDo1UCM31opldoYhAgCMlqChDtXx8KUjJ1A/GTo5W4/y/WZmVHoknfmVGxaNcd
         voaQ==
X-Gm-Message-State: AAQBX9fr1XsPb0UL08py1ufd4EV9bpWS2nSqAFqMbij/X9+zoL+kDpyG
	BAXo9aGwOx/MOPX/iWmZ2lO2NA==
X-Google-Smtp-Source: AKy350Za/b4goLc8biVoREzorDXS0ilofXm9YPhUD6XXqR9rDhZYSvmocAx3pAuE4JlsuGZIWb73oQ==
X-Received: by 2002:a1c:f30d:0:b0:3ed:af6b:7faa with SMTP id q13-20020a1cf30d000000b003edaf6b7faamr6275959wmq.17.1681197251375;
        Tue, 11 Apr 2023 00:14:11 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id a2-20020a1cf002000000b003f049a42689sm16012769wmb.25.2023.04.11.00.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 00:14:10 -0700 (PDT)
Message-ID: <04aadad8-d96d-8e75-55ba-0260c5e1abfe@baylibre.com>
Date: Tue, 11 Apr 2023 09:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [OE-core] [PATCH v3 2/2] oeqa/selftest: change deprecated usage
 of run_serial
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, khilman@baylibre.com
References: <20230407142622.632035-1-lrannou@baylibre.com>
 <20230407142622.632035-3-lrannou@baylibre.com>
 <20230409093910134a3fb4@mail.local>
Content-Language: en-US
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <20230409093910134a3fb4@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 07:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179909

On 09/04/2023 11:39, Alexandre Belloni wrote:
> Hello,
> 
> This breaks the overlayfs tests:
> 
> https://autobuilder.yoctoproject.org/typhoon/#builders/87/builds/5075/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#builders/86/builds/5036/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#builders/80/builds/4994/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#builders/79/builds/5045/steps/15/logs/stdio
>
Hello,

Indeed, the overlayfs test was not supposed to remain in the commit

Louis

> On 07/04/2023 16:26:22+0200, Louis Rannou wrote:
>> Prefer the new function run_serial_socket. Change calls where the modification
>> is easy.
>>
>> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/debuginfod.py |  3 +-
>>   meta/lib/oeqa/selftest/cases/gdbserver.py  |  7 ++--
>>   meta/lib/oeqa/selftest/cases/locales.py    |  8 ++---
>>   meta/lib/oeqa/selftest/cases/overlayfs.py  | 42 ++++++++++++++--------
>>   meta/lib/oeqa/selftest/cases/package.py    |  7 ++--
>>   meta/lib/oeqa/selftest/cases/runqemu.py    |  2 +-
>>   6 files changed, 43 insertions(+), 26 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/debuginfod.py b/meta/lib/oeqa/selftest/cases/debuginfod.py
>> index 37f51760fb..2571ce6989 100644
>> --- a/meta/lib/oeqa/selftest/cases/debuginfod.py
>> +++ b/meta/lib/oeqa/selftest/cases/debuginfod.py
>> @@ -99,7 +99,8 @@ CORE_IMAGE_EXTRA_INSTALL += "elfutils"
>>                       % (qemu.server_ip, port)
>>                   )
>>                   self.logger.info(f"Starting client {cmd}")
>> -                status, output = qemu.run_serial(cmd)
>> +                status, output = qemu.run_serial_socket(cmd)
>> +                self.assertEqual(0, status)
>>                   # This should be more comprehensive
>>                   self.assertIn("/.cache/debuginfod_client/", output)
>>           finally:
>> diff --git a/meta/lib/oeqa/selftest/cases/gdbserver.py b/meta/lib/oeqa/selftest/cases/gdbserver.py
>> index 9da97ae780..4f8c7d620f 100644
>> --- a/meta/lib/oeqa/selftest/cases/gdbserver.py
>> +++ b/meta/lib/oeqa/selftest/cases/gdbserver.py
>> @@ -43,7 +43,8 @@ CORE_IMAGE_EXTRA_INSTALL = "gdbserver"
>>               shutil.unpack_archive(filename, debugfs)
>>   
>>               with runqemu("core-image-minimal", runqemuparams="nographic") as qemu:
>> -                status, output = qemu.run_serial("kmod --help")
>> +                status, output = qemu.run_serial_socket("kmod --help")
>> +                self.assertEqual(status, 0)
>>                   self.assertIn("modprobe", output)
>>   
>>                   with concurrent.futures.ThreadPoolExecutor(max_workers=1) as executor:
>> @@ -61,7 +62,7 @@ CORE_IMAGE_EXTRA_INSTALL = "gdbserver"
>>                               self.fail("Timed out connecting to gdb")
>>                       future = executor.submit(run_gdb)
>>   
>> -                    status, output = qemu.run_serial("gdbserver --once :9999 kmod --help")
>> -                    self.assertEqual(status, 1)
>> +                    status, output = qemu.run_serial_socket("gdbserver --once :9999 kmod --help")
>> +                    self.assertEqual(status, 0)
>>                       # The future either returns None, or raises an exception
>>                       future.result()
>> diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/selftest/cases/locales.py
>> index 4ca8ffb7aa..98026d2c80 100644
>> --- a/meta/lib/oeqa/selftest/cases/locales.py
>> +++ b/meta/lib/oeqa/selftest/cases/locales.py
>> @@ -27,15 +27,15 @@ class LocalesTest(OESelftestTestCase):
>>   
>>           with runqemu("core-image-minimal", ssh=False, runqemuparams='nographic') as qemu:
>>               cmd = "locale -a"
>> -            status, output = qemu.run_serial(cmd)
>> +            status, output = qemu.run_serial_socket(cmd)
>>               # output must includes fr_FR or fr_FR.UTF-8
>> -            self.assertEqual(status, 1, msg='locale test command failed: output: %s' % output)
>> +            self.assertEqual(status, 0, msg='locale test command failed: output: %s' % output)
>>               self.assertIn("fr_FR", output, msg='locale -a test failed: output: %s' % output)
>>   
>>               cmd = "localedef --list-archive -v"
>> -            status, output = qemu.run_serial(cmd)
>> +            status, output = qemu.run_serial_socket(cmd)
>>               # output must includes fr_FR.utf8
>> -            self.assertEqual(status, 1, msg='localedef test command failed: output: %s' % output)
>> +            self.assertEqual(status, 0, msg='localedef test command failed: output: %s' % output)
>>               self.assertIn("fr_FR.utf8", output, msg='localedef test failed: output: %s' % output)
>>   
>>       def test_locales_on(self):
>> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
>> index b4f0663828..753821490b 100644
>> --- a/meta/lib/oeqa/selftest/cases/overlayfs.py
>> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
>> @@ -183,20 +183,24 @@ EOT
>>   
>>           with runqemu('core-image-minimal') as qemu:
>>               # Check that application service started
>> -            status, output = qemu.run_serial("systemctl status my-application")
>> +            status, output = qemu.run_serial_socket("systemctl status my-application")
>> +            self.assertEqual(0, status)
>>               self.assertTrue("active (exited)" in output, msg=output)
>>   
>>               # Check that overlay mounts are dependencies of our application unit
>> -            status, output = qemu.run_serial("systemctl list-dependencies my-application")
>> +            status, output = qemu.run_serial_socket("systemctl list-dependencies my-application")
>> +            self.assertEqual(0, status)
>>               self.assertTrue("overlayfs-user-overlays.service" in output, msg=output)
>>   
>> -            status, output = qemu.run_serial("systemctl list-dependencies overlayfs-user-overlays")
>> +            status, output = qemu.run_serial_socket("systemctl list-dependencies overlayfs-user-overlays")
>> +            self.assertEqual(0, status)
>>               self.assertTrue("usr-share-another\\x2doverlay\\x2dmount.mount" in output, msg=output)
>>               self.assertTrue("usr-share-my\\x2dapplication.mount" in output, msg=output)
>>   
>>               # Check that we have /mnt/overlay fs mounted as tmpfs and
>>               # /usr/share/my-application as an overlay (see overlayfs-user recipe)
>> -            status, output = qemu.run_serial("/bin/mount -t tmpfs,overlay")
>> +            status, output = qemu.run_serial_socket("/bin/mount -t tmpfs,overlay")
>> +            self.assertEqual(0, status)
>>   
>>               line = getline_qemu(output, "on /mnt/overlay")
>>               self.assertTrue(line and line.startswith("tmpfs"), msg=output)
>> @@ -360,7 +364,8 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
>>           bitbake('core-image-minimal')
>>   
>>           with runqemu('core-image-minimal', image_fstype='wic') as qemu:
>> -            status, output = qemu.run_serial("/bin/mount")
>> +            status, output = qemu.run_serial_socket("/bin/mount")
>> +            self.assertEqual(0, status)
>>   
>>               line = getline_qemu(output, "upperdir=/data/overlay-etc/upper")
>>               self.assertFalse(line, msg=output)
>> @@ -393,7 +398,8 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
>>           testFile = "/etc/my-test-data"
>>   
>>           with runqemu('core-image-minimal', image_fstype='wic', discard_writes=False) as qemu:
>> -            status, output = qemu.run_serial("/bin/mount")
>> +            status, output = qemu.run_serial_socket("/bin/mount")
>> +            self.assertEqual(0, status)
>>   
>>               line = getline_qemu(output, "/dev/sda3")
>>               self.assertTrue("/data" in output, msg=output)
>> @@ -402,19 +408,24 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
>>               self.assertTrue(line and line.startswith("/data/overlay-etc/upper on /etc type overlay"), msg=output)
>>   
>>               # check that lower layer is not available
>> -            status, output = qemu.run_serial("ls -1 /data/overlay-etc/lower")
>> +            status, output = qemu.run_serial_socket("ls -1 /data/overlay-etc/lower")
>> +            self.assertEqual(0, status)
>>               line = getline_qemu(output, "No such file or directory")
>>               self.assertTrue(line, msg=output)
>>   
>> -            status, output = qemu.run_serial("touch " + testFile)
>> -            status, output = qemu.run_serial("sync")
>> -            status, output = qemu.run_serial("ls -1 " + testFile)
>> +            status, output = qemu.run_serial_socket("touch " + testFile)
>> +            self.assertEqual(0, status)
>> +            status, output = qemu.run_serial_socket("sync")
>> +            self.assertEqual(0, status)
>> +            status, output = qemu.run_serial_socket("ls -1 " + testFile)
>> +            self.assertEqual(0, status)
>>               line = getline_qemu(output, testFile)
>>               self.assertTrue(line and line.startswith(testFile), msg=output)
>>   
>>           # Check that file exists in /etc after reboot
>>           with runqemu('core-image-minimal', image_fstype='wic') as qemu:
>> -            status, output = qemu.run_serial("ls -1 " + testFile)
>> +            status, output = qemu.run_serial_socket("ls -1 " + testFile)
>> +            self.assertEqual(0, status)
>>               line = getline_qemu(output, testFile)
>>               self.assertTrue(line and line.startswith(testFile), msg=output)
>>   
>> @@ -446,14 +457,17 @@ IMAGE_INSTALL:append = " overlayfs-user"
>>           bitbake('core-image-minimal')
>>   
>>           with runqemu('core-image-minimal', image_fstype='wic') as qemu:
>> -            status, output = qemu.run_serial("echo \"Modified in upper\" > /etc/" + testFile)
>> -            status, output = qemu.run_serial("diff /etc/" + testFile + " /data/overlay-etc/lower/" + testFile)
>> +            status, output = qemu.run_serial_socket("echo \"Modified in upper\" > /etc/" + testFile)
>> +            self.assertEqual(0, status)
>> +            status, output = qemu.run_serial_socket("diff /etc/" + testFile + " /data/overlay-etc/lower/" + testFile)
>> +            self.assertEqual(0, status)
>>               line = getline_qemu(output, "Modified in upper")
>>               self.assertTrue(line, msg=output)
>>               line = getline_qemu(output, "Original file")
>>               self.assertTrue(line, msg=output)
>>   
>> -            status, output = qemu.run_serial("touch /data/overlay-etc/lower/ro-test.txt")
>> +            status, output = qemu.run_serial_socket("touch /data/overlay-etc/lower/ro-test.txt")
>> +            self.assertEqual(0, status)
>>               line = getline_qemu(output, "Read-only file system")
>>               self.assertTrue(line, msg=output)
>>   
>> diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
>> index 1aa6c03f8a..78e8a4c26b 100644
>> --- a/meta/lib/oeqa/selftest/cases/package.py
>> +++ b/meta/lib/oeqa/selftest/cases/package.py
>> @@ -135,7 +135,8 @@ class PackageTests(OESelftestTestCase):
>>               Check that gdb ``binary`` to read symbols from separated debug file
>>               """
>>               self.logger.info("gdbtest %s" % binary)
>> -            status, output = qemu.run_serial('/usr/bin/gdb.sh %s' % binary, timeout=60)
>> +            status, output = qemu.run_serial_socket('/usr/bin/gdb.sh %s' % binary, timeout=60)
>> +            self.assertEqual(0, status)
>>               for l in output.split('\n'):
>>                   # Check debugging symbols exists
>>                   if '(no debugging symbols found)' in l:
>> @@ -166,8 +167,8 @@ class PackageTests(OESelftestTestCase):
>>   
>>           def check_ownership(qemu, expected_gid, expected_uid, path):
>>               self.logger.info("Check ownership of %s", path)
>> -            status, output = qemu.run_serial('stat -c "%U %G" ' + path)
>> -            self.assertEqual(status, 1, "stat failed: " + output)
>> +            status, output = qemu.run_serial_socket('stat -c "%U %G" ' + path)
>> +            self.assertEqual(status, 0, "stat failed: " + output)
>>               try:
>>                   uid, gid = output.split()
>>                   self.assertEqual(uid, expected_uid)
>> diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
>> index f01e1eec66..be1481a82e 100644
>> --- a/meta/lib/oeqa/selftest/cases/runqemu.py
>> +++ b/meta/lib/oeqa/selftest/cases/runqemu.py
>> @@ -183,7 +183,7 @@ class QemuTest(OESelftestTestCase):
>>           # (such as the exception "Console connection closed unexpectedly")
>>           # as qemu will disappear when we shut it down
>>           qemu.runner.allowexit()
>> -        qemu.run_serial("shutdown -h now")
>> +        qemu.run_serial_socket("shutdown -h now")
>>           time_track = 0
>>           try:
>>               while True:
>> -- 
>> 2.40.0
>>
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#179825): https://lists.openembedded.org/g/openembedded-core/message/179825
>> Mute This Topic: https://lists.openembedded.org/mt/98125364/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 

