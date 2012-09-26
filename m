Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TH1V2-00075R-Ag
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 01:58:40 +0200
Received: from mail22-tx2-R.bigfish.com (10.9.14.251) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.23; Wed, 26 Sep 2012 23:45:48 +0000
Received: from mail22-tx2 (localhost [127.0.0.1])	by mail22-tx2-R.bigfish.com
	(Postfix) with ESMTP id 75115A02F0;
	Wed, 26 Sep 2012 23:45:48 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I936eI1432Id6f1izz1202h1d1ah1d2ahzz17326ah8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6hbe9i1155h)
Received: from mail22-tx2 (localhost.localdomain [127.0.0.1]) by mail22-tx2
	(MessageSwitch) id 134870313012034_7479; Wed, 26 Sep 2012 23:45:30 +0000
	(UTC)
Received: from TX2EHSMHS015.bigfish.com (unknown [10.9.14.241])	by
	mail22-tx2.bigfish.com (Postfix) with ESMTP id E7A9CC0342;
	Wed, 26 Sep 2012 23:45:29 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS015.bigfish.com
	(10.9.99.115) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 26 Sep 2012 23:45:29 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Wed, 26 Sep 2012 18:45:29 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Phil Blundell <philb@gnu.org>
Thread-Topic: [OE-core] [PATCH] autotools.bbclass: Add functionality to
	force a clean of ${B} when reconfiguring (and ${S} != ${B})
Thread-Index: AQHNnEECfL1E4UWqx0aMO7pDFucQTg==
Date: Wed, 26 Sep 2012 23:45:28 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6AE149@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1347373349.2122.35.camel@ted>
	<1348679272.32611.4.camel@phil-desktop>
In-Reply-To: <1348679272.32611.4.camel@phil-desktop>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 26 Sep 2012 23:58:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <AFB791735DEAD642A0FBC4C612E786E8@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2012 at 12:07 PM, Phil Blundell <philb@gnu.org> wrote:
> On Tue, 2012-09-11 at 15:22 +0100, Richard Purdie wrote:
>> Unfortunately whilst rerunning configure and make against a project will=
 mostly
>> work there are situations where it does not correctly do the right thing=
.
>>
>> In particular, eglibc and gcc will fail out with errors where settings
>> do not match a previously built configuration. It could be argued they a=
re
>> broken but the situation is what it is. There is the possibility of more=
 subtle
>> errors too.
>
> FWIW, I just encountered another instance of what appears to be a
> similar problem (with this patch applied).  I had changed my CFLAGS to
> work around a compiler problem and then just reran the build, which led
> eventually to:
>
> ERROR: Function failed: do_siteconfig_gencache
> (see ..../tmp-eglibc/work/mips32el-oe-linux/eglibc/2.16-r11.micro1
> +svnr20393/temp/log.do_populate_sysroot.6005 for further information)
> ERROR: Logfile of failure stored
> in: ..../tmp-eglibc/work/mips32el-oe-linux/eglibc/2.16-r11.micro1
> +svnr20393/temp/log.do_populate_sysroot.6005
> Log data follows:
> | DEBUG: Executing python function sstate_task_prefunc
> [...]
> | DEBUG: Executing shell function do_siteconfig_gencache
> | configure: WARNING: unrecognized options: --disable-silent-rules,
> --disable-dependency-tracking, --with-libtool-sysroot
> | configure: loading cache eglibc_cache
> | configure: error: `CFLAGS' has changed since the previous run:
> | configure:   former value:  `...'
> | configure:   current value: `...'
> | configure: error: in
> `/.../tmp-eglibc/work/mips32el-oe-linux/eglibc/2.16-r11.micro1
> +svnr20393/site_config_cheetah':
> | configure: error: changes in the environment can compromise the build
> | configure: error: run `make distclean' and/or `rm eglibc_cache' and
> start over
> | DEBUG: Python function siteconfig_do_siteconfig finished
> | DEBUG: Python function autotools_do_siteconfig finished
> | DEBUG: Python function do_siteconfig finished
> | DEBUG: Python function sstate_task_postfunc finished
> ERROR: Task 30 (.../oe-core/meta/recipes-core/eglibc/eglibc_2.16.bb,
> do_populate_sysroot) failed with exit code '1'

I'll add another. I've seen this:

| DEBUG: Executing python function do_siteconfig
| DEBUG: Executing python function autotools_do_siteconfig
| DEBUG: Executing python function siteconfig_do_siteconfig
| DEBUG: Executing shell function do_siteconfig_gencache
| configure: WARNING: unrecognized options: --disable-silent-rules,
--disable-dependency-tracking, --with-libtool-sysroot
| configure: loading cache ncurses_cache
| configure: error: `CC' has changed since the previous run:
| configure:   former value:  `arm-poky-linux-gnueabi-gcc
-march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork
-mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8
--sysroot=3D/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/po=
ky/master/tmp/sysroots/beagleboard'
| configure:   current value: `arm-poky-linux-gnueabi-gcc
-march=3Darmv7-a     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon
-mtune=3Dcortex-a8
--sysroot=3D/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/po=
ky/master/tmp/sysroots/beagleboard'
| configure: error: `CPP' has changed since the previous run:
| configure:   former value:  `arm-poky-linux-gnueabi-gcc -E
--sysroot=3D/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/po=
ky/master/tmp/sysroots/beagleboard
 -march=3Darmv7-a -fno-tree-vectorize     -mthumb-interwork
-mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8'
| configure:   current value: `arm-poky-linux-gnueabi-gcc -E
--sysroot=3D/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/po=
ky/master/tmp/sysroots/beagleboard
 -march=3Darmv7-a     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon
-mtune=3Dcortex-a8'
| configure: error: in
`/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/t=
mp/work/armv7a-vfp-neon-poky-linux-gnueabi/ncurses-5.9-r10.1/site_config_be=
agleboard':
| configure: error: changes in the environment can compromise the build
| configure: error: run `make distclean' and/or `rm ncurses_cache' and
start over
| DEBUG: Python function siteconfig_do_siteconfig finished
| DEBUG: Python function autotools_do_siteconfig finished
| DEBUG: Python function do_siteconfig finished
| DEBUG: Python function sstate_task_postfunc finished
| ERROR: Function failed: do_siteconfig_gencache (see
/local/yocto/upstream/label/fedora17-64b/machine/beagleboard/poky/master/tm=
p/work/armv7a-vfp-neon-poky-linux-gnueabi/ncurses-5.9-r10.1/temp/log.do_pop=
ulate_sysroot.30243
for further information)
NOTE: recipe ncurses-5.9-r10.1: task do_populate_sysroot: Failed

-M

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



