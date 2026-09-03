Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C142C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 18:26:21 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14523.1788459979327304522
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 11:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ttxSx615;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso1464065e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 11:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788459977; x=1789064777; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zHHkUcugQ5Qopt6b5b4J1HkhTJGL6QEPs+x60uYHCOw=;
        b=ttxSx615Wf+AayHRAvPp2rde9FLF45NhxuA7lcBqe1E1FqmZ7jMCl9rKDI4e1f0PfI
         X6+al4iaxU67EbWCsjbTWSwhPnoRliS5HUbdtcZP6pmpGIjdCWTx97B0kOSvb0gur1Hm
         b40Zp3UYOP2nL70Xk9SocRC+49FQeK4Azh2Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788459977; x=1789064777;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zHHkUcugQ5Qopt6b5b4J1HkhTJGL6QEPs+x60uYHCOw=;
        b=K6Nz/Bgy0blXKWNKIFqebNCvB2xiHOPYzMlVk4G57wc6p24AyguiQQHxrETLn3lqSf
         4Dn5112rOQfbDiJcrHpJMaEg9s3CY595ZnfppFnYpBPwfHbw9GVXMNs24SBXqKNtSGKF
         r5mOUKHNiwuO3hNt67rZcbViWv6mv3OsQG1jkI/8AiG5sddAZOGs8bs/2fswdI23dBS5
         sXzO7PtQ5yiMZvTzlLcsJMRc3nO+BBzgDzcl7t35q3/YsJgRSsGT6Ghc/D+C2zF7Jqre
         Om8RYNGa4xM861p9IKtxXi2xNRIbOvppY1yBj7mdfC1acV982epMxuegFPlu3wYCbe1r
         aiHw==
X-Forwarded-Encrypted: i=1; AKwUvBwdnIzXCKB6pS2VmWnEhweajjFriLeORQLiaQhu4KgSahrOAJDyvPMGCFUcni6z7lbBd2SF8AcINXn+9sqDpulorQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++lZXJXLlgxro4pPzH8w40E12OqBS9Z29b1XvOPMXqFEMp5UpgBJ
	1YEp5QJoGTqkXpg55TOvg7/pO0N+VfbSrJczp4tVPKd+tO2DhxbPepQHx462Fwdb8ho=
X-Gm-Gg: AYBFou2t4pIlrR8rmJM+oTyYsTq0FxFSzaeozH/4tC1Ez0kGRhTSkEv36aXefW0SSs2
	2bzRGvTysy80BG+IysMmwKEgyOiWXgqCnswuH2dE6xPAJuNC9Xhp4I4PfEgrrWJMbJrEvXiFxEe
	DPY59jL4o85Voh8MVB07ZW8jMd+1/331tc2HjPeyXr2KxtVVgdfw9haR+eEhHZKIlxny1HydF55
	gysMeZ2lSQf13gXa7b4E2aNC1iOrH6F7Fy6oPU3sv7gvwreylbaMRJdhY3ZvlavMHqmzv5SPjqE
	BPFbO+WT2HIqoipiIByyMk7BdPJrhidxDIJ4M+y/5+VrxqIwEoOzXbq2FJJww7MCSxJ4uSgo5A/
	V7qZmvZEVpIckVNuDn2zb0gdoVyVY+p6ccXqK0ly9c7La7doYxTXDR771y8pbxtDPBcVP53WDNz
	7lJnzDI7ISrsKjXVDHIAKMsn3IkGVHwUjd4Dl3L01he+EeOECDPdmnb33lPJ+aTMYmapGm15kZB
	XAwW1SugNhQMCcmq/SFx8BsA9RGICiWjQSYwIyvKTqO64bVxXg=
X-Received: by 2002:a05:600c:4e03:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-49cf5be1652mr41756335e9.13.1788459977524;
        Thu, 03 Sep 2026 11:26:17 -0700 (PDT)
Received: from localhost (2a01cb001331aa00939d825f00cb3861.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:939d:825f:cb:3861])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm326270f8f.30.2026.09.03.11.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 11:26:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 20:26:16 +0200
Message-Id: <DL5W5EQ75P4S.1PMPM7Z0C0Q66@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] glibc: fix CVE-2026-19542
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Sundeep.Kokkonda@windriver.com>
To: <adarsh.jagadish.kamini@est.tech>, <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260903170311.3316373-1-Harish.Sadineni@windriver.com>
 <9505ed3c-51c3-4edb-b3ec-fa42cbb6774a@est.tech>
In-Reply-To: <9505ed3c-51c3-4edb-b3ec-fa42cbb6774a@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 18:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245038

