Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0A7737EE19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 22:11:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46VVGP5K9NzK2;
	Sat, 14 Sep 2019 00:11:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568412686;
	bh=vz6FP+Ac1V+3jMpu3Rzwi/DasbTUGmmkD6C3LdhoLsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XcilltsDTSKCGvDsb3WvusxFULHyxhdhW0k1UW1RMgw4mZQlWE9bLvXzTwhs0vBKl
	NYt/4B+k41HAwphNsk4z2Ds8D1r5VqL9APTSBZRFT9kV0+HWNuGD/Gf9BmwvCOsKQV
	HYEcMsj/AEm3LIW/TN7HdLNHaAueTc2evNKsE9jR5MMqaFXKAVsZMDbl9wai5aAxnx
	wTHIKpfT3AJAFHi6mzMwkBPNmBngkrzt0c9yYiRsZ0AAfBGwh/2K7AvcD2UXheAhR5
	c+7MofbdoArO4dJ9Jv2Lu9HudjssXll0WwYxf2uBIL0SzXo89jKt3+tQFm7FGRYYhz
	UnHASll7cEc93S3xKyjori3byOyM5T1GTx3P8rZpoEaDLKyQEtKQuzjfJIkJws7xqa
	oixAJgDOkvqekuVep1XtbUE4m/DDv21vYE3w0H2aeo9AuzchTPXewad9kCypZD0GVu
	2zQeR8nNSq6XYfPRkjw4FQoSD5pzDTsjHGSGVDvsQPb8b+wP2cRwUk9n5Gv1UH2B4c
	k2wyj155UBmRHiwPv2123Npij3wVPziArIHJSoXBn/D6WP0+zkokqp+Dp1K0RBE0cR
	+PNEl6kMtF8hWwTxLuDdh1/3Vk9ADkVDv1Ui9OZTNA6zCx1KbNulBEn/bsJ1wcFC/6
	6qpT9elqEmeYdIs+o+1eDN3M=
Date: Sat, 14 Sep 2019 01:11:23 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Scott Murray <scott.murray@konsulko.com>
Message-ID: <20190913221123.GA31095@localhost>
References: <20190913215809.34402-1-scott.murray@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20190913215809.34402-1-scott.murray@konsulko.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: upgrade to 243
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Sep 2019 22:11:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Sep 13, 2019 at 05:58:09PM -0400, Scott Murray wrote:
>...
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0002-src-login-brightness.c-include-wait.h.patch
> @@ -0,0 +1,25 @@
> +Include wait.h
> +
> +Fixes:
> +src/login/logind-brightness.c:158:85: error: 'WEXITED' undeclared (first use in this function); did you mean 'WIFEXITED'?
> +  158 |         r = sd_event_add_child(w->manager->event, &w->child_event_source, w->child, WEXITED, on_brightness_writer_exit, w);
> +      |                                                                                     ^~~~~~~
>...
> +--- a/src/login/logind-brightness.c
> ++++ b/src/login/logind-brightness.c
> +@@ -1,5 +1,6 @@
> + /* SPDX-License-Identifier: LGPL-2.1+ */
> + 
> ++#include <wait.h>
>...

This should be
  #include <sys/wait.h>

> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch
> @@ -0,0 +1,54 @@
> +Handle __cpu_mask usage
> +
> +Fixes errors:
> +
> +src/test/test-cpu-set-util.c:18:54: error: '__cpu_mask' undeclared (first use in this function)
> +src/test/test-sizeof.c:73:14: error: '__cpu_mask' undeclared (first use in this function)
> +
> +__cpu_mask is an internal type of glibc's cpu_set implementation, not
> +part of the POSIX definition, which is problematic when building with
> +musl, which does not define a matching type.  From inspection of musl's
> +sched.h, however, it is clear that the corresponding type would be long,
> +which does match glibc's actual __CPU_MASK_TYPE.  So, add a typedef to
> +cpu-set-util.h defining __cpu_mask appropriately.
>...
> +--- a/src/shared/cpu-set-util.h
> ++++ b/src/shared/cpu-set-util.h
> +@@ -6,6 +6,8 @@
> + #include "macro.h"
> + #include "missing_syscall.h"
> + 
> ++typedef long __cpu_mask;
>...

Signed looks wrong.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


