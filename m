Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 989016F626
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 10:10:30 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id as1so2318845iec.31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6t0R5dRLfxa6o+HpJtozfpLvwwQjDPv2om3lozmOVlY=;
	b=Lch0q8wirWjwL1xsTUTGc47Rx/ykerJDlH2TB41LiQiBE8hjMFPhlTO+8W3sl28K8F
	yiP/b4zAD2+SbTmBPWVWc47tNxu9mH4UU9b3jNbZhQZjsUrkty1fFNH12PLoceriSyVE
	PZUkkwjcOB0TeXFuIjb31lsqU9L4Dx6U5h4iv9TLbFKC27M3l1IwnTQ3wuTVHWWcJ340
	m6O3sJ6Ten/9O3ZqQJMPsvpNHkO7cLbYSXUZWf88KQDiK02bZ1ha7WgPJETOHTWSl9YN
	pF2XNYvRrD5QKXKPUd8nCHy8wdembRdWvz9891qqLxlYwBdZpcsVr61PY73avFW/Zwhd
	xWRQ==
X-Received: by 10.50.60.103 with SMTP id g7mr6715846igr.20.1394791831195; Fri,
	14 Mar 2014 03:10:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Fri, 14 Mar 2014 03:10:00 -0700 (PDT)
In-Reply-To: <5322B25F.7040301@linux.intel.com>
References: <1394710133-18659-1-git-send-email-valentin.popa@intel.com>
	<5322B25F.7040301@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Mar 2014 03:10:00 -0700
Message-ID: <CAMKF1sp_HEF+er0z-S5DPgYKirmxGgP5m0vrsvZC9UuaYL-3-A@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Set ac_cv_sizeof_ssize_t
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
X-List-Received-Date: Fri, 14 Mar 2014 10:10:37 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 14, 2014 at 12:40 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 03/13/2014 04:28 AM, Valentin Popa wrote:
>>
>> Set ac_cv_sizeof_ssize_t for mips64;
>> mips-common will not overwrite it.
>>
>
> This really needed a little more about "why" this change is needed.
>

ssize_t is a posix define which is architecture specific whose value
is signed size_t, glibc/uclibc for mips64/n64 linux platform defines
it to be equivalent of 'long' and long here is 8bytes because
mips64/n64 follows LP64 model. In OpenEmbedded our default ABI for
mips64 platforms is N64, having said that autoconf decides to poke at
the platform for finding these kind of sizes which fails when you are
doing cross compiling hence we have to cache it.

> Sau!
>
>
>> [YOCTO #5935]
>>
>> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
>> ---
>>   meta/site/mips64-linux | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/site/mips64-linux b/meta/site/mips64-linux
>> index 4449c96..ed0fbbe 100644
>> --- a/meta/site/mips64-linux
>> +++ b/meta/site/mips64-linux
>> @@ -35,6 +35,7 @@
>> glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
>>   ac_cv_alignof_guint32=4
>>   ac_cv_alignof_guint64=8
>>   ac_cv_alignof_unsigned_long=8
>> +ac_cv_sizeof_ssize_t=8
>>
>>   # libpcap
>>   ac_cv_linux_vers=${ac_cv_linux_vers=2}
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

