Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1THhGD-0002RI-0P
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 22:34:09 +0200
Received: from mail218-ch1-R.bigfish.com (10.43.68.230) by
	CH1EHSOBE014.bigfish.com (10.43.70.64) with Microsoft SMTP Server id
	14.1.225.23; Fri, 28 Sep 2012 20:21:11 +0000
Received: from mail218-ch1 (localhost [127.0.0.1])	by
	mail218-ch1-R.bigfish.com (Postfix) with ESMTP id EAE253001BA;
	Fri, 28 Sep 2012 20:21:11 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 1
X-BigFish: VS1(zz98dI9371I936eI1432Ic8kd6f1izz1202h1d1ah1d2ahzz17326ah8275bh8275dh177df4hz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6hbe9i1155h)
Received: from mail218-ch1 (localhost.localdomain [127.0.0.1]) by mail218-ch1
	(MessageSwitch) id 1348863670263529_31003;
	Fri, 28 Sep 2012 20:21:10 +0000 (UTC)
Received: from CH1EHSMHS043.bigfish.com (snatpool3.int.messaging.microsoft.com
	[10.43.68.229])	by mail218-ch1.bigfish.com (Postfix) with ESMTP id
	3BAE5220148;	Fri, 28 Sep 2012 20:21:10 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS043.bigfish.com
	(10.43.69.252) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 28 Sep 2012 20:21:08 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Fri, 28 Sep 2012 15:21:07 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] autotools.bbclass: Add functionality to
	force a clean of ${B} when reconfiguring (and ${S} != ${B})
Thread-Index: AQHNnbbKfL1E4UWqx0aMO7pDFucQTg==
Date: Fri, 28 Sep 2012 20:21:07 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6B7ED0@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1347373349.2122.35.camel@ted>
	<1348679272.32611.4.camel@phil-desktop> <1348838588.15753.52.camel@ted>
In-Reply-To: <1348838588.15753.52.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Phil Blundell <philb@gnu.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a clean of ${B} when reconfiguring (and ${S} != ${B})
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 20:34:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4BE72446FAF6CA4E97F0AF8AC6EA5EF3@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2012 at 8:23 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-09-26 at 18:07 +0100, Phil Blundell wrote:
>> On Tue, 2012-09-11 at 15:22 +0100, Richard Purdie wrote:
>> > Unfortunately whilst rerunning configure and make against a project wi=
ll mostly
>> > work there are situations where it does not correctly do the right thi=
ng.
>> >
>> > In particular, eglibc and gcc will fail out with errors where settings
>> > do not match a previously built configuration. It could be argued they=
 are
>> > broken but the situation is what it is. There is the possibility of mo=
re subtle
>> > errors too.
>>
>> FWIW, I just encountered another instance of what appears to be a
>> similar problem (with this patch applied).  I had changed my CFLAGS to
>> work around a compiler problem and then just reran the build, which led
>> eventually to:
>>
>> ERROR: Function failed: do_siteconfig_gencache
>> (see ..../tmp-eglibc/work/mips32el-oe-linux/eglibc/2.16-r11.micro1
>> +svnr20393/temp/log.do_populate_sysroot.6005 for further information)
>> ERROR: Logfile of failure stored
>> in: ..../tmp-eglibc/work/mips32el-oe-linux/eglibc/2.16-r11.micro1
>> +svnr20393/temp/log.do_populate_sysroot.6005
>> Log data follows:
>> | DEBUG: Executing python function sstate_task_prefunc
>> [...]
>> | DEBUG: Executing shell function do_siteconfig_gencache
>> | configure: WARNING: unrecognized options: --disable-silent-rules,
>> --disable-dependency-tracking, --with-libtool-sysroot
>> | configure: loading cache eglibc_cache
>> | configure: error: `CFLAGS' has changed since the previous run:
>> | configure:   former value:  `...'
>> | configure:   current value: `...'
>> | configure: error: in
>> `/.../tmp-eglibc/work/mips32el-oe-linux/eglibc/2.16-r11.micro1
>> +svnr20393/site_config_cheetah':
>> | configure: error: changes in the environment can compromise the build
>> | configure: error: run `make distclean' and/or `rm eglibc_cache' and
>> start over
>> | DEBUG: Python function siteconfig_do_siteconfig finished
>> | DEBUG: Python function autotools_do_siteconfig finished
>> | DEBUG: Python function do_siteconfig finished
>> | DEBUG: Python function sstate_task_postfunc finished
>> ERROR: Task 30 (.../oe-core/meta/recipes-core/eglibc/eglibc_2.16.bb,
>> do_populate_sysroot) failed with exit code '1'
>
> I also ran into this and have posted a fix (to siteconfig.bbclass) which
> once applied let my build continue.

I've seen this now:

ERROR: Logfile of failure stored in:
/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tm=
p/work/armv7a-vfp-neon-poky-linux-gnueabi/flex-2.5.35-r3/temp/log.do_config=
ure.26311
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Removing manifest:
/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tm=
p/sysroots/beagleboard/usr/include/FlexLexer.h
| DEBUG: Removing manifest:
/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tm=
p/sysroots/beagleboard/usr/lib/libfl.a
| DEBUG: Removing manifest:
/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tm=
p/sysroots/beagleboard/usr/lib/libfl_pic.a
| DEBUG: Removing manifest:
/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tm=
p/sysroots/beagleboard/usr/include/
| DEBUG: Removing manifest:
/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tm=
p/sysroots/beagleboard/usr/share/
| DEBUG: Removing manifest:
/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tm=
p/sysroots/beagleboard/usr/lib/
| DEBUG: Removing manifest:
/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tm=
p/sysroots/beagleboard/usr/
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.12.3
| Copyright (C) 2012 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later
<http://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.12
| NOTE: Executing autoreconf --verbose --install --force
--exclude=3Dautopoint -I
/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tm=
p/work/armv7a-vfp-neon-poky-linux-gnueabi/flex-2.5.35-r3/flex-2.5.35/m4/
-I/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/=
tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12
-I /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master=
/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/flex-2.5.35-r3/flex-2.5.35/acl=
ocal-copy/
| autoreconf: Entering directory `.'
| autoreconf: running: aclocal -I
/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tm=
p/work/armv7a-vfp-neon-poky-linux-gnueabi/flex-2.5.35-r3/flex-2.5.35/m4/
-I /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master=
/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12
-I /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master=
/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/flex-2.5.35-r3/flex-2.5.35/acl=
ocal-copy/
-I /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master=
/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/flex-2.5.35-r3/flex-2.5.35/m4/
-I /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master=
/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12
-I /local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master=
/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/flex-2.5.35-r3/flex-2.5.35/acl=
ocal-copy/
--force -I m4
| aclocal: error: aclocal: file
'/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/t=
mp/sysroots/x86_64-linux/usr/share/aclocal/gconf-2.m4'
does not exist
| autoreconf: aclocal failed with exit status: 1
| ERROR: autoreconf execution failed.
| ERROR: Function failed: do_configure (see
/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tm=
p/work/armv7a-vfp-neon-poky-linux-gnueabi/flex-2.5.35-r3/temp/log.do_config=
ure.26311
for further information)

-M=



