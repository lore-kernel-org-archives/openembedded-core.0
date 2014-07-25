Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 27E6465E28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 16:40:48 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id rp18so3805386iec.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 09:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QSTwUa4T7VfBJqamWcH7Xnrjc5e1OcMfvWmRzPWrVl0=;
	b=biCzphZDz96hG4ZfA8O3vzgasgwbvmkvQVXFR3GRBvG+ZJF/V/Us/YycsSYTZNeIBc
	OdrqznXaJuCuj7CQl9qOLv+8I3cPtIDrivL44Y5jbpyoGsTXQ5daJCJkl6xz14zP016Y
	Cnsgxsyn10PgKdLxwlAacDL73QQG4D3MkBt9tqbD+aEYKtreCHX1H/qnXDjQuoikTQV0
	nLkYZC2TxOqkNFBHvKKH+F74nNU389hmKM9u4Yg4Tjy0JYa2Q6bhzrNZwu9EpAcTp7bA
	UpoamvqsxEomgRDvI9stJh0jKbUPfPQR79hDGxa2Dx8fXbK24GmkKqdWcTlyHQOfor1E
	k37g==
X-Received: by 10.42.82.6 with SMTP id b6mr19053842icl.51.1406306449793; Fri,
	25 Jul 2014 09:40:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Fri, 25 Jul 2014 09:40:19 -0700 (PDT)
In-Reply-To: <1405601311.3668.16.camel@ted>
References: <1402915976-12506-1-git-send-email-ross.burton@intel.com>
	<53B66F26.5000800@communistcode.co.uk>
	<53C7AE4F.5060809@communistcode.co.uk>
	<1405596838.3668.14.camel@ted> <53C7B5F1.1030302@communistcode.co.uk>
	<53C7B7B1.8010301@communistcode.co.uk> <1405600745.3668.15.camel@ted>
	<1405601311.3668.16.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Jul 2014 09:40:19 -0700
Message-ID: <CAMKF1soxACyZxskTxBSiF_f6V_qLNvmNhXu+-yANjR-N1dQHug@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wget: use GnuTLS instead of OpenSSL
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
X-List-Received-Date: Fri, 25 Jul 2014 16:40:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 17, 2014 at 5:48 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> So why on earth is it looking at /usr/lib/libgnutls.so?
>
> Total guess by try adding EXTRA_OECONF += "--without-libgnutls-prefix"

The problem is due to use of

AC_LIB_HAVE_LINKFLAGS([gnutls] since we use DESTDIR while cross
compiling, so above option should have worked I dont know why it did
not but you could try

--with-libgnutls-prefix="<target-sysroot>"

if that doesnt work either then may be replace use of
AC_LIB_HAVE_LINKFLAGS with AC_CHECK_LIB

