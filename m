Return-Path: <net147@gmail.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2E376EBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 14:05:10 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id n143so8160986ita.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 07:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eZv7o3i+URJ3mcuDCMp5zdW5AH1eJpVCFwoprUsub2w=;
	b=UEbhigi5DSu1n/WPMu4b5QuOZuid3BaPZrNV/P7bGy8mqYsyUkegQBdnWC/n1MP8x2
	JfBVyAjo8rtiJg/B6D1jTAlWIG2WEvv1hWpDZ7XALBKAK6z9/3GQW5zvT/oDhPrxP+Qn
	YkHvUKsbp53dnV+se8lfuc+GTu8MstwCWeYJUbHgAdcCB/n6iHwRni4yoggn6bkYM26e
	Cs9jn98Y9pKr9zSjPFjKX8F9p6RDuI8rXxhRCPdLUGYWKcjsUFZeImf50KK6O+xfA2LK
	ZI7/6JCMwmACMgOnHIfKFrK/TAmDV9awMGInCK29PkxuDWmcCjiwHbfKpqiE8+Lbmk8d
	jx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eZv7o3i+URJ3mcuDCMp5zdW5AH1eJpVCFwoprUsub2w=;
	b=Xj24fLyXiTCFp3u/nz0Gv3VzPSvfT/VC74RCzEoUgVl0MLFPMGynSmiqbvHRgcm5gZ
	ru8wuLLObt1X+vO1MYEYn5IzoDd5WIDX0HmYE2ng/WlsEBVQGeg77rLlh7Fp//xwEtC3
	tu4X1LRTDxhFoqsoIVLlBvf5PTAAsHN+THMXLWjoSHcsrXiK/1Tlf7tsSQQEbGCvx3xg
	i0FP/kljjZNRGPYsEg3+tnXrP1LbhOHFn+tpaPfqk4QZp70xOHYV533fU0jm2oZDgU6u
	jrVaHPEZX2b78ccDngeaFIpxx0cu/R32ph0PJNXjYtmR8+D5bXPc6W6KywBfIDQMjVkQ
	yNEA==
X-Gm-Message-State: AE9vXwNyEuYqAPYMhnALxcqpbc6See3Xc+l11e+5FItulpvBo6uZwiTnayNRbiKls1iXF7WifEOV5IEsULTOng==
X-Received: by 10.157.29.102 with SMTP id m93mr24102600otm.27.1473689110715;
	Mon, 12 Sep 2016 07:05:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.60.73 with HTTP; Mon, 12 Sep 2016 07:05:10 -0700 (PDT)
In-Reply-To: <1473675573.20226.364.camel@linuxfoundation.org>
References: <20160911121416.31304-1-net147@gmail.com>
	<1473675573.20226.364.camel@linuxfoundation.org>
From: Jonathan Liu <net147@gmail.com>
Date: Tue, 13 Sep 2016 00:05:10 +1000
Message-ID: <CANwerB1hTME1C=F+BA=xAC7Zx+mFP79EOTnw+HmUyi4Z6b6S7Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: Do not expand variables in IMAGE_CMD vardepsexclude
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
X-List-Received-Date: Mon, 12 Sep 2016 14:05:12 -0000
Content-Type: text/plain; charset=UTF-8

Hi Richard,

On 12 September 2016 at 20:19, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2016-09-11 at 22:14 +1000, Jonathan Liu wrote:
>> This fixes tashhash mismatch errors creating images when IMAGE_CMD
>> references a variable whose value is always changing even though the
>> variable is specified in IMAGE_CMD vardepsexclude.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>  meta/classes/image.bbclass | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 8c8b8a2..f85ea86 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -441,6 +441,10 @@ python () {
>>          localdata.delVar('DATETIME')
>>          localdata.delVar('TMPDIR')
>>
>> +        vardepsexclude = d.getVarFlag('IMAGE_CMD', 'vardepsexclude',
>> True) or ''
>> +        vardepsexclude += ' ' + (d.getVarFlag('IMAGE_CMD_' + realt,
>> 'vardepsexclude', True) or '')
>> +        for var in vardepsexclude.split():
>> +            localdata.delVar(var)
>>          image_cmd = localdata.getVar("IMAGE_CMD", True)
>>          vardeps.add('IMAGE_CMD_' + realt)
>>          if image_cmd:
>
> I think this is complicating an already fragile situation and it
> worries me. Can you be more specific about which variable is causing
> problems here?

See IMAGEDATESTAMP variable in:
https://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/tree/classes/sdcard_image-rpi.bbclass
https://github.com/linux-sunxi/meta-sunxi/blob/master/classes/sdcard_image-sunxi.bbclass

You can test by changing to:
IMAGEDATESTAMP = "${@time.clock()}"

>
> I'm starting to wonder if we should have an explicit flag set here for
> "problem" variables and we'd default to the values "DATETIME TMPDIR"
> which are already handled in the code. You'd then just need to extend
> that value. Using vardepsexclude seems to partially but not completely
> match?
>
> Incidentally, I really want to complete some of the rework in this area
> so we get to "proper" functions and can stop playing games like this. I
> just haven't had the time to do that and this point in the release
> cycle isn't the right time to do that.
>
> Cheers,
>
> Richard
>
>

Regards,
Jonathan

