Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UaTAz-0007kp-V8 for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 17:54:43 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r49Fd0Q2019780; Thu, 9 May 2013 16:39:00 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oEXowj0cpz1d; Thu,  9 May 2013 16:39:00 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r49Fcu3A019771
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 9 May 2013 16:38:58 +0100
Message-ID: <1368113781.27116.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 09 May 2013 16:36:21 +0100
In-Reply-To: <518BC02E.8010909@windriver.com>
References: <1368104132-30116-1-git-send-email-bogdan.a.marinescu@intel.com>
	<A023E370-E7BD-47E2-B779-335B4ADE7819@gmail.com>
	<518BC02E.8010909@windriver.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r49Fd0Q2019780
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: include libgcc when libpthread is enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 15:54:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-05-09 at 10:26 -0500, Mark Hatle wrote:
> On 5/9/13 9:32 AM, Khem Raj wrote:
> >
> > On May 9, 2013, at 5:55 AM, Bogdan Marinescu <bogdan.a.marinescu@inte=
l.com> wrote:
> >
> >> libpthread needs libgcc to function properly. Without libgcc I get
> >> the following error:
> >>
> >> root@qemux86:~# tclsh
> >> % exit 0
> >> libgcc_s.so.1 must be installed for pthread_cancel to work
> >> Aborted
> >> root@qemux86:~#
> >>
> >> This patch fixes the above issue and similar ones by adding a
> >> runtime dependency of libgcc to eglibc when threads are enabled.
> >>
> >> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> >> ---
> >> meta/recipes-core/eglibc/eglibc.inc |    2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core=
/eglibc/eglibc.inc
> >> index 1e04197..24fb05b 100644
> >> --- a/meta/recipes-core/eglibc/eglibc.inc
> >> +++ b/meta/recipes-core/eglibc/eglibc.inc
> >> @@ -35,7 +35,7 @@ siteconfig_do_siteconfig_gencache_prepend =3D " \
> >> # nptl needs unwind support in gcc, which can't be built without gli=
bc.
> >> DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers =
virtual/${TARGET_PREFIX}libc-initial"
> >> # nptl needs libgcc but dlopens it, so our shlibs code doesn't detec=
t this
> >> -#RDEPENDS_${PN} +=3D "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']=
}"
> >> +RDEPENDS_${PN} +=3D "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}=
"
> >
> > ah too early. I think you should spin out libpthread into separate pa=
ckage and then RDEPEND_libpthread =3D "=E2=80=A6"
> > and don't use nptl we do not have any other option now a days.
>=20
> This would be my suggestion.  I'd also want to make sure there is a=20
> libpthread-dev (which for some reason I think there already is) because=
 the=20
> links in there are required for on-target thread debugging...

As I keep mentioning, rightly or probably more wrongly we support one
-dev package per recipe right now, not multiple packages.

Cheers,

Richard



