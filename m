Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1U0EGi-0000df-DG
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 17:42:44 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:57517 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U0E1Z-0002AO-LU for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 11:27:05 -0500
Date: Tue, 29 Jan 2013 11:27:02 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1301291118190.12438@oneiric>
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
Subject: "base_set_filespath()" adds superfluous duplicate directory entry
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 16:42:44 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  just noticed that the standard call to base_set_filespath() adds two
entries of the top-level directory if you're doing a distroless build.
you can see this with bitbake-env:

FILESPATH="/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/portmap-6.0/arm
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/portmap-6.0/am180x-evm
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/portmap-6.0/armv5
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/portmap-6.0/omapl138
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/portmap-6.0/
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/portmap-6.0/
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/portmap/arm
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/portmap/am180x-evm
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/portmap/armv5
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/portmap/omapl138
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/portmap/
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/portmap/
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/files/arm
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/files/am180x-evm
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/files/armv5
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/files/omapl138
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/files/
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-connectivity/portmap/files/"

  note the unnecessary duplication of the top-level directories for
this example using (randomly) portmap -- the directories portmap-6.0/,
portmap/ and files/.

  that's because of this code in that routine:

    overrides = ((d.getVar("FILESOVERRIDES", True) or "") + ":").split(":")
    for p in path:
        if p != "":
            for o in overrides:
                filespath.append(os.path.join(p, o))

and the fact that, if you don't set a DISTRO, what you're using is:

$ bitbake-env -r portmap FILESOVERRIDES
Parsing recipes..done.
# FILESOVERRIDES="${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}"
FILESOVERRIDES="arm:am180x-evm:armv5:omapl138:"

where you can see that ${DISTROOVERRIDES} is unset and thus gives you
a null entry, to which the routine adds a *second* (superfluous) null
entry.  not fatal, just unnecessary.

rday

p.s.  by the way, on the topic of FILESPATH, this doesn't look right:

$ grep -r FILESEXTRAPATHS_append *
meta/recipes-graphics/mesa/mesa-common.inc:FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
$

  shouldn't that be "_prepend"?  should i submit a patch?


