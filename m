Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC498CDE00B
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 04:15:46 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10754.1763093745355122783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 20:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IwqdnOP9;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-787f28f89faso16866837b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 20:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763093744; x=1763698544; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H4lnoB6NWFQXExlk23KwyxR0q/XKJYMhDthBpRPAskA=;
        b=IwqdnOP9Ge+QYiBWPhNmhh/Oj24v3mmW8ENKCeUNrSsdWMWxD2EdF9iarC/z0ZUe9p
         eMA/Hq9vpbjkWaXw+KybDpWl1Y8+Chon2ZBaB57PMLdFs39HYHy14qNL1yLF0PWkpzFK
         +DbCHgi1a/oLHYK8nUGyxkP2fwMCIUH+6ybdGkiJeYGniata9wsvDy9Vj4/rsUXPusaJ
         qB5goQurXs0/31OTxM495NaaaVdI55ILlk7h6O0cVi0Tzop6/J8j5WCFr4GTYcprH3zJ
         7+UA1Ll1ZU62oJR1ewlX3hdn7MBA3rjbKZ24cwUqkSUptakKzkmO6ToYGtm3shtrh/Az
         6kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763093744; x=1763698544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4lnoB6NWFQXExlk23KwyxR0q/XKJYMhDthBpRPAskA=;
        b=TMITh5wgIbO22wJSAbpRzXkumRXBn0H0zPbH5+Fk5Yi6crVSAsVBtQSHJdge6fyuay
         8ejL/pjDgUyQSmo60mo9RCI3lVkigx87oh68r11Ci8ZcfG17Snvz2wQ+TZWX/EzsGqfH
         CnQaOl1tNftiO8iq+Z2y4KwiQ8UZnJ8ESGBVCM3Os74a9miUQgS8i6yfDPwNfqrkkZF3
         UPR6Lke/3TLAL2pYM47hzOwSbn4zD+d3AZJ4vAkYoQi0Bu8WDLhcciN9EW+HLYU2wc5g
         1BE5a2m8OR/hO1v0+XATovdz5loOOiMFtHHiyi8L7e3p8f40lmwqIMQ9rSasBghzNE65
         Ktnw==
X-Gm-Message-State: AOJu0YxeNdLcv3YtcNmoBGmu59zGygPVhgHmcq4fF9SI7tJyuS1KAPwa
	fPo/Kl4AeQ9YvysVFYf8xHTsG4krj4Wt0ycF3V6brEhPE2nkM9LH2DuHfPLIn0LJHou3VfPtwP4
	iqewnCX89ORnYImiwacLXkbiKvHx4EVE=
X-Gm-Gg: ASbGncvO3i82DlRHowiuY/tDxAnzQOdB7ViBqGFSK6jBoVlnlvpLT31T1KVcKk0BoKs
	k1fCx2VQNOAwVKc+KvmVyDLDVkptx1+DNc5Q4ccZZy2cqM+hK85E6PqmIHskSLGKgamzbXsApSK
	Rw5wgWdQhTBWSzpv1eOhZPgMQND9FnMxhEQlmRdhk/VSY7zXfwt09BWzYJpvDD61SrgWnHSeQtM
	PhP2OT1GP1oayq1tBl8rXiFJ8IcCMIWmJEj1OboWzNjJKrnWs4QmBAzrqGdIjdOgSLSbVf/hspp
	GX/M2YrzVcd2YwPO714QBQMeIl1m5cyytQH2y7EUEjTSkFYYTroWVqW0u46t3ldcUjCkB20v/U8
	3RO0qOw+KOeTX8YVqciZTL02HSMNo80jnQ0DU8L6MR5RGJNjnT86lJOl7
X-Google-Smtp-Source: AGHT+IEP5dfTSsq7/anPz3ZFvJbmo83ELBBuyyLx4SlNRVBz6j+Fn0eL0ZI/AAv+pjIpjcb5m1yJRX9MvmX/Qqe77Xk=
X-Received: by 2002:a05:690c:a1d4:b0:788:166a:d007 with SMTP id
 00721157ae682-78929e3e69cmr13430567b3.4.1763093744537; Thu, 13 Nov 2025
 20:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20251113074747.6735-1-rmxpzlb@gmail.com> <83C84BC6-EE26-4C26-94B8-AFD9CBA980BC@arm.com>
 <445583.1763090362590399237@lists.openembedded.org>
In-Reply-To: <445583.1763090362590399237@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Nov 2025 20:15:18 -0800
X-Gm-Features: AWmQ_bkW-z76mBp4Ai7NEXauztb9z7A6Rn3RbpKWVTAWKFbE8IFUhWbsdSPpMmY
Message-ID: <CAMKF1sp_hzRmpHiqB4Yk+TBjn9heht+yvtaLgfaBVpf8cJ+oKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] armv8a: Set -mbranch-protection more specifically
To: rmxpzlb@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000059561506438640c3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 04:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226286

--00000000000059561506438640c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 7:19=E2=80=AFPM Frank Zhang via lists.openembedded.=
org
<rmxpzlb=3Dgmail.com@lists.openembedded.org> wrote:

> As I know karchive kfilemetadata and kpipewire will fail. They are in
> meta-kf6 and meta-kde.
>
> Do I need update patch, just set v8 branch-protection to BTI & PAC?
>

Please use the systemd patch-like approach for these recipes.

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226285):
> https://lists.openembedded.org/g/openembedded-core/message/226285
> Mute This Topic: https://lists.openembedded.org/mt/116271008/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000059561506438640c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 13,=
 2025 at 7:19=E2=80=AFPM Frank Zhang via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;rmxpzlb=3D<a href=3D"mailto:gmail.co=
m@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>As I know ka=
rchive kfilemetadata and kpipewire will fail. They are in meta-kf6 and meta=
-kde.</div>
<div>=C2=A0</div>
<div>Do I need update patch, just set v8 branch-protection to BTI &amp; PAC=
?</div></blockquote><div><br></div><div>Please use the systemd patch-like a=
pproach for these recipes.=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226285): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226285" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226285</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116271008/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116271008/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000059561506438640c3--

