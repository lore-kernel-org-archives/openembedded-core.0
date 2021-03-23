Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.6651.1616493552191000732
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 02:59:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:52338 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lOdob-00FTvK-TX; Tue, 23 Mar 2021 05:59:10 -0400
Date: Tue, 23 Mar 2021 05:59:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
cc: Andre McCurdy <armccurdy@gmail.com>, 
    OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] curious about weirdness in some FILES_${PN} settings
In-Reply-To: <1785e46db1e.bbb06229658121.7144680434793210206@ertelnet.rybnik.pl>
Message-ID: <55467497-8572-a32a-62b5-89df121374ed@crashcourse.ca>
References: <5a2c7beb-bc46-5528-c84-122ea0799c29@crashcourse.ca> <CAJ86T=VmDYxS5PjHazGUZD_NXeqsJ+uo=nmveGJjJrocyPVvng@mail.gmail.com> <1785e46db1e.bbb06229658121.7144680434793210206@ertelnet.rybnik.pl>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Mar 2021, Damian Wrobel wrote:

>  ---- On Mon, 22 Mar 2021 20:27:42 +0100 Andre McCurdy <armccurdy@gmail.com> wrote ----
>  > On Mon, Mar 22, 2021 at 11:43 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>  > >   (warning: i've just been handed an existing OE code base, and i'm
>  > > going to ask some questions about some head-scratching things i'm
>  > > finding in it, so be prepared for weird questions.)
>  > >
>  > >   in one recipe, i see the following snippet:
>  > >
>  > >   FILES_${PN} += "/etc"
>  > >   FILES_${PN} += "/etc/mosquitto"
>  > >   FILES_${PN} += "/etc/mosquitto/config"
>  > >   ... etc etc ...
>  > >
>  > > first, i'm taken aback by the hardcoding of "/etc" rather than using,
>  > > you know, "${sysconfdir}", so i'm *assuming* that unless someone was
>  > > doing something spectacularly clever here, that just can't be right.
>  >
>  > Nothing clever going on, it's just a bug. In general, using /etc
>  > instead of ${sysconfdir} etc will appear to work fine until you add
>  > BBCLASSEXTEND and try to build <recipe>-native, at which point things
>  > will start to fail in mysterious ways (since native.bbclass over-rides
>  > the default values of ${sysconfdir} etc).
>  >
>  > In this particular case, you might still get away with it since
>  > FILES_${PN} is related to packaging and -native recipes don't do any
>  > packaging but it's still not right.
>  >
>  > >   more to the point, the above seems redundant -- once you've added
>  > > "/etc", isn't the rest just superfluous? i'm not sure what the
>  > > original developer was going for here. thoughts?
>  >
>  > Yes, and even beyond that, ${sysconfdir} is handled by the default
>  > packaging rules, so any extra packaging rules related to adding files
>  > from /etc to the default package are redundant.
>  >
>  > >   finally, if i wanted to add all of some directory, say "dir", it was
>  > > my understanding that all of the following were equivalent (hmmmm,
>  > > short of picking up hidden files, i guess):
>  > >
>  > >   dir
>  > >   dir/
>  > >   dir/*
>  > >
>
> Normally in the RPM world it matters if you gonna own a directory with all files in it
> or just the directory or the file inside the directory but not the directory itself.
> You can read more about it in  Fedora packaging guidelines "Unowned Directories"[1].
>
> However, I'm not sure how this is implemented in yocto/bitbake if at all, as I couldn't find any
> similar recommendation in [2]. You can always check who owns what using rpm tools like rpmls, rpm -qlv
>
> Here is the real example from Fedora where the directory is owned by different package then
> files inside a folder:
>
> $ rpm -qf /etc/sysconfig/
> filesystem-3.14-2.fc32.x86_64
>
> $ rpm -qf /etc/sysconfig/atd
> at-3.1.23-4.fc32.x86_64
>
> This means that 'at' package doesn't need to create '/etc/sysconfig' directory and conversely removal of the
> 'at' package will not remove the '/etc/sysconfig' directory even if it was empty.
>
> [1] https://docs.fedoraproject.org/en-US/packaging-guidelines/UnownedDirectories/
> [2] https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#var-FILES

  i'm familiar with the RPM packaging standard, and i'm fairly
confident that how it works doesn't map directly to how OE does this.

rday
