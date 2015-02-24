Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 151DF71633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 23:18:48 +0000 (UTC)
Received: from [99.240.204.5] (port=35265 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YQOkX-00053S-VN for openembedded-core@lists.openembedded.org;
	Tue, 24 Feb 2015 18:18:46 -0500
Date: Tue, 24 Feb 2015 18:18:46 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1502241815210.5923@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
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
Subject: question about SERIAL_CONSOLES vs SERIAL_CONSOLE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Feb 2015 23:18:53 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  given that SERIAL_CONSOLE is officially deprecated, i was going to
submit a patch that switched them all over to SERIAL_CONSOLES, but i'm
not sure what this is doing in
meta/recipes-core/systemd/systemd-serialgetty.bb:

... snip ...
SERIAL_CONSOLE ?= "115200 ttyS0"

SRC_URI = "file://serial-getty@.service"

do_install() {
        if [ ! -z "${SERIAL_CONSOLES}" ] ; then
                default_baudrate=`echo "${SERIAL_CONSOLES}" | sed 's/\;.*//'`
                install -d ${D}${systemd_unitdir}/system/
                install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
                install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/
                sed -i -e s/\@BAUDRATE\@/$default_baudrate/g ${D}${systemd_unitdir}/system/serial-getty@.service

                tmp="${SERIAL_CONSOLES}"
                for entry in $tmp ; do
... snip ...

  so, SERIAL_CONSOLE is initially set, but all further references are
to SERIAL_CONSOLES. so, is that initial setting of SERIAL_CONSOLE even
doing anything?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

