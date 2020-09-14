Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
 by mx.groups.io with SMTP id smtpd.web12.65143.1600102455352523567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 09:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KZp8WP5a;
 spf=pass (domain: gmail.com, ip: 209.85.222.68, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f68.google.com with SMTP id u14so83034uaq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 09:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K/mCxBGywB2hW0lhNJicgqM/caXGYnWeVfwph4TFoKM=;
        b=KZp8WP5aUY6mnrewSdv1te40869jHyqSNAXgCgQLrl18rT1a2JqMTszmo29m0Cl2ST
         e+Ubp3ZltnfKhCuzfDYih6v1rZSdLENKrwQwUXGMUYnqd50N4ltIwrYyuixjten/IBy2
         xoiF7i4gJ/FviqRpewpWJhU+qUexZf68/fINw+SSIFMfTIQaUZwySKYTDJUbwhHK/tAw
         wgHgtfkC4DFBwpjIxfnsdt/2YdvJB0R5c6b1hl3tl8hQg7gJ4D6pQRSb4ZILlrOqK0NK
         HnM46LqJKedHE6E7Ya0suK/RJSytOa4FeYcBrBY4CbEPQJLYWjnbldSrdfC+JP1PCadF
         QGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K/mCxBGywB2hW0lhNJicgqM/caXGYnWeVfwph4TFoKM=;
        b=iVhyi3lZGmVG9JXNOM3O9i63eXk+zeCoGgMxtgO3hSoCyivsxwQdTRRljDtnI0AZnV
         1NUzbJ6q2B0OYWf41yjOKaa/+Da+dqaDNhUIvWP0RHPmaIGtcMhJFQfT2XXl1ILWOUaW
         qjraAWhPGdM2W1JxPfuodsrmG2+qRqRv/6J1hJWPdn4WM2pxRi1p1An8PxMF1eGcqMUc
         DQ5zZ4xA7zhXQ7FDQYYQqEi7rVzoaAklmt3FQ0vMkz6mCMghyIz/EHvIhEoKzpW/tZb5
         WU/PgQsozqEkKUssiYSUYUETXzwDq9589w9zaZqER5YJgQNNzgnCeY7JkVekyP06hD2I
         VoWw==
X-Gm-Message-State: AOAM532Q/nXz6I2vpyM/J087nhH7FpwnQnKSu5kJiEK9fsq9WF0G+O0T
	q6dXXjezxWS4VHKlZkR2xLPDCbOzs+zFNLyjIDo=
X-Google-Smtp-Source: ABdhPJx0QgZ2VnKn+mcael0AKfmIuPCUWe1wZ6ETjk1gL/qUIDAeooNpl/uX9mfMLwFHbLi/s2mOTiZTBe8TV46wi4U=
X-Received: by 2002:ab0:208d:: with SMTP id r13mr7466038uak.81.1600102454395;
 Mon, 14 Sep 2020 09:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <1600077571-7368-1-git-send-email-pemorrow@linux.microsoft.com>
In-Reply-To: <1600077571-7368-1-git-send-email-pemorrow@linux.microsoft.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 14 Sep 2020 09:54:04 -0700
Message-ID: <CAJ86T=USuVr9p9Zyuw49a2TcJVA3nGvANzNt2w1mA+sHMUSY9A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] squashfs-tools: Allow COMP_DEFAULT to be changed easily at build time
To: Peter Morrow <pemorrow@linux.microsoft.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 14, 2020 at 2:59 AM Peter Morrow
<pemorrow@linux.microsoft.com> wrote:
>
> The default compression algorithm is currently gzip, this patch allows the
> default to be changed by setting SQUASHFS_TOOLS_COMP_DEFAULT to a valid
> compression algorithm.
>
> Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
> ---
>  meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> index b06951d..42fae28 100644
> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> @@ -25,6 +25,9 @@ PACKAGECONFIG[xattr] = "XATTR_SUPPORT=1,XATTR_SUPPORT=0,attr"
>  PACKAGECONFIG[zstd] = "ZSTD_SUPPORT=1,ZSTD_SUPPORT=0,zstd"
>  PACKAGECONFIG[reproducible] = "REPRODUCIBLE_DEFAULT=1,REPRODUCIBLE_DEFAULT=0,"
>
> +SQUASHFS_TOOLS_COMP_DEFAULT ?= "gzip"
> +EXTRA_OEMAKE += "COMP_DEFAULT=${SQUASHFS_TOOLS_COMP_DEFAULT}"

Since you can easily override COMP_DEFAULT by setting EXTRA_OEMAKE
from a .bbappend, I don't think it's necessary to add this to the main
recipe.

>  do_compile() {
>         oe_runmake all
>  }
> --
> 1.8.3.1
>
> 
