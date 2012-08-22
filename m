Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T4C8b-0000am-0H
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 16:42:29 +0200
Received: by lagv3 with SMTP id v3so534224lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 07:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=kPN22OocQp6RbJe+hClk8Fpiy2fv/ibQ2/QvAq9LzfA=;
	b=VD1FEhGllcUPYdYjssWw3Tk2swc+hG/v93P7HE+iFcywAeycwhw/SBVeARhaD0Xqp3
	tHw/yHcNm/zz+lPfFVFmE00n8+j0BTT6yfjh+FHY/lemP5jj8sA9zWCu07De0k3am0xj
	gTJobO96udWCdaYeNCMNtfeR4lAaiOWa0tUaYA4HgONXo8Hdd0kaG0UNAjU/u76vcIGI
	yw3hsffZJCWx23HmncYuM16fvRlDBvvdFu/pp8RwZ4Sg9WA8Fzrw4IbHNR7nTYkDPPlT
	gFM45gvi9RPR0dm7utp8KbCca7+7kf3DtzQ2GligNJ9CXamB8q9//Ny8F84IouoJ7hZf
	cPrg==
Received: by 10.152.113.68 with SMTP id iw4mr21554961lab.50.1345645823891;
	Wed, 22 Aug 2012 07:30:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Wed, 22 Aug 2012 07:30:03 -0700 (PDT)
In-Reply-To: <2C58EEEE-174C-4E2B-8A9F-1148A009E26D@gmail.com>
References: <1345632209-4188-1-git-send-email-radu.moisan@intel.com>
	<CABcZANn8tSTrfwbOCi6WoiURVRcG3w_dF5-nnwMC+7Pz=aK01w@mail.gmail.com>
	<5034EBB3.3010906@intel.com>
	<2C58EEEE-174C-4E2B-8A9F-1148A009E26D@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 22 Aug 2012 07:30:03 -0700
X-Google-Sender-Auth: mayJiitR9A_pNxjDsO6gY5RlatY
Message-ID: <CABcZANkvEXuKWGSaDzJLdgBMGzgZHSGfH2yiRB+8PcKcZ_zeWw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] coreutils: Upgrade to upstream version 8.17
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2012 14:42:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 22, 2012 at 7:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> diff --git a/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
>>>> new file mode 100644
>>>> index 0000000..e32f612
>>>> --- /dev/null
>>>> +++ b/meta/recipes-core/coreutils/coreutils-8.17/realpath-works-yes.patch
>>>> @@ -0,0 +1,21 @@
>>>> +Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>>> +Upstream status: pending
>>>> +
>>>> +The new version of coreutils, adds use of canonicalize_file_name() function defined in canonicalize.h
>>>> +The problem: the function is redefined to rpl_canonicalize_file_name by means of a macro,which gives
>>>> +an undefined reference error at compile time. Macro definition depends in the end on
>>>> +gl_cv_func_realpath_works but assumed true only when set to "yes"
>>>> +
>>>> +Index: coreutils-8.17/m4/canonicalize.m4
>>>> +===================================================================
>>>> +--- coreutils-8.17.orig/m4/canonicalize.m4     2012-05-08 12:05:23.000000000 +0300
>>>> ++++ coreutils-8.17/m4/canonicalize.m4  2012-08-17 14:20:22.000000000 +0300
>>>> +@@ -95,7 +95,7 @@
>>>> +      [gl_cv_func_realpath_works=no],
>>>> +      [case "$host_os" in
>>>> +                 # Guess yes on glibc systems.
>>>> +-        *-gnu*) gl_cv_func_realpath_works="guessing yes" ;;
>>>> ++        *-gnu*) gl_cv_func_realpath_works="yes" ;;
>>>> +                 # If we don't know, assume the worst.
>>>> +         *)      gl_cv_func_realpath_works="guessing no" ;;
>>>> +       esac
>>> Wouldn't it be better to provide a cached test result in the site
>>> files for this test, rather than relying on a host_os based guess?
>> I really don't know the answer to your question. The patch was intended to provide minimally invasive change to the original file. If you elaborate more on your proposal, I would gladly take into consideration a future patch to address this issue.
>
>
> Add CACHED_CONFIGUREVARS in the recipe search in metadata for existing examples

That's a good route, but only if we know realpath works in 100% of
cases. Which, admittedly, one would certainly hope is the case :)
-- 
Christopher Larson


