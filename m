Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D02CC433FE
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 05:09:34 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.7769.1636002573017469555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 22:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bl4kjFlY;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id u25so4561057qve.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 22:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=giFx27bNSsdj6EP56AdYrhIl6hQeNqZHoR1p2nC220Y=;
        b=Bl4kjFlYpYNrl+4vPJiKwzMcAUYYbpy8g9fL1KuL6/45q66Wmd1Tb234c1l0ikDJVz
         Gx9OGuYJ3M3mvTrJvA888XCe5zcR1LUgKMZzqoSn/QTZch7eUMeompUkiWLAbgLkho0V
         hTnXu7YggqOAMAYkev7o3BBlXmAv/RfyHLobsBYIylOnKgeAY7Kb+7x43Q9iMfrjWlst
         CqfuODhZQ7yEEfr2555Sw7S7jDrFizEnkkrWUMTA+j3dzV1axn94/PYvQ0hzWM5nvyhq
         PkPFKd3liALWKstkggq1oeRaBQ/n10l0d1Q4WBHHnBrY1ip5YZSgwSwVJFYDh5atUcoo
         kxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=giFx27bNSsdj6EP56AdYrhIl6hQeNqZHoR1p2nC220Y=;
        b=hpCk48QegkCH/8SP8DTK13cNfwNKzPdWki4HEIu/vldBCRewBw+xEx7WoNd9IySpjr
         Y1GYLfDcn0xVT5zP9ALbwBVIVyog5UawTS0SYpic383FLr5w400g92Fy4j3oO2kOrWX0
         MTd3cpT//mAcAHg/tA6ylx0Mb5DuoWLPTcKwBnz5PC4sHGVWcJ8Na1tfLBeQiv4nrzlT
         oqHpE3lcjUd0LMbkS7GOYOHgih3l0G4SRNnyTfesLusDyELrV8inj4m/CKQureX5waTD
         1TQ0qskix6qsOu8+wzrae4sLlKpvm/ai5f6vtAy2S+AckyhO6AkpZaIKVDYsJ29kUV1X
         JE0w==
X-Gm-Message-State: AOAM5301EwODcZfE2aL+dAtetp6zzkwFooPtbmlENYCOh2lB0HC0QOc5
	0DT1TamqhlM3hw2zZEyZyFLSaZSZ9OFOLEizlB8=
X-Google-Smtp-Source: 
 ABdhPJyjHqPEaoyUyQDB5ON0JpnOBKmak8t+FmZzrVVuOvAvq0Nv4qsWfttGNriFWrPzIYSi/cYW5niIe9Jtn6/NNMg=
X-Received: by 2002:a0c:eb90:: with SMTP id x16mr25087045qvo.41.1636002572049;
 Wed, 03 Nov 2021 22:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211029212918.16283-1-pkj@axis.com>
 <20211029212918.16283-3-pkj@axis.com>
 <691a2a5f543e8f0ab881167d0cea452407b1dd59.camel@linuxfoundation.org>
 <CAMKF1sp0akoc327A630iZhD6U2Dw8mG6Zsfk-COVLpBauMEYPA@mail.gmail.com>
 <1d70a5983e8249f0bb17f34570ef08fb@axis.com>
In-Reply-To: <1d70a5983e8249f0bb17f34570ef08fb@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Nov 2021 22:09:06 -0700
Message-ID: 
 <CAMKF1spgvhgA5AY2kcbirZ3fH0zSUCehFYHmhE+sLnAn5p36Ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv3 3/3] insane.bbclass: Add a check for
 directories that are expected to be empty
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 05:09:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157836

