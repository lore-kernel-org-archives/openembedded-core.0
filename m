Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWlx8-00034R-9U
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 10:59:58 +0200
Received: by wwb17 with SMTP id 17so178375wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 01:56:32 -0700 (PDT)
Received: by 10.216.142.224 with SMTP id i74mr325200wej.3.1308128191991;
	Wed, 15 Jun 2011 01:56:31 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id g2sm121499wes.34.2011.06.15.01.56.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Jun 2011 01:56:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308086688.15712.362.camel@rex>
Date: Wed, 15 Jun 2011 10:56:29 +0200
Message-Id: <DCECC705-8B71-44A7-B1B6-1BE79A1FCADD@dominion.thruhere.net>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
	<1308086688.15712.362.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
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
X-List-Received-Date: Wed, 15 Jun 2011 08:59:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jun 2011, om 23:24 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-06-14 at 14:13 -0700, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta/classes/allarch.bbclass |    5 +++--
>> 1 files changed, 3 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/classes/allarch.bbclass =
b/meta/classes/allarch.bbclass
>> index e3ac392..b9ba28b 100644
>> --- a/meta/classes/allarch.bbclass
>> +++ b/meta/classes/allarch.bbclass
>> @@ -2,9 +2,10 @@
>> # This class is used for architecture independent recipes/data files =
(usally scripts)
>> #
>>=20
>> +# We need to pour the value of BASE_PACKAGE_ARCH into FEED_ARCH
>> +# before we reset it
>> +FEED_ARCH :=3D ${BASE_PACKAGE_ARCH}
>> BASE_PACKAGE_ARCH =3D "all"
>> -PACKAGE_ARCH =3D "all"
>> -
>> # No need for virtual/libc or a cross compiler
>> INHIBIT_DEFAULT_DEPS =3D "1"
>=20
> This is a *really* bad idea. An "all" package should have no need to =
set
> architecture specific values into FEED_ARCH.
>=20
> Just for those not following IRC, the problem is Angstrom adds =
FEED_ARCH
> to OVERRIDES. Adding "all" to overrides turns out to do nasty things =
to
> classes like rm_work with "_all" in the function names.

So I did the following in angstrom.inc:

# Add FEED_ARCH and SOC_FAMILY to machine overrides so we get access to =
e.g. 'armv7a' and 'omap3'
# Hopefully we'll never see a machine or arch with 'all' as substring
MACHINEOVERRIDES .=3D ":${@bb.data.getVar('FEED_ARCH', =
d,1).replace('all','noarch')}:${SOC_FAMILY}"

That makes parsing work for MACHINE=3Dcrownbay again, but:

koen@dominion:/OE/tentacle/sources/meta-openembedded$ MACHINE=3Dcrownbay =
bitbake foo
NOTE: Out of date cache found, rebuilding...
NOTE: angstrom DOES NOT support gconf-dbus because gconf-dbus has been =
merged back into main GConf                                              =
                                           | ETA:  00:03:09
NOTE: angstrom DOES NOT support gconf-dbus-native because gconf-dbus has =
been merged back into main GConf
NOTE: angstrom DOES NOT support libiconv because the eglibc provided =
iconv library is used##############################                      =
                                             | ETA:  00:00:44
NOTE: angstrom DOES NOT support libiconv because the eglibc provided =
iconv library is =
used#############################################################        =
                            | ETA:  00:00:24
Parsing recipes: 100% =
|#########################################################################=
##########################################################################=
#################| Time: 00:01:52
Parsing of 1287 .bb files complete (0 cached, 1287 parsed). 1655 =
targets, 60 skipped, 0 masked, 0 errors.
Traceback (most recent call last):
  File "/usr/lib/python2.6/multiprocessing/util.py", line 235, in =
_run_finalizers
Traceback (most recent call last):
  File "/usr/lib/python2.6/multiprocessing/util.py", line 235, in =
_run_finalizers
Traceback (most recent call last):
  File "/usr/lib/python2.6/multiprocessing/util.py", line 235, in =
_run_finalizers
Traceback (most recent call last):
  File "/usr/lib/python2.6/multiprocessing/util.py", line 235, in =
_run_finalizers
    finalizer()
  File "/usr/lib/python2.6/multiprocessing/util.py", line 174, in =
__call__
    res =3D self._callback(*self._args, **self._kwargs)
  File "/OE/tentacle/sources/bitbake/lib/bb/codeparser.py", line 91, in =
parser_cache_save
    finalizer()
  File "/usr/lib/python2.6/multiprocessing/util.py", line 174, in =
__call__
    res =3D self._callback(*self._args, **self._kwargs)
  File "/OE/tentacle/sources/bitbake/lib/bb/codeparser.py", line 91, in =
parser_cache_save
    finalizer()
  File "/usr/lib/python2.6/multiprocessing/util.py", line 174, in =
__call__
    res =3D self._callback(*self._args, **self._kwargs)
  File "/OE/tentacle/sources/bitbake/lib/bb/codeparser.py", line 91, in =
parser_cache_save
    finalizer()
  File "/usr/lib/python2.6/multiprocessing/util.py", line 174, in =
__call__
    res =3D self._callback(*self._args, **self._kwargs)
  File "/OE/tentacle/sources/bitbake/lib/bb/codeparser.py", line 91, in =
parser_cache_save
    data, version =3D p.load()
ValueError: could not convert string to int
    data, version =3D p.load()
ValueError: could not convert string to int
    data, version =3D p.load()
    data, version =3D p.load()
ValueError: could not convert string to int
ValueError: could not convert string to int
ERROR: Command execution failed: Traceback (most recent call last):
  File "/OE/tentacle/sources/bitbake/lib/bb/command.py", line 99, in =
runAsyncCommand
    self.cooker.updateCache()
  File "/OE/tentacle/sources/bitbake/lib/bb/cooker.py", line 937, in =
updateCache
    if not self.parser.parse_next():
  File "/OE/tentacle/sources/bitbake/lib/bb/cooker.py", line 1247, in =
parse_next
    self.shutdown()
  File "/OE/tentacle/sources/bitbake/lib/bb/cooker.py", line 1236, in =
shutdown
    bb.codeparser.parser_cache_savemerge(self.cooker.configuration.data)
  File "/OE/tentacle/sources/bitbake/lib/bb/codeparser.py", line 121, in =
parser_cache_savemerge
    data, version =3D p.load()
ValueError: could not convert string to int

And the same happens for every machine now. So where did I misconvert an =
int to string?!?!?

regards,

Koen=


