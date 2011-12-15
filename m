Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RbD0D-0007As-1t
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 16:13:45 +0100
Received: by werm13 with SMTP id m13so128587wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 07:06:47 -0800 (PST)
Received: by 10.216.134.69 with SMTP id r47mr1448773wei.17.1323961607058;
	Thu, 15 Dec 2011 07:06:47 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fw16sm9697693wbb.13.2011.12.15.07.06.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 07:06:46 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1323961117.4568.41.camel@ted>
Date: Thu, 15 Dec 2011 16:06:52 +0100
Message-Id: <8A9F3915-1804-4B78-A84C-5721FFD6E5FB@dominion.thruhere.net>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<1323793193-31090-4-git-send-email-dbaryshkov@gmail.com>
	<1323961117.4568.41.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/9] consolekit: fix sdk generation issues
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
X-List-Received-Date: Thu, 15 Dec 2011 15:13:45 -0000
X-Groupsio-MsgNum: 14260
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0263522B-604D-4CB9-8812-CED2EF09E320";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0263522B-604D-4CB9-8812-CED2EF09E320
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 15 dec. 2011, om 15:58 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-12-13 at 20:19 +0400, Dmitry Eremin-Solenikov wrote:
>> Currently sdk generation might fail with the following error:
>> | Collected errors:
>> |  * extract_archive: Cannot create symlink from ./var/log to
>> 'volatile/log': File exists.
>> ERROR: Function 'do_populate_sdk' failed
>>=20
>> This happens as consolekit package will include both =
/var/log/ConsoleKit
>> and /var/volatile/log/ConsoleKit files:
>> lumag@fangorn:~/OE-scripts$ dpkg-deb -c =
build/tmp--eglibc/deploy/ipk/core2/consolekit_0.4.5-r7_core2.ipk  | grep =
var
>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/
>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/log/
>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/log/ConsoleKit/
>> lrwxrwxrwx root/root         0 2011-12-07 22:12 ./var/run -> =
volatile/run
>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/
>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/log/
>> drwxr-xr-x root/root         0 2011-12-07 22:12 =
./var/volatile/log/ConsoleKit/
>> drwxr-xr-x root/root         0 2011-12-07 22:12 ./var/volatile/run/
>> drwxr-xr-x root/root         0 2011-12-07 22:12 =
./var/volatile/run/ConsoleKit/
>>=20
>> Inclusion of both log directories causes this error. Drop the
>> /var/log/ConsoleKit
>> in favour of /var/volatile/log
>>=20
>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>=20
> This effectively reverts:
> =
http://git.openembedded.org/openembedded-core/commit/?id=3D5608a748af2c754=
f60137ab7c3010ccce6bf9e40
> so I think this fixes one problem at the expense of causing another.
> Koen: Any comments?

If you revert it consolekit won't work at runtime because it fails to =
start.=

--Apple-Mail=_0263522B-604D-4CB9-8812-CED2EF09E320
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEUEARECAAYFAk7qDQwACgkQMkyGM64RGpExTgCgnEI3uTf1fNq46mhr9wg8HQF7
E5QAlReVoTthbHq4UlLa0pcwxnaQj98=
=BEGV
-----END PGP SIGNATURE-----

--Apple-Mail=_0263522B-604D-4CB9-8812-CED2EF09E320--
