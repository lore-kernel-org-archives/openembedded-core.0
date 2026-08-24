Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AE4C5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 18:01:53 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3738.1787594512473897001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 11:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cZxER+QI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954dff6536so27803945e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 11:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787594510; x=1788199310; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/WZ4KDVu7FBPq35jzK6rMpJFl0CoNhP9r4nPD2lFs/A=;
        b=cZxER+QIujPxZpfCOrGCgPuYBvT2UmXMT3A+O1z37z1bX95D+esC+DQy9OQISpGh6N
         xzCZ33Wi8MwRN+DJPKzld/a76lvW2H/uouU1/CWlOdO1/0i2XRprEtZWAFG6Zw5dTrEc
         TnMuAQbpu3twNuiw3vn+NLfyw2R0wjRnhvrqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787594510; x=1788199310;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WZ4KDVu7FBPq35jzK6rMpJFl0CoNhP9r4nPD2lFs/A=;
        b=VFsWasTgbQOF6zwQqbTG8r4RO/G6Dkn4GsI77vVapqyXrvtRPgWhCT988xRd6xzv2Z
         B2fqSpSmfnh51EiieXeHNObRXmR08Mkc4pULsPtrboZZpquO8W+yl7mVXmXBodPoz7qi
         jWidZ00y4VjJQ4kQxFf1sr0YwXKeb/4K3ntv8DrGJLgKZI9ilQ29Q0ekZH720GH1dylo
         1yDcYVMfkN/qHvuyJuZHOBK0it72O8MJrve/JoQ3M6SABUf6sY0Rt/E3OFmDkKxfj2sR
         v93RRxeoOvZEm3IqMzVSVUOiTfKrLn8+f5qSw6vskisSDMDiwEY46NHiLy+gA9Ul7oSG
         yDYA==
X-Forwarded-Encrypted: i=1; AHgh+Rred8aTiODdj/0duN6qdweJ03eds6SGIGCcJiiPkKooNVNUlS7DayhNs1E9/ODIZssvJtlOIPfXNUnRogp4hKJZMQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++nvSSV5Eb/XVvdlJOL+y8yFoofd5vKL/SzUyD5TTzjLtM0Wd0z9
	Ugl5ogFxw7IbcGfF12ogWkUDhIZo2uzKT3wVWxWjo+m7JV27uoxSLh7c6larDYy26Wc=
X-Gm-Gg: AR+sD124DDmU8WA+Nb/w1IxvnEaRlHQJKS5nlNPmxH+/7Cf6wURODD+Gc7KyGNRT/oT
	ifUek5a3LulJkTNDn9b1mZ0mq1bPzkjybZQrdAaDn+zyIqUFTM8+BolsDZ6IY7Gsyt7399CbzyN
	2vjlIUPjrQxObjaXxgZOU2Wq4unYRUn8j+38KFHifiFliE3kB2ZYF4Cq1yY60Xk90Byj6u/Txml
	Zd4PbdAgcZCRk9kQwSiSdaFxCHC1Y3116D0Dmr83aH52a7TEKovlzJa+39IrSvGxw2+g/vYLg8B
	jE6HuzplF4cNJZ7kUg1WOLTwS19+Ba6KL0QIqY3eLWFrI0C0fy6edlWxLnTrFdijdAofnq1z2J9
	WXVwhD2+6zKpy9niv6UKRc4DnMRm/tR8dwlKwHQCQQ8fIwzXf/Z8yDXXtix9f3CsdVzUgOKSZ4L
	3agPboEwghv8FkNKK2gJ9b4lnkQzfZBsLta6tt5jSsIjaQOE1z7ks1ebrhAZzAFEU7zPPwP+s3J
	ew+x6jEhKZw23od9DmO0uapVEDFCRDu23TzskATV0oO65atZA9Uuw==
