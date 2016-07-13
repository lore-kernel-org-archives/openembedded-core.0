Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 256D26067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 10:23:20 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id 38so42011244iol.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 03:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MjKqStkLGBA+BtkBzMrs+Q0fn9s0UqXfGTyid//v09c=;
	b=Y/H4RDR2WFb6S2NWFF7x84zsxGSuOoS6BNCH0WqJIm3UoXhdERUmwj0iiORUqyg8GJ
	2F49JmkH4uxA/Oknm6HJY/kf/RpPoEgSu/R41X8+drQPiHZ7ul1OwxKpclY+lKUh0fFu
	gyNtgzSc22awjp7aplibZKl3BThrSFjzrfl7WsNnWRRsxuH2G7NaWUgN1F11kDKwhxkS
	WIuz/lu96ReoZgP7L9DhmpWG7m+eiDINO+2I7GA14c+IrOAD+hg57wrOnJYPeqNEQjwK
	14fZMfPXYtISdzM28VYQtPPUsvQAy76rLl1q4gILyrsvGXIpPCsDobFpZ3/OPniz9YIS
	Ffsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MjKqStkLGBA+BtkBzMrs+Q0fn9s0UqXfGTyid//v09c=;
	b=DdKUX7pBmEt9J9y+9VyRgeifK8Ve8hVe8gw8+aT6Rd5mpBaAIwJLcrp09vjcauzPoj
	nVc47OFOxZHtzjCK3u4xOqenQaqTF2uP5X+wWmMGL5uXqRJM/H7tcRDz2kNr0tR0aCYN
	bljX91xhDQkipjmKzvYflUOLeQcbgyILm1gxi8dD9mfbcQHeE1uFFZLOhbIPbeYCai8Z
	LIxvZJGv4hi5IjRCPSqyB/Fg+wnD5Au+hlrBGqdh5coFovKyd7DMG11cvhgrgg7VEYAe
	0D5zJ642LGrLoS7D1JcCdG5WalnXJxnRq9ZRnvZDrajnxyoSLvTlIttjGhYDiQKpAxc1
	aSmw==
X-Gm-Message-State: ALyK8tLU0NnJJFXbWbOe6LaZqNutlxoFUzqsEnJS3dAzpx3cVtSfgrGeMQb+3mVfk3jpgsv7cJpSDu0qIJLZaoiD
X-Received: by 10.107.135.142 with SMTP id r14mr8577452ioi.133.1468405401402; 
	Wed, 13 Jul 2016 03:23:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 13 Jul 2016 03:23:02 -0700 (PDT)
In-Reply-To: <1468405152-1725-1-git-send-email-git@andred.net>
References: <1468405152-1725-1-git-send-email-git@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jul 2016 11:23:02 +0100
Message-ID: <CAJTo0LZnQXU+uFXxi6pYX6Q9-Xb9hM=VtG8m6PEeUL6QYT2G-Q@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg: backport patch to fix build when sha256 support is enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2016 10:23:21 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc565dc7053781c669

--001a113eccbc565dc7053781c669
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13 July 2016 at 11:19, Andr=C3=A9 Draszik <git@andred.net> wrote:

> +++
> b/meta/recipes-devtools/opkg/opkg/0001-release-fix-implicit-declaration-o=
f-release_get_sha2.patch
> @@ -0,0 +1,78 @@
> +From 3fe6c043f5d62710f86ca92692b02f4ffd3bb5c9 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <ad@andred.net>
> +Date: Fri, 24 Jun 2016 13:18:52 +0100
> +Subject: [PATCH] release: fix implicit declaration of release_get_sha256=
()
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
>

This patch needs an explanation, signed-off-by, and upstream-status.

Ross

--001a113eccbc565dc7053781c669
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 July 2016 at 11:19, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a href=
=3D"mailto:git@andred.net" target=3D"_blank">git@andred.net</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":4c4" class=3D"a3s aXjC=
H m155e3c50ddad4327">+++ b/meta/recipes-devtools/opkg/opkg/0001-release-fix=
-implicit-declaration-of-release_get_sha2.patch<br>
@@ -0,0 +1,78 @@<br>
+From 3fe6c043f5d62710f86ca92692b02f4ffd3bb5c9 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D &lt;<a href=3D"mailto:ad@=
andred.net">ad@andred.net</a>&gt;<br>
+Date: Fri, 24 Jun 2016 13:18:52 +0100<br>
+Subject: [PATCH] release: fix implicit declaration of release_get_sha256()=
<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit</div></blockquote></div><br>This patch nee=
ds an explanation, signed-off-by, and upstream-status.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113eccbc565dc7053781c669--
