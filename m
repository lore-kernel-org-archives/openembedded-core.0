Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CD5C79FA1
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 06:18:00 +0000 (UTC)
Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30991.1789094070111468981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 19:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SwRi6OaT;
 spf=pass (domain: gmail.com, ip: 74.125.231.204, mailfrom: zhanxusheng1024@gmail.com)
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a30eb3bso367385b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 19:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789094069; x=1789698869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kaj8ftZmfmaUvgqOgZ/ngFyr5VY31IWL3RChzr4E+wc=;
        b=SwRi6OaTKotcANXun2rCn1zI0Fx/s//GFuucqKkKPy/Bw02cOD+y47O9vgixC9uoVs
         pbrMbzBqCMevO2l9Scds7gYIkf93lyW96WkkcueAdSL4yG1TVi0R3q446g/DD+g6cX/G
         9VmVMFRtqDx35vGoZf+yAGZcbiXJaJQqXOeoCFi/HbsqZq9kKFFc//toIXflZnMYF+OW
         f1dHNH6y94iwMJ8MnVFr1awvHTEYC7kDQt1ZWlrv0Fs/bUXbymHU2kEUFlz4Gd/qB3Vz
         I0uAUi7bxfum3nH+0rSkkJgObUI5w88RNuigJfVnGXNyR7QRo7EleZ8zKDRHx6IDLYid
         4bsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789094069; x=1789698869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kaj8ftZmfmaUvgqOgZ/ngFyr5VY31IWL3RChzr4E+wc=;
        b=WiutgjcKVsGF1JgLTl3OmnoCWbwnpKSwcrTh5uNBDuLf+jSFciN2ml/A8gjSP8D9xB
         jW6AyaryU9LjbGh7/VN3QxAFAiZG625xMwA8L03mb5z11qjsssttELpRpsT0eQPkVAg4
         uP3NLWMcWqGaN+yrjjGN8F+Gnu/Bce3J5sMcJUTo5vu4u6GrA5YsUpCVUb7LDAJI1+fo
         ZhAu2R3dMASsSR81pBxAelLeN1E2ZBzYAY2HP2lPljAKKJl3OLiKILeg6Z/XVb8vsjD+
         pAfb07I44xWSO4CWnoPCobnuD3rIh8kvC8jnNRVRrsPDzwPTx4QzCFFs1Iks5AkYLaNg
         7sKg==
X-Forwarded-Encrypted: i=1; AKwUvBzL73kMICuWAf7N0b4fJ6LWftyfPvfIWUvP275PQPBOXj+AlkPLyBQDFMrUeFx90SICa8awLqv3h1llAVC34Le9EQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++mD81vopobFOkIw4qYuzEPALdPJTu/taJP+5gD20cNyM55TReOL
	cnSn/ua3Mjq2M1jg3scVXWozttVAwkyx0+1IvFIJuovdNS9CaCel1R2SFu7Rxg==
X-Gm-Gg: AYBFou0TuJ5oaqyGyC8qlzGxDduir3LVFT/7crIwOlLhXFBH0X6gM4/VdQHlw9wZ5Y2
	HFSf2rIW2qU86Ii8ksPLFR72YA7nfPCzCsnbYc8eq2LMy3TDRpupXuuOF5v+upic2N3M8OuJKi+
	WUvzQfy+q5p7EmQ2ZEb0AGaOemaHq7kvCR86YUXKgT5oueoHjK6/ZsrBS5Za9pXpGa20d0WE+J7
	Di3joPKaUdUsiLCil98LcyZPYhWlyqV8bFBFSZaRfnDGm8fRc+dpo7fuoPv5ivz9zedLBsj5Pgp
	PwzCPgRGBRnb5+qnLc0eUSqvRtJvebdZiITLtfPDoBf8D1gUWE5D2m9fNH9yZ/relnbvZfA++VH
	JXqd7QjTZEotzGXk06m7ICKhPcSjsqcHq3hU6tPLyOGvbluxO7vh6NAm5BvBmH3dFGK8qY0Hqis
	8wr71HVvUNl3RixnL7b0pPq1yCg9CQdYQC9yr2VNeCmtjYzojyK/mFmTmvQXbXQKz+TWvL7kwSp
	LiE/yzWtWSErTiiahvndQ==
X-Received: by 2002:a05:6a00:c1c1:10b0:86b:4519:49d8 with SMTP id d2e1a72fcca58-86b45194b40mr1959915b3a.13.1789093743798;
        Thu, 10 Sep 2026 19:29:03 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb760sm357003b3a.46.2026.09.10.19.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:29:03 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Michael Haener <michael.haener@siemens.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	openembedded-core@lists.openembedded.org,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: Re: [PATCH v2] sstate: fix access to a cached object rewriting its modification time
Date: Fri, 11 Sep 2026 10:28:56 +0800
Message-ID: <20260911022857.3138249-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910211821.48424-1-michael.haener@siemens.com>
References: <20260910211821.48424-1-michael.haener@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 06:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245606

On Thu, Sep 10, 2026 at 11:18:21PM +0200, Michael Haener wrote:
> v2:
> - reduced the scope to the timestamp fix

The error handling changed too.  sstate_package(), sstate_checkhashes()
and sstate_eventhandler() reached os.utime() through a filter that let
PermissionError and EROFS pass -- "Handle read-only file systems
gracefully" -- and raised the rest.  sstate_touch_atime() catches OSError
unconditionally, so ENOSPC, EIO and ESTALE are silent at those three now.
Deliberate?

> so its age can no longer be told from the cache itself

scripts/sstate-cache-management.py is the consumer, and the patch helps
it.  remove_duplicated() keeps the entry with the larger st_mtime, and
--remove-duplicated promises "only the newest one will be kept".  Today
use bumps the modification time, so building an older configuration last
keeps its object and deletes the newer one.

st_mtime is a float; writing it back moves the modification time by
-112 ns on ext4 here, once.  os.utime(path, ns=(time.time_ns(),
stat_info.st_mtime_ns)) round trips exactly.

Thanks,
Zhan Xusheng

