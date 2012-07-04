Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SmFPc-0003jP-Ov
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 04:33:52 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:42903 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SmFEl-0006d1-0R for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 22:22:39 -0400
Date: Tue, 3 Jul 2012 22:22:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207032219210.21877@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: why would a recipe have both do_install() and do_install_append()?
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
X-List-Received-Date: Wed, 04 Jul 2012 02:33:52 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i'm probably just misreading something, but what is the point of a
recipe having both a do_install() and do_install_append() function?
for example, here's part of e2fsprogs_1.42.1.bb:

do_install () {
        oe_runmake 'DESTDIR=${D}' install
        oe_runmake 'DESTDIR=${D}' install-libs
        # We use blkid from util-linux now so remove from here
        rm -f ${D}${base_libdir}/libblkid*
        rm -rf ${D}${includedir}/blkid
        rm -f ${D}${base_libdir}/pkgconfig/blkid.pc
}

do_install_append () {
        # e2initrd_helper and the pkgconfig files belong in libdir
        if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
                install -d ${D}${libdir}
                mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
                mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
        fi
}

  how does that differ from simply defining a single do_install()
routine?  i'm willing for this to be a dumb question.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


