Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVMA7-0008G5-Of
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 12:47:47 +0100
Received: by eaad13 with SMTP id d13so2978551eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 03:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OKdF4gxXOnVcJg/CMJxU5+cghkU0VL07ITUebvTAijI=;
	b=osCGp7iIr8KPqMkVBXPHH56MtzobWZs6I4bWKa+cyUGMhVNc6j7I9cAsCvFkts7HJg
	vyxVJAj9LOg2buKS2dZDm/NEG3mt9TOkIlNWquQMM0KhSTb0Dhaqliv6253FLD0UVm6k
	wUfwyoGDOEf+LoUqm1QNLLcQuGVghuBcMNgWg=
Received: by 10.213.29.132 with SMTP id q4mr1304866ebc.111.1322566868749;
	Tue, 29 Nov 2011 03:41:08 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d6sm104343586eec.10.2011.11.29.03.41.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 03:41:06 -0800 (PST)
Date: Tue, 29 Nov 2011 12:40:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111129114052.GE7441@jama.jama.net>
References: <27A3051A-BC1D-4937-B936-42760021F584@dominion.thruhere.net>
	<1322240018.24330.37.camel@ted>
	<A23FAF45-E1BD-41B6-B8EA-92BC2C74E429@dominion.thruhere.net>
	<2E5909A2-C9B9-4228-9A16-0FD8F038A8C3@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <2E5909A2-C9B9-4228-9A16-0FD8F038A8C3@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: opkg-make-index cache failing
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
X-List-Received-Date: Tue, 29 Nov 2011 11:47:47 -0000
X-Groupsio-MsgNum: 13092
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Content-Disposition: inline

--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2011 at 08:59:06PM +0100, Koen Kooi wrote:
>=20
> Op 25 nov. 2011, om 19:15 heeft Koen Kooi het volgende geschreven:
>=20
> >=20
> > Op 25 nov. 2011, om 17:53 heeft Richard Purdie het volgende geschreven:
> >=20
> >> On Fri, 2011-11-25 at 16:38 +0100, Koen Kooi wrote:
> >>> In OE-classic the opkg-make-index cache was working pretty well,
> >>> do_rootfs only spent a few seconds doing opkg-make-index on
> >>> incremental builds. In the OE-core world the situation is different,
> >>> opkg-make-index will reindex every package on each do_rootfs run, so
> >>> after a while building images starts taking *really* long, on my
> >>> systemd (work/ on ssd, deploy on rotating media) it now takes
> >>> =B17minutes just do refresh the opkg indices.
> >>>=20
> >>> Since I can't blame sstate for this I suspect that pseudo gets in the
> >>> way of the naive caching logic. Is there a simple way to turn off
> >>> pseudo when running opkg-make-index?
> >=20
> > With a relatively small deploy:
> >=20
> > real	6m14.611s
> > user	2m45.909s
> > sys	0m43.674s
> >=20
> >> You could try:
> >>=20
> >> PSEUDO_DISABLED=3D1 opkg-make-index
> >=20
> > real	5m25.920s
> > user	2m41.279s
> > sys	0m41.681s
> >=20
> >> or even
> >>=20
> >> PSEUDO_UNLOAD=3D1 opkg-make-index
> >=20
> > real	5m5.699s
> > user	2m37.283s
> > sys	0m37.508s
> >=20
> > Now I need to double check to see if  the patches are really having eff=
ect on the opkg caching instead of just not having pseudo overhead.
>=20
> Retesting without PSEUDO changes:
>=20
> real    5m18.412s
> user    2m40.736s
> sys     0m41.374s
>=20
> So the PSEUDO changes don't seem to do much :(

I can confirm this change here too:
OE om-gta02@shr ~/shr-core $ time /usr/bin/python2.7 \
/OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/opkg-make-index \
-r /OE/shr-core/tmp/deploy/ipk/armv4t/Packages \
-p /OE/shr-core/tmp/deploy/ipk/armv4t/Packages \
-l /OE/shr-core/tmp/deploy/ipk/armv4t/Packages.filelist \
-m /OE/shr-core/tmp/deploy/ipk/armv4t/


real    11m47.949s
user    4m13.848s
sys     0m17.917s

It hurts even more when someone is building ie for spitz and
linux-kexecboot depends on initramfs image which calls another=20
opkg-make-index with every image build.

If I replace opkg-make-index from oe-core with old oe-classic version, I
get a lot of messages like:
"Lost field license, MIT-X"

but the time is similar
real    10m23.953s
user    4m10.940s
sys     0m15.833s

And if I do the same completely in shr-unstable (based on OE-classic)
OE om-gta02@shr ~/shr-unstable $ time /usr/bin/python2.7 \
/OE/shr-unstable/tmp/sysroots/x86_64-linux/usr/bin/opkg-make-index \
-r /OE/shr-unstable/tmp/deploy/ipk/armv4t/Packages \
-p /OE/shr-unstable/tmp/deploy/ipk/armv4t/Packages \
-l /OE/shr-unstable/tmp/deploy/ipk/armv4t/Packages.filelist \
-m /OE/shr-unstable/tmp/deploy/ipk/armv4t/


