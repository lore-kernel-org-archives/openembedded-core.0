Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id D274B76599
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 01:14:01 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so43009636wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 18:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=F1iLgl80COHARbId4mDkjO5LQoKXlghXoY8D8iDqJh8=;
	b=CirRs+qtK0HWwMmB9Uq91duwCPRJR9GibXGrvBCBx52ZJtIkA83Gz0t6q05tw2or0e
	tkNpVsqS1FfsFkYQmwBX2JFxPnVEkIRjvUQiW9S34qMDeUxiCTIhfcvSphVzActOLQlA
	7xb6LfpLuroBqNzkmY1RzxS4FPcTGozslwl7A9JCiQwsi33fyJYJTxPgSZyl8ZHzZggf
	qG9OHJ5TUQROMXIYzz6t8bvJyxKo/+dqLRws0Tgkxo1bvH9D1oDHfu1lnU4EwpK1wPMd
	STqNwn5o4PeFx8Y4xhMI/8Ewrtn7V3itp+7PVbryMKp+vb+JdZ37hVEZ9Fs13YJqOeCy
	AVxQ==
MIME-Version: 1.0
X-Received: by 10.180.206.211 with SMTP id lq19mr756167wic.81.1438910041201;
	Thu, 06 Aug 2015 18:14:01 -0700 (PDT)
Received: by 10.194.236.166 with HTTP; Thu, 6 Aug 2015 18:14:01 -0700 (PDT)
In-Reply-To: <1438902142.30467.23.camel@linuxfoundation.org>
References: <1438890086-2710-1-git-send-email-armccurdy@gmail.com>
	<1438890086-2710-4-git-send-email-armccurdy@gmail.com>
	<1438902142.30467.23.camel@linuxfoundation.org>
Date: Thu, 6 Aug 2015 18:14:01 -0700
Message-ID: <CAJ86T=VLSdzHw5aCo=eHM=OK+uia9hPxKdf2uRNi6NmVspocaA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] uclibc.inc: avoid immediate expansion for UCLIBC_EXTRA_CFLAGS
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
X-List-Received-Date: Fri, 07 Aug 2015 01:14:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 6, 2015 at 4:02 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2015-08-06 at 12:41 -0700, Andre McCurdy wrote:
>> If immediate variable expansion is used, then UCLIBC_EXTRA_CFLAGS can
>> sometimes be derived from a partially expanded value of CFLAGS.
>>
>> One specific problem case occurs when security_flags.inc is used: CFLAGS
>> is evaluated before the SECURITY_CFLAGS_pn-uclibc over-ride has been
>> applied and therefore UCLIBC_EXTRA_CFLAGS ends up being based on the
>> default SECURITY_CFLAGS instead of the uclibc specific value.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-core/uclibc/uclibc.inc | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
>> index c483228..3ed8b60 100644
>> --- a/meta/recipes-core/uclibc/uclibc.inc
>> +++ b/meta/recipes-core/uclibc/uclibc.inc
>> @@ -57,8 +57,8 @@ export V="2"
>>  # -O<n> -fno-omit-frame-pointer ends up with GCC ICE on thumb as reported
>>  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44860
>>  #
>> -CFLAGS_arm := "${@oe_filter_out('-fno-omit-frame-pointer', '${CFLAGS}', d)}"
>> -UCLIBC_EXTRA_CFLAGS  := "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
>> +CFLAGS_arm = "${@oe_filter_out('-fno-omit-frame-pointer', '${CFLAGS}', d)}"
>
> I'm rather surprised we don't get circular references without the :=
> operator with this. I suspect we can see build failures if you change
> the code like this. That said, I've been meaning to go through and
> replace all the uses of oe_filter_out with the remove operator. Can we
> do that here please instead?
>
> E.g:
> CFLAGS_remove_arm = "-fno-omit-frame-pointer"

OK, new patch on the way.

>> +UCLIBC_EXTRA_CFLAGS = "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"

Is it OK to keep using oe_filter_out() here to support the regex?

> Cheers,
>
> Richard
>
>

