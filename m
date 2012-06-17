Received: from stoexhub02.domain01.net ([83.145.59.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1SgBYd-0004DA-40
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 11:14:07 +0200
Received: from ad.chargestorm.se (83.252.253.85) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.245.1;
	Sun, 17 Jun 2012 11:03:25 +0200
Date: Sun, 17 Jun 2012 11:03:51 +0200
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120617090351.GA21623@ad.chargestorm.se>
Mail-Followup-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
MIME-Version: 1.0
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Parse errors introduce by qt4 python->shell style functions
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
X-List-Received-Date: Sun, 17 Jun 2012 09:14:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

I recently started to look at updating our internal repos using the
latest denzil updates.

However, this introduced parse errors for us. We got a bbappend for
qt4-embedded, which includes a number of lines like:

QT_CONFIG_FLAGS := "${@oe_filter_out('-plugin-gfx-transformed', 
'${QT_CONFIG_FLAGS}', d)}"

(this is to remove lots of features, both size-wise and to reduce build
time).

This work fine up to the original denzil release. Now I've run a bisect,
and found that our problems was introduced by "qt4: move functions from
python to shell style", commit id:
98cb2efe4e9f3092d531c9fc809406c3ef559725.

After this commit, we get errors like:
$ bitbake core-image-sato -eLoading cache: 100%
|###################################################| ETA:  00:00:00
Loaded 1109 entries from dependency cache.
ERROR: Failure expanding variable QT_CONFIG_FLAGS[:=], expression was
${@oe_filter_out('-plugin-gfx-transformed', '      -embedded ${QT_ARCH}
-qtlibinfix E     -plugin-gfx-transformed -plugin-gfx-qvfb
-plugin-gfx-vnc -plugin-gfx-directfb     -plugin-mouse-tslib
-qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinput     -qt-kbd-tty
-DQT_KEYPAD_NAVIGATION      -release -no-cups -reduce-relocations
-shared -no-nas-sound -no-nis                     -system-libjpeg
-system-libpng -system-libtiff -system-zlib                     -no-pch
-qdbus -stl -glib -phonon -webkit                     -xmlpatterns
-no-rpath -qt3support -silent                     --enable-pulseaudio
-no-sql-ibase -no-sql-mysql -no-sql-psql -no-sql-odbc -plugin-sql-sqlite
-no-accessibility -no-sm                        -exceptions ', d)} which
triggered exception SyntaxError: EOL while scanning string literal
(QT_CONFIG_FLAGS[:=], line 1)
ERROR: Command execution failed: Exited with 1

Summary: There were 2 ERROR messages shown, returning a non-zero exit
code.

The change from python to shell style functions seems to require some
adaption of our bbappends, which I can't find...

Any ideas?

Thanks in advance!

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