real    0m6.469s
user    0m6.056s
sys     0m0.400s

Another difference seems to be in Packages.filelist which were empty in
OE-classic:

OE om-gta02@shr ~/shr-core $ find tmp/deploy/ipk/ -name Packages.filelist -=
exec wc -l {} \;
1173 tmp/deploy/ipk/palmpre2/Packages.filelist
1254 tmp/deploy/ipk/palmpre/Packages.filelist
107346 tmp/deploy/ipk/armv4t/Packages.filelist
110557 tmp/deploy/ipk/armv7a-vfp-neon/Packages.filelist
0 tmp/deploy/ipk/Packages.filelist
1365 tmp/deploy/ipk/nokia900/Packages.filelist
812 tmp/deploy/ipk/all/Packages.filelist
1643 tmp/deploy/ipk/om_gta02/Packages.filelist
OE om-gta02@shr ~/shr-core $ cd ../shr-unstable/
OE om-gta02@shr ~/shr-unstable $ find tmp/deploy/ipk/ -name Packages.fileli=
st -exec wc -l {} \;
0 tmp/deploy/ipk/armv7a/Packages.filelist
0 tmp/deploy/ipk/om-gta01/Packages.filelist
0 tmp/deploy/ipk/om-gta02/Packages.filelist
0 tmp/deploy/ipk/palmpre2/Packages.filelist
0 tmp/deploy/ipk/armv6/Packages.filelist
0 tmp/deploy/ipk/palmpre/Packages.filelist
0 tmp/deploy/ipk/armv4t/Packages.filelist
0 tmp/deploy/ipk/armv4/Packages.filelist
0 tmp/deploy/ipk/armv6-novfp/Packages.filelist
0 tmp/deploy/ipk/Packages.filelist
0 tmp/deploy/ipk/htcdream/Packages.filelist
0 tmp/deploy/ipk/nokia900/Packages.filelist
0 tmp/deploy/ipk/all/Packages.filelist
0 tmp/deploy/ipk/armv7/Packages.filelist

But that's not the cause, because even without Packages.filelist
generation it takes about 3 min (better but it still writes info for
every package).

Weird is that there is only small diff between new and old opkg.py/opkg-mak=
e-index
--- /OE/shr-unstable/tmp/sysroots/x86_64-linux/usr/bin/opkg.py  2011-05-27 =
18:35:03.000000000 +0200
+++ /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/opkg.py      2011-09-01 =
16:36:35.000000000 +0200
@@ -145,6 +145,7 @@
         self.priority =3D None
         self.tags =3D None
         self.fn =3D fn
+        self.license =3D None

         if fn:
             # see if it is deb format
@@ -319,6 +320,12 @@
     def get_section(self, section):
         return self.section

+    def set_license(self, license):
+        self.license =3D license
+
+    def get_license(self, license):
+        return self.license
+
     def get_file_list(self):
         if not self.fn:
             return []
@@ -425,6 +432,7 @@
         if self.description: out =3D out + "Description: %s\n" % (self.des=
cription)
         if self.oe: out =3D out + "OE: %s\n" % (self.oe)
         if self.homepage: out =3D out + "HomePage: %s\n" % (self.homepage)
+        if self.license: out =3D out + "License: %s\n" % (self.license)
         if self.priority: out =3D out + "Priority: %s\n" % (self.priority)
         if self.tags: out =3D out + "Tags: %s\n" % (self.tags)
         out =3D out + "\n"
(reverse-i-search)`uNr': diff -^Cr ~/common/conf/shr-core/ conf/

--- /OE/shr-unstable/tmp/sysroots/x86_64-linux/usr/bin/opkg-make-index  201=
1-05-27 18:35:03.000000000 +0200
+++ /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/opkg-make-index      201=
1-11-29 12:32:39.000000000 +0100
@@ -197,7 +197,15 @@
 names =3D packages.packages.keys()
 names.sort()
 for name in names:
-     for fn in packages[name].get_file_list():
+     try:
+          fnlist =3D packages[name].get_file_list()
+     except OSError, e:
+          sys.stderr.write("Package %s disappeared on us!\n" % (name))
+          continue
+     except IOError, e:
+          sys.stderr.write("Package %s disappeared on us!\n" % (name))
+          continue
+     for fn in fnlist:
           (h,t) =3D os.path.split(fn)
           if not t: continue
           if not files.has_key(t): files[t] =3D name+':'+fn


Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7UxMQACgkQN1Ujt2V2gBy5xgCgsPvyCbyqoliN+jolZm4uLoXv
Yj4An22FulVn4WQY8j/nwidEZJ9Gxdor
=L9EE
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--
