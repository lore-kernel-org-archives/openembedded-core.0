Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web09.6026.1622117910728429962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 05:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LyV6YnfH;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id v5so469132ljg.12
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 05:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0IB3Au+Xf4HRui1zn7lbSs0SA79DCtiyskttH/kKMZk=;
        b=LyV6YnfHhbY/u1dihOfXS12ySzL1OgACaXHueKOmVbqSV02Ts0wfEo64pXGtM6o2oS
         3D4p2xcdmgNo7e/+YLJZouQT60FUw96KNHZaqP5fBzn6MSVpNjWZAjgbvpqv2TNdhdEW
         2s28h7sKBMmom715kr9NLPgo5PmFg6igTuFcOJAy5sYEOZm2YtDvyJ0+8shRXJTToVJU
         HcZqnvoBNANs4UXeQAePWirOLEMugstG0iX9Hzkajfj8Wyo9TtUT1JKAGjugEJw6ML4M
         lvC+qUfLqX03Ygw8/1zOr1ZVJdZEpJ+VqBqMo5/t11u8MnugZ1zztabr67vioO22EmQW
         y7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0IB3Au+Xf4HRui1zn7lbSs0SA79DCtiyskttH/kKMZk=;
        b=PWutp4nmX/dMm53TDt6NF6zujNYBMdXyioVIV8EQCm9zNPFHbSk82Kf5MLtej4DomK
         hhUZlkkxS7HOlk956XY6xYpVd6D1++7xLd4QylcqouafcBof41nfW9f6+hwUZhixtZiY
         6gNETEMiIK0zbRmnzn9Q0wsLSdq1IPa011ZB8eLMQZ0WnGLHRSNVZXsoPUX3zbrrbpG8
         r4pJd50Y/sHUCJoLWqySTiS4Ux6Mipwezo3dS7VDMXK4YW5+WRD7ZIiguW2kUT9ZZ1u4
         0lwcicGhFEz+kgdCqZ/+AMGXma3Uz4n+GUO0zkw+j1WNOuPjqCWAKhIj0o4i/Gu+WQpA
         WxzQ==
X-Gm-Message-State: AOAM531F2antBGNJLgip1am+9Nh3HgvcovpNOEEArUH14w+cqzgKm4FA
	djCuXP5Pwx88fDDvINPMUnmAZsunAE+u0CjnYW8=
X-Google-Smtp-Source: ABdhPJyIaHl1fNH+ZUIRAPRnqSugEWgirz6w3BLOhX+MZtqtbVVN5AypQjF67reDNnnKWN4yUZRuluOkOT6Q1wDTVn0=
X-Received: by 2002:a2e:9544:: with SMTP id t4mr2369047ljh.474.1622117908385;
 Thu, 27 May 2021 05:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcVo=iH43q+70zHnsm5ktJR4D4AO+KZEzj8=0AQNaYFv0w@mail.gmail.com>
 <20210527081100.1213973-1-vinay.m.engg@gmail.com> <20210527081100.1213973-4-vinay.m.engg@gmail.com>
 <CANNYZj8wK=MCOQzGrnZf4AyJS_-0NXV9WXXhXef0psouhamJxQ@mail.gmail.com>
In-Reply-To: <CANNYZj8wK=MCOQzGrnZf4AyJS_-0NXV9WXXhXef0psouhamJxQ@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Thu, 27 May 2021 17:48:16 +0530
Message-ID: <CANUMPcWXEqZ2sCtbk7=zZ_j0i8HFPbbDBQ9xb4n3vQFGfXc9aA@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] oeqa/selftest/cases/rust.py: Rust oe-selftest script.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

The reason why I changed this is, we have to execute
"remote-test-server" on the image through background ssh.
So that the "remote-test-server" will be alive waiting for connection.
Then in the rust.py  control passed to the next command (cmd) for
execution.
If we use the sshcontrol.py method we have to set a timeout of 600
otherwise default timeout is 300. Even if the test execution completes
early due to failure then we have to wait till this timeout.

I tried reducing the timeout to 60 seconds and some of the tests got skipped.

If that is ok I will use that copy_to and run from sshcontrol.py as we
did in v4 patches and work for the result.output

Regards,
Vinay

On Thu, May 27, 2021 at 5:33 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 27 May 2021 at 10:11, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>>
>> +                       # To kill remote-test-server executing through background ssh
>> +                       killcommand = "kill -9 \$(ps | grep remote-test-server |  grep -v \"grep\" | awk '{print \$1}')"
>> +                       cmd = cmd + "ssh %s root@%s \"%s\";" % (sshargs, qemu.ip, killcommand)
>
>
> I don't think you actually need to kill the remote test server. As qemu will be stopped anyway, and with it, all the processes that run inside qemu.
>
> Also, it's better to use cmd only to execute the tests. Starting the server is better done through SSHControl.run(), and copying the binary via SSHControl.copy_to() - see examples in selfttest's imagefeatures.py or runtime_test.py.
>
> Alex
>
