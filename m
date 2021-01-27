Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.17171.1611791097831009829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 15:44:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UFzg9SXO;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id d6so3579547ilo.6
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 15:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0fNlqMPNBgxF+kl7KT3bXnSksuk83fhhcPQwetuZXbw=;
        b=UFzg9SXOWRVTGAR73wDhyMWJy1uNxc82jxwRqJ1TPgp/KWfBHQqGJirWDN0WmxR2Mm
         P0tPoHz2WO0EylMPjLajvskBv/BfK1ov+DpWNETqA0ZL9cM9jTTtiTijSb3OK7fljRS1
         0OJo96mk9dW5+w1uFNj60xgpFFdMqHlN3f8z8ki77erXCsyMBif6l1Bs3EcgL73YPtmO
         8Lk3fc7fXQVk6Nw2AqFgTYdgoG2SXks5y7At6LAd5By7VFCowOeT8jPa+BXBEQZ9ethr
         WOVBEbrXMeghNjLrIxNco2lCMGrs86tOd245lpWTvDEzQxxWge96llrra6J7cFcvtDF8
         l5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0fNlqMPNBgxF+kl7KT3bXnSksuk83fhhcPQwetuZXbw=;
        b=KP8grNrZ8B4iMWY7AsswNQwBVN0jlGIZQLEgVnivLok4AJQVaV268T86/EA882IIEe
         NLbODWPkmFUaPsm2JhYY5zJUTF3NTGO7bDm4qtZWq+M8qODHefuaFlYi8xAmxjOOPK+Y
         UrmAIvvTrRBNU2f5hbMOscFWeqBSNUSRgRy014qGYXFYFF5oJ9Q0W94MgN0KG4xW9NMe
         thXqSb4NepZjfnPK1Y3E+VacT2n2Qg6abqhwQsR0/qrVgKUmuvtS6okfnkzF5xFRRhW5
         /NMccG0YQ/9ul/hERGtaekt3NQsUm3BpHN7h9iatqRRp+PRi+rXLudZ9QoQfMU7Wd7m+
         W0dg==
X-Gm-Message-State: AOAM532WhdmgPSUVSPO80f1E5aXIQhiygyOGAdagAlLb03WEtVzD4mzT
	MSaNnzCI1UsDEiYD83OZRTPwAzadJ+doI7YxOb8=
X-Google-Smtp-Source: ABdhPJyj4k5sk5BDF0q79iwuUQjL2VwcHCvSfJyz+GzsorUuO8MzVoAU2wMsqfabxZJwiY3a/Rho3bEr8FthJKvXjIg=
X-Received: by 2002:a05:6e02:1032:: with SMTP id o18mr10776240ilj.13.1611791097257;
 Wed, 27 Jan 2021 15:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20210127225257.29286-1-dorindabassey@gmail.com>
In-Reply-To: <20210127225257.29286-1-dorindabassey@gmail.com>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Thu, 28 Jan 2021 00:47:29 +0100
Message-ID: <CAJkqNs3ne7aba3jvW8NaeYd7Rn6H9Yn6eXDmN7OseNq=w9G-Og@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: check if PSEUDO_IGNORE_PATHS and ${S} overlap
To: Dorinda <dorindabassey@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cde54d05b9ea5bf7"

--000000000000cde54d05b9ea5bf7
Content-Type: text/plain; charset="UTF-8"

 >+    # Check if PSEUDO_IGNORE_PATHS and ${S} overlap
>+    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS',
expand=True).split(",")
>+    sourcefile = d.getVar('S')
>+    for i in pseudoignorepaths:
>+        if i and sourcefile:
>+            if sourcefile.startswith(i) or i.startswith(sourcefile):
>+                status.addresult("a path included in PSEUDO_IGNORE_PATHS
" + str(i) + " and ${S} (source files) path " + str(sourcefile) + " are
overlapping each other, please set ${S} in your recipe to point to a
different directory. \n")

Isn't ${S} added to PSEUDO_IGNORE_PATHS almost every time in
meta/classes/base.bbclass?
    if os.path.normpath(d.getVar("WORKDIR")) !=
os.path.normpath(d.getVar("S")):
        d.appendVar("PSEUDO_IGNORE_PATHS", ",${S}")

Best regards,
Tomasz Dziendzielski

--000000000000cde54d05b9ea5bf7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr"><div>
&gt;+=C2=A0 =C2=A0 # Check if PSEUDO_IGNORE_PATHS and ${S} overlap<br>
&gt;+=C2=A0 =C2=A0 pseudoignorepaths =3D d.getVar(&#39;PSEUDO_IGNORE_PATHS&=
#39;, expand=3DTrue).split(&quot;,&quot;)<br>
&gt;+=C2=A0 =C2=A0 sourcefile =3D d.getVar(&#39;S&#39;)<br>
&gt;+=C2=A0 =C2=A0 for i in pseudoignorepaths:<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if i and sourcefile:<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if sourcefile.startswith(i) =
or i.startswith(sourcefile):<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status.addresu=
lt(&quot;a path included in=20
PSEUDO_IGNORE_PATHS &quot; + str(i) + &quot; and ${S} (source files) path &=
quot; +=20
str(sourcefile) + &quot; are overlapping each other, please set ${S} in you=
r=20
recipe to point to a different directory. \n&quot;)</div><div><br></div><di=
v>Isn&#39;t ${S} added to PSEUDO_IGNORE_PATHS almost every time  in meta/cl=
asses/base.bbclass?<br></div>=C2=A0 =C2=A0 if os.path.normpath(d.getVar(&qu=
ot;WORKDIR&quot;)) !=3D os.path.normpath(d.getVar(&quot;S&quot;)):<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&quot;PSEUDO_IGNORE_PATHS&quot;, &quot=
;,${S}&quot;)<br></div><br></div><div>Best regards,</div><div>Tomasz Dziend=
zielski<br></div></div>

--000000000000cde54d05b9ea5bf7--
