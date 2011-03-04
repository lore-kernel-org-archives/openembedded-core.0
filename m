Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PvSYL-0005fA-T0
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 11:48:10 +0100
Received: by wwe15 with SMTP id 15so2188309wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2011 02:46:37 -0800 (PST)
Received: by 10.227.150.17 with SMTP id w17mr420162wbv.95.1299235597322;
	Fri, 04 Mar 2011 02:46:37 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m2sm746620wer.13.2011.03.04.02.46.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 02:46:36 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4D6FC0D5.8@windriver.com>
Date: Fri, 4 Mar 2011 11:46:35 +0100
Message-Id: <89C3C3DC-73AA-48F7-A737-5FEEFFFAA07A@dominion.thruhere.net>
References: <394EA6D4-E718-4BE7-93A2-6AF67AAF6E0D@dominion.thruhere.net>
	<4D6FC05B.6040908@windriver.com> <4D6FC0D5.8@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: lots of WARNING: QA Issue: Bit size did not match (32 to	0) warnings, what do they mean?
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
X-List-Received-Date: Fri, 04 Mar 2011 10:48:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I can confirm your patches fixes it, thanks!

Op 3 mrt 2011, om 17:24 heeft Mark Hatle het volgende geschreven:

> I found the issue.  Somewhere in a code merge in lib/oe/qa.py =
"self.bits =3D 32"
> became "self.bits =3D=3D 32"
>=20
> lines 43 and 45 are incorrect.  I'll submit a patch shortly to resolve =
this.
>=20
> --Mark
>=20
>> On 3/3/11 9:45 AM, Koen Kooi wrote:
>>>> Hi,
>>>>=20
>>>> I started noticing a lot of warnings like this:
>>>>=20
>>>> WARNING: QA Issue: Bit size did not match (32 to 0) on =
/work/armv7a-angstrom-linux-gnueabi/udev-165-r2/packages-split/udev/sbin/u=
devd
>> If the file is an ELF file, there are specific checks that are =
performed,
>> machine type, os type.. and bit size.  (I suspect the QA message for =
all of them
>> probably need to be improved.)
>>=20
>> What I find interesting is it came back as "0".  0 indicates that the =
elf
>> comparison loader was never run.. 0 is "unknown".  (32 and 64 are =
obvious values...)
>>=20
>> The code that determines the size is in meta/lib/oe/qa.py.  The =
normal use of
>> the code is from the meta/classes/insane.bbclass function.  The fact =
the
>> comparison returned a 0 indicates that the qa.py functions did not =
run.  This
>> could be a bug in meta/lib/oe/qa.py, or it could be that the routine =
call in
>> package_qa_walk (in insane.bbclass) failed for some reason and =
something went
>> wrong with the exception handler?
>>=20
>>>> What do they mean and how can I (help to) fix them?
>> First thing to do is check the binary that is being referenced and =
verify that
>> it is infact a valid ARM EABI binary.  Assuming it is file, we need =
to track
>> down the code likely starting in qa.py and figure out why it didn't =
determine
>> the bit size.
>>=20
>> --Mark
>>=20
>>>> regards,
>>>>=20
>>>> Koen
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



