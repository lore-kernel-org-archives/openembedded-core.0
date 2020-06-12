Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.19858.1591968489927215892
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 06:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pu9ocCSM;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id p20so10059705ejd.13
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 06:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ACrmJei8sna+8HYe9LczwZh5KR0oK1aB6kfRsJSjQWw=;
        b=pu9ocCSMolTyzVqFJ3pfiZyIF+1Wx8JFbGyDtqsWy1KhVtWdNUuQnwMvG9UFCJXSLG
         v9YYjYc9sem0+5eaWmZ3rRKPpZTFk/axwCXFnJAaon59NBa+GCFbOcS3wZ19MQRLolwM
         jiT/p+UdEZDJu7izQ7wewA+wzr1yC2omOe663wqqqOcQ9sjPrlv0g4CidRY2zY7En3w3
         eRqIwYjhC//DAhkH6Ef83b34Va8x+1GQsAgDsarwpxPfzBHhIJs3kfIucpIzxyIg5rrp
         +QOUsbn1WhIOFKQqTb9gkPygdARmIwM43a/eYYSUix8Vk3yX7eQ8kiFbd6QQ5HxsaYYS
         rHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ACrmJei8sna+8HYe9LczwZh5KR0oK1aB6kfRsJSjQWw=;
        b=qmnVK10OxmPsC1J2jwv5FtOxsQxux29xhIdPqyhMsohjxbDNt+NNKfIX3JSsP++Tmi
         LV6zWLgMJA2nDCf7nTo+iWjIJHna0WhbkfTHCZZIoya0HbAQxjb5OVGRV3Uam8JGxFiR
         FC49+KxnJkgDy9O/7LdP8o0JgfzfLFctBdmqRsVNmkrsY+jbRWahXZgqexU+xQ1XV/FQ
         e1GEyw1JvsWl1a4wwsVM4wQCC3Rlia4KMdzeE3zjx0QKbvKItwnqfStcu7w6rqMtJ/3s
         BNYyxgAXWUyHdVmmtYV3YwgnWOnEkJSz5ZBXXJWo+N5lXy3tjRQLIS0iTBFGyD9dTCDW
         kMDg==
X-Gm-Message-State: AOAM5311+I6qTqqb1v5u5Ygl5qXWI9kU7B2yT6Am/oAQGPqffhoVrBZz
	1MpE46TSVqiK7Ck35jxVjQkRJcrzouYdKdMK8pA=
X-Google-Smtp-Source: ABdhPJzb8aNJRwbDIMz25zVKEZnyBzUA4Jeicsz9tlTRbXErxWprCC60uwiOoiwOfhbyR09fpIWxiz/AXMICJZoYweg=
X-Received: by 2002:a17:907:9495:: with SMTP id dm21mr12976208ejc.357.1591968488288;
 Fri, 12 Jun 2020 06:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <1616D997B5533366.13968@lists.openembedded.org> <cbb726f7-954b-bdca-66fa-6ab9996eaa1c@windriver.com>
In-Reply-To: <cbb726f7-954b-bdca-66fa-6ab9996eaa1c@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 12 Jun 2020 09:27:56 -0400
Message-ID: <CADkTA4NX63Fgs-C23z8=uFmxsaR4PQY9WsRFNJk2jLHt6g47ww@mail.gmail.com>
Subject: Re: [OE-core] kernel: update rpm failed for the vfat
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: He Zhe <zhe.he@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 12, 2020 at 3:47 AM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>
> Ping Bruce.

Hmm, yes. I did miss the original message.

gmail isn't as effective at highlighting messages that are to me (and
also to the list) as I would like.

>
> On 6/9/20 6:32 PM, Xu, Yanfei wrote:
> > Hi Bruce,
> >
> > I encountered an issue that updating kernel rpm package will fail when
> > the /boot dir was mount with vfat filesystem. The root cause is vfat
> > don't support symlink.
> > --------cut here----------
> > error: unpacking of archive failed on file /boot/Image;5eda8385: cpio:
> > symlink failed - Resource temporarily unavailable
> > error:
> > kernel-image-image-5.4.43-yocto-standard-5.4.x+git0+f8c88c4331_9961cc8b79-r0.bcm_2xxx_rpi4:
> > install failed
> > root@bcm-2xxx-rpi4:/boot#
> >
> > Currently I have two ideas to fix it:
> > 1. we use 'install' cmd instead of 'ln -sf' in kernel_do_install to
> > avoid generating symlink in kernel-image-image*.rpm. And then add an
> > postinstall to this rpm. It will check if the /boot dir is vfat, if not,
> > we remove the copy image* and make a softlink for the image.

Note that for this option, you have to make sure that it really is
done in a post install or you end up with overlapping file errors in
scenarios where multiple kernel packages are installed (i.e. an
upgrade).

> > 2. we specially add an package type which doesn't contain symlink for
> > the vfat filesystem.
> >
> > For the first idea, I met an problem when I try to add
> > pkg_postinst_packagename function in kernel.bbclass file. Due to there
> > are not package name variables defined for the kernel-image-image.gz
> > kernel-image-image or other type kernel images. So I can not add
> > postinst functions statically why that how many packages and packages'
> > name are not certainly.

You can still generate the package names in python, i.e.:

        d.setVar('pkg_postinst_ontarget_%s-image-%s' % (kname,
typelower), 'ln -sf ' + type + '-${KERNEL_VERSION}
/${KERNEL_IMAGEDEST}/' + type)

that's from a patch that I've had locally for a while, that deals with
kernel upgrade issues.

Any logic that deals with this really does have to be on target,
otherwise, information about the image (and partitions) is leaking
into the packages, and you'd need to carry specific image package
lists for the filesystem layout.

My suggestion for the post install is that it simply try and create
the symlink, and if that fails, then do a copy. That way there's no
need to detect filesystem types, etc.

You also need to ensure that you test the kernel upgrade path, since
with copies, you may end up with more kernel images around boot and
not get some of the implicit cleanup that you get by simply
redirecting a symlink (but if you are always copying the active kernel
to "image", then simply overwriting the target will get you that same
cleanup).

Cheers,

Bruce

> >
> > Do you have any opinions about these?
> >
> >
> > Regards,
> > Yanfei
> >
> > 
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
