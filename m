Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 18B8B6B8FE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 16:38:14 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id v10so3361289pde.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 08:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=jK8fdUpxTb7UNixySygWXyxWRjt+z3r4/xcE08+hPCc=;
	b=FkJz7JC5jEDfHCk1zt8ck6stD70jZwk8y3QfM2ng7XrTXHvAtXSCZiyxZTtJLtiLs+
	55hdS47pDWkeXhzUevRdspIsQ17LLTIKq0CA2UlNdmrdQz2WKq9qPKQ7jwdhsLOnlhW/
	1fwH8h13Vyz82WzLBqezFdjrctqla6Aiy0Ffki/oCmXfc2qikNS8PNdWIbSGlAxcGRAO
	U4XF9WvumVkJgvGLwlPwZZHft71Zw3KPP8xW2k3zsk5bKJ0c1S75euU+VwOsFBErw2CB
	8Cuw5jz/8ZOxXh7T/qPz8M8i7Ehsru3JISwIMjdc1zWIIGmCJFcOLMvkPIYzktih3Bka
	Hc7Q==
X-Gm-Message-State: ALoCoQmDul6AuRIlr6sA8PIBYNdD/Ylc/TYE41ruNpW8KmyjD65RGwOg0CeJbvpeTMsgERcSdQUV
MIME-Version: 1.0
X-Received: by 10.68.239.70 with SMTP id vq6mr4706563pbc.152.1389285495170;
	Thu, 09 Jan 2014 08:38:15 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.84.67 with HTTP; Thu, 9 Jan 2014 08:38:15 -0800 (PST)
In-Reply-To: <CAP9ODKr5ivPcDbKkfa1xSUx-qCRwFni7V+O83rWw=3J7O555_w@mail.gmail.com>
References: <1387889050-25592-1-git-send-email-lpapp@kde.org>
	<CAOMwXhOfJEkntBTQLDGWjRYA6jorCWNEUF1+t8n5RJJoozcVJA@mail.gmail.com>
	<52CB29BA.5050404@linux.intel.com>
	<CAP9ODKr5ivPcDbKkfa1xSUx-qCRwFni7V+O83rWw=3J7O555_w@mail.gmail.com>
Date: Thu, 9 Jan 2014 16:38:15 +0000
X-Google-Sender-Auth: vKBAJrOZwzkvOj4IhthU63FCilA
Message-ID: <CAOMwXhPC9j0fO65ks3r=MqpeKhbkqM7sK-Bk5wurM3yfs0=ydQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/patch.py: Prefer "git am" over "git apply" when applying git patches
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
X-List-Received-Date: Thu, 09 Jan 2014 16:38:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 7, 2014 at 11:46 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Mon, Jan 6, 2014 at 8:10 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 12/31/2013 06:18 AM, Laszlo Papp wrote:
>>>
>>> Ping?
>>>
>>> Alternatively, the system could also have an option for further
>>> fine-tuning what to do with git patches
>>>
>>> On Tue, Dec 24, 2013 at 12:44 PM, Laszlo Papp <lpapp@kde.org> wrote:
>>>>
>>>> It is better to use "git am" when possible to preserve the commit
>>>> messages and
>>>> the mail format in general for patches when those are present. A typical
>>>> use
>>>> case is when developers would like to keep the changes on top of the
>>>> latest
>>>> upstream, and they may occasionally need to rebase. This is not possible
>>>> with
>>>> "git diff" and "diff" generated patches.
>>>>
>>>> Since this is not always the case, the fallback would be the "git apply"
>>>> operation which is currently available.
>>>>
>> Looking at this, is it possible to detect a git patch and only then use git
>> am?  Since most of the patches carried in oe-core and other layers the 'git
>> am' will typically fail and increase the build time since it will have to
>> re-run the git apply, we don't want to had more forking and work in the main
>> hot path.
>>
>> I am not the expert in this, neither is RP, so maybe Chris can comment
>> further.
>
> I am not sure it'd buy us a lot trying to detect it; in fact using git
> am patches easy rework, rebase and upstreaming of those.

+1

> To detect it, we'd need to parse the file somehow and I am unsure it
> would be faster than just try to apply it.

Agree; it may even be slower. I think it could be separated out later
into a custom option if any performance issue comes up. IMO, it is a
reasonable assumption if the patchtool set is git, then it is a git
patch, not raw diff...

