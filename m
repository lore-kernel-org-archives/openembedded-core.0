Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web08.4482.1623103327811342397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jun 2021 15:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from [91.216.112.25] (helo=[192.168.82.30])
	by pbcl.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1lqNJr-00072q-1w; Tue, 08 Jun 2021 00:02:05 +0200
Date: Mon, 07 Jun 2021 23:01:58 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <20210607212558.86624-1-bkylerussell@gmail.com>
References: <20210607212558.86624-1-bkylerussell@gmail.com>
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] lib: oe: utils: always append host gcc version to NATIVELSBSTRING
To: openembedded-core@lists.openembedded.org,bkylerussell@gmail.com
CC: wesley.lindauer@gmail.com,Kyle Russell <bkylerussell@gmail.com>
From: "Phil Blundell" <pb@pbcl.net>
Message-ID: <01B7D818-661B-4A57-A3DB-C6AC0F0DD217@pbcl.net>
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software, running on the system "hetzner.pbcl.net",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 postmaster@pbcl.net for details.
 
 Content preview:  Wouldn't it be easier to just force -fPIE on for those users
    for whom this is a problem? Or force -fPIE off for native everywhere. I'm
    not sure that doing something based on GCC version is obviously t [...] 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 HTML_MESSAGE           BODY: HTML included in message
Content-Type: multipart/alternative; boundary="----6E4GAP15OU0N9PG4PVXNI8Z9W9120G"
Content-Transfer-Encoding: 7bit

------6E4GAP15OU0N9PG4PVXNI8Z9W9120G
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Wouldn't it be easier to just force -fPIE on for those users for whom this =
is a problem? Or force -fPIE off for native everywhere=2E I'm not sure that=
 doing something based on GCC version is obviously the right plan=2E

p=2E


On 7 June 2021 22:25:58 BST, bkylerussell@gmail=2Ecom wrote:
>By having multiple uninative feeds based on host gcc version (rather
>than a
>single uninative feed for all possible host gcc versions), we avoid a
>general
>class of problems (as first observed in the bug below) where changes in
>native
>gcc don't cause native sstate to regenerate=2E  Below is another example
>where
>this problem is encountered across multiple supported host distros for
>a given
>poky version=2E
>
>gcc 6 supports default generation of PIE, which gets enabled between
>Ubuntu
>16=2E04 (default gcc 5=2E4) and 18=2E04 (default gcc 7=2E5), both support=
ed
>distros
>of warrior=2E  Consider a native package dependency chain as follows:
>
>     A
>   / | \
>  B  C  D
>
>If a complete set of native sstate for the above packages is built
>prior
>to the default PIE change, but a workstation upgrades its distro to a
>version
>that natively compiles PIE by default, the sstate hash is not currently
>tainted,
>so the newer compiler version will pull from sstate not compiled for
>PIE=2E
>
>For example, if a source change to C causes part of the above chain to
>rebuild
>(C -> A), then this may result in non-PIE sstate (B and D) giving link
>errors
>with A=2E
>
>ld: relocation R_X86_64_32 against `=2Erodata=2Estr1=2E8' can not be used
>when making a PIE object; recompile with -fPIC
>ld: final link failed: Nonrepresentable section on output
>
>This appears to have been considered previously as an option to address
>the following bug, but appears to have been set aside only because of
>proximity to the end of a release cycle=2E
>
>[YOCTO #10441]
>
>Signed-off-by: Kyle Russell <bkylerussell@gmail=2Ecom>
>---
> meta/lib/oe/utils=2Epy | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/meta/lib/oe/utils=2Epy b/meta/lib/oe/utils=2Epy
>index a84039f585=2E=2E8afe19fd99 100644
>--- a/meta/lib/oe/utils=2Epy
>+++ b/meta/lib/oe/utils=2Epy
>@@ -426,7 +426,7 @@ def host_gcc_version(d, taskcontextonly=3DFalse):
>bb=2Efatal("Can't get compiler version from %s --version output" %
>compiler)
>=20
>     version =3D match=2Egroup(1)
>-    return "-%s" % version if version in ("4=2E8", "4=2E9") else ""
>+    return "-%s" % version
>=20
>=20
> def get_multilib_datastore(variant, d):
>--=20
>2=2E25=2E1

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

------6E4GAP15OU0N9PG4PVXNI8Z9W9120G
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>Wouldn't it be easier to just force -fPIE on for t=
hose users for whom this is a problem? Or force -fPIE off for native everyw=
here=2E I'm not sure that doing something based on GCC version is obviously=
 the right plan=2E<br><br>p=2E<br><br><br><div class=3D"gmail_quote">On 7 J=
une 2021 22:25:58 BST, bkylerussell@gmail=2Ecom wrote:<blockquote class=3D"=
gmail_quote" style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid r=
gb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail">By having multiple uninative feeds based on host gcc=
 version (rather than a<br>single uninative feed for all possible host gcc =
versions), we avoid a general<br>class of problems (as first observed in th=
e bug below) where changes in native<br>gcc don't cause native sstate to re=
generate=2E  Below is another example where<br>this problem is encountered =
across multiple supported host distros for a given<br>poky version=2E<br><b=
r>gcc 6 supports default generation of PIE, which gets enabled between Ubun=
tu<br>16=2E04 (default gcc 5=2E4) and 18=2E04 (default gcc 7=2E5), both sup=
ported distros<br>of warrior=2E  Consider a native package dependency chain=
 as follows:<br><br>     A<br>   / | \<br>  B  C  D<br><br>If a complete se=
t of native sstate for the above packages is built prior<br>to the default =
PIE change, but a workstation upgrades its distro to a version<br>that nati=
vely compiles PIE by default, the sstate hash is not currently tainted,<br>=
so the newer compiler version will pull from sstate not compiled for PIE=2E=
<br><br>For example, if a source change to C causes part of the above chain=
 to rebuild<br>(C -&gt; A), then this may result in non-PIE sstate (B and D=
) giving link errors<br>with A=2E<br><br>ld: relocation R_X86_64_32 against=
 `=2Erodata=2Estr1=2E8' can not be used when making a PIE object; recompile=
 with -fPIC<br>ld: final link failed: Nonrepresentable section on output<br=
><br>This appears to have been considered previously as an option to addres=
s<br>the following bug, but appears to have been set aside only because of<=
br>proximity to the end of a release cycle=2E<br><br>[YOCTO #10441]<br><br>=
Signed-off-by: Kyle Russell &lt;bkylerussell@gmail=2Ecom&gt;<hr> meta/lib/o=
e/utils=2Epy | 2 +-<br> 1 file changed, 1 insertion(+), 1 deletion(-)<br><b=
r>diff --git a/meta/lib/oe/utils=2Epy b/meta/lib/oe/utils=2Epy<br>index a84=
039f585=2E=2E8afe19fd99 100644<br>--- a/meta/lib/oe/utils=2Epy<br>+++ b/met=
a/lib/oe/utils=2Epy<br>@@ -426,7 +426,7 @@ def host_gcc_version(d, taskcont=
extonly=3DFalse):<br>         bb=2Efatal("Can't get compiler version from %=
s --version output" % compiler)<br> <br>     version =3D match=2Egroup(1)<b=
r>-    return "-%s" % version if version in ("4=2E8", "4=2E9") else ""<br>+=
    return "-%s" % version<br> <br> <br> def get_multilib_datastore(variant=
, d):</pre></blockquote></div><br>-- <br>Sent from my Android device with K=
-9 Mail=2E Please excuse my brevity=2E</body></html>

------6E4GAP15OU0N9PG4PVXNI8Z9W9120G--
