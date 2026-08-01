Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC05C54FCD
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 05:05:57 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24.1785543398125932015
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 17:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mKm8DkmV;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: collin.funk1@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e57a753f9so121776585a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 17:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785543397; x=1786148197; darn=lists.openembedded.org;
        h=content-type:mime-version:user-agent:message-id:date:in-reply-to
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GoEnO26/OBCgG5XdfJkeRmyyMJEEADAv34LrsaFCEW8=;
        b=mKm8DkmVAF6wHWq3u+AZ8QF8MNIEkph+5r8VWa19pF4YxrTkkbx5H2NV31w05LFvlO
         bc63lvhrgiOwssdRhoDmZCgKM30hQgEktykdkuZo+93+Pb6TTP4s79jMM7G683oqFQn2
         FZLTDGk0TaO13u+5vIVx4Pm5J2XwfXlA9XEz+FcW4w+xBXUD3CNapskMXoD79oeBoqPg
         7Jtu7+58DlfSmmHl7GCw3ctU0NpqNlc8WT1VoHjrTm8bcSAPNYj3J1N0kvNzy7z1o3gE
         jDwgrzoiIjfZiwO6YIxtvXVeXyTnWmmQ9/2iIK8QW/X+dofnR5dV8AI/P+1jcy8FDB8w
         g+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785543397; x=1786148197;
        h=content-type:mime-version:user-agent:message-id:date:in-reply-to
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GoEnO26/OBCgG5XdfJkeRmyyMJEEADAv34LrsaFCEW8=;
        b=n5fHo8qddqiaFK+941EB4VZnv6EmEPGojy56CvvMxGUc/r+8MxwgeRKcqVmCxzDI/S
         kmLuDRHtwsu9BxFDS3xQ0s/kBkmtvneXJpcpxvz3vt6FZpb1kHLvrFhHSWsxX8MIDZNs
         V2ahD/geyqyCxitP9wTqUrKeOs1EUHw6XmUJBVvBd3eDg0Zf4vvE+6611soHG2btuGxm
         eQoMVOV4ZlcZk3k0Mpx4UGtlk6xCY39E60JBZt7o0WX/n6F699YZ7aJCj+bbPG/z9cd0
         Kqz0Jl5Z0lVekykEwLEz4BDuU+VLPuFkpkhnWbG10jadxqJ0buYEPapHv/KiYFlimDn/
         tjqg==
X-Gm-Message-State: AOJu0Yw/bvf7EGvkU/S24FgjF9CR3re2dlMyBWIIC/oHoQHmXsZ6CbiL
	1XMuZ1gOSBIr/C3Esi8FADJPF5btZTN2jsvHEQux9k+LNqsZX3acGrf6mlYWdg==
X-Gm-Gg: AR+sD11+8HGyL780S1PJeChAEIWDbPZhSJ1lzHdMx1wLVUVc1MRQWGTG2hV09H7sO4F
	7Ysu6y1GPhk0FM6Uq0gLGbQhnD0K9yqorKUR3UPbZ6yvMMos7ddOOy1fZaDIkUMmXywnsuegr9w
	K7qBwBxQueoyu8EdtwILvXAnWAal5bY9xU0/a0m5aSXmeXbk/NXGWNa5K4NwQ7Sh2OS2h1a5iq+
	weMwmbzUIO9WgcNCT6aGl9bQUxVZ/3rnZJ/WX2/29D1+mlQhN+phoWyqLHtPqFxctHOrrxms/NN
	mEXitMIJyFkqCRkbOpmLWbnjvcNuSOiUb5ASp2mqrlH2F4hGeRaFtL7/y1dfWz0077AVhx0MXXM
	lfsdc4zjNsjDIS+3rysrtaUman5EQxxzSmFGYKk58HOyHQF5dy2qyGKcB/aFzdsA778qgRtlmrT
	/9k5hQUUJKskrgCqQlP+U8G05LtytP+MLwOZ/bwon1aCyT5v/0+M+IaOPGsmHI/1tmCyynfgWer
	u2TTAPsI5OMu2hWeHkWOGqDszFzAQTmGKWcYTQ0AQ==
X-Received: by 2002:a05:6a20:72a6:b0:3c0:9c19:659e with SMTP id adf61e73a8af0-3c92a94ea15mr1551696637.70.1785543084662;
        Fri, 31 Jul 2026 17:11:24 -0700 (PDT)
Received: from XTHCYRY1WD-Collin-Funk ([2601:646:8081:3770:2c07:a238:af16:903d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm18183526eec.28.2026.07.31.17.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 17:11:24 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: openembedded-core@lists.openembedded.org, Leonid Iziumtsev
 <leonid.iziumtsev@est.tech>
Subject: [OE-core][PATCH 0/2] coreutils: fix multiple CVEs
In-reply-to: <20260731115649.1402336-1-leonid.iziumtsev@est.tech> 
Date: Fri, 31 Jul 2026 17:11:23 -0700
Message-ID: <m1o6fm66ok.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 05:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242456

Leonid Iziumtsev said:

> This series backports upstream fixes to coreutils 9.11 to address
> multiple CVEs.
> 
> Leonid Iziumtsev (2):
>   coreutils: fix CVE-2026-56391
>   coreutils: fix CVE-2026-56392
> 
>  .../coreutils/coreutils/CVE-2026-56391.patch  | 66 +++++++++++++++++++
>  .../coreutils/coreutils/CVE-2026-56392.patch  | 65 ++++++++++++++++++
>  meta/recipes-core/coreutils/coreutils_9.11.bb |  2 +
>  3 files changed, 133 insertions(+)
>  create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2026-56391.patch
>  create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2026-56392.patch

Note that CVEs don't really have a security impact. I'm mildly annoyed
there were assigned. It seems that Afine's entire existence as a company
is sending LLM generated essays to maintainers, bogus a large portion of
the time. For the others, which have dubious security implications, they
file CVEs with exaggerations [1].

Theoretically CVE-2026-56392 could allow problematic writes to the heap,
but that would require you to run it with untrusted slop as the input
and as arguments. If someone can do that on your system, they have much
better things to do.

Collin

[1] https://seclists.org/oss-sec/2026/q3/276