X-Received: by 2002:a05:600c:138b:b0:499:84fe:ca8c with SMTP id 5b1f17b1804b1-499d64fe235mr5722075e9.5.1787594510234;
        Mon, 24 Aug 2026 11:01:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5c5b:7a15:ab97:8d7f? ([2001:8b0:aba:5f3c:5c5b:7a15:ab97:8d7f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9c146fcsm8856804f8f.34.2026.08.24.11.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:01:49 -0700 (PDT)
Message-ID: <a1b73fb481ecc936d51a96f27e957a8aebf2a8d9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v15 00/12] rpm: 4.20.1 -> 6.0.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sumanth.gavini@windriver.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
 "mathieu.dubois-briand@bootlin.com"
	 <mathieu.dubois-briand@bootlin.com>, "alex.kanavin@gmail.com"
	 <alex.kanavin@gmail.com>
Cc: "mattware@cisco.com" <mattware@cisco.com>, "esparlin@cisco.com"	
 <esparlin@cisco.com>, "peter.marko@siemens.com" <peter.marko@siemens.com>, 
 "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Date: Mon, 24 Aug 2026 19:01:47 +0100
In-Reply-To: <7c99f641-a213-4524-acdf-1ecf782d06ba@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
	 <9b1d36c0af04de14a7f59695e40f513dc454d7a4.camel@linuxfoundation.org>
	 <8e27d69d-7d93-48a7-96c1-4145c477cb4c@windriver.com>
	 <9a9798bb3c537d4d1f723d450980a52e5b9b7f77.camel@linuxfoundation.org>
	 <7c99f641-a213-4524-acdf-1ecf782d06ba@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 18:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244148

Hi Sumanth,

On Fri, 2026-08-21 at 23:49 +0000, Sumanth Gavini via lists.openembedded.or=
g wrote:
> > Yes, I think we need to disable them.
> >=20
> > Before we do that, I would like to understand what information this
> > changes and whether there are dependencies we're going to miss out
> > on that we really need to add to do_package.
> >=20
> > So there are two things to work out:
> >=20
> > - What information do we lose by turning off the rpm 4 rpmdep code in
> > do_package? Do we need to add/find some of it differently?
> >=20
> > - What information do we lose by turning off the RPM 6 autogenerated
> > dependencies and is there any of that we need to add separately to
> > do_package somehow?
>=20
> Thank you for the detailed questions. I went through the source code to
> answer both fully.
>=20
> ---
> Q1: What do we lose by turning off the RPM 4 rpmdep code in do_package?
> =C2=A0=C2=A0=C2=A0=C2=A0 Do we need to add/find some of it differently?
>=20
> Nothing is lost and nothing needs to be added differently.
>=20
> In RPM 4, the dep generation in rpmbuild was explicitly disabled:
>=20
> =C2=A0=C2=A0 package_rpm.bbclass (rpm_old):
> =C2=A0=C2=A0=C2=A0=C2=A0 line 661: --define '_use_internal_dependency_gen=
erator 0'
> =C2=A0=C2=A0=C2=A0=C2=A0 line 675: --define '__find_requires %{nil}'
> =C2=A0=C2=A0=C2=A0=C2=A0 line 676: --define '__find_provides %{nil}'
>=20
> rpmbuild contributed zero file-based deps. The actual dep data came
> from a separate tool =E2=80=94 rpmdeps =E2=80=94 which runs in package_do=
_filedeps,
> defined in package.bbclass (shared across all backends):
>=20
> =C2=A0=C2=A0 package.bbclass:402
> =C2=A0=C2=A0=C2=A0=C2=A0 RPMDEPS =3D "rpmdeps --alldeps --define '__font_=
provides %{nil}'"
>=20
> =C2=A0=C2=A0 package.bbclass:404
> =C2=A0=C2=A0=C2=A0=C2=A0 python package_do_filedeps()=C2=A0 =E2=86=92 cal=
ls oe.package.process_filedeps()
>=20
> =C2=A0=C2=A0 meta/lib/oe/package.py:280
> =C2=A0=C2=A0=C2=A0=C2=A0 output =3D subprocess.check_output(shlex.split(r=
pmdeps) + pkgfiles)
>=20
> rpmdeps uses the fileattr system internally (macros.in default:
> _use_internal_dependency_generator =3D 1), so it generates ELF soname,
> script interpreter and pkgconfig() deps. Results are stored in
> FILERDEPENDS/FILERPROVIDES (package.py:1654) and written into the
> RPM spec via get_perfile():
>=20
> =C2=A0=C2=A0 RPM4 package_rpm.bbclass:368
> =C2=A0=C2=A0=C2=A0=C2=A0 if not perfiledeps:=C2=A0=C2=A0 =E2=86=90 True w=
ith default MERGEPERFILEDEPS=3D1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 splitrdepends +=3D get_p=
erfile('RDEPENDS', pkg, d)=C2=A0=C2=A0 # line 370
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 splitrprovides +=3D get_=
perfile('RPROVIDES', pkg, d) # line 371
>=20
> In RPM 6 this is unchanged and now unconditional:
>=20
> =C2=A0=C2=A0 RPM6 package_rpm.bbclass:303
> =C2=A0=C2=A0=C2=A0=C2=A0 splitrdepends=C2=A0 +=3D get_perfile('RDEPENDS',=
=C2=A0 pkg, d)
> =C2=A0=C2=A0=C2=A0=C2=A0 splitrprovides +=3D get_perfile('RPROVIDES', pkg=
, d)
>=20
> Alongside this, two more backend-independent pipelines run unchanged:
> =C2=A0=C2=A0 package.bbclass:411=C2=A0 package_do_shlibs=C2=A0=C2=A0=C2=
=A0=C2=A0 =E2=80=94 objdump -p =E2=86=92 OE package
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name deps =E2=
=86=92 RDEPENDS
> =C2=A0=C2=A0 package.bbclass:415=C2=A0 package_do_pkgconfig=C2=A0 =E2=80=
=94 .pc file parsing =E2=86=92 OE
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 package name d=
eps =E2=86=92 RDEPENDS
>=20
> All three pipelines are identical between RPM 4 and RPM 6 (confirmed
> by diff of package.bbclass and package.py between the two directories =E2=
=80=94
> only two unrelated lines differ in package.py, neither affecting deps).


Thanks, this helps a lot. Just to confirm, rpmdeps in v6 generates the
same information as we're seeing with rpmdeps v4, so the dependency
information output by the call during do_package is unchanged?

> Q2: What do we lose by turning off the RPM 6 autogenerated dependencies?
> =C2=A0=C2=A0=C2=A0=C2=A0 Is there any that we need to add separately to d=
o_package?
>=20
> Nothing is lost and nothing needs to be added to do_package.
>=20
> In RPM 6, setting _use_internal_dependency_generator 0 is no longer
> silently ignored =E2=80=94 it is a hard build error for v6-format package=
s:
>=20
> =C2=A0=C2=A0 rpm/build/workspace/sources/rpm/build/rpmfc.cc:1618
> =C2=A0=C2=A0=C2=A0=C2=A0 if (!rpmExpandNumeric("%{?_use_internal_dependen=
cy_generator}")) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (fc->rpmformat < 6) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
rc =3D rpmfcApplyExternal(fc);=C2=A0=C2=A0 // RPM4: allowed
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
rpmlog(RPMLOG_ERR,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 _("External dependency generator is incompatible "
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "with v6 packages\n"));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
rc =3D RPMRC_FAIL;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 // RPM6: hard error
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0 } else {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D rpmfcApplyInterna=
l(fc);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // fileattr system runs
> =C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> So the only way to suppress deps in RPM 6 is per generator. The 12
> fileattr generators are verified from:
>=20
> =C2=A0=C2=A0 rpm/build/workspace/sources/rpm/fileattrs/
>=20
> Their status:
>=20
> =C2=A0=C2=A0 FULLY SUPPRESSED in v15:
> =C2=A0=C2=A0 - font.attr=C2=A0=C2=A0=C2=A0=C2=A0 :__font_provides %{nil} =
(package_rpm.bbclass:601)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __font_requires is already %{nil=
} in the attr file
> =C2=A0=C2=A0 - sysusers.attr :__sysusers_path %{nil} (package_rpm.bbclass=
:606)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 path=3Dnil means no files match,=
 entire generator disabled
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __sysusers_requires also n=
il via=20
> _use_weak_usergroup_deps 1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (package_rpm.bbclass:607, existe=
d in RPM4 too)
>=20
> =C2=A0=C2=A0 PARTIALLY SUPPRESSED in v15:
> =C2=A0=C2=A0 - pkgconfig.attr : Requires: __pkgconfig_requires %{nil}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (package_rpm.bbclass=
:602)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Provides: still acti=
ve =E2=86=92 needs=20
> __pkgconfig_provides %{nil}
>=20
> =C2=A0=C2=A0 NOT YET SUPPRESSED =E2=80=94 needed in v16:
> =C2=A0=C2=A0 - elf.attr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :Provides: libfoo.s=
o.1 / Requires: libfoo.so.1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (duplicate of package_do_filedep=
s via rpmdeps =E2=80=94 same
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elfdeps tool; ipk/deb do n=
ot generate soname deps)
> =C2=A0=C2=A0 - script.attr=C2=A0=C2=A0 : Requires: /bin/bash, /usr/bin/py=
thon3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (duplicate of package_do_filedep=
s via rpmdeps =E2=80=94 same
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 script.req tool; ipk/deb d=
o not generate these)
> =C2=A0=C2=A0 - pkgconfig.attr :Provides =E2=86=92 pkgconfig(foo)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (duplicate of package_do_filedep=
s; ipk/deb do not
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 generate pkgconfig() deps)
> =C2=A0=C2=A0 - desktop.attr=C2=A0 :Provides: application(), mimehandler(t=
ext/html)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (not in any OE pipeline; ipk/deb=
 do not generate these)
> =C2=A0=C2=A0 - debuginfo.attr :Provides: debuginfo(build-id) =3D abc123
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (not in any OE pipeline; ipk/deb=
 do not generate these)
> =C2=A0=C2=A0 - metainfo.attr :Provides: metainfo(), metainfo(foo.xml)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (not in any OE pipeline; ipk/deb=
 do not generate these)
> =C2=A0=C2=A0 - ocaml.attr=C2=A0=C2=A0 :Provides/Requires: ocaml(Foo)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (not in any OE pipeline; ipk/deb=
 do not generate these)
> =C2=A0=C2=A0 - rpm_lua.attr : Provides: rpm_lua(foo.bar)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (not in any OE pipeline; ipk/deb=
 do not generate these)
> =C2=A0=C2=A0 - rpm_macro.attr :Provides: RPM macro file provides
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (not in any OE pipeline; ipk/deb=
 do not generate these)
> =C2=A0=C2=A0 - usergroup.attr: Provides: user(name), group(name)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (not in any OE pipeline; ipk/deb=
 do not generate these)
>=20
> For elf and script the suppression removes duplicates =E2=80=94 the same =
deps
> are already in the spec from package_do_filedeps via get_perfile().
>=20
> For desktop, debuginfo, metainfo, ocaml, rpm_lua, rpm_macro and
> usergroup, these are RPM-specific Provides that ipk/deb never generate.
> Adding them to do_package would create exactly the backend inconsistency
> you raised. They should be suppressed, not preserved.
>=20
> v16 will add the following to package_rpm.bbclass:
>=20
> =C2=A0=C2=A0 cmd +=3D " --define '__elf_requires %{nil}'"
> =C2=A0=C2=A0 cmd +=3D " --define '__elf_provides %{nil}'"
> =C2=A0=C2=A0 cmd +=3D " --define '__script_requires %{nil}'"
> =C2=A0=C2=A0 cmd +=3D " --define '__pkgconfig_provides %{nil}'"
> =C2=A0=C2=A0 cmd +=3D " --define '__desktop_provides %{nil}'"
> =C2=A0=C2=A0 cmd +=3D " --define '__debuginfo_provides %{nil}'"
> =C2=A0=C2=A0 cmd +=3D " --define '__metainfo_provides %{nil}'"
> =C2=A0=C2=A0 cmd +=3D " --define '__ocaml_requires %{nil}'"
> =C2=A0=C2=A0 cmd +=3D " --define '__ocaml_provides %{nil}'"
> =C2=A0=C2=A0 cmd +=3D " --define '__rpm_lua_provides %{nil}'"
> =C2=A0=C2=A0 cmd +=3D " --define '__rpm_macro_provides %{nil}'"
> =C2=A0=C2=A0 cmd +=3D " --define '__usergroup_provides %{nil}'"
>=20
> This restores the same zero auto-dep behaviour OE had with RPM 4,
> keeping all three backends (rpm, ipk, deb) consistent.
>=20
> Please review the above analysis, I am currently working on oe-selftest
> failure(runtime_test.Postinst.test_failing_postinst).
> Once the analysis looks good to you, I will include the above=20
> suppression changes together with the selftest fix in v16.

Thanks, this really helps. I think we need to open a bug about
analysing what output we're missing out on here and whether it would
make sense to capture some of it but we can think about that as a
separate issue longer term compared to the more urgent upgrade.

I'm assuming this output is available from rpmdeps when called
externally too?

Regardless, I'm much happier now this has been properly checked into
and detailed.

Cheers,

Richard


