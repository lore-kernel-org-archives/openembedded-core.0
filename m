Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.7355.1589952918847166665
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 22:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O4E6V8tR;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id s1so2407845qkf.9
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 22:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rBpgfDGBDU4HUmtZPOg4MZqBJmo9Z3k59b8p4Z+CCSA=;
        b=O4E6V8tROvgQENOO8nbEYU1VtzeXb+dOSQrWVtKDajaPul/eXExj3BsPPxWxvM1hhz
         mJmbqEbpWH55MbA5zAoftJ+ymmlHC4WwDizUmgvBPQnTsaiTTNITTEvROnDpZnXI29vg
         TfPqUfbv83CStmJ2NvsyrJ8Sr8NtyahzrwFWiGGhQNM8toGBUUdsPfRHRJDgJxKr7+pK
         69oa1jJLFtiJoel5QBtI2YPKq2ojy2CA/GwZuv5B2aRXhuYO9dZOQvKUGYUKAp76pdSj
         jUb2S9bF66hSAM7Vn+8Ztcpg7K4NTOhgztFPnozjYGALSC0M9EFBMmVb0NVtbnt34l9U
         tFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rBpgfDGBDU4HUmtZPOg4MZqBJmo9Z3k59b8p4Z+CCSA=;
        b=FhdptSwaIBbzW6UEU9K7sbjQTkXK2ROMPoH7oyXBDIkqBXVn0FM+DE2fMN86SW34gy
         H6gqLyKVh5znkSYkSX7WyCjr8PbGGHYq2wt7fnYtMed1yTKwgP0Th1w5IwUTw1mtvuc9
         ERzitkIWeQ+G6M4X1Rs28IqQUy7OGQBNzKK3guS3osWEfjNoehcVxUncQleJs/Ml7sWT
         pFEx6bMOOGNzNQUuqHrrNROk4IiubItWwSQchL1cdthfAfwyn7YKAaTmRYqsnO2Vj7lk
         TCHvvqNIeGbJvk6bAoj6PFO8xbpnTf3cI+JnTlJuZKZ/6Zhh1Hg9MHYjVOEXXcRojij/
         lUtw==
X-Gm-Message-State: AOAM531TNoaf10UmYQCivejOjbhe19fhq2Z7GUZyYGKkQWGjakNl8T4Z
	24pjVikp1dB2am1pCx2CGMGyeIHMpjJsj5cB7rA=
X-Google-Smtp-Source: ABdhPJyfI6iBktwZjKEgqehkYq14rMBbOQz9X7Btm6+OnjcsV47JwukdqYOLtXJlELzOer95CBAAi7aP43gbrbQlHEE=
X-Received: by 2002:a37:a694:: with SMTP id p142mr2982726qke.165.1589952917608;
 Tue, 19 May 2020 22:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <AM7PR05MB68813C6F4A99F236D682914CA8B90@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <4c0bdb8031119a16004ecf9aa5d1a19dc0ec397d.camel@linuxfoundation.org>
 <CAMKF1sqXcOgUUcay18or1dg_1ESbZEa6RFB=i_vPqC74-eXepQ@mail.gmail.com> <AM7PR05MB6881DD5067E7598DE651788FA8B60@AM7PR05MB6881.eurprd05.prod.outlook.com>
In-Reply-To: <AM7PR05MB6881DD5067E7598DE651788FA8B60@AM7PR05MB6881.eurprd05.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 19 May 2020 22:34:51 -0700
Message-ID: <CAMKF1spmXOYsy8tQMYBXEeke6gqOOAMF=KUAgkuQbibtttiA7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_ipk.bbclass: print opkg output on error
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 19, 2020 at 10:07 PM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> Hi all,
>
> I don't like the idea of wrapping subprocess.check_* calls once more.
> IMHO too many possible workflows are possible so chances are low
> catching them all appropriately.
>
> check_output is a wrapper around subprocess.run, which is a wrapper
> around subprocess.popen which is wrapper of popen, so an additional
> wrapper doesn't sound like the best idea so far.
>

right, that's what I was contemplating as well.

> I'm okay with generalizing the output of a failed call so maybe just
> http://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/lib/bb/utils.py#n330
> could be used more widely.
>
> It all comes down to handling subprocess failures and in this particular
> case it was simply missing.
>
> Long story short, I'd rather fix them one by one (with respect to actual
> code flow) than abstracting things even more.
>
> Regards
> Konrad
>
> On 20.05.20 00:14, Khem Raj wrote:
> > On Tue, May 19, 2020 at 3:02 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >>
> >> On Tue, 2020-05-19 at 20:36 +0200, Konrad Weihmann wrote:
> >>> in case the opkg command fails in before no output of the tool
> >>> itself was printed to assist the user with debugging the issue.
> >>> Print all output of the tool by using CalledProcessError wrapper around
> >>> the call
> >>>
> >>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> >>> ---
> >>>   meta/classes/package_ipk.bbclass | 11 +++++++----
> >>>   1 file changed, 7 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> >>> index c008559e4a..5e7d552cc5 100644
> >>> --- a/meta/classes/package_ipk.bbclass
> >>> +++ b/meta/classes/package_ipk.bbclass
> >>> @@ -223,10 +223,13 @@ def ipk_write_pkg(pkg, d):
> >>>               conffiles.close()
> >>>
> >>>           os.chdir(basedir)
> >>> -        subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
> >>> -                                                          d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
> >>> -                                stderr=subprocess.STDOUT,
> >>> -                                shell=True)
> >>> +        try:
> >>> +            subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
> >>> +                                                            d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
> >>> +                                    stderr=subprocess.STDOUT,
> >>> +                                    shell=True)
> >>> +        except subprocess.CalledProcessError as exp:
> >>> +            bb.fatal("{} failed with {}: {}".format(exp.cmd, exp.returncode, exp.output.decode("utf-8")))
> >>>
> >>>           if d.getVar('IPK_SIGN_PACKAGES') == '1':
> >>>               ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
> >>
> >> I get the feeling we have a problem with our subprocess calls and
> >> debugging but its hard to know what to do about it. We can patch each
> >> call site like this but it starts to make we wonder whether we need a
> >> general wrapper, or we're missing something in bitbake or elsewhere to
> >> help with things.
> >>
> >> There is this code:
> >>
> >> http://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/lib/bb/utils.py#n378
> >>
> >> which is meant to help but it clearly isn't helping/catching all cases.
> >>
> >> I think we are going to need to look at a wider/more general solution
> >> or at least have a plan for one.
> >>
> >
> >
> > are you think of wrapping subprocess.check_output calls with some post
> > processing ?
> >
> >> Cheers,
> >>
> >> Richard
> >>
> >> 
