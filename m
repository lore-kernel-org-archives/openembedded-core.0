Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SMEa5-00041o-9k
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 10:25:09 +0200
Received: by wera1 with SMTP id a1so7389801wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2012 01:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=gkVQFPENQGIdnfBQGpeS4SYGRZTtYitFkXJXqMLLmIE=;
	b=cc/wkxoXfMO/UchXS4rZ7dVAV9VDGci42psOl+I7Aq1t2rrxnIcM/mLTPSnjcCr/ca
	Sztt+9BCBUqiThNbtNMACwjynZfZp1SbNvDBYwAwa2tTC+jh/ZL5r4nOASUzSAMl2Npd
	MLLHOMoEpWyIAJlf/xcO1ZG+eFsqnx5Az65FsepbggcI8/u1YiEuSYtjtAbVnOEKaizG
	oVDet2fYujgZMiuwCprxJJlUYzLH8f76OBExCeQkTBboTW1Z1yH0VmGC3EOnylNLV1vG
	nLljzImqwkQBYgSUf5qL3MvQWdflZWGBFv7s1UHO/lni+GdUqSfWp6DvMzg01L8GItv1
	CHAg==
Received: by 10.216.210.138 with SMTP id u10mr9600674weo.11.1335168936362;
	Mon, 23 Apr 2012 01:15:36 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm32788046wib.2.2012.04.23.01.15.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Apr 2012 01:15:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <44025B47-33F8-44B8-94A1-2C8E8B866C1E@dominion.thruhere.net>
Date: Mon, 23 Apr 2012 10:15:32 +0200
Message-Id: <9301829E-837E-4C49-A3B8-57208CE9A196@dominion.thruhere.net>
References: <4F8AC160.7020405@kth.se>
	<44025B47-33F8-44B8-94A1-2C8E8B866C1E@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQl5fc+8g0Ia4mWLMdaJwe/ZPf1q/xWn0Po/qsTMhBua/sHeXTeAwAfLQi4cu9/5YAkZZKpG
Subject: Re: [Angstrom-devel] Python library hashlib is missig hash-code.
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
X-List-Received-Date: Mon, 23 Apr 2012 08:25:09 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Op 15 apr. 2012, om 16:35 heeft Koen Kooi het volgende geschreven:

> My theory is that this is caused by the openssl /usr changes, can =
anyone confirm or deny that?

I dug into this. The breakage was recorded by buildhistory:

=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
commit fef22c30d3834abdfe8b5c12cd2dd17e3e031973
Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri Feb 24 12:39:55 2012 +0100

    Build Angstrom v2012.02-core of angstrom v2012.02-core for machine =
beagleboard on dominion

diff --git =
a/packages/armv7a-angstrom-linux-gnueabi/python/python-crypt/latest =
b/packages/armv7a-angstrom-linux-gnueabi/python/python-crypt/latest
index 3ec1030..829e7ce 100644
--- a/packages/armv7a-angstrom-linux-gnueabi/python/python-crypt/latest
+++ b/packages/armv7a-angstrom-linux-gnueabi/python/python-crypt/latest
@@ -1,7 +1,7 @@
 PV =3D 2.7.2
 PR =3D r0.6
-RDEPENDS =3D eglibc (>=3D 2.12) libcrypto (>=3D 1.0.0g) libpython2 (>=3D =
2.7.2) python-core
+RDEPENDS =3D eglibc (>=3D 2.12) libpython2 (>=3D 2.7.2) python-core
 RRECOMMENDS =3D openssl
-PKGSIZE =3D 25436
+PKGSIZE =3D 14252
 FILES =3D /usr/lib/python2.7/hashlib.* /usr/lib/python2.7/md5.* =
