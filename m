Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F331C61DC6
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 12:50:05 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35294.1787835004229192674
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 05:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Kx+55xxy;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4815bce4652so1357166f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 05:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787835002; x=1788439802; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zxVXsDqQutZLH+EXYIJeS4Lu6irItlDHNs1K/OxG7Rc=;
        b=Kx+55xxyqojCfMuXtDhSx/WGAvB2gp0ZU3VEiYjCAsEzfPSnORnY28NRQajDQimoof
         q391TzlIBorV+Uz7ojUoo7MSVq38kf2UOOVHxOD6kadO4Vj+5REpefSX85MFaa/iPDmu
         CqtLUXp30qgjuj5H9qKrhLWtD7Pm6RqIfgLCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787835002; x=1788439802;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zxVXsDqQutZLH+EXYIJeS4Lu6irItlDHNs1K/OxG7Rc=;
        b=mjG2k2PCgyi1nh6h7kbMQGyMitSWkQ1QuxcCaaA/iDGwktO4ivQU4Qrf5YNWNMXnS2
         LXk2bDT6RS3Mkdo6eHlQfCYEUagPsGoCdY334Ol4ttVl1Uz+BwIXGcTjFiCFI8vCzMVS
         6pz/VDdZZv/p2L3c9+zusGMGNxJz+zBBPrY++l10Z20w87m4qt1kyQ6XnqOUVCuSc9UQ
         pJY5eAGhCdxUFYBvktK3CGELXeLzcM13wXxmR7ZvZx59+1bkKKFuTPQWlNGYQdSxaVA5
         xCBBZeSzcz87TdWaHts4LLB6sSjoNE0H89HT4HvOSnZYIDPqg9Pc9zbZIWM3q6JfBj3O
         Vt3w==
X-Forwarded-Encrypted: i=1; AHgh+RqC861wTX6iE8D64mCTlq+Emee3mdwyDVvLOltsd/k4XF7CEMx4596vMtj1TYmV6cuxBPPqhsK3KsLj25c33sDEMw==@lists.openembedded.org
X-Gm-Message-State: AFuF++kot668gcFp4HqfJSffM2cnoxO21YsaSfC9j87AB5HFlXQ76e9u
	gTGqIjir1Hxh1Gpcd9zqzxiD2Rxvs+3gp8Hbu2mASormKx++zhONm4vpEmF0tBrqEoQ=
X-Gm-Gg: AR+sD13VHZxX0Fc+xn5Xp3O95MjFpLc6Q5rJZ7RP2hPZdWBKO3aBAXlPEpSIqkbOLRW
	Zh3laRI0SIfVPPJYqwrfdz3c4aOuqTOC9y6X898JJ8vZBv7EejWEI1LgGQv1o49rbCZcdq1JD7P
	dFgbpS/Ii1Xzk0ILin1WmSu7yS6Bs5z4Nr6uktk5pGiqtzaqEG77d8ll/AjHk0+l8VF4NtCk0cW
	acqzm2ue9DOjqPhX5hdDVUDTmKhXlnBz0oAa6qFWcNnmYlD/qk1/RO+Gyppn1OTTMBFJvOHgL7Q
	ITQ+pynw53UsmBYM1gD9UzcWa9EH4raxNhiqCbqthucLpumdpGP/CnTOdd5M+9bD2W7qUWeH6Ed
	EWvFE6ESME/jfhOhEf+4Oacw6AK6rYI+t9xg0HcZSRJoJmLzSBU9MLTNr40mUEYVCfxVXQd4eqC
	4N/DQJSWq8SRI6W71yVmdgpWfjPwbzwqNMO5bmLeOon2Gt86aldamnm5ZZ0LBCgLBk1pI4r+3T5
	2+wWFqk/6rb2o3hYM9pXlbkX2wUOo3qN7I8v7V838LewGqhe6SZ
X-Received: by 2002:a05:600c:37c9:b0:49b:2796:be30 with SMTP id 5b1f17b1804b1-49b2796c07cmr91586935e9.11.1787835002445;
        Thu, 27 Aug 2026 05:50:02 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4c3211e1sm51332435e9.9.2026.08.27.05.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 05:50:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 14:50:01 +0200
Message-Id: <DKZQM58DFF46.1QQ8FRST5L5KI@smile.fr>
To: <sudumbha@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] binutils: fix CVE-2026-3441 and
 CVE-2026-3442
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260706174652.4053594-2-sudumbha@cisco.com>
In-Reply-To: <20260706174652.4053594-2-sudumbha@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 12:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244486

On Mon Jul 6, 2026 at 7:46 PM CEST, Sudhir Dumbhare via lists.openembedded.=
org wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>
>
> This patch applies the upstream fix [1], which addresses two out-of-bound=
s
> read issues in bfd/xcofflink.c within xcoff_link_add_symbols(). The chang=
es
> shown in [2] are referenced by [3] and [4].
>
> [1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dc2bf7=
de1eb77a91d7a3c86d56408bf57de540faf
> [2] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3Dbfd=
/xcofflink.c;h=3D1781182fa6a3f92e5e91996f8b0dcf3ab192679b;hp=3Dfde21c9f9583=
baff05e72e390e6bb896d02f9d43;hb=3Dc2bf7de1eb77a91d7a3c86d56408bf57de540faf;=
hpb=3Dd7f532cb3a46527
> [3] https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-3441
> [4] https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-3442
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2026-3441
> https://nvd.nist.gov/vuln/detail/CVE-2026-3442
> https://www.suse.com/security/cve/CVE-2026-3441.html
> https://www.suse.com/security/cve/CVE-2026-3442.html
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> ---
>  .../binutils/binutils-2.46.inc                |  1 +
>  .../CVE-2026-3441_CVE-2026-3442.patch         | 51 +++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-3441=
_CVE-2026-3442.patch

Because binutils was upgraded in master to 2.47 (with this patch in it),
It should be considered fixed. Could you send a modification request to
NVD to help clean the data? Also, please consider sending a CVE_STATUS
patch for this CVE for master.

Thanks!
--=20
Yoann Congal
Smile ECS


