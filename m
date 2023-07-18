Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A73EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 22:18:32 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.1055.1689718711134326524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 15:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=R8CxQaQV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3141fa31c2bso5601572f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 15:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689718709; x=1692310709;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G+bVp2UvYf/Ypy7TVBjara3nq4pH/QMSfO6O96vxOwY=;
        b=R8CxQaQVjDB1x9k/yQEm5Uo/iTAu+qoE+qH+Ie1WszLzm/+u/zdTb2C2OKUWG9t/KW
         bAls+zIRRRxI4W0KXzPbxvY4RuW4qQD3b+zqfKdfIYdFMZuVL+rIqYRPm+0a1ZmoHMBr
         Zqby5Pe8dsbjw0JIGBLIVPrA3vIFr7Q8S5T6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689718709; x=1692310709;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+bVp2UvYf/Ypy7TVBjara3nq4pH/QMSfO6O96vxOwY=;
        b=eQPtU8/PSv+FhYT+ndWg+ZuQxXwfLMnDEkzgftaQUYNaqb4LBiYZxAuaml38n8jxe8
         zsmPDiW85dM0XFVSBgduTAR4AaBPRlKEOCV4up/SnS4VcKRbkOcfsMPj/KMHCB0pLlLB
         TyfX1Ko3lBEhYhoe6CWsGt+02t6zY45uLkRxLOxwLPpsr6YFsRv1TDXjXyht1ZL62Kqa
         IawV8DFVR/H+syhy8xp2M+HygN9sgxfZew37D9OykJ/QM2RmTtnhGsGm/7xBCDbNVAz1
         rL+2FD4J6xkOPD2WaHI7JKD3HDkfgTyJiRe7s9cY1N5UhcMewpcyBNnq1BnKfOhkoRm/
         bqgw==
X-Gm-Message-State: ABy/qLYjhfVn7rDvlL+OD3sP/dJhXbVL5eN9N+/fOcSl3mxKgRUPeCy1
	mxUJaCqPkyI2XFIx49vmGYZI9w==
X-Google-Smtp-Source: APBJJlFqllzK/Q89UXELD5b8tiZZw2FZyozqZNvZFrUPjSqitkmHOOeQFPzOqX7dsBf0bYevH5Vz7A==
X-Received: by 2002:a5d:4f11:0:b0:314:3611:3e54 with SMTP id c17-20020a5d4f11000000b0031436113e54mr2923111wru.9.1689718709340;
        Tue, 18 Jul 2023 15:18:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6248:d29c:dec5:5723? ([2001:8b0:aba:5f3c:6248:d29c:dec5:5723])
        by smtp.gmail.com with ESMTPSA id e13-20020a056000120d00b00316eb7770b8sm3525583wrx.5.2023.07.18.15.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 15:18:29 -0700 (PDT)
Message-ID: <fc40ac8b47f12ed9540e7489fe757b81f103eed5.camel@linuxfoundation.org>
Subject: Re: [OE-core][mickledore 02/26] dmidecode: fix CVE-2023-30630
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: randy.macleod@windriver.com, steve@sakoman.com, 
	openembedded-core@lists.openembedded.org, Yogita.Urade@windriver.com
Cc: Kang Kai <kai.kang@windriver.com>
Date: Tue, 18 Jul 2023 23:18:28 +0100
In-Reply-To: <2bccf919-d8fe-6cb6-c913-ccfdad357f7a@windriver.com>
References: <cover.1689373875.git.steve@sakoman.com>
	 <f92e59a0894145a828dc9ac74bf8c7a9355e0587.1689373876.git.steve@sakoman.com>
	 <2bccf919-d8fe-6cb6-c913-ccfdad357f7a@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 22:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184561

On Tue, 2023-07-18 at 17:48 -0400, Randy MacLeod via lists.openembedded.org=
 wrote:
