Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TzqJK-000829-Fh
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 16:07:50 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r0SEq4gw016890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Jan 2013 15:52:06 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Tzq4J-0007f6-OW; Mon, 28 Jan 2013 15:52:19 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <fdad95c5f7fc287a6b173d5c30447ab05fab0778.1359049755.git.ross.burton@intel.com>
	<1359377661.22371.54.camel@ted>
	<lypq0pl8ee.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<4710226.v3bfS80rgU@helios>
Date: Mon, 28 Jan 2013 15:52:19 +0100
In-Reply-To: <4710226.v3bfS80rgU@helios> (Paul Eggleton's message of "Mon, 28
	Jan 2013 14:19:57 +0000")
Message-ID: <ly622hl5r0.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base: make feature backfilling happen earlier
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
X-List-Received-Date: Mon, 28 Jan 2013 15:07:50 -0000
Content-Type: text/plain

Paul Eggleton <paul.eggleton@linux.intel.com> writes:

> Why are you assigning *_FEATURES_BACKFILL at all?

There are some implicit relations between features (e.g. when selecting
'usbhost' I *usually* want 'vfat' or 'ext2' support too). So I have

  DISTRO_FEATURES_BACKFILL = "\
    largefile nfsroot modules ld-is-gold ${PROJECT_FEATURES} \
    ${DISTRO_FEATURES_INITMAN} \
    ${@base_contains('PROJECT_FEATURES', 'alsa', 'sound', '', d)} \
    ${@base_contains('PROJECT_FEATURES', 'directfb', 'screen', '', d)} \
    ${@base_contains('PROJECT_FEATURES', 'fb', 'screen', '', d)} \
    ${@base_contains('PROJECT_FEATURES', 'mmc', 'ext2 vfat', '', d)} \
    ${@base_contains('PROJECT_FEATURES', 'touchscreen', 'screen', '', d)} \
    ${@base_contains('PROJECT_FEATURES', 'ubifs', 'mtd', '', d)} \
    ${@base_contains('PROJECT_FEATURES', 'jffs2', 'mtd', '', d)} \
    ${@base_contains('PROJECT_FEATURES', 'usbclient', 'usb usbgadget', '', d)} \
    ${@base_contains('PROJECT_FEATURES', 'usbgadget', 'usb usbclient', '', d)} \
    ${@base_contains('PROJECT_FEATURES', 'usbhost', 'ext2 vfat', '', d)} \
    ${@base_contains('PROJECT_FEATURES', 'usbhost', 'usb', '', d)} \
    ${@base_contains('PROJECT_FEATURES', 'x11', 'screen', '', d)} \
  "
  
  DISTRO_FEATURES_BACKFILL_CONSIDERED = "${NO_PROJECT_FEATURES}"

in my distro configuration (I knew; some are machine but no distro
features but this does not matter for me) and want to allow projects to
add new features and to remove default ones.

The default 'pulseaudio' in DISTRO_FEATURES_BACKFILL does not sound sane
to me either...


Enrico
-- 
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz


