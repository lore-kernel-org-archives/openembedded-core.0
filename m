Return-Path: <paul.betafive@gmail.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id C6E3C6ACB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 06:24:31 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id x3so6027231qcv.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 23:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=jsO8NUPQ2UR3l5fPK0q32EqZHxc7LWo5Cgi3wTtJM+8=;
	b=lPaqxJmeux9g4R6ENi4kmYzB77r5x69YQzfAGnD7F5I0ulNxQrPJY2tX582iyaVZcx
	RhLy2Ww4/udET2ZEjjt7czaldvSwBgPMFWqVa05t+IH7kk3VkJyGjKEjLLEPCG45Gy2/
	iQhW34bBfb2Zr6to/fLun7wGYn5X1Wy3JyXnWWWzkwPvPIzpEIyAHq9QaaSbwF/2F2JQ
	hkLI5betDUnj8R4vTqzWCibg7ZKvhYkxppZzP82rfax5LFD2ydYZaCEWH0NlzWs9OEfW
	63f/b5NDhXupqEGDe9NLM21J9A6I6mh8gNGXhGXEgVIiHm17E3sqcWkPgGGJPc40H2Sr
	WZ5Q==
X-Received: by 10.140.39.11 with SMTP id u11mr5572217qgu.32.1413267872466;
	Mon, 13 Oct 2014 23:24:32 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Mon, 13 Oct 2014 23:23:52 -0700 (PDT)
In-Reply-To: <2427853.ctRZJaqR28@peggleto-mobl5.ger.corp.intel.com>
References: <543965E7.3040806@pabigot.com> <543AED25.7070201@pabigot.com>
	<2427853.ctRZJaqR28@peggleto-mobl5.ger.corp.intel.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 14 Oct 2014 07:23:52 +0100
X-Google-Sender-Auth: ZoP2pHZ_PAdoPied5KpEO0MQFZU
Message-ID: <CANyK_8evAyhrmuyHKmk46sfJoF6fwjnF6h9aJoLn4GPGx_Xe1w@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: dbus build host uid/gid leaking into target home directory
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
X-List-Received-Date: Tue, 14 Oct 2014 06:24:32 -0000
Content-Type: text/plain; charset=UTF-8

On 13 October 2014 10:13, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Sunday 12 October 2014 16:05:41 Peter A. Bigot wrote:
>> Pilot error.  This ultimately turned out to be a side-effect of the way
>> I create my image media: I unpacking the rootfs tar file onto a mounted
>> sdcard outside the pseudo environment and forgot that tar records
>> user/group by name not uid/gid.
>
> I used to use this method previously, and I guess it can still work if you're
> not including certain packages in your image - but I wonder if we should note
> this potential pitfall somewhere in the documentation. I'm not entirely sure
> where such a note would go, though.
>

It probably does need noting somewhere - I've been doing exactly this
for the last year or so and never even thought that I might be risking
bad uid/gid values. It makes sense now I think about it but it never
crossed my mind.

Looking at 'man tar', there is a '--numeric-owner' option to always
use numbers for user/group names. It might just be that we need to
recommend using this option when untarring a rootfs onto a mounted
volume. This option is present in GNU tar, I'm not sure about other
implementations, and I haven't given it a proper test, but it looks
like the thing we want.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

