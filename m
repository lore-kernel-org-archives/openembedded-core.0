Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.2030.1602192051489286840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 14:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=idk4ueOv;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id w12so8579698qki.6
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 14:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9X6CabBJcAzehDm6Omfm6amWHCBJXPNsf8hyCwwtVTw=;
        b=idk4ueOvCTzujKccL5wGqYat8kqHvjzLzhXNXT4H0NE5BPRfVC0XHoHT1Xh/B04q2u
         6a6rt1KXiq/FKnu4NsqWZrJUzyERFRmdAEmj3SeYcKnTr6gCBkx2O7n0tjjpJkx7kmyj
         D0r6ohYyTLHzIyXbsWzpj34WYH3qOQsfJu5Ge8SZvw64DaX5+KtZZBUtEXLf51oDBHIw
         yTDgWUSvu+fyQD5a2A8xadpYkH4J5/t2IIhZsN7Tu5s10npxBMJ7xcxCy8iXQ8oMvneK
         YXxCcOanzm/mFm8kw7ZzeQymM6/anrASbIn+dnz8Ux3BsC1sNbgE8ydCd/fEllKr7WhC
         AqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9X6CabBJcAzehDm6Omfm6amWHCBJXPNsf8hyCwwtVTw=;
        b=r+DHeVAMUzw+99kZuC0ZyNF8SIhxwKwZH1fGo1mb5JE7dEKkVCKUY8z2pcPeqKm2To
         Bf5zGmxCyiJEg72AwEjEwiWiD4Oa0JJmpv9QBEZ/PJWAnBLwTnrgyS9/wLzow4dTXq3B
         Oj8aMYbJBdBA3JgbdCqPUAoyWT4prKTWuYRGOXJEKaaZqWrX3uAbLwVcj2hrZ63hticy
         3Q9/jKgNnKZxWoFFYjyGbeFAFL8m+b9o8f1O/P/oLpvTX4b5b9nfUVrTR3Qm3Le+AjLa
         teVzeDgjIGIWaGmBid4F/DyqhnmvFxS6EoeNUcIk+PUaQQgGtMji8ZMe35XQ/7t7H0p4
         hfZw==
X-Gm-Message-State: AOAM533yenX8U4+IslArhMF9H1OE6To3atCQXjZkol9w0VtCA0rRtXZZ
	USByPEOYCFxg6flrqFbg34eOVBb++uJ33Q9yr68=
X-Google-Smtp-Source: ABdhPJyjmKxYIHA+eFDG6o90p7TnmO1r9K09Pd9EkdfOzQTum3XiN5OmuJygMSrHQyTuE3HO9VBvTDw10ODCEYRVmGI=
X-Received: by 2002:a37:4015:: with SMTP id n21mr10379484qka.212.1602192050556;
 Thu, 08 Oct 2020 14:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201008132350.1143-1-JPEWhacker@gmail.com>
In-Reply-To: <20201008132350.1143-1-JPEWhacker@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 8 Oct 2020 14:20:24 -0700
Message-ID: <CAMKF1sondEt3EVGV6B7iNriw=hT5Pt5x6adqEpubJtY0pLEh+w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/waf: Add build and install arguments
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 8, 2020 at 6:23 AM Joshua Watt <JPEWhacker@gmail.com> wrote:
>
> Adds variables that can be used to allow a recipe to pass extra
> arguments to `waf build` and `waf install`. In most cases, you want to
> pass the same arguments to `build` and `install` (since install is a
> superset of `build`), so by default setting EXTRA_OEWAF_BUILD also
> affects `waf install`, but this can be overridded.
>

I wonder if it should be called EXTRA_OEWAF to match other component
build systems naming convention
secondly, it should be added to documentation as well

> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/waf.bbclass | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index 900244004e..309f625a40 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -5,6 +5,11 @@ B = "${WORKDIR}/build"
>
>  EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
>
> +EXTRA_OEWAF_BUILD ??= ""
> +# In most cases, you want to pass the same arguments to `waf build` and `waf
> +# install`, but you can override it if necessary
> +EXTRA_OEWAF_INSTALL ??= "${EXTRA_OEWAF_BUILD}"
> +
>  def waflock_hash(d):
>      # Calculates the hash used for the waf lock file. This should include
>      # all of the user controllable inputs passed to waf configure. Note
> @@ -55,11 +60,11 @@ waf_do_configure() {
>
>  do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
>  waf_do_compile()  {
> -       (cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)})
> +       (cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)} ${EXTRA_OEWAF_BUILD})
>  }
>
>  waf_do_install() {
> -       (cd ${S} && ./waf install --destdir=${D})
> +       (cd ${S} && ./waf install --destdir=${D} ${EXTRA_OEWAF_INSTALL})
>  }
>
>  EXPORT_FUNCTIONS do_configure do_compile do_install
> --
> 2.28.0
>
>
> 
>
