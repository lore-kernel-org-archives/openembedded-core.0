Return-Path: <paul.betafive@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 12A3E60172
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 14:24:35 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wo20so2620999obc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 06:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=VuoPWaOy8nFEE15urhIE+hKG0kDjdbw9txKH7bFN0XQ=;
	b=OxfZq4zfM1gnHUr6LyhpU+sGCdVVAlNVjcXUJjstQPJY43OODOAmWysjoaarHxDV7g
	rqNid3IV8mX4Zv0TPBWHZqkUS0nVimImiKLDnYEkJdwHmAi7iUjXD97iJo5srLZTbyJj
	xE/j+7GBozxgX6qcF4j0n7iVIQkEMkFCAvAElAVIfOn8UnomtcHZBnasmDr7qbNkvrEX
	2raGv6NUUTOy8jJr+/mruqosKrRUqGdXq5MWo9aD6v3ECmFNTHOXN07oU0BHKiSGU2eO
	NL4WVY6ToORaWXp06N6wfcbvyvlMWZKSkq+ZEjem3h/n53kwkwm4MulB2xopOVPcSZFS
	HXNw==
X-Received: by 10.182.2.42 with SMTP id 10mr886176obr.73.1389709475906; Tue,
	14 Jan 2014 06:24:35 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.76.122.171 with HTTP; Tue, 14 Jan 2014 06:23:55 -0800 (PST)
In-Reply-To: <CADV-EXEOb5NrhOG80QmsRE7hBshiSfchL=62qpBHnSKzA8Yt+w@mail.gmail.com>
References: <CADV-EXEygnQGWan8VLtZbieUozXPnfRNytXg9TBv1ALwJ_y3cA@mail.gmail.com>
	<CANyK_8cntHRL7rRSUibaCX_1L3zDmYhx_P=pa6S7RA4G_LeG5w@mail.gmail.com>
	<CADV-EXEOb5NrhOG80QmsRE7hBshiSfchL=62qpBHnSKzA8Yt+w@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 14 Jan 2014 14:23:55 +0000
X-Google-Sender-Auth: oSyavmlfxCHcJGtvFjwaI0liPzs
Message-ID: <CANyK_8fNLVYj2i9uckOm-EE+K6S91YZ1zc=bwxT-qrwkk=KATw@mail.gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Failed to build opkg with curl support
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
X-List-Received-Date: Tue, 14 Jan 2014 14:24:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 14 January 2014 13:36, Yevhen Kyriukha <kirgene@gmail.com> wrote:
> Hi Paul,
>
> 2014/1/10 Paul Barker <paul@paulbarker.me.uk>:
>> On 9 January 2014 12:04, Yevhen Kyriukha <kirgene@gmail.com> wrote:
>>> I define "curl" in PACKAGECONFIG for opkg.
>>> After that I'm getting circular dependency errors during building opkg.
>>>
>>> Best regards,
>>> Yevhen
>>
>> Sorry, this is a known problem.
>>
>> The update-alternatives script needs to be moved out of opkg, either
>> to opkg-utils or to its own recipe as it is the use of
>> update-alternatives that is causing the circular dependencies. This is
>> what I am planning to work on next as soon as I get some time.
>>
>> This is required for my ongoing development work on opkg so it should
>> get sorted out soon. (Future versions of opkg will depend on
>> libarchive which also indirectly depends on update-alternatives).
>>
>> Related to this is the fact that no other providers of
>> update-alternatives seem to work, again due to circular dependencies.
>>
>> See http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/45321
>>
>> Thanks,
>>
>> --
>> Paul Barker
>>
>> Email: paul@paulbarker.me.uk
>> http://www.paulbarker.me.uk
>
> Can you give some estimates on how long the implementation of this
> feature will take?
>

I threw a few patches together over the last week, they just need
testing before I'm happy to submit them for merging into mainline
openembedded. They move the update-alternatives utility to the
opkg-utils recipe, hopefully allowing the opkg recipe to have
dependencies added without resulting in a circular dependency loop.

I'm not at my development machine at the minute, but I'll forward them
to you later so you can test them as well. Email me again to remind me
if you haven't got them within a day or so.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

