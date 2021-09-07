Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.33430.1631003678952348444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 01:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:46724 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mNWYv-0007KK-0l; Tue, 07 Sep 2021 04:34:37 -0400
Date: Tue, 7 Sep 2021 04:34:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Andre McCurdy <armccurdy@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] minor curiosity related to libdir vs base_libdir and shared libs
In-Reply-To: <CAJ86T=WPxc0CwcPTmqcg+fc=56F01zjhuCdf4pmcfrernb8jqA@mail.gmail.com>
Message-ID: <78717fcf-4baf-4bc8-9ae7-f0a4ae376498@crashcourse.ca>
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

> On Sun, Sep 5, 2021 at 1:02 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >   a minor oddity i stumbled over digging into the proper installation
> > of shared libraries ... building core-image-minimal for qemuarm64 and,
> > for the most part, recipes from oe-core that install shared libs put
> > all three artifacts (real name, so name and linker name) under
> > /usr/lib, as in:
> >
> >   ./libtirpc/1.3.2-r0/image/usr/lib/libtirpc.so
> >   ./libtirpc/1.3.2-r0/image/usr/lib/libtirpc.so.3
> >   ./libtirpc/1.3.2-r0/image/usr/lib/libtirpc.so.3.0.0
> >
> > however, the *occasional* recipe chooses to -- for whatever reason --
> > distinguish between libdir and base_libdir. for example, here's the
> > result of installing tcp-wrappers' shared libs in its ${D} directory:
> >
> >   ./tcp-wrappers/7.6-r10/image/lib/libwrap.so.0.7.6
> >   ./tcp-wrappers/7.6-r10/image/lib/libwrap.so.0
> >   ./tcp-wrappers/7.6-r10/image/usr/lib/libwrap.so
> >
> > this is due to the following manual override in tcp-wrappers_7.6.bb:
> >
> >   do_install () {
> >         oe_libinstall -a libwrap ${D}${libdir}
> >         oe_libinstall -C shared -so libwrap ${D}${base_libdir}
> >
> >         if [ "${libdir}" != "${base_libdir}" ] ; then
> >                 rel_lib_prefix=`echo ${libdir} | sed 's,\(^/\|\)[^/][^/]*,..,g'`
> >                 libname=`readlink ${D}${base_libdir}/libwrap.so | xargs basename`
> >                 ln -s ${rel_lib_prefix}${base_libdir}/${libname} ${D}${libdir}/libwrap.so
> >                 rm -f ${D}${base_libdir}/libwrap.so
> >         fi
> >         ...
> >
> > so this recipe -- after doing the *default* shared lib installation
> > via oe_libinstall() -- conditionally chooses to override that.
>
> git blame is often the best starting point for understanding why
> things are done in a certain way. In this case the comment from the
> original comment (from 11 years ago..) references portmap, which is no
> longer supported by oe-core:
>
>   https://git.openembedded.org/openembedded-core/commit/?id=6ffc4f2e04f2d405b14f198220a3613d386489e7
>
> >   another recipe that is even odder is libcap-ng:
> >
> >   ./libcap-ng/0.8.2-r0/image/lib/libcap-ng.so.0.0.0
> >   ./libcap-ng/0.8.2-r0/image/lib/libcap-ng.so.0
> >   ./libcap-ng/0.8.2-r0/image/usr/lib/libcap-ng.so
> >   ./libcap-ng/0.8.2-r0/image/usr/lib/libdrop_ambient.so.0
> >   ./libcap-ng/0.8.2-r0/image/usr/lib/libdrop_ambient.so
> >   ./libcap-ng/0.8.2-r0/image/usr/lib/libdrop_ambient.so.0.0.0
> >
> > which seems odd since it does that override for *one* of the shared
> > libs that it generates, but not the other:
> >
> >   do_install:append() {
> >         # Moving libcap-ng to base_libdir
> >         if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
> >                 mkdir -p ${D}/${base_libdir}/
> >                 mv -f ${D}${libdir}/libcap-ng.so.* ${D}${base_libdir}/
> >                 relpath=${@os.path.relpath("${base_libdir}", "${libdir}")}
> >                 ln -sf ${relpath}/libcap-ng.so.0.0.0 ${D}${libdir}/libcap-ng.so
> >         fi
> >   }
>
> The original commit from 2013 gives a few more clues in this case:
>
>   https://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux/commit/?id=587fdba43a7747992995029a88d3051ef0efe7f6
>
> It's not explicit which QA test was being triggered but presumably it
> was "unsafe-references-in-binaries", which has since been dropped from
> oe-core:
>
>   https://git.openembedded.org/openembedded-core/commit/?id=a6af5bbf3dad6f0951c67a0aae13ef86a8906893
>
> So... it looks like these examples of moving libs to base_libdir are
> obsolete and can be dropped.
>
> Some comments in insane.bbclass left behind when the
> unsafe-references-in-binaries and unsafe-references-in-scripts QA
> tests were removed can be dropped too.
>
> > given that almost all other recipes seem happy to just stuff all that
> > under /usr/lib, what is the rationale for the above occasional
> > difference? it pretty clearly doesn't affect functionality; it just
> > looks strange.

  thanks, i appreciate the research ... i was moderately curious about
what was happening, but i just didn't have the energy to go digging.
so it seems that it would be harmless to -- in the case of
tcp-wrappers -- just drop the following from its do_install() routine:

  do_install () {
        ... snip ...
        if [ "${libdir}" != "${base_libdir}" ] ; then
                rel_lib_prefix=`echo ${libdir} | sed 's,\(^/\|\)[^/][^/]*,..,g'`
                libname=`readlink ${D}${base_libdir}/libwrap.so | xargs basename`
                ln -s ${rel_lib_prefix}${base_libdir}/${libname} ${D}${libdir}/libwrap.so
                rm -f ${D}${base_libdir}/libwrap.so
        fi

is it worth the cleanup, or is that just useless churn for little
value?

rday
