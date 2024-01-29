Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FA2C47DDB
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 18:43:06 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.3136.1706553779181422490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 10:42:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 40TIgvLr031284
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 12:42:58 -0600
Message-ID: <b24c0fe2-39e4-4ed3-9ffe-57d40e52070a@kernel.crashing.org>
Date: Mon, 29 Jan 2024 12:42:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] classes/package_rpm: correctly escape percent
 characters
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20240129180629.1631473-1-alex@linutronix.de>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20240129180629.1631473-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 18:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194479

This looks better to me.  Hopefully two % is all we need now.

Thanks!
--Mark

On 1/29/24 12:06 PM, Alexander Kanavin wrote:
> This many characters doesn't work with rpm 4.19 packaging
> (as shown by nodejs recipes), and per documentation a single escape
> is enough:
> 
> https://github.com/rpm-software-management/rpm/blob/rpm-4.19.x/docs/manual/spec.md#shell-globbing
> 
> It also should be done in a function, and just before writing out the
> corrected filename to .spec, not earlier where the path may still
> be needed for file operations (such as gettings file attributes).
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/classes-global/package_rpm.bbclass | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
> index e0f4de42a15..819ee502783 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -216,10 +216,12 @@ python write_specfile () {
>                       raise e
>                   return "%attr({:o},{},{}) ".format(mode, owner, group)
>   
> +            def escape_chars(p):
> +                return p.replace("%", "%%")
> +
>               path = rootpath.replace(walkpath, "")
>               if path.endswith("DEBIAN") or path.endswith("CONTROL"):
>                   continue
> -            path = path.replace("%", "%%%%%%%%")
>   
>               # Treat all symlinks to directories as normal files.
>               # os.walk() lists them as directories.
> @@ -238,29 +240,27 @@ python write_specfile () {
>                   for dir in dirs:
>                       if dir == "CONTROL" or dir == "DEBIAN":
>                           continue
> -                    dir = dir.replace("%", "%%%%%%%%")
>                       p = path + '/' + dir
>                       # All packages own the directories their files are in...
> -                    target.append(get_attr(dir) + '%dir "' + p + '"')
> +                    target.append(get_attr(dir) + '%dir "' + escape_chars(p) + '"')
>               else:
>                   # packages own only empty directories or explict directory.
>                   # This will prevent the overlapping of security permission.
>                   attr = get_attr(path)
>                   if path and not files and not dirs:
> -                    target.append(attr + '%dir "' + path + '"')
> +                    target.append(attr + '%dir "' + escape_chars(path) + '"')
>                   elif path and path in dirfiles:
> -                    target.append(attr + '%dir "' + path + '"')
> +                    target.append(attr + '%dir "' + escape_chars(path) + '"')
>   
>               for file in files:
>                   if file == "CONTROL" or file == "DEBIAN":
>                       continue
> -                file = file.replace("%", "%%%%%%%%")
>                   attr = get_attr(file)
>                   p = path + '/' + file
>                   if conffiles.count(p):
> -                    target.append(attr + '%config "' + p + '"')
> +                    target.append(attr + '%config "' + escape_chars(p) + '"')
>                   else:
> -                    target.append(attr + '"' + p + '"')
> +                    target.append(attr + '"' + escape_chars(p) + '"')
>   
>       # Prevent the prerm/postrm scripts from being run during an upgrade
>       def wrap_uninstall(scriptvar):
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194473): https://lists.openembedded.org/g/openembedded-core/message/194473
> Mute This Topic: https://lists.openembedded.org/mt/104036885/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

