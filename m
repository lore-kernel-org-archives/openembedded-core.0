Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7CDC79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 12:53:43 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13273.1789044815222785368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 05:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=v5ZWxSa/;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso10668565e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 05:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789044813; x=1789649613; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjtWAbeHhHklHZFNdry20rNCeEV+XZAV0xKf044ZntU=;
        b=v5ZWxSa/Z51J3D63W7HuNn4WGQBmt5BzB8PsNVSgCePg0EuVl1WWWh4G2qTQL/VWfy
         yNipiKO6Lzo1pk9U4+c+I5dyyR2I2Bqx0FRD8AQjXbGi94n8wfRDIEAiNBX1U797HI3q
         yZtfgMf1gTIu92igaWTqXY7j9oVKGjMlQoO5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044813; x=1789649613;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjtWAbeHhHklHZFNdry20rNCeEV+XZAV0xKf044ZntU=;
        b=bz8IGY9eLks61TFtFsHHjd9DtLZh5QOAcnR3PvxzKNHQX8sZSN6vuOP2sB3s6Cj6zL
         b9dPlKcAFEmBJwGzpsAgzJp8IYrjUBZbIyCry5WUZY7sih2UBdt897PobLMJuaxGQMHc
         WUuNiIHo1ZWhhdO2rE6c1C/Ri7K6KNgFusJheow+k9g1rbX1H9T0+wblJsD7LiZNV6kN
         o5HiILl1Rc2cuLKHeOk4307f9d2hL4cgloKMirY8MO+zSIpwhAIJwk/f6nkppuIG4U6r
         VFGLA75WAqgSNkdFoq5nFbx/u0jOq6SswgqzeNTCzgmg/iXFsVmmlvBagWCBO7A7sjTP
         voJg==
X-Forwarded-Encrypted: i=1; AKwUvBwalQuIvkKhtiSMzXWgthnYWHzFIgwwD6OKCIxN3PWUzwdq0Fi+XoYpgq7rwNZqpjFKq3VYNcWXBFy1dPTJFFTw7g==@lists.openembedded.org
X-Gm-Message-State: AFuF++kpXiC1Ghutet60bZ3WL91gCqTGIbghsWzu+353k6CxOgjLLMJp
	XnPxMBQVGxEKloqM05+Th+rHBiPCD25sq5pHn40VcxaZziVP6KLXyjKv52felABY5jk=
X-Gm-Gg: AYBFou3Itnh63mviRcOzMD0Ft8ce7TYf+w/bSADt7Q4wvQ8+rA1S3aQIPARz6kdgDOE
	ZLNy1eaRwyCaamp60DhQfRKil6ofvjR+x4B+T0IfUfTVHpu//tGNKaduBNGvHsY8iHUmOiaEgMU
	DIAuuTUg4u+qsmJf2yGhTNNmfuKGw4m92pMuJfgBR4+TpG9Tm+P/ysu9mDS9Oa/6nV4n7iRd7iD
	3WrS2zKYxkVM7151YaxvkbrKNcNcX6tKixWOClyzDqCIR6ICi9Lzdw0h5ic8cr/ql0ftsxONo3N
	Eq4L3Ouj38+EB9HV87by9GdYzwNHYp3JNQWKtSzMkWJjNGeH6bBqYEsB4PBJY8vpFQfxR3GvNS8
	/Ch2YWbt3BF1krqyLLW/O/UZV98SAt1Wp3K8S7WModoRWq3fcLGc7UeJNTJ3KTxB7zheeFbcSuH
	to64d/tHsdBhyzDHgdIDL9yb/40OjzSGbuA19nhaAtzlpPSolmMBiOUBdVl0ItpwwHsCOp0nK0E
	57e3PVzai0RY03a0l+tv6vJ2Dmo+7IDFUnXNXxcgrQ1XplxZ/tWK5Xjx7RGTPY=
X-Received: by 2002:a05:600c:150a:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49d2592e85bmr95190035e9.13.1789044813151;
        Thu, 10 Sep 2026 05:53:33 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c07c17sm90690175e9.14.2026.09.10.05.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 05:53:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 14:53:32 +0200
