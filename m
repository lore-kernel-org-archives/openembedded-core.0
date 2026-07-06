Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A41C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:19:14 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156378.1783358345676177693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lJEX9g/M;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso22872045e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783358344; x=1783963144; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ya5TI114UA8mSAPYn35oCu7KSXC2JX3W0mF9abjv+s0=;
        b=lJEX9g/MdDeFnOTeCmwNzldWkSktztgMxIFfgIaV0GMpfiDMUp8MMtUZ8FYheZWaYy
         yWoqd/B2jFwxT/UO+QJFKC9tu3G2IFyZwjUvPnZQJYo9gJWX7ErrvNZOYJ71cAyRLVuQ
         5iKgx2XPmKtOX8yR7HCX8a7n/INDaMfVKKQyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358344; x=1783963144;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ya5TI114UA8mSAPYn35oCu7KSXC2JX3W0mF9abjv+s0=;
        b=nw27ubELW4DjVckDAXfeZF+jUHdjGgzwzKiNrbKMR0boD0MJd1vNeK0u1Hu1inuFxw
         rP2RMGikHB4ZX74k54iFLttGJycuwn/95uLc47AsO7J4j2NVb/WDjG18Ekm3t8HzX5wm
         HdhkFopUPphnq3Cmk6EXnaoMNOe1LAMGvmuN100caiQ0mYXQ6cjS8pEMKZ/KbTwtq/PI
         g+K1pr9zH+TaBXK+8BDqvbQRMtbfrbf4qdW1tuHAvykg+Bt4nqo+9cubp2EccRlnwW6L
         LdYH/PxcvoHcAYFXcy0QeR5qOIAzWejALt1J6Fh2fRWAI+QqS1eSsDZKWkRR+QDJV+28
         5+mw==
X-Forwarded-Encrypted: i=1; AHgh+RqJLgspu1SIw8VP403MzYaXBgto2QD7nIEknEd+2hZcYVB0YZ4+bKhDLyD4tFVMjb+yKVoKY9M7qAyK3/gSWzozcw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxN5R4GOk/BS7gzwvTmvGtJ9TMf6X0aX2MrOBkQUxYXqo1jaYzV
	JVKgh4NZnuOme7Iay9AaCQkWKYV/a+gVcOfvzOnwZ+mbG0Qm6Jf4G+tDIwDgqG/hFDWZjevnCn3
	xBY0ay0UhqQ==
X-Gm-Gg: AfdE7cknOWzChLOjJHG7qr2JItMXL/pdLCAgpZy8v7ij1tvqPt89rHVFUAGVT29yzQ8
	J0FwXiMK7EKuzmqONtqqm6RLlKek3GZ8TZ+uHuhTafhYZobuCsj3ntgKevctypPFcOseRGU4pER
	vj5+eSlV2NqLOK4KVCqYH0vqev/DV/bjPohAFBtuI5TTsc7mf+LtaRXUH7j0bc9Oy1enoTVYr3L
	13NE2dQcT6B/O74Xnx3KykyyKs6N18XQJhuD+W7We1/iefphE8y2NRV71pVNGTWAS8sbo22sjQU
	gKo/xhcFJBFEmJlXUhvo1I3/LHQJ6BKcXQXDyQswYvJA3o24IYO/5kC8opWOI/pH6GTtGMQXPD9
	n7NfeQM3G4S4nyL/5uM7UBBTV/K2f0h4cEXyX124d/RTPvEuxPXktxwlo+cWJlilzdk8k0B6V7+
	fKlM7m+kCg1ik=
X-Received: by 2002:a05:600c:1d1a:b0:493:b783:ad59 with SMTP id 5b1f17b1804b1-493df07390amr19579715e9.14.1783358343945;
        Mon, 06 Jul 2026 10:19:03 -0700 (PDT)
Received: from localhost ([212.133.41.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636ea60sm342095195e9.3.2026.07.06.10.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 10:19:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 19:19:02 +0200
Message-Id: <DJRNRSGCJSS1.3IN9OYGAAPQRV@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: "Yoann Congal" <yoann.congal@smile.fr>, <asparmar@cisco.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260612121514.2282121-1-asparmar@cisco.com>
 <DJFJLZY26OV8.76VQNOV5VDTV@smile.fr>
In-Reply-To: <DJFJLZY26OV8.76VQNOV5VDTV@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240332

On Mon Jun 22, 2026 at 1:31 PM CEST, Yoann Congal wrote:
> On Fri Jun 12, 2026 at 2:13 PM CEST, Ashishkumar Parmar X (asparmar - E I=
NFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> From: Ashishkumar Parmar <asparmar@cisco.com>
>>
>> Pick the upstream backport [1] for CVE-2026-29518 as mentioned in [3],
>> where a non-chrooted rsync daemon could be exposed to a parent path
>> TOCTOU race that allowed file access outside the module.
>>
>> Also include the dependent upstream fix that followed the CVE fix:
>> - CVE-2026-29518_p2.patch [2] secures sender read-path opens by
>>   opening files from the module root, closing the same race on the
>>   read side.
>>
>> [1] https://github.com/RsyncProject/rsync/commit/1a5ad81add1004354a3d8ba=
841b94ffe19cd2505
>> [2] https://github.com/RsyncProject/rsync/commit/99b36291d06ca66229942c7=
a525a1f5566f10c85
>> [3] https://www.cve.org/CVERecord?id=3DCVE-2026-29518
>>
>> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
>> ---
>
> Hello,
>
> It looks like this whole series is needed for wrynose (rsync 3.4.1).
> Can you send fixes there first, and, then, ping here?

Hello Ashishkumar,

Gentle ping for this patch series. Do you plan to send the needed
wrynose series?

Regards,

>
> Thanks!
>
>>  .../rsync/files/CVE-2026-29518_p1.patch       | 330 ++++++++++++++++++
>>  .../rsync/files/CVE-2026-29518_p2.patch       |  73 ++++
>>  meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   2 +
>>  3 files changed, 405 insertions(+)
>>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.=
patch
>>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.=
patch

--=20
Yoann Congal
Smile ECS


