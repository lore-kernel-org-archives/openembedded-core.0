Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3A4E7DEEE
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 14:04:48 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52848.1770041086108002298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 06:04:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nr7tamup;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: rybczynska@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12336c0a8b6so3270059c88.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 06:04:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770041085; cv=none;
        d=google.com; s=arc-20240605;
        b=fWjT5U38x8xMg9V8pEsXABkJrAG3TCps4UErEtPhYVD2YZguyOEKFZixFYsmugTufE
         Css4LKmM9mY+yxAtAYCBztsWG8GGr0ATyj6Y4zmZhY7gnF1UG0JeIWRTUFeLEYwm9zvY
         gZUdSeIRXgf43Ns7WT8aixDPyvTQearhHBXbJQYyt64j2JqogpMUyttcVSHY694N+2JQ
         yvbc7gRKq4YGneQJIv+OS6bi7b1gb0WTlINzIwGldCt9ysgLzHwvS5233QHORe2AUEub
         JuaS33UM+I6D6kcRfPqEHU4FVQQO+IfZFJcSGJu+LrbeKY3aOj3r6Yrx3Iihz5/NNsK+
         EEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nzcgjwLWHjTtujiAOo3NakEeClfrfihVBssWKywwSF4=;
        fh=wewoptkNe5hTbyEXUNO0YSFjffTnAWbLZUJr0Ckk5Xk=;
        b=LkMfl+58ApGZ3vToD81CwI9HLc1jgk/deKIf4YKrwTHYr99bvWpqh3+wMHmTEYMXns
         053hSmDK3DIvTsrC2C++0Ux/haEJlU/GYvwe6eqx02qGo7yT+dWQY+zp3VJsvhBH1KCF
         edfigOXWZ/7BBxD8aGeaDvhTiJseqNH1gfW5VKFAvFWdz4FawNCxUJMIlZ+jV0z608/v
         VoDk9qmQ2LzKBirxn93OW4EZGRS80/OBLpA0jjIwPQaRnb5IjRI6UXnA4UoK9Tk/b8l0
         J+7AhMfEqaErSYdTGMOrnOoJbc+fwOPT4KLSIqEQNc6dS2Ockmy5IGX7jcC0ISdpq9GA
         vimQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770041085; x=1770645885; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nzcgjwLWHjTtujiAOo3NakEeClfrfihVBssWKywwSF4=;
        b=Nr7tamupbApAGMkAOw5lh7aXX/OlXgyRDMS3X66Snudqo83yntJmQq4Wy+2iz27bG6
         TC4VfqGxyVuKYCApoUB2q5VT4nNLJ3ry2DDQiaMq3EST0VfedyWemDcCcJJt8O/q0GTc
         Qg4NoebDBE95MyfTE3cylfYGjwxV1xuclhSdzQF6TWfqFFapIboKjU9yd7rdRknnth1S
         fasIcFvXxiJKMzcgYsH5ukUYKvC/e950Uy6cjxADaRn6Km8b+4gzKAOUc5xPHB71t7Zq
         RmNS1x1hQQpIBD1zQoVA3OYbwk6gZSw4dkoM5KAvconqDUtNANi3f7un0Ql03kfmgxE7
         SfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770041085; x=1770645885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzcgjwLWHjTtujiAOo3NakEeClfrfihVBssWKywwSF4=;
        b=R/MWKxB+yhyg9rWh55HC1CJAcsIR6WzedojmxOV8IWZBRdP6cyGyPInc/VyQuynjy7
         pL14XiD4CK4ckowVa/nv8gv8PbfsUPXcRh1uKisWtI6Ul3pOGABn8bs0Z/4J26mYVnKv
         6mRTdoWJcZjD8A0mrncufRAVmUDOvu5SgZWjI5TS8E4YRcbBJcAuquGtFd+F+Ujn72ap
         9owbLjyXyuwiOgAYNpwsGiYdPyAcUlQ/9+Fp/cs18+Cc6oukDqmkiywQN4BJXUFbPdwM
         PzYBMuh2ZhC59OEvmLopxkE4+aFfz2Glq7wEpkxR7Al9NlFl8/LOPHrZ8XQZow+pc1WY
         jRMQ==
X-Gm-Message-State: AOJu0YzJx/7q0yN7dVzj3t2o5BZK01qaz8hdY+rsb39GeLWn+N+8DgXQ
	PJVRfuC3J2pIBmtzrEdnD8ALWFb3X6P7thM0pNpdvpy03913w0p0Spixm6ZaFbjVXAgHmMdTpRm
	DHuj/ACa40AZWs+mvo/AR/6QfBXDftSM=
