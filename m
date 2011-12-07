Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RYLRx-0004LG-C6
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 18:38:34 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Dec 2011 09:31:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93560528"
Received: from unknown (HELO helios.localnet) ([10.252.122.2])
	by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2011 09:31:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 07 Dec 2011 17:31:41 +0000
Message-ID: <5339040.yv4EciDLZK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <4EDF97DA.1070009@balister.org>
References: <1323273568-31152-1-git-send-email-philip@balister.org>
	<DCF0DA43-34BE-4AD2-8E13-536E6DCDF49A@dominion.thruhere.net>
	<4EDF97DA.1070009@balister.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] qt4.inc : Add uic, moc, rcc, and lrelease to tools package.
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
X-List-Received-Date: Wed, 07 Dec 2011 17:38:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 07 December 2011 11:44:10 Philip Balister wrote:
> On 12/07/2011 11:23 AM, Koen Kooi wrote:
> > Op 7 dec. 2011, om 16:59 heeft Philip Balister het volgende geschreven:
> >> These binaries are needed in the target tools package so we can build
> >> qt apps on the target. You also need to install qmake from meta-oe.
> >> 
> >> Test by building gnuradio on the USRP e100 with qt support.
> >> 
> >> Signed-off-by: Philip Balister <philip@balister.org>
> >> ---
> >> meta/recipes-qt/qt4/qt4.inc |    9 ++-------
> >> 1 files changed, 2 insertions(+), 7 deletions(-)
> >> 
> >> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> >> index bec81b4..2638249 100644
> >> --- a/meta/recipes-qt/qt4/qt4.inc
> >> +++ b/meta/recipes-qt/qt4/qt4.inc
> >> @@ -138,8 +138,8 @@ RRECOMMENDS_${QT_BASE_NAME}-qmlviewer += " \
> >> RRECOMMENDS_${QT_BASE_NAME}-doc += " \
> >> 
> >>             ${QT_BASE_NAME}-demos-doc"
> >> 
> >> -FILES_${QT_BASE_NAME}-tools                = "${bindir}/qttracereplay
> >> ${bindir}/qdoc*" -FILES_${QT_BASE_NAME}-tools-dbg            =
> >> "${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc*"
> >> +FILES_${QT_BASE_NAME}-tools                =
> >> "${bindir}/qttracereplay ${bindir}/qdoc* ${bindir}/moc ${bindir}/uic*
> >> ${bindir}/rcc" +FILES_${QT_BASE_NAME}-tools-dbg            =
> >> "${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc*
> >> ${bindir}/.debug/uic* ${bindir}/.debug/moc ${bindir}/.debug/rcc"
> >> FILES_${QT_BASE_NAME}-assistant            = "${bindir}/*assistant*
> >> ${bindir}/qcollectiongenerator ${bindir}/qhelpconverter
> >> ${bindir}/qhelpgenerator" FILES_${QT_BASE_NAME}-assistant-dbg       
> >> = "${bindir}/.debug/*assistant* ${bindir}/.debug/qcollectiongenerator
> >> ${bindir}/.debug/qhelpconverter ${bindir}/.debug/qhelpgenerator"
> >> FILES_${QT_BASE_NAME}-common               = "${bindir}/qtconfig" @@
> >> -287,11 +287,6 @@ do_install() {
> >> 
> >> 	# These are host binaries, we should only use them in staging
> >> 	rm ${D}/${bindir}/qmake
> >> 
> >> -	rm -f ${D}/${bindir}/uic
> >> -	rm -f ${D}/${bindir}/uic3
> >> -	rm ${D}/${bindir}/moc
> >> -	rm ${D}/${bindir}/rcc
> >> -	rm -f ${D}/${bindir}/lrelease
> > 
> > Can you verify that those are actually target binaries and not x86 ones?
> 
> root@usrp-e1xx:~# file /usr/bin/lrelease
> /usr/bin/lrelease: ELF 32-bit LSB executable, ARM, version 1 (SYSV),
> dynamically linked (uses shared libs), for GNU/Linux 2.6.16, stripped
> 
> root@usrp-e1xx:~# file /usr/bin/rcc
> /usr/bin/rcc: ELF 32-bit LSB executable, ARM, version 1 (SYSV),
> dynamically linked (uses shared libs), for GNU/Linux 2.6.16, stripp
> 
> root@usrp-e1xx:~# file /usr/bin/moc
> /usr/bin/moc: ELF 32-bit LSB executable, ARM, version 1 (SYSV),
> dynamically linked (uses shared libs), for GNU/Linux 2.6.16, stripped
> 
> root@usrp-e1xx:~# file /usr/bin/uic3
> /usr/bin/uic3: ELF 32-bit LSB executable, ARM, version 1 (SYSV),
> dynamically linked (uses shared libs), for GNU/Linux 2.6.16, stripp
> 
> root@usrp-e1xx:~# file /usr/bin/uic
> /usr/bin/uic: ELF 32-bit LSB executable, ARM, version 1 (SYSV),
> dynamically linked (uses shared libs), for GNU/Linux 2.6.16, stripped

I thought this sounded strange when we talked about it on IRC, and looking 
back through the history, commit 69eeb3d2276e5b10d084b47d308ecfc8daf8b467 (by 
me as it happens) added these lines because we were getting architecture 
warnings at packaging time for qt4-x11-free for these specific files. If that's 
no longer the case I'd like to understand why.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


