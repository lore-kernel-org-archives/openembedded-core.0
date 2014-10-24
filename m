Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id B10C96A362
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 16:31:56 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id tr6so2679112ieb.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 09:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NmzJpkJ2/j/Rjfg9qTTQSWSfXDAjcc3r1sLbthkRH3E=;
	b=CX8lKtANZc+rq+Adn2VJvc6e3Qb3CiPCxgrtCnAodx8TBPPH5Xq6j/49f0NUVYksr9
	cdfBXW4DOt7nmHa8BnyYsr13CqUOTLWIUqKjKSy4DcrS1aGJJLOfCcF2Q3S8rSa6cMQC
	0MW93mheOCWviZYi4UpxTQnsBRRFWgrdDqnSBthJlSmW9tWuSsSGn8eUSuVfWj4bqxht
	+Utt/nGg0PXTJkZHGXD/JaMeEEosEUAkyRwgrP3zr5tf8mG52P11Dx5YpI6I+793uOAM
	RC+/fh61wKxPiLGznSAv+rcLeamtYx6/bl9aLUBFntplDm9GD/tlKazeKwDhIfW0NI21
	5U2Q==
X-Received: by 10.107.18.1 with SMTP id a1mr2181184ioj.83.1414168316771; Fri,
	24 Oct 2014 09:31:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.169.2 with HTTP; Fri, 24 Oct 2014 09:31:26 -0700 (PDT)
In-Reply-To: <CAJTo0Lb=awdqetYPk+6uGjKusnA=JY_CR5G9iJSsD4SES+ipuA@mail.gmail.com>
References: <1414130736-1700-1-git-send-email-shan.hai@windriver.com>
	<1414130736-1700-2-git-send-email-shan.hai@windriver.com>
	<CAJTo0Lb=awdqetYPk+6uGjKusnA=JY_CR5G9iJSsD4SES+ipuA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Oct 2014 09:31:26 -0700
Message-ID: <CAMKF1sp5wPkfKinRU3dnhVX_Jn4=btF_gFFXuU8+W-j3KTkrjw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: par.olsson@windriver.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ldconfig-native: fix a endian-ness bug
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
X-List-Received-Date: Fri, 24 Oct 2014 16:32:03 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 24, 2014 at 4:43 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 24 October 2014 07:05, Shan Hai <shan.hai@windriver.com> wrote:
>>
>> Some header fields of ELF were read with wrong size on 64bit
>> big-endian machine, fix it by reading the fields with read64
>> instead of read32.
>
>
> For fixes like this which set of all sorts of alarm bells, please include
> more justification.
>
> From a quick look at the code my interpretation is that the values in the
> segment structure are 64-bit but they were being read using 32-bit accessors
> (read32).  On a little-endian 64-bit machine (x86-64, aarch64) when the
> values fit into a 32-bit value the right half was read and it still worked.
> Then someone tried a 64-bit big-endian build host (I'm guessing is a ppc64
> or mips64), and the values read are either 0 (if the size fits in a 32-bit
> type) or corrupted (if larger).
>
> Am I right?  Either way, the commit log needs to be clear - the message
> should *why* it does something, not *what* it does.
>

you are right. but I wonder if this patch is OK since section alignments change
based on 32bit ABI or 64bit ABI

> Finally, do we really need to patch a fork?  We've got the full source
> alongside the recipe, let's just fix it.
>
> This also brings up the point that we really need to do something about
> ldconfig-native.  CC'ing Khem, would anyone be able to liaise with upstream
> and either update our fork or see if upstream would care about our need for
> ldconfig-native?

I think its fine idea, I haven't paid enough attention to it so assert
if its right
for upstreaming in current shape but for 2.21 I should

>
> Ross

