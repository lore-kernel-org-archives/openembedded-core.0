Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF41CA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 14:53:46 +0000 (UTC)
Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91.1790693623141071951
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 07:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z1qNz/38;
 spf=pass (domain: gmail.com, ip: 74.125.224.168, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-67567ff2e77so531703d50.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 07:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790693622; cv=none;
        d=google.com; s=arc-20260327;
        b=iuxe1rCGFdsLLjS8ySpbXix9ARttT6d+XwrQLZDf5CMIUQbWezvlDzSt1tuZmPLWVJ
         v10P2mKoV1DKJfu4XZUY74OzCCfi/DVHDWHeggmiJPGEGJx9JJDGZ4ACX3rMzJNEccsv
         xSPkfuZJkZ52hvvtFhRLoMjzofiAmOtXpVSOMz6l7tfFsqCzWkU7Fvz1sXoIkBKxEx/2
         yvdj5ln1wCga02PKs5ush5Z73GkumMrQmVxmPdMDrsikA1Dco+PxrFOXPpbM1W/gErki
         3reAXPlRIKK27QddDhh0kqlljYtUPBBLQRIMvdJpIjdHVnvIoII7uF+HRuZWTXTyL2kh
         6z8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aaNJSJVsQTH7BdYmfD3008Kb3rBEAlkOOVtsZLvL/Jk=;
        fh=NyM4z5gZGtUQWIstickzsTYcMruWzf50y7m8W7zeb2A=;
        b=XFxOWG1/Xtt9vHc2yEep83qb1YJIs//1CW7GN3UJ6HCV5U/sqGE4dKj/DN9mFqlU9F
         glLR9n86fwrpBeq4HCCTKNzhIZqtIgoK4WCsLmVYMxo5FYc5+C6EyVnPvXP1Hti1vjnZ
         VVdbzBMaQlhbwj9GOubR4HCOxgHYh6JdLUt3h4j5EmUlQK5Qz8wJq38LedFrlcCBQkQx
         mL2sPxjxhcpzAilCfgyruHJhDDYka1szjIgjwaU39eOR3FwJsHoLAPBTlxyVRcYHBGB5
         Z3rQTljKkROsGigYpJ5gnZDuvBjmWW01o+/UvvVjw3DuGrDHNjusQxLBh+nhX763aAoP
         dk1A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790693622; x=1791298422; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaNJSJVsQTH7BdYmfD3008Kb3rBEAlkOOVtsZLvL/Jk=;
        b=Z1qNz/38h/oj852U55e+cml4/EuLZE8O4jUXnQWCERtwCXNZI6jDGBdvNDQD1maWp0
         I8vYZBpJ1REGgK7ixkX9nsN2xP0LuUkiUEtYyQExgHqcUxAnNbYHtJp18RbSu60JoUjv
         bXIudaTNxVk+bdSYu+/VL1mykUMUTuqlRw1gUsGdDLkZz5FkIv2SclxYKsyDOlyU58ZD
         NBguZuvs91URlM0xVPdyoVIzHqA+NOpRXO0q0WvDwLQ8ilH3CaVGkQL7zrG7ATCHYRS0
         7mkrpxS3yFZ4aZOEDgSh48jWN2GwyfZaIyCuMpeOAt/ARE5Rvw0uBahIVw8TZ0uVf0Bh
         8DUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790693622; x=1791298422;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aaNJSJVsQTH7BdYmfD3008Kb3rBEAlkOOVtsZLvL/Jk=;
        b=P57dDvjOfHQGLTepD66Ln34qP4TCCDzY8+Ao3w451xbFLG+bwq9SZLsqpnYhCcNe2P
         LSX1lm8VAwwL1HuKA7gRC3JwxRg96NF8p6Sw2FSd3XMNZm2IS9/ORohVc98kfYjpL1yb
         dsaomgEx35G2mwe/QfEEIZbjq2AbNShm0jNHm6fDXt9BonFyfdkm9OBYuLtoqc/jDFRj
         XgG/EfPIER32OL6EBlRptMwky4PYppMh8Z1cnOQ33rS3eoDMIwtoEZxlsz73ZoUHvuqS
         xtuf5PpFx+Xuq12a+XBVj9XjyYNe3HEqpiu54ExLKsSWhIpD29cEuxoHJ4XZRG4VahUX
         w7VQ==
X-Gm-Message-State: AFq9FYLtTTgOr4sBicldrnTMl0U/BKf78Rz/RY+mQYav+nHD7CWI+AM0
	3xXYML0XOpzhECK9aYx+0ExkRCdFl09WrfbkE392ilkGtu1cmmObm3AZ9m+R3v0ke6oNcYDgj87
	ue/6Zzpzw4LPmIUj7OcQeC5pIpKg4gwM=
X-Gm-Gg: AYBFou22hya1rjL1PRPOVW76n+4KNcM8wJA4q4UoUpdrcA5QivFETC+eiAh7Im/iTXg
	Y6KBRySBctHaQk9fvf/1t3eAQjTJ9cBWBtz1tBX33bZeGIdv3Azve6iQ3asx3rPcYznMr82jwYn
	7FUUDvo1Exqa4O4jfHp3iARlDRhHjBDEawQJFAZ1QOYxxFnLV4FadXW4ZkNCV+QPlGN54b2m3ya
	+KDKuYBdUAIFqQob1PtaP8k/r5JZsJ35mO9H5/uqpLV4RRW/6UyDcyF6TrBZ8YoFg/yLh6wAdqv
	NbHOWqeGddNg73vQ6FupvuFHxE7RembZsMIDsUJnCba5X2MpLnXfwOdVD6fHl19sKkfYkQ==
X-Received: by 2002:a05:690e:4851:b0:674:17ca:25dd with SMTP id
 956f58d0204a3-6755f0bfde8mr893466d50.78.1790693622123; Tue, 29 Sep 2026
 07:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260928190400.3908822-1-daniel.turull@ericsson.com> <20260928190400.3908822-2-daniel.turull@ericsson.com>
In-Reply-To: <20260928190400.3908822-2-daniel.turull@ericsson.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 29 Sep 2026 08:53:30 -0600
X-Gm-Features: AclHuK_w9_KxPBIC098-9mFsv0xXeJC78q8md_F5_Z6e-WWJIgStzaV0KCuBkso
Message-ID: <CAJdd5GZ_ExMYCBB6WdovZvhU1BZbJCpoCRU-xNfk9=qL8dtbFg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] classes/base: exclude __CACHED_SOURCE_DATE_EPOCH
 from task hash
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="0000000000003f922f065ca059ee"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 14:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246872