On Thu Sep 3, 2026 at 7:36 PM CEST, Adarsh Jagadish Kamini via lists.openem=
bedded.org wrote:
> On 9/3/26 19:03, Sadineni, Harish via lists.openembedded.org wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>=20
>> Allocate the maximum array sizes directly, instead of resizing
>> the arrays as needed.  This eliminates alloca usage from the
>> function, and fixes the out-of-bounds accesses.  The asserts
>> guard against the bug coming back if the balancing of the tree
>> turns out not to work correctly.
>>=20
>> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dpatch;h=3De2789c46e3bfdcd67a82bea9946b315c179e83d3]
>> CVE: CVE-2026-19542
>>=20
>> Reference:
>> [1]https://security-tracker.debian.org/tracker/CVE-2026-19542
>> [2]https://sourceware.org/bugzilla/show_bug.cgi?id=3D34506
>> [3]https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3De2789c46e3bf=
dcd67a82bea9946b315c179e83d3
>>=20
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>>   .../glibc/glibc/0023-CVE-2026-19542.patch     | 98 +++++++++++++++++++
>>   meta/recipes-core/glibc/glibc_2.43.bb         |  1 +
>>   2 files changed, 99 insertions(+)
>>   create mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.p=
atch
>>=20
>> diff --git a/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch b/m=
eta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
>> new file mode 100644
>> index 0000000000..d4b42c6ea4
>> --- /dev/null
>> +++ b/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
>> @@ -0,0 +1,98 @@
>> +From e2789c46e3bfdcd67a82bea9946b315c179e83d3 Mon Sep 17 00:00:00 2001
>> +From: Florian Weimer <fweimer@redhat.com>
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
>> +CVE: CVE-2025-19542
>> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dpatch;h=3De2789c46e3bfdcd67a82bea9946b315c179e83d3]
>> +
>> +Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
>> +Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
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
>> +-	{
>> +-	  node **newstack;
>> +-	  stacksize +=3D 20;
>> +-	  newstack =3D alloca (sizeof (node *) * stacksize);
>> +-	  nodestack =3D memcpy (newstack, nodestack, sp * sizeof (node *));
>> +-	}
>> +-
>> ++      assert (sp < stacksize);
>> +       nodestack[sp++] =3D rootp;
>> +       p =3D DEREFNODEPTR(rootp);
>> +       if (cmp < 0)
>> +@@ -470,13 +465,7 @@ __tdelete (const void *key, void **vrootp, __compa=
r_fn_t compar)
>> +       node upn;
>> +       for (;;)
>> + 	{
>> +-	  if (sp =3D=3D stacksize)
>> +-	    {
>> +-	      node **newstack;
>> +-	      stacksize +=3D 20;
>> +-	      newstack =3D alloca (sizeof (node *) * stacksize);
>> +-	      nodestack =3D memcpy (newstack, nodestack, sp * sizeof (node *)=
);
>> +-	    }
>> ++	  assert (sp < stacksize);
>> + 	  nodestack[sp++] =3D parentp;
>> + 	  parentp =3D up;
>> + 	  upn =3D DEREFNODEPTR(up);
>> +@@ -541,6 +530,7 @@ __tdelete (const void *key, void **vrootp, __compar=
_fn_t compar)
>> + 		  SETNODEPTR(pp,q);
>> + 		  /* Make sure pp is right if the case below tries to use
>> + 		     it.  */
>> ++		  assert (sp < stacksize);
>> + 		  nodestack[sp++] =3D pp =3D LEFTPTR(q);
>> + 		  q =3D RIGHT(p);
>> + 		}
>> +@@ -625,6 +615,7 @@ __tdelete (const void *key, void **vrootp, __compar=
_fn_t compar)
>> + 		  SETLEFT(p,RIGHT(q));
>> + 		  SETRIGHT(q,p);
>> + 		  SETNODEPTR(pp,q);
>> ++		  assert (sp < stacksize);
>> + 		  nodestack[sp++] =3D pp =3D RIGHTPTR(q);
>> + 		  q =3D LEFT(p);
>> + 		}
>> diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/g=
libc/glibc_2.43.bb
>> index 9f3a3814d0..3ef2301191 100644
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
>> +           file://0023-CVE-2026-19542.patch \
>>   "
>>   B =3D "${WORKDIR}/build-${TARGET_SYS}"
>>  =20
>>=20
>>=20
>>=20
>>=20
> Hi,
> AS far as I know, we don't fix glibc through a patch to=20
> Openembedded-core. Please send a patch to original glibc project's 2.43=
=20
> branch (or check their bug tracker to see if this is backported=20
> already). Once merged, we maybe be able to update the recipe to point to=
=20
> the latest 2.43 release.
>
> I would like someone to verify the above, but as I see there are no CVE=
=20
> backport patches in the recipe.
>
> Thanks!
> Adarsh Jagadish Kamini

That's true. Glibc CVE fixes always come via the upgrade along the
branch. And I'd rather keep it that way.

Thanks!
--=20
Yoann Congal
Smile ECS


