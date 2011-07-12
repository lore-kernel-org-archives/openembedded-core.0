Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QggU8-0007cP-VT
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 19:11:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6CH73Wl004021
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 10:07:03 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 12 Jul 2011 10:07:02 -0700
Message-ID: <4E1C7F36.1080501@windriver.com>
Date: Tue, 12 Jul 2011 12:07:02 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1865303E0DED764181A9D882DEF65FB6A167F0C70B@shsmsx502.ccr.corp.intel.com><4E095480.3070001@windriver.com><1309266943.20015.290.camel@rex><4E09E8B7.1070901@windriver.com><0C757E680E33864AB113392C7E83F910BE518E@GSX300A.mxchg.m.corp><1865303E0DED764181A9D882DEF65FB6A200B1C937@shsmsx502.ccr.corp.intel.com>	<CACzvQmYM-Tn0xWL9Hc3hyn8EEUeZjbkfTDOYskETJrq7=TB77A@mail.gmail.com>
	<0C757E680E33864AB113392C7E83F910BE5196@GSX300A.mxchg.m.corp>
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE5196@GSX300A.mxchg.m.corp>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p6CH73Wl004021
Subject: Re: [Draft design][RFC] Running postinst at rootfs	generation time
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
X-List-Received-Date: Tue, 12 Jul 2011 17:11:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

On 7/5/11 5:06 AM, Hauser, Wolfgang (external) wrote:
> To build a read-only image, we have to set up an extra layer where we m=
odified all packages they cause a runtime modification.
>=20
> Especially we have to cover some adduser/addgroup issues, modify the vo=
latile file handling for our needs, and for omap3 graphics the handling o=
f the GLES version.
> A failed offline postinst causing a runtime configuration. So the image=
 generation log has to be checked for such failing scripts.

Just an FYI, with the new adduser/group code.. that should no longer be o=
ne of
the contributing factors.. we can now add users and groups during recipe =
/
rootfs construction.

> Some of the packages (e.g. dropbear) are prepared for supporting read-o=
nly filesystems. Most packages are not.
>=20
> The problem with the alphabetic order of the postinst scripts we manage=
d by renaming some of the packages to fit the needed order. An ugly solut=
ion, but in case of missing python skills, the easiest.

Ya, this one bothers me slightly... and I'm not really sure how to solve =
it...

--Mark

> Nice to see someone having the same needs we have to fit.
> =20
> Regards
> Wolfgang Hauser
>=20
> -----Urspr=FCngliche Nachricht-----
> Von: Tom Parkin [mailto:tom.parkin@gmail.com]=20
> Gesendet: Dienstag, 5. Juli 2011 10:42
> An: Patches and discussions about the oe-core layer
> Cc: Hauser, Wolfgang (external)
> Betreff: Re: [OE-core] [Draft design][RFC] Running postinst at rootfs g=
eneration time
>=20
> I'm interested to read about this initiative as we've recently
> stumbled over the issue of postinst scripts in trying to port our
> build to OE.
>=20
> So far it seems the primary concern is about the boot-time impact of
> postinst on the target.  But for the use-cases I'm interested in, we
> need to capture all install processes as a part of the build in order
> to output a fully-provisioned read-only rootfs image (e.g. squashfs).
> Our boxes don't typically modify their filesystems at runtime, other
> than to take full updates (completely new rootfs images).
>=20
> I think the reduction, or even elimination, of target-run postinst
> scripts would help a lot with the read-only rootfs case.
>=20
> Tom
>=20
> On 4 July 2011 01:23, Cui, Dexuan <dexuan.cui@intel.com> wrote:
>> Hauser, Wolfgang (external) wrote:
>>> Beside the discussed changes, the postinst scripts should be executed
>>> in the dependency order.
>>> At the time, the scripts are executed in alphabetic order, which
>>> breaks the image generation if depended packages are not in
>>> alphabetic order.
>>>
>>> e.g. busybox and busybox subpackages (busybox-mdev).
>>>
>>> Regards
>>> Wolfgang Hauser
>>>
>>
>> Thank all for the suggestions!
>> I created a wiki page to summarize the mail threads:
>> https://wiki.yoctoproject.org/wiki/Run_postinst_during_rootfs_generati=
on
>>
>> Thanks,
>> -- Dexuan
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>=20
>=20
>=20