--0000000000003f922f065ca059ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGTM, thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Mon, Sep 28, 2026 at 1:04=E2=80=AFPM <daniel.turull@ericsson.com> wrote:

> From: Daniel Turull <daniel.turull@ericsson.com>
>
> epochfile_read() memoizes its result into __CACHED_SOURCE_DATE_EPOCH
> via d.setVar(), so its runtime value leaks into the basehash of any
> task that calls it, causing a "metadata is not deterministic" error
> once SDE_FILE is populated.
>
> Exclude it, since it is not meaningful build metadata.
>
> AI-Generated: Uses Kiro with Claude Sonnet 5
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
> This should fix the selftest errors reported by Mathieu
> ---
>  meta/classes-global/base.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes-global/base.bbclass
> b/meta/classes-global/base.bbclass
> index 9553f00432..01a030399e 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -249,6 +249,10 @@ do_unpack[postfuncs] +=3D
> "create_source_date_epoch_stamp"
>  def get_source_date_epoch_value(d):
>      return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
>
> +# epochfile_read() memoizes into this variable via d.setVar(), so its
> +# runtime value must not leak into any task's hash.
> +oe.reproducible.epochfile_read[vardepsexclude] =3D
> "__CACHED_SOURCE_DATE_EPOCH"
> +
>  def get_layers_branch_rev(d):
>      revisions =3D oe.buildcfg.get_layer_revisions(d)
>      layers_branch_rev =3D ["%-20s =3D \"%s:%s\"" % (r[1], r[2], r[3]) fo=
r r
> in revisions]
>

--0000000000003f922f065ca059ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>LGTM, thanks</div><div><br></div><div>Reviewed-by: Jo=
shua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com">JPEWhacker@gmail.com<=
/a>&gt;</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Sep 28, 2026 at 1:04=E2=80=AFPM &lt;<=
a href=3D"mailto:daniel.turull@ericsson.com">daniel.turull@ericsson.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From=
: Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.com" target=3D=
"_blank">daniel.turull@ericsson.com</a>&gt;<br>
<br>
epochfile_read() memoizes its result into __CACHED_SOURCE_DATE_EPOCH<br>
via d.setVar(), so its runtime value leaks into the basehash of any<br>
task that calls it, causing a &quot;metadata is not deterministic&quot; err=
or<br>
once SDE_FILE is populated.<br>
<br>
Exclude it, since it is not meaningful build metadata.<br>
<br>
AI-Generated: Uses Kiro with Claude Sonnet 5<br>
Signed-off-by: Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.c=
om" target=3D"_blank">daniel.turull@ericsson.com</a>&gt;<br>
---<br>
This should fix the selftest errors reported by Mathieu<br>
---<br>
=C2=A0meta/classes-global/base.bbclass | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bb=
class<br>
index 9553f00432..01a030399e 100644<br>
--- a/meta/classes-global/base.bbclass<br>
+++ b/meta/classes-global/base.bbclass<br>
@@ -249,6 +249,10 @@ do_unpack[postfuncs] +=3D &quot;create_source_date_epo=
ch_stamp&quot;<br>
=C2=A0def get_source_date_epoch_value(d):<br>
=C2=A0 =C2=A0 =C2=A0return oe.reproducible.epochfile_read(d.getVar(&#39;SDE=
_FILE&#39;), d)<br>
<br>
+# epochfile_read() memoizes into this variable via d.setVar(), so its<br>
+# runtime value must not leak into any task&#39;s hash.<br>
+oe.reproducible.epochfile_read[vardepsexclude] =3D &quot;__CACHED_SOURCE_D=
ATE_EPOCH&quot;<br>
+<br>
=C2=A0def get_layers_branch_rev(d):<br>
=C2=A0 =C2=A0 =C2=A0revisions =3D oe.buildcfg.get_layer_revisions(d)<br>
=C2=A0 =C2=A0 =C2=A0layers_branch_rev =3D [&quot;%-20s =3D \&quot;%s:%s\&qu=
ot;&quot; % (r[1], r[2], r[3]) for r in revisions]<br>
</blockquote></div></div>

--0000000000003f922f065ca059ee--

