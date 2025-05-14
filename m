Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2294BC3ABCC
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:34:41 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.105021.1747236872317629791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z4OX3haM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ede096d73so48392315e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747236871; x=1747841671; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NSIAj3ETj2b4sVgMhkkc1+uSFsm0sqxFSrCJJQxlZXI=;
        b=Z4OX3haMpyNG8A/6ZW8DZWxYwzdR4/l/TqwNkAmTTxgAudun5dcAqIamRaChSzJg+o
         iyN5TvhyfcSScBJkydV3Y5/FfTb1sibBatSFIgkzTO3uUMUVAwzh5IaPY5dlQUgjatBf
         xmurUjECb35u0e3VgHfHXQWoeocbcWYhPfKXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236871; x=1747841671;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSIAj3ETj2b4sVgMhkkc1+uSFsm0sqxFSrCJJQxlZXI=;
        b=aePnhP7uW6PCTSCGmOPyKXC2eCX6uRDb517Fow7TYKFsFuXB8Or9xEdlXLYHozsdQe
         b/5mr98tILE/5WOYLGLQ5ldBNBFobn/QX+RJCv7PjU0v6di7ddP/ndIf8fNGH+8+Dn6+
         SFR77Oa4DqFHiXJPkhMR5HagMrGZsN60mSYbqRngyAqJLYpCVYs+UaoO3N0HL1YCdx6m
         VG/mKn+H5XBz0e+/7C5/08+2w9lHrVo+daERYlhoi4GqdEvycQY3epmIGYoP6w4yvI5A
         RaBGGvveQ6yvkHRsLHE1HSP5wEVSENZBosP4aEJxtHT59uyP38D7iQwTqdpWn2fB7JUZ
         RoEg==
X-Gm-Message-State: AOJu0YxDvQY5mq+C9ICjtasrgleCI1nH1fKXDUmCe1VJsLkvWRLkYtAS
	Pg+sYBdfi0zP7hTs95f9LQhP15f+PNK3FJmvXRYdj0rLd0tP6Ygjh3pab1OXgas=
X-Gm-Gg: ASbGncskRU9eVEI+9BI7HW53XoU21ohileJQuNBCNozoYIi6Cn8KQnYQJCTl7GtFodE
	jBdS858VkWlSuui6Vl0ksxwGKGnuv9ZrTVy6atqR3/WekwU821e69WMKbmVkcI1dElwPWPmLiQI
	ry79OBeES7G1hTCuf+QcPXTcc0dUrOUT9cz7gNJkG0VWHIjyDEcaALVIMa/Jv9mA2GXar/vcGgO
	EpruwHmTAB0NJDeA26xi4dE7bFu7H939KxhC4F+QIhz8KZ6bYZovyOgtCnIPjwi6RjvFPR3Bvgt
	yNrT0ybqzIvZ1NzKjjNu5/I3/VY+G/Pb0QGJrR5HPDLE+KEmviz62slFL1Fd24VTTwXwnPK9Kas
	RkqjxScq8kGr2dr5H7kx/5r+RKwX7ojBFJf5IvkVh
