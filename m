Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.5353.1604569949592809084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 01:52:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WNyhJlyN;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: vvavrychuk@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id o23so735056ejn.11
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 01:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WLrmjobzKTJ009jIcJ6gE2mOgBalwMMrwxIwylTWgfs=;
        b=WNyhJlyN45TI9Eg3aE7cWg8Hev1e7U1Ln07WyV6mGxjqKbuCTrE5h84nmcf1LxOsmP
         NOu7F3qFkNjzpdWXQ4ICjtm8JocP0os+fn2fkncZQ+Bg2zDVyy0sWpgN4w6432WEKMLO
         K9q4t4eSBWr2d+CXgmm4IRyVF8sQLaJ+QGwHjWZnI/U+DOHdZhL5mTT97jZPuKGQel/0
         EnAi+GjgabUPjrI38/KLZejFZtXOILkpoOUxVKMXjcCyKimRKz1tt4LhyR0wbfqUscSR
         v1spynNVzZpC2rP2eDAYQGvxJhynKzm1D2UNzck8yRKzoNXQeJdI6N7vv5lswgKvxLt6
         VOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WLrmjobzKTJ009jIcJ6gE2mOgBalwMMrwxIwylTWgfs=;
        b=WXlSLkBouVoWtrB+volaSKTJktRa4w65hzo9CNUXBTwAC668c6quMDKNBiYnrIkQw4
         TDbq/zWb6/chaoYNnnfDR+Ovd2DdRxw0LsnJkopzJapcRmOnhKR+/ETQ1jTaxo2L26/Q
         TnnTFKU/K0xsAeXS0Dhd2m/DKQiEtWqsXAbsvN0iO+1cgq4tGDMc4EwIgNepR8X8f+Fn
         3qdQLwaqOcIzV8+NABjHaC7ZQcCP8apt7eMq+6GKFXlw0P1VLKeWQKgYBje0LpQX4FVS
         Um4v9DdDt33cp+F199Q2sk+vDsZzORyL4emEflYuTQqzEoVTmaJJesDS7wct7udNJrQW
         KVsQ==
X-Gm-Message-State: AOAM530v9XDq2ZMNWsfNqLIlEARZhG71FpGKXskyw2d6Vlo8OsiyWvfi
	jqMmKyP6YS64mVUwkS9KZJEJGGYcxLu8aCIssrbu2K70tQJuoA==
X-Google-Smtp-Source: ABdhPJz0rOLKAerNRzLKcrjTCKbYdhLHrezUuB2PHnAG8ynAB6sUgt7yhPLFnyfJTtzCsYv5nuVeiL5Z5Uxvjr9TUVU=
X-Received: by 2002:a17:906:1246:: with SMTP id u6mr1452878eja.432.1604569948080;
 Thu, 05 Nov 2020 01:52:28 -0800 (PST)
MIME-Version: 1.0
References: <20200830201522.23701-1-vvavrychuk@gmail.com> <CANNYZj-fw2YVGczSP+c7gjor6eKhYsjDgM1w-1AYD6MpDHQscA@mail.gmail.com>
In-Reply-To: <CANNYZj-fw2YVGczSP+c7gjor6eKhYsjDgM1w-1AYD6MpDHQscA@mail.gmail.com>
From: "Vasyl Vavrychuk" <vvavrychuk@gmail.com>
Date: Thu, 5 Nov 2020 11:52:17 +0200
Message-ID: <CAGj4m+5EuBics6xTxo1PeKnwTR8ChBwm-ZEtP1j3eQR6VwcdVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: Change virtio-vga to virtio-gpu.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Which MACHINE do you want me to test? _Without_ may changes test

oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk_sdl

fails for qemuarm64 MACHINE with

qemu-system-aarch64: Virtio VGA not available

On Sun, Aug 30, 2020 at 11:44 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Do the virgl selftests still pass with this change? Please run
>
> oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk_sdl
>
> and
>
> oe-selftest -r runtime_test.TestImage.test_testimage_virgl_headless
>
> Alex
>
>
> On Sun, 30 Aug 2020 at 22:15, Vasyl Vavrychuk <vvavrychuk@gmail.com> wrote:
>>
>> virtio-vga is available in QEMU only for hppa, i386, and ppc
>> architectures. On the other hand, virtio-gpu is available for all
>> architectures.
>>
>> Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
>> ---
>>  scripts/runqemu | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 7fb5f7db57..5d6b35ffe4 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -461,19 +461,19 @@ class BaseConfig(object):
>>              elif arg == 'sdl':
>>                  if 'gl' in sys.argv[1:]:
>>                      self.set_dri_path()
>> -                    self.qemu_opt_script += ' -vga virtio -display sdl,gl=on,show-cursor=on'
>> +                    self.qemu_opt_script += ' -device virtio-gpu -display sdl,gl=on,show-cursor=on'
>>                  elif 'gl-es' in sys.argv[1:]:
>>                      self.set_dri_path()
>> -                    self.qemu_opt_script += ' -vga virtio -display sdl,gl=es,show-cursor=on'
>> +                    self.qemu_opt_script += ' -device virtio-gpu -display sdl,gl=es,show-cursor=on'
>>                  else:
>>                      self.qemu_opt_script += ' -display sdl,show-cursor=on'
>>              elif arg == 'gtk':
>>                  if 'gl' in sys.argv[1:]:
>>                      self.set_dri_path()
>> -                    self.qemu_opt_script += ' -vga virtio -display gtk,gl=on,show-cursor=on'
>> +                    self.qemu_opt_script += ' -device virtio-gpu -display gtk,gl=on,show-cursor=on'
>>                  elif 'gl-es' in sys.argv[1:]:
>>                      self.set_dri_path()
>> -                    self.qemu_opt_script += ' -vga virtio -display gtk,gl=es,show-cursor=on'
>> +                    self.qemu_opt_script += ' -device virtio-gpu -display gtk,gl=es,show-cursor=on'
>>                  else:
>>                      self.qemu_opt_script += ' -display gtk,show-cursor=on'
>>              elif arg == 'gl' or arg == 'gl-es':
>> @@ -482,7 +482,7 @@ class BaseConfig(object):
>>                      raise RunQemuError('Option %s also needs gtk or sdl option.' % (arg))
>>              elif arg == 'egl-headless':
>>                  self.set_dri_path()
>> -                self.qemu_opt_script += ' -vga virtio -display egl-headless,show-cursor=on'
>> +                self.qemu_opt_script += ' -device virtio-gpu -display egl-headless,show-cursor=on'
>>              elif arg == 'serial':
>>                  self.kernel_cmdline_script += ' console=ttyS0'
>>                  self.serialconsole = True
>> --
>> 2.23.0
>>
>> 
