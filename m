Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.2385.1616874857713488692
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Mar 2021 12:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LHCSJORZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id z8so11243901ljm.12
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Mar 2021 12:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+m+SQFnCIWSQpvPcY28Q5xfcYbZy2sX16qqf+l4y8es=;
        b=LHCSJORZruWnkOLyUfZSAGk9VZ0+M9/95fJGBIHySmS8yO5JyCf8dGLPzy/AIBlNFM
         Fb0UYpiXZoej7P2eIIQDZraW+axQlqVHFKjns8P6uWLa2bqSPl8NdOurtzglOlhOZ6Wf
         0UKtR7Y/DZN0OROI+nhXjsr1DcL5Ar0WXtGiGngwxOyP0fx8MI79jd1F5W/1XCGz8TtZ
         N6Y+/traFi5nIQtBv956IiYyo0dI6sLQ2NrzbPkG4GhuVHK9Q0j8x26Vpi6B0Q0IxqCj
         TObmNIrKJKx/tBW7nj042T3nLjdm6s0cGPTUQerT3DQI1KQf0nvx3aEKpr5wLgDcV9Wu
         Dr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+m+SQFnCIWSQpvPcY28Q5xfcYbZy2sX16qqf+l4y8es=;
        b=YKKDJh2KWU/ozcP7KvBET4HIwIr/5UxoT0J9oWixUwP6mfpoEwKg5D8zS9Wc1wqamF
         Y0rHvWV/WnCPI6Oc4/rsU8GwWdEBP69hQXeCIgFZRl806iGKPXnC0mF7A38YqitkXhqQ
         Xeq3+xr74senlxWa8yPHQZfdfbCqLveXIemrVskq02jvnWkvrgTCJIIXK1nQatYydbBo
         xVP7o9WHWzXRLJtW+2LsNXM5ihQuNQDS15tO9mRQTaIsqiOeRgpK8FelFYfDcjd5EK0I
         RTfzmuhzKpTpO2Je7yti/VkjCpb87QNlvIwx+i8jeM99LDXCGjr9umf2w8CAkRuGUeno
         1Biw==
X-Gm-Message-State: AOAM532g61SCGcUuan1axIO6uRtSC83hmbJRCSwD6HqZiHPph6z7WZSA
	NXyUtjJBnlLHlntU3ZwilIRNAnRlO7enXf5xhh0=
X-Google-Smtp-Source: ABdhPJyhn+yd4+35hw1dcc0dq0G42nMydvZ31a0N2tNyuOlHe64lZpPrG9uLQrqc1/FAWzPe14bo3ghIZRyxR2TXIfE=
X-Received: by 2002:a2e:9143:: with SMTP id q3mr6544745ljg.378.1616874855705;
 Sat, 27 Mar 2021 12:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <117b58d-f7c6-6187-dc33-66d75292cc58@crashcourse.ca>
 <CAJ86T=W8ooDN4td5n1-c_WDpUV6P3wwHQP_f2QyOSYdRXHK_Ag@mail.gmail.com> <30fe8fd8-11e0-cab0-223-d5676cdffd@crashcourse.ca>
In-Reply-To: <30fe8fd8-11e0-cab0-223-d5676cdffd@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Sat, 27 Mar 2021 12:54:04 -0700
Message-ID: <CAJ86T=XDgLSZNix9mkxq=tctFacoji-nAHW44jWY-cgoGXAomQ@mail.gmail.com>
Subject: Re: [OE-core] some trivial(?) questions about packagegroups
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 27, 2021 at 3:31 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Fri, 26 Mar 2021, Andre McCurdy wrote:
> > On Fri, Mar 26, 2021 at 8:45 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >   what should be easy questions about packagegroups, inspired by my
> > > running across some puzzling packagegroup recipes in my travels
> > > recently. (i'll start with examples out of oe-core).
> > >
> > >   first, as with any other recipe, given a "trivial" packagegroup
> > > like, say, packagegroup-core-eclipse-debug.bb:
> > >
> > >   SUMMARY = "Remote debugging tools for Eclipse integration"
> > >
> > >   inherit packagegroup
> > >
> > >   RDEPENDS_${PN} = "\
> > >     gdbserver \
> > >     tcf-agent \
> > >     openssh-sftp-server \
> > >     "
> > >
> > > there is no need to add a "PROVIDES" line since every recipe file
> > > automatically provides its own name. so far, so good.
> > >
> > >   if we move up to packagegroup-core-nfs.bb, note how this recipe file
> > > defines two additional packagegroups, and has to add a PROVIDES line
> > > in order to make those new names accessible:
> > >
> > >   PROVIDES = "${PACKAGES}"
> > >   PACKAGES = "${PN}-server ${PN}-client"
> > >
> > >   SUMMARY_${PN}-client = "NFS client"
> > >   RDEPENDS_${PN}-client = "nfs-utils-client"
> > >
> > >   SUMMARY_${PN}-server = "NFS server"
> > >   RDEPENDS_${PN}-server = "\
> > >     nfs-utils \
> > >     nfs-utils-client \
> > >     "
> > >
> > > so the question is, must one supply a PROVIDES line for any
> > > packagegroup names above and beyond the one that comes with the recipe
> > > file itself? i ask what seems like a dumb question as i've run across
> > > packagegroup recipe files that define multiple additional
> > > packagegroups, but do not add them to the PROVIDES line. what is that
> > > supposed to represent?
> >
> > PROVIDES sets up a name which can be used as DEPENDS (ie a build
> > time dependency) in other recipes. If PROVIDES contains more than
> > one name, they all just become aliases for each other.
> >
> > Since packagegroup recipes only define run time dependencies,
> > nothing should have a build time dependency on a packagegroup
> > recipe... and so there's no obvious reason to set PROVIDES to
> > anything. Leaving the default will be fine (although it won't be
> > used for anything).
>
>   i could have *sworn* that, once upon a time, i verified (in some
> weird way) the necessity for the PROVIDES line in a packagegroup, but
> it seems i was mistaken. so if this is the case, then why do a couple
> of OE packagegroup recipe files contain such a line?
>
>   packagegroup-base.bb
>   ====================
>
>   inherit packagegroup
>
>   PROVIDES = "${PACKAGES}"           <=== ?????

That line dates back to 2007, when packagegroup-base.bb was still
called task-base.bb:

  https://git.openembedded.org/openembedded-core/commit/?id=ba9dd5228c290c96c622fb82964e49ce2511a1e9

Maybe it had some legitimate use back then?

Really the whole "base packagegroups" concept is showing its age. No
one creating a new machine config today ponders on whether or not to
enable the pci, pcmcia, phone, etc machine features.
packagegroup-base.bb contains a lot of useless cruft... the bogus
PROVIDES line is just the tip of the iceberg.

>   PACKAGES = ' \
>             packagegroup-base \
>             packagegroup-base-extended \
>             packagegroup-distro-base \
>             packagegroup-machine-base \
>             ... etc etc ...
>
> surely this is not meant to alias all those distinct packagegroup
> definitions.
>
> rday
>
> p.s. see also,
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
