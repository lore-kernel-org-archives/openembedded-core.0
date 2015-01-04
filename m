Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3C70A7264F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 18:52:37 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id z6so10059285yhz.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Jan 2015 10:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=dqKWsReKQipNnmw5keurkQemaQN2DeRLPx326YJQL4c=;
	b=c6oXV2rwZgk48y8NtwZviKXA77iwTVKi55taBG5mGPVJHWmhDD9LtWyZ+tGsMd7v+Z
	Ju5sh9CHH9rhoMnibf+mKET/xAZ6En6eO7ccVfK6gAhu+yP7TDyzOsF0PNH3fDwDNSXu
	VLGhCswhC7Sf3EKEAA6UEO87cz2xEF+m5lp6otZNh+8ViT82UDxRPlsu/2lpkk8kn7bn
	T39usIN9f/oC0OfaAZ3IZwqApN+DzdsY3FuwEw0owjDPl8j6Wx9Z6NuwlTL+Tu1kxBc7
	kJ6uhSWT+Me9vsZZxfG0V5BDMkO+nILDo5H8WAI74h3d2vP0ftmhPQG9CJ/S+6HuP7fy
	MpVQ==
MIME-Version: 1.0
X-Received: by 10.236.210.5 with SMTP id t5mr54812648yho.104.1420397557927;
	Sun, 04 Jan 2015 10:52:37 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Sun, 4 Jan 2015 10:52:37 -0800 (PST)
In-Reply-To: <54A8D1FB.7090406@windriver.com>
References: <1419610232-6386-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpyDYSHCFF+3RJTa_PgjCEvcSAGEGHKR8cH4ADgg5VuiA@mail.gmail.com>
	<54A89F77.1080209@windriver.com>
	<CAP9ODKo6N5DtU4wUw23YWyGryJ4XNZbLJNfOVWpxeNETqGGDeg@mail.gmail.com>
	<54A8D1FB.7090406@windriver.com>
Date: Sun, 4 Jan 2015 16:52:37 -0200
X-Google-Sender-Auth: V7vL0vlH8La0cmZgXX6cq8Shcgw
Message-ID: <CAP9ODKpH3uoHLC5wwQArqODEbLcVgRYirJSvE9k0ABWwWTjJaA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sed: Skip 'build-deps' QA check for sed-ptest package
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
X-List-Received-Date: Sun, 04 Jan 2015 18:52:41 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jan 4, 2015 at 3:39 AM, ChenQi <Qi.Chen@windriver.com> wrote:
> On 01/04/2015 12:31 PM, Otavio Salvador wrote:
>>
>> On Sun, Jan 4, 2015 at 12:03 AM, ChenQi <Qi.Chen@windriver.com> wrote:
>>>
>>> On 01/01/2015 03:16 AM, Otavio Salvador wrote:
>>>>
>>>> On Fri, Dec 26, 2014 at 2:10 PM, Otavio Salvador
>>>> <otavio@ossystems.com.br> wrote:
>>>>>
>>>>> The sed-ptest package has runtime dependencies which are used only
>>>>> when running the tests. So the 'build-dep' QA check can be skipped for
>>>>> this specific package. Fixes the following QA error:
>>>>>
>>>>> ,----
>>>>> | WARNING: QA Issue: sed-ptest rdepends on locale-base-ru-ru, but it
>>>>> |     isn't a build dependency? [build-deps]
>>>>> `----
>>>>>
>>>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>>>
>>>> Ping?
>>>>
>>> Last week, I did a world build and I didn't get this QA warning.
>>> Are there any specific build steps or configurations to reproduce the
>>> bug?
>>
>> ptest?
>>
>
> It's in DISTRO_FEATURES.

So using today's tip I have:

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: QA Issue: sed-ptest rdepends on locale-base-ru-ru, but it
isn't a build dependency? [build-deps]
NOTE: Tasks Summary: Attempted 718 tasks of which 701 didn't need to
be rerun and all succeeded.
NOTE: Writing buildhistory

To  reproduce it, you need to have ptest in distro features but you
need to 'build' sed.

So you can do:

bitbake sed -c cleansstate ; bitbake sed

This should show off the warning.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

