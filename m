Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3SXr-0000y0-63 for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 14:29:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22DKho5031821
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 13:20:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31378-03 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2012 13:20:38 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22DKaJv031815
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 13:20:37 GMT
Message-ID: <1330694440.18076.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Mar 2012 13:20:40 +0000
In-Reply-To: <CALbNGRSJMFZ03x25xE+d_Sj6H2g6=gFx5OX15GAO2sRAGKrsSg@mail.gmail.com>
References: <1330547595-11631-1-git-send-email-ynezz@true.cz>
	<1330617040.31767.25.camel@ted>
	<CALbNGRRKMKQx1ZSzJruX26J2NGYFBYS+Cgp3W2Pk9ETCRtfY+g@mail.gmail.com>
	<1330691892.15224.17.camel@ted>
	<CALbNGRSJMFZ03x25xE+d_Sj6H2g6=gFx5OX15GAO2sRAGKrsSg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q22DKho5031821
Subject: Re: [PATCH] image_types.bbclass: fix link creation failure if the target already exists
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
X-List-Received-Date: Fri, 02 Mar 2012 13:29:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-03-02 at 13:48 +0100, Andreas M=C3=BCller wrote:
> On Fri, Mar 2, 2012 at 1:38 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2012-03-02 at 13:29 +0100, Andreas M=C3=BCller wrote:
> >> On Thu, Mar 1, 2012 at 4:50 PM, Richard Purdie
> >> | ln: failed to create symbolic link
> >> `/home/andreas/tmp/oe-core-eglibc/deploy/images/overo/xfce-base-imag=
e-overo.tar.bz2':
> >> File exists
> >> NOTE: package xfce-base-image-1.0-r0: task do_rootfs: Failed
> >
> > Could you see what the IMAGE_FSTYPES variable contains please?
> >
> > (bitbake xfce-base-image -e | grep ^IMAGE_FSTYPES)
> >
> > The code shouldn't be trying to create this symlink more than once so
> > whilst I understand the intent of the patch adding -f, I'd like to
> > understand the root cause of the problem to ensure there isn't some
> > other issue.
> >
> Agreed:
>=20
> IMAGE_FSTYPES=3D"tar.bz2 tar.bz2"
>=20
> Seems a 'sum' of local.conf
>=20
> IMAGE_FSTYPES =3D "tar.bz2"
>=20
> and machine.conf
>=20
> IMAGE_FSTYPES +=3D "tar.bz2"

Thanks, that helps a lot. I'd tested "tar tar" and "tar.gz tar.bz2" but
not that :). I think something like:

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
index 681571d..1bf59a5 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -17,7 +17,8 @@ def get_imagecmds(d):
                     types.append(basetype)
                 if basetype not in cimages:
                     cimages[basetype] =3D []
-                cimages[basetype].append(ctype)
+                if ctype not in cimages[basetype]:
+                    cimages[basetype].append(ctype)
                 break
         if not basetype and type not in types:
             types.append(type)

should fix this?=20

Cheers,

Richard