X-Google-Smtp-Source: AGHT+IG0JXbFEImeoKYMSIjR7QP7SOjZfBIXT7B5YHsPz9cow9eJAay9gT0SydWhTjQfXWDPOA9rfg==
X-Received: by 2002:adf:fa8c:0:b0:3a3:4b8a:9752 with SMTP id ffacd0b85a97d-3a34b8a982fmr2103360f8f.21.1747236870714;
        Wed, 14 May 2025 08:34:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34? ([2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a5a2e0sm19806862f8f.101.2025.05.14.08.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:34:30 -0700 (PDT)
Message-ID: <be86e243e0907f6ea6bc7dc51bb0759ed5fa1fbc.camel@linuxfoundation.org>
Subject: Re: AW: [OE-core] [PATCH] udev-extraconf: Allow optionally skipping
 systemd-fsck
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Jonas Mark (BT-FS/ENG1-Mue)" <mark.jonas@de.bosch.com>, Joshua Watt
	 <jpewhacker@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	 <raj.khem@gmail.com>, "Simoes Ricardo (BT-FS/ENG1.1-2)"
	 <Ricardo.Simoes@pt.bosch.com>
Date: Wed, 14 May 2025 16:34:29 +0100
In-Reply-To: <DU0PR10MB707667F8519C383B05E463FEAD91A@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
References: <20250509094421.20786-1-mark.jonas@de.bosch.com>
		 <CAJdd5GZ-LkBC-8iZXhAYvKsOhxCm2hYL5tCkTS9SOud-d5+ifg@mail.gmail.com>
		 <DU0PR10MB7076F9B59B85FEC850F9A8D9AD97A@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
	 <8bbbcfe81a99f36e90718015150e135a4ef8202b.camel@linuxfoundation.org>
	 <DU0PR10MB707667F8519C383B05E463FEAD91A@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216500

On Wed, 2025-05-14 at 15:20 +0000, Jonas Mark (BT-FS/ENG1-Mue) wrote:
> Hi Richard,
>=20
> > > > > From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> > > > >=20
> > > > > When the fsck backend does not respect the exit codes
> > > > > predefined
> > > > > by fsck, systemd-fsck might not work as expected.
> > > > >=20
> > > > > This is the case for fsck.fat from dosfstools [1]. When a FAT
> > > > > formatted and write protected partition is checked with
> > > > > fsck.fat
> > > > > it will terminate with exit code '6' [2]. What fsck.fat wants
> > > > > to
> > > > > signal is that a write protected device cannot be checked.
> > > > > However, that
> > > > code
> > > > > is interpreted by systemd-fsck as a bit mask:
> > > > >=20
> > > > > - 2: System should be rebooted
> > > > > - 4: Filesystem errors left uncorrected
> > > > >=20
> > > > > As a practical example, a write-protected, FAT formatted SD-
> > > > > card
> > > > will
> > > > > not be mounted in this case.
> > > > >=20
> > > > > This patch introduces the environment variable
> > > > SKIP_SYSTEMD_MOUNT_FSCK.
> > > > > When SKIP_SYSTEMD_MOUNT_FSCK exists systemd-mount will be
> > > > > called
> > > > with
> > > > > the --fsck=3Dno option. Thus, the partition will be mounted
> > without
> > > > > running systemd-fsck.
> > > > >=20
> > > > > In general, this new feature is useful when the filesystem is
> > > > > known
> > > > to
> > > > > be clean and the fsck backend does not respect the exit
> > > > > codes.
> > > > >=20
> > > > > Finally, one way to use this new feature would be to add
> > > > > ENV{SKIP_SYSTEMD_MOUNT_FSCK}=3D"1" to the udev rule calling the
> > > > > mount script.
> > >=20
> > >=20
> > > > This is a pretty generic work around for a very specific
> > > > problem
> > in
> > > > dosfstools. It would probably be better to patch dosfstools to
> > have
> > > > the expected error codes instead.
> > >=20
> > > You are right. We also thought at first that we should fix the
> > problem
> > > in dosfstools. But the project appears to be abandoned. The last
> > > commit in the repository is from October 2023. And the last
> > > closed
> > > issue is from August 2023. Lastly, there is an issue which sounds
> > > as
> > > if the maintainer lost access to the repo
> > >=20
> > (
> > https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi
> > t
> > >=20
> > hub.com%2Fdosfstools%2Fdosfstools%2Fissues%2F210&data=3D05%7C02%7Cmar
> > k.j
> > >=20
> > onas%40de.bosch.com%7C366c7afff6bf4fdb0e9e08dd91fa9948%7C0ae51e1907
> > c84
> > >=20
> > e4bbb6d648ee58410f4%7C0%7C0%7C638827227685038915%7CUnknown%7CTWFpbG
> > Zsb
> > >=20
> > 3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFO
> > Ijo
> > >=20
> > iTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DTjSjj9oZY%2FF6bshgCGRu
> > acv
> > > mS4B6Tatxhs28iLyT%2BWw%3D&reserved=3D0). But the
> > > maintainer(s) did not even reply.
> > >=20
> > > Instead of fixing the problem upstream we could of course also
> > > add a
> > > patch to the meta-layer. But the patch would be rather big
> > > because
> > the
> > > overall exit code generation is spread over the code. There is
> > > more
> > to
> > > fix than only this single situation to make dosfstools adhere to
> > > the
> > > fsck standard return codes.
> > >=20
> > > We would definitely not be able to maintain a fork of dosfstools.
> > >=20
> > > How else could this be handled?
> >=20
> > I think we should probably carry a patch to dosfstools until the
> > upstream situation gets resolved. I don't like doing that but
> > ultimately it will lead to a better end result. It is likely other
> > distros would be interested in such a patch too.
> >=20
> > Attaching that patch to the github dosfstools so there was a patch
> > ready would also increase the chances of it merging too.
>=20
> We looked into dosfstools. For a complete fix of fsck.fat many places
> with direct calls to exit() need changes. On top, some of that code
> is shared between fsck.fat and other tools. And we are under the
> impression it would not desirable to change the exit codes of these
> tools, too. For example, the fixing the very problem which triggered
> us would also change the return code of the fatlabel tool. On top,
> just a simple change of the exit code would be "half wrong" because
> the point where the exit is called does not exactly represent fsck
> "fs left uncorrected" but is even hit when the fs is checked but does
> not need fixing because it is just fine. But on a write-protected fs
> the error occurs before the checking.
>=20
> see src/io.c line 63
> https://github.com/dosfstools/dosfstools/blob/289a48b9cb5b3c589391d28aa25=
15c325c932c7a/src/io.c#L63
>=20
> Taking into account the time we have at hand and the complexity of
> the undertaking we do not see ourselves in the position to supply a
> proper fix for fsck. That is, dosfstools issue #89
> (https://github.com/dosfstools/dosfstools/issues/89) cannot be
> tackled by us.

I would probably suggest just changing fatlabel too, I think the fsck
exit codes are much more important. As long as it is documented in
release notes, I'd hope that would be ok.

A quick count shows 33 exit codes in the dosfsutils sources so there
aren't that many.

The trouble is if I take a workaround, this is never going to get fixed
and the issues will just compound over time. I'm therefore still not
really wanting to work around it, particularly as other systems will be
similarly affected, not just us.

Failing that, could there be a wrapper added around the tool to convert
to the right exit codes?

Cheers,

Richard

