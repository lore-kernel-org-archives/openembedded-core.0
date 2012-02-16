Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Ry5cK-0000AL-7U
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 18:59:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id E382A3158F00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2012 18:51:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id TiVIb2KNZKwm
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2012 18:51:17 +0100 (CET)
Received: from [172.22.22.61] (drms-4d015a78.pool.mediaWays.net [77.1.90.120])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 9DC293158F02
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2012 18:51:17 +0100 (CET)
Message-ID: <4F3D4214.4080604@opendreambox.org>
Date: Thu, 16 Feb 2012 18:51:16 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: use of variables in module_do_{compile,install}
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
X-List-Received-Date: Thu, 16 Feb 2012 17:59:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi everybody,

module.bbclass currently contains the following two functions:

module_do_compile() {
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
        oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
                   KERNEL_SRC=${STAGING_KERNEL_DIR}    \
                   KERNEL_VERSION=${KERNEL_VERSION}    \
                   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
                   AR="${KERNEL_AR}" \
                   ${MAKE_TARGETS}
}

module_do_install() {
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
        oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" \
                   KERNEL_SRC=${STAGING_KERNEL_DIR} \
                   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
                   modules_install
}

How about changing them this way?

module_do_compile() {
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
        oe_runmake -C "${STAGING_KERNEL_DIR}" SUBDIRS="${S}"
}

module_do_install() {
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
        oe_runmake -C "${STAGING_KERNEL_DIR}" SUBDIRS="${S}" \
                   DEPMOD=echo \
                   INSTALL_MOD_PATH="${D}" \
                   modules_install
}

We would become independent of variables like KERNEL_PATH and
KERNEL_SRC, which only match some arbitrarily chosen Makefiles.

Regards,
Andreas


