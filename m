Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 61FFF79DAB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 06:46:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBL6kIGd000545
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Dec 2018 22:46:19 -0800 (PST)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.138]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0415.000;
	Thu, 20 Dec 2018 22:46:18 -0800
From: "Yang, Liezhi" <Liezhi.Yang@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/1] oeqa/concurrencytest: fix for locating
	meta-selftest
Thread-Index: AQHUmEy/w4ZomjSEkUGOXlJiPDSfr6WH9x4AgAAa6gCAAC6agIAAgIRw
Date: Fri, 21 Dec 2018 06:46:18 +0000
Message-ID: <07C4F012-C254-4757-8E18-A2042A893226@windriver.com>
References: <cover.1545291716.git.liezhi.yang@windriver.com>
	<29e6785a8b38d49961aa7f1138d664336052dca8.1545291716.git.liezhi.yang@windriver.com>
	<53c222052c0da6a7db056bfa1318371c8b7db2dc.camel@linuxfoundation.org>
	<50ccbdb3-12b8-e381-5931-b52b5b5efdf5@windriver.com>
	<75d63f87f2ea25effa7707b735b2123ed2156ea4.camel@linuxfoundation.org>,
	<7f4d5364472280b622057a82fbf9dcfd11dfc17b.camel@linuxfoundation.org>
In-Reply-To: <7f4d5364472280b622057a82fbf9dcfd11dfc17b.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oeqa/concurrencytest: fix for locating meta-selftest
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
X-List-Received-Date: Fri, 21 Dec 2018 06:46:20 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi RP,

Sorry, I am on vacation today, will do more investigations next week.

// Robert

Sent from mobile phone

> =1B$B:_=1B(B 2018=1B$BG/=1B(B12=1B$B7n=1B(B20=1B$BF|!$=1B(B23:06=1B$B!$=
=1B(BRichard Purdie <richard.purdie@linuxfoundation.org> =1B$B<LF;!'=1B(B
>=20
> On Thu, 2018-12-20 at 12:19 +0000, richard.purdie@linuxfoundation.org
> wrote:
>> On Thu, 2018-12-20 at 18:43 +0800, Robert Yang
>> wrote:                    bb.utils.mkdirhier(newbuilddir)
>>=20
>> This broke on our autobuilder:
>>=20
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/61
>>=20
>> It basically creates a "stampeding herd" of bitbake startups as if
>> you
>> specify -j 40, it would do this 40 times nearly all at once and that
>> causes retry problems.
>>=20
>> We need to move the call outside the for loop as the value doesn't
>> change.
>=20
> I fixed the patch but it raises some questions about the way bitbake is
> behaving. I wrote a test script:
>=20
> #!/usr/bin/env python3
>=20
> import os
> import sys
> import subprocess
>=20
> for i in range(50):
>    sys.stdout.flush()
>    sys.stderr.flush()
>    pid =3D os.fork()
>    if pid =3D=3D 0:
>        ourpid =3D os.getpid()
>        print("Starting %s" % ourpid)
>        sys.stdout.flush()
>        newsi =3D os.open(os.devnull, os.O_RDWR)
>        os.dup2(newsi, sys.stdin.fileno())
>        try:
>            output =3D subprocess.check_output("bitbake -e bash | grep PN=
=3D", shell=3DTrue, stderr=3Dsubprocess.STDOUT).decode("utf-8")
>        except subprocess.CalledProcessError as e:
>            print("output: %s" % e.output.decode("utf-8"))
>            os._exit(e.returncode)
>        print("output: %s" % output)
>        os._exit(0)
>=20
> which is a bit crazy shows some errors both on the console and in the
> bitbake-cookerdaemon log and shows that closing the UI connections when
> we have a client is not the right thing to be doing.
>=20
> This may give some insight into some of the oe-selftest failures and
> I'm looking at how to improve this behaviour...
>=20
> (added Chen Qi+Randy to cc as well)
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20

