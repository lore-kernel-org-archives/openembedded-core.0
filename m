Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U69Rq-0001c4-PB
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 01:46:42 +0100
Received: by mail-ee0-f50.google.com with SMTP id e51so1674663eek.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 16:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=EPXOXEm48U8nR5/GCT40yeRcFOOiHm0HJAGzR/v9/AM=;
	b=N5NxBs7bjR8+WfQjsa2oQE1qEzfLubx1kGwTo6MywwkwN5NWlr0aTfoEobZq4XNL0k
	mTdBarhSa80Ak73e7tIf6ho/+8RT0Yj/HL9GqYQrBNecQ7Fh6rxEhad2zialu/wBfyV0
	nInHTlFsM3NGY/kIwyrpfcwKPHu7gS3qAGU4+JxaqTMpgNwcqJs8e5I5zwS2wyLCVJAA
	B+CQYZmMVzaLywv2s04ZrkxaLv+9ey3qNeAAKp9EwAw0bvQfNTmWfNgoc0hXRuOSbZxv
	d5UZ8Qla2eU7vsDB4D0Xg1Y4o2x0R+z2tdBTeHkL0LGlR4fyyEs0Bt2VG5EaVF2IcZoq
	aHhQ==
X-Received: by 10.14.182.137 with SMTP id o9mr2093576eem.13.1360888239896;
	Thu, 14 Feb 2013 16:30:39 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d47sm22357904eem.9.2013.02.14.16.30.38
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 14 Feb 2013 16:30:39 -0800 (PST)
Date: Fri, 15 Feb 2013 01:30:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130215003044.GN3300@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: New ugly parsing error, when SRCPV fails to expand
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
X-List-Received-Date: Fri, 15 Feb 2013 00:46:42 -0000
X-Groupsio-MsgNum: 35489
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yK/6QRnH3Zanb0EF"
Content-Disposition: inline

--yK/6QRnH3Zanb0EF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Failing to get recipe from upstream svn repository now fails with ugly=20
stack trace.

I have bitbake/master from today and it's not really google-glog fault I ha=
d network=20
issue when bitbake was parsing, but error message should look better (it lo=
oked better
before)

Parsing recipes...ERROR: Error executing a python function in <code>:
ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetc=
h2.get_srcrev(d)} which triggered exception FetchError: Fetcher failure: Fe=
tch command failed with exit
 code 1, output:
svn: E175002: Unable to connect to a repository at URL 'http://google-glog.=
googlecode.com/svn/trunk'
svn: E175002: OPTIONS of 'http://google-glog.googlecode.com/svn/trunk': Cou=
ld not resolve hostname `google-glog.googlecode.com': Host not found (http:=
//google-glog.googlecode.com
)


ERROR: The stack trace of python calls that resulted in this exception/fail=
ure was:
ERROR:   File "<code>", line 1, in <module>
ERROR:
ERROR:   File "__anon_620__OE_shr_core_openembedded_core_meta_classes_base_=
bbclass", line 209, in __anon_620__OE_shr_core_openembedded_core_meta_class=
es_base_bbclass
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 503, in get=
Var
ERROR:     return self.expand(value, var)
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 336, in exp=
and
ERROR:     return self.expandWithRefs(s, varname).value
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 317, in exp=
andWithRefs
ERROR:     s =3D __expand_var_regexp__.sub(varparse.var_sub, s)
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 97, in var_=
sub
ERROR:     var =3D self.d.getVar(key, True)
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 503, in get=
Var
ERROR:     return self.expand(value, var)
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 336, in exp=
and
ERROR:     return self.expandWithRefs(s, varname).value
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 317, in exp=
andWithRefs
ERROR:     s =3D __expand_var_regexp__.sub(varparse.var_sub, s)
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 97, in var_=
sub
ERROR:     var =3D self.d.getVar(key, True)
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 503, in get=
Var
ERROR:     return self.expand(value, var)
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 336, in exp=
and
ERROR:     return self.expandWithRefs(s, varname).value
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 317, in exp=
andWithRefs
ERROR:     s =3D __expand_var_regexp__.sub(varparse.var_sub, s)
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 97, in var_=
sub
ERROR:     var =3D self.d.getVar(key, True)
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 503, in get=
Var
ERROR:     return self.expand(value, var)
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 336, in exp=
and
ERROR:     return self.expandWithRefs(s, varname).value
ERROR:
ERROR:   File "/OE/shr-core/bitbake/lib/bb/data_smart.py", line 326, in exp=
andWithRefs
ERROR:     raise ExpansionError(varname, s, exc)
ERROR:
ERROR: The code that was being executed was:
ERROR:  *** 0001:__anon_620__OE_shr_core_openembedded_core_meta_classes_bas=
e_bbclass(d)
ERROR:      0002:__anon_227__OE_shr_core_openembedded_core_meta_classes_pac=
kage_bbclass(d)
ERROR:      0003:__anon_20__OE_shr_core_openembedded_core_meta_classes_blac=
klist_bbclass(d)
ERROR:      0004:__anon_20__OE_shr_core_openembedded_core_meta_classes_debi=
an_bbclass(d)
ERROR:      0005:__anon_474__OE_shr_core_openembedded_core_meta_classes_pac=
kage_ipk_bbclass(d)
ERROR: [From file: '<code>', lineno: 1, function: <module>]
ERROR:      0205:    #
ERROR:      0206:    override =3D d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH'=
, True)
ERROR:      0207:    if override !=3D '0':
ERROR:      0208:        paths =3D []
ERROR:  *** 0209:        fpaths =3D (d.getVar('FILESPATH', True) or '').spl=
it(':')
ERROR:      0210:        machine =3D d.getVar('MACHINE', True)
ERROR:      0211:        for p in fpaths:
ERROR:      0212:            if os.path.basename(p) =3D=3D machine and os.p=
ath.isdir(p):
ERROR:      0213:                paths.append(p)
ERROR: [From file: '__anon_620__OE_shr_core_openembedded_core_meta_classes_=
base_bbclass', lineno: 209, function: __anon_620__OE_shr_core_openembedded_=
core_meta_classes_base_bbclass]
ERROR: Failed to parse recipe: /OE/shr-core/meta-openembedded/meta-oe/recip=
es-support/google-glog/google-glog_svn.bb
ERROR: Command execution failed: Exited with 1

Summary: There were 70 ERROR messages shown, returning a non-zero exit code.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yK/6QRnH3Zanb0EF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEdgbQACgkQN1Ujt2V2gBxp0ACglAclULEd11+JlzvtqBllNYZO
pwgAn2M3cFwDez6q5KNFFIT/6QBeGyD9
=7ufX
-----END PGP SIGNATURE-----

--yK/6QRnH3Zanb0EF--
