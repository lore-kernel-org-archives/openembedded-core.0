Received: from mail.eads.net ([80.156.45.113])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1Qe2kV-0005Cg-Nw for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:20:59 +0200
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p65A6H0o024226; 
	Tue, 5 Jul 2011 12:06:18 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 5 Jul 2011 12:06:19 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 5 Jul 2011 12:06:20 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE5196@GSX300A.mxchg.m.corp>
In-Reply-To: <CACzvQmYM-Tn0xWL9Hc3hyn8EEUeZjbkfTDOYskETJrq7=TB77A@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [OE-core] [Draft design][RFC] Running postinst at rootfs
	generation time
Thread-Index: Acw673kngRfUUeFRQSihhe4Dj5hGNAACNfCw
References: <1865303E0DED764181A9D882DEF65FB6A167F0C70B@shsmsx502.ccr.corp.intel.com><4E095480.3070001@windriver.com><1309266943.20015.290.camel@rex><4E09E8B7.1070901@windriver.com><0C757E680E33864AB113392C7E83F910BE518E@GSX300A.mxchg.m.corp><1865303E0DED764181A9D882DEF65FB6A200B1C937@shsmsx502.ccr.corp.intel.com>
	<CACzvQmYM-Tn0xWL9Hc3hyn8EEUeZjbkfTDOYskETJrq7=TB77A@mail.gmail.com>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
X-OriginalArrivalTime: 05 Jul 2011 10:06:19.0915 (UTC)
	FILETIME=[2FBEFDB0:01CC3AFB]
Subject: Re: [Draft design][RFC] Running postinst at rootfs generation time
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
X-List-Received-Date: Tue, 05 Jul 2011 10:20:59 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

To build a read-only image, we have to set up an extra layer where we =
modified all packages they cause a runtime modification.

Especially we have to cover some adduser/addgroup issues, modify the =
volatile file handling for our needs, and for omap3 graphics the =
handling of the GLES version.
A failed offline postinst causing a runtime configuration. So the image =
generation log has to be checked for such failing scripts.

Some of the packages (e.g. dropbear) are prepared for supporting =
read-only filesystems. Most packages are not.

The problem with the alphabetic order of the postinst scripts we managed =
by renaming some of the packages to fit the needed order. An ugly =
solution, but in case of missing python skills, the easiest.

Nice to see someone having the same needs we have to fit.
=20
Regards
Wolfgang Hauser

-----Urspr=FCngliche Nachricht-----
Von: Tom Parkin [mailto:tom.parkin@gmail.com]=20
Gesendet: Dienstag, 5. Juli 2011 10:42
An: Patches and discussions about the oe-core layer
Cc: Hauser, Wolfgang (external)
Betreff: Re: [OE-core] [Draft design][RFC] Running postinst at rootfs =
generation time

I'm interested to read about this initiative as we've recently
stumbled over the issue of postinst scripts in trying to port our
build to OE.

So far it seems the primary concern is about the boot-time impact of
postinst on the target.  But for the use-cases I'm interested in, we
need to capture all install processes as a part of the build in order
to output a fully-provisioned read-only rootfs image (e.g. squashfs).
Our boxes don't typically modify their filesystems at runtime, other
than to take full updates (completely new rootfs images).

I think the reduction, or even elimination, of target-run postinst
scripts would help a lot with the read-only rootfs case.

Tom

On 4 July 2011 01:23, Cui, Dexuan <dexuan.cui@intel.com> wrote:
> Hauser, Wolfgang (external) wrote:
>> Beside the discussed changes, the postinst scripts should be executed
>> in the dependency order.
>> At the time, the scripts are executed in alphabetic order, which
>> breaks the image generation if depended packages are not in
>> alphabetic order.
>>
>> e.g. busybox and busybox subpackages (busybox-mdev).
>>
>> Regards
>> Wolfgang Hauser
>>
>
> Thank all for the suggestions!
> I created a wiki page to summarize the mail threads:
> =
https://wiki.yoctoproject.org/wiki/Run_postinst_during_rootfs_generation
>
> Thanks,
> -- Dexuan
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
Tom Parkin
www.thesecretdogproject.com
Morality, like art, means drawing a line someplace /Wilde/


