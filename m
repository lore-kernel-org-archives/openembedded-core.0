Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 989536AC15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 09:30:30 +0000 (UTC)
Received: by qkfe185 with SMTP id e185so35526553qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 02:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RDXAe0F0WINzhdvtGs1yoZoFTKkz3tTcqnuOpxcSw+s=;
	b=DwsgExq8Re/z2JsyNEFst+pe8k+pmxiYMQeotmfgrIyWysZgoonAj44InZXg1apDum
	RsLzebvKpU+i8tTix8UUy4XuBqsKZBqVwsTFY5RtHQJkDvljXDcwxl4qhLIvwbr6eMzY
	5XiCfH7IJaIR9tfMGXAcIW0MrpEJzeiMZntowlbkFF5WWvfnuSoaNWOHMEMl6haxSuIP
	ASUyekujdQnTI9cYYnICQ60SrpMxaaB+pZaTdnuOD7bGDW9gvCei38pc7CEjwjROuABR
	yPsjp2Dda47mlig5zNxD55FULgwihHHUIDvribeXdEwMBnzN95wr5g7SnacjrsQIvKIa
	LXiA==
X-Gm-Message-State: ALoCoQmumdnTvFCrf6x6//pyyI3l57Q9dUMJhUoFLswk+TC3Djy6wnhWRg/3HPLgfnE+DsF4U/j/
X-Received: by 10.140.231.19 with SMTP id b19mr58868329qhc.22.1435224631224;
	Thu, 25 Jun 2015 02:30:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 25 Jun 2015 02:30:11 -0700 (PDT)
In-Reply-To: <558BA6BB.10301@windriver.com>
References: <1433294684-10258-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LZxzFL=DHq9NxVvcs=VNmPnCe=Z2V6ksAaBmLQ0+FAHxQ@mail.gmail.com>
	<558A0AF1.8060204@windriver.com>
	<CAJTo0LZx+nUqwQKwGcO7G7xHHQkYF0Gp8p2bsGageFKLcM74Lw@mail.gmail.com>
	<558BA6BB.10301@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Jun 2015 10:30:11 +0100
Message-ID: <CAJTo0LYqkTMDbo7dYLP6dMjfR3vzsKv4Ln=j84fMN8Y2Ksyv_w@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][v4] mmc-utils: fix the building failure when DEBUG_BUILD is 1
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
X-List-Received-Date: Thu, 25 Jun 2015 09:30:38 -0000
Content-Type: multipart/alternative; boundary=001a11c12f00513f2d05195446a3

--001a11c12f00513f2d05195446a3
Content-Type: text/plain; charset=UTF-8

On 25 June 2015 at 07:59, Rongqing Li <rongqing.li@windriver.com> wrote:

> How about the below patch
>
> From 6de0180f5332880195e315fdaf4899406dc54d99 Mon Sep 17 00:00:00 2001
> From: Roy Li <rongqing.li@windriver.com>
> Date: Thu, 25 Jun 2015 14:44:05 +0800
> Subject: [PATCH] mmc-utils: fix the building failure when DEBUG_BUILD is 1
>
> AM_CFLAGS in Makefile includes -D_FORTIFY_SOURCE=2 which will lead
> to building failure when DEBUG_BUILD is 1.
> Cancel the definition of _FORTIFY_SOURCE by passing -U_FORTIFY_SOURCE
> via TARGET_CPPFLAGS; this does not effect the security cflags usage,
> since the cflags is equal to:
> CFLAGS="${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION} ${SECURITY_CFLAGS}"
>

You're still globally turning off fortify when it's only a *warning* that
fortify and debug builds are mutually exclusive.  Disabling -Werror is the
best thing to do here.

Ross

--001a11c12f00513f2d05195446a3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 June 2015 at 07:59, Rongqing Li <span dir=3D"ltr">&lt;<a href=3D"mail=
to:rongqing.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1vk" cla=
ss=3D"a3s" style=3D"overflow:hidden">How about the below patch<br>
<br>
From 6de0180f5332880195e315fdaf4899406dc54d99 Mon Sep 17 00:00:00 2001<br>
From: Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com" target=3D"_bl=
ank">rongqing.li@windriver.com</a>&gt;<br>
Date: Thu, 25 Jun 2015 14:44:05 +0800<br>
Subject: [PATCH] mmc-utils: fix the building failure when DEBUG_BUILD is 1<=
span class=3D""><br>
<br>
AM_CFLAGS in Makefile includes -D_FORTIFY_SOURCE=3D2 which will lead<br>
to building failure when DEBUG_BUILD is 1.<br>
Cancel the definition of _FORTIFY_SOURCE by passing -U_FORTIFY_SOURCE<br></=
span>
via TARGET_CPPFLAGS; this does not effect the security cflags usage,<br>
since the cflags is equal to:<br>
CFLAGS=3D&quot;${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION} ${SECURITY_CFLAG=
S}&quot;</div></blockquote></div><br>You&#39;re still globally turning off =
fortify when it&#39;s only a *warning* that fortify and debug builds are mu=
tually exclusive.=C2=A0 Disabling -Werror is the best thing to do here.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a11c12f00513f2d05195446a3--
