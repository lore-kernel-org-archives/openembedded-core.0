Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id C685776D96
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 03:28:23 +0000 (UTC)
Received: by iofe124 with SMTP id e124so14417315iof.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 20:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EsH3txFULT6qv23c8U+q9lrmGin32kM1AkXdkrvPJGY=;
	b=Dw6Q5iOF+qgSP5noDRFIbNAVgesTDCD1I/f5ztDnMRVSa9ArLx6dgUakqMTHzphlBE
	zEU1Le0XHOZpTboLTs6brZeaPAZGWDmN38psLRL49o8Ok1Fusoz0A8Y0VABeSoKp8Omb
	Jytv9OJpGfKV+zAJMPOM+N75rpxqKL4KwZNJgS7gQ8NwxCtiBmlPgJZ11nLh+E/2dr7u
	M8ncYX5klHTP3PdkhX69R1/4YLegzEfOragfCJ9fXeuUO5aWzax1fduSy2hObpO+u2By
	3PH9wkxtTuFXdaWtqjakY0QXNZH7uWMOL1ZEi3wQzAkZjKG0PRyGJuUPMpkr387vDSMt
	qXMA==
X-Received: by 10.107.35.195 with SMTP id j186mr11673743ioj.49.1440732503010; 
	Thu, 27 Aug 2015 20:28:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.135 with HTTP; Thu, 27 Aug 2015 20:27:53 -0700 (PDT)
In-Reply-To: <55DFD2BC.7070405@windriver.com>
References: <1440731387-19733-1-git-send-email-Randy.MacLeod@windriver.com>
	<55DFD2BC.7070405@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Aug 2015 20:27:53 -0700
Message-ID: <CAMKF1sqfoWLWxvEGbo_fLHjZOd2au=YAC-Hx4z8JJ=tNQoZfBg@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-source: exlude from world
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
X-List-Received-Date: Fri, 28 Aug 2015 03:28:24 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 27, 2015 at 8:17 PM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> I've sent the parent email to fix
> $ bitbake -c <stage> world.
> I've confirmed that my change works for:
> $ bitbake -c configure world
>
> I wasn't sure if I should leave gcc-source as
> is or change it to be similar to kernel-devsrc
> because meta/recipes-devtools/gcc/gcc-source.inc does:
>
> deltask do_configure
> deltask do_compile
> deltask do_package

if a task is deleted and you do -c <that-task> then you should get an
error. deltask would create no stamps as opposed to noop tasks. May be
it can be turned into warning ( not convinced for that too)
but excluding it world doesn't sound a good solution here.

> ...
>
> whereas meta/recipes-kernel/linux/kernel-devsrc.bb does:
> # There's nothing to do here, except install the source where we can package
> it
> do_fetch[noexec] = "1"
> do_unpack[noexec] = "1"
> do_patch[noexec] = "1"
> ...
>
> The kernel-devsrc approach doesn't break world builds
> but it's probably slightly less efficient.
>
> Also do people care about consistency in naming:
>   gcc-source.inc vs
>   kernel-devsrc.bb
> ? There are only two such 'source' packages so it's not a big deal.
>
> ../Randy
>
>
>
> On 2015-08-27 11:09 PM, Randy MacLeod wrote:
>>
>> Exclude all versions of gcc-source from world builds so that:
>>     bitbake -c <stage> world
>> will work. gcc-source deletes most bitbake build stages
>> since it is a source-only package.
>>
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-source_4.8.bb | 2 ++
>>   meta/recipes-devtools/gcc/gcc-source_4.9.bb | 2 ++
>>   meta/recipes-devtools/gcc/gcc-source_5.2.bb | 2 ++
>>   3 files changed, 6 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-source_4.8.bb
>> b/meta/recipes-devtools/gcc/gcc-source_4.8.bb
>> index 234b82e..b890fa3 100644
>> --- a/meta/recipes-devtools/gcc/gcc-source_4.8.bb
>> +++ b/meta/recipes-devtools/gcc/gcc-source_4.8.bb
>> @@ -1,2 +1,4 @@
>>   require recipes-devtools/gcc/gcc-${PV}.inc
>>   require recipes-devtools/gcc/gcc-source.inc
>> +
>> +EXCLUDE_FROM_WORLD = "1"
>> diff --git a/meta/recipes-devtools/gcc/gcc-source_4.9.bb
>> b/meta/recipes-devtools/gcc/gcc-source_4.9.bb
>> index 234b82e..b890fa3 100644
>> --- a/meta/recipes-devtools/gcc/gcc-source_4.9.bb
>> +++ b/meta/recipes-devtools/gcc/gcc-source_4.9.bb
>> @@ -1,2 +1,4 @@
>>   require recipes-devtools/gcc/gcc-${PV}.inc
>>   require recipes-devtools/gcc/gcc-source.inc
>> +
>> +EXCLUDE_FROM_WORLD = "1"
>> diff --git a/meta/recipes-devtools/gcc/gcc-source_5.2.bb
>> b/meta/recipes-devtools/gcc/gcc-source_5.2.bb
>> index 234b82e..b890fa3 100644
>> --- a/meta/recipes-devtools/gcc/gcc-source_5.2.bb
>> +++ b/meta/recipes-devtools/gcc/gcc-source_5.2.bb
>> @@ -1,2 +1,4 @@
>>   require recipes-devtools/gcc/gcc-${PV}.inc
>>   require recipes-devtools/gcc/gcc-source.inc
>> +
>> +EXCLUDE_FROM_WORLD = "1"
>>
>
>
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, Canada,
> K2K 2W5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