/usr/lib/python2.7/sha.* /usr/lib/python2.7/lib-dynload/crypt.so =
/usr/lib/python2.7/lib-dynload/_hashlib.so =
/usr/lib/python2.7/lib-dynload/_sha256.so =
/usr/lib/python2.7/lib-dynload/_sha512.so
-FILELIST =3D /usr/lib/python2.7/hashlib.py =
/usr/lib/python2.7/hashlib.pyo =
/usr/lib/python2.7/lib-dynload/_hashlib.so =
/usr/lib/python2.7/lib-dynload/crypt.so /usr/lib/python2.7/md5.py =
/usr/lib/python2.7/md5.pyo /usr/lib/python2.7/sha.py =
/usr/lib/python2.7/sha.pyo
+FILELIST =3D /usr/lib/python2.7/hashlib.py =
/usr/lib/python2.7/hashlib.pyo /usr/lib/python2.7/lib-dynload/crypt.so =
/usr/lib/python2.7/md5.py /usr/lib/python2.7/md5.pyo =
/usr/lib/python2.7/sha.py /usr/lib/python2.7/sha.pyo
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


The preceding commit affecting python crypt:

=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
commit f572f6547bc4b1e2a64e4cae8201b70c0e1b4162
Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed Feb 22 14:53:00 2012 +0100

    Build Angstrom v2012.02-core of angstrom v2012.02-core for machine =
beaglebone on dominion

diff --git =
a/packages/armv7a-angstrom-linux-gnueabi/python/python-crypt/latest =
b/packages/armv7a-angstrom-linux-gnueabi/python/python-crypt/latest
index 5f21c50..3ec1030 100644
--- a/packages/armv7a-angstrom-linux-gnueabi/python/python-crypt/latest
+++ b/packages/armv7a-angstrom-linux-gnueabi/python/python-crypt/latest
@@ -3,5 +3,5 @@ PR =3D r0.6
 RDEPENDS =3D eglibc (>=3D 2.12) libcrypto (>=3D 1.0.0g) libpython2 (>=3D =
2.7.2) python-core
 RRECOMMENDS =3D openssl
 PKGSIZE =3D 25436
-FILES =3D /usr/lib/python2.7/hashlib.* /usr/lib/python2.7/md5.* =
/usr/lib/python2.7/sha.* /usr/lib/python2.7/lib-dynload/crypt.so =
/usr/lib/python2.7/lib-dynload/_hashlib.so =
/usr/lib/python2.7/lib-dynload/_sha256.so =
/usr/lib/python2.7/lib-dynload/_sha512.so=20
-FILELIST =3D /usr/lib/python2.7/md5.py /usr/lib/python2.7/md5.pyo =
/usr/lib/python2.7/sha.pyo /usr/lib/python2.7/hashlib.pyo =
/usr/lib/python2.7/sha.py /usr/lib/python2.7/hashlib.py =
/usr/lib/python2.7/lib-dynload/_hashlib.so =
/usr/lib/python2.7/lib-dynload/crypt.so
+FILES =3D /usr/lib/python2.7/hashlib.* /usr/lib/python2.7/md5.* =
/usr/lib/python2.7/sha.* /usr/lib/python2.7/lib-dynload/crypt.so =
/usr/lib/python2.7/lib-dynload/_hashlib.so =
/usr/lib/python2.7/lib-dynload/_sha256.so =
/usr/lib/python2.7/lib-dynload/_sha512.so
+FILELIST =3D /usr/lib/python2.7/hashlib.py =
/usr/lib/python2.7/hashlib.pyo =
/usr/lib/python2.7/lib-dynload/_hashlib.so =
/usr/lib/python2.7/lib-dynload/crypt.so /usr/lib/python2.7/md5.py =
/usr/lib/python2.7/md5.pyo /usr/lib/python2.7/sha.py =
/usr/lib/python2.7/sha.pyo
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

And look at that, an openssl patch in between those dates:

=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=46rom 01ea85f7f6c53c66c76d6f832518b28bf06ec072 Mon Sep 17 00:00:00 2001
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 21 Feb 2012 23:03:55 +0000
Subject: openssl: Move libcrypto to base_libdir

This fix is for dhclient. It needs libcrypto at runtime and if
libcrypto is in libdir, it's path can be inaccessible on systems
where /usr is on nfs for example or dhclient is needed before
/usr is mounted.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I'm going to band-aid it so we can get a working python hashlib module =
in the 'denzil' branch, hopefully someone will come up with a proper fix =
soon.

