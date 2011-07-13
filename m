Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1Qh08v-0007yo-T2
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 16:10:26 +0200
Received: by yib18 with SMTP id 18so2532227yib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 07:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=bwj5SlQ55gWTl09+hyIyiGg5942sxsN1IWItNayTtvk=;
	b=qUI53Y1dMyuUfzKQwStz2x86SzOEarzFvZNcPEC+w0Z4c8ZNWnHKrbwPSPs19hpc7D
	MSkc1fw1dwKThJyowXUCWYXLsvvS3J46ltz5qDb0yMP2J1cPOelILmMpbjGq1Qq5eUeV
	x3u2pGwuvbU4jZfYpnplvCbC2SpW8wmAcRq7o=
MIME-Version: 1.0
Received: by 10.236.28.66 with SMTP id f42mr1436006yha.285.1310565986891; Wed,
	13 Jul 2011 07:06:26 -0700 (PDT)
Received: by 10.236.208.168 with HTTP; Wed, 13 Jul 2011 07:06:26 -0700 (PDT)
In-Reply-To: <CAPhnLPCXP0mPU6=WxG8n-zLJJOozwyqZo9pMqkrmO4gdOJrDOg@mail.gmail.com>
References: <CAPhnLPCXP0mPU6=WxG8n-zLJJOozwyqZo9pMqkrmO4gdOJrDOg@mail.gmail.com>
Date: Wed, 13 Jul 2011 10:06:26 -0400
Message-ID: <CAOd_LFwkz6w5oOmwbQwikW6bptwtWiwXGXwmPLDEHga0SAjCdQ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Additional license wrangling functionality
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
X-List-Received-Date: Wed, 13 Jul 2011 14:10:26 -0000
X-Groupsio-MsgNum: 5871
Content-Type: multipart/mixed; boundary=0015175743481a796204a7f3ec88

--0015175743481a796204a7f3ec88
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Many thanks for implementing these improvements!

The manifest file for core-image-minimal is attached.

A few thoughts after testing this ...

I like the way the license information is being cleaned up in the recipes.

In the past, I have collected licenses by using the following
procedure directly on a device:

cd /usr/lib/opkg/info
grep License *

In the past (OE Classic build from a year ago or so), the Control file
in a packaged looked like:

Package: libc6
Version: 2.9-r37.3.6
Description: GNU C Library
Section: libs
Priority: required
Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
License: LGPL
Architecture: armv5te
OE: glibc
Homepage: http://www.gnu.org/software/libc/libc.html
Depends: update-rc.d, libcidn1
Source: ...

Now, in OE core they look like this:

Package: libc6
Version: 2.13-r6+svnr14157
Description: Embedded GLIBC (GNU C Library)
 Embedded GLIBC (EGLIBC) is a variant of the GNU C Library (GLIBC) that is
 designed to work well on embedded systems. EGLIBC strives to be source
 and binary compatible with GLIBC. EGLIBC's goals include reduced
 footprint, configurable components, better support for cross-compilation
 and cross-testing.
Section: libs
Priority: optional
Maintainer: OE-Core Developers <openembedded-core@lists.openembedded.org>
Architecture: i586
OE: eglibc
Homepage: http://www.eglibc.org/home
Provides: glibc
Source:  ...

Why is the License field no longer included in the control file?

One of the biggest issues with the current license mechanism is the
license directory seems to only populated at recipe build time, not at
image rootfs generation.  Therefore, you have to do a clean build to
get a list of licenses.  It seems like it would be more optimal if the
License information was stored in the packages (as it was in the
past), and then extracted from each package during the rootfs phase.
The license manifest could then be created similar to the way the
testlab stuff is done in OE:

http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/classe=
s/testlab.bbclass

As a side note, I find the testlab information very useful, so perhaps
it should be considered for including in oe-core.

I'm also not convinced that license information for every package is
being shown in the manifest.  For example, during the rootfs phase, I
see things like:

Installing kernel-module-cfbcopyarea
Installing kernel-module-uvesafb

But I don't see anything offhand in the manifests file that would
correlate to the above kernel modules.  So in summary, there are two
possible improvements that I think would be useful:

1) make sure license information for _every_ package that gets
installed at the rootfs phase is included in the report.  If there is
not License information, perhaps this should be a fatal error.

2) be able to generate the report at rootfs time, not recipe build time.

3) put the License field back into the package Control file, so any
tool that generates an image from packages can use this.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


