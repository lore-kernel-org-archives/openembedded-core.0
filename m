Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.33114.1631004420963000029
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 01:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:46726 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mNWkt-0001du-UE; Tue, 07 Sep 2021 04:46:59 -0400
Date: Tue, 7 Sep 2021 04:46:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Andre McCurdy <armccurdy@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] minor curiosity related to libdir vs base_libdir and shared libs
In-Reply-To: <CAJ86T=WPxc0CwcPTmqcg+fc=56F01zjhuCdf4pmcfrernb8jqA@mail.gmail.com>
Message-ID: <6eab2b8f-62fc-1d59-85a4-3f52d56aec63@crashcourse.ca>
References: <131c1b19-2676-211e-c2db-a3827d597094@crashcourse.ca> <CAJ86T=WPxc0CwcPTmqcg+fc=56F01zjhuCdf4pmcfrernb8jqA@mail.gmail.com>
MIME-Version: 1.0
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

On Tue, 7 Sep 2021, Andre McCurdy wrote:

... snip ...

> The original commit from 2013 gives a few more clues in this case:
>
>   https://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux/commit/?id=587fdba43a7747992995029a88d3051ef0efe7f6
>
> It's not explicit which QA test was being triggered but presumably
> it was "unsafe-references-in-binaries", which has since been dropped
> from oe-core:
>
>   https://git.openembedded.org/openembedded-core/commit/?id=a6af5bbf3dad6f0951c67a0aae13ef86a8906893
>
> So... it looks like these examples of moving libs to base_libdir are
> obsolete and can be dropped.

  just for fun, there is the occasional recipe that relocates stuff in
the *other* direction, like this from e2fsprogs_1.46.4.bb:

  do_install () {
        oe_runmake 'DESTDIR=${D}' install
        oe_runmake 'DESTDIR=${D}' install-libs
        # We use blkid from util-linux now so remove from here
        rm -f ${D}${base_libdir}/libblkid*
        rm -rf ${D}${includedir}/blkid
        rm -f ${D}${base_libdir}/pkgconfig/blkid.pc
        rm -f ${D}${base_sbindir}/blkid
        rm -f ${D}${base_sbindir}/fsck
        rm -f ${D}${base_sbindir}/findfs

        # e2initrd_helper and the pkgconfig files belong in libdir
        if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
                install -d ${D}${libdir}
                mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
                mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
        fi
        ... snip ...

and libusb1_1.0.24.bb:

  do_install:append() {
        install -d ${D}${libdir}
        if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
                mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
        fi
  }

anyway, i'll let others decide if that's worth tidying up.

rday
