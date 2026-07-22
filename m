Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E5FC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 11:33:21 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45637.1784719991932003379
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 04:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QqxCPQAU;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so90663975e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 04:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784719990; x=1785324790; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lJXRlt3+19d5H/aXiv2OKcmDiNNWlqJuHtKglh81pN4=;
        b=QqxCPQAUSisPnKpFuec+SeqBM+e/rJOURa1/M80NplufDk9/phWwINfR2/pjxjZwoP
         oRUffgORTZxTTYdFRA1pfNabTRQKg10B6YuOAKt1PNHE3+m7uIJHuZ2Ghi9EUfTmgeXp
         vDU801N2cpqZUg31ADlWOXVerAb5d7883mAAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719990; x=1785324790;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lJXRlt3+19d5H/aXiv2OKcmDiNNWlqJuHtKglh81pN4=;
        b=EYBv3XNxf8SZX/AWWKHks/dU1NkJ/dTrOQXVm2I7uYL6Pyi9HqcFQ1brv5Si/09EUU
         uSvPcRnmRmn1sAI8Y1PkQvtqQPyyiAnx+tNs6fMKWdKHXjzO5zxLbLw/TrlYc7q30R63
         Wd0Z4DbsmKOr8fAbB0e6ntJZ6Nh1MhOniNMhwms3mdmFXV41mAuZ+4hzGCWwRDDuFuhE
         a+qZWlzHRcd5E5jKr2i/YHopoudsUZvIThlIt7E6wQE9YpupYZas9PgwpPSRx7+RK0Gh
         5rNZ0wexLJsrlF60IPbHNoURpWsmGJ/PuvZitHfM0KYZOVtw44Asdm7NgFUbvyOsWdSP
         woOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+zrU2zoAExQOsypD5mj90261AgsyyoQWBkKk+jvKiyQbWZz66p+qvOJURa0PhdjO0sYg/jaJOyp/VUvub+MxY/A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxJtYqrZ1Qkk3oWyyc5wR+BbPtqKDDQ1B8ZDKPdsTeS1ss7veXv
	vH7fQE/0ECiDZ8smzJo9Ak4Eh0QUiJxj8+EOWIBJXI5hAFLvkM8amxOn24TtQxzWMzA=
X-Gm-Gg: AR+sD13sMTnOMHIdpph8gN0ldLgtUdn2DkLUrBe0wdcsPZ9ZoCCrgv0E0YD8AdMZvcL
	V7sxCmjrJavcgnp7vxPe6mQ4QVNmgyC44y33aiKmAl2rORx7YbTeHs1BhdtiBN2bEthMgQY1nab
	xfJSkItylzPhSWGl69uNEEC0z+lWklHuwGz76uQ535Q4/qdpoRdGxbRk5ynyOvNo/BsftJKioXt
	DTxgKlKPjv3p6YJ2dyBcBtFJ9uo3W9o/YzI59IdF5Y3J+Q0eHYuCnwIeJHGklD43VAKRGEc8Mlj
	gmi20JW2nO3rK3tbMgnSnoaryMYfyKRhHA+1CZLcvNpbRleHSEE8Jf1/HndOD/y7FIfhh6m4apD
	Cc7Y02/mSvy4UyGj5CK/IFXZdvDF7o/oPw+mmRrOVzqragwsNmzAgNWHfjH9S6P1o61sbdI8ISs
	uGUfBBS4k6qX0Ho61UvTAqt9ElM/5j2jmVqA/kqcTLGEQy9GTBHBizGPx4O8DoXnLR+a2ph85N
X-Received: by 2002:a05:600c:524c:b0:495:4e12:6ae5 with SMTP id 5b1f17b1804b1-4954e126afamr256692165e9.26.1784719989979;
        Wed, 22 Jul 2026 04:33:09 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6287csm5758086f8f.25.2026.07.22.04.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 04:33:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 13:33:09 +0200
Message-Id: <DK52FOCV13U0.39JMR5DDF9CVQ@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 3/8] openssh: Fix CVE-2026-59998
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
To: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <devanshp@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260720175518.3546447-1-devanshp@cisco.com>
 <20260720175518.3546447-3-devanshp@cisco.com>
 <DK4BKV6WDHSA.2WEWS3ZC4DO23@smile.fr>
 <PH0PR11MB761612C89B048D93B36C708ED3C12@PH0PR11MB7616.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB761612C89B048D93B36C708ED3C12@PH0PR11MB7616.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 11:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241661

