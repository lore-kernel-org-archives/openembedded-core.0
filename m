Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD8716D74B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Feb 2019 01:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1A7581830E;
	Sun, 10 Feb 2019 02:29:23 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id vwt1GZz9kJPN; Sun, 10 Feb 2019 02:29:22 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id EBE49182AA;
	Sun, 10 Feb 2019 02:29:21 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D91E01E057;
	Sun, 10 Feb 2019 02:29:21 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD36B1E056;
	Sun, 10 Feb 2019 02:29:21 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Sun, 10 Feb 2019 02:29:21 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id BE89F1DA;
	Sun, 10 Feb 2019 02:29:21 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sun, 10 Feb 2019 02:29:21 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Sun, 10 Feb 2019 02:29:21 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] glibc-locale: Rewrite do_install using install
	utility instead of cp
Thread-Index: AQHUvsO2NPNJPiVEfkiTK0smTe4s2KXYM3gA
Date: Sun, 10 Feb 2019 01:29:21 +0000
Message-ID: <770bd2ba38ec4688a45c1df281a1e112@XBOX04.axis.com>
References: <20190207003537.7135-1-raj.khem@gmail.com>
	<88a02e81ed831ed4fba8adbd9e18f1a35dbf098d.camel@linuxfoundation.org>
In-Reply-To: <88a02e81ed831ed4fba8adbd9e18f1a35dbf098d.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] glibc-locale: Rewrite do_install using install utility instead of cp
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
X-List-Received-Date: Sun, 10 Feb 2019 01:29:23 -0000
X-Groupsio-MsgNum: 121022
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_770bd2ba38ec4688a45c1df281a1e112XBOX04axiscom_"

