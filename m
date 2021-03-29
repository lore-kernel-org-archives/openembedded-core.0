Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.23010.1617031275811441812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 08:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X0ZvDlyn;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id kt15so20044352ejb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 08:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lONZl1Z5Lv4IdkoUom7VfoCwyvT3dfdH5XPthjHVFbs=;
        b=X0ZvDlyn6BK0Nk+UoMEbLeirmSudxZldG/LOz3CHacO+6lJSqas+hcpLm5uzKN8O5r
         DqsPVTKaNYtthX1E39IzcTQPZokvwJZMDIA9k0UTeOIe6UkY/8XrfyrWpj6LVQhdSzFD
         HVtJVpFBFpo0Sq71pPNpDMe1xEhZOhrrhm+ifufYOLZLUN+5Q8eJmUEF0uzSI3wqqKh+
         XO9dGs5Cu1z+umkks2HJB0AfXUFxNaO8jRUJ33PAurmZa+sQgtW64ghdXoNdS9vDXsvj
         HGqKrVMYmZJPa7fawKEGsmDtr1JypdVjepK++7tfHzkzyYcV8SQlUf03FLaPMzr29CuO
         tpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lONZl1Z5Lv4IdkoUom7VfoCwyvT3dfdH5XPthjHVFbs=;
        b=bgd7wYJuRBtKFwqOfpmONwZ04jUdDfByjpSv0kqFl5MaMN9Twtx7LB+heOZqgyfeEX
         0KIIOQC399TiO0Nh33NfI2r6vic/2VWpxnxWasC2r0qkF9wo3rZKEM9rCCRVC6w5UUGq
         7CLyHUPDUgWe2mM2Gbp7KAyE4Xbic0ak3PGrHZSivYLnJVewTnMIdzuTQYWzubKANC0W
         Wq4ipLUJrwWAmLY/W3MvZubRoYr8zl55mEYydPnUui9bktoWtxkADtcQxbTfjRxYSDxC
         ND+DbatOcAh28h/e3UW292Nl/Q9a6HsRJTZ1EXNGgAIK5H5wOj+/0tvOclRUqqT97cC5
         ItxQ==
X-Gm-Message-State: AOAM533K4KOzqkFql/56Ki+f5wjMwMz6cVMCaGNhuT3pkzHvAZ26sZuS
	ySTNCWl4+KfZ1y4vsn3yx/fIp7A2bvsfedYv+aM=
X-Google-Smtp-Source: ABdhPJxX1Bv+fh7sA7nXIcyoNWG784H+iiVLCnuFh6TUshDclTI6OIZXzXtE00vexf/yHMW4f7beqOOh4y4rorY7BVk=
X-Received: by 2002:a17:906:9bdb:: with SMTP id de27mr29365711ejc.459.1617031274341;
 Mon, 29 Mar 2021 08:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210329151442.86306-1-devendra.tewari@gmail.com>
In-Reply-To: <20210329151442.86306-1-devendra.tewari@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 29 Mar 2021 11:21:03 -0400
Message-ID: <CADkTA4NsocrBk0aRdqKqorWAuePMJd4O3g+K40j0J8zLrt7sLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
To: Devendra Tewari <devendra.tewari@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Can you document the cases that os.rename() is failing ? And also why
would we expect the shutil.move() to work in those cases ?

If a change like this cases issues in the future, we need that extra
information in the commit head for proper triage.

Bruce

On Mon, Mar 29, 2021 at 11:16 AM Devendra Tewari
<devendra.tewari@gmail.com> wrote:
>
> ---
>  meta/classes/sstate.bbclass | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index f579168162..f94aa96d70 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
>  def sstate_installpkgdir(ss, d):
>      import oe.path
>      import subprocess
> +    import shutil
>
>      sstateinst = d.getVar("SSTATE_INSTDIR")
>      d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
> @@ -401,7 +402,11 @@ def sstate_installpkgdir(ss, d):
>
>      for state in ss['dirs']:
>          prepdir(state[1])
> -        os.rename(sstateinst + state[0], state[1])
> +        try:
> +            os.rename(sstateinst + state[0], state[1])
> +            break
> +        except OSError:
> +            shutil.move(sstateinst + state[0], state[1])
>      sstate_install(ss, d)
>
>      for plain in ss['plaindirs']:
> @@ -413,7 +418,11 @@ def sstate_installpkgdir(ss, d):
>          dest = plain
>          bb.utils.mkdirhier(src)
>          prepdir(dest)
> -        os.rename(src, dest)
> +        try:
> +            os.rename(src, dest)
> +            break
> +        except OSError:
> +            shutil.move(src, dest)
>
>      return True
>
> @@ -638,6 +647,7 @@ python sstate_hardcode_path () {
>
>  def sstate_package(ss, d):
>      import oe.path
> +    import shutil
>
>      tmpdir = d.getVar('TMPDIR')
>
> @@ -664,7 +674,11 @@ def sstate_package(ss, d):
>                      continue
>                  bb.error("sstate found an absolute path symlink %s pointing at %s. Please replace this with a relative link." % (srcpath, link))
>          bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))
> -        os.rename(state[1], sstatebuild + state[0])
> +        try:
> +            os.rename(state[1], sstatebuild + state[0])
> +            break
> +        except OSError:
> +            shutil.move(state[1], sstatebuild + state[0])
>
>      workdir = d.getVar('WORKDIR')
>      sharedworkdir = os.path.join(d.getVar('TMPDIR'), "work-shared")
> @@ -674,7 +688,11 @@ def sstate_package(ss, d):
>              pdir = plain.replace(sharedworkdir, sstatebuild)
>          bb.utils.mkdirhier(plain)
>          bb.utils.mkdirhier(pdir)
> -        os.rename(plain, pdir)
> +        try:
> +            os.rename(plain, pdir)
> +            break
> +        except OSError:
> +            shutil.move(plain, pdir)
>
>      d.setVar('SSTATE_BUILDDIR', sstatebuild)
>      d.setVar('SSTATE_INSTDIR', sstatebuild)
> --
> 2.29.2
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
