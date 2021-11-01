Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15130C433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 01:00:46 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.38407.1635728444699185355
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 18:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qQSq7pqo;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id bi29so15167203qkb.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 18:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=euYl2ni7cdUBlLp64T/2rqw7U0SqN5R82WNZpR4nYRI=;
        b=qQSq7pqoofjffZnnWqTeIweIvGWjX9QNu4XYh+AP18RWPQvav5BoeKfcZzxTDPolfn
         p5JNjoxGB2KNgHmDvKX6KsPkk3Wu7vjDJvgAqR5VZ02LU8ZAtMhguiFm8qlyim2OYS6J
         VF3EG1FZEpxMRtJV1MFPQ4N2WA9MDsmtqugTqrcciHvbvvqCoYw3y3p7sff9ItaX+bYY
         jHuh6pJWcp08iOZ6DTyAnqKs1JviZDm0/hgJu60tjxlksrYgOURzU36aHvXLTOuPX7OM
         NdWYXF28KA4jhYVqEYpkRgjD8d96OoVxaHwVJDHmvKUsiwae8mXFr+hDHNEVVv1asR7f
         kwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=euYl2ni7cdUBlLp64T/2rqw7U0SqN5R82WNZpR4nYRI=;
        b=vWmd3w8PuiBc1cF+oaukLw6U02+VZmcZ5g3NLtSu6jpKgwRaDFWn0CTPLkKqloSPKF
         VFJNMalYrIAok2POeVtU84IRDigzYrHiLXwSG4H8bia0KHMBMt7EPMlxDpx+PJ3/Ik7L
         2QeatUlgPTymqkYqHD18gj8NME2nNw6qTifCiWqcf9tPh0aZxXl1ySqft2Dn1vCd+Igj
         OFMvRV0yE/dwsg4D5J0BfRaB6Jue34UVrO7fnvQc2vMdhdxpZnbtjfsh4L1Iqx+uunUL
         TJDPce3UPQA1zTqxtWk0J6qUeuIH3+Uhul3kM5OcxnjqZXJKn0U8ob+Qua6qf7p3LNev
         Mgsw==
X-Gm-Message-State: AOAM533qmGPq3n9/WW3tOJcEJkaPv1WqweseAYK5DO8RQDC0w9JxEnqd
	lhlQoZL3a47LmTOuBycz8RRkU34C966/c4pVYrM=
X-Google-Smtp-Source: 
 ABdhPJxoLrC/WnBKAM2CEPQ8vXKJp2YhuJ4Bb5XKH08kJTw4sx+NfratxWhn195sxqTiwIAkAR72b1TiFiqVutIXuZY=
X-Received: by 2002:ae9:e108:: with SMTP id g8mr20153499qkm.98.1635728443498;
 Sun, 31 Oct 2021 18:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211029212918.16283-1-pkj@axis.com>
 <20211029212918.16283-3-pkj@axis.com>
 <691a2a5f543e8f0ab881167d0cea452407b1dd59.camel@linuxfoundation.org>
In-Reply-To: 
 <691a2a5f543e8f0ab881167d0cea452407b1dd59.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 31 Oct 2021 18:00:16 -0700
Message-ID: 
 <CAMKF1sp0akoc327A630iZhD6U2Dw8mG6Zsfk-COVLpBauMEYPA@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv3 3/3] insane.bbclass: Add a check for
 directories that are expected to be empty
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Nov 2021 01:00:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157698

