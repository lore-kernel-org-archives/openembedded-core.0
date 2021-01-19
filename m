Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web08.15968.1611082486596687232
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 10:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L2NWt8v+;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id h11so1892331ioh.11
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 10:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=awajYC8QbTZESG60ObznkU1YvDt2nJAX4kXFRjYgxL0=;
        b=L2NWt8v+OH9ljVW0KxNRLhcfz2EI1LFrEUY2v1L7oFkkeLgdI+6V9QDyRF6dEu86Fn
         7cK78PhiA9Hw6d2pb90jbU/q5BrLAI6lYbXI5JhZDgHy+JeM+jHZCsGM5TsbVnkyXCYs
         XZsgNBA16xYFO+q9uPVcYDam3rITT3EOwAKxCYPgKKVKEs4cicNhAx477vhPLi3PNPqd
         iTlDS51wfOsd0xpo8YR1lH6DCMp+SYt1xDPmpzsAfp150q4a/iA2Q14GRxhyUaJh7HP+
         kOKyg25DzxTaM7cl4tKl72GNL8Swoe//WZ7RTjL7wo+Ua77qarN/7ftbPD/cr3qllH9h
         BGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=awajYC8QbTZESG60ObznkU1YvDt2nJAX4kXFRjYgxL0=;
        b=Tp3uYuQoy8l5FB51+cPZ1PK2qlamaH8i7UcFYM2DL2Efbp1Px2Py336BL3DC/qnrEN
         Lm+uLaLIOtqP1ShqydC8OFQj1uzau+gv0MiW/OTJojn0t7fnPwHc1EqJe19mQ4BxYZTG
         vyjtlpZCRHiR6DmbWhlDHWP/22DbW58xQlJlShj/X9dDM/sFGdZItUJwLismAjugWhK8
         BfbJhXT/TGKSw7jeVzd/gmVXFGueS0CZqlzyS6FRymLyv+niKS5J2Eqpi2Sv4u98Yfse
         uSyN/BCzUdJTBqLNjdIRCplKP7jt/CHa+MiO79YInu9W2QVZyqG9sHKPzZJ8IqxuCnSX
         optw==
X-Gm-Message-State: AOAM5303TzOlVz4bKH1V0zc/cLx+nEc3RYCWua+daUhb/XDQfBhf1pkO
	VMn2Zq6Vfb7sU/1TjxrZ4WYin1RHXQ78lATSUzU=
X-Google-Smtp-Source: ABdhPJzgU4U92YqoiKC5BGaBo9gd4rmpoPsXSBeox1+5CdJniDjdNghW/diXlGh62edq5pKpNneRagiBFi9G8wRKNoc=
X-Received: by 2002:a02:3b4e:: with SMTP id i14mr4738496jaf.36.1611082485813;
 Tue, 19 Jan 2021 10:54:45 -0800 (PST)
MIME-Version: 1.0
References: <20210119155325.351554-1-tomasz.dziendzielski@gmail.com>
 <107314c0428cf791bc195dd27d3cfe11bb9a4c3e.camel@linuxfoundation.org>
 <CAJkqNs2jU7FVs5zdeBto2CysdyDUBgyFsWe2gDQKKxLR9UEgQw@mail.gmail.com> <75dd1f1859c454c2f3ddf14707292f5ab444a834.camel@linuxfoundation.org>
In-Reply-To: <75dd1f1859c454c2f3ddf14707292f5ab444a834.camel@linuxfoundation.org>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Tue, 19 Jan 2021 19:57:15 +0100
Message-ID: <CAJkqNs0uwQBpRa2F9nMV9gioHP8thYWzem42uhXwgOPO7N+PQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: Fix source extraction for gcc shared source
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004555b705b9455f27"

--0000000000004555b705b9455f27
Content-Type: text/plain; charset="UTF-8"

>Try checking if the "task" flag is set for "do_patch"
Good idea, thanks! It's working correctly. I can see both 'noexec' and
'task' flags can be set separately, so to make it more general (and make it
work for similar recipes without sources) I will check both 'noexec' and
'task' flags.
I will submit another patchset with suggested change  (see below) and with
another condition check to not affect kernel build.:

diff --git a/scripts/lib/devtool/standard.py
b/scripts/lib/devtool/standard.py
index 8b80fb8bfa..6f4cbbe219 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py

-                if 'noexec' in (d.getVarFlags(task, False) or []):
+                if 'noexec' in (d.getVarFlags(task, False) or []) or
'task' not in (d.getVarFlags(task, False) or []):
...
-        if 'noexec' in (d.getVarFlags('do_patch', False) or []):
+        if not is_kernel_yocto and ('noexec' in (d.getVarFlags('do_patch',
False) or []) or 'task' not in (d.getVarFlags('do_patch', False) or []):

Best regards,
Tomasz Dziendzielski

--0000000000004555b705b9455f27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt;Try checking if the &quot;task&quot; flag is set =
for &quot;do_patch&quot;</div><div>Good idea, thanks! It&#39;s working corr=
ectly. I can  see both &#39;noexec&#39; and &#39;task&#39; flags can be set=
 separately, so to make it more general (and make it work for similar recip=
es without sources) I will check both &#39;noexec&#39; and &#39;task&#39; f=
lags.<br></div><div>I will submit another patchset with suggested change=C2=
=A0 (see below) and with another condition check to not affect kernel build=
.:<br></div><div dir=3D"ltr"><br>diff --git a/scripts/lib/devtool/standard.=
py b/scripts/lib/devtool/standard.py<br>index 8b80fb8bfa..6f4cbbe219 100644=
<br>--- a/scripts/lib/devtool/standard.py<br>+++ b/scripts/lib/devtool/stan=
dard.py<br>=C2=A0<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if &#39;noexec&#39; in (d.getVarFlags(task, False) or []):</div><div dir=
=3D"ltr">+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;n=
oexec&#39; in (d.getVarFlags(task, False) or []) or &#39;task&#39; not in (=
d.getVarFlags(task, False) or []):<br>...<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f &#39;noexec&#39; in (d.getVarFlags(&#39;do_patch&#39;, False) or []):<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if not is_kernel_yocto and (&#39;noexec&#39; i=
n (d.getVarFlags(&#39;do_patch&#39;, False) or []) or &#39;task&#39; not in=
 (d.getVarFlags(&#39;do_patch&#39;, False) or []):<br><br></div><div>Best r=
egards,</div><div>Tomasz Dziendzielski<br></div></div>

--0000000000004555b705b9455f27--
