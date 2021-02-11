Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web09.6839.1613039316604570539
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 02:28:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z6eNsam3;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id q7so5139540iob.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 02:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gPueD+jDtN0Qvx5vvFsgo2msvRyNAJds7lzcUiixAAU=;
        b=Z6eNsam35fs+/M5Dl0zfwLlR74tWjvtd6Vhn2UqrQQFW5NCl12y+2JQJMFA/FjuhWY
         v4tuReCxAftGbnT/1rjbDIm4HXm6qx1Exuult1XIzx9oimrQbat8xiA7gzpXmE1hbaJW
         /WMbpVSIPwsOkiIq9F5+1VSghcWuwyBneEQg8dcQYKMSnOO5XhkVktKv3A4L1UB9fKkf
         Z4xN9i4mNLZaG/fIpx4UGl81/FlPHzUQaYRetUjv/LQRXbQu0HX9bux9p61/1fv4xhDI
         d+SVCHUxyqvBL82O2nbF9Db8dGPyzxfDvPPbVLyYYgQ/mALZegIkBaAwKt2ayBJ+9GRt
         v5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gPueD+jDtN0Qvx5vvFsgo2msvRyNAJds7lzcUiixAAU=;
        b=bQGwRa/tJKSOeHpgIJq50o4664zSFne6pgt3o7xvDT4b2hw6tLZJHbBv1x6+yMfqtJ
         bBudtHZv1pOvxUvAW12/at4pN2wb9dCKIB1Cb7yXFjE7WcSEznZxaXlIsZ/WhF1LbuE2
         bwp+gipbjdwtDrrrql/8zDWNu8rki1O+CtFoWYBknUzmLxUpmOQONiyt87aOG+8hGWyC
         WXzbBYFr7UeG55O7Q8R3TxGD1rDAetioNyfOoNx2jVLnZdh15UCpatmEfhee4Rvf/Zlq
         6XaySvfUGXf0mbzVUj784Dwyc8ShewGIbVYJUDu7FllSp3jV8ZPisjgRrkVLBrMSuA0T
         h6Gg==
X-Gm-Message-State: AOAM531O5cMmDwjPOb5e91Bm1BFcj/PNjtz+EFP8Y/TQJjSkNm9dWMq5
	FedeGhD1T49HbVyxSOebiNRDS87ToDHR3zrbGlg=
X-Google-Smtp-Source: ABdhPJwE9d3Sf0UvOzcShQ4rSr1MObQglO6T2XGBEDojDSXcTm5KiuX8s4jpfHZUAXoMx+++KqIa3h4xt9W7Whsf29E=
X-Received: by 2002:a05:6638:34a1:: with SMTP id t33mr4794646jal.23.1613039315849;
 Thu, 11 Feb 2021 02:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com> <AM9PR09MB46421810B3B2B59AAB545357A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB46421810B3B2B59AAB545357A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Thu, 11 Feb 2021 11:30:02 +0100
Message-ID: <CAJkqNs21=9-B-oWU4AqLSLKZ9286N5UgoXNr7Smxr3+PqgZdVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] insane: Add test for native/nativesdk inherit order
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006e154e05bb0cfbff"

--0000000000006e154e05bb0cfbff
Content-Type: text/plain; charset="UTF-8"

>After this patch got merged I notice some "noise" in my builds.
>
>For bbappends which inherit unrelated classes I get a lot of warning like
>
>Issue: nativesdk-openssh: native/nativesdk class is not inherited last,
>this can result in unexpected behaviour. Classes inherited after
>native/nativesdk: my-custom-class.bbclass [native-last]
>
>First it doesn't give any hint that this is caused by the bbappend and
>secondly I have no idea how to fix that (if that is even possible).
>
>So I would like to have at least an option to ignore these warnings for
>classes I'm sure don't cause any conflict - something more granular then
>just to deactivate this pretty useful check.
>
>Thoughts?

I think it's a good idea to just ignore specific classes. The diff below
should be enough, with some additional note in the warning message. I'll
check if it works correctly later today.

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 53230fc667..2f53a9be09 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1381,6 +1381,10 @@ python () {
                     # native also inherits nopackages and relocatable
bbclasses
                     skip_classes.extend(['nopackages', 'relocatable'])

+                extra_skip_classes =
(d.getVar('NATIVE_LAST_IGNORE_CLASSES') or '').split()
+                if extra_skip_classes:
+                    skip_classes.extend(extra_skip_classes)
+
                 broken_order = []
                 for class_item in reversed(inherited_classes):
                     if needle not in class_item:

Best regards,
Tomasz Dziendzielski

--0000000000006e154e05bb0cfbff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;After this patch got merged I notice some &quot;noise&=
quot; in my builds.<br>
&gt;<br>
&gt;For bbappends which inherit unrelated classes I get a lot of warning li=
ke<br>
&gt;<br>
&gt;Issue: nativesdk-openssh: native/nativesdk class is not inherited last,=
 <br>
&gt;this can result in unexpected behaviour. Classes inherited after <br>
&gt;native/nativesdk: my-custom-class.bbclass [native-last]<br>
&gt;<br>
&gt;First it doesn&#39;t give any hint that this is caused by the bbappend =
and<br>
&gt;secondly I have no idea how to fix that (if that is even possible).<br>
&gt;<br>&gt;So I would like to have at least an option to ignore these warn=
ings for <br>
&gt;classes I&#39;m sure don&#39;t cause any conflict - something more gran=
ular then <br>
&gt;just to deactivate this pretty useful check.<br>
&gt;<br><div>
&gt;Thoughts?</div><div><br></div><div>I think it&#39;s a good idea to just=
 ignore specific classes. The diff below should be enough, with some additi=
onal note in the warning message. I&#39;ll check if it works correctly late=
r today.<br></div><div><br></div><div>diff --git a/meta/classes/insane.bbcl=
ass b/meta/classes/insane.bbclass<br>index 53230fc667..2f53a9be09 100644<br=
>--- a/meta/classes/insane.bbclass<br>+++ b/meta/classes/insane.bbclass<br>=
@@ -1381,6 +1381,10 @@ python () {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# native also inherits nopackages =
and relocatable bbclasses<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skip_classes.extend([&#39;nopackages&#39;, &=
#39;relocatable&#39;])<br>=C2=A0<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0extra_skip_classes =3D (d.getVar(&#39;NATIVE_LAST_IGNOR=
E_CLASSES&#39;) or &#39;&#39;).split()<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if extra_skip_classes:<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skip_classes.extend(extra_s=
kip_classes)<br>+<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0broken_order =3D []<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0for class_item in reversed(inherited_classes):<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 needle not in class_item:</div><div><br></div><div>Best regards,</div><div=
>Tomasz Dziendzielski<br></div></div>

--0000000000006e154e05bb0cfbff--
