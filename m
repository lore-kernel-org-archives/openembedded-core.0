Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 25AA0738B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 07:18:44 +0000 (UTC)
Received: by ykp9 with SMTP id 9so6520950ykp.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 00:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=4nbyMjUYsZae4bUOsovBoqGG04xzo5CiUPTkVsDBHp0=;
	b=mZRf5BaNMsSwRTecDfWVkhOiVgAe0rH0PYVY1RA8vvx6Nxh31L8W+YyY9IaG99sUKX
	YN5H+47istXm7dIyC8RSrLTPDRwGMtjk2vRid33X3lNEy3LI3SCbH5Y6wd8hjMU9VKkG
	XkxPu5ON5JDZjc2bVsBTnvG7ZlPfWlwunJE/GplRe4gZuFMNLh1vq9r1rN6GVSGo8UTM
	nFCEG9Z/sfa+ZWM2Xv2QQPKykfLEkz06Q3iml+W+2+at9miYGD5iwfZA0LL/Q5EqDMad
	TJFsDUPt5ipjtngPQ1KDig2D8PeoCJQK2YGTv7074dQSWr9KSO8mY3TCro7RMlLD/n1M
	ZeZA==
MIME-Version: 1.0
X-Received: by 10.236.229.200 with SMTP id h68mr41197250yhq.90.1426144725471; 
	Thu, 12 Mar 2015 00:18:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.71 with HTTP; Thu, 12 Mar 2015 00:18:45 -0700 (PDT)
In-Reply-To: <13FDACD4-FC30-49CD-AC52-9D614F407C5D@gmail.com>
References: <1426109339-12975-1-git-send-email-randy.e.witt@linux.intel.com>
	<13FDACD4-FC30-49CD-AC52-9D614F407C5D@gmail.com>
Date: Thu, 12 Mar 2015 04:18:45 -0300
X-Google-Sender-Auth: AtPRl-YUuqqakBhWuzs6p9QLutA
Message-ID: <CAP9ODKqBs7sqNMrTESE_fiNfnRO3jLYTDoUkE4twwgczSU=L2g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Instruct the journal to always be volatile
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
X-List-Received-Date: Thu, 12 Mar 2015 07:18:46 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 12, 2015 at 12:09 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mar 11, 2015, at 2:28 PM, Randy Witt <randy.e.witt@linux.intel.com> wrote:
>>
>> When the storage mode for the journal is "auto" if /var/log/journal
>> exists then the journal will flush to /var/log/journal assuming that
>> /var/log/journal is persistent.
>>
>> However /var/log -> /var/volatile/log in poky, so even though
>> /var/log/journal exists, it is still volatile.
>>
>> Since this can cause ordering issues due to /var/volatile needing to be mounted before the journal actually writes to it, just specify that the journal
>> should always be volatile and never try to write to "persistent"
>> storage. The journal will exist in /run/log/journal only.
>>
>> This also disables the "After" of the journal on var-volatile.mount
>> since the ordering is no longer necessary when the journal is only
>> stored in /run/log/journal.
>>
>> [Yocto #7388]
>
>
> This is not right. What if I want persistent logs.? the options is just gone. Both cases should work. /var/volatile should only be used
> when doing ro-rfs its not FHS specified anyway. Lets not go with this patch.

Agreed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

