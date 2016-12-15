Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7DB5760750
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 01:04:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBF14dHt030713
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 14 Dec 2016 17:04:39 -0800
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Dec 2016 17:04:38 -0800
To: Andre McCurdy <armccurdy@gmail.com>, "Huang, Jie (Jackie)"
	<Jackie.Huang@windriver.com>
References: <20161212054215.20513-1-jackie.huang@windriver.com>
	<CAMKF1sqm-YotzrkeqvvLr5MQsPNoiN6W2y_UhfYkx-dJWR66Fw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA013DE49043@ALA-MBA.corp.ad.wrs.com>
	<CAJ86T=Ux+uT-PgJ+H+-i60iABaQ3iuUB8gz6iLF-+vtMycZdWw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA013DE4A0F6@ALA-MBA.corp.ad.wrs.com>
	<CAJ86T=Xw9JAQDE+qPKX3T00VYHP0Kt7s47Yh3cNxzpZpc5Pp0w@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <00b0154b-3278-87e2-a8f0-48e8be3c309d@windriver.com>
Date: Wed, 14 Dec 2016 20:04:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Xw9JAQDE+qPKX3T00VYHP0Kt7s47Yh3cNxzpZpc5Pp0w@mail.gmail.com>
X-Originating-IP: [172.25.44.2]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add -fno-builtin-strlen when not using -O2
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
X-List-Received-Date: Thu, 15 Dec 2016 01:04:39 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-12-13 04:16 AM, Andre McCurdy wrote:
> On Mon, Dec 12, 2016 at 9:14 PM, Huang, Jie (Jackie)
> <Jackie.Huang@windriver.com> wrote:
>>> From: Andre McCurdy [mailto:armccurdy@gmail.com]
>>> For reference, here's the patch I've been using. It's a slightly more
>>> generic fix than the one in the KDE bug report.
>>
>> Thanks, It's a better patch and I will take it and send as v2 of this issue if you're
>> not going to send it yourself, is it fine for you and could you provide extra info
>> for the patch header like, upstream-status, written by or Signed-off-by?
>
> Sure. I forget why I didn't submit this at the time. The full patch is:
>
>>From d34e2a50ca5493f5a0ce9ccad83a36ac33689266 Mon Sep 17 00:00:00 2001
> From: Andre McCurdy <armccurdy@gmail.com>
> Date: Fri, 12 Feb 2016 18:22:12 -0800
> Subject: [PATCH] make ld-XXX.so strlen intercept optional
>
> Hack: Depending on how glibc was compiled (e.g. optimised for size or
> built with _FORTIFY_SOURCE enabled) the strlen symbol might not be
> found in ld-XXX.so. Therefore although we should still try to
> intercept it, don't make it mandatory to do so.
>
> Upstream-Status: Inappropriate

Can you explain why it's not appropriate for upstream?
Does valgrind not support running with different optimizations
of glibc?

>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  coregrind/m_redir.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/coregrind/m_redir.c b/coregrind/m_redir.c
> index 7e4df8d..640a346 100644
> --- a/coregrind/m_redir.c
> +++ b/coregrind/m_redir.c
> @@ -1220,7 +1220,18 @@ static void add_hardwired_spec (const  HChar*
> sopatt, const HChar* fnpatt,
>     spec->from_fnpatt = CONST_CAST(HChar *,fnpatt);
>     spec->to_addr     = to_addr;
>     spec->isWrap      = False;
> -   spec->mandatory   = mandatory;
> +
> +   /* Hack: Depending on how glibc was compiled (e.g. optimised for size or
> +      built with _FORTIFY_SOURCE enabled) the strlen symbol might not be found.
> +      Therefore although we should still try to intercept it, don't make it
> +      mandatory to do so. We over-ride "mandatory" here to avoid the need to
> +      patch the many different architecture specific callers to
> +      add_hardwired_spec(). */
> +   if (0==VG_(strcmp)("strlen", fnpatt))
> +      spec->mandatory = NULL;

I know that Jackie has a v2 out but since the interested parties are
CCed here, and since this is marked as a hack, would there
be any value in issuing a warning:

#warning "strlen() will not be tracked due to glibc optimization level"

or something like that. Maybe it's overkill since strlen is (should be?)
side-effect free but I thought I'd share the thought.

What's the right thing to do upstream after we have this hack merged
locally to fix our ptests?

../Randy

> +   else
> +      spec->mandatory = mandatory;
> +
>     /* VARIABLE PARTS */
>     spec->mark        = False; /* not significant */
>     spec->done        = False; /* not significant */
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

