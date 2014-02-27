Return-Path: <ap.john.stirling@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 081B66D9BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 11:05:07 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hm4so3311658wib.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 03:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Ih2J9NPACgKBSH3TDjjj6dTB77CCvJqei2RsVTKQKCo=;
	b=ttNcbqjsI1lVy/UWFcRL9Rv2cVDoEh98pmrilhJKG8W19zK7lGSLm4haihGDBZrKON
	9ViA8FRiHTpBEh3Moexg7OAlJsWUFO+e48LX5T8nFpVGp612BIKn+XwY4TupWo90m/PQ
	ELyHLIZdFDxcmiv3q9O6ot1wRLW6bwDSbkWAGGx+C6j3UHjYJhRYx78kOjGX47CdP2Ul
	BPI2CW7gyaKwnU+0CT+X65lBZMdOWmWfx/Mh4XqaICqwJaE7FIQ52lLorbj+ISCVoZkU
	d9x7GYwhaYaS7nEOXYziQNGfYZdW2V443muz9A3Av4FdWvpthpzK2xrmBwb4TfACn4fQ
	DzwA==
MIME-Version: 1.0
X-Received: by 10.180.77.129 with SMTP id s1mr12038394wiw.56.1393499107092;
	Thu, 27 Feb 2014 03:05:07 -0800 (PST)
Received: by 10.194.8.35 with HTTP; Thu, 27 Feb 2014 03:05:06 -0800 (PST)
Date: Thu, 27 Feb 2014 11:05:06 +0000
Message-ID: <CABuzA3N16V+zZu4ZQjAodKtSRQD++qgfJu5dYHV4HQk=TXUvQg@mail.gmail.com>
From: John Stirling <ap.john.stirling@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: qt4-embedded - tweaking configure options to reduce binary size
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
X-List-Received-Date: Thu, 27 Feb 2014 11:05:10 -0000
Content-Type: multipart/alternative; boundary=f46d043c801e45ef3504f3614b8a

--f46d043c801e45ef3504f3614b8a
Content-Type: text/plain; charset=ISO-8859-1

I'm attempting to cut out some features to reduce our binary size a bit.

I added a .bbappend file (to overwrite QT_CONFIG_FLAGS setup in qt4.inc
etc) -

PRINC := "${@int(PRINC) + 1}"

QT_CONFIG_FLAGS := "-embedded $QT_ARCH \
                    -qtlibinfix E \
                    -plugin-gfx-transformed -plugin-gfx-qvfb
-plugin-gfx-vnc -plugin-gfx-directfb \
                    -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb
-qt-mouse-linuxinput \
                    -qt-kbd-tty -qt-kbd-linuxinput \
                    -DQT_KEYPAD_NAVIGATION \
                    -release -no-cups -reduce-relocations \
                    -shared -no-nas-sound -no-nis \
                    -system-libjpeg -system-libpng -system-libtiff
-system-zlib \
                    -no-pch -stl -glib \
                    -no-rpath -silent \
                    -qdbus \
                    -no-qt3support \
                    -no-webkit \
                    -no-phonon \
                    -no-sql-ibase -no-sql-mysql -no-sql-psql -no-sql-odbc
-plugin-sql-sqlite -system-sqlite -no-accessibility -no-sm \
                    -exceptions -no-fast"


When rebuilding I'm seeing the amended options appear in run.do_configure
but it doesn't seem to make any difference to the binary sizes.

I expect some form of finger trouble at this end but does anyone have any
advice on this ?

My current Qt libs are -

-rwxr-xr-x root       root          2993840 ./usr/lib/libQtCoreE.so.4
-rwxr-xr-x root       root           439440 ./usr/lib/libQtDBusE.so.4
-rwxr-xr-x root       root          2882400 ./usr/lib/libQtDeclarativeE.so.4
-rwxr-xr-x root       root          8787152 ./usr/lib/libQtGuiE.so.4
-rwxr-xr-x root       root          1090028 ./usr/lib/libQtNetworkE.so.4
-rwxr-xr-x root       root          2108856 ./usr/lib/libQtScriptE.so.4
-rwxr-xr-x root       root           205388 ./usr/lib/libQtSqlE.so.4
-rwxr-xr-x root       root           214292 ./usr/lib/libQtXmlE.so.4
-rwxr-xr-x root       root          3519484 ./usr/lib/libQtXmlPatternsE.so.4

