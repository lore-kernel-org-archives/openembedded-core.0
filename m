Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web12.15223.1611079394048567729
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 10:03:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KtWo81ea;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id h11so1545352ioh.11
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 10:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Go5KlQsshpx//5zXaJkH6MlalCrbfdHV/EAGYLANAWY=;
        b=KtWo81eae5dr6BS2Lzr8N1sKcfU3rPEQK0/+Ut2TUurR696J0FfoRkfTMqAJiL5991
         hQ7Z5lWC1TL5pwH7cynuXOeKPC2h8anw2/OtbL8tN22StdvRuWsnQT3FR0AYjBJg0/Lk
         OOXMsCaWeC3EqFHp0LM7Voai6OiklSu1y+LuxST4TL5cwNJzrnQXn7Vg3hLKhEKgs8qN
         8z+2oJdR3NFhPhMBor3ctvUcvomxkqAmb5FaUMNTnq3NoVdLNrB3gHXh+LHxJnGALkkv
         icxEcUs+3P0Cn8z4X5PbTHu1vrtUXYRs/8GBdlcYs476Gk6IuupO47gZKJE5qGvb9WpH
         HcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Go5KlQsshpx//5zXaJkH6MlalCrbfdHV/EAGYLANAWY=;
        b=GhPT6Fvoi5SiuwvEVwiZEhdQ3+f8xwcbT5XJX2DcnnjwVXv26B2vetmbE1gkYQT+38
         v9eU7M7wt2NA2YxAkYfl2vfVBbuYTIOtXTxZrYIOTP2NWOD4riYDG4IIucX9LRbUkmMx
         ghh+enR6+RW3f9f0ae/zcbMqhU9QV/I/uBbY4LSZoSEEZVdrQRKbucazvfhnKxOqxAY0
         5dHOy3oCNgZ0GZn08YQvHIC4XpUx56irWvdb7NzbiTrkQ6ry7cEyDzsrNz97Kx3bvbVY
         7g30LSD+0VqRKPXF4TUwp+oaoHw5psMwH3ZV7SrRUSEts++XJvaHMdtBzJTcQ3XKiWFS
         XcDQ==
X-Gm-Message-State: AOAM5307uRyfrUzcwQ6QwVZLzdMlsNiI/KgG4WYpJaSw2JqCjOz/nabB
	yDXBMJQMbgzS5d665ZyIssZtUWOYRV90pXNszeo=
X-Google-Smtp-Source: ABdhPJzMVImnEVsGIEhBmlJc2fGz0ftRIg8E9NzImC3oDZy0wJUi2gJyv8J8w0ZFFY8oMucPr/RxwxWdsM9lN+uQffY=
X-Received: by 2002:a05:6e02:10d1:: with SMTP id s17mr4524186ilj.12.1611079393469;
 Tue, 19 Jan 2021 10:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20210119155325.351554-1-tomasz.dziendzielski@gmail.com> <107314c0428cf791bc195dd27d3cfe11bb9a4c3e.camel@linuxfoundation.org>
In-Reply-To: <107314c0428cf791bc195dd27d3cfe11bb9a4c3e.camel@linuxfoundation.org>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Tue, 19 Jan 2021 19:05:42 +0100
Message-ID: <CAJkqNs2jU7FVs5zdeBto2CysdyDUBgyFsWe2gDQKKxLR9UEgQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: Fix source extraction for gcc shared source
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f3e8f105b944a62e"

--000000000000f3e8f105b944a62e
Content-Type: text/plain; charset="UTF-8"

>> diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc
b/meta/recipes-devtools/gcc/gcc-shared-source.inc
>> index aac4b49313..9ef80f2074 100644
>> --- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
>> @@ -2,6 +2,7 @@ do_fetch() {
>>       :
>>  }
>>  do_fetch[noexec] = "1"
>> +do_patch[noexec] = "1"
>>  deltask do_unpack
>>  deltask do_patch

>This is in itself a little odd. The "deltask do_patch" line deletes the
>task, so there is no task to set as noexec?

This was added because from the devtool script I couldn't find another way
to determine if the task is run or not. If I add "do_patch[noexec]" (which
logically doesn't change anything) even if task is deleted, I can check "if
'noexec' in d.getVarFlags(task, False)" and tell devtool to execute
do_configure task dependencies (to prepare gcc sources).

Best regards,
Tomasz Dziendzielski

--000000000000f3e8f105b944a62e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span class=3D"gmail-im">&gt;&gt; diff --=
git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtoo=
ls/gcc/gcc-shared-source.inc<br>
&gt;&gt; index aac4b49313..9ef80f2074 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/gcc/gcc-shared-source.inc<br>
&gt;&gt; +++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc<br>
&gt;&gt; @@ -2,6 +2,7 @@ do_fetch() {<br>
&gt;&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0:<br>
&gt;&gt; =C2=A0}<br>
&gt;&gt; =C2=A0do_fetch[noexec] =3D &quot;1&quot;<br>
&gt;&gt; +do_patch[noexec] =3D &quot;1&quot;<br>
&gt;&gt; =C2=A0deltask do_unpack<br>
&gt;&gt; =C2=A0deltask do_patch<br>
<br></span>
&gt;This is in itself a little odd. The &quot;deltask do_patch&quot; line d=
eletes the<br>&gt;task, so there is no task to set as noexec?</div><div><br=
></div><div>This was added because  from the devtool script I couldn&#39;t =
find another way to determine  if the task is run or not. If I add &quot;do=
_patch[noexec]&quot; (which  logically doesn&#39;t change anything) even if=
 task is deleted, I can check &quot;if &#39;noexec&#39; in d.getVarFlags(ta=
sk, False)&quot; and tell devtool to execute do_configure task dependencies=
 (to prepare gcc sources).</div><div><br></div><div>Best regards,</div><div=
>Tomasz Dziendzielski<br></div></div>

--000000000000f3e8f105b944a62e--
