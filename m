Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2B4C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 14:10:49 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.21126.1744726244285463684
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 07:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m2NeqZiG;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so5700350a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 07:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744726243; x=1745331043; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rTu9eQcREpREzn32LAsfH+GwSprVt0TZELhJzxEumSM=;
        b=m2NeqZiGa5rlPmpoHD+obzAsZ3ajTvIjx7/OfzCumfBNZiFb1XaTGLKzQLRHcWDHAU
         J+E8Y2dbE3QTe3z2plpE/KkoEcElu2cLqXHpSWbCCc87Izw3NiQYd2WO7YQiCVw1WqkW
         DQUX8Xquf3UyLsHTYgH4ZbLjA7jaLgVxNJDSYQFLIqiCORSNYXWL4X/ClTxhhvAbqm5I
         9R2AXZ1PiWFwJm5I+rs53IcMMpVwfk3IGm2Yhwzp5edXuTECbvNMDPwxM9bvLHPR+4qO
         qtP2hdkAqrHQd5KwqLPa7tZFavcFczZ3VRKtO778sYlSnOfazdw/doHP1IhtWCfyQZrc
         s/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744726243; x=1745331043;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rTu9eQcREpREzn32LAsfH+GwSprVt0TZELhJzxEumSM=;
        b=pKuSgIHR8uda/VxZzLsB0umQYp3F/WtCy5/iCg1Vk9+NHNjd4+HpdPlUx53vbBleAZ
         vWaqgR5DyEVfNNY3E27CuclNFM0IyFlZOo/jLJS70yRfZIpgcJgHLh9NZoIlrbWVDBxb
         HEw84mlmEJU8Gnyo3WOCWPbn23iu8TOr9ufSkmItqgUXoK6cvXZTCiTs7mMLqGXO7JVa
         TMujZSwjBB0G3l+vbqzfem09YuddwUA47sHzjnc1gW6hAHzCgvwDeaG9GWoWgCoShUV3
         M1JrYkVW3KXkyAzBGV/s64GvW3bwPKKsE3bQJBT0do+kUFqmIj8V7fMjFvZfIBvbVyo9
         a9LA==
X-Gm-Message-State: AOJu0Yzh7RX/DAIhvLY5Mi+VbQhgj+Y46XemHcf3b0imphTgDI7xuYxI
	AqacoElcOcHcYjej4n3A92x7R1tCoggwihQmoUnkZEjPhKuh8tUM289XjdDxFGQHctqHTncmKr2
	TKW8HOpSF95rNFm5kHBDfUMYxCYpQ3HBt
X-Gm-Gg: ASbGncskiHAmfrtwZsFo25McOe3tzKeE/5Aw7vi3oPg6IOvNGhsT7YB6POikn9oL+AJ
	aZZ4RrDXYUGGzlBFgAtiinFHUa2u+i9WiAe6Vvd54S0MpEYZjch2wsbinmWYSn5klLWiZ6FMS4P
	OTi8YD8noP2Ad+GtgoPuXPj/Alvqa6E2PV0F0=
X-Google-Smtp-Source: AGHT+IHjHsDEE7+eR1+b9eW6Qi6RetxMXN/meluSXXQNvskls4u1ffM3lYebar0aEKboB8/riFfA2aWofMzJBQZ0mDY=
X-Received: by 2002:a17:90b:5643:b0:2ef:31a9:95c6 with SMTP id
 98e67ed59e1d1-3082363461amr27082596a91.14.1744726243140; Tue, 15 Apr 2025
 07:10:43 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 15 Apr 2025 16:10:31 +0200
X-Gm-Features: ATxdqUGCke6h8GPCP0o7ehiz0uVdsQ9sZsX7sb7XtsizWvbxYWxdMlIl3E-0Tnw
Message-ID: <CAApg2=RvZuMZHpGyrCz05C6CLhyt22GPSqvMuWVNLokN8PgveA@mail.gmail.com>
Subject: VulnCon take-aways: NVD et al
To: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f3ec9b0632d1bb72"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 14:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214946

--000000000000f3ec9b0632d1bb72
Content-Type: text/plain; charset="UTF-8"

Hello,
VulnCon is a conference on vulnerability management and related subjects
and was held last week.

My take-aways:
- NVD situation is unlikely to change short-term
- CVE programme is adding new features to the specification, but they are
unlikely to make machine-readable identification mandatory (in general:
anything that puts more work on CNAs)
- there were discussion on standardizing end-of-life descriptions
- discussed purl identification and confirmed (in a panel question) that it
currently doesn't work for patched software or software with no package
manager. Some options are possible like the github schema, but not in all
cases.
- next time it would be better to have more important representation from
vulnerability data users, and present more real-world problems, especially
in the embedded space.

Videos from most talks will be available in around one month,

Cheers
Marta

PS My blog post https://ygreky.com/2025/04/vulncon-2025-impressions/

--000000000000f3ec9b0632d1bb72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>VulnCon is a conference on vulnerabi=
lity management and related subjects and was held last week.</div><div><br>=
</div><div>My take-aways:</div><div>- NVD situation is unlikely to change s=
hort-term<br></div><div>- CVE programme is adding new features to the speci=
fication, but they are unlikely to make machine-readable identification man=
datory (in general: anything that puts more work on CNAs)</div><div>- there=
 were discussion on standardizing end-of-life descriptions</div><div>- disc=
ussed purl identification and confirmed (in a panel question) that it curre=
ntly doesn&#39;t work for patched software or software with no package mana=
ger. Some options are possible like the github schema, but not in all cases=
.<br></div><div>- next time it would be better to have more important repre=
sentation from vulnerability data users, and present more real-world proble=
ms, especially in the embedded space.</div><div><br></div><div>Videos from =
most talks will be available in around one month,<br></div><div><br></div><=
div>Cheers</div><div>Marta</div><div><br></div><div>PS My blog post <a href=
=3D"https://ygreky.com/2025/04/vulncon-2025-impressions/">https://ygreky.co=
m/2025/04/vulncon-2025-impressions/</a></div></div>

--000000000000f3ec9b0632d1bb72--

