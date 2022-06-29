Return-Path: <fede.evol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA4EC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 09:31:53 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web08.9439.1656495102836838611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 02:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: fede.evol@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id o23so18153851ljg.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 02:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=VvD+ZjgxYyCP0MW9uC8QXdoOs8UWsZAn18xA3t94K6I=;
        b=whwdESsRMGirMgbV3q1Egw4NVAJOgCOE1d7FRTKChPBmx9o8pd6bvmiBOGkaYCe8qb
         2zyxco7GXrAGg1GfcxPj2VamKh+waB3GhV+A830oN/H5uSVaxeKwjTcv9ajFEXgeFGXI
         K+jXtuOai2sP7M7/9ieA/ap3ccAhLV1Er1jEWEqCB/ApFewmbP8JPDpUGhVMNK7yI96a
         0r4Oygt8fgbCN6o9QwovyoxF/ZlrpoAwZWBmAxuC4ejvuKuF3t4P6GjJlkDIX8x6rrGP
         KKGRvdf65/SoAYFu5qwxxnyJEnZ6PqkZsXi8WI/+qNVZkkyjGsUFjKzxTjyraklpVNhe
         mLDA==
X-Gm-Message-State: AJIora8d/s9v6fr2nJNPaW7RKX1JVNkNjH7bRDZ2sIpObBAq1kRaDk8I
	rwnBCjAjEqArUxxnQQh3RyHIGOTGg4pMbT4dQu3cQgkpgicgdA==
X-Google-Smtp-Source: 
 AGRyM1v1ZUkiF+GXDKJAo+iQgdAZmncEsHnRvgbkP+iDSWLpXa+wpaNd/zdqo9shpGdTsZlovrgSsaR3kdTxHOC4Csk=
X-Received: by 2002:a05:651c:1502:b0:25a:8c33:5935 with SMTP id
 e2-20020a05651c150200b0025a8c335935mr1209767ljf.246.1656495100823; Wed, 29
 Jun 2022 02:31:40 -0700 (PDT)
MIME-Version: 1.0
From: Federico Pellegrin <fede@evolware.org>
Date: Wed, 29 Jun 2022 11:31:29 +0200
Message-ID: 
 <CAM6O0ZhfbvU24wEFh6vQb9YAqGXzy_M+8UiT-8FsSxHhJDyoug@mail.gmail.com>
Subject: [OE-core] gpg signing and stale gpg-agent
To: OE <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000e905105e292d227"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 09:31:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167371

--0000000000000e905105e292d227
Content-Type: text/plain; charset="UTF-8"

Hi all,
I've been working with signing packages via gpg (specificall RPM, but that
shouldn't really matter) lately and things mostly work fine (modulo that
small patch from some 2 weeks ago now in master).

I have just one more possibly minor issue I wanted to get possibly an
opinion from the expert folk if possible!


Little background: to keep things isolated and not system dependant the GPG
related files are kept in a separate directory. This is then specified via
GPG_PATH (which then de facto is passed to various gpg tools as --homedir).
The keys are then kept there and just as a detail that is then an encrypted
FS which is just mounted/umounted when needed.

When gpg is run it will spawn a gpg-agent to deal with keys and this is
fine. The problem I have is that after bitbake finished the gpg-agent will
still be left running there and in my specific case this means that the
directory (pointed by GPG_PATH) will figure as in use and therefore cannot
be umounted. Of course if I kill by hand the gpg-agent then I can just
proceed and so on.

So the first question is: is it 'nice' that after the bitbake execution we
possibly leave as a matter of fact running stuff from Yocto around the
system?


As I wanted to come to pose a question also having done a bit of homework I
tried to understand how I could fix this and right now I arrived at
something like:

