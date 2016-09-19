Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 762EA601A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 09:42:57 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id q92so85886746ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 02:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p/Q5PEvdQ7XTAresU2MPq9mnQD/fh/WsSezl12E1tAw=;
	b=ytFZmp+rH1URAO/osCj+tfjJit0qdg6G3cxJ5T/Mszlz77em+ZCczozk1sT6plJCx7
	CeEd/B7wWhCFnSOBuZAnhkfS/Z4kR7wdQeMaB7QwTPeJDZaaynpcEr1Yebjy8zvj8Ssw
	Fgj+oNer1dzSzBSga1f6Mn8H2mrjfb90tRrjsFSS+l1SBhz5gCrmZ/kdWXAtzluYel+U
	TYIzsJaHc8eclfAabHVC9aCQ3+9qg9CJQ36+la/Hk3n+vpAuJSYAYhWbhH0DV7TrIQa8
	3SL3cCetNF8OoDwO2sZliZjfu84pdYxZSTYeIwpuNkgyhEm34rfpuDnPgtsQ9bjLlORW
	h+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p/Q5PEvdQ7XTAresU2MPq9mnQD/fh/WsSezl12E1tAw=;
	b=ctmcL6O0IIksrpXMiIlEBtLfmKh4ka8qIec3Hd4sPCkLwTGRNH+YXFvuQlRvCIfwQQ
	I3Ka33L5/0oZswQ9WeHM2raeCzsxcS/S0K8g7jXg7+VrYj+S8RKwFrlG7ROoQILVtbqP
	fpjEyfvLHYqiEsVNaddZccr/VY6DN/EizxdLh1RwEBpYX191uZsDCoDEeVhSNYShUu/N
	BC0yOxP82aZdAZsNs240ylj5dUDMN3hCrSfmrD0s/Cx2lImdEkICBeWyCi892g4PmJNs
	UyHN6TtbimZ16+is+0JjAb6kSX6pTURSuZHmxNdiwKdL2usGckjOD6bWFrh982JGzHK9
	mXqQ==
X-Gm-Message-State: AE9vXwOnbLudMcf+jO/Pwk+y2TqdwF7Qyvr9CBpOTiq03HyZnVE3Fioy/W56UnbmGBoJEUaO7JSGse0VBZrdYugE
X-Received: by 10.107.142.147 with SMTP id q141mr12053948iod.67.1474278178522; 
	Mon, 19 Sep 2016 02:42:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Mon, 19 Sep 2016 02:42:38 -0700 (PDT)
In-Reply-To: <20160919093853.15528-1-git@andred.net>
References: <20160919093853.15528-1-git@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Sep 2016 10:42:38 +0100
Message-ID: <CAJTo0LZScnAx3sXRjHL9GUJ7-=0pEHi86x-yG14+kv_nmghfPQ@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: switch to using C++11 atomics when available
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
X-List-Received-Date: Mon, 19 Sep 2016 09:43:01 -0000
Content-Type: multipart/alternative; boundary=94eb2c05b2de219f41053cd92379

--94eb2c05b2de219f41053cd92379
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 19 September 2016 at 10:38, Andr=C3=A9 Draszik <git@andred.net> wrote:

> +++ b/meta/recipes-support/boost/boost/0004-Use-atomic-by-
> default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch
> @@ -0,0 +1,58 @@
> +From c234cc557f60729e071d6da59747c1a9289555c5 Mon Sep 17 00:00:00 2001
> +From: Peter Dimov <pdimov@pdimov.com>
> +Date: Sun, 28 Aug 2016 21:28:21 +0300
> +Subject: [PATCH 4/4] Use <atomic> by default when
> BOOST_NO_CXX11_HDR_ATOMIC is
> + not defined
> +
> +---
> +Upstream-Status: Backport https://github.com/boostorg/smart_ptr/commit/
> 20fedcff2ca3143503ec4e876d47745ab0ec7b0c
> + boost/smart_ptr/detail/atomic_count.hpp    | 3 +++
> + boost/smart_ptr/detail/sp_counted_base.hpp | 3 +++
> + boost/smart_ptr/detail/spinlock.hpp        | 3 +++
> + 3 files changed, 9 insertions(+)
>

This patch needs your s-o-b.

Ross

--94eb2c05b2de219f41053cd92379
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 September 2016 at 10:38, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a =
href=3D"mailto:git@andred.net" target=3D"_blank">git@andred.net</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":19g" class=3D"a3s =
aXjCH m15741d0da6ed9ea8">+++ b/meta/recipes-support/boost/<wbr>boost/0004-U=
se-atomic-by-<wbr>default-when-BOOST_NO_CXX11_<wbr>HDR_ATOMIC.patch<br>
@@ -0,0 +1,58 @@<br>
+From c234cc557f60729e071d6da59747c1<wbr>a9289555c5 Mon Sep 17 00:00:00 200=
1<br>
+From: Peter Dimov &lt;<a href=3D"mailto:pdimov@pdimov.com">pdimov@pdimov.c=
om</a>&gt;<br>
+Date: Sun, 28 Aug 2016 21:28:21 +0300<br>
+Subject: [PATCH 4/4] Use &lt;atomic&gt; by default when BOOST_NO_CXX11_HDR=
_ATOMIC is<br>
+ not defined<br>
+<br>
+---<br>
+Upstream-Status: Backport <a href=3D"https://github.com/boostorg/smart_ptr=
/commit/20fedcff2ca3143503ec4e876d47745ab0ec7b0c" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/boostorg/<wbr>smart_ptr/commit/<wbr>20fedcff=
2ca3143503ec4e876d4774<wbr>5ab0ec7b0c</a><br>
+ boost/smart_ptr/detail/atomic_<wbr>count.hpp=C2=A0 =C2=A0 | 3 +++<br>
+ boost/smart_ptr/detail/sp_<wbr>counted_base.hpp | 3 +++<br>
+ boost/smart_ptr/detail/<wbr>spinlock.hpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +=
++<br>
+ 3 files changed, 9 insertions(+)</div></blockquote></div><br>This patch n=
eeds your s-o-b.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--94eb2c05b2de219f41053cd92379--
