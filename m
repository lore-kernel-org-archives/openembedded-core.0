Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web08.1524.1620079832045131684
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 15:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rf4NVDSf;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: paulo.zaneti@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id b21so1571692vkb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 15:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GaA6mfzzsVErEZOWN5jPZhLGYhQKQm2jgwxFb3jhPCs=;
        b=Rf4NVDSfC9uGHezMweluYHcZrcVrhK5Jcicz2s7Je4rp3geqj9wEiQQM+VOKr4y19Z
         pf6NUixww9/0lkU4cUxHiF77+T1toJpGhItPJkfYhvh0wbV5vD68OALqGmtMDgPBC6+K
         EDoIu+9cG3DVPlXr+71ojqSgpsCpfAaggr9v/o5k9RMG++vBlvXIXHX6Wl8jTT722ozK
         CbcxKIf6WoTWAZBY+ostEBbCLjEWPYni8qK4XvF44qCoOK8aV/oIReawz0qTgdJyVJHc
         g3VozYar3hLX3sfP4EhZWj6FGdHtxai+F/MY+WNjJi+j7jRSWZjaYupHXa9/L0M4fyR6
         zm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GaA6mfzzsVErEZOWN5jPZhLGYhQKQm2jgwxFb3jhPCs=;
        b=Jx5oPpbty69NxeAEX3NKMVpv8rkJatQpAIGIdl53Mvnbd5OI+u7MXwmTiCtvPwk5yF
         piC0YwE0mJ8WzjqkJOZc1AZtSlmpz+qNbRNXfkfwz/jG33CWMc+xWtZWZas7Db0GT0mH
         46EkEyP9RrRu+5aFA0tFxWqUvbaISq6VylGMq6YL0oLUEtoh0LBOjsw4OBqh/Zo6YP3n
         D34GXiqAsDVdKEJ5hd4FIbQE11o7S2XbZZ65VVGK7UZvHnMf2CTyRCDDCetX8KH6xX69
         +Vg+lRX864tI6OrN8EUc+AjiULO4neG+vEtJvG5LhbMw8H5pwpoMFkzwnldeaUeLUW6h
         OtEw==
X-Gm-Message-State: AOAM53017NTABjhwhrQXVIwD5hMBDHTVOE7Vwu3UaFvouGjfFIhTsX+t
	kcSQOIkkKHDISuTyUyMvM6LgGkYiJ9GPSkjoJTk=
X-Google-Smtp-Source: ABdhPJwZGWsFc5mBSRl7UmJAofK6Pk7FUQvZs5dURxodgIbzHEnxduUOBK0J8feP3si4h7xIWjRYYrWfVIem04qOC0E=
X-Received: by 2002:a1f:b2d4:: with SMTP id b203mr10130330vkf.12.1620079831176;
 Mon, 03 May 2021 15:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <4145ce915f734aae9f53ab2575521f2d@intel.com> <25102.1618841602267269069@lists.openembedded.org>
 <28e9a1a4251849bcafde43dc01684bd5@XBOX03.axis.com>
In-Reply-To: <28e9a1a4251849bcafde43dc01684bd5@XBOX03.axis.com>
From: "Paulo Cesar Zaneti" <paulo.zaneti@gmail.com>
Date: Mon, 3 May 2021 19:10:19 -0300
Message-ID: <CAP77v2q8rerbKzLsz8dbrLgu9T3dMdbaiGmDM+a33BUz0fzQzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perl: fix startperl configuration option for perl-native
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d8599805c1743a65"

--000000000000d8599805c1743a65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

The motivation for the patch is just using a correct value for "startperl"
configuration when build perl-native.
Without the patch, this configuration option is set to a non existent path.

