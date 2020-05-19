Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.1302.1589926480358756699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 15:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xk2pn9cV;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id p4so412924qvr.10
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 15:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vm6crzNv81deneCM4iSDqb+F64B8NfTV9/a/k+Ho1kE=;
        b=Xk2pn9cVsitMeUZjnBLAQ5UqGsz7oYqXTu9hhb/zDuwq7hIBygEK5vPtkeI5r7fXOP
         SFNq+JlS9Dv7qSUosrkepUA64q2997kDkT16NeSQkrZRAVzsUyCu68ksIHnCUCSKhi+x
         DH6JgWaygDrqCAysPee6Iwlpo9YJYmBK3O0LL9OMYHnHdHz7MyggUC2LXsRMCvP8pwfs
         GBZM86TLzRPKDND1sQE9qmc4Zd/A7Ih4NvylMaIRhBOxDWSKfxc1A8S4ByLwFzfOqu9v
         AUEwp/a98kuND+ECkOcn4jig8HblXJ9osTIKXJW/pcwJadRjjUXobxqc/M82AASDHyPJ
         5SSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vm6crzNv81deneCM4iSDqb+F64B8NfTV9/a/k+Ho1kE=;
        b=PNv1655Guc/bTdCi1IpLSFVsvAUctD/+YmU3+eMgoVRVUGPG4pBcDHWHd4esaFyRyU
         ISrjJ3tluo0pKkZsOZhVbXoDZG9hfpG3fWr7GqmTYc7NBrgAVhAGPxpKD14A8gtXS7tA
         roeqfVVR/Z3KphDxbbp49eW5lBMGDJpTPL0hV2Z3CXoqHIn8/Dq+zJrkPj0NgleRM8ee
         4zKesRTGz6Rww+WE94Msn/oTLcNlQCbDHNNNSSDIMlh06xLmIBmVBZaJVNP5q0tx/7l7
         4nm5u0vCIKPXEiQxZodjHFQRTbj+Opa0i4q9DH+byOM/ddIgq/Ie+8c2lc206yGEsBKz
         i1PQ==
X-Gm-Message-State: AOAM533V0K1bJfpVIrTV/YHLkDgEj5JHife6kXtKy0TM+ixX3Cbc4xNI
	d81EDmfBLNynnDDTI7onbIZzeC367yuFraDHiLXrPhJT9b0=
X-Google-Smtp-Source: ABdhPJybFYQLPYVuaSTSLvn2bYkcfdqiYx9DidZJ7wvbYTtZBaS88yIsvBSa2IF35tzWunePfOOQxFA+ssDe/ohnqyc=
X-Received: by 2002:a05:6214:1248:: with SMTP id q8mr1911065qvv.130.1589926479400;
 Tue, 19 May 2020 15:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <AM7PR05MB68813C6F4A99F236D682914CA8B90@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <4c0bdb8031119a16004ecf9aa5d1a19dc0ec397d.camel@linuxfoundation.org>
In-Reply-To: <4c0bdb8031119a16004ecf9aa5d1a19dc0ec397d.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 19 May 2020 15:14:13 -0700
Message-ID: <CAMKF1sqXcOgUUcay18or1dg_1ESbZEa6RFB=i_vPqC74-eXepQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_ipk.bbclass: print opkg output on error
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Konrad Weihmann <kweihmann@outlook.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 19, 2020 at 3:02 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-05-19 at 20:36 +0200, Konrad Weihmann wrote:
> > in case the opkg command fails in before no output of the tool
> > itself was printed to assist the user with debugging the issue.
> > Print all output of the tool by using CalledProcessError wrapper around
> > the call
> >
> > Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> > ---
> >  meta/classes/package_ipk.bbclass | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> > index c008559e4a..5e7d552cc5 100644
> > --- a/meta/classes/package_ipk.bbclass
> > +++ b/meta/classes/package_ipk.bbclass
> > @@ -223,10 +223,13 @@ def ipk_write_pkg(pkg, d):
> >              conffiles.close()
> >
> >          os.chdir(basedir)
> > -        subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
> > -                                                          d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
> > -                                stderr=subprocess.STDOUT,
> > -                                shell=True)
> > +        try:
> > +            subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
> > +                                                            d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
> > +                                    stderr=subprocess.STDOUT,
> > +                                    shell=True)
> > +        except subprocess.CalledProcessError as exp:
> > +            bb.fatal("{} failed with {}: {}".format(exp.cmd, exp.returncode, exp.output.decode("utf-8")))
> >
> >          if d.getVar('IPK_SIGN_PACKAGES') == '1':
> >              ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
>
> I get the feeling we have a problem with our subprocess calls and
> debugging but its hard to know what to do about it. We can patch each
> call site like this but it starts to make we wonder whether we need a
> general wrapper, or we're missing something in bitbake or elsewhere to
> help with things.
>
> There is this code:
>
> http://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/lib/bb/utils.py#n378
>
> which is meant to help but it clearly isn't helping/catching all cases.
>
> I think we are going to need to look at a wider/more general solution
> or at least have a plan for one.
>


are you think of wrapping subprocess.check_output calls with some post
processing ?

> Cheers,
>
> Richard
>
> 
