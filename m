Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22114CD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 12:23:20 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10566.1778156596721169102
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 05:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i3XYMW0J;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8acae26e564so7337136d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 05:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778156596; cv=none;
        d=google.com; s=arc-20240605;
        b=EMZUwAKg96+qa0Uu1aA8m6ww/y5EVrCWe6LuJEZ5nkVKKSkzZqjOD2l8YpayiTa7id
         Cq7Uhsmh3Bga7opteOuAkAWygWdFby3o0GBgUFtD35gMigmxhQ9/VrjFuK9QYz/VOb3s
         a/U9G+r1KKr7lyvgF+KbNjlV6sUnaMHrj3xjT/iuU+XPUcgcFBJa/sJ5ExG4pF3GFDo8
         zwSmlUNyUnD0JEhqqE7J7+GqwTZ9J0g06Aat5iRXHdZqx/9M2mVsMkFvHrpC4rd7Med+
         mkDdEi6f5QH1eK46NmiR5A7PPfRpmlYRpm4U0qo38cT4omegRNOYYZ0JvvSjgBWu4rzM
         6stg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8P2orb4/3dU2WE9NObLiqZ4el9sK1SG5hNxPzB7fjWY=;
        fh=zdhS9xAMShZIJNMFEMslq0erILI0xUYbJoGj7s3aYD4=;
        b=NLqLs6P8sG183pc1F/vmjpCPyajFIDZr7dJlQCjhsIJaCAhMIolldAjLyNwcUL8jPl
         kNxZv4l0I1d2UzSzBnS4Uo317N9pfdaGPivnpDFvcH/yEzH9mfZiGwXWeMOwYg9N5u4S
         lriOF8gxYkZ3MCcFdjmwvn945IEvhmq2K6SHhlDZEjsHQM4Uup9w7RVf2o5CDnCrICsp
         k+QJSddP8FMCbjgAZh5WdXNA2svc99ff9bRxB49jP80kaf6UzmRLKCMsbNOX+dq3TXI+
         4E6w+Lz6e0ArrvWNe0kMFPHG7FvTVLfXWCwx+uuOy3Zvjc07OwJ7D+JFRKj1rL+Wf4Rs
         ihCA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778156596; x=1778761396; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8P2orb4/3dU2WE9NObLiqZ4el9sK1SG5hNxPzB7fjWY=;
        b=i3XYMW0JN0x152iItJjqCsQyRMWVhEVczcfHiBIfjxbttm9C0lApDXpP9YqA+dNo6Z
         vLGsBV88L2RPQ/K5ppr4gomgFh2unt2ebjySmDtq+Cym0U1oZ0aIJzsgEGuUA+xU55Rh
         oTZos906u7kUH8BJcNHKGAIQgcNMM8MsGEfX+qITFsPwNmtKKOSX3+3GKbD1LCncopZ4
         sbwa8Cy6oFpGjehwgzs1UoEJGcnoKykfavmkpeNr7eyhs4cOBZSJcJVN0HRjbD8RLSqN
         RNeLNE+IaS4SwoUoq0CJMe+RFqc35IgBdLQVJJfKm05+xAWDjDuHy8fFjc4QEeKs+W7c
         +pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778156596; x=1778761396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8P2orb4/3dU2WE9NObLiqZ4el9sK1SG5hNxPzB7fjWY=;
        b=BB6as4a2wK4tchRtWLicNDiJF+GdWkhTr0ymolVgbRkmD2SONP2hXPMAMACoao3MwK
         yqzRUOjvjpAM2Kl67iodBTG/ODnCzcqGulR1zVD+FRtISgHkcLMB+CxRUVY1jUO9mxOE
         W91uwatLQnLGShRxODdGR5YRr6bWqWoqi4GWhx3M5fGHE0OYl5d0N0UAKx0HuqUhNv6Y
         tjWg93oquLZ5vfMHbuW4ZN/Gh1xzjyngbAmpFKfAg3kFHZ0gFf9ZL74AnHlTsj4r4G/u
         Je3Vs/zDbc9p0iSVYfQ9MKHncFh9jx62m2esU9CkGnF1JDHlLp+aB1u979E1FX7yB1YI
         t16w==