On Tue, Nov 2, 2021 at 11:55 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: den 1 november 2021 02:00
> > To: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Patches and
> > discussions about the oe-core layer <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCHv3 3/3] insane.bbclass: Add a check for
> > directories that are expected to be empty
> >
> > On Sun, Oct 31, 2021 at 8:54 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Fri, 2021-10-29 at 23:29 +0200, Peter Kjellerstedt wrote:
> > > > The empty-dirs QA check verifies that all directories specified in
> > > > QA_EMPTY_DIRS are empty. It is possible to specify why a directory is
> > > > expected to be empty by defining QA_EMPTY_DIRS_RECOMMENDATION:<path>,
> > > > which will then be included in the error message if the directory is
> > > > not empty. If it is not specified for a directory, then "but it is
> > > > expected to be empty" will be used.
> > > >
> > > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > ---
> > > >
> > > > PATCHv2: No changes.
> > > > PATCHv3: No changes.
> > > >
> > > >  meta/classes/insane.bbclass  | 33 ++++++++++++++++++++++++++++++++-
> > > >  meta/conf/documentation.conf |  2 ++
> > > >  2 files changed, 34 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> > > > index 1e2f1b768a..1675adf6ac 100644
> > > > --- a/meta/classes/insane.bbclass
> > > > +++ b/meta/classes/insane.bbclass
> > > > @@ -37,7 +37,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
> > > >              configure-gettext perllocalpod shebang-size \
> > > >              already-stripped installed-vs-shipped ldflags compile-host-path \
> > > >              install-host-path pn-overrides unknown-configure-option \
> > > > -            useless-rpaths rpaths staticdev \
> > > > +            useless-rpaths rpaths staticdev empty-dirs \
> > > >              "
> > > >  # Add usrmerge QA check based on distro feature
> > > >  ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
> > > > @@ -50,6 +50,21 @@ ALL_QA = "${WARN_QA} ${ERROR_QA}"
> > > >
> > > >  UNKNOWN_CONFIGURE_WHITELIST ?= "--enable-nls --disable-nls --disable-silent-rules --disable-dependency-tracking --with-libtool-sysroot --disable-static"
> > > >
> > > > +# This is a list of directories that are expected to be empty.
> > > > +QA_EMPTY_DIRS ?= " \
> > > > +    /dev/pts \
> > > > +    /media \
> > > > +    /proc \
> > > > +    /run \
> > > > +    /tmp \
> > > > +    ${localstatedir}/run \
> > > > +    ${localstatedir}/volatile \
> > > > +"
> > > > +# It is possible to specify why a directory is expected to be empty by defining
> > > > +# QA_EMPTY_DIRS_RECOMMENDATION:<path>, which will then be included in the error
> > > > +# message if the directory is not empty. If it is not specified for a directory,
> > > > +# then "but it is expected to be empty" will be used.
> > > > +
> > > >  def package_qa_clean_path(path, d, pkg=None):
> > > >      """
> > > >      Remove redundant paths from the path for display.  If pkg isn't set then
> > > > @@ -885,6 +900,22 @@ def package_qa_check_unlisted_pkg_lics(package, d, messages):
> > > >                             "listed in LICENSE" % (package, ' '.join(unlisted)))
> > > >      return False
> > > >
> > > > +QAPKGTEST[empty-dirs] = "package_qa_check_empty_dirs"
> > > > +def package_qa_check_empty_dirs(pkg, d, messages):
> > > > +    """
> > > > +    Check for the existence of files in directories that are expected to be
> > > > +    empty.
> > > > +    """
> > > > +
> > > > +    pkgd = oe.path.join(d.getVar('PKGDEST'), pkg)
> > > > +    for dir in (d.getVar('QA_EMPTY_DIRS') or "").split():
> > > > +        empty_dir = oe.path.join(pkgd, dir)
> > > > +        if os.path.exists(empty_dir) and os.listdir(empty_dir):
> > > > +            recommendation = (d.getVar('QA_EMPTY_DIRS_RECOMMENDATION:' + dir) or
> > > > +                              "but it is expected to be empty")
> > > > +            msg = "%s installs files in %s, %s" % (pkg, dir, recommendation)
> > > > +            oe.qa.add_message(messages, "empty-dirs", msg)
> > > > +
> > > >  def package_qa_check_encoding(keys, encode, d):
> > > >      def check_encoding(key, enc):
> > > >          sane = True
> > > > diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> > > > index 80ad8e10d5..45cd01374a 100644
> > > > --- a/meta/conf/documentation.conf
> > > > +++ b/meta/conf/documentation.conf
> > > > @@ -345,6 +345,8 @@ PYPI_SRC_URI[doc] = "The URI to use to fetch from pypi, default uses pythonhoste
> > > >
> > > >  #Q
> > > >
> > > > +QA_EMPTY_DIRS[doc] = "A list of directories that are expected to be empty."
> > > > +QA_EMPTY_DIRS_RECOMMENDATION[doc] = "This specifies a recommendation for a directory why it must be empty, which will be included in the error message if the directory is not empty."
> > > >  QMAKE_PROFILES[doc] = "Specifies your own subset of .pro files to be built for use with qmake."
> > > >
> > >
> > > This triggered:
> > >
> > > ERROR: apt-2.2.4-r0 do_package_qa: QA Issue: apt installs files in /var/volatile, but it is expected to be empty [empty-dirs]
> > > ERROR: apt-2.2.4-r0 do_package_qa: Fatal QA errors were found, failing task.
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/915/steps/12/logs/stdio
> > >
> >
> > meta-openembedded layers report a few too see
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1675
>
> I have sent a patch series to openembedded-devel now that should cover
> these.

FWIW there are few more failures found
https://errors.yoctoproject.org/Errors/Build/135082/
I am looking at iptraf-ng and monkey

>
> > >
> > > Cheers,
> > >
> > > Richard
>
> //Peter
>