>=20
> Add Kai,
>=20
> On 2023-07-14 18:32, Steve Sakoman via lists.openembedded.org wrote:
> =C2=A0From: Yogita Urade <yogita.urade@windriver.com>
> >=20
> > Dmidecode before 3.5 allows -dump-bin to overwrite a local file.
> > This has security relevance because, for example, execution of
> > Dmidecode via Sudo is plausible.
> >=20
> > References:
> > https://nvd.nist.gov/vuln/detail/CVE-2023-30630
> > https://lists.nongnu.org/archive/html/dmidecode-devel/2023-04/msg00016.=
html
> > https://lists.nongnu.org/archive/html/dmidecode-devel/2023-04/msg00017.=
html
> >=20
> > Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> > =C2=A0.../dmidecode/CVE-2023-30630_1.patch          | 237
> > ++++++++++++++++++
> > =C2=A0.../dmidecode/CVE-2023-30630_2.patch          |  81 ++++++
> > =C2=A0.../dmidecode/CVE-2023-30630_3.patch          |  69 +++++
> > =C2=A0.../dmidecode/CVE-2023-30630_4.patch          | 137 ++++++++++
> > =C2=A0
>=20
> Summary:
> =C2=A0
> =C2=A0 =C2=A0 I think this can merge but we should agree on how to handle
> dmidecode.
> =C2=A0
> Details:
> =C2=A0
> These changes work but it's bringing back 4 patches rather than
> bumping the version to 3.5
> =C2=A0and picking up 2 patches. My conclusion is that it's okay but we
> should probably talk
> =C2=A0about how to maintain dmidecode since it just produces a bunch of
> programs for dumping
> =C2=A0HW DMI/SMBIOS info and doesn't provide a runtime ABI, we can
> probably update to 3.5=20
> =C2=A0( or even 3.6 when that's out).
> =C2=A0
> Do you agree Steve?
> =C2=A0
> =C2=A0
> The patches back-ported are:
> =C2=A0
> =E2=9D=AF rg -i "subject: \[PATCH\]" /tmp/dmidecode-mickledore-cve.eml=
=20
> =C2=A0201:+Subject: [PATCH] dmidecode: Write the whole dump file at once
> =C2=A0444:+Subject: [PATCH] dmidecode: Do not let --dump-bin overwrite an
> existing file
> =C2=A0531:+Subject: [PATCH] Consistently use read_file() when reading fro=
m
> a dump file
> =C2=A0606:+Subject: [PATCH] Don't read beyond sysfs entry point buffer
> =C2=A0=C2=A0=C2=A0
> Two of these patches would be picked up if we update mickledore to
> 3.5 - so let's look at what changed:
> =C2=A0
> =E2=9D=AF git log --oneline dmidecode-3-4..dmidecode-3-5
> =C2=A0
> 484f893 (tag: dmidecode-3-5) Set the version to 3.5
> =C2=A08baf2f5 Fix a build warning when USE_MMAP isn't set
> =C2=A0b9ebecc dmioem: HPE type 242: Fix ID on 32-bit systems
> =C2=A0189ca35 Ensure /dev/mem is a character device file
> =C2=A08427888 dmidecode: Use the right variable for -s bios-
> revision/firmware-revision
> =C2=A06ca381c dmidecode: Do not let --dump-bin overwrite an existing file
> <---------- Added.
> =C2=A0d8cfbc8 dmidecode: Write the whole dump file at
> once=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <----------=
 Added.
> =C2=A039b2dd7 dmidecode: Split table fetching from decoding
> =C2=A011b168f dmioem: Avoid intermediate buffer (HPE type 216)
> =C2=A09d2bbd5 dmioem: Decode HPE OEM Record 216
> =C2=A03d68350 dmidecode: Drop the CPUID exception list
> =C2=A0c1a2520 dmidecode: Add a --no-quirks option
> =C2=A067dc0b2 dmidecode: Fortify entry point length checks
> =C2=A0f801673 dmioem: Typo fix (Virutal -> Virtual)
> =C2=A090d1323 dmioem: Decode HPE OEM Record 242
> =C2=A0f50b925 dmioem: Update HPE OEM Record 238
> =C2=A0ac24b67 dmioem: Decode HPE OEM Record 230
> =C2=A0c3357b5 dmioem: Fix segmentation fault in dmi_hp_240_attr()
> =C2=A0a1a2258 dmioem: Decode HPE OEM Record 224
> =C2=A0fb8766a NEWS: Fix typo
> =C2=A0
> =C2=A0My summary of the changes above:=20
> =C2=A0=C2=A0- support additional HW,
> =C2=A0
> =C2=A0-=C2=A0 fix bugs, typos and build warnings.
> =C2=A0
> =C2=A0- internal program restructuring: 39b2dd7 dmidecode: Split table
> fetching from decoding
> =C2=A0
> I was a bit concerned about:
> =C2=A0
> =C2=A0
> =C2=A0=C2=A0 3d68350 dmidecode: Drop the CPUID exception list
> =C2=A0
> but it's pretty arcane (1) and only affects HW from 2008 or earlier
> =C2=A0
> so we should be okay with that change!

This discussion seems like it is starting to appear on a number of
recipes each time we have to backport CVE fixes.

The policy is very clear for good reasons. We do not take upgrades
where there are mixes of features and fixes. We only take upgrades
where they are part of some kind of stable series that the upstream is
promoting/supporting.

The policy is like this to make things clear cut. Yes, there are fuzzy
cases where you can make the argument but that is not the policy.

You can make this argument for many different pieces of software and I
don't want to see this discussion happening every time. I really don't
want to keep seeing this discussion coming back up either. There is
risk starting to make guesses about what feature changes do and these
are not the risks we've stated the stable series supports.

If someone wants to maintain a branch where they upgrade all the
software to the latest versions they can feel free to do so but it will
look a lot like master.

Cheers,

Richard