X-Forwarded-Encrypted: i=1; AFNElJ9mjgREE2J3yp24OzV97cKr4S2AC6BY3KGQbDsJ27gSPB27H+c7nAtRtt/iCT7T5QAzPRhcSWZvlbeg30NxEYmw0g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyD2zpdNTVzN+WDSEnKS+aIs0HLk0f4C5gXsymCCd5K4v52NC0S
	ocsl266d/gELbBA975m8aHhb6kC2zgFGWJ1Oi/jAslLIQ5XCSq5tRf1utqZt3IFnNjr7/r5l3jA
	C6ra6svLQ8+9FEu/h8NfGv7+iZObey5Q=
X-Gm-Gg: AeBDievaPI4YiSAi4MjzBAAMvtTnjbfBtuodo5pzLYGhtV5YF1wTvcaa+wzqPac0pk/
	Zg/fi+8V7l8p9yfw4WzwRqclQQ44T/05w501P3qPvt17byfMli1AprURLjw98Vx8OS4+U5QvBjp
	sz8yvsGRWUjE9Ka/9JuJZxQfIWtmp0c/6G9XUfQJ9QpV1gm/MKDuW9t+HTSEXXqaDFTygPwvRpu
	E51z2rmEeUxGBGX5tSK4rdSZuWh1BvJD0oAYADc5EBFHo4hgzN0P/LaOmJo0+BJkdBgQJ6MyvKb
	dh6OlgOk9oXpDa6O4ch7PYU25HQlomGs5NLxPVQmgzd+WZQHT6SkeGmYEkGqPSk=
X-Received: by 2002:a05:6214:458a:b0:8ae:60c4:857 with SMTP id
 6a1803df08f44-8bc4323f775mr111544626d6.18.1778156595298; Thu, 07 May 2026
 05:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <DM4PR11MB61899D3F758D2B3C7BAA9361C444A@DM4PR11MB6189.namprd11.prod.outlook.com>
 <eb249cdc0bfb57d3e0ef4cb20dafffe7896c408b.camel@linuxfoundation.org>
 <DM4PR11MB6189C2259D0CAC50D124C689C43C2@DM4PR11MB6189.namprd11.prod.outlook.com>
 <CANNYZj9CbmTZ7uEVd3AAT8x2jn1T0SQiO=SjE5fr15F+V_=bxw@mail.gmail.com> <DM4PR11MB6189AEF992ACB07830D1384EC43C2@DM4PR11MB6189.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6189AEF992ACB07830D1384EC43C2@DM4PR11MB6189.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 May 2026 14:23:04 +0200
X-Gm-Features: AVHnY4KsfmBM99tGQFCh7DH04upvLEtmilakIQBVaZd5idsVdaSdDRCzOsP7na4
Message-ID: <CANNYZj8Axq8=T_NdVFnj7CW4uyk4XxZObWM9i88n2Sup=PqVJg@mail.gmail.com>
Subject: Re: [OE-core] Inquiry Regarding Package Upgrade Approach vs. Manual
 CVE Fixes in LTS Releases
To: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"Viral Chavda (vchavda)" <vchavda@cisco.com>, Yoann Congal <yoann.congal@smile.fr>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 12:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236589

On Thu, 7 May 2026 at 14:17, Deepak Rathore -X (deeratho - E INFOCHIPS
PRIVATE LIMITED at Cisco) <deeratho@cisco.com> wrote:

> You mentioned that Wrynose has switched to kirk and no longer uses runltp=
. However, I see that runltp is still present in the Wrynose source, for ex=
ample:
> ltp_20260130.bb =C2=AB ltp =C2=AB recipes-extended =C2=AB meta - openembe=
dded-core - OpenEmbedded Core layer

This is ltp - the complete set of tests. Runltp is a script to run
them that lives inside ltp source tree. It may or may not still be
present in that particular version of ltp, but wrynose is not using
it.

Alex

