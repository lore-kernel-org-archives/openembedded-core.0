Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SmJJl-0003ER-Tt
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 08:44:05 +0200
Received: by eaal1 with SMTP id l1so2764775eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2012 23:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=6Bhr+L+YTKylTHOs6+r8hFip6syQDmen08CYpczsaG0=;
	b=fWV3WjQ/MNi1IG8riF1+mezk0TGlNE1/puLZTo+DGCOAAdoyTLkCZ2/danTs6QQmIJ
	xFsvbDpe+HepsaU0SMJlQOeNwZBWFbCzflRdWdIwN1kmaubgb5eYCi7JvoddD/P9/HsO
	8JDSF9YcXUuyW3EgpqAdGCzwGcBs5lz25ndwjySnpM8I2EV4Ju19lUQpYDZ94FArxpll
	BoreWUyCx23mj3nYkqj7EU3rQSb7egcq3F06j3WAsUaceVZdh1+MyboWCYtfImWgOoIG
	/B/3Y6xpxCvIZTojkwrmLMer47moBUNvBib4H58T6F62zzceKLZdHc5H5maVPjZDR1JE
	dZIg==
Received: by 10.14.37.76 with SMTP id x52mr5122682eea.102.1341383582943; Tue,
	03 Jul 2012 23:33:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Tue, 3 Jul 2012 23:32:32 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207032219210.21877@oneiric>
References: <alpine.DEB.2.02.1207032219210.21877@oneiric>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Jul 2012 23:32:32 -0700
Message-ID: <CAMKF1sqWn-S=Hc_eMw-JU3ZP6ox-vfNSidiQbF_oLPhg9tO71g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: why would a recipe have both do_install() and do_install_append()?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jul 2012 06:44:06 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 3, 2012 at 7:22 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   i'm probably just misreading something, but what is the point of a
> recipe having both a do_install() and do_install_append() function?
> for example, here's part of e2fsprogs_1.42.1.bb:
>
> do_install () {
>         oe_runmake 'DESTDIR=${D}' install
>         oe_runmake 'DESTDIR=${D}' install-libs
>         # We use blkid from util-linux now so remove from here
>         rm -f ${D}${base_libdir}/libblkid*
>         rm -rf ${D}${includedir}/blkid
>         rm -f ${D}${base_libdir}/pkgconfig/blkid.pc
> }
>
> do_install_append () {
>         # e2initrd_helper and the pkgconfig files belong in libdir
>         if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
>                 install -d ${D}${libdir}
>                 mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
>                 mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
>         fi
> }
>
>   how does that differ from simply defining a single do_install()
> routine?  i'm willing for this to be a dumb question.

it does not. I think it could be arguably done in same do_install
but it does have some logical separation where the append operation is
moving files from /lib to /usr/lib

in theory another use of it is that you can override do_install_append
in a .bbappend file
and still reuse the do_install. Suppose you do not want to move the
files and are
happy with default location
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


