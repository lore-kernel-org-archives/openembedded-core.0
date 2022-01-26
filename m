Return-Path: <tomasz.dziendzielski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D9BC28CF5
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 06:58:47 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web09.9493.1643180325505137948
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 22:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WzSXZe+D;
 spf=pass (domain: gmail.com, ip: 209.85.222.44,
 mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id b16so41720122uaq.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 22:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=GqpeRdSfbPebaklwmXitGiA720MUhLpJFlW7Yka8Wuw=;
        b=WzSXZe+D+p+AsoPD07uuiLq2phGo2dx+lb7p3P1Brsl0qphCaW05k4i7HMjADSYqmV
         14aGtNnneLNJow2SqI9EBKx/K6+tooKbVe+ODP2fz/PUQ4Gt6e7EKF0TpgrMfbj9F224
         kxIiSK95ZyVUqLXwNEJFAJ3INlKOZpIfgZuY9bZFHmNz1X+4gaHOREpDglupelFeBCHh
         Rpp59v/Nz20QOmhprBh16U86GbR3UYWIMmYvuIFDA4MG4UKMDo0eSBfMEWBqeFXk7wHf
         FiVYGek/lsNkD+CA46IKC0pwDFXggR4sE6Le0EmpNhX+hS9JFA6pLZ+c/eE2Xm4b+1gD
         vmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=GqpeRdSfbPebaklwmXitGiA720MUhLpJFlW7Yka8Wuw=;
        b=nQ0XOtvRY15INeqkqYI/ajpeZ1Y7cMdSF1SwQ/L2mbKgChJ1DgdrK5l8TWlxI77cyO
         HFUCcQ0DXM6NKUIaP0IUTh70CWZijNn5IAbok/RfWGk4cqlrFiWq9CaqLGYlXGRFkwVd
         CnF/dIV9JBwmBUDKSDp1tj3GHtPML1XbeTrCwmt8kD+GpIPJVWBEUbTtHDUfv9S6b5GB
         YOUfhqCl7syx2os32yCNjhHzjimptbKuis8+GD72WG4/x/6RBMLtXgCi39hhckZBuuR8
         vpYq54ICfqCLtkmOohbm9AKYGpM39Q2c1SxVa/CRSXOVGU2GgvHDZsA9ixUr5w9om094
         n2tg==
X-Gm-Message-State: AOAM532Fzs/YwzdLWw/+taoZHLuZeDrrjm39W5YizTAqKZNqvOJFdbxP
	QQ3dpYqtcQ47O9/ydoMrK+mfBcVIhND2CrNaRpz+xcwo7zLwHqbp
X-Google-Smtp-Source: 
 ABdhPJz4zsy9UecCEht3q7SqaAcN1pRpNi75zmKuBRIgdzhwBWCQxuLxDwc8DL2aoEnJPwkoHuTdtdUmg+86JVZePxQ=
X-Received: by 2002:a67:d197:: with SMTP id w23mr9256979vsi.39.1643180324537;
 Tue, 25 Jan 2022 22:58:44 -0800 (PST)
MIME-Version: 1.0
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Date: Wed, 26 Jan 2022 08:01:41 +0100
Message-ID: 
 <CAJkqNs0Zjsof0C0Q5Ga7Tk6EAouFs9vis0DnK+649V0PxRhKog@mail.gmail.com>
Subject: git fetcher hangs with File name too long
To: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008bc8d005d676bb07"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 06:58:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160960

--0000000000008bc8d005d676bb07
Content-Type: text/plain; charset="UTF-8"

Hi,
we're having issues with git fetcher. If we have long workspace path (long
jenkins job name in our case) it can happen that git fetcher will hang when
trying to create lockfile in downloads/git2/<workspace_path>.lock due to
"File name too long" because it might exceed the limit of 255 characters.
The part that is causing this is in bitbake/lib/bb/fetch2/git.py:
        gitsrcname = '%s%s' % (ud.host.replace(':', '.'),
ud.path.replace('/', '.').replace('*', '.').replace(' ','_'))
and this ud.path along with downloads directory can exceed the limit. How
can we change that? Do we really need the whole path there? Should we cut
somehow the directory name or maybe change it to a less human readable
hash? Some advice would be helpful.

Best regards,
Tomasz Dziendzielski

--0000000000008bc8d005d676bb07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br>we&#39;re having issues with git fetcher. If w=
e have long workspace path (long jenkins job name in our case) it can happe=
n that git fetcher will hang when trying to create lockfile in downloads/gi=
t2/&lt;workspace_path&gt;.lock  due to &quot;File name too long&quot; becau=
se it might exceed the limit of 255 characters.</div>The part that is causi=
ng this is in bitbake/lib/bb/fetch2/git.py:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
gitsrcname =3D &#39;%s%s&#39; % (ud.host.replace(&#39;:&#39;, &#39;.&#39;),=
 ud.path.replace(&#39;/&#39;, &#39;.&#39;).replace(&#39;*&#39;, &#39;.&#39;=
).replace(&#39; &#39;,&#39;_&#39;))<br><div>and this ud.path along with dow=
nloads directory can exceed the limit. How can we change that? Do we really=
 need the whole path there? Should we cut somehow the directory name  or ma=
ybe change it to a less human readable hash? Some advice would be helpful.<=
/div><div><br></div><div>Best regards,</div><div>Tomasz Dziendzielski<br></=
div></div>

--0000000000008bc8d005d676bb07--

