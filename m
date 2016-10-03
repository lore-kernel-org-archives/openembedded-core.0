Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C197D719AC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 06:41:43 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b201so7916880wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2016 23:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8wIgPo3a8QLc+Lii9U+JwmKK0NwQIPyYynixH0+oOZc=;
	b=vsIURtNRq1M7gwa2X4CjF+6I4mHmeI46zgsiFh33u86Ky7EBBEBZEaL1RbCtwo3hwV
	RCAddnuEHZO4FXDJTpIFFgbgl0X54WuOqysUgdGqafC0dX6YyIwZkUhQxh+41XGvwln2
	LSuwRR296XIZKq3q2mRPXR3DA9J+M4v8OURy6uAd5LSNRfBbiZS8tSBj1UPFs3eV/C2z
	MC3yf4SoNYDUA2b3Son93o7zW8O/65kg+GAKmoAKme4GIcBuIasEmHoO165vLNua0bYM
	ZJFb86q4cWHdIF6gJvNDSAiMpUv83MgFzdNWF/aW1xUDsoVAHa+cd4lJwdtzs4tTP85B
	KYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8wIgPo3a8QLc+Lii9U+JwmKK0NwQIPyYynixH0+oOZc=;
	b=f/ZKK8Du0RE42oS2wlEBEssvl1asNqSsbp0dz9UJP52ToKu2cVV2/ftg8BJ+tMdj1B
	s8jtBT7SGMG4mDgqca/zvRqRF39vJYDpQG7b6RpLZ17GxZPmBUXX5frS0D/bWR+egqC/
	Av2m00h08HfZJTOZzSlI/SkGgGQfiAhswHjf2p7PF3l0DE1cFzgMqhNuqY40/G0AL8g6
	LvztcX/4nerh33a1z4/QF0lIY15rRfvs9yBOvkci8V30jtdLrUQDaV89tOXxluuan2/J
	QiYPOWMOTudDBW2EC2qM9pY8eEc5jfgooaNfLZJ+NgykFYzJsYFgsKX94i7mS/KlFe4M
	mwog==
X-Gm-Message-State: AA6/9RmiQ4w0xOC3wxeKRl0V+qxTJYUX/3edMJ/0bB0xh/5JPy0/eXQSP5opwl5DOKvOmse1cz8kL87gIF8P2A==
X-Received: by 10.28.134.136 with SMTP id i130mr8964527wmd.76.1475476905032;
	Sun, 02 Oct 2016 23:41:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.155.103 with HTTP; Sun, 2 Oct 2016 23:41:44 -0700 (PDT)
In-Reply-To: <C620C32B-A94F-431D-936D-B07D55673384@gmail.com>
References: <1473711245-24377-1-git-send-email-armccurdy@gmail.com>
	<C620C32B-A94F-431D-936D-B07D55673384@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sun, 2 Oct 2016 23:41:44 -0700
Message-ID: <CAJ86T=XHwvTiizexmGZP73CA+CGAxbosp8OuPbPoHi9AK_cYFQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] makedevs: don't restrict device node paths to 40 characters
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
X-List-Received-Date: Mon, 03 Oct 2016 06:41:46 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 2, 2016 at 1:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Sep 12, 2016, at 1:14 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> 40 character paths work OK for device nodes in /dev but not for
>> device nodes created in a chroot, LXC container, etc.
>>
>> Since the 'path' array is already a 4k buffer, the sscanf 40
>> character limit seems to be a typo or historical mis-merge. Update
>> the sscanf limit and bring the code in sync with the Buildroot
>> version:
>>
>>  https://git.buildroot.net/buildroot/commit/?id=8876b6751e0bc19a3754290061808f0f8420708e
>
> what is upstream worthiness of this patch ? it seems it could be
> a good change

Where is the upstream?

>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>> meta/recipes-devtools/makedevs/makedevs/makedevs.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/makedevs/makedevs/makedevs.c b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
>> index 7471f3f..cba7681 100644
>> --- a/meta/recipes-devtools/makedevs/makedevs/makedevs.c
>> +++ b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
>> @@ -360,7 +360,7 @@ static int interpret_table_entry(char *line)
>>       unsigned long mode = 0755, uid = 0, gid = 0, major = 0, minor = 0;
>>       unsigned long start = 0, increment = 1, count = 0;
>>
>> -     if (0 > sscanf(line, "%40s %c %lo %40s %40s %lu %lu %lu %lu %lu", path,
>> +     if (0 > sscanf(line, "%4095s %c %lo %40s %40s %lu %lu %lu %lu %lu", path,
>>                   &type, &mode, usr_buf, grp_buf, &major, &minor, &start,
>>                   &increment, &count))
>>       {
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