On Mon, Jul 11, 2011 at 7:11 PM, Flanagan, Elizabeth
<elizabeth.flanagan@intel.com> wrote:
> Requested by a member of the community, this fixes a few issues with lice=
nse
> wrangling. Specifically,
>
> - licenses are now wrangled into:
> =A0${DEPLOY_DIR}/licenses/${IMAGE_NAME}/datetimestamp
> =A0This keeps multiple runs of a build from polluting the licenses of a
> previous build
> - remove all wrangling of -native and -cross licenses:
> =A0if it's not on the image, then having the license isn't useful and
> in fact, is harmful
> - create a manifest
> =A0on BuildCompleted we take all the wrangled licenses and give a
> manifest with all the
> =A0*known* common licenses. If license.bbclass doesn't know the common, w=
e don't
> =A0include it.
> - Since we have + licenses, we can now deal with them correctly.
>
> The following changes since commit 2c79c9eb7ef8ef0aef8c3096c3c4387e28e56e=
a2:
>
> =A0pulseaudio: add 0.9.23 (2011-07-07 13:45:32 +0100)
>
> are available in the git repository at:
> =A0git://git.pokylinux.org/poky-contrib eflanagan/license_pn
> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Deflanagan/lice=
nse_pn
>
> Beth Flanagan (1):
> =A0license.bbclass: License Manifests and more.
>
> =A0meta/classes/license.bbclass | =A0179 ++++++++++++++++++++++++++++----=
----------
> =A01 files changed, 120 insertions(+), 59 deletions(-)
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--0015175743481a796204a7f3ec88
Content-Type: application/octet-stream; name=201107121817_license_manifest
Content-Disposition: attachment; filename=201107121817_license_manifest
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gq2aikpx0

