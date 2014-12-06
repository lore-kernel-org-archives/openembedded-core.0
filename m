Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id D18117239F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Dec 2014 13:01:49 +0000 (UTC)
Received: by mail-yk0-f181.google.com with SMTP id 142so1082497ykq.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Dec 2014 05:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=sov6/+b26NyHHdA2EpEoUXo7EdpG4inKF+0wA/b9A94=;
	b=P4xDAen0ws9HGVX3SEYlSzVCsI1aJgAqbdEp21gS3iEP8hNzPDauBmRmx9nsi/w1x3
	uKVzrIIU6MVFic94Pd5GW0L/AVB+5sWiIfeh/bxSaUFuxRAgrpCQuWfj70mdHPUz0tlD
	AWfGbw3UWLfVDYyGpK1GYQ8Tsi5ut90BnYn//M+Kvk0z9Uhs8JTC+2jYGjToIvjFNkq7
	c+mI9cCeem9nVQdpBGnpnSLcWOtqbKV3my4fCT5ONoAa44d7jnHhuSMZ6GhY6mTIw6GI
	D8DK3M9MJC9Ai9g9PORICZkch4DtbWbCDfKLBzxoyTxOE5xWQ8Z71jS/rzuO751C+/84
	B9mA==
MIME-Version: 1.0
X-Received: by 10.236.231.161 with SMTP id l31mr23226033yhq.104.1417870910027; 
	Sat, 06 Dec 2014 05:01:50 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Sat, 6 Dec 2014 05:01:49 -0800 (PST)
In-Reply-To: <2398845.3Ch9h31VYL@peggleto-mobl5.ger.corp.intel.com>
References: <cover.1417802944.git.paul.eggleton@linux.intel.com>
	<b16b90e4646b1eb5ae59f98fca123f2f55f7ad3c.1417802944.git.paul.eggleton@linux.intel.com>
	<CAP9ODKqGkqK7rMKudFGcjcEyXc+VquhtRPZpioXbXhTOc-kt2Q@mail.gmail.com>
	<2398845.3Ch9h31VYL@peggleto-mobl5.ger.corp.intel.com>
Date: Sat, 6 Dec 2014 11:01:49 -0200
X-Google-Sender-Auth: 2Av5xBVYa-1XUi6NuJUOTipQDTM
Message-ID: <CAP9ODKrLxhKNi+TS4T+e86zBJ1Rnu-Q443AoztfudrwpvGAUrg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] buildtools-tarball: restore missing git tools
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
X-List-Received-Date: Sat, 06 Dec 2014 13:01:53 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 5, 2014 at 11:39 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 05 December 2014 16:30:44 Otavio Salvador wrote:
>> On Fri, Dec 5, 2014 at 4:09 PM, Paul Eggleton
>>
>> <paul.eggleton@linux.intel.com> wrote:
>> > Since the split out of git-perltools, some git tools (such as "git am",
>> > "git send-email" and "git-submodule") have no longer been part of the
>> > buildtools. We need these, so add them back in.
>> >
>> > However, adding git-perltools to buildtools triggers perl itself being
>> > brought into buildtools as well, and we don't want that; but we also
>> > don't want to have to hack the git recipe or indeed anything else that
>> > starts depending on perl. Thus, add a dummy package which gets installed
>> > in its place, in a separate package architecture that is only enabled
>> > for buildtools to ensure it doesn't start appearing in place of
>> > nativesdk-perl anywhere else.
>> >
>> > Fixes [YOCTO #7033].
>> >
>> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>
>> This dummy thing looks like a hack to me :-(
>
> Perhaps - I'm all ears for an alternative solution, but it absolutely has to
> be fixed, and soon. Shipping an incomplete git (or incomplete perl) in
> buildtools basically defeats a major part of having the thing in the first
> place.

We should split out the tools we really want (so we skip the perl
runtime dependency) or include perl. Use a dummy package for it is
wrong in my opinion. You cannot guarantee host perl will work as
expected for our git release.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

