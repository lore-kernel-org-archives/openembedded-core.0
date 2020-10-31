Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.3923.1604104874644388267
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 17:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GnDk69Nl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id v5so4343903wmh.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 17:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=RvJL0HBERyNGH9ruDmK8b2+RAHqs5jyP71WkRL6C8dE=;
        b=GnDk69NlCm4mFxKA0kopEyA7K7i7m2A/oRI/KzptpzRxciBosxifIJbPv2k/CeCoW2
         SHEb22PHNLPmooH0ESaoW7GSt8j60RsyQzz5yFtAKMecrdyGtrUcd1KxdFx9B1CTvKQZ
         ZtyyzAsZG81lAs2IXIoZQY5bhttE7xA8X/AYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RvJL0HBERyNGH9ruDmK8b2+RAHqs5jyP71WkRL6C8dE=;
        b=TbVQZz/RYrC4nZxP+jFZhSk/64oNu6Lc7li3ZsxznoIuKSzXDlpS/UmhEHDXCw63Qy
         OoyX6xv0+ZOv2rQsQ4Mmay7Biv0AOeWLHBtxERFvgRMoKb78fRVpW5gkhUAUFsAroBdP
         rOkAVu281A8vrykXhlrvRFMWtkcbVharLaTuW8Wk2baObSaHBb02kfSzDYWzG6w+53OI
         xH2X/am5Pwjc8XFIx0bGNLU2LWdiMkRaAi0hNv4FeEz8FxV24uw7+cAIrS32mhXj786M
         okizA5f0k6JH88s6f2LzjnaJh/c4Ah8WNacJXAyfo/+r3BgDWkRwNtO4pJnZISU33lDN
         5xSw==
X-Gm-Message-State: AOAM5309bdHrHqtvQkhPX5Op+br3oWFxqnCr7GqETBUzdAaPEKMLsoV9
	GN09g2KZPJdTeegbZW8GZYs2WQ==
X-Google-Smtp-Source: ABdhPJxZEd02v0XW1FeErtmiVjGB5n/EY3bVZWj4/NtOdXpXD7IOQ1wiW3tECSAHcLiCixDvzXHMKg==
X-Received: by 2002:a7b:cc0e:: with SMTP id f14mr1686364wmh.92.1604104872830;
        Fri, 30 Oct 2020 17:41:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id c8sm11687535wrv.26.2020.10.30.17.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 17:41:12 -0700 (PDT)
Message-ID: <a658cccc9893a80ca5c0508898b183470800c158.camel@linuxfoundation.org>
Subject: Re: [OE-core] openssl: Proposal to stop creating /etc/ssl/certs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: nate.karstens@garmin.com, openembedded-core@lists.openembedded.org
Date: Sat, 31 Oct 2020 00:41:11 +0000
In-Reply-To: <xP9d.1604078731359224154.jFZQ@lists.openembedded.org>
References: <xP9d.1604078731359224154.jFZQ@lists.openembedded.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2020-10-30 at 10:25 -0700, nate.karstens via
lists.openembedded.org wrote:
> Greetings,
> 
> The openssl recipe installs an empty folder /etc/ssl/certs. This is
> eventually where other recipes like ca-certificates can copy CA
> certificates for the system. We are working on a tool that can hot-
> swap those certificates at runtime. The only way to have this
> transition be seamless and atomic is to make /etc/ssl/certs a symlink
> to another folder that contains the actual certificates; to update
> the certificates we just replace the symlink.
> 
> Our recipe for this tool conflicts with the empty folder in the
> openssl package. We were wondering if it made sense to change the
> openssl recipe to no longer create this folder, the idea being that
> recipes that populate the folder (like ca-certificates) would be
> responsible for creating it.
> 
> Here is a link to the recipe:
> 
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> 
> Line 135 does contain a note that Debian sets up the SSL structure.
> Creating a placeholder for where CA certificates would eventually go
> makes sense with certain systems. There could be desktop distros that
> rely on the user to manually install the certs they need for their
> organization and providing a location for this would be helpful. I
> don’t think this makes sense for the typical embedded system where
> this folder is on a read-only filesystem.

If that folder is empty, I don't see why we can't rely on the
certificate providers to create it.

> I've just been testing locally with a bbappend that uses rmdir to
> remove the folder, but unless there are objections I will submit a
> patch that removes lines 137 (moving the 'mv' to the next line) and
> 144. I think line 152 can remain in case the variable is useful to
> anyone.

If you remove 152, it will break things as we do need the wrapped tool
to be able to find the certificates. I'm also wondering what is using
the link created by 144, it could be openssl itself. I suspect you may
want to leave it as a dangling symlink and just let the certificate
provider create the directory it points to?

Warnings about the dangling symlink may be why an empty directory is
being created?

Cheers,

Richard