Message-Id: <DLBNGGKN75F8.2BJ4UV23SMUET@smile.fr>
To: "Hemanth Kumar M D" <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose 21/38] glibc: fix CVE-2026-19542
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <cover.1788938908.git.yoann.congal@smile.fr>
 <11fef7c21845e03c044305ba57e289831e7518c9.1788938909.git.yoann.congal@smile.fr> <e17b296b-ad39-4059-be9b-7f551b822933@windriver.com>
In-Reply-To: <e17b296b-ad39-4059-be9b-7f551b822933@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 12:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245561

On Thu Sep 10, 2026 at 6:42 AM CEST, Hemanth Kumar M D wrote:
> Hi Yoann,
>
> This CVE patch will come with the glibc 2.43 stable branch updates:
> https://lists.openembedded.org/g/openembedded-core/message/245453=20
> <https://lists.openembedded.org/g/openembedded-core/message/245453>
>
> Please drop this patch.

Right,

For the record, the patch fixing this CVE in this branch is:
0afa34adb0 misc: Fix out-of-bounds array write in tdelete (bug 34506)

I will drop this one before requesting a merge.

Thanks!
>
> On 09-09-2026 12:59 pm, Yoann Congal via lists.openembedded.org wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>>
>> Allocate the maximum array sizes directly, instead of resizing
>> the arrays as needed.  This eliminates alloca usage from the
>> function, and fixes the out-of-bounds accesses.  The asserts
>> guard against the bug coming back if the balancing of the tree
>> turns out not to work correctly.
>>
>> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dpatch;h=3De2789c46e3bfdcd67a82bea9946b315c179e83d3]
>> CVE: CVE-2026-19542
>>
>> Reference:
>> [1]https://security-tracker.debian.org/tracker/CVE-2026-19542
>> [2]https://sourceware.org/bugzilla/show_bug.cgi?id=3D34506
>> [3]https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3De2789c46e3bf=
dcd67a82bea9946b315c179e83d3
>>
>> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
>> Signed-off-by: Yoann Congal<yoann.congal@smile.fr>
>> [YC: fixed CVE: tag in patch]
>> ---
>>   .../glibc/glibc/0023-CVE-2026-19542.patch     | 98 +++++++++++++++++++
>>   meta/recipes-core/glibc/glibc_2.43.bb         |  1 +
>>   2 files changed, 99 insertions(+)
>>   create mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.p=
atch
>>
>> diff --git a/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch b/m=
eta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
>> new file mode 100644
>> index 00000000000..094a50919dc
>> --- /dev/null
>> +++ b/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
>> @@ -0,0 +1,98 @@
>> +From e2789c46e3bfdcd67a82bea9946b315c179e83d3 Mon Sep 17 00:00:00 2001
>> +From: Florian Weimer<fweimer@redhat.com>
>> +Date: Fri, 14 Aug 2026 13:41:16 +0200
>> +Subject: [PATCH] misc: Fix out-of-bounds array write in tdelete (bug 34=
506)
>> +
>> +Allocate the maximum array sizes directly, instead of resizing
>> +the arrays as needed.  This eliminates alloca usage from the
>> +function, and fixes the out-of-bounds accesses.  The asserts
>> +guard against the bug coming back if the balancing of the tree
>> +turns out not to work correctly.
>> +
>> +CVE: CVE-2026-19542
>> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dpatch;h=3De2789c46e3bfdcd67a82bea9946b315c179e83d3]
>> +
>> +Reviewed-by: Adhemerval Zanella<adhemerval.zanella@linaro.org>
>> +Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
>> +---
>> + misc/tsearch.c | 31 +++++++++++--------------------
>> + 1 file changed, 11 insertions(+), 20 deletions(-)
>> +
>> +diff --git a/misc/tsearch.c b/misc/tsearch.c
>> +index 9b2eb34b25..e517dfa712 100644
>> +--- a/misc/tsearch.c
>> ++++ b/misc/tsearch.c
>> +@@ -85,6 +85,7 @@
>> + #include <assert.h>
>> + #include <stdalign.h>
>> + #include <stddef.h>
>> ++#include <stdint.h>
>> + #include <stdlib.h>
>> + #include <string.h>
>> + #include <search.h>
>> +@@ -406,12 +407,13 @@ __tdelete (const void *key, void **vrootp, __comp=
ar_fn_t compar)
>> +   int cmp;
>> +   node *rootp =3D (node *) vrootp;
>> +   node root, unchained;
>> +-  /* Stack of nodes so we remember the parents without recursion.  It'=
s
>> +-     _very_ unlikely that there are paths longer than 40 nodes.  The t=
ree
>> +-     would need to have around 250.000 nodes.  */
>> +-  int stacksize =3D 40;
>> ++  /* Stack of nodes so we remember the parents without recursion.  The
>> ++     stack size is a conservative approximation of the maximum height
>> ++     of a red-black tree, based on size of the address space.
>> ++     Actual numbers are closer to 57 (32 bit) and 117 (63 bit).  */
>> ++  enum { stacksize =3D 2 * UINTPTR_WIDTH };
>> +   int sp =3D 0;
>> +-  node **nodestack =3D alloca (sizeof (node *) * stacksize);
>> ++  node *nodestack[stacksize];
>> +
>> +   if (rootp =3D=3D NULL)
>> +     return NULL;
>> +@@ -424,14 +426,7 @@ __tdelete (const void *key, void **vrootp, __compa=
r_fn_t compar)
>> +   root =3D DEREFNODEPTR(rootp);
>> +   while ((cmp =3D (*compar) (key, root->key)) !=3D 0)
>> +     {
>> +-      if (sp =3D=3D stacksize)
>> +-      {
>> +-        node **newstack;
>> +-        stacksize +=3D 20;
>> +-        newstack =3D alloca (sizeof (node *) * stacksize);
>> +-        nodestack =3D memcpy (newstack, nodestack, sp * sizeof (node *=
));
>> +-      }
>> +-
>> ++      assert (sp < stacksize);
>> +       nodestack[sp++] =3D rootp;
>> +       p =3D DEREFNODEPTR(rootp);
>> +       if (cmp < 0)
>> +@@ -470,13 +465,7 @@ __tdelete (const void *key, void **vrootp, __compa=
r_fn_t compar)
>> +       node upn;
>> +       for (;;)
>> +       {
>> +-        if (sp =3D=3D stacksize)
>> +-          {
>> +-            node **newstack;
>> +-            stacksize +=3D 20;
>> +-            newstack =3D alloca (sizeof (node *) * stacksize);
>> +-            nodestack =3D memcpy (newstack, nodestack, sp * sizeof (no=
de *));
>> +-          }
>> ++        assert (sp < stacksize);
>> +         nodestack[sp++] =3D parentp;
>> +         parentp =3D up;
>> +         upn =3D DEREFNODEPTR(up);
>> +@@ -541,6 +530,7 @@ __tdelete (const void *key, void **vrootp, __compar=
_fn_t compar)
>> +                 SETNODEPTR(pp,q);
>> +                 /* Make sure pp is right if the case below tries to us=
e
>> +                    it.  */
>> ++                assert (sp < stacksize);
>> +                 nodestack[sp++] =3D pp =3D LEFTPTR(q);
>> +                 q =3D RIGHT(p);
>> +               }
>> +@@ -625,6 +615,7 @@ __tdelete (const void *key, void **vrootp, __compar=
_fn_t compar)
>> +                 SETLEFT(p,RIGHT(q));
>> +                 SETRIGHT(q,p);
>> +                 SETNODEPTR(pp,q);
>> ++                assert (sp < stacksize);
>> +                 nodestack[sp++] =3D pp =3D RIGHTPTR(q);
>> +                 q =3D LEFT(p);
>> +               }
>> diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/g=
libc/glibc_2.43.bb
>> index 9f3a3814d0a..3ef2301191d 100644
>> --- a/meta/recipes-core/glibc/glibc_2.43.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.43.bb
>> @@ -55,6 +55,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};n=
ame=3Dglibc \
>>              file://0020-fix-create-thread-failed-in-unprivileged-proces=
s-BZ-.patch \
>>              file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-sel=
ftest.patch \
>>              file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLA=
GS.patch \
>> +file://0023-CVE-2026-19542.patch \
>>   "
>>   B =3D "${WORKDIR}/build-${TARGET_SYS}"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#245430):https://lists.openembedded.org/g/openembedde=
d-core/message/245430
>> Mute This Topic:https://lists.openembedded.org/mt/121158859/10244482
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [He=
manth.KumarMD@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--=20
Yoann Congal
Smile ECS


