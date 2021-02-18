Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web12.18.1613678307725748430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 11:58:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rLEi7iET;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id k1so1533569vso.6
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 11:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cfYSw+FWcjDeOBFgTEbhF+gTmOuyx+tSFjgfRMPPqfc=;
        b=rLEi7iETz4Oet+myplvqFUJyH7oD1IcpdY8ISF2bi7kCoXmKp+rhuU2CWxL8KoPglR
         pqoF5zp+M8NSC0E3VPc/Pg1CSvQjORLH5DLlNxbYeYo8YlvJ8NZPnl7zoCOg9oFtwcz2
         QhyL+Rhguszz0LZHwTPxZy/069/CXcbTbdGnQIWzHlSCKSkeTfEa8VMNHEuVuKO93KTL
         JCpuJiV5YgShCBAvJD8xa/knIVVhCtbuxy0USZNyTuwtGESiFCx7IUhvYW2XEcTAQt/g
         7YLVVxI15nS8NXCbgjGo443f5C+cqdZ8oqSbF6BND3Fz28k4yXMmYWrJ5s5heSvpXaAM
         bzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cfYSw+FWcjDeOBFgTEbhF+gTmOuyx+tSFjgfRMPPqfc=;
        b=RjHktVTnUWkXJrOoaOnmrnqFHML3wHyqtTUhJOTGBxbF0HllaKiOZ3uWfR+u41tsjX
         B2DoxoDOSsmpEqZiXbZ6+tGBpO2LhlKOS7O2/o/WWKFy0ip6e4glJ5gLvc+UxMwho/AQ
         YoC7+DjEklFQjKmlFgJLEKW4aCdBkK2tAmWmwRNvROXVmJ7ad3yGFjJ54jJUUiBYB3BD
         TfL07s46pxT0lITIrOxqQREC51y2snQex8jg6r1zZcmQKW2v4tmWnCSkZnVWpQtbPZVH
         AIEXiqqli6HCKCCjL14cn0svyhUBO4yu4TS6ByUqm1jN/4LiIXnVrtOGd3Z+sdNVFgU1
         kmfA==
X-Gm-Message-State: AOAM533Ud710Cb7S29JvDMArAuV/TzqXey32xL8UGkDYEDqLuzaqbE0I
	oNEJVkQZL3n1NIkwa93GyFuxt3M7OB4g7uc0uzE=
X-Google-Smtp-Source: ABdhPJzi7Oif80uwF24V5yhVv0kQkiI4P+HCrlsXgpHaz3XZAPaSFaMOHEP6/qkFlxob2UdMR0QrvW7ge5Nv1gaOIQU=
X-Received: by 2002:a05:6102:7b1:: with SMTP id x17mr4465623vsg.41.1613678306948;
 Thu, 18 Feb 2021 11:58:26 -0800 (PST)
MIME-Version: 1.0
References: <20210218192138.39449-1-jatedev@gmail.com> <20210218192138.39449-2-jatedev@gmail.com>
In-Reply-To: <20210218192138.39449-2-jatedev@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 18 Feb 2021 20:58:15 +0100
Message-ID: <CANNYZj9W4N0VeTi2WOQYG0c_XzwYX0EwEXD-GVkoUz_ciaoUCw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iputils: Use STAGING_DIR_NATIVE for setcap detection
To: Jate Sujjavanich <jatedev@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000044798105bba1c206"

--00000000000044798105bba1c206
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Feb 2021 at 20:22, Jate Sujjavanich <jatedev@gmail.com> wrote:

> +-setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap',
> required : false)
> ++stagingdirnative = get_option('stagingdirnative')
> ++setcap = find_program(stagingdirnative + '/usr/sbin/setcap',
> stagingdirnative + '/sbin/setcap', required : false)
>

Just remove the hardcoded paths from find_program altogether (see meson
manual), and it will take the binary from PATH env var, which is exactly
how native sysroots are supposed to work.

Alex

--00000000000044798105bba1c206
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 18 Feb 2021 at 20:22, Jate Sujjavanich &lt;<a href=3D"mailto=
:jatedev@gmail.com">jatedev@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">+-setcap =3D find_program(&#39;setcap&=
#39;, &#39;/usr/sbin/setcap&#39;, &#39;/sbin/setcap&#39;, required : false)=
<br>
++stagingdirnative =3D get_option(&#39;stagingdirnative&#39;)<br>
++setcap =3D find_program(stagingdirnative + &#39;/usr/sbin/setcap&#39;, st=
agingdirnative + &#39;/sbin/setcap&#39;, required : false)<br></blockquote>=
<div><br></div><div>Just remove the hardcoded paths from find_program altog=
ether (see meson manual), and it will take the binary from PATH env var, wh=
ich is exactly how native sysroots are supposed to work.</div><div><br></di=
v><div>Alex<br></div></div></div>

--00000000000044798105bba1c206--
