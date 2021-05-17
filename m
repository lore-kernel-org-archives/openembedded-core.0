Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.17442.1621250428677761369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 04:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qKUJP4YU;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id w4so6713474ljw.9
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 04:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DdyjVYbEgQYLZG1f7ZO5+OwprQUmuRU/rrUv8guh8LY=;
        b=qKUJP4YUvNUkc0IO2mHTOVmbfgJDeSf/Vw+2DMJ9tEkwrUznks6PdDw6sdflMZeuJz
         DW3Z9sXaOzAwwyV7BPQk2PiLNvnw8Cn2g/47ky/bWl2h5pEOqDvL5Tzq9Hs1C4+z8FBG
         fZo3E1lzg8qM5dAxUGVJYb+vqG0CRsvQK37dRGS3DRK93YGmC2ROZBPydHVln44zU/7Z
         DKNQEwurranWIe3QCoEnoiay5AOhibru5GCug9khsY14qrbl4El9iHE2eUTvgyx95BDb
         KmkdQCD1VAkVj1WSZ5LQLSvdFHRZ88hSS2gdO4qdTuygWBnu4g8q7uiu5VPEQ6aED/X8
         4HHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DdyjVYbEgQYLZG1f7ZO5+OwprQUmuRU/rrUv8guh8LY=;
        b=Sg9h/uCzjIQ/R3YSzvVcrCjqcUhvthEIq5chZgkAr3HlArk2WDgDi/U0JHcg1gKZgD
         3YuCHSF/PR22vKjFzylwHvoNAInfEo0z6xg+ZC5XhT4Iu77Ce32u5z7bqBk1i5P4LVrN
         ARPiv2waaiys4uYV55dlL/3sRJE8gkTW9XnSp3GDN4aJOfrU5aojahelU9vzZnE1PhC6
         3QAWQju5p5n5jwLwyZv+LY9V7uWdbEjrcXyL+oNOOUDkqqoj91uoj+kQOkBfoF2+h6lC
         0i1tfKscoGtZQn2hSOC1ryb2131fu1sst9lNPgGLMGlHNOeyO4KqSUSV62QXdH26ATkv
         LPFQ==
X-Gm-Message-State: AOAM530fjiZ3hhCjxyS4Ukw0oaHMOeB3rxtFLltrUuVbo5XkyOMUHUf6
	3WH4CmkoltmmJeHbsiZOXftXTrgqFZ31fVgdfag=
X-Google-Smtp-Source: ABdhPJzCfI+nkXCWH+nKqyUH0sa0smz9MlYsWjvt/APXS4bJOYEOXQcr+GMXGPx2gWnPPsTIYottjewWFf92xnznFj8=
X-Received: by 2002:a05:651c:2d0:: with SMTP id f16mr37002835ljo.474.1621250426998;
 Mon, 17 May 2021 04:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com> <CANNYZj-96kqjY=jRUoWQMzgwYtaCakx2guw5QnVFfW45HzQxtQ@mail.gmail.com>
In-Reply-To: <CANNYZj-96kqjY=jRUoWQMzgwYtaCakx2guw5QnVFfW45HzQxtQ@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Mon, 17 May 2021 16:50:15 +0530
Message-ID: <CANUMPcUV7+TQzFN+5svgHD_BVJy_0tZXN+P_8or1bhQVNgqNtw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] rust-testsuite.inc : Rust cross testing.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

>> +    scp -P 2222 -o StrictHostKeyChecking=no build/${SNAPSHOT_BUILD_SYS}/stage2-tools-bin/remote-test-server root@127.0.0.1:~/
>> +    ssh -p 2222 -o StrictHostKeyChecking=no -f root@127.0.0.1 "~/remote-test-server -v remote"

I tried copy_to() and run from sshcontrol.py on qemuimage successfully.
Howerver, I could not figure out the relative path for
"remote-test-server" from rust.py .

>> +    export TEST_DEVICE_ADDR="127.0.0.1:12345"
>> +    rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" > summary.txt 2> /dev/null

Will try and let you know.

Regards,
Vinay


On Mon, May 17, 2021 at 4:35 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 17 May 2021 at 12:35, Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>>
>> +do_check[dirs] += "${B}"
>> +do_check[nostamp] = "1"
>> +do_check () {
>> +    scp -P 2222 -o StrictHostKeyChecking=no build/${SNAPSHOT_BUILD_SYS}/stage2-tools-bin/remote-test-server root@127.0.0.1:~/
>> +    ssh -p 2222 -o StrictHostKeyChecking=no -f root@127.0.0.1 "~/remote-test-server -v remote"
>> +
>> +    export TEST_DEVICE_ADDR="127.0.0.1:12345"
>> +    rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" > summary.txt 2> /dev/null
>> +}
>
>
> I think this needs to be moved to selftest itself, is this possible?
>
> Alex