--_002_770bd2ba38ec4688a45c1df281a1e112XBOX04axiscom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 7 februari 2019 10:01
> To: Khem Raj <raj.khem@gmail.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] glibc-locale: Rewrite do_install using
> install utility instead of cp
>=20
> On Wed, 2019-02-06 at 16:35 -0800, Khem Raj wrote:
> > This has been a constant source of trouble for build failures due to
> host-user-contaminated QA
> > errors of sort
> >
> > ERROR: QA Issue: glibc-locale: /glibc-binary-localedata-ca-
> es+valencia/usr/lib/locale/ca_ES@valencia/LC_MONETARY is owned by uid
> 3004, which is the same as the user running bitbake. This may be due to
> host contamination [host-user-contaminated]
> >
> > So far we have tried to mould cp command into not carrying the build
> > user permissions into install area but it is never entirely fixed
> since
> > the issue keeps popping up in various scenes
> >
> > This patch replaces use of cp with install utility and specifies
> install
> > mode for files explcitly
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/glibc/glibc-locale.inc | 44 ++++++++++++++--------
> --
> >  1 file changed, 25 insertions(+), 19 deletions(-)
> >
> > diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-
> core/glibc/glibc-locale.inc
> > index 6384f9cbf1..9b256a5108 100644
> > --- a/meta/recipes-core/glibc/glibc-locale.inc
> > +++ b/meta/recipes-core/glibc/glibc-locale.inc
> > @@ -72,27 +72,33 @@ FILES_localedef =3D "${bindir}/localedef"
> >  LOCALETREESRC =3D "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-
> locale"
> >
> >  do_install () {
> > -	mkdir -p ${D}${bindir} ${D}${datadir}
> > -	if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
> > -		cp -R --no-dereference --preserve=3Dmode,links
> ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
> > -	fi
> > -	if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
> > -		mkdir -p ${D}${localedir}
> > -		cp -R --no-dereference --preserve=3Dmode,links
> ${LOCALETREESRC}/${localedir}/* ${D}${localedir}
> > -	fi
> > +        install -d ${D}${bindir}
> > +        find "${LOCALETREESRC}/${bindir}" -maxdepth 1 -type f \
> > +        -exec install -m 0755 -t "${D}${bindir}" {} \;
> > +
> > +        for d in . $(find "${LOCALETREESRC}/${localedir}" -type d -
> printf '%P ') ; do
> > +                install -d "${D}${localedir}/$d"
> > +                find "${LOCALETREESRC}/${localedir}/$d" -maxdepth 1
> -type f \
> > +                -exec install -m 0644 -t "${D}${localedir}/$d" {} \;
> > +        done
> >  	if [ ${@d.getVar('PACKAGE_NO_GCONV')} -eq 0 ]; then
> > -		mkdir -p ${D}${libdir}
> > -		if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
> > -			cp -R --no-dereference --
> preserve=3Dmode,links ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
> > -		fi
> > -		if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
> > -			cp -R --no-dereference --
> preserve=3Dmode,links ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
> > -		fi
> > -	fi
> > -	if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
> > -		cp -R --no-dereference --preserve=3Dmode,links
> ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
> > +                for d in . $(find "${LOCALETREESRC}/${libdir}/gconv"
> -type d -printf '%P ') ; do
> > +                        install -d "${D}${libdir}/gconv/$d"
> > +                        find "${LOCALETREESRC}/${libdir}/gconv/$d" -
> maxdepth 1 -type f \
> > +                        -exec install -m 0755 -t
> "${D}${libdir}/gconv/$d" {} \;
> > +                done
> > +                for d in . $(find "${LOCALETREESRC}/${datadir}/i18n"
> -type d -printf '%P ') ; do
> > +                        install -d "${D}${datadir}/i18n/$d"
> > +                        find "${LOCALETREESRC}/${datadir}/i18n/$d" -
> maxdepth 1 -type f \
> > +                        -exec install -m 0644 -t
> "${D}${datadir}/i18n/$d" {} \;
> > +                done
> >  	fi
> > -	cp -R --no-dereference --preserve=3Dmode,links
> ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
> > +        for d in . $(find "${LOCALETREESRC}/${datadir}/locale" -type
> d -printf '%P ') ; do
> > +                install -d "${D}${datadir}/locale/$d"
> > +                find "${LOCALETREESRC}/${datadir}/locale/$d" -
> maxdepth 1 -type f \
> > +                -exec install -m 0644 -t "${D}${datadir}/locale/$d"
> {} \;
> > +        done
> > +	install -m 0644 ${LOCALETREESRC}/SUPPORTED
> ${WORKDIR}/SUPPORTED
> >  }
> >
> >  inherit libc-package
>=20
> The trouble is this is a workaround. The cp commands should work and
> there is some underlying issue in pseudo causing this. We really need
> to figure out what that is since this will likely just mean we see the
> problem somewhere else :(
>=20
> I still suspect some kind of inode number reuse problem which these cp
> commands trigger...
>=20
> Cheers,
>=20
> Richard

For the record, even if I think the patch was the right thing to do, it=20
did not help the situation. The first build I did after it was integrated,=
=20
I was bit by the following:

  Failed to determine the user name of UID 323 for=20
  tmp/work/core2-64-poky-linux/glibc-locale/2.29-r0/package/usr/lib/locale

where UID 323 is my UID. If you do not recognize the error message, it is=20
because it comes from a local patch we have for rpm to protect us from any=
=20
incorrect UIDs/GIDs causing incorrect RPMs to be generated (see below). I=20
checked the build directory and the /usr/lib/locale directory was the only=
=20
file or directory with an incorrect owner, which is typical of these=20
pseudo related problems with incorrect owners.

[rpm will by default silently fall back to use root for any files where it=
=20
cannot determine the name of the user or group based on its UID/GID. This=20
can be due to missing information in the /etc/passwd or /etc/groups files,=
=20
typically due to relying on another recipe in DEPENDS to create the user=20
without also having an RDEPENDS on the package that creates the user, or=20
because of pseudo messing up. After this bit us once where a device in=20
/dev ended up in an rpm in the sstate cache with root as group instead of=20
the intended video group, which in turn caused the video application to=20
fail as it was no longer allowed to open its device, I created the patch.=20
It is causing a fair bit of grief as it causes builds to fail randomly,=20
but at least we don't end up with an incorrect sstate anymore, which is=20
worse. I am not sure this patch is suitable for integration to OE-Core,=20
but I have attached it if anyone is interested.]=20

//Peter


--_002_770bd2ba38ec4688a45c1df281a1e112XBOX04axiscom_
Content-Type: application/octet-stream;
	name="0001-rpm-Make-it-an-error-if-a-UID-GID-cannot-be-turned-i.patch"
Content-Description: 0001-rpm-Make-it-an-error-if-a-UID-GID-cannot-be-turned-i.patch
Content-Disposition: attachment;
	filename="0001-rpm-Make-it-an-error-if-a-UID-GID-cannot-be-turned-i.patch";
	size=3889; creation-date="Sun, 10 Feb 2019 01:14:16 GMT";
	modification-date="Sun, 10 Feb 2019 01:13:07 GMT"
Content-Transfer-Encoding: base64

RnJvbSAwZjk2Yjc0YmNlNGNmMDcxZWU1YzIyYzQ3NzZmMTM1MmExZjQzODEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQZXRlciBLamVsbGVyc3RlZHQgPHBrakBheGlzLmNvbT4KRGF0
ZTogRnJpLCAzIE5vdiAyMDE3IDEzOjQ0OjQwICswMTAwClN1YmplY3Q6IFtQQVRDSF0gcnBtOiBN
YWtlIGl0IGFuIGVycm9yIGlmIGEgVUlEL0dJRCBjYW5ub3QgYmUgdHVybmVkIGludG8gYQogbmFt
ZQoKQmVmb3JlLCBhbnkgdW5rbm93biBVSUQgb3IgR0lEIHdvdWxkIHJlc3VsdCBpbiB0aGUgbmFt
ZSBvZiB0aGUgY3VycmVudAp1c2VyICh0eXBpY2FsbHkgcm9vdCkgYmVpbmcgc2lsZW50bHkgdXNl
ZCBpbnN0ZWFkLCB3aGljaCBsZWFkcyB0bwp1bmRldGVybWluaXN0aWMgYmVoYXZpb3IgZGVwZW5k
aW5nIG9uIHdoZXRoZXIgdGhlIHJlcXVpcmVkIHVzZXIgb3IKZ3JvdXAgbmFtZSBpcyBhdmFpbGFi
bGUgaW4gL2V0Yy9wYXNzd2Qgb3IgL2V0Yy9ncm91cCwgb3Igbm90LgoKVGhpcyBpcyBvbmx5IGFw
cHJvcHJpYXRlIGZvciB0aGUgbmF0aXZlIGFuZCBuYXRpdmVzZGsgdmVyc2lvbnMuCgpTaWduZWQt
b2ZmLWJ5OiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4K
LS0tCiAuLi5lcnJvci1pZi1hLVVJRC1HSUQtY2Fubm90LWJlLXR1cm5lZC1pbnRvLS5wYXRjaCB8
IDQ5ICsrKysrKysrKysrKysrKysrKysrKysKIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0vcnBt
XzQuMTQuMi4xLmJiICAgICAgICAgIHwgIDIgKwogMiBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRp
b25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS9maWxl
cy8wMDAxLU1ha2UtaXQtYW4tZXJyb3ItaWYtYS1VSUQtR0lELWNhbm5vdC1iZS10dXJuZWQtaW50
by0ucGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtL2ZpbGVzLzAw
MDEtTWFrZS1pdC1hbi1lcnJvci1pZi1hLVVJRC1HSUQtY2Fubm90LWJlLXR1cm5lZC1pbnRvLS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0vZmlsZXMvMDAwMS1NYWtlLWl0LWFuLWVy
cm9yLWlmLWEtVUlELUdJRC1jYW5ub3QtYmUtdHVybmVkLWludG8tLnBhdGNoCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmE5NDY3ZGMyOTgKLS0tIC9kZXYvbnVsbAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtL2ZpbGVzLzAwMDEtTWFrZS1pdC1hbi1lcnJvci1p
Zi1hLVVJRC1HSUQtY2Fubm90LWJlLXR1cm5lZC1pbnRvLS5wYXRjaApAQCAtMCwwICsxLDQ5IEBA
CitGcm9tIDQ3NzdkYzM4Yzc1NTQ3ODdjYWY5YTM3NTc1YzNlMjkxMjc4M2VkMjMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJz
dGVkdEBheGlzLmNvbT4KK0RhdGU6IEZyaSwgMyBOb3YgMjAxNyAxMzo0MTowOSArMDEwMAorU3Vi
amVjdDogW1BBVENIXSBNYWtlIGl0IGFuIGVycm9yIGlmIGEgVUlEL0dJRCBjYW5ub3QgYmUgdHVy
bmVkIGludG8gYSBuYW1lCisKK0JlZm9yZSwgYW55IHVua25vd24gVUlEIG9yIEdJRCB3b3VsZCBy
ZXN1bHQgaW4gdGhlIG5hbWUgb2YgdGhlIGN1cnJlbnQKK3VzZXIgKHR5cGljYWxseSByb290KSBi
ZWluZyBzaWxlbnRseSB1c2VkIGluc3RlYWQsIHdoaWNoIGxlYWRzIHRvCit1bmRldGVybWluaXN0
aWMgYmVoYXZpb3IgZGVwZW5kaW5nIG9uIHdoZXRoZXIgdGhlIHJlcXVpcmVkIHVzZXIgb3IKK2dy
b3VwIG5hbWUgaXMgYXZhaWxhYmxlIGluIC9ldGMvcGFzc3dkIG9yIC9ldGMvZ3JvdXAsIG9yIG5v
dC4KKworVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlCitTaWduZWQtb2ZmLWJ5OiBQZXRl
ciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4KKworLS0tCisgYnVp
bGQvZmlsZXMuYyB8IDE4ICsrKysrKysrKysrLS0tLS0tLQorIDEgZmlsZSBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvYnVpbGQvZmlsZXMu
YyBiL2J1aWxkL2ZpbGVzLmMKK2luZGV4IDU4NWQ3M2UzZi4uZjkyZWJkOWU5IDEwMDY0NAorLS0t
IGEvYnVpbGQvZmlsZXMuYworKysrIGIvYnVpbGQvZmlsZXMuYworQEAgLTEzNzMsMTMgKzEzNzMs
MTcgQEAgc3RhdGljIHJwbVJDIGFkZEZpbGUoRmlsZUxpc3QgZmwsIGNvbnN0IGNoYXIgKiBkaXNr
UGF0aCwKKyAgICAgfSBlbHNlIHsKKyAJZmlsZUduYW1lID0gcnBtdWdHbmFtZShmaWxlR2lkKTsK
KyAgICAgfQorLQkKKy0gICAgLyogRGVmYXVsdCB1c2VyL2dyb3VwIHRvIGJ1aWxkZXIncyB1c2Vy
L2dyb3VwICovCistICAgIGlmIChmaWxlVW5hbWUgPT0gTlVMTCkKKy0JZmlsZVVuYW1lID0gcnBt
dWdVbmFtZShnZXR1aWQoKSk7CistICAgIGlmIChmaWxlR25hbWUgPT0gTlVMTCkKKy0JZmlsZUdu
YW1lID0gcnBtdWdHbmFtZShnZXRnaWQoKSk7CistICAgIAorKworKyAgICAvKiBGYWlsIGlmIHRo
ZSB1c2VyIGFuZC9vciBncm91cCBuYW1lIGNhbm5vdCBiZSBkZXRlcm1pbmVkICovCisrICAgIGlm
IChmaWxlVW5hbWUgPT0gTlVMTCkgeworKwlycG1sb2coUlBNTE9HX0VSUiwgXygiRmFpbGVkIHRv
IGRldGVybWluZSB0aGUgdXNlciBuYW1lIG9mIFVJRCAlZCBmb3IgJXNcbiIpLCBmaWxlVWlkLCBk
aXNrUGF0aCk7CisrCWdvdG8gZXhpdDsKKysgICAgfQorKyAgICBpZiAoZmlsZUduYW1lID09IE5V
TEwpIHsKKysJcnBtbG9nKFJQTUxPR19FUlIsIF8oIkZhaWxlZCB0byBkZXRlcm1pbmUgdGhlIGdy
b3VwIG5hbWUgb2YgR0lEICVkIGZvciAlc1xuIiksIGZpbGVHaWQsIGRpc2tQYXRoKTsKKysJZ290
byBleGl0OworKyAgICB9CisrCisgICAgIC8qIFNfWFhYIG1hY3JvIG11c3QgYmUgY29uc2lzdGVu
dCB3aXRoIHR5cGUgaW4gZmluZCBjYWxsIGF0IGNoZWNrLWZpbGVzIHNjcmlwdCAqLworICAgICBp
ZiAoY2hlY2tfZmlsZUxpc3QgJiYgKFNfSVNSRUcoZmlsZU1vZGUpIHx8IFNfSVNMTksoZmlsZU1v
ZGUpKSkgeworIAlhcHBlbmRTdHJpbmdCdWYoY2hlY2tfZmlsZUxpc3QsIGRpc2tQYXRoKTsKKy0t
IAorMi4xMi4wCisKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0vcnBtXzQu
MTQuMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS9ycG1fNC4xNC4yLjEuYmIKaW5k
ZXggMDYzZjQyNjlhNS4uMzMxNmM3ZDYwZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3JwbS9ycG1fNC4xNC4yLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS9y
cG1fNC4xNC4yLjEuYmIKQEAgLTQyLDYgKzQyLDggQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2VtZW50L3JwbTticmFuY2g9cnBtLTQuMTQueCBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAxLXJwbS1ycG1pby5jLXJlc3RyaWN0LXZpcnR1YWwtbWVtb3J5LXVz
YWdlLWlmLWxpbWl0LXMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAxNi1ycG1zY3JpcHQu
Yy1jaGFuZ2UtbG9nZ2luZy1sZXZlbC1hcm91bmQtc2NyaXB0bGV0cy10LnBhdGNoIFwKICAgICAg
ICAgICAgIgorU1JDX1VSSV9hcHBlbmRfY2xhc3MtbmF0aXZlID0gIiBmaWxlOi8vMDAwMS1NYWtl
LWl0LWFuLWVycm9yLWlmLWEtVUlELUdJRC1jYW5ub3QtYmUtdHVybmVkLWludG8tLnBhdGNoIgor
U1JDX1VSSV9hcHBlbmRfY2xhc3MtbmF0aXZlc2RrID0gIiBmaWxlOi8vMDAwMS1NYWtlLWl0LWFu
LWVycm9yLWlmLWEtVUlELUdJRC1jYW5ub3QtYmUtdHVybmVkLWludG8tLnBhdGNoIgogCiBQRSA9
ICIxIgogU1JDUkVWID0gIjRhOTQ0MDAwNjM5ODY0NjU4M2YwZDlhZTE4MzdkYWQyODc1MDEzYWEi
Ci0tIAoyLjEyLjAKCg==

--_002_770bd2ba38ec4688a45c1df281a1e112XBOX04axiscom_--
