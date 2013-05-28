Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 596766A450
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 16:49:41 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id wy17so8009427pbc.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 09:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=yLxiuE5tfs0uH4L9/eztTaITaYx6ZBMeUR9jesK4l0I=;
	b=umQXwNEt3/iAQnLc2xn79sdY8iT1HVtJaPIYrMaXyGBwmf8W7zfE7grE8TUZKNggMJ
	nzuxR8czkTUkZ33CcEv7LZ+bRjkYU+5ciA7IgkY3uAuvcKiIrwXgxyULMiwCfnUtQDZF
	48EH/jPaxpr/Ej4RkofY7lkFbQns+2XZwsVvMYmuwwXSDGNg8PHNi5k9zGyJruqaHHH0
	J9j+A7ajKM02iUpMu6ie2G5ua27GyxKCCxR8XMOmpeIHByD+O1Y+EI2aWRL3Thm3QxHv
	QfhpLCEa1ca1UM8elWMz9XbhfU3fyJAiH9YlK2+NPGFItKP+E9clo8PlsnU3wcvzVe0C
	TVBw==
X-Received: by 10.66.164.161 with SMTP id yr1mr35115582pab.77.1369759782663;
	Tue, 28 May 2013 09:49:42 -0700 (PDT)
Received: from sa-nc-common3-43.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id l16sm5160521pag.22.2013.05.28.09.49.41
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 28 May 2013 09:49:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51A4B77E.7070906@linaro.org>
Date: Tue, 28 May 2013 09:49:40 -0700
Message-Id: <62850F83-2155-4191-A292-8C01CF6E52E6@gmail.com>
References: <1369665656-20275-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<CCC27A1E-27F7-4D70-B7A5-30F2118D3D0C@gmail.com>
	<51A4B77E.7070906@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc 4.8: use /lib/ for AArch64
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
X-List-Received-Date: Tue, 28 May 2013 16:49:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 28, 2013, at 6:56 AM, Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> wrote:

> W dniu 28.05.2013 01:23, Khem Raj pisze:
>> On May 27, 2013, at 7:40 AM, Marcin Juszkiewicz
>> <marcin.juszkiewicz@linaro.org> wrote:
>=20
>>> +++ b/meta/recipes-devtools/gcc/gcc-4.8/use-lib-for-aarch64.patch
>>> @@ -0,0 +1,23 @@
>>> +From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>>> +
>>> +AArch64 is built with /lib/ as prefix but GCC 4.8 tries to use =
/lib64/
>>> +path so build fails.
>>> +
>>> +It may affect builds when /lib64/ will be used but so far it is not
>>> +default.
>>> +
>>=20
>> Marcin,
>>=20
>> what is the multilib strategy for aarch64? i think using lib64 for
>> 64bit and keep /lib for 32bit apps would be ideal so you can keep the
>> existing apps running. In OE we have convoluted x86_64 where when not
>> using mutlilib it uses /lib for 64bit apps and when doing multilib it
>> does /lib64 for default 64bit apps and /lib for 32bit apps its quite
>> confusing. For arm lets not follow those footsteps and use /lib64 for
>> 64bit from the onset and then multilib can come later and will fit in
>> nicely.
>=20
> I will leave that decision to Riku as new meta-linaro maintainer.
>=20
> My view is that so far AArch64 is still in kind of "testing phase" =
rather
> then fully used system. Switch to /lib64/ would require far more =
patches
> (gcc-4.7, eglibc etc) than switching to /lib/ which is used since we
> started with this architecture.


This is beginning of aarch64 and whatever defaults you set now will be =
harder to change as time passes
by. As I said earlier, if multilib and keeping precompiled 32bit =
binaries running is not priority then its fine.=20