UGFja2FnZSBOYW1lOiBweXRob24KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKUGFja2Fn
ZSBOYW1lOiBsaWJncGctZXJyb3IKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpHUEwtMisK
ClBhY2thZ2UgTmFtZTogdXRpbC1tYWNyb3MKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpN
SVQtc3R5bGUKTUlUCgpQYWNrYWdlIE5hbWU6IGFjbAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCkdQTC0yKwoKUGFja2FnZSBOYW1lOiBuZXRiYXNlCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KR1BMLTIKClBhY2thZ2UgTmFtZTogbGludXgtbGliYy1oZWFkZXJzCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KR1BMLTIKClBhY2thZ2UgTmFtZTogbGlieGF1Ci0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KTUlULXN0eWxlCgpQYWNrYWdlIE5hbWU6IGV4cGF0Ci0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KTUlUCgpQYWNrYWdlIE5hbWU6IHpsaWIKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpabGliCgpQYWNrYWdlIE5hbWU6IGRidXMKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpHUEwtMisKQUZMLTIKClBhY2thZ2UgTmFtZTogdXNidXRpbHMKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpHUEwtMisKClBhY2thZ2UgTmFtZTogbGlieDExLXRyaW0K
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNSVQtc3R5bGUKQlNECk1JVAoKUGFja2FnZSBO
YW1lOiBwZXJsCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KClBhY2thZ2UgTmFtZTogcnVu
LXBvc3RpbnN0cwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk1JVAoKUGFja2FnZSBOYW1l
OiBuY3Vyc2VzCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KTUlUCgpQYWNrYWdlIE5hbWU6
IHNxbGl0ZTMKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpQRAoKUGFja2FnZSBOYW1lOiBy
ZWFkbGluZQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkdQTC0zKwoKUGFja2FnZSBOYW1l
OiB1cGRhdGUtbW9kdWxlcwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkdQTC0yCgpQYWNr
YWdlIE5hbWU6IGdkYm0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpHUEwtMisKClBhY2th
Z2UgTmFtZTogeGNiLXByb3RvCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KTUlUCgpQYWNr
YWdlIE5hbWU6IGJ1c3lib3gKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpHUEwtMgoKUGFj
a2FnZSBOYW1lOiBsaWJpY2UKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNSVQtc3R5bGUK
ClBhY2thZ2UgTmFtZTogbGlicHRocmVhZC1zdHVicwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCk1JVAoKUGFja2FnZSBOYW1lOiBsaWJzbQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Ck1JVC1zdHlsZQoKUGFja2FnZSBOYW1lOiBlMmZzcHJvZ3MKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpHUEwtMgpMR1BMLTIKQlNECk1JVAoKUGFja2FnZSBOYW1lOiBiYXNlLWZpbGVzCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KR1BMLTIKClBhY2thZ2UgTmFtZTogdWRldgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkdQTC0yKwoKUGFja2FnZSBOYW1lOiBvcGtnCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KR1BMLTIrCgpQYWNrYWdlIE5hbWU6IG9wa2ctY29uZmln
LWJhc2UKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNSVQKClBhY2thZ2UgTmFtZTogaW5p
dHNjcmlwdHMKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpHUEwtMgoKUGFja2FnZSBOYW1l
OiBlbGZ1dGlscwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkdQTC0yCgpQYWNrYWdlIE5h
bWU6IHBjaXV0aWxzCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KR1BMLTIrCgpQYWNrYWdl
IE5hbWU6IGticHJvdG8KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNSVQtc3R5bGUKClBh
Y2thZ2UgTmFtZTogdGlueWxvZ2luCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KR1BMLTIK
ClBhY2thZ2UgTmFtZTogYXR0cgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkdQTC0yKwoK
UGFja2FnZSBOYW1lOiBtb2R1dGlscy1pbml0c2NyaXB0cwotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tClBECgpQYWNrYWdlIE5hbWU6IGJ6aXAyCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KClBhY2thZ2UgTmFtZTogZ2xpYi0yLjAKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpC
U0QKUEQKClBhY2thZ2UgTmFtZTogbGlieGNiCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
TUlUCgpQYWNrYWdlIE5hbWU6IHhwcm90bwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk1J
VC1zdHlsZQpNSVQKClBhY2thZ2UgTmFtZTogbGliZ2NjCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KR1BMLTMuMC13aXRoLUdDQy1leGNlcHRpb24KR1BMLTMKClBhY2thZ2UgTmFtZTogemlw
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KClBhY2thZ2UgTmFtZTogYmFzZS1wYXNzd2QK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpHUEwtMisKClBhY2thZ2UgTmFtZTogaW5wdXRw
cm90bwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk1JVC1zdHlsZQpNSVQKClBhY2thZ2Ug
TmFtZTogY29tbW9uLWxpY2Vuc2VzCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KTUlULXN0
eWxlCgpQYWNrYWdlIE5hbWU6IHhleHRwcm90bwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Ck1JVC1zdHlsZQpNSVQKClBhY2thZ2UgTmFtZTogYmFzaAotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCkdQTC0zKwoKUGFja2FnZSBOYW1lOiBnY2MtcnVudGltZQotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCkdQTC0zLjAtd2l0aC1HQ0MtZXhjZXB0aW9uCkdQTC0zCgpQYWNrYWdlIE5h
bWU6IHhmODZiaWdmb250cHJvdG8KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNSVQKClBh
Y2thZ2UgTmFtZTogZ2V0dGV4dAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkdQTC0zCgpQ
YWNrYWdlIE5hbWU6IGxpYnVzYi1jb21wYXQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoK
UGFja2FnZSBOYW1lOiB4dHJhbnMKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNSVQtc3R5
bGUKTUlUCgpQYWNrYWdlIE5hbWU6IGxpbnV4LXlvY3RvCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KR1BMLTEKClBhY2thZ2UgTmFtZTogY29yZS1pbWFnZS1taW5pbWFsCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KTUlUCgpQYWNrYWdlIE5hbWU6IHVkZXYtZXh0cmFjb25mCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KR1BMLTIKClBhY2thZ2UgTmFtZTogbGlidXNiMQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpQYWNrYWdlIE5hbWU6IGVnbGliYwotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCkxHUEwtMgoKUGFja2FnZSBOYW1lOiBsaWJ0b29sCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KR1BMLTIKTEdQTC0yLjEKClBhY2thZ2UgTmFtZTogZGIKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpTbGVlcHljYXQKClBhY2thZ2UgTmFtZTogc3lzdmlu
aXQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpHUEwtMisKClBhY2thZ2UgTmFtZTogdXRp
bC1saW51eAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkdQTC0yKwpCU0QKClBhY2thZ2Ug
TmFtZTogdGFzay1jb3JlLWJvb3QKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNSVQKClBh
Y2thZ2UgTmFtZTogbW9kdWxlLWluaXQtdG9vbHMKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpHUEwtMisKClBhY2thZ2UgTmFtZTogb3BlbnNzbAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCk9wZW5zc2wKClBhY2thZ2UgTmFtZTogdXBkYXRlLXJjLmQKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpHUEwtMisKClBhY2thZ2UgTmFtZTogc3lzdmluaXQtaW5pdHRhYgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCkdQTC0yCgpQYWNrYWdlIE5hbWU6IHY4NmQKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpHUEwtMgoKUGFja2FnZSBOYW1lOiBlZ2xpYmMtaW5pdGlhbAot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkxHUEwtMgoK

--0015175743481a796204a7f3ec88--
