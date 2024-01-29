Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F8AC47DB3
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 16:44:17 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.20398.1706546655512355399
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 08:44:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 40TGg1oM024198;
	Mon, 29 Jan 2024 10:42:01 -0600
Message-ID: <08217121-3007-4a2c-b8b9-3795ac983a95@kernel.crashing.org>
Date: Mon, 29 Jan 2024 10:42:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] classes/package_rpm: do not mangle filenames
 with % in them
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20240129115709.3517246-1-alex@linutronix.de>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20240129115709.3517246-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 16:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194466

Due to the RPM macro language, you can end up with something like this:

%define foo bar

(files section):

/path/dir/%foo

Then when the %files is parsed you end up with:

/path/dir/bar

The processing of the files says "well that doesn't exist, so I won't package it."


For RPM 5.... it was determined the only save way to prevent the expansion was 
that horrible set of components.  (And I mean HORRIBLE!)


So before this is removed, we really need someone to test the RPM 4.19 behavior 
and verify that it does NOT expand the '%" in ways that we don't want.

(the above was all from memory.  So there may have been other nuances involved.

If I remember correctly the preferred format for regular replacement macros 
should be "%{macro}".  But there are/were internals in place like sections 
heads, functional macros (like %configure) and similar that were used.


I wish I could remember the exact place this failed in the past, but that 
appears to be lost in time.  For all I know it was "/path/dir/foo %bar".  (Yes 
I've seen some horrible filenames in my time.

--Mark

On 1/29/24 5:57 AM, Alexander Kanavin wrote:
> This causes problems in rpm 4.19 packaging of recipes such as nodejs,
> and isn't actually necessary anymore (was added many years ago
> against rpm 5.x fork).
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/classes-global/package_rpm.bbclass | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
> index e0f4de42a15..767f1e21b6e 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -219,7 +219,6 @@ python write_specfile () {
>               path = rootpath.replace(walkpath, "")
>               if path.endswith("DEBIAN") or path.endswith("CONTROL"):
>                   continue
> -            path = path.replace("%", "%%%%%%%%")
>   
>               # Treat all symlinks to directories as normal files.
>               # os.walk() lists them as directories.
> @@ -238,7 +237,6 @@ python write_specfile () {
>                   for dir in dirs:
>                       if dir == "CONTROL" or dir == "DEBIAN":
>                           continue
> -                    dir = dir.replace("%", "%%%%%%%%")
>                       p = path + '/' + dir
>                       # All packages own the directories their files are in...
>                       target.append(get_attr(dir) + '%dir "' + p + '"')
> @@ -254,7 +252,6 @@ python write_specfile () {
>               for file in files:
>                   if file == "CONTROL" or file == "DEBIAN":
>                       continue
> -                file = file.replace("%", "%%%%%%%%")
>                   attr = get_attr(file)
>                   p = path + '/' + file
>                   if conffiles.count(p):
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194456): https://lists.openembedded.org/g/openembedded-core/message/194456
> Mute This Topic: https://lists.openembedded.org/mt/104029566/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

