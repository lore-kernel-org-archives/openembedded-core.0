Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.67204.1629366828382643159
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 02:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.196, mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 62CFAE0007;
	Thu, 19 Aug 2021 09:53:39 +0000 (UTC)
Date: Thu, 19 Aug 2021 11:53:39 +0200
From: "Quentin Schulz" <foss@0leil.net>
To: openembedded-core@lists.openembedded.org,
 Jose Quaresma <quaresma.jose@gmail.com>
Subject: Re: [OE-core] [PATCH v3] patch.bbclass: check if patchdir exist
In-Reply-To: <20210819082934.10907-1-quaresma.jose@gmail.com>
References: <20210819082934.10907-1-quaresma.jose@gmail.com>
Message-ID: <BE9AF7EF-C06C-4F6B-A1D0-DDB3A6C21D3E@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jose,

On August 19, 2021 10:29:34 AM GMT+02:00, Jose Quaresma <quaresma=2Ejose@g=
mail=2Ecom> wrote:
>if the user specifies path on 'patchdir' that don't exist,
>the patch will fail and there are no message that indicates the real caus=
e=2E
>
>Signed-off-by: Jose Quaresma <quaresma=2Ejose@gmail=2Ecom>
>---
> meta/classes/patch=2Ebbclass | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/meta/classes/patch=2Ebbclass b/meta/classes/patch=2Ebbclass
>index 559c6f45bd=2E=2E1e9a024bf9 100644
>--- a/meta/classes/patch=2Ebbclass
>+++ b/meta/classes/patch=2Ebbclass
>@@ -131,6 +131,8 @@ python patch_do_patch() {
>             patchdir =3D parm["patchdir"]
>             if not os=2Epath=2Eisabs(patchdir):
>                 patchdir =3D os=2Epath=2Ejoin(s, patchdir)
>+            if not os=2Epath=2Eisdir(patchdir):
>+                bb=2Efatal("Patch source directory don't found '%s'" % p=
atchdir)

In your text, it should be "not" and not "don't"=2E

I could suggest also:

patchdir '%s' not found

Or explicit in the message that "Patch source directory" not found means "=
patchdir" is incorrect somewhere in SRC_URI=2E

I think you could even tell which patch file has its patchdir incorrect by=
 printing the "local" variable=2E Not sure it brings anything, just thinkin=
g out loud =F0=9F=98=81

Anyway, I like this patch, but it does not have the same purpose as the ea=
rlier version of this patch series=2E I think it is also important to print=
 the patchdir when the patch tool fails to apply the patch=2E It might be b=
ecause the path exists but is incorrect=2E

So it'd be awesome if we can get the patchdir in the fatal message when th=
e patch fails to apply=2E My understanding of patch=2Ebbclass and lib/oe/pa=
tch=2Epy is that resolver=2EResolve() is doing the patching so in that exce=
pt thr patchdir could be printed=2E

Many thanks!
Quentin
