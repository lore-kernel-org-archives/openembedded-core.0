Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 007916E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 07:43:00 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so67132228igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 00:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=/sWejAIxv2QBz9AZ4nOFHT6xwY90XSM0nbTngWFE4yc=;
	b=Mn2iZkMoc1vmfa4bbRDG5JGMVgHLI9Oil+rdkPtEfkuJCZbOO5tzL9yzwmvk8ripm5
	0dkqNCOEnK09xOmz0hUDQc/4qXboJ94QemyCvCIwVn4FLDgkaYEwBJRNnT3vvv48f3Tl
	jUbwrqgDt6N593F10UDv6OqKGGjUhlDVC5kl6j+ROYc5dad7UdrqSS7RN0247q2ePv3w
	WX3kJ50seR85nLzuSOtJKyOfQrSNo1DfeNYJEXfiyEsPvVYnk9y46rwmp65T+TN0Kfs/
	4meUo3eRdkv/QjtoitnHxQdR25l35DYJUYXO3qlLHLPlOI0NimWSMmZ5mXJbZqZ4ZMSe
	5PSA==
X-Gm-Message-State: ALoCoQkQ4do9rCvKGKcWOWFL28Wfd8VQ63s06M5bLV3WO1VbK+/hQ1EgsNKVzAh/qT9p34qY2SPv
X-Received: by 10.42.38.208 with SMTP id d16mr14735142ice.45.1428997381921;
	Tue, 14 Apr 2015 00:43:01 -0700 (PDT)
Received: from pohly-mobl1 (p57A57E2A.dip0.t-ipconnect.de. [87.165.126.42])
	by mx.google.com with ESMTPSA id ka2sm8513484igb.2.2015.04.14.00.42.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Apr 2015 00:43:00 -0700 (PDT)
Message-ID: <1428997376.23267.134.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Tue, 14 Apr 2015 09:42:56 +0200
In-Reply-To: <CABcZAN=54ffzEd5u7926uqXde8ecamQuQv2h34S+DRdF4KPNdw@mail.gmail.com>
References: <cover.1428939671.git.patrick.ohly@intel.com>
	<e03e02a4abdec92544b1f32e759ce378c80bf2c5.1428939671.git.patrick.ohly@intel.com>
	<CABcZAN=54ffzEd5u7926uqXde8ecamQuQv2h34S+DRdF4KPNdw@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] rootfsdebugfiles.bbclass: quick-and-dirty installation of additional files
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
X-List-Received-Date: Tue, 14 Apr 2015 07:43:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-04-13 at 09:07 -0700, Christopher Larson wrote:
> 
> On Mon, Apr 13, 2015 at 8:44 AM, Patrick Ohly <patrick.ohly@intel.com>
> wrote:
>         The main motivation for this class was the observation that
>         a) a core-image can hang under qemu when the kernel does not
>            have enough entropy to generate the ssh host key
>         b) ssh complains about changing ssh host key files when
>            rebooting the same machine with different images
>         
>         For debugging it is okay to reuse an ssh host key generated on
>         the device
>         before. There may be also similar use cases, so the class is
>         generic enough to
>         also copy more than one file or directory, with
>         dropbear_rsa_host_key given as
>         example.
>         
>         The documentation and naming of the class makes it clear that
>         it
>         should not be used for production images.
>         
>         Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> 
> Freescale's merge-files recipe may be worth looking at as an
> alternative to this.

Thanks for mentioning it. Yes, that's also a way to do it. It seems a
bit more complicated to set up (all files must be in a common "merge"
directory) and does not seem to support sub-directories (-maxdepth 1),
so it is a bit less flexible than the ROOTFS_DEBUG_FILES that I was
proposing. On the other hand, the files get packaged properly (well, if
one is careful about adapting the default MIT license as needed).

For my use case, I still prefer the quick-and-dirty approach.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