On Wed Jul 22, 2026 at 12:02 PM CEST, Devansh Patel -X (devanshp - E INFOCH=
IPS PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
>
> Thanks for pointing this out. You are correct.
>
> The Wrynose OpenSSH recipe does not enable the kerberos PACKAGECONFIG
> by default, so it is configured with --without-kerberos5.
> Consequently, GSSAPI authentication and GSSAPIStrictAcceptorCheck are
> not available in the default OE-Core build, and this scenario cannot
> be triggered.
>
> Also, the referenced upstream commit only documents the existing
> Windows Active Directory behavior; it does not change or remediate
> that behavior. Therefore, carrying it as a CVE fix would be
> misleading.
>
> We will withdraw this patch and replace it with a configuration-aware
> CVE_STATUS: not-applicable-config when the kerberos PACKAGECONFIG is
> disabled, while leaving the CVE unpatched when Kerberos/GSSAPI support
> is explicitly enabled.

Sounds good. I'll send the rest of the series for review. Please send
this v2 as a single patch.

Thanks!

>
> Regards,
>
> Devansh
>
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: Tuesday, July 21, 2026 20:00
> To: Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco) <d=
evanshp@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-=
core@lists.openembedded.org>
> Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
> Subject: Re: [OE-core][wrynose][PATCH 3/8] openssh: Fix CVE-2026-59998
>
> On Mon Jul 20, 2026 at 7:55 PM CEST, Devansh Patel via lists.openembedded=
.org wrote:
>> From: Devansh Patel <devanshp@cisco.com>
>>
>> This patch applies the upstream OpenSSH 10.4p1 backport for
>> CVE-2026-59998. The upstream fix commit is referenced in [1],
>> and the public CVE advisory is referenced in [2].
>>
>> [1] https://github.com/openssh/openssh-portable/commit/8058c5bdb507591b7=
9ec926221fbe6fcc296d432
>> [2] https://www.cve.org/CVERecord?id=3DCVE-2026-59998
>>
>> Signed-off-by: Devansh Patel <devanshp@cisco.com>
>> ---
>>  .../openssh/openssh/CVE-2026-59998.patch      | 36 +++++++++++++++++++
>>  .../openssh/openssh_10.3p1.bb                 |  1 +
>>  2 files changed, 37 insertions(+)
>>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-5=
9998.patch
>>
>> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.pa=
tch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch
>> new file mode 100644
>> index 0000000000..3e15fe19fa
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch
>> @@ -0,0 +1,36 @@
>> +From 94a089cd331eeea77ffd6fd715e61d281c3b97c3 Mon Sep 17 00:00:00 2001
>> +From: "djm@openbsd.org" <djm@openbsd.org>
>> +Date: Wed, 24 Jun 2026 06:55:12 +0000
>> +Subject: [PATCH] upstream: mention a caveat regarding
>> + GSSAPIStrictAcceptorCheck in
>> +
>> +some environments
>> +
>> +OpenBSD-Commit-ID: aa7158d8f22cb34063c1c2d3cbcf30a9489847c2
>> +
>> +CVE: CVE-2026-59998
>> +Upstream-Status: Backport [https://github.com/openssh/openssh-portable/=
commit/8058c5bdb507591b79ec926221fbe6fcc296d432]
>> +
>> +Backport Changes:
>> +- Omitted the upstream OpenBSD revision and Mdocdate-only hunks in
>> +  sshd_config.5 and retained the Wrynose OpenSSH 10.3p1 values because
>> +  this stable backport carries only the security-relevant documentation=
.
>> +
>> +(cherry picked from commit 8058c5bdb507591b79ec926221fbe6fcc296d432)
>> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
>> +---
>> + sshd_config.5 | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/sshd_config.5 b/sshd_config.5
>> +index 3f5e29812..22b9039d2 100644
>> +--- a/sshd_config.5
>> ++++ b/sshd_config.5
>> +@@ -769,6 +769,7 @@ machine's default store.
>> + This facility is provided to assist with operation on multi homed mach=
ines.
>> + The default is
>> + .Cm yes .
>> ++This option may not be effective in Windows Active Directory environme=
nts.
>
> This is a oneline manpage patch for "Windows Active Directory
> environments.".
>
> I'm not expert in GSSAPI but can we even trigger this?
> If not, I think this should be handled with a CVE_STATUS.
>
> I'll hold this patch in the meantime.
>
> Regards,
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