-------------

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index aa9bb49f2c..d6d1fd9e6c 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -58,6 +58,12 @@ class LocalSigner(object):
         for i in range(0, len(files), sign_chunk):
             subprocess.check_output(shlex.split(cmd + '
'.join(files[i:i+sign_chunk])), stderr=subprocess.STDOUT)

+        gpg_conf_bin = bb.utils.which(os.getenv('PATH'), "gpgconf")
+        if gpg_conf_bin and self.gpg_path:
+            cmd = [ gpg_conf_bin ] + ["--homedir", self.gpg_path,
"--kill", "gpg-agent"]
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+
+
     def detach_sign(self, input_file, keyid, passphrase_file,
passphrase=None, armor=True, output_suffix=None, use_sha256=False):
         """Create a detached signature of a file"""

-------------

(note: I kill only if the homedir is defined, this is TBD, it's just a PoC)
So basically after the loop that does all the chunk-wise signing I ask
gpgconf to stop the gpgagent and this actually seem to work pretty fine.
But I'm not convinced this is the best as maybe it is stopped and restarted
more than needed (TBC).

My desire was to make sure to do it just once, for example hooking on an
"atexit" but that seemed to be called a bit randomly and not always (which
is a bit puzzling for me, but maybe clear for the experts, as I saw atexit
is also used in a couple of other places as cleanup).

So in short:
1) Do you think we should implement a clean-up of the gpg-agent or should
we just live with it?
2) If yes should we do it always or just under some conditions? (ie.
GPG_PATH is passed, not if using the user's default one?)
3) What would be the best way to get some cleanup code reliably called and
just once? (if not the PoC above)

Many thanks in advance,
Federico

--0000000000000e905105e292d227
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail-adM"><br></div><div><br><div>Hi all,</=
div><div>I&#39;ve
 been working with signing packages via gpg (specificall RPM, but that=20
shouldn&#39;t really matter) lately and things mostly work fine (modulo tha=
t
 small patch from some 2 weeks ago now in master).</div><div><br></div><div=
><div>I have just one more possibly minor issue I wanted to get possibly an=
 opinion from the expert folk if possible!<br></div><div><br></div><div><br=
></div></div><div>Little
 background: to keep things isolated and not system dependant the GPG=20
related files are kept in a separate directory. This is then specified=20
via GPG_PATH (which then de facto is passed to various gpg tools as=20
--homedir). The keys are then kept there and just as a detail that is=20
then an encrypted FS which is just mounted/umounted when needed.<br></div><=
div><br></div><div>When
 gpg is run it will spawn a gpg-agent to deal with keys and this is=20
fine. The problem I have is that after bitbake finished the gpg-agent=20
will still be left running there and in my specific case this means that
 the directory (pointed by GPG_PATH) will figure as in use and therefore
 cannot be umounted. Of course if I kill by hand the gpg-agent then I=20
can just proceed and so on.</div><div><br></div><div>So the first=20
question is: is it &#39;nice&#39; that after the bitbake execution we possi=
bly=20
leave as a matter of fact running stuff from Yocto around the system?=C2=A0=
</div><div><br></div><div><br></div><div>As
 I wanted to come to pose a question also having done a bit of homework I
 tried to understand how I could fix this and right now I arrived at=20
something like:</div><div><br></div><div>-------------</div><div><br></div>=
<div>diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py<br>inde=
x aa9bb49f2c..d6d1fd9e6c 100644<br>--- a/meta/lib/oe/gpg_sign.py<br>+++ b/m=
eta/lib/oe/gpg_sign.py<br>@@ -58,6 +58,12 @@ class LocalSigner(object):<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in range(0, len(files), sign_chunk)=
:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_outpu=
t(shlex.split(cmd + &#39; &#39;.join(files[i:i+sign_chunk])), stderr=3Dsubp=
rocess.STDOUT)<br>=C2=A0<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0gpg_conf_bin =3D b=
b.utils.which(os.getenv(&#39;PATH&#39;), &quot;gpgconf&quot;)<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if gpg_conf_bin and self.gpg_path:<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D [ gpg_conf_bin ] + [&quot;--homedir&quot=
;, self.gpg_path, &quot;--kill&quot;, &quot;gpg-agent&quot;]<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_output(cmd, stderr=3Dsub=
process.STDOUT)<br>+<br>+<br>=C2=A0
 =C2=A0 =C2=A0def detach_sign(self, input_file, keyid, passphrase_file,=20
passphrase=3DNone, armor=3DTrue, output_suffix=3DNone, use_sha256=3DFalse):=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Create a detached s=
ignature of a file&quot;&quot;&quot;<br>=C2=A0</div><div>-------------<br><=
/div><div><br></div><div>(note: I kill only if the homedir is defined, this=
 is TBD, it&#39;s just a PoC)</div><div>So
 basically after the loop that does all the chunk-wise signing I ask=20
gpgconf to stop the gpgagent and this actually seem to work pretty fine.
 But I&#39;m not convinced this is the best as maybe it is stopped and=20
restarted more than needed (TBC).<br></div><div><br></div><div>My desire
 was to make sure to do it just once, for example hooking on an &quot;atexi=
t&quot;
 but that seemed to be called a bit randomly and not always (which is a=20
bit puzzling for me, but maybe clear for the experts, as I saw atexit is
 also used in a couple of other places as cleanup).</div><div><br></div><di=
v>So in short:</div><div>1) Do you think we should implement a clean-up of =
the gpg-agent or should we just live with it?</div><div>2) If yes should we=
 do it always or just under some conditions? (ie. GPG_PATH is passed, not i=
f using the user&#39;s default one?)</div><div>3) What would be the best wa=
y to get some cleanup code reliably called and just once? (if not the PoC a=
bove)<br></div><div><br></div><div>Many thanks in advance,</div><div>Federi=
co</div></div><br></div>

--0000000000000e905105e292d227--

