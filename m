Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@beagleboard.org>) id 1PzY1W-00066L-G0
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 18:27:10 +0100
Received: by wwb17 with SMTP id 17so909927wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 10:25:28 -0700 (PDT)
Received: by 10.216.121.130 with SMTP id r2mr11934629weh.96.1300209928275;
	Tue, 15 Mar 2011 10:25:28 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id n73sm13045wej.12.2011.03.15.10.25.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 10:25:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@beagleboard.org>
In-Reply-To: <4D7F9CC2.2030002@linux.intel.com>
Date: Tue, 15 Mar 2011 18:25:26 +0100
Message-Id: <01E6B9D2-7458-4A26-A34A-75FD106E054B@beagleboard.org>
References: <161e1f47c2460d5b2463300e31bf5eebb46b8698.1300172958.git.dvhart@linux.intel.com>
	<ACE0CCC0-8D25-4FC2-93B2-73C60636721A@beagleboard.org>
	<4D7F9CC2.2030002@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: [PATCH] [RFC] kernel: rework kernel and module classes to allow for building out-of-tree modules
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
X-List-Received-Date: Tue, 15 Mar 2011 17:27:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 mrt 2011, om 18:07 heeft Darren Hart het volgende geschreven:

>=20
>=20
> On 03/15/2011 01:31 AM, Koen Kooi wrote:
>>=20
>> Op 15 mrt 2011, om 08:25 heeft Darren Hart het volgende geschreven:
>>=20
>>> NOT FOR INCLUSION
>>>=20
>>> Before we include something like this, it needs review from folks
>>> like Koen and Gary to confirm it works in their environment as
>>> well.
>>>=20
>>> The existing infrastructure uses an external build tree which
>>> references the kernel source in the work dir. If run with rm work,
>>> building external modules will fail.
>>>=20
>>> This patch places a configured source tree in sysroots. Striking a
>>> balance between minimal size and minimal maintenance is difficult.
>>> This version leans on the side of caution and removes only the
>>> obviously unecessary parts of the source tree to conserve space.
>>>=20
>>> Care is also taken to clean the hostprogs in scripts, and the
>>> modules are responsible for building them as needed.
>>=20
>> I get this:
>>=20
>> | cp: cannot open
>> =
`./.pc/0001-PSP-3.0.1.6-kernel-source-patched-with-OCF-Linux.patch/crypto/=
ocf/ixp4xx/ixp4xx.c'
>> for reading: Permission denied
>>=20
>> After adding 'do_make_scripts' in my module do_compile and applying
>> your patch. So it seems to be tripping on the quilt directory :(
>=20
> What are the ownership and perms on those?

drwxr-xr-x 126 koen koen   16384 2011-03-10 15:42 .pc/

and

drwxr-xr-x   5 koen koen  4096 2011-03-10 15:42 =
0001-Added-Crane-Board-support.patch/
drwxr-xr-x   3 koen koen  4096 2011-03-10 15:42 =
0001-BeagleBoard-Adjust-USER-button-pin-for-xM.patch/
drwxr-xr-x   4 koen koen  4096 2011-03-10 15:42 =
0001-mt9t111-first-stab-at-merging-sensor-driver-based-on.patch/

etc.

and finally:

---------- 1 koen koen 0 2011-03-10 15:42 =
git/.pc/0001-PSP-3.0.1.6-kernel-source-patched-with-OCF-Linux.patch/crypto=
/ocf/ixp4xx/ixp4xx.c

> I suppose we could avoid the .pc directory - but it's going to require =
something more than cp or some additional scripting. Something like =
tar's exclude functionality might be needed - but I hate to add the =
intermediate step as the kernel recipes are already so slow.

It's that or forbidding people to apply patches to the kernel :)

regards,

Koen=


