Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
 by mx.groups.io with SMTP id smtpd.web11.4041.1588065742837407869
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 02:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RQOAORm6;
 spf=pass (domain: gmail.com, ip: 209.85.221.194, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f194.google.com with SMTP id w188so4272742vkf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 02:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2jda8ek00IC55JY1joZX50uzepxbx6keczj9I5TP7rw=;
        b=RQOAORm6XsLpk8DmA6FPPSrwmrLCSMmC6Fyt+ZVO5Vm0eryjnq3QLmLAr3fLEROF4A
         Z0skOpMGjxwouPSSJ3p4e1Fujm44UN5dxtmAyOA4hA2KLPGj+AG+V1V9Zfk0OCzykikO
         sY7qFkqH9IDOCGVmHkqVYwf9Xaxs3wmzjKSf/D1udVMqszfv+wHYBhXBhJaA92+Vc5Ab
         AX67LaxSh2LEsKx7x2h1aHg4DeO1h9LSHSkkoFHAzZS7K2v2Y8FcoHaaRp7PaUIMHFWv
         tIKYV2CyemGBs3vDsea3dVEd6QhMBEIFUCMbckK7CSrXxdVnkiSPI2K4t2+IDFle32HD
         yOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2jda8ek00IC55JY1joZX50uzepxbx6keczj9I5TP7rw=;
        b=OF/ob+eUW2fM6rAsG4cunzk7D/oz3JpG9Dt8YSRL8aGzbFLCYkN57UBlEeMnkA/m2w
         9ZSmoNxBcesxKbaNzUyIslrAKdA7YWHIRP12UXPWJetAQBVlBGu26mUcFx/fsU1XrMeP
         c3wsXxauyXrJi5yTCvHOQi64+GOQ3qBmw6h5Kj9nDxjGCEivIfTOyDT9Q8fHXrHTfT/L
         LBnB/3omzuBAppFujF9KSto41cG/AJaOvBEiJcuFE6N741OFXGpACeI8MTgOI9N+5LBy
         Ns1ZIST0loaiELHjmdFs/IT3K2xdW4CYawVsa0x0k5Qf+6fEc+FA39WxRwg/JoxofDgt
         gpTQ==
X-Gm-Message-State: AGi0PuZCp+Hadh6ytOV7VFxdPgaWGTroDL1qAui7goMaoe+nc9VGUX0e
	eTkCT/wUGFzc2PT9iEYGvloz85+wcc7IXfkTUT4=
X-Google-Smtp-Source: APiQypL++BNOAzPegRwpmjKimOcu/b+p0yABYj9dypc2FQwlY0LfTi+WNGPxO7y5wwb8128EoNowd60Tmn1PZEqCSNk=
X-Received: by 2002:a1f:2154:: with SMTP id h81mr21226287vkh.9.1588065741998;
 Tue, 28 Apr 2020 02:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200428090556.9828-1-hongxu.jia@windriver.com>
In-Reply-To: <20200428090556.9828-1-hongxu.jia@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 28 Apr 2020 11:22:10 +0200
Message-ID: <CANNYZj-bAi2Cib5CQgP3WvvvNFSnqOXM5xkW9YX7sws7G4tuDA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icu: disable do_make_icudata parallel build
To: hongxu <hongxu.jia@windriver.com>, Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006e8e5e05a4565ec0"

--0000000000006e8e5e05a4565ec0
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Apr 2020 at 11:06, hongxu <hongxu.jia@windriver.com> wrote:

> Since commit [icu: Add knobs to generate a subset of ICU data][1]applied,
> It caused Segmentation fault while executing genrb to generate *.res files
> ...
> |1473 LD_LIBRARY_PATH=../lib:../stubdata:../tools/ctestfw:$LD_LIBRARY_PATH
> ../bin/genrb -s ./misc -d ./out/build/icudt66l -i ./out/build/icudt66l
> -k -q pluralRanges.txt
> ...
> |1577 make[1]: *** [../data/rules.mk:732:
> out/build/icudt66l/pluralRanges.res]
> Segmentation fault (core dumped)
> |1578 make[1]: *** Waiting for unfinished jobs....
> ...
>
> Follow Khem Raj's suggestion [2], disable do_make_icudata parallel build
> and see if it makes help.
>
> [1]
> https://git.openembedded.org/openembedded-core/commit/?id=5e5be67744d7ddf5a9ac433ecba02f697a84a325
> [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=13869
>

Can this be fixed properly? What is the impact of disabling parallel build
on build times?

Alex

--0000000000006e8e5e05a4565ec0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 28 Apr 2020 at 11:06, hongxu &lt;=
<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt=
; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Since commit [icu: Add knobs to generate a subset of IC=
U data][1]applied,<br>
It caused Segmentation fault while executing genrb to generate *.res files<=
br>
...<br>
|1473 LD_LIBRARY_PATH=3D../lib:../stubdata:../tools/ctestfw:$LD_LIBRARY_PAT=
H<br>
../bin/genrb -s ./misc -d ./out/build/icudt66l -i ./out/build/icudt66l<br>
-k -q pluralRanges.txt<br>
...<br>
|1577 make[1]: *** [../data/<a href=3D"http://rules.mk:732" rel=3D"noreferr=
er" target=3D"_blank">rules.mk:732</a>: out/build/icudt66l/pluralRanges.res=
]<br>
Segmentation fault (core dumped)<br>
|1578 make[1]: *** Waiting for unfinished jobs....<br>
...<br>
<br>
Follow Khem Raj&#39;s suggestion [2], disable do_make_icudata parallel buil=
d<br>
and see if it makes help.<br>
<br>
[1] <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D=
5e5be67744d7ddf5a9ac433ecba02f697a84a325" rel=3D"noreferrer" target=3D"_bla=
nk">https://git.openembedded.org/openembedded-core/commit/?id=3D5e5be67744d=
7ddf5a9ac433ecba02f697a84a325</a><br>
[2] <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13869" r=
el=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_=
bug.cgi?id=3D13869</a><br></blockquote><div><br></div><div>Can this be fixe=
d properly? What is the impact of disabling parallel build on build times?<=
/div><div><br></div><div>Alex<br></div></div></div>

--0000000000006e8e5e05a4565ec0--
