Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.13833.1630872121700487415
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Sep 2021 13:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpe08a7c099a2b1-cm08a7c099a2af.cpe.net.cable.rogers.com ([174.114.56.109]:33340 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mMyL0-0004gY-PW
	for openembedded-core@lists.openembedded.org; Sun, 05 Sep 2021 16:01:59 -0400
Date: Sun, 5 Sep 2021 16:01:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: minor curiosity related to libdir vs base_libdir and shared libs
Message-ID: <131c1b19-2676-211e-c2db-a3827d597094@crashcourse.ca>
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


  a minor oddity i stumbled over digging into the proper installation
of shared libraries ... building core-image-minimal for qemuarm64 and,
for the most part, recipes from oe-core that install shared libs put
all three artifacts (real name, so name and linker name) under
/usr/lib, as in:

  ./libtirpc/1.3.2-r0/image/usr/lib/libtirpc.so
  ./libtirpc/1.3.2-r0/image/usr/lib/libtirpc.so.3
  ./libtirpc/1.3.2-r0/image/usr/lib/libtirpc.so.3.0.0

however, the *occasional* recipe chooses to -- for whatever reason --
distinguish between libdir and base_libdir. for example, here's the
result of installing tcp-wrappers' shared libs in its ${D} directory:

  ./tcp-wrappers/7.6-r10/image/lib/libwrap.so.0.7.6
  ./tcp-wrappers/7.6-r10/image/lib/libwrap.so.0
  ./tcp-wrappers/7.6-r10/image/usr/lib/libwrap.so

this is due to the following manual override in tcp-wrappers_7.6.bb:

  do_install () {
        oe_libinstall -a libwrap ${D}${libdir}
        oe_libinstall -C shared -so libwrap ${D}${base_libdir}

        if [ "${libdir}" != "${base_libdir}" ] ; then
                rel_lib_prefix=`echo ${libdir} | sed 's,\(^/\|\)[^/][^/]*,..,g'`
                libname=`readlink ${D}${base_libdir}/libwrap.so | xargs basename`
                ln -s ${rel_lib_prefix}${base_libdir}/${libname} ${D}${libdir}/libwrap.so
                rm -f ${D}${base_libdir}/libwrap.so
        fi
        ...

so this recipe -- after doing the *default* shared lib installation
via oe_libinstall() -- conditionally chooses to override that.

  another recipe that is even odder is libcap-ng:

  ./libcap-ng/0.8.2-r0/image/lib/libcap-ng.so.0.0.0
  ./libcap-ng/0.8.2-r0/image/lib/libcap-ng.so.0
  ./libcap-ng/0.8.2-r0/image/usr/lib/libcap-ng.so
  ./libcap-ng/0.8.2-r0/image/usr/lib/libdrop_ambient.so.0
  ./libcap-ng/0.8.2-r0/image/usr/lib/libdrop_ambient.so
  ./libcap-ng/0.8.2-r0/image/usr/lib/libdrop_ambient.so.0.0.0

which seems odd since it does that override for *one* of the shared
libs that it generates, but not the other:

  do_install:append() {
        # Moving libcap-ng to base_libdir
        if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
                mkdir -p ${D}/${base_libdir}/
                mv -f ${D}${libdir}/libcap-ng.so.* ${D}${base_libdir}/
                relpath=${@os.path.relpath("${base_libdir}", "${libdir}")}
                ln -sf ${relpath}/libcap-ng.so.0.0.0 ${D}${libdir}/libcap-ng.so
        fi
  }

given that almost all other recipes seem happy to just stuff all that
under /usr/lib, what is the rationale for the above occasional
difference? it pretty clearly doesn't affect functionality; it just
looks strange.

rday
