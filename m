Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA67C54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 13:33:14 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.22591.1709645590426772646
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 05:33:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Di7RlLP5;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-299a2456948so4245475a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 05:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709645590; x=1710250390; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WmKeZeRQUfE9lPCaMPwq/4tVYBe9qUw1QLygAjWGlg=;
        b=Di7RlLP51Guo/7FCar5T9gnZGbeuCb6vR6GvlZexbnm50o1s3pimNr1z4MDx5tE6Bo
         QIL6N9dH4/WkogummzdUXg5+CVdFjiYbh+QB+yhDwHna8XUbPFc9K8luln4BdX+fX5w0
         Q3BNTtxkAEA5xLdp4lpvNctdwkwbTeToTIzFfmxWV1ZnTeOxlFwjljAp1waYU1veqoXg
         uFILtP858yiPpGRuxlMX0B+CDTbSs0JimEK8ZjpuzvZwaJhcXg7ZFm4+tysNmaNJQb6n
         0MO2qy7ZnSj7DkOhRkwbx4jvbWpj7DYpRjQygLxIBLEA+eDxj8zz2eHGpxXy49WgWR+t
         jucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709645590; x=1710250390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WmKeZeRQUfE9lPCaMPwq/4tVYBe9qUw1QLygAjWGlg=;
        b=X+/E/jDi4d5JWNCSTqGN4BDsSUUW+ZRc6J8axqvEb0WNOZn//ulstpMwm8HeCboOzZ
         Ghm+ke5ecWEj5mKN+0WLtd9Ed4mTo2ItmzhJFkYTF6WYraceBQ8Z0vWkcZ7PsxsSoJkr
         oSH+UWujcbinVSdaidhXRdJVkiiN8btg79gONHdtty1g6TCTPxDpNNM/fjFYZIiz+6BG
         AzG/OJ7BvMcK6jG1Lbkg7lnc3lOPmh9h0rlO8JLqIjLOLBO1V8wc3BjSkF7MmORUgQl7
         fSyB3r8gzgBUXVQG2T6AVeH+nScBJ7JlwaWN5UPRMLqfqQbWG0PrNSTrnYmxeSDDijmB
         AglA==
X-Forwarded-Encrypted: i=1; AJvYcCXt9e781yU/bsTFPE/wR7r4pPLscWzy58NAfANa7Pd/rylxli8xT4Tk4YPZhf9rCw6ykXJ24YLX/YqtzZKPmbMlMb1BrbEGVsIWLRPzEy77r/xuw3BtGSgG
X-Gm-Message-State: AOJu0Ywi4ICYSZ1l6tW/JqvbhXUvzjwXdUdPbxiILNcFhck150YGOK3/
	/d2AhmJZN4OBE/Z1ujZjjobhwwnJ/FiNMM2gmqTFu1kxwL8hlNCIwqmlvV4c692o73KccELbQZF
	CAgXi+mRFe/iVDpuJOYJAALflppY=
X-Google-Smtp-Source: AGHT+IEH7Vczf/rHpNWyL+npaNegQeUZw/xHrtPXnXN53qy1cD0mm4USlgT9b0QsDC4wK9/zEdCcJamQyz+yOtUlLc4=
X-Received: by 2002:a17:90a:f191:b0:29b:2a8:9a89 with SMTP id
 bv17-20020a17090af19100b0029b02a89a89mr10196817pjb.21.1709645589750; Tue, 05
 Mar 2024 05:33:09 -0800 (PST)
MIME-Version: 1.0
References: <20240303111845.7A4DE106912@builder.sakoman.com>
 <f9e113a874a6c71e73bed3a062da1b06520dcabb.camel@posteo.net>
 <d30f4cd0293437624736e21d82d14081f0c23d48.camel@linuxfoundation.org>
 <AS1PR10MB5697DA05C2BBC97F0BAFF040FD5C2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <68A4B042-3073-40FC-89B8-FD50AD8AE919@arm.com>
In-Reply-To: <68A4B042-3073-40FC-89B8-FD50AD8AE919@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 5 Mar 2024 14:32:57 +0100
Message-ID: <CAApg2=QSNPnhnPz60VNfX-3Q7XRvbjkT=D_ZG-UQL0Js5pNtTQ@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 03 Mar
 2024 01:00:01 AM HST
To: Ross Burton <ross.burton@arm.com>
Cc: "peter.marko@siemens.com" <peter.marko@siemens.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?UTF-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>, 
	Steve Sakoman <steve@sakoman.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"yocto-security@lists.yoctoproject.org" <yocto-security@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 13:33:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196632

On Mon, Mar 4, 2024 at 1:29=E2=80=AFPM Ross Burton <ross.burton@arm.com> wr=
ote:
>
> On 3 Mar 2024, at 13:18, Peter Marko via lists.yoctoproject.org <peter.ma=
rko=3Dsiemens.com@lists.yoctoproject.org> wrote:
> >
> > I already mentioned this last week.
> > https://lists.openembedded.org/g/openembedded-core/message/196199
> >
> > I think that partial NVD DB update is not working properly as things wh=
ich were corrected by NVD are still showing up in patchmetrics but not in e=
mail reports.
>
> I need to file a bug for this issue.  If CPEs are updated then they only =
reach an existing database if the CVE itself is updated, as a CPE change al=
one isn=E2=80=99t enough to appear in the query we use.
>
> I=E2=80=99ve a branch that adds this second query to the fetcher but it i=
s incredibly slow (and you thought the current fetcher was slow?) and still=
 isn=E2=80=99t 100% accurate.  NIST are aware of =E2=80=9Climitations=E2=80=
=9D with the new API=E2=80=A6
>
> For accurate runs I do sadly recommend forcing a full fetch of the CVE da=
ta.
>

I second Ross that we're likely hitting that problem. We have
discussed that with Ross before and there seems to be no workaround
other than to download the whole database.

Solutions I see:
- always fetch the whole database
- go back to the old legacy system with JSON dumps (which is still online)
- have an "official" YP mirror of the database

Probably a subject we could discuss at the today's call.

Kind regards,
Marta

