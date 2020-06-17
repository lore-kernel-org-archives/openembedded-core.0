Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.3968.1592387437055737996
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 02:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kj1AYXor;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id s18so2042020ioe.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 02:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6fFXufwK9sz9wyvI0ZTND94iNvZ9MWRTlPhrl0e0fts=;
        b=kj1AYXorSlo+BcRPmRKK170wml+ubQXMV9xe27ByFhE6xc6LLMWV1k5ZGM416byYpg
         d5two50KCctYkio/n+mDffkMJGau7HxjaDCQP+2UELLzxZOcHZHFLZAtjcSHiszF6iXB
         GBhljmEVM1BLmEoqLxZyVSgTB8Ct+mE+2sktylHpU7rDgyRp1lAbKkpB50AlDTmjY6Du
         dNySctkZBnkM7nQDjft04YBhtrdShVXdKujZfrKYqa/qSMlQJN1kc6rLUHEmLeJtK2M3
         5sGpVSWy3TBDcvLiDhp+VwrBc6d9pqY11u7xCN30nVgn6Oee5EK0fXC6E5FhGl8f5vkW
         Jhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6fFXufwK9sz9wyvI0ZTND94iNvZ9MWRTlPhrl0e0fts=;
        b=XEmM0KlQMupf716+KYrdgCdJGinzUPReTPLHxRezFzS0N6DYnlLvAsi8fWlvzlfk+K
         5VFxEVAhpvzs1EOmzg7z2TDYC3k7Fj6TS/uqjktc6XjHWzeduQ98A2qjyMOt7MG98tV1
         smHu2o41Bck2XguWbxw7oqSobIWLK+qqHBnkrFIEDYyYdM44TdlKXmdQCv5rGlPgnu3j
         K9olr7nRjbVEKpPCsBJG3U5BKkI/ftleZHJpgY8gcygcE8V+wj9jBfwxACd8b77yMb3p
         K2dlmNfMB/k3XQX+gW27Wg0i74LMbRahxj2nSmaw0gP2ipxYCKJfcBpbKKgijQX9MB9d
         yc9w==
X-Gm-Message-State: AOAM532pUE3V+erQPMvTg5Rw/EGb4JShEFc2cHdogtrKoX63fn8nJuZE
	FlemTXqymJGWzbycKyGEaEj0lX4ppwxxI7044xE=
X-Google-Smtp-Source: ABdhPJxNIJ6B/bgDB2Uur16SMtv76PeXUkjVr4i3PbBlAoj17ptP0DxXks4KmTUZPWA0YZqogdk+xQLWCS4aWwP/76Q=
X-Received: by 2002:a6b:5a07:: with SMTP id o7mr7190345iob.67.1592387436427;
 Wed, 17 Jun 2020 02:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200617080740.1527497-1-changqing.li@windriver.com>
In-Reply-To: <20200617080740.1527497-1-changqing.li@windriver.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Wed, 17 Jun 2020 11:50:25 +0200
Message-ID: <CALbNGRRQG_J+xDg_WLJ4a5rNngidU4AvcSRBm=Bt5sjjSZcx+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mime.bbclass: change postrm to prerm
To: Changqing Li <changqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 17, 2020 at 10:10 AM Changqing Li
<changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> fix error during post uninstall:
> %postun(shared-mime-info-data-2.0-r0.4.corei7_64): execv(/bin/sh) pid 78
> + '[' 0 = 0 ']'
> + set -e
> + '[' x '!=' x ']'
> + echo 'Updating MIME database... this may take a while.'
> Updating MIME database... this may take a while.
> + update-mime-database /usr/share/mime
> Directory '/usr/share/mime/packages' does not exist!
> %postun(shared-mime-info-data-2.0-r0.4.corei7_64): waitpid(78) rc 78 status 100
> warning: %postun(shared-mime-info-data-2.0-r0.4.corei7_64) scriptlet failed, exit status 1
>
> when run post uninstall scriptlet, /usr/share/mime/packages has been
> removed during unintall, while update-mime-database need to use
> /usr/share/mime/packages/freedesktop.org.xml
>
> correct by change postrm to prerm
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/classes/mime.bbclass | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
> index c9072adf3b..a0943b4476 100644
> --- a/meta/classes/mime.bbclass
> +++ b/meta/classes/mime.bbclass
> @@ -17,7 +17,7 @@ else
>  fi
>  }
>
> -mime_postrm() {
> +mime_prerm() {
>  if [ "x$D" != "x" ]; then
>         $INTERCEPT_DIR/postinst_intercept update_mime_database ${PKG} \
>                 mlprefix=${MLPREFIX} \
> @@ -42,17 +42,17 @@ python populate_packages_append () {
>                      mimes_types_found = True
>                      break
>          if mimes_types_found:
> -            bb.note("adding mime postinst and postrm scripts to %s" % pkg)
> +            bb.note("adding mime postinst and prerm scripts to %s" % pkg)
>              postinst = d.getVar('pkg_postinst_%s' % pkg)
>              if not postinst:
>                  postinst = '#!/bin/sh\n'
>              postinst += d.getVar('mime_postinst')
>              d.setVar('pkg_postinst_%s' % pkg, postinst)
> -            postrm = d.getVar('pkg_postrm_%s' % pkg)
> -            if not postrm:
> -                postrm = '#!/bin/sh\n'
> -            postrm += d.getVar('mime_postrm')
> -            d.setVar('pkg_postrm_%s' % pkg, postrm)
> +            prerm = d.getVar('pkg_prerm_%s' % pkg)
> +            if not prerm:
> +                prerm = '#!/bin/sh\n'
> +            prerm += d.getVar('mime_prerm')
> +            d.setVar('pkg_prerm_%s' % pkg, prerm)
>              if pkg != 'shared-mime-info-data':
>                  bb.note("adding shared-mime-info-data dependency to %s" % pkg)
>                  d.appendVar('RDEPENDS_' + pkg, " " + d.getVar('MLPREFIX')+"shared-mime-info-data")
> --
> 2.17.1
>
If I understand this correctly

* The error pops up once the LAST package with files  in
/usr/share/mime/packages is removed. If not something else is wrong
* This is not a fix but a workaround leaving mime db inconsistent with
entries removed later.

Andreas
