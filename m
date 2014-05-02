Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1A12C601A9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 21:52:12 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id oz11so5958844veb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 May 2014 14:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=aAYY97ZFFH8ALgpwmiHarxIthsVpGMp3y8HDR1VGask=;
	b=TEWwzDUKIgXr3GGKL+cieBNFeP5mQXuteb2U+0cF824pwXUfGdxeeHr1vg4y4MXCUZ
	Qs9tx5RpB03NYw+gajtvq9Op0jdq4QEpr+Q0lKzk4H3dtZxPob8vkDyZ8Ry5XNf3qrc4
	e/SejOnpGudbpwEyOA93jmqPrZZQWm6hWrNPRDgcXg9L73z7wDoEZ9SAClFCoox5dyvv
	BDjKlky3YLK4ErZ0o1kVU30IrU/YaY2YmXnoQ6i85hTAmb6GHFFHrP3nWYemzkni658D
	UbfCUjPOjV+gG0hom+X654jEGuwLXP0uVhNUPd0KvLJYJ5Ac2b3Fud7jMgWa2lQ217tU
	R6uQ==
X-Received: by 10.52.72.138 with SMTP id d10mr8065352vdv.15.1399067533214;
	Fri, 02 May 2014 14:52:13 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.221.5.133 with HTTP; Fri, 2 May 2014 14:51:32 -0700 (PDT)
In-Reply-To: <1399066445.12731.86.camel@ted>
References: <CANyK_8f74ZEqzX1ve=93GnZ7fg1NEiZUVeOKmmHuY+kHX-UseA@mail.gmail.com>
	<1399066445.12731.86.camel@ted>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 2 May 2014 22:51:32 +0100
X-Google-Sender-Auth: 5EFsh-U8mF4YpjgKuEMUSMS4X2Y
Message-ID: <CANyK_8eUuUqAMf87-pSVdd7X5_BTXOn7iQCdQ0XYyTjxu=PKbA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Ensuring a task is re-ran when local.conf is updated
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
X-List-Received-Date: Fri, 02 May 2014 21:52:13 -0000
Content-Type: text/plain; charset=UTF-8

On 2 May 2014 22:34, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2014-05-02 at 17:43 +0100, Paul Barker wrote:
>>
>> Am I missing something here? Is it expected that this variable change
>> is detected and the relevant tasks re-executed? I know changing
>> variables like PREFERRED_PROVIDER_* in local.conf causes things to be
>> rebuilt, so why does that work and this not?
>
> This should work, I'm not sure why it wouldn't. The code should be able
> to detect the dependency on the IPK_HIERARCHICAL_FEED variable and
> notice when the value changes.
>
> I'd have to experiment with some builds to figure out anything further
> but its probably worth opening a bug report as it sounds broken.
>
> bitbake-dffsigs on a siginfo file of a do_package_write_ipk is where to
> start with debugging, it should show the dependency on the variable.

Looks like I found the issue quickly using bitbake-diffsigs.
do_package_write_ipk does:
    localdata = bb.data.createCopy(d)
Then uses localdata.

If I check localdata.getVar(), the variable name doesn't appear in the
list of dependencies.

If instead I check d.getVar(), it does appear in the list of dependencies.

It looks like localdata is used so that certain variables can be set
without the changes affecting anything else (PKG, OVERRIDES, ROOT,
etc). But there are also some calls to localdata.getVar() for
PACKAGE_ARCH and ALLOW_EMPTY.

With my check changed to d.getVar(), the dependencies are: (['PKGE',
'IPK_HIERARCHICAL_FEED', 'get_package_additional_metadata',
'PKGWRITEDIRIPK', 'OPKGBUILDCMD', 'mapping_rename_hook', 'PKGDEST',
'PACKAGES', 'HOMEPAGE'])

Does this mean changes to PACKAGE_ARCH and ALLOW_EMPTY may go unnoticed?

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

