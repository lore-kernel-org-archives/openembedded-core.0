Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPrIx-0004i8-Ej
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 09:17:55 +0200
Received: by wwb17 with SMTP id 17so1276428wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 00:14:47 -0700 (PDT)
Received: by 10.216.221.77 with SMTP id q55mr6750982wep.17.1306480486464;
	Fri, 27 May 2011 00:14:46 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w58sm779636weq.1.2011.05.27.00.14.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 00:14:45 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306452822.27470.220.camel@rex>
Date: Fri, 27 May 2011 09:14:44 +0200
Message-Id: <FD9AE248-A10D-4079-B66F-8F4AB94B94F7@dominion.thruhere.net>
References: <cover.1306442263.git.nitin.a.kamble@intel.com>
	<03152273cac84eef23738c5f26c45b082194284f.1306442263.git.nitin.a.kamble@intel.com>
	<1306452822.27470.220.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [bugfix 1/1] mesa-xlib: workaround gcc 4.6.0 ICE
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
X-List-Received-Date: Fri, 27 May 2011 07:17:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 mei 2011, om 01:33 heeft Richard Purdie het volgende geschreven:

> On Thu, 2011-05-26 at 13:41 -0700, nitin.a.kamble@intel.com wrote:
>=20
>> ---
>> meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb |    3 +++
>> 1 files changed, 3 insertions(+), 0 deletions(-)
>>=20
>> diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb =
b/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
>> index b77df2c..051bd72 100644
>> --- a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
>> +++ b/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
>> @@ -17,3 +17,6 @@ PE =3D "1"
>> PR =3D "r0"
>>=20
>> EXTRA_OECONF +=3D "--with-driver=3Dxlib"
>> +
>> +# nullify -O2
>> +CFLAGS_append +=3D " -O"
>=20
> I talked about this on IRC but simply put, no way.
>=20
> The problem is:
>=20
> a) Arm specific
> b) determined now to be armv7 specific
> c) gcc version specific
>=20
> and the fix should reflect this.
>=20
> So ideally when we select gcc 4.6 in tcmode-default.inc we should add
> something there which adds a work around for mesa-xlib.
>=20
> I've suggested something like:
>=20
> TARGET_CC_ARCH_arm_pn-mesa-xlib :=3D =
"${@'${TARGET_CC_ARCH}'.replace('armv7','armv5')}"
>=20
> which whilst ugly, should do what we need it to.

So how do I opt out of that? I don't use gcc 4.6 and suddenly mesa gets =
compiled for a suboptimal architecture.=


