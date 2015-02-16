Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8D2DB606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 00:30:15 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so22964673wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Feb 2015 16:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to:cc
	:message-id; bh=ycmUVoYTY6I7PuFvB5mTsnHQQsv8v7uPNGJGMTyVZos=;
	b=vmMLNNU+o73ofhp3guj1YMfXQqsuYkSLNZhKjhnpGaEr9soPr4hF+feCSE0SsmTzDg
	s/PuJAqY1vrFEFn3dDaSLCHOgeCIPnZLg8gR/iEKXVD9XxX5q7wnuqGT/JzLxRwgxSPw
	wq/tkY4E4499AupP4VzJgXBsniEjz9TxI3Ou1HpMUmdtwz+mewdC2ABWHZs3n+1MCuOX
	n3G0JmqhgHJdzU/25ZZ4lU8RAws3lbcZoLL2qnR3LrJlITb1RqFQSA7TZMQFfzhpP4fE
	HUScnAhHsndd2aPx9jCSCcnysE45kzuD0KQqGREK9lzzdTHxy4OKCFCAi4MTi5uPv5qm
	WNgQ==
X-Received: by 10.180.198.240 with SMTP id jf16mr41493941wic.27.1424046616725; 
	Sun, 15 Feb 2015 16:30:16 -0800 (PST)
Received: from [10.56.11.166] (089144213166.atnat0022.highway.a1.net.
	[89.144.213.166])
	by mx.google.com with ESMTPSA id kr5sm15425004wjc.1.2015.02.15.16.30.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Feb 2015 16:30:16 -0800 (PST)
User-Agent: K-9 Mail for Android
In-Reply-To: <CACS+7ZSzfPxwYc1ksmzLk-f5dOuk_Ng4WC8BWy03ofnAx1UUmA@mail.gmail.com>
References: <1421864706-26101-1-git-send-email-paul.gortmaker@windriver.com>
	<CACS+7ZSzfPxwYc1ksmzLk-f5dOuk_Ng4WC8BWy03ofnAx1UUmA@mail.gmail.com>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Mon, 16 Feb 2015 01:30:10 +0100
To: Dan McGregor <danismostlikely@gmail.com>,
	Paul Gortmaker <paul.gortmaker@windriver.com>
Message-ID: <26C7A0BC-FE5A-4694-8AFD-DCD20DE1A83A@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files/profile: change EDITOR to not be busybox specific
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
X-List-Received-Date: Mon, 16 Feb 2015 00:30:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On January 21, 2015 8:29:23 PM GMT+01:00, Dan McGregor <danismostlikely@gmail.com> wrote:
>On 21 January 2015 at 12:25, Paul Gortmaker
><paul.gortmaker@windriver.com> wrote:
>> Setting "EDITOR=/bin/vi" breaks on non-busybox systems, as
>> vim will populate /usr/bin/vi instead, and you get stuff like:
>>
>>   op3:~/poky/meta-builder$ git commit -s
>>   error: cannot run /bin/vi: No such file or directory
>>   error: unable to start editor '/bin/vi'
>>   Please supply the message using either -m or -F option.
>>   op3:~/poky/meta-builder$ which vi
>>   /usr/bin/vi
>>   op3:~/poky/meta-builder$
>>
>> Since we've already specified a proper path above in the profile,
>> we've no need to call out where in the path vi lives, and hence
>> this will work with busybox and a full vim install w/o busybox.
>>
>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>> ---
>>  meta/recipes-core/base-files/base-files/profile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/base-files/base-files/profile
>b/meta/recipes-core/base-files/base-files/profile
>> index 88ab8d877b0d..53c2680409dd 100644
>> --- a/meta/recipes-core/base-files/base-files/profile
>> +++ b/meta/recipes-core/base-files/base-files/profile
>> @@ -2,7 +2,7 @@
>>  # and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
>>
>>  PATH="/usr/local/bin:/usr/bin:/bin"
>> -EDITOR="/bin/vi"                       # needed for packages like
>cron
>> +EDITOR="vi"                    # needed for packages like cron,
>git-commit
>>  test -z "$TERM" && TERM="vt100"        # Basic terminal capab. For
>screen etc.
>>
>>  if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
>
>While I agree with this change, arguably busybox should also be
>changed. Everywhere I look "vi" lives in /usr/bin. FreeBSD, NetBSD,
>Ubuntu, and Slackware all seem to put vi in /usr/bin.
>
>The same is true of getopt.

Yea. 

http://lists.busybox.net/pipermail/busybox/2012-June/078020.html

And we should run that again nowadays, obviously.
Perhaps fedora fixed their layout in the meantime?
Can anyone check on a current fedora, please?

Thanks,