X-Gm-Gg: AZuq6aLTH0oTyzu+QOXyqXghBoKNuR2lA5rh1dLn9C1dNXyIEZaw/hHIY3MOGVTJJ13
	WTG/cptXieQ6yLn2SulzUsYUAzymPPOohPyfpguN13sHrPXN8ZZwCRhnYzlfgQOPeDKnJ7LaWDY
	vI+D2+bUypi7glJss/WA5KzXfiL/GjLnVFFyS8tHaf9uHg5+CECaUySVS6eLo6RkqGRZcPN79n2
	Za+RcrqGN4RhXyAAnCVfPzFlKp0jNmJOO7qZZj5MNzzCEwlX+TOX5LalB1kpFDGH5tytBAaitHJ
	ajIKusWLtyVBGaQFhak4ZEWqlMvfm+MyOu8IRA==
X-Received: by 2002:a05:7022:e13:b0:11b:c4ee:66b with SMTP id
 a92af1059eb24-125c10092c8mr5552733c88.37.1770041085156; Mon, 02 Feb 2026
 06:04:45 -0800 (PST)
MIME-Version: 1.0
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
 <20260129211012.623827-1-valentin.boudevin@gmail.com> <20260129211012.623827-3-valentin.boudevin@gmail.com>
 <49de779cc2db0ef5c2bade9c8b07e076dedc340f.camel@linuxfoundation.org> <442096.1770040131832557569@lists.openembedded.org>
In-Reply-To: <442096.1770040131832557569@lists.openembedded.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 2 Feb 2026 15:04:30 +0100
X-Gm-Features: AZwV_QgonL4gpgXaX2N1VpQ1C-5PfEzQCPRqfmTUfJ6iZLBA10CXl0FlxxS84t0
Message-ID: <CAApg2=Q10Dbk2kJ1k0ZLp3sw2wsw9pqxBeOcMQPP9tVr6dkoig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6 2/4] cvelistv5: add a new recipe
To: valentin.boudevin@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001e63600649d7ce17"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 14:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230371

--0000000000001e63600649d7ce17
Content-Type: text/plain; charset="UTF-8"

Hello,

Cve-check already has variables disabling the database download. Maybe a
rework of the variable set can be an option ti make sure that either both
download, or both dont.

It requires a bit of design, however.

Kind regards
Marta

On Mon, 2 Feb 2026, 14:48 vboudevin via lists.openembedded.org,
<valentin.boudevin=gmail.com@lists.openembedded.org> wrote:

> I wanted to indicate that the recipe is not meant to be used with a fixed
> commit with a deterministic approach.
>
> Having ${AUTOREV} by default can lead to many offline issues.
>
> I guess the correct implementation would be to specify, in the
> documentation, the need for "SRCREV:pn-cvelistv5-native = "${AUTOREV}"" to
> stay up-to-date with CVE data, and also add this information in a comment
> inside the recipe.
>
> Thank you for your feedback
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230352):
> https://lists.openembedded.org/g/openembedded-core/message/230352
> Mute This Topic: https://lists.openembedded.org/mt/117534181/5827677
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rybczynska@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000001e63600649d7ce17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello,</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Cve-check already has variables disabling the database download. Mayb=
e a rework of the variable set can be an option ti make sure that either bo=
th download, or both dont.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">It requires a bit of design, however.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Kind regards=C2=A0</div><div dir=3D"auto">Marta<br><br><di=
v class=3D"gmail_quote gmail_quote_container" dir=3D"auto"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, 2 Feb 2026, 14:48 vboudevin via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a>, &lt;valentin.boude=
vin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.o=
penembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
>I wanted to indicate that the recipe is not meant to be used with a fixed =
commit with a deterministic approach.=C2=A0<br>=C2=A0<br>Having ${AUTOREV} =
by default can lead to many offline issues.<br>=C2=A0<br>I guess the correc=
t implementation would be to specify, in the documentation, the need for &q=
uot;SRCREV:pn-cvelistv5-native =3D &quot;${AUTOREV}&quot;&quot; to stay up-=
to-date with CVE data, and also add this information in a comment inside th=
e recipe.=C2=A0<br>=C2=A0<br>Thank you for your feedback</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230352): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230352" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/230352</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117534181/582=
7677" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/117534181/5827677</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rybczynska@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">rybczynska@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--0000000000001e63600649d7ce17--

