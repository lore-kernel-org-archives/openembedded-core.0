Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1398260EA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 11:54:22 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id aq17so6383761iec.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 04:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=jGzTxH7n505Kt9iGg46QpB49TI9+qjmXb4iY/FRW9Cc=;
	b=RorB7iIEUGXo12sf2qhfzUSLRFXs4FY4nEyUM4u2mlCraP8oVNiWmLPmV+bgVxe2LN
	NBnsp+VQKSZEG3muWpyihi/zINE2DrDZxXJDPGlmVw2B9BvOkA8YrmO2BMfl5ldFSocI
	RDVhHx3Tb2/ippFCwkZLd+baLYXOCzAbFmZ604nLN2Z1m4RF3VrifX020XH/fKTaDTeN
	E5NDTvigNyMJpHTzEnTIE2N1CN94f51apqoNmiCpLATUvqZ1sucmx0ZsgeDDleYWs42I
	2xA3hl9AVer/5BbUhWC0DUTVpv+Yc8oF3CaEqCu52OiUd3FGc1swHGey5HkEbnC2Qwru
	lrqA==
MIME-Version: 1.0
X-Received: by 10.50.114.168 with SMTP id jh8mr2425977igb.6.1381492463601;
	Fri, 11 Oct 2013 04:54:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Fri, 11 Oct 2013 04:54:23 -0700 (PDT)
In-Reply-To: <1381479495.29912.98.camel@ted>
References: <1381428927-7057-1-git-send-email-otavio@ossystems.com.br>
	<1381479495.29912.98.camel@ted>
Date: Fri, 11 Oct 2013 08:54:23 -0300
X-Google-Sender-Auth: g0vl25-dCiJ7OzSWgXulWu6Vp4Y
Message-ID: <CAP9ODKro5_sftkjS0+WsPXyaa-oSYatbxBh6Y9ajsPtYzzDeGA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uboot-config.bbclass; Raise an error for unknown configs
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
X-List-Received-Date: Fri, 11 Oct 2013 11:54:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 11, 2013 at 5:18 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2013-10-10 at 15:15 -0300, Otavio Salvador wrote:
>> When passing the wrong value for UBOOT_CONFIG it ought to raise an
>> error otherwise it is quite difficult for user to notice it didn't
>> behave as expected.
>>
>> Reported-by: Lauren Post <lauren.post@freescale.com>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  meta/classes/uboot-config.bbclass | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
>> index ba01bff..ff226a1 100644
>> --- a/meta/classes/uboot-config.bbclass
>> +++ b/meta/classes/uboot-config.bbclass
>> @@ -51,4 +51,9 @@ python () {
>>              if len(items) > 1 and items[1]:
>>                  bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % items[1])
>>                  d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
>> +
>> +            # Go out as we found a match!
>> +            break
>> +    else:
>> +        raise bb.parse.SkipPackage("UBOOT_CONFIG %s is not supported" % ubootconfig)
>>  }
>
> Shouldn't this be an exception such as ValueError rather than
> SkipPackage?

Good point; I will send a v2 fixing this.

Thanks for reviewing it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

