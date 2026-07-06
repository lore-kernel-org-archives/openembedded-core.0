Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977C5C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 21:34:44 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.161755.1783373679346867889
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 14:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DqfvoMBm;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47dc6e04367so461985f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 14:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783373677; x=1783978477; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/muyA4xaFbdp4pX6CQxbRG4IrtdtvA130mlKbEFVOSo=;
        b=DqfvoMBmWkzF0dlj9U1NMOm8e/BpiLHcPYaBH9r6VGqUkmvd/KmQqw63xg2AeghCIr
         nBv/c3dTr6s/iRayE8b4+2vdhf1twZK0lL4MyY/viytjxSVhCPlHmZltSnb5AqhDN8wf
         +yFpXWF4eTsnb94H4x1DNpoce52hBY/myWn3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373677; x=1783978477;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/muyA4xaFbdp4pX6CQxbRG4IrtdtvA130mlKbEFVOSo=;
        b=JEaO8YRngPJ3ixvMebNjnZ0Dg36wyji6hW8/NixZDaHZCOMM/4jkq9FjZxuavfZE5+
         rGGx48gevts6bDOBIrcR8tSlNug5XCN9nMG2p6rm+HaCaean8TF3kyrrX4p99Re4PxzD
         4DCgS5ADUn/aHHqALk51vAW2Ln7L+zzs+ItfcMzQPEZ8B77msEjD9NDziUW83vXHrrj4
         pE6FhW95QXMFxkxJEkOpIN7oTbccZZBaqLzozAD8XvsazAkpE2u8opOjrOIiNWrXpvwI
         s2KqtFVgH7vGj2u6fEbOPNA7gT1l9cDjo81Mlq9DCXMUzQNbnw5hCTaFDGm2blRjxGpH
         4JJQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFipVPMGBuy341GfxVzZw4iMQ0tMzeTns/4T90oexkX7V3wGkHEYm1zoq0Z+gacznn7OTHw7CTSnyr5/tXPlSpMg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yydrqi5rjgvVZyAT1tVsTBgkpfCOngZzHJSBnFI2/ZW+Mcu8Ouh
	s0/7kSsl327d9Ke61YlkSP4rivB3bCXmkdz3k9uGIzDkXDOJ6lZviELR+FPRYC8foTY+CA45qVo
	ZmENxRusoEA==
X-Gm-Gg: AfdE7clhRvEJ+v1V8Eveb6ps2ZKtdEb1psTcCQl2wnpXn5G0t4wfe/FRzWKclvUE+Hz
	m3QG2GcxImd9ECgyQVPtuVBtTrxHvt5xI7WAYWoSDisFJqsVDS/PLonZAPt3T41KlP3P9TVtPtQ
	6sqtqcAoCvvQcYO4i31BVyff/kC8DuxbXDwZWZ3B0CMstHoPKJfey1UlWoQQ1lg7k+q4uM9NELD
	57xQs5gdQ6gcNH8RjQUFxF6TpHPpBQBQPK8o/otc6k/fll6vusj9QB1I9VlkoXTrHAEyS+yy9y3
	SbL7JBrTeuHN0ZfJN8hdct5axXCoCU5SnVmZXWb/dLs1Yz6WqAwwPl77WcGRGd58yrUpsReAubg
	eURpljnMLj/ug+qJTT1vXuV8nUkQmAzil+5fsVem7tVcceR15wMeqGloj3GZ5oFEp0hxGMnCsw1
	K4y2+J2LwJ9vgG5DmHEcMRosvMOvla/LkUftFr7EvNDRsb4iDy9g4XWPddFZuhW45BiOfViMq5D
	gJLDvGlZJejcJI=
X-Received: by 2002:a05:600c:4ece:b0:493:cfc8:12e7 with SMTP id 5b1f17b1804b1-493df08ca6dmr25006575e9.25.1783373677465;
        Mon, 06 Jul 2026 14:34:37 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fbb410sm1554485e9.12.2026.07.06.14.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 14:34:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 23:34:36 +0200
Message-Id: <DJRT7GZ90EZQ.1CCLVP0O2PBQZ@smile.fr>
To: <sudumbha@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][Scarthgap][PATCH] openssh: set status for
 CVE-2026-3497
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260629154240.2293009-1-sudumbha@cisco.com>
In-Reply-To: <20260629154240.2293009-1-sudumbha@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 21:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240344

On Mon Jun 29, 2026 at 5:42 PM CEST, Sudhir Dumbhare via lists.openembedded=
.org wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>
>
> Analysis:
>  - CVE-2026-3497 affects downstream OpenSSH GSSAPI Key Exchange patches.
>  - The vulnerable code uses sshpkt_disconnect() in the GSSAPI KEX server =
path.
>  - Upstream OpenSSH/OE-Core does not carry the vulnerable GSSAPI key-exch=
ange delta.
>  - Hence ignoring the CVE for this version.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2026-3497
> https://github.com/advisories/ghsa-wcpp-3x59-h8vp
> https://ubuntu.com/security/CVE-2026-3497
> https://security-tracker.debian.org/tracker/CVE-2026-3497
> https://www.openwall.com/lists/oss-security/2026/03/12/3
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.6p1.bb
> index a1b5d4a553..40c27102d8 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> @@ -49,6 +49,7 @@ Red Hat Enterprise Linux 7 and when running in a Kerber=
os environment"
> =20
>  CVE_STATUS[CVE-2008-3844] =3D "not-applicable-platform: Only applies to =
some distributed RHEL binaries."
>  CVE_STATUS[CVE-2023-51767] =3D "upstream-wontfix: It was demonstrated on=
 modified sshd and does not exist in upstream openssh https://bugzilla.mind=
rot.org/show_bug.cgi?id=3D3656#c1."
> +CVE_STATUS[CVE-2026-3497] =3D "not-applicable-platform: Only affects GSS=
API Key Exchange patches used by some Linux distributions and does not exis=
t in upstream openssh."
> =20
>  PAM_SRC_URI =3D "file://sshd"
> =20

Hello,

That looks like this is needed on wrynose and master as well.

Can you send this to those branches and ping back here?

Thanks!
--=20
Yoann Congal
Smile ECS


