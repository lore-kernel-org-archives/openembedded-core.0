Return-Path: <matt@madison.systems>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0B26D65CBB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 14:19:36 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id u64so51706919lff.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 07:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=0fqwQ17uWgywwcbDSe1uM/rMIsq8/VN47/AZ4PPHdSc=;
	b=1/2lfrvOLnt8+p1gGOkzhHUJKbpA1olSYQhB7XeuG7uJHNu5eNMLD5V0jE0Xz1v9Y3
	tUKSKVszmqFN7rnedwLotaKgd/8aOD1Qv8V/5srP8XNvezWVNSDIue+k8NSnU8KUDYl/
	0+Qr8SW4AKOoSlaep4J4zQT8jsblwRquRpvKwtwt3ew5St6qiIOf1RAkRLwDyhiED71m
	RG/EwyL01bMo8P0n9+AAJwFZzNeB0l2tkdiLP7V/3HvUc6qqvyrkj5BzlOeycJJANXGG
	8SRzYLlgxZV+R2+QZdpscKB5faCYsl/W/4wMzDmLdyYIRjQzBiM9x+hUfOKFRUI1I3GY
	xXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=0fqwQ17uWgywwcbDSe1uM/rMIsq8/VN47/AZ4PPHdSc=;
	b=AVs+U+xExslS01lZ8ivA/0n6G1bGXi7KyL1v10cDjWzh+o/7ZTq0Fpt7leQpSfKJOy
	Slbiea/CjHfmwJCHINOh7zo0KMU1fpieZNYGzGLaXRzfl6KMzCDwVPpliSLkBqHZJgDC
	+aEPshGcZo5XVpRzuvm68NwYoCWDrIZGZebEH14YMHeKD+5hxTmsyBy8k8l5o7U6HIGQ
	VJ9RaaySYYiHMSXWU+PYoHoxITmvAzxJub2/akWZrnIZV7lfb1dfS9wyaXt4wLj3H95s
	C4AldU+HRoKajtsLsCjdjnWzb+Qhbaq30+mTERk8TsKjuuzyk9mSHjxWaWWyd8kTv9k4
	p5GQ==
X-Gm-Message-State: AOPr4FXkpvmzPpElHWrh0qp+oy0q0bAvW2fGH6mc53tcEWl5djd8QwrKa4C3AdqJN8w2EC29A3pxwviqSCgffA==
MIME-Version: 1.0
X-Received: by 10.25.163.211 with SMTP id m202mr3150843lfe.73.1461766776169;
	Wed, 27 Apr 2016 07:19:36 -0700 (PDT)
Received: by 10.25.31.131 with HTTP; Wed, 27 Apr 2016 07:19:36 -0700 (PDT)
In-Reply-To: <1461762212.31320.182.camel@linuxfoundation.org>
References: <1461760323-27285-1-git-send-email-matt@madison.systems>
	<1461760323-27285-2-git-send-email-matt@madison.systems>
	<1461762212.31320.182.camel@linuxfoundation.org>
Date: Wed, 27 Apr 2016 07:19:36 -0700
Message-ID: <CAGgRHJohN6OXYd8hSSiAChMaCxiaFmu=cXiYP+EK9RV6GMmj8A@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] image.bbclass: don't expand IMAGE_CMD when setting do_image task
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
X-List-Received-Date: Wed, 27 Apr 2016 14:19:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 27, 2016 at 6:03 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2016-04-27 at 05:32 -0700, Matt Madison wrote:
>> Expanding it causes the do_image_x function to include values of
>> variables that may contain date/time stamps, rather than references
>> to the variable names, leading to spurious taskhash mismatch errors.
>>
>> Signed-off-by: Matt Madison <matt@madison.systems>
>> ---
>>  meta/classes/image.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 8bfd241..d695d30 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -380,7 +380,7 @@ python () {
>>          localdata.delVar('DATETIME')
>>          localdata.delVar('TMPDIR')
>>
>> -        image_cmd = localdata.getVar("IMAGE_CMD", True)
>> +        image_cmd = localdata.getVar("IMAGE_CMD", False)
>>          vardeps.add('IMAGE_CMD_' + realt)
>>          if image_cmd:
>>              cmds.append("\t" + image_cmd)
>
> You can't do this since there are some variables that need to be
> expanded using the values from the current localdata copy of the data
> store (such as the type variable).
>
> We'd previously tried to avoid DATETIME contanination by removing the
> problem bases with the delVar calls just above this.

Rats.  That approach isn't working, at least for me - the recursive
expansion is causing the values of the date/time sensitive variables
to be present in the value of the IMAGE_CMD_type variable, so that
variable changes with each expansion.  I've hacked around the problem
by avoiding direct references to any variable that depends directly or
indirectly on ${DATETIME}, but I was really hoping for something
cleaner.

There are other variables that can cause this, too - ${DATE} and
${TIME} by themselves, for example, which aren't deleted.

Thanks,
-Matt

>
> Cheers,
>
> Richard