On Sun, Oct 31, 2021 at 8:54 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-10-29 at 23:29 +0200, Peter Kjellerstedt wrote:
> > The empty-dirs QA check verifies that all directories specified in
> > QA_EMPTY_DIRS are empty. It is possible to specify why a directory is
> > expected to be empty by defining QA_EMPTY_DIRS_RECOMMENDATION:<path>,
> > which will then be included in the error message if the directory is
> > not empty. If it is not specified for a directory, then "but it is
> > expected to be empty" will be used.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >
> > PATCHv2: No changes.
> > PATCHv3: No changes.
> >
> >  meta/classes/insane.bbclass  | 33 ++++++++++++++++++++++++++++++++-
> >  meta/conf/documentation.conf |  2 ++
> >  2 files changed, 34 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> > index 1e2f1b768a..1675adf6ac 100644
> > --- a/meta/classes/insane.bbclass
> > +++ b/meta/classes/insane.bbclass
> > @@ -37,7 +37,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
> >              configure-gettext perllocalpod shebang-size \
> >              already-stripped installed-vs-shipped ldflags compile-host-path \
> >              install-host-path pn-overrides unknown-configure-option \
> > -            useless-rpaths rpaths staticdev \
> > +            useless-rpaths rpaths staticdev empty-dirs \
> >              "
> >  # Add usrmerge QA check based on distro feature
> >  ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
> > @@ -50,6 +50,21 @@ ALL_QA = "${WARN_QA} ${ERROR_QA}"
> >
> >  UNKNOWN_CONFIGURE_WHITELIST ?= "--enable-nls --disable-nls --disable-silent-rules --disable-dependency-tracking --with-libtool-sysroot --disable-static"
> >
> > +# This is a list of directories that are expected to be empty.
> > +QA_EMPTY_DIRS ?= " \
> > +    /dev/pts \
> > +    /media \
> > +    /proc \
> > +    /run \
> > +    /tmp \
> > +    ${localstatedir}/run \
> > +    ${localstatedir}/volatile \
> > +"
> > +# It is possible to specify why a directory is expected to be empty by defining
> > +# QA_EMPTY_DIRS_RECOMMENDATION:<path>, which will then be included in the error
> > +# message if the directory is not empty. If it is not specified for a directory,
> > +# then "but it is expected to be empty" will be used.
> > +
> >  def package_qa_clean_path(path, d, pkg=None):
> >      """
> >      Remove redundant paths from the path for display.  If pkg isn't set then
> > @@ -885,6 +900,22 @@ def package_qa_check_unlisted_pkg_lics(package, d, messages):
> >                             "listed in LICENSE" % (package, ' '.join(unlisted)))
> >      return False
> >
> > +QAPKGTEST[empty-dirs] = "package_qa_check_empty_dirs"
> > +def package_qa_check_empty_dirs(pkg, d, messages):
> > +    """
> > +    Check for the existence of files in directories that are expected to be
> > +    empty.
> > +    """
> > +
> > +    pkgd = oe.path.join(d.getVar('PKGDEST'), pkg)
> > +    for dir in (d.getVar('QA_EMPTY_DIRS') or "").split():
> > +        empty_dir = oe.path.join(pkgd, dir)
> > +        if os.path.exists(empty_dir) and os.listdir(empty_dir):
> > +            recommendation = (d.getVar('QA_EMPTY_DIRS_RECOMMENDATION:' + dir) or
> > +                              "but it is expected to be empty")
> > +            msg = "%s installs files in %s, %s" % (pkg, dir, recommendation)
> > +            oe.qa.add_message(messages, "empty-dirs", msg)
> > +
> >  def package_qa_check_encoding(keys, encode, d):
> >      def check_encoding(key, enc):
> >          sane = True
> > diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> > index 80ad8e10d5..45cd01374a 100644
> > --- a/meta/conf/documentation.conf
> > +++ b/meta/conf/documentation.conf
> > @@ -345,6 +345,8 @@ PYPI_SRC_URI[doc] = "The URI to use to fetch from pypi, default uses pythonhoste
> >
> >  #Q
> >
> > +QA_EMPTY_DIRS[doc] = "A list of directories that are expected to be empty."
> > +QA_EMPTY_DIRS_RECOMMENDATION[doc] = "This specifies a recommendation for a directory why it must be empty, which will be included in the error message if the directory is not empty."
> >  QMAKE_PROFILES[doc] = "Specifies your own subset of .pro files to be built for use with qmake."
> >
>
> This triggered:
>
> ERROR: apt-2.2.4-r0 do_package_qa: QA Issue: apt installs files in /var/volatile, but it is expected to be empty [empty-dirs]
> ERROR: apt-2.2.4-r0 do_package_qa: Fatal QA errors were found, failing task.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/915/steps/12/logs/stdio
>

meta-openembedded layers report a few too see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1675

>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157657): https://lists.openembedded.org/g/openembedded-core/message/157657
> Mute This Topic: https://lists.openembedded.org/mt/86687486/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

