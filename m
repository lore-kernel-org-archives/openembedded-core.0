Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.8759.1589298892265507052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 08:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OsFovxdJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id n14so14088721qke.8
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 08:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N8cHbEfmnP6zAUctYDb5JhruSsyOAvyrQM1t1ZHpsq4=;
        b=OsFovxdJRcpMaYEBmM65XeXGwnb0ioq2Y3ojRpbjmVxkY507SQaCoBL7Ravg/cQtsz
         4qPp+i156vS0k66C1Rx0bcAtokAauMaX5u1Rg6F599c0gqjgjFx5jKWnhWYpnHgpcvxT
         ahKsRFf3HKAgPv36lJo27UCDXjZLGmj+lxP9Z2VNoNtEF8ywrD+VaywcAJTJETSDHXMM
         svZeWPMX6GBB7JQCpERfQQQ6Ybi8hnTvLPcTYfK8FJUTu+0VaPBnzU6MCuag58RI+2vG
         vhrdnASIDJqFMGP63dse/A9A8g9PAiqafX8F7p/4s4u4guc0nbfmX7h5QE6/IZ5XKZvq
         LHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N8cHbEfmnP6zAUctYDb5JhruSsyOAvyrQM1t1ZHpsq4=;
        b=JFSbmBO4gwZuVEiWoYmhC4VT/Cls3xB2m85GenesJMm8DsnMEHyV6hbSE98AyKZMV6
         WJpuivIuNUYhyqLGC37hVs4G4Iq+q3aAcIPDKEoERiwZdDF2au2LCYSR/7llal5bCaul
         KmqZKKrGiMD1H4k5kE5eD9lAvYdm+jAE51uUDaAZGjhvj6zXI6MvouHmFmaU6WTsmCDe
         QMEoffzuoYZ8h4fg2pYUsvVNM4ny9HGqvHkT71fq1Ol/wAoJvKay8IOezQSyIXfrarbN
         UsMT92YZ6fPmlqhNktNmkaeMUnK+fI9ItKnU0+SIiS3apwJ9zed9CoJGrMDddBK6gvyu
         Sx5A==
X-Gm-Message-State: AGi0PuZTGDHpG25zemac0FfxrjqA4QzLccyPGDokgfNyJP5Z/8hC1iKw
	dyWCPh1nFmAw3R8kVAQojky79IdzpsawTweDLyiMH8uM
X-Google-Smtp-Source: APiQypKv5+rcmp8KBHF52nGw4udWVPZxSMcuSkLikEzFfxn+ZaylcFDOcMSy4lVePtqTexxQqWq/fva3Mmgk87HTIkA=
X-Received: by 2002:a37:7143:: with SMTP id m64mr22992329qkc.215.1589298890922;
 Tue, 12 May 2020 08:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200511182812.441561-1-raj.khem@gmail.com> <20200511182812.441561-2-raj.khem@gmail.com>
 <20200512134442.GA11943@localhost> <cd4b38c5-391f-5915-1246-4f04897f7341@gmail.com>
 <20200512154007.GD11943@localhost>
In-Reply-To: <20200512154007.GD11943@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 12 May 2020 08:54:24 -0700
Message-ID: <CAMKF1sruCDpd7A6Zix3QzYBp4rw5C6LkpYYoeEVk6erXtx6yuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3 2/3] gcc10: Default back to -fcommon
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 12, 2020 at 8:40 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, May 12, 2020 at 08:16:14AM -0700, Khem Raj wrote:
> >
> >
> > On 5/12/20 6:44 AM, Adrian Bunk wrote:
> > > On Mon, May 11, 2020 at 11:28:11AM -0700, Khem Raj wrote:
> > > > For time being change back to -fcommon as default, helps us iron
> > > > out other issues, eventually this should be removed as we fix the
> > > > packages to work with -fno-common
> > > > ...
> > > What packages are still unfixed?
> >
> > There were ateast 100 failures when meta-openembedded
>
> Ah, you want that for other layers.
>
> > is considered too
> > errors server has unfortunately dropped the build where it was reported but
> > here is list if you are interested
> >...
>
> That's from a testbuild last year?
>
> Some of these were already fixed in master by upgrading to the latest
> upstream (e.g. flashrom or mc).

right, so the idea is to get gcc 10 working without shaking the boat
first and then switch to -fno-common


>
> cu
> Adrian