When I fixed "startperl", tools like "pod2man" stopped working as the
"do_install_append_class-native()"  function expected the non existent path
on the shebang string (#! ...).
So I also had to change the "do_install_append_class()".
If you look at function "cpan_do_install()" in meta/classes/cpan.bbclass,
you see that both functions now use same pattern for shebang string
substitution.

I can't understand why the pod2man in your build is still using the non
existent path on the shebang string.

Would you mind to execute the following steps and send me the results? That
may help me understand a bit better.

bitbake perl-native -c compile -f
head -1 $(find */work/*/perl-native/ -name pod2man)
grep "startperl=3D" */work/*/perl-native/*/perl*/lib/Config_heavy.pl
*/work/*/perl-native/*/perl*/config.log

You may partially replace the complete path by some "..." as you did before=
.

I hope we can find a solution to replace the patch with another one that
fixes the "startperl" configuration without breaking your build.

Regards,
Paulo

On Fri, Apr 30, 2021 at 5:42 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> Well, it did break our builds. I now get the following error when buildin=
g
> a native recipe that inherits perlnative and tries to run pod2man:
>
>
>
> | /bin/sh: /home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/pod2man:
> /home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/per: bad interpreter: N=
o such
> file or directory
>
>
>
> This is because the first two lines of the pod2man script now looks like
>
>
>
> #!/home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/perl
>
>     eval 'exec /home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/perl -S =
$0
> ${1+"$@"}'
>
>
>
> instead of the previous:
>
>
>
> #!/usr/bin/env nativeperl
>
>     eval 'exec /usr/bin/env nativeperl -S $0 ${1+"$@"}'
>
>
>
> I.e., the sed command in perl=E2=80=99s do_install_append_class-native() =
does not
> seem to have done anything, which is because there is no
> =E2=80=9Cperl-native.*/perl" in the path to match (as can be seen above),=
 it is
> just =E2=80=9Cperl=E2=80=9D, which is what the old code was looking for.
>
>
>
> [ In the above examples, I have replaced a longish part of the path with =
=E2=80=A6
> to protect the innocent. ]
>
>
>
> //Peter
>
>
>
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> *On Behalf Of *Paulo Cesar
> Zaneti
> *Sent:* den 19 april 2021 16:13
> *To:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [PATCH] perl: fix startperl configuration option
> for perl-native
>
>
>
> I just re-send the patch with additional fix for the build failure.
>
> I think the basic problem was an inconsistency in the way perl recipe and
> cpan.bbclass convert the absolute perl path to env path.
> Version 2 of the patch tries to use same cpan.bbclass approach on the per=
l
> recipe.
>
> Before submitting I just ran "bitbake -k world". I hope it doesn't break
> the build again.
>

--000000000000d8599805c1743a65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter,</div><div><br></div><div>The motivation for=
 the patch is just using a correct value for &quot;startperl&quot; configur=
ation when build perl-native.</div><div>Without the patch, this configurati=
on option is set to a non existent path.</div><div><br></div><div>When I fi=
xed &quot;startperl&quot;, tools like &quot;pod2man&quot; stopped working a=
s the &quot;do_install_append_class-native()&quot;=C2=A0 function expected =
the non existent path on the shebang string (#! ...).</div><div>So I also h=
ad to change the &quot;do_install_append_class()&quot;.</div><div>If you lo=
ok at function &quot;cpan_do_install()&quot; in meta/classes/cpan.bbclass, =
you see that both functions now use same pattern for shebang string substit=
ution.</div><div><br></div><div>I can&#39;t understand why the pod2man in y=
our build is still using the non existent path on the shebang string.</div>=
<div><br></div><div>Would you mind to execute the following steps and send =
me the results? That may help me understand a bit better.</div><div><br></d=
iv><div>bitbake perl-native -c compile -f<br>head -1 $(find */work/*/perl-n=
ative/ -name pod2man)<br>grep &quot;startperl=3D&quot; */work/*/perl-native=
/*/perl*/lib/Config_heavy.pl */work/*/perl-native/*/perl*/config.log</div><=
div><br></div><div>You may partially replace the complete path by some &quo=
t;...&quot; as you did before.</div><div><br></div><div>I hope we can find =
a solution to replace the patch with another one that fixes the &quot;start=
perl&quot; configuration without breaking your build.</div><div><br></div><=
div>Regards,</div><div>Paulo<br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 30, 2021 at 5:42 PM Peter=
 Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjel=
lerstedt@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">





<div style=3D"overflow-wrap: break-word;" lang=3D"SV">
<div class=3D"gmail-m_-3454985988550602063WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
Well, it did break our builds. I now get the following error when building =
a native recipe that inherits perlnative and tries to run pod2man:<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,54=
,52)" lang=3D"EN-US">| /bin/sh: /home/pkj/=E2=80=A6/recipe-sysroot-native/u=
sr/bin/pod2man: /home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/per: bad =
interpreter: No such file or directory<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
This is because the first two lines of the pod2man script now looks like<u>=
</u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,54=
,52)" lang=3D"EN-US">#!/home/pkj/=E2=80=A6/recipe-sysroot-native/usr/bin/pe=
rl<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,54=
,52)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0 eval &#39;exec /home/pkj/=E2=80=A6/=
recipe-sysroot-native/usr/bin/perl -S $0 ${1+&quot;$@&quot;}&#39;<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
instead of the previous:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,54=
,52)" lang=3D"EN-US">#!/usr/bin/env nativeperl<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:rgb(148,54=
,52)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0 eval &#39;exec /usr/bin/env nativep=
erl -S $0 ${1+&quot;$@&quot;}&#39;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
I.e., the sed command in perl=E2=80=99s do_install_append_class-native() do=
es not seem to have done anything, which is because there is no =E2=80=9Cpe=
rl-native.*/perl&quot; in the path to match
 (as can be seen above), it is just =E2=80=9Cperl=E2=80=9D, which is what t=
he old code was looking for.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
[ In the above examples, I have replaced a longish part of the path with =
=E2=80=A6 to protect the innocent. ]<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
//Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(148,54,52)" lang=3D"EN-US">=
<u></u>=C2=A0<u></u></span></p>
<div style=3D"border-color:currentcolor currentcolor currentcolor blue;bord=
er-style:none none none solid;border-width:medium medium medium 1.5pt;paddi=
ng:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;borde=
r-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm"=
>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> <a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"=
mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembe=
dded-core@lists.openembedded.org</a>&gt;
<b>On Behalf Of </b>Paulo Cesar Zaneti<br>
<b>Sent:</b> den 19 april 2021 16:13<br>
<b>To:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH] perl: fix startperl configuration opt=
ion for perl-native<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I just re-send the patch with additional fix for the=
 build failure.<br>
<br>
I think the basic problem was an inconsistency in the way perl recipe and c=
pan.bbclass convert the absolute perl path to env path.<br>
Version 2 of the patch tries to use same cpan.bbclass approach on the perl =
recipe.<br>
<br>
Before submitting I just ran &quot;bitbake -k world&quot;. I hope it doesn&=
#39;t break the build again.
<u></u><u></u></p>
</div>
</div>
</div>

</blockquote></div>

--000000000000d8599805c1743a65--
