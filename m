Return-Path: <martinstolpe@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id A2B7F75841
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 05:27:19 +0000 (UTC)
Received: by igbzc4 with SMTP id zc4so49336847igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 22:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=d07GNbRaDDRpsPopodnhx+wgWHdQ1Iu3+5yN4g3u3hs=;
	b=UlNSpJbPdosP+c2q4clANMmOXlqHJg+UXDhsXyzTgoFDgv6MjasfhvUHwJYqx26qVP
	LsgM+zxnvQnvin2JqZdMS/6MIdeFCvoLXY7l3aS7ozxlRvS2iCtAblssv5DvtWwjS02b
	6DbnkbQjyFWJapdQ+F09Qn1QS5KnyqBlwV9RJ8oOrhxhxkLsBQiin1qhlGlg4sBR6Qmq
	G27KX8KbjEIV31wY0eX9w/ax7QUHhnRj/5A262lI7xcQR6IDLoen3PJsnPwvtN3uEAuT
	61YTfz/s+7OyX6x4ZFjDzHATS1VokFrvCGwpKjBo1pLZv2A+fGeZHGsipJZVrcWHLAus
	oPFg==
MIME-Version: 1.0
X-Received: by 10.50.176.228 with SMTP id cl4mr10551646igc.2.1434000440484;
	Wed, 10 Jun 2015 22:27:20 -0700 (PDT)
Received: by 10.36.79.146 with HTTP; Wed, 10 Jun 2015 22:27:20 -0700 (PDT)
In-Reply-To: <CAMKF1srsEC8EmOzDPAowKozKPADozZn+QqtNsBtMTt-sexDyjg@mail.gmail.com>
References: <1433946366-54477-1-git-send-email-martin.stolpe@gmail.com>
	<CAMKF1srsEC8EmOzDPAowKozKPADozZn+QqtNsBtMTt-sexDyjg@mail.gmail.com>
Date: Thu, 11 Jun 2015 07:27:20 +0200
Message-ID: <CAPHZmLbqstteh_AV2FHbJo_kgcQX504D9UfoKv4ENXLCJyYDBw@mail.gmail.com>
From: Martin Stolpe <martinstolpe@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Stolpe <martin.stolpe@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [fido] binutils: fix native builds when host has gcc5
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
X-List-Received-Date: Thu, 11 Jun 2015 05:27:22 -0000
Content-Type: text/plain; charset=UTF-8

Yes, it would be better to fix these warnings. But on the other hand
this patch would just restore the previous behavior. So as a long term
solution I agree with you that these warnings should be fixed but why
not use a workaround until the problems are fixed? I wouldn't dare to
try to fix these warnings on my own as these are just my first steps
with Yocto and programming and I wouldn't be confident that my changes
would be correct.

2015-06-10 17:42 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> On Wed, Jun 10, 2015 at 10:26 AM, Martin Stolpe <martinstolpe@gmail.com> wrote:
>> Problem is that when building binutils using GCC >=5.0
>> warnings will be treated as errors which will cause
>> the build to fail.
>>
>> Signed-off-by: Martin Stolpe <martin.stolpe@gmail.com>
>> ---
>>  meta/recipes-devtools/binutils/binutils_2.24.bb | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils_2.24.bb b/meta/recipes-devtools/binutils/binutils_2.24.bb
>> index 738aaee..bc34a14 100644
>> --- a/meta/recipes-devtools/binutils/binutils_2.24.bb
>> +++ b/meta/recipes-devtools/binutils/binutils_2.24.bb
>> @@ -7,12 +7,15 @@ EXTRA_OECONF += "--with-sysroot=/ \
>>                  --enable-install-libbfd \
>>                  --enable-install-libiberty \
>>                  --enable-shared \
>> +                --disable-werror \
>>                  "
>>
>>  EXTRA_OECONF_class-native = "--enable-targets=all \
>>                               --enable-64-bit-bfd \
>>                               --enable-install-libiberty \
>> -                             --enable-install-libbfd"
>> +                             --enable-install-libbfd \
>> +                             --disable-werror \
>> +                             "
>
> lowering the guards is not the right approach. I understand you want
> to compile fido with distros that are released after fido.
> but better would be to backport relevant fixed into component itself.
>
>>
>>  do_install_class-native () {
>>         autotools_do_install
>> --
>> 2.4.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

