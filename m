Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 420E46F139
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 21:12:51 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id at1so2374840iec.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 13:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=cSLhbm+TkT9OgLZuPzhYaYGdzamg1MGqwXzzB1OlmrE=;
	b=uGES04HyoZuuwBDQgIiYb88DdcbcDySWDeeLHjg5oWngtWPXyBV8U+s+zbk+7RWIGA
	elLx67bE6yR4ndRfDISHRVQY3k/FSIqZe8XozghifyC7fyziq81qoX5pIc90VIfXo/L+
	wztzi33U6nB4kPl6y62ZtQcmY6pGA1MGH70+MLT5M6+gEmNdQ4LZYsC9guqsgTkuHtAz
	H1S55VqZO+6LBTSc5UJz+vRege+73szv31xnumWXycLKqy6PhTJwU81rKUTJ960x/OK5
	daGVBHTYEI+HS+MF6HmqkzGlVwExg9HgMHMRFc97x/xWjPxEFpTO5Rc0My7S+Xchizar
	hZVA==
X-Received: by 10.42.85.140 with SMTP id q12mr8262692icl.51.1393103572696;
	Sat, 22 Feb 2014 13:12:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Sat, 22 Feb 2014 13:12:22 -0800 (PST)
In-Reply-To: <20140222204710.GQ3854@jama>
References: <cover.1392891203.git.raj.khem@gmail.com>
	<20140221151607.GG3854@jama> <1392996116.1560.14.camel@ted>
	<8730C02B-B94E-4873-88D1-E5BA9063B585@dominion.thruhere.net>
	<1393058961.5181.4.camel@ted>
	<FD6EC742-512D-4423-B59D-D88ECBF97AF1@gmail.com>
	<1393092730.2640.25.camel@e130.pbcl.net> <20140222204710.GQ3854@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Feb 2014 13:12:22 -0800
Message-ID: <CAMKF1srAdAWDhPVG=ebgD7B8rN06K7VfFD8zgjkaHakW77bWig@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH 0/2] Systemd 209
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
X-List-Received-Date: Sat, 22 Feb 2014 21:12:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2014 at 12:47 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Sat, Feb 22, 2014 at 06:12:10PM +0000, Phil Blundell wrote:
>> On Sat, 2014-02-22 at 01:31 -0800, Khem Raj wrote:
>> > builds might work but they won=E2=80=99t run and yes so far IFUNC supp=
ort is needed so it won=E2=80=99t work on non-x86
>> > architectures. One common runtime problem I am seeing is logind not be=
ing able to talk to dbus
>> > across all architectures. I have pushed my latest rework to pull branc=
h
>>
>> What is the problem with ifunc on non-x86?  As far as I know the
>> compiler, assembler, linker and ld.so for all reasonable architectures
>> support that nowadays (though prelink support is a bit patchy).  GCC
>> didn't have ifuncs enabled for some architectures until quite recently
>> but if that was the problem then you'd see compile-time failures.  So,
>> if it compiles then I can't think of any reason why it oughtn't to run.
>> Is this a uclibc thing?
>
> I'm seeing lots of compile errors like this:
>
> | arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-ranlib .libs/l=
ibsystemd-units.a
> | libsystemd-id128.c:6:6: error: ifunc is not supported in this configura=
tion
> |  void sd_id128_to_string(void) __attribute__((ifunc("resolve_sd_id128_t=
o_string")));
> |       ^
>

this is exact problem I mentioned in last email. Try to remove
--enable-compat-libs in systemd recipe.

> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