Thanks
John

--f46d043c801e45ef3504f3614b8a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m attempting to cut out some features to reduce our =
binary size a bit.<div><br></div><div>I added a .bbappend file (to overwrit=
e QT_CONFIG_FLAGS setup in qt4.inc etc) -</div><div><br></div><div><div>PRI=
NC :=3D &quot;${@int(PRINC) + 1}&quot;<br>
</div><div><br></div><div>QT_CONFIG_FLAGS :=3D &quot;-embedded $QT_ARCH \<b=
r></div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -qtlibinfix E \</div><=
div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -plugin-gfx-transformed -plugin=
-gfx-qvfb -plugin-gfx-vnc -plugin-gfx-directfb \</div>
<div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -plugin-mouse-tslib -qt-mouse-=
pc -qt-mouse-qvfb -qt-mouse-linuxinput \</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 -qt-kbd-tty -qt-kbd-linuxinput \</div><div>=A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 -DQT_KEYPAD_NAVIGATION \</div><div>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -release -no-cups -reduce-relocatio=
ns \</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -shared -no-nas-soun=
d -no-nis \</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -system-libjp=
eg -system-libpng -system-libtiff -system-zlib \</div><div>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -no-pch -stl -glib \</div><div>=A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -no-rpath -silent \</div><div>=A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -qdbus \</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 -no-qt3support \</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 -no-webkit \</div>
<div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -no-phonon \</div><div>=A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -no-sql-ibase -no-sql-mysql -no-sql-psql -=
no-sql-odbc -plugin-sql-sqlite -system-sqlite -no-accessibility -no-sm \</d=
iv><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -exceptions -no-fast&quot;<=
/div>
<div><br></div><div><br></div><div>When rebuilding I&#39;m seeing the amend=
ed options appear in run.do_configure but it doesn&#39;t seem to make any d=
ifference to the binary sizes.</div></div><div><br></div><div>I expect some=
 form of finger trouble at this end but does anyone have any advice on this=
 ?=A0</div>
<div><br></div><div>My current Qt libs are -</div><div><br></div><div><div>=
-rwxr-xr-x root =A0 =A0 =A0 root =A0 =A0 =A0 =A0 =A02993840 ./usr/lib/libQt=
CoreE.so.4</div><div>-rwxr-xr-x root =A0 =A0 =A0 root =A0 =A0 =A0 =A0 =A0 4=
39440 ./usr/lib/libQtDBusE.so.4</div>
<div>-rwxr-xr-x root =A0 =A0 =A0 root =A0 =A0 =A0 =A0 =A02882400 ./usr/lib/=
libQtDeclarativeE.so.4</div><div>-rwxr-xr-x root =A0 =A0 =A0 root =A0 =A0 =
=A0 =A0 =A08787152 ./usr/lib/libQtGuiE.so.4</div><div>-rwxr-xr-x root =A0 =
=A0 =A0 root =A0 =A0 =A0 =A0 =A01090028 ./usr/lib/libQtNetworkE.so.4</div>
<div>-rwxr-xr-x root =A0 =A0 =A0 root =A0 =A0 =A0 =A0 =A02108856 ./usr/lib/=
libQtScriptE.so.4</div><div>-rwxr-xr-x root =A0 =A0 =A0 root =A0 =A0 =A0 =
=A0 =A0 205388 ./usr/lib/libQtSqlE.so.4</div><div>-rwxr-xr-x root =A0 =A0 =
=A0 root =A0 =A0 =A0 =A0 =A0 214292 ./usr/lib/libQtXmlE.so.4</div>
<div>-rwxr-xr-x root =A0 =A0 =A0 root =A0 =A0 =A0 =A0 =A03519484 ./usr/lib/=
libQtXmlPatternsE.so.4</div></div><div><br></div><div>Thanks</div><div>John=
</div><div><br></div><div><br></div><div><br></div></div>

--f46d043c801e45ef3504f3614b8a--
