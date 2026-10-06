Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2BDCA5FFC
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:27:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4682.1791318423997299757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=W83kkFGh;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49ff680331aso34001745e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791318422; x=1791923222; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgpUyfHAldJyUfK67YORp/hFpxjTFVjSN+43x6/Tnvs=;
        b=W83kkFGhVdYxchBlDAh6iDQ/Jd3Xv3n4aT8t0a86KPAp7HVP7PVwRNUspKNPkgo0Is
         S5hdDaOYfuOGtxr9PxdvnyNjUcoH/r1/cXmWXnEUZJU5/3qfFSxJ9a40a4fnQ97r0iip
         Bk0XrAUq/q/gbvb6n2k1kyO2KC3hOFYCKbIoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318422; x=1791923222;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kgpUyfHAldJyUfK67YORp/hFpxjTFVjSN+43x6/Tnvs=;
        b=IuxchgCe52OakImJYe8iVzcG1SzHD88/g4k8WxT5h9KguNuRA9sThKfj+dmaprsZ/h
         VI7oRe/QM4uFaBjKfmtdGp3IeegHN/H6+/441a1b6mKSaVJX3OaZKcWYCPPtfR66h4wv
         MIQTxsyOWhSf5ms0KUdxjGTqymZZppdS+uVvKEMJ3Z4ZWpeENFhqOgLl4V3M0IBcWpj4
         HSzU8Gx1RTcM43Ag5wQhFsizkkFJzrZ7ZPMOvkZm+e1TocoDIffxJKWRyuWxHJnQCM5U
         oXdDIVNnymyu8W02br/Fvw/3qfWOdN1RJ8Z7CrJpJI+Bvqy0wwmUtDI7dZuncQfVINsX
         QteA==
X-Forwarded-Encrypted: i=1; AKwUvBxb3KbyhodMEjiaqLMYOprEMV6auoXPYBiMxz8/Tn37USfg4+D2ive1JJ6zCVnbc6O5C4rE1HzwCX5LpgTEs2Oj3A==@lists.openembedded.org
X-Gm-Message-State: AFuF++mNIII7XeGqgo1ftpm7Y7Pzy1iD+bmrskURQ+VGTParjxA6ApU8
	b1s+HnrNq29Lb4D6J3SesXMh+NMOtS764QBd/fdCV1V+f4bG2T3NNIWV+FBSt4vTCpU=
X-Gm-Gg: AYBFou0xzsgD50kkxFQc4T+atF5KCwNVJnLEyK33idFwECUQs2nuQP+v2GGA2PVymPw
	CWPdH0UtsPHRNRBlbU/g5oM9Tiz+JSH5PkJGzNwWSzMRapMyyFvSRPJU+qo9SDhGyGWRlom+mKh
	1Fl9CgwY4iUM6mFo5JdRFjQbjs81DuUATiXmZQF3Y1yO3aZs7FPGEicYyZOyrvU3fvrcWlpMkNR
	FC47RP74msBHcWPvZEC1KC/PovCCeDPGchUp3Mn+Uby2KZK1UFupzkC55rPXCRPDyZ+9JyMjN7r
	TAryjOVU3aF9b22vcG2F9y1a9/1/JESrOD0P9/JvYOCv0r2hZq+ncRbZ2i2+cRmHecTdHXxWF34
	TtAA2GXMcM0td1xz2X/pZ6ymSFYbIR25VLVaqWos16ARMXqgQ4UOpyuQIeFmP1HnCRhdZwOM23M
	BCKgDgXBqXhBznzKT7Jedou9yXSXlPv8zt0mZkFKDXBhO+9mctZiVRd3Z5F/hAeTE+YzGtMlyAe
	Yrs/fnNLTx32b+n4HWWU7Iyf+UYTjbUeN3FJcm8QeQHVSuUv6atPD9rqbOzeA==
X-Received: by 2002:a05:600c:548e:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a168106b7bmr173377165e9.33.1791318422185;
        Tue, 06 Oct 2026 13:27:02 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d10309sm1362576f8f.22.2026.10.06.13.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 13:27:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Oct 2026 22:27:00 +0200
Message-Id: <DLY1DTYR1IMI.1DOHEP6ZAFFQF@smile.fr>
Subject: Re: [OE-core] [PATCH 1/2] perlcross: Upgrade 1.6.4 -> 1.6.5
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260929062603.67218-1-jaipaul.cheernam@est.tech>
 <20260929062603.67218-2-jaipaul.cheernam@est.tech>
 <DLWSV9S5HI2N.1GZN40XKWDUCT@smile.fr>
 <d53cf28c-2688-498e-95c7-41cd9e4788b0@est.tech>
In-Reply-To: <d53cf28c-2688-498e-95c7-41cd9e4788b0@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247334

qn Tue Oct 6, 2026 at 10:03 PM CEST, Jaipaul Cheernam wrote:
>
> On 2026-10-05 11:33, Yoann Congal wrote:
>> Hello Jaipaul,
>>
>> Do you think we should backport this to blacksail?
>> Changelogs mention perl 5.44 compatiblity that we do have on blacksail.
>>
>> Any ideas?
>>
>> Thanks!
>
> Hi Yoann,
>
> Yes, its a good idea .
>
> We can backport this to blacksail, as this upgrade only contains fixes=20
> that are local patches in recipe.
>
> Let me know if I need to send a patch for this.

No need, I cherry-picked the commit from master.

Thanks!

>
> Regards,
>
> Jaipaul
--=20
Yoann Congal
Smile ECS


