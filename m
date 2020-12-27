Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.34755.1609089295994979296
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Dec 2020 09:14:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fyiUaTpR;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id w79so7280322qkb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Dec 2020 09:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/lx4ajNAmPsHQUXQeXMpXmnCNE4YCIeHLmMyz0rwolo=;
        b=fyiUaTpRP26nsGfkY40gnTHEXtbAl5CzcIYEqZ6/frS72VArEY70/6sozHuOR/M8tO
         66czeDl99NTbyZg8G4soFjJ+rQrI52HmAwbVHi1Vb2nELYdPMwTksmiveXXOsH6RNmwm
         Ss/0s1EQz9uAOSgGdzSfQYOzLmgpkZXloW/b0qeG0Wi5gLjqlzddSh0vctRE4WlQu+q/
         Di/mur1LBB/HdU3YcTtWv0OMB1aliEwT8AhK39TwsEIdBAYSfIGG5/IAPLeuY8zZZeb5
         RxUr7JdiuwOkEEw7jcMpF5Ugjs+xGRVb8qm2+0SwozDHudSLNJ4CvpwNvf/ZBzkgce0S
         FSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/lx4ajNAmPsHQUXQeXMpXmnCNE4YCIeHLmMyz0rwolo=;
        b=AQenTMDlxEIo3n8iy9r5/wCzcrC044qOXNcUaY7Lz4EBzr9hos0LbD7B8VJITS2Nir
         jjqZnziH8MdxJ1xdh/nB4INIi9zODU0wukbBIFHunEvhq9R9dGiWbeOd/mr9tLWDlbp9
         GwQ174+lNvbk7UO7bXt35AScybWUyAmRxR+KVqAcBR3GoVvmHiPahvZ6qZeXMlMAtxZT
         aOOMLFEM7rjr2KX5GS3b2loonFVhvrPolnoGOeFSIC+Vr/rFlO0R4KVCIF2UdmEN2SaT
         bQMlkeeKBKBnxb1I94wcsEOo84fqljgyG1XgIH97ki4fVWZ0eOZd6zN0ajl94x9Bw1ST
         4rGQ==
X-Gm-Message-State: AOAM530GoTEaQ/wlX7jvQS54rHq1n8q803ON3ITPR2jVvnQs7iBoCZ3W
	BOWtd9gPehGjA5apbk6kjpdbj3xYliSBIySwWic=
X-Google-Smtp-Source: ABdhPJywHWAXxkbyISviBANhL3bbM53mzqCXVqyGbnmd30bTt9zsosbyQHpEFqH5dsAHWvF1zc65MA7kGUpAqt7CxVo=
X-Received: by 2002:a37:744:: with SMTP id 65mr39367894qkh.71.1609089295012;
 Sun, 27 Dec 2020 09:14:55 -0800 (PST)
MIME-Version: 1.0
References: <20201226092732.52323-1-alex.kanavin@gmail.com> <20201226092732.52323-29-alex.kanavin@gmail.com>
In-Reply-To: <20201226092732.52323-29-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 27 Dec 2020 09:14:27 -0800
Message-ID: <CAMKF1soLsq13xrQ6e34rkXRnLYHfoX6qg9Dkp3tNjK8xn+N8_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 29/48] util-linux: upgrade 2.36 -> 2.36.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this breaks on 32bit architectures using 64bit time_t e.g. riscv32 arc etc.
see
https://errors.yoctoproject.org/Errors/Details/540283/

following patch will help
https://www.spinics.net/lists/util-linux-ng/msg16562.html

On Sat, Dec 26, 2020 at 1:28 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../util-linux/{util-linux_2.36.bb => util-linux_2.36.1.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/util-linux/{util-linux_2.36.bb => util-linux_2.36.1.bb} (99%)
>
> diff --git a/meta/recipes-core/util-linux/util-linux_2.36.bb b/meta/recipes-core/util-linux/util-linux_2.36.1.bb
> similarity index 99%
> rename from meta/recipes-core/util-linux/util-linux_2.36.bb
> rename to meta/recipes-core/util-linux/util-linux_2.36.1.bb
> index 474f1e188c..8ea0bac9b2 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.36.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.36.1.bb
> @@ -40,7 +40,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz
>             file://display_testname_for_subtest.patch \
>             file://avoid_parallel_tests.patch \
>             "
> -SRC_URI[sha256sum] = "9e4b1c67eb13b9b67feb32ae1dc0d50e08ce9e5d82e1cccd0ee771ad2fa9e0b1"
> +SRC_URI[sha256sum] = "09fac242172cd8ec27f0739d8d192402c69417617091d8c6e974841568f37eed"
>
>  PACKAGES =+ "${PN}-swaponoff"
>  PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', '${PN}-pylibmount', '', d)}"
> --
> 2.29.2
>
>
> 
>
