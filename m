Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web12.7214.1618828898097229806
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 03:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: niels.avonds@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id v123so27482280ioe.10
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 03:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=RsyBbQXBnr7oIxtAqg/h7fvM4Igw1OW1f+MdMaqBgys=;
        b=gODYaPWRmu5cTSl8qpJLHOIky1jaX7/vSwhInrk6Q7CPtp0yS+2PHjcMe5VAD8wDAH
         dqLISmuK2S+3c8rNCfRiefM5vD+74Jj3cfBQRs10y/P2acZdiyA/WeZafY0SXg719+gU
         L+lQOBjoidjCqBw8Qc3vaI0jsVkbeyXMRfUgwuVaU0B1Wv50uodJ3WQ5BKj+1TNbFry0
         WF7PugBfYAA9FqB9PJoXIB5AUZbPUevnQN0OQMNu2JsZuVD92uI87VaYgEGZy7SoBDld
         w/E1fPXdNFuXKAae/WD+zOaAdA+CFp+jbMSF/7jbolSGfHeQ9bcGLWZ3sKo1I9GEMYnd
         rOwg==
X-Gm-Message-State: AOAM5323mOh+MVidIjCyYXl1K41/LaGnmSv9Ve8yNW0zX7qtMbjkrEnv
	1+W4PpFTCYnhEPKD4RPZLWSGbMb2LK9o6g==
X-Google-Smtp-Source: ABdhPJwVUB90R15gN/4nVmnbxiqm/57krlQJa6RggnyT8fQF2rlJyJYuVzUf8/fxWUMJVYDn0t62rg==
X-Received: by 2002:a6b:4e10:: with SMTP id c16mr13960783iob.123.1618828897439;
        Mon, 19 Apr 2021 03:41:37 -0700 (PDT)
Return-Path: <niels.avonds@gmail.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id j1sm7066874ile.75.2021.04.19.03.41.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 03:41:37 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id a11so32243449ioo.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 03:41:37 -0700 (PDT)
X-Received: by 2002:a05:6602:181:: with SMTP id m1mr7843090ioo.153.1618828897173;
 Mon, 19 Apr 2021 03:41:37 -0700 (PDT)
MIME-Version: 1.0
From: niels@codebits.be
Date: Mon, 19 Apr 2021 12:41:26 +0200
X-Gmail-Original-Message-ID: <CAPRgEBwQLfaeP3wgGt8qzSr7HnHXf8mbU_97_uXVR4-u4rTfBw@mail.gmail.com>
Message-ID: <CAPRgEBwQLfaeP3wgGt8qzSr7HnHXf8mbU_97_uXVR4-u4rTfBw@mail.gmail.com>
Subject: [PATCH] bitbake: crash when using git LFS and submodules
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005e467205c050f920"

--0000000000005e467205c050f920
Content-Type: text/plain; charset="UTF-8"

Gitsm fetcher crashes when cloning a repository that contains LFS files.
This happens because the unpack method is called during download, but the
submodules have not been downloaded yet at this point.

This issue was introduced in this
commit: 977b7268bf4fd425cb86d4a57500350c9b829162

Someone else already encountered the same issue as well:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14283

From aa99ad52f9ef11eb2875c5d7930abba52e229f0c Mon Sep 17 00:00:00 2001
From: Niels Avonds <niels@nobi.life>
Date: Thu, 1 Apr 2021 18:48:03 +0200
Subject: [PATCH] NE-630: Temporary fix for gitsm fetcher

Signed-off-by: Niels Avonds <niels@codebits.be>
---
 bitbake/lib/bb/fetch2/git.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 8740e9c05f..112b833f87 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -388,7 +388,7 @@ class Git(FetchMethod):
             tmpdir = tempfile.mkdtemp(dir=d.getVar('DL_DIR'))
             try:
                 # Do the checkout. This implicitly involves a Git LFS
fetch.
-                self.unpack(ud, tmpdir, d)
+                Git.unpack(self, ud, tmpdir, d)

                 # Scoop up a copy of any stuff that Git LFS downloaded.
Merge them into
                 # the bare clonedir.
--
2.25.1

Niels Avonds
Codebits

--0000000000005e467205c050f920
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Gitsm fetcher crashes when cloning a repository that =
contains LFS files. This happens because the unpack method is called during=
 download, but the submodules have not been downloaded yet at this point.</=
div><div><br></div><div>This issue was introduced in this commit:=C2=A0977b=
7268bf4fd425cb86d4a57500350c9b829162</div><div><br></div><div>Someone else =
already encountered the same issue as well:=C2=A0<a href=3D"https://bugzill=
a.yoctoproject.org/show_bug.cgi?id=3D14283" target=3D"_blank">https://bugzi=
lla.yoctoproject.org/show_bug.cgi?id=3D14283</a></div><div><br></div>From a=
a99ad52f9ef11eb2875c5d7930abba52e229f0c Mon Sep 17 00:00:00 2001<br>From: N=
iels Avonds &lt;niels@nobi.life&gt;<br>Date: Thu, 1 Apr 2021 18:48:03 +0200=
<br>Subject: [PATCH] NE-630: Temporary fix for gitsm fetcher<br><br>Signed-=
off-by: Niels Avonds &lt;<a href=3D"mailto:niels@codebits.be" target=3D"_bl=
ank">niels@codebits.be</a>&gt;<br>---<br>=C2=A0bitbake/lib/bb/fetch2/git.py=
 | 2 +-<br>=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br><br>diff =
--git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py<br>inde=
x 8740e9c05f..112b833f87 100644<br>--- a/bitbake/lib/bb/fetch2/git.py<br>++=
+ b/bitbake/lib/bb/fetch2/git.py<br>@@ -388,7 +388,7 @@ class Git(FetchMeth=
od):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpdir =3D tempfile=
.mkdtemp(dir=3Dd.getVar(&#39;DL_DIR&#39;))<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0try:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# Do the checkout. This implicitly involves a Git LFS fetc=
h.<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.unpack(=
ud, tmpdir, d)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
Git.unpack(self, ud, tmpdir, d)<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Scoop up a copy of any stuff that Git L=
FS downloaded. Merge them into<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0# the bare clonedir.<font color=3D"#888888"><br>--<br>=
2.25.1<br></font><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Niels Avon=
ds</div><div>Codebits</div></div></div></div></div>

--0000000000005e467205c050f920--
