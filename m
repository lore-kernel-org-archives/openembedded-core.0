Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE0F571AE6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 01:11:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9O1BWuv006877
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 23 Oct 2016 18:11:35 -0700
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.156]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0294.000;
	Sun, 23 Oct 2016 18:11:32 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Andreas Oberritter <obi@opendreambox.org>
Thread-Topic: [OE-core] [PATCH 2/2] ppp: fix building with linux-4.8
Thread-Index: AQHSK6OoQs9wWy92r0uEWi5WL3jrpqC2zhHw
Date: Mon, 24 Oct 2016 01:11:30 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013A310347@ALA-MBA.corp.ad.wrs.com>
References: <cover.1476345470.git.jackie.huang@windriver.com>
	<07b4065b12f5cf9dfe816e7cdb68a5e7d83e04c0.1476345470.git.jackie.huang@windriver.com>
	<5c605407-d802-456e-a876-317cefaef461@opendreambox.org>
In-Reply-To: <5c605407-d802-456e-a876-317cefaef461@opendreambox.org>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.133]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ppp: fix building with linux-4.8
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
X-List-Received-Date: Mon, 24 Oct 2016 01:11:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Andreas Oberritter [mailto:obi@opendreambox.org]
> Sent: Friday, October 21, 2016 10:01 PM
> To: Huang, Jie (Jackie)
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 2/2] ppp: fix building with linux-4.8
>=20
> Dear Jackie,
>=20
> this patch broke compilation with linux-libc-headers 4.4, present in
> morty, due to use of incomplete types.

I didn't realize 4.4 is still be used, sorry about that, feel free to send
patch to fix it if you have one already, if not, I will fix it later as fol=
low-up.

Thanks,
Jackie

>=20
> Regards,
> Andreas
>=20
>=20
> On 14.10.2016 02:50, jackie.huang@windriver.com wrote:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > Fix a build error when using the linux-4.8 headers that results in:
> >
> > In file included from pppoe.h:87:0,
> >                  from plugin.c:29:
> > ../usr/include/netinet/in.h:211:8: note: originally defined here
> >  struct in6_addr
> >         ^~~~~~~~
> > In file included from ../usr/include/linux/if_pppol2tp.h:20:0,
> >                  from ../usr/include/linux/if_pppox.h:26,
> >                  from plugin.c:52:
> > ../usr/include/linux/in6.h:49:8: error: redefinition of 'struct sockadd=
r_in6'
> >  struct sockaddr_in6 {
> >         ^~~~~~~~~~~~
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  .../ppp/ppp/ppp-fix-building-with-linux-4.8.patch  | 44 ++++++++++++++=
++++++++
> >  meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |  1 +
> >  2 files changed, 45 insertions(+)
> >  create mode 100644 meta/recipes-connectivity/ppp/ppp/ppp-fix-building-=
with-linux-4.8.patch
> >
> > diff --git a/meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-li=
nux-4.8.patch
> b/meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8.patch
> > new file mode 100644
> > index 0000000..f77b0de
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/ppp/ppp/ppp-fix-building-with-linux-4.8=
.patch
> > @@ -0,0 +1,44 @@
> > +From 3da19af53e2eee2e77b456cfbb9d633b06656d38 Mon Sep 17 00:00:00 2001
> > +From: Jackie Huang <jackie.huang@windriver.com>
> > +Date: Thu, 13 Oct 2016 13:41:43 +0800
> > +Subject: [PATCH] ppp: fix building with linux-4.8
> > +
> > +Fix a build error when using the linux-4.8 headers that results in:
> > +
> > +In file included from pppoe.h:87:0,
> > +                 from plugin.c:29:
> > +../usr/include/netinet/in.h:211:8: note: originally defined here
> > + struct in6_addr
> > +        ^~~~~~~~
> > +In file included from ../usr/include/linux/if_pppol2tp.h:20:0,
> > +                 from ../usr/include/linux/if_pppox.h:26,
> > +                 from plugin.c:52:
> > +../usr/include/linux/in6.h:49:8: error: redefinition of 'struct sockad=
dr_in6'
> > + struct sockaddr_in6 {
> > +        ^~~~~~~~~~~~
> > +
> > +Upstream-Status: Submitted [1]
> > +
> > +[1] https://github.com/paulusmack/ppp/pull/69
> > +
> > +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > +---
> > + pppd/plugins/rp-pppoe/pppoe.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/ppp=
oe.h
> > +index 9ab2eee..96d2794 100644
> > +--- a/pppd/plugins/rp-pppoe/pppoe.h
> > ++++ b/pppd/plugins/rp-pppoe/pppoe.h
> > +@@ -84,7 +84,7 @@ typedef unsigned long UINT32_t;
> > + #include <linux/if_ether.h>
> > + #endif
> > +
> > +-#include <netinet/in.h>
> > ++#include <linux/in.h>
> > +
> > + #ifdef HAVE_NETINET_IF_ETHER_H
> > + #include <sys/types.h>
> > +--
> > +2.8.3
> > +
> > diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-
> connectivity/ppp/ppp_2.4.7.bb
> > index 4437b5c..56dbd98 100644
> > --- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> > +++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
> > @@ -30,6 +30,7 @@ SRC_URI =3D "http://ppp.samba.org/ftp/ppp/ppp-${PV}.t=
ar.gz \
> >             file://0001-ppp-Fix-compilation-errors-in-Makefile.patch \
> >             file://ppp@.service \
> >             file://fix-CVE-2015-3310.patch \
> > +           file://ppp-fix-building-with-linux-4.8.patch \
> >  "
> >
> >  SRC_URI_append_libc-musl =3D "\
> >


