Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id CBAC87391F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 16:37:45 +0000 (UTC)
Received: by ladw1 with SMTP id w1so44907746lad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 09:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BJMPv9SDu6DtFXpXcgUCFYRcNO7G3lDYlT9H11TNm18=;
	b=f+birFqBZlqigxsRPS5SxI29EN+q6yTxzw8xj3p4tbirTYM7F6EuuoqMQ7smtb8rWP
	5DAzXXwwEQ7jIOT0XK0iJi7BWD/1bEp1oX/knP3vaK1usxsHd2lzCLpgZty7VuayDMqC
	e8/2iTUy6ja1Pa984jC8cUtTesw0dkUxsy5u1BG4M5eMGRRBK2x6KDPl6jrImYWcJAvu
	HpHbiQhrEVEw9lswd+LgqW/b7orH1Gq9K2J3o6ufmIYTdzYst7QkSF26ezong3SIqbt1
	SU1hB4R8MqY9HQA8z+Ld+BQX+sHCz8U+2DGY7xRHAbhkoKzuGAGe8OsBvZUoXFiSCT8P
	4L/A==
MIME-Version: 1.0
X-Received: by 10.152.36.226 with SMTP id t2mr53263608laj.53.1426523865676;
	Mon, 16 Mar 2015 09:37:45 -0700 (PDT)
Received: by 10.152.146.4 with HTTP; Mon, 16 Mar 2015 09:37:45 -0700 (PDT)
In-Reply-To: <CAJTo0LZvk3Y7ZuN1pX7ES2iGFThRLE_0w=w904xVVkupmCJULA@mail.gmail.com>
References: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
	<73D5E895-8D8E-445E-B269-68F62A89B413@gmail.com>
	<CAJTo0LZvk3Y7ZuN1pX7ES2iGFThRLE_0w=w904xVVkupmCJULA@mail.gmail.com>
Date: Mon, 16 Mar 2015 17:37:45 +0100
Message-ID: <CAC1BbcS+CutVKhSgx16ii7c_eMrszoA3QS5itBa80AbWFN+RdA@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libtirpc: respin patches
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
X-List-Received-Date: Mon, 16 Mar 2015 16:37:48 -0000
Content-Type: text/plain; charset=UTF-8

On 16 March 2015 at 17:26, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 16 March 2015 at 18:24, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Patches are fine in this series, however I just want to set the
>> expectations right here. While having that libc-independent goal is fine.
>> Sometimes we just can not do it, since uclibc or musl
>> does not have all the features that glibc has and an app might also be
>> using it.
>> making glibc users not have those features is unfair
>> given that we have a strong mechanism of overrides in OE, it should be
>> used to this advantage.
>
>
> But these patches, which add configure options to enable/disable the
> relevant functionality and have been sent upstream - represent the ideal
> case as once they're merged won't cost us any effort in the future.

I just disable NIS / YP for uClibc and leave glibc (or any other libc
for that matter) to do what they previously did.
libtirpc is an excellent example for this unchanged behaviour:

src/getrpcent.c:        if (!__yp_nomap && _yp_check(&d->domain)) {

and i did not change that since first, i don't care and second, maybe
glibc-users do fun stuff to let _yp_check resolv to the proper
__yp_check, i don't know nor really care ATM.

I think uClibc-users do not expect to have NIS support, we never
implemented Yellow Pages support since that is usually way out of
scope for those setups.

Maybe i misread your comment, though, Khem?
Or do you refer to a glitch i introduced? If so, what did i botch? :)

thanks,

