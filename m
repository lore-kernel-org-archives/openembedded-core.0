Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UXfJq-000455-1r
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 00:16:15 +0200
Received: by mail-pa0-f42.google.com with SMTP id kl13so33660pab.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2013 14:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=eEvL19uBQ48e0pVd/L5onjhgRQjTZZE8ZZ+ywgjcLhs=;
	b=s/URYy1heaZxk30u05AgqNjsjc8vZ8zL2VggoB9tvm/HPHUb8g03IWTj9dN6H1y+M8
	Ika1kwxsBMH8R29lehsZL/R3TIcwsumbRMpJNkW7dcrztOPfsx46NhO7B43nUcng1ZQu
	uPd6VcNbcN6anpnKdbkTijX1cwrXNYTb4+GEzyznukng4q1WTgTn0YpNZmCBIna5k2OT
	eA68r6kxfcAc1jOD7zrzKTF01fLzZXIPNXhhMJKZnXFZDKJ8HDtnR+wqyQzGCRdj/pQl
	2bs9LpTGi9vKBUY3JjiYqeBwnoYTb979URE1zKP4mvZafvoeFQZZkgJO+KrctL4fKUz+
	9JxQ==
X-Received: by 10.68.90.197 with SMTP id by5mr5918470pbb.196.1367445496798;
	Wed, 01 May 2013 14:58:16 -0700 (PDT)
Received: from sa-nc-common-173.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id uf2sm4404170pbc.41.2013.05.01.14.58.15
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 01 May 2013 14:58:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130501210712.GA1429@beefymiracle.amer.corp.natinst.com>
Date: Wed, 1 May 2013 14:58:14 -0700
Message-Id: <6D14CD79-BC8F-498E-903D-BBB815739818@gmail.com>
References: <20130501210712.GA1429@beefymiracle.amer.corp.natinst.com>
To: Josh Cartwright <josh.cartwright@ni.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-4.7: fix gcc ICE when building with gcc-4.8
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
X-List-Received-Date: Wed, 01 May 2013 22:16:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

looks good. Please send a cherry pick request for dylan too

On May 1, 2013, at 2:07 PM, Josh Cartwright <josh.cartwright@ni.com> =
wrote:

> Backport fix for internal compiler error when building gcc-4.7.2 with =
a
> gcc-4.8.0 host gcc.
>=20
> See upstream bug here: =
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D56308
>=20
> Signed-off-by: Josh Cartwright <josh.cartwright@ni.com>
> ---
> meta/recipes-devtools/gcc/gcc-4.7.inc              |  3 +-
> .../gcc/gcc-4.7/avoid-oob-array-access.patch       | 45 =
++++++++++++++++++++++
> 2 files changed, 47 insertions(+), 1 deletion(-)
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.7/avoid-oob-array-access.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc =
b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index a05cac9..81c8f07 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -1,6 +1,6 @@
> require gcc-common.inc
>=20
> -PR =3D "r19"
> +PR =3D "r20"
>=20
> # Third digit in PV should be incremented after a minor release
> # happens from this branch on gcc e.g. currently its 4.7.1
> @@ -77,6 +77,7 @@ SRC_URI =3D =
"${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
> 	   file://use-ml-conf-files-from-B.patch \
> 	   file://wcast-qual-PR55383.patch \
> 	   file://disable-texinfo-5.patch \
> +	   file://avoid-oob-array-access.patch \
> 	  "
> SRC_URI[md5sum] =3D "cc308a0891e778cfda7a151ab8a6e762"
> SRC_URI[sha256sum] =3D =
"8a9283d7010fb9fe5ece3ca507e0af5c19412626384f8a5e9434251ae100b084"
> diff --git =
a/meta/recipes-devtools/gcc/gcc-4.7/avoid-oob-array-access.patch =
b/meta/recipes-devtools/gcc/gcc-4.7/avoid-oob-array-access.patch
> new file mode 100644
> index 0000000..4ba707d
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.7/avoid-oob-array-access.patch
> @@ -0,0 +1,45 @@
> +Upstream-Status: Backport
> +
> +See http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D56308
> +
> +=46rom 1e37e371d2cca3549b71a247bf79778aa1a9e1c4 Mon Sep 17 00:00:00 =
2001
> +From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Fri, 21 Sep 2012 10:08:35 +0000
> +Subject: [PATCH] 2012-09-21  Richard Guenther  <rguenther@suse.de>
> +
> +	PR middle-end/54638
> +	Backport from mainline
> +	2012-04-19  Richard Guenther  <rguenther@suse.de>
> +
> +	* ira-int.h (ira_allocno_object_iter_cond): Avoid out-of-bound
> +	array access.
> +
> +git-svn-id: =
svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-4_7-branch@191605 =
138bc75d-0d04-0410-961f-82ee72b054a4
> +---
> + gcc/ChangeLog | 9 +++++++++
> + gcc/ira-int.h | 9 +++++++--
> + 2 files changed, 16 insertions(+), 2 deletions(-)
> +
> +diff --git a/gcc/ira-int.h b/gcc/ira-int.h
> +index 9faabb5..771a368 100644
> +--- a/gcc/ira-int.h
> ++++ b/gcc/ira-int.h
> +@@ -1138,8 +1138,13 @@ static inline bool
> + ira_allocno_object_iter_cond (ira_allocno_object_iterator *i, =
ira_allocno_t a,
> + 			      ira_object_t *o)
> + {
> +-  *o =3D ALLOCNO_OBJECT (a, i->n);
> +-  return i->n++ < ALLOCNO_NUM_OBJECTS (a);
> ++  int n =3D i->n++;
> ++  if (n < ALLOCNO_NUM_OBJECTS (a))
> ++    {
> ++      *o =3D ALLOCNO_OBJECT (a, n);
> ++      return true;
> ++    }
> ++  return false;
> + }
> +=20
> + /* Loop over all objects associated with allocno A.  In each
> +--=20
> +1.8.2.2
> +
> --=20
> 1.8.2.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



