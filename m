Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RkMcw-0004it-Qn
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 22:19:35 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 09 Jan 2012 13:12:05 -0800
Received: by iazz13 with SMTP id z13so7359726iaz.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2012 13:12:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.157.133 with SMTP id d5mr19477574icx.46.1326143524863; Mon,
	09 Jan 2012 13:12:04 -0800 (PST)
Received: by 10.231.162.131 with HTTP; Mon, 9 Jan 2012 13:12:04 -0800 (PST)
In-Reply-To: <1326123824-11738-1-git-send-email-andrei@gherzan.ro>
References: <1326123824-11738-1-git-send-email-andrei@gherzan.ro>
Date: Mon, 9 Jan 2012 13:12:04 -0800
Message-ID: <CAPhnLPDYQgsjTEASEO_K582wxFfk=NRvwX+94etd85FuYxrWYw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: support for or operand in LICENSE and for SPDX license names
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
X-List-Received-Date: Mon, 09 Jan 2012 21:19:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 9, 2012 at 7:43 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> From: Andrei Gherzan <andrei.gherzan@windriver.com>
>
> base.bblass modfied in order to correctly exlude packages where OE-Style =
licence naming
> is used. In this way licenses as GPL-3, GPLv3, GPLv3.0 will be exluded fr=
om a non-GPLv3
> build.
> The second modification was to include in a non-GPLv3 build packages wher=
e LICENSE is
> GPLv3 or "something else". For example, qt4-embedded has LICENSE =3D "LGP=
Lv2.1 | GPLv3".
> This package should be included in a non-GPLv3 build as it is LGPLv2.1 or=
 GPLv3.
>
> [YOCTO #1884]
> [YOCTO #1844]
>
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
> =A0meta/classes/base.bbclass | =A0 22 ++++++++++++++++++----
> =A01 files changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index e65a722..568c5dd 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -392,6 +392,8 @@ python () {
>
>
> =A0 =A0 =A0 =A0 dont_want_license =3D d.getVar('INCOMPATIBLE_LICENSE', 1)
> + =A0 =A0 =A0 =A0spdx_dont_want_license =3D d.getVarFlag('SPDXLICENSEMAP'=
, dont_want_license)
> +
> =A0 =A0 =A0 =A0 if dont_want_license and not pn.endswith("-native") and n=
ot pn.endswith("-cross") and not pn.endswith("-cross-initial") and not pn.e=
ndswith("-cross-intermediate") and not pn.endswith("-crosssdk-intermediate"=
) and not pn.endswith("-crosssdk") and not pn.endswith("-crosssdk-initial")=
:
> =A0 =A0 =A0 =A0 =A0 =A0 hosttools_whitelist =3D (d.getVar('HOSTTOOLS_WHIT=
ELIST_%s' % dont_want_license, 1) or "").split()
> =A0 =A0 =A0 =A0 =A0 =A0 lgplv2_whitelist =3D (d.getVar('LGPLv2_WHITELIST_=
%s' % dont_want_license, 1) or "").split()
> @@ -400,10 +402,22 @@ python () {
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 import re
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 this_license =3D d.getVar('LICENSE', 1)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if this_license and re.search(dont_want_=
license, this_license):
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bb.note("SKIPPING %s because it'=
s %s" % (pn, this_license))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0raise bb.parse.SkipPackage("inco=
mpatible with license %s" % this_license)
> -
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this_license_clean=3Dre.sub(r'[+&()*]', =
'', this_license)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0or_licenses =3D re.split('[|]', this_lic=
ense_clean)
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for one_or_license in or_licenses:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 licenses =3D re.split('[ ]', one_or=
_license)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 good_license=3Done_or_license
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for onelicense in licenses:

A few notes:

I would use the oe.license here
Have a look at meta/classes/copyleft_compliance.bbclass and
license.bbclass to see how we're doing this.

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 spdx_onelicense =3D d.getVa=
rFlag('SPDXLICENSEMAP', onelicense)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ( onelicense and re.sear=
ch(dont_want_license, onelicense) ) or ( onelicense and re.search(spdx_dont=
_want_license, onelicense) ) or ( spdx_onelicense and re.search(dont_want_l=
icense, spdx_onelicense) ) or ( spdx_onelicense and re.search(spdx_dont_wan=
t_license, spdx_onelicense) ):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 good_licens=
e =3D ""
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if good_license !=3D "":
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if good_license =3D=3D "":
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bb.note("SKIPPING %s because it's %=
s" % (pn, this_license))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 raise bb.parse.SkipPackage("incompa=
tible with license %s" % this_license)
> =A0 =A0 srcuri =3D d.getVar('SRC_URI', 1)
> =A0 =A0 # Svn packages should DEPEND on subversion-native
> =A0 =A0 if "svn://" in srcuri:
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

I would also look at pulling this into license.bbclass as a generic
function as I can see a few anticipated uses for it.

--=20
Elizabeth Flanagan
Yocto Project
Build and Release


