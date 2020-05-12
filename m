Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web11.465.1589321999169284686
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 15:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pk2FT0wn;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id a7so5343896uak.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 15:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TSZ+9O41AEaTYsxbs+XXrI04xYqhsPIR2WNxdFUdHJc=;
        b=Pk2FT0wnEG8JRY3yj5xG0D2Cfqhv+/SXD9lOEITdtYsanJvMV4kW8ZSfjLijT5y9hr
         xZf+oFWG9T9DVFrzK6q/3HS9/Z+u4FqV5H28ik3HYAZYzPLT6M9kDVPL47JN68FxdzKv
         4cAzHeYGTr2dJJInimLc8A63JyYhXj4T7K3jkv96UuuavjBH7Zfp2SN06bM4cOr05lyW
         wOVk57As1MzPs6RspJV+N7JJCHWLuxr05Z1wRbLCuOYZ8DUXzS3bXivH64Eb9S9TJe9U
         t5qssJ9MMc4E9J/hSSMj0L0CA/ZsH8pk512p8B6LOCIJJ9lD0oqOZg74W/3W78Y/+K6l
         zNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TSZ+9O41AEaTYsxbs+XXrI04xYqhsPIR2WNxdFUdHJc=;
        b=YFLVtHR3IVpI9gBqEAvc3Vrg/JbQAeBOE/oEt1g8VWMu25TBdwbnLP9uAehaln1JLx
         YTS+62ymqMnNa1yvjyg2gL6aH6R+vVkdJ1wS7k1Z2VFUvX9ZFsb6O01jhdwp7Xpcm7jU
         o3OFii4Fo2vjokjoj8jB7elidE6LRFHvlhpJfNm0K8GC+H33yUVeLfHfr39mHFxIDuN1
         HREgeuokCOBP7h3XCzT7Hy2Zjwve44ZNj11HsLYs9wvrQfaO1CFRviTdbKqGRXB8p2WJ
         ZJOGO6p9Kae0JgtChvhM4PMjs/71EERTxh8bfC8sjxQ9xIVEzQBuScjcEVRZTOAQApX6
         lTDw==
X-Gm-Message-State: AGi0PubTKcms0UiAMda81Vqq0C5p9jHRY58ZIYtPt2f5BAuJ7vlzAbtr
	D+NHEXYAm54QEcS+GfmEhJw8hn6z7Lr/Sc8aYYyXRLhK
X-Google-Smtp-Source: APiQypLRmPiu0FmlUD9vl2nkWyhA26qd5JtbV3BaxIQhAmBSLNPdqXbMMan0ArIGcQQ7glE4L+nvwn+H106KlVMrHRk=
X-Received: by 2002:ab0:1ea:: with SMTP id 97mr18355752ual.106.1589321998221;
 Tue, 12 May 2020 15:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200512214255.20678-1-pkj@axis.com>
In-Reply-To: <20200512214255.20678-1-pkj@axis.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 12 May 2020 15:19:46 -0700
Message-ID: <CAJ86T=U-0v06iC5wm8opzJSO5a7k8a_a_NncF4N5ep6BwnBGTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] file: Remove unneccessary override of PACKAGECONFIG for native
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 12, 2020 at 2:43 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> There is no reason to set PACKAGECONFIG_class-native to the same value
> as the default PACKAGECONFIG.

End users often don't know how to safely change PACKAGECONFIG from a
.bbappend and might try PACKAGECONFIG += "foo" or PACKAGECONFIG_append
= " foo" without realising that it could affect more than just the
target build.

Have an explicit PACKAGECONFIG_class-native keeps the native config
stable for users who haven't yet learning through experience that the
safe way to change PACKAGECONFIG is PACKAGECONFIG_append_class-target
= " foo".

So although this PACKAGECONFIG_class-native may seem redundant to the
experts, it helps make OE more robust for regular users.

> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-devtools/file/file_5.38.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/file/file_5.38.bb b/meta/recipes-devtools/file/file_5.38.bb
> index f5ad568936..007db4790d 100644
> --- a/meta/recipes-devtools/file/file_5.38.bb
> +++ b/meta/recipes-devtools/file/file_5.38.bb
> @@ -19,7 +19,6 @@ S = "${WORKDIR}/git"
>  inherit autotools update-alternatives
>
>  PACKAGECONFIG ??= "zlib"
> -PACKAGECONFIG_class-native ??= "zlib"
>  PACKAGECONFIG[bz2] = "--enable-bzlib, --disable-bzlib, bzip2"
>  PACKAGECONFIG[lzma] = "--enable-xzlib, --disable-xzlib, xz"
>  PACKAGECONFIG[zlib] = "--enable-zlib, --disable-zlib, zlib"
> --
> 2.21.3
>
> 