regards,

Koen


>=20
> Begin doorgestuurd bericht:
>=20
>> Van: Mattias Millbro <mmillbro@kth.se>
>> Onderwerp: [Angstrom-devel] Python library hashlib is missig =
hash-code.
>> Datum: 15 april 2012 14:38:56 GMT+02:00
>> Aan: angstrom-distro-devel@linuxtogo.org
>> Antwoord aan: Discussion of the angstrom distribution development =
<angstrom-distro-devel@linuxtogo.org>
>>=20
>> Hi everybody,
>>=20
>> as a new member of this mailing list I'm not familiar to the proper =
procedure of this kids of questions/bug reports. But I'll give it a try =
and please let me know if any necessary information is missing.
>>=20
>> I'm running Angstrom on a Beaglebone using the =
Angstrom-systemd-image-eglibc-ipk-v2012.01-core-beaglebone.rootfs.tar.bz2 =
image from http://www.angstrom-distribution.org/demo/beaglebone/. I =
installed python and pyuthon-modules using opkg.
>>=20
>> I recently made a completely fresh install and discovered that the =
python library hashlib does no longer work properly. It does not seem to =
find code for sha hashes even tho python.org states
>>=20
>> "Included are the FIPS secure hash algorithms SHA1, SHA224, SHA256, =
SHA384, and SHA512 (defined in FIPS 180-2) as well as RSA=92s MD5 =
algorithm (defined in Internet RFC 1321).".
>>=20
>> All related packages seems to be up to date and I have spent several =
days googling and installing/reinstalling various packages without any =
success.
>>=20
>> This is what happens when importing hashlib:
>>=20
>> root@beaglebone:~# python
>> Python 2.7.2 (default, Apr 13 2012, 21:18:55)
>> [GCC 4.5.4 20120305 (prerelease)] on linux2
>> Type "help", "copyright", "credits" or "license" for more =
information.
>>>>> import hashlib
>> ERROR:root:code for hash sha1 was not found.
>> Traceback (most recent call last):
>> File "/usr/lib/python2.7/hashlib.py", line 139, in <module>
>> globals()[__func_name] =3D __get_hash(__func_name)
>> File "/usr/lib/python2.7/hashlib.py", line 91, in =
__get_builtin_constructor
>> raise ValueError('unsupported hash type %s' % name)
>> ValueError: unsupported hash type sha1
>> ERROR:root:code for hash sha224 was not found.
>> Traceback (most recent call last):
>> File "/usr/lib/python2.7/hashlib.py", line 139, in <module>
>> globals()[__func_name] =3D __get_hash(__func_name)
>> File "/usr/lib/python2.7/hashlib.py", line 91, in =
__get_builtin_constructor
>> raise ValueError('unsupported hash type %s' % name)
>> ValueError: unsupported hash type sha224
>> ERROR:root:code for hash sha256 was not found.
>> Traceback (most recent call last):
>> File "/usr/lib/python2.7/hashlib.py", line 139, in <module>
>> globals()[__func_name] =3D __get_hash(__func_name)
>> File "/usr/lib/python2.7/hashlib.py", line 91, in =
__get_builtin_constructor
>> raise ValueError('unsupported hash type %s' % name)
>> ValueError: unsupported hash type sha256
>> ERROR:root:code for hash sha384 was not found.
>> Traceback (most recent call last):
>> File "/usr/lib/python2.7/hashlib.py", line 139, in <module>
>> globals()[__func_name] =3D __get_hash(__func_name)
>> File "/usr/lib/python2.7/hashlib.py", line 91, in =
__get_builtin_constructor
>> raise ValueError('unsupported hash type %s' % name)
>> ValueError: unsupported hash type sha384
>> ERROR:root:code for hash sha512 was not found.
>> Traceback (most recent call last):
>> File "/usr/lib/python2.7/hashlib.py", line 139, in <module>
>> globals()[__func_name] =3D __get_hash(__func_name)
>> File "/usr/lib/python2.7/hashlib.py", line 91, in =
__get_builtin_constructor
>> raise ValueError('unsupported hash type %s' % name)
>> ValueError: unsupported hash type sha512
>>>>>=20
>>=20
>> Here is some additional information that might be useful:
>>=20
>> root@beaglebone:~# opkg list-installed | grep python
>> libpython2.7-1.0 - 2.7.2-r2.11
>> python-2to3 - 2.7.2-r2.11
>> python-audio - 2.7.2-r2.11
>> python-bsddb - 2.7.2-r2.11
>> python-codecs - 2.7.2-r2.11
>> python-compile - 2.7.2-r2.11
>> python-compiler - 2.7.2-r2.11
>> python-compression - 2.7.2-r2.11
>> python-core - 2.7.2-r2.11
>> python-crypt - 2.7.2-r2.11
>> python-ctypes - 2.7.2-r2.11
>> python-curses - 2.7.2-r2.11
>> python-datetime - 2.7.2-r2.11
>> python-db - 2.7.2-r2.11
>> python-debugger - 2.7.2-r2.11
>> python-difflib - 2.7.2-r2.11
>> python-distutils - 2.7.2-r2.11
>> python-doctest - 2.7.2-r2.11
>> python-elementtree - 2.7.2-r2.11
>> python-email - 2.7.2-r2.11
>> python-fcntl - 2.7.2-r2.11
>> python-gdbm - 2.7.2-r2.11
>> python-hotshot - 2.7.2-r2.11
>> python-html - 2.7.2-r2.11
>> python-idle - 2.7.2-r2.11
>> python-image - 2.7.2-r2.11
>> python-io - 2.7.2-r2.11
>> python-json - 2.7.2-r2.11
>> python-lang - 2.7.2-r2.11
>> python-logging - 2.7.2-r2.11
>> python-mailbox - 2.7.2-r2.11
>> python-math - 2.7.2-r2.11
>> python-mime - 2.7.2-r2.11
>> python-mmap - 2.7.2-r2.11
>> python-modules - 2.7.2-r2.11
>> python-multiprocessing - 2.7.2-r2.11
>> python-netclient - 2.7.2-r2.11
>> python-netserver - 2.7.2-r2.11
>> python-numbers - 2.7.2-r2.11
>> python-pickle - 2.7.2-r2.11
>> python-pkgutil - 2.7.2-r2.11
>> python-pprint - 2.7.2-r2.11
>> python-profile - 2.7.2-r2.11
>> python-pydoc - 2.7.2-r2.11
>> python-re - 2.7.2-r2.11
>> python-readline - 2.7.2-r2.11
>> python-resource - 2.7.2-r2.11
>> python-robotparser - 2.7.2-r2.11
>> python-shell - 2.7.2-r2.11
>> python-smtpd - 2.7.2-r2.11
>> python-sqlite3 - 2.7.2-r2.11
>> python-sqlite3-tests - 2.7.2-r2.11
>> python-stringold - 2.7.2-r2.11
>> python-subprocess - 2.7.2-r2.11
>> python-syslog - 2.7.2-r2.11
>> python-terminal - 2.7.2-r2.11
>> python-tests - 2.7.2-r2.11
>> python-textutils - 2.7.2-r2.11
>> python-threading - 2.7.2-r2.11
>> python-tkinter - 2.7.2-r2.11
>> python-unittest - 2.7.2-r2.11
>> python-unixadmin - 2.7.2-r2.11
>> python-xml - 2.7.2-r2.11
>> python-xmlrpc - 2.7.2-r2.11
>> python-zlib - 2.7.2-r2.11
>>=20
>> root@beaglebone:~# opkg list-installed | grep openssl
>> openssl - 1.0.0h-r15.1
>>=20
>> I'm grateful for any kind of help solving this issue.
>>=20
>> Best Regards
>> / Mattias
>>=20
>> _______________________________________________
>> Angstrom-distro-devel mailing list
>> Angstrom-distro-devel@linuxtogo.org
>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/angstrom-distro-devel
>=20



