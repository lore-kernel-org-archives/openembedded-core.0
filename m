Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.23354.1604982042295193237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 20:20:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: fede.evol@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id a65so1646614wme.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 20:20:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=p/Gtd1KpXV6pOB0uy0nO+2kweZgAU4+a5ydlRRZdyaU=;
        b=pdsvPNIInurtQp5WaBbS2nyvnahlwTYx5HePXK0dusEG7BvGfJaxwFv87zv1Cp5bdv
         2XEMlThRUVwKCZ3Wt3lZXc/IHegiQb3W1HPVqDnDZHIhwOOs3LUprKjwdgHacKJE5N+5
         OSQ9aCP/W48XbpRMoRZ0novaMB3LTY0Ja6LOJDvbDvt5c8TB4ZOKIiu8jef8TPQ5UDLi
         36vZQBPDOVrePhdhqF8H5QwcgWbmsqLlQza5QHr/RhtdBzmSDcNLyNNrysKnwnlHbN0U
         8+HydJqIO0CkZflpjSPtOjOZycigXc+6sXlpWRYHOr+8UFV1oIip5WgL8xw3Mv/c1zmo
         HuNg==
X-Gm-Message-State: AOAM533siQvXQrPcI0UaaQBdyGWvdQMB2w21x3kECr08LpspPTluWMH8
	5ugMlyYCT3wooVroO/FcXku04DWKHm2uV1yddMhqfDd+LGLZ0Q==
X-Google-Smtp-Source: ABdhPJyYiSMiZTZWsdMz0iVYsswLOeyqblBiSHs1RFN/E/+lHimx80lFBIoBsQ8hhvw803jYFd+waJlmFIoK3MJnLYw=
X-Received: by 2002:a1c:9a12:: with SMTP id c18mr2454796wme.22.1604982040486;
 Mon, 09 Nov 2020 20:20:40 -0800 (PST)
MIME-Version: 1.0
From: "Federico Pellegrin" <fede@evolware.org>
Date: Tue, 10 Nov 2020 05:20:29 +0100
Message-ID: <CAM6O0Zj3fRQkqTtfDs4s-AdQo6OQgmgc3db4wXG75oyMNZdmyw@mail.gmail.com>
Subject: [PATCH] openssl: Add c_rehash to misc package and add perl runtime dependency
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Content-Type: multipart/alternative; boundary="00000000000064e65905b3b900af"

--00000000000064e65905b3b900af
Content-Type: text/plain; charset="UTF-8"

The following changes since commit f075071761172c69f8ae2be5868d51ef9ef646e7:

  conf: update for release 3.2 (2020-11-09 13:16:13 +0000)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib fedepell/bug14083

Federico Pellegrin (1):
  openssl: Add c_rehash to misc package and add perl runtime dependency


c_rehash implemented in perl is back (in history was moved to shell for
some time), so handle it inside the -misc package so just that one will
carry the heavy runtime dependency on perl and not the whole openssl
package. Note: in misc there were already before a few perl files
(tsget.pl and CA.pl) so the added perl dependency will fix those too.

[YOCTO #14083]

Signed-off-by: Federico Pellegrin <fede@evolware.org>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1h.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
b/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
index eb11fe3960..1827167201 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
@@ -195,13 +195,14 @@ FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf \
                       ${libdir}/ssl-1.1/openssl.cnf* \
                       "
 FILES_${PN}-engines = "${libdir}/engines-1.1"
-FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
+FILES_${PN}-misc = "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
 FILES_${PN} =+ "${libdir}/ssl-1.1/*"
 FILES_${PN}_append_class-nativesdk = "
${SDKPATHNATIVE}/environment-setup.d/openssl.sh"

 CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"

 RRECOMMENDS_libcrypto += "openssl-conf"
+RDEPENDS_${PN}-misc = "perl"
 RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash"

 RDEPENDS_${PN}-bin += "openssl-conf"
-- 
2.26.2

--00000000000064e65905b3b900af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div><br>The following changes since commit=
 f075071761172c69f8ae2be5868d51ef9ef646e7:<br><br>=C2=A0 conf: update for r=
elease 3.2 (2020-11-09 13:16:13 +0000)<br><br>are available in the Git repo=
sitory at:<br><br>=C2=A0 git://<a href=3D"http://push.yoctoproject.org/poky=
-contrib">push.yoctoproject.org/poky-contrib</a> fedepell/bug14083<br><br>F=
ederico Pellegrin (1):<br>=C2=A0 openssl: Add c_rehash to misc package and =
add perl runtime dependency<br><br></div><div><br></div>c_rehash implemente=
d in perl is back (in history was moved to shell for<br>some time), so hand=
le it inside the -misc package so just that one will<br>carry the heavy run=
time dependency on perl and not the whole openssl<br>package. Note: in misc=
 there were already before a few perl files<br>(<a href=3D"http://tsget.pl"=
>tsget.pl</a> and CA.pl) so the added perl dependency will fix those too.<b=
r><br>[YOCTO #14083]<br><br>Signed-off-by: Federico Pellegrin &lt;<a href=
=3D"mailto:fede@evolware.org">fede@evolware.org</a>&gt;<br>---<br>=C2=A0met=
a/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1h.bb">openssl=
_1.1.1h.bb</a> | 3 ++-<br>=C2=A01 file changed, 2 insertions(+), 1 deletion=
(-)<br><br>diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http:/=
/openssl_1.1.1h.bb">openssl_1.1.1h.bb</a> b/meta/recipes-connectivity/opens=
sl/<a href=3D"http://openssl_1.1.1h.bb">openssl_1.1.1h.bb</a><br>index eb11=
fe3960..1827167201 100644<br>--- a/meta/recipes-connectivity/openssl/<a hre=
f=3D"http://openssl_1.1.1h.bb">openssl_1.1.1h.bb</a><br>+++ b/meta/recipes-=
connectivity/openssl/<a href=3D"http://openssl_1.1.1h.bb">openssl_1.1.1h.bb=
</a><br>@@ -195,13 +195,14 @@ FILES_openssl-conf =3D &quot;${sysconfdir}/ss=
l/openssl.cnf \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/ssl-1.1/openssl.cnf* \<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;<br>=C2=A0FILES_${PN}-engines =3D &quot;${libdir}/engines-1.1&quot;<br>=
-FILES_${PN}-misc =3D &quot;${libdir}/ssl-1.1/misc&quot;<br>+FILES_${PN}-mi=
sc =3D &quot;${libdir}/ssl-1.1/misc ${bindir}/c_rehash&quot;<br>=C2=A0FILES=
_${PN} =3D+ &quot;${libdir}/ssl-1.1/*&quot;<br>=C2=A0FILES_${PN}_append_cla=
ss-nativesdk =3D &quot; ${SDKPATHNATIVE}/environment-setup.d/openssl.sh&quo=
t;<br>=C2=A0<br>=C2=A0CONFFILES_openssl-conf =3D &quot;${sysconfdir}/ssl/op=
enssl.cnf&quot;<br>=C2=A0<br>=C2=A0RRECOMMENDS_libcrypto +=3D &quot;openssl=
-conf&quot;<br>+RDEPENDS_${PN}-misc =3D &quot;perl&quot;<br>=C2=A0RDEPENDS_=
${PN}-ptest +=3D &quot;openssl-bin perl perl-modules bash&quot;<br>=C2=A0<b=
r>=C2=A0RDEPENDS_${PN}-bin +=3D &quot;openssl-conf&quot;<br>-- <br>2.26.2<b=
r></div>

--00000000000064e65905b3b900af--
