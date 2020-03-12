Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 5F27A61B10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 14:30:03 +0000 (UTC)
Received: from [127.0.0.1] (port=36582 helo=cpanel7.indieserve.net)
	by cpanel7.indieserve.net with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jCOqZ-004ViY-Ny; Thu, 12 Mar 2020 10:30:04 -0400
Received: from [66.129.241.14] ([66.129.241.14]) by crashcourse.ca (Horde
	Framework) with HTTPS; Thu, 12 Mar 2020 10:30:03 -0400
Date: Thu, 12 Mar 2020 10:30:03 -0400
Message-ID: <20200312103003.Horde.-mn1W9NE8YAc6sk0SRLY8bj@crashcourse.ca>
From: rpjday@crashcourse.ca
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200312085608.Horde.kbPh9KWkZJR4Zi-lry-_TrN@crashcourse.ca>
	<CANNYZj-KNVxXWjTWqc-a6Xe4YqBx4aZkuFAkNjQb3ZhBL-hUcw@mail.gmail.com>
In-Reply-To: <CANNYZj-KNVxXWjTWqc-a6Xe4YqBx4aZkuFAkNjQb3ZhBL-hUcw@mail.gmail.com>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: simplest command to display which layers are applying the same patch?
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
X-List-Received-Date: Thu, 12 Mar 2020 14:30:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline


Quoting Alexander Kanavin <alex.kanavin@gmail.com>:

> I think 'bitbake -e recipe', and then searching for SRC_URI in it should
> show which layer applies which patch.

   ... snip ...

I *think* I know what might be happening here, and I'd like to verify
some suspicions about how recipes are selected and patches are applied.
(Writing this in real time so I hope I don't screw up.)

Imagine I've checked out oe-core, which supplies recipe file fubar_1.0.bb,
but it becomes obvious that there is a bug, for which there is an obvious
patch I can apply internally. So I fire up a fubar bbappend file, which
does nothing but extend SRC_URI to apply the patch, call it fubar.patch.
(Remember, this patching is all internal, in my vendor layer.)

*However*, being a bit lazy, rather than create fubar_1.0.bbappend, I
slack off and create simply fubar_1.%.bbappend. (I suspect you see
where I'm going with this.)

Now the good folks at OE get around to updating oe-core, and part of
that update is to add that patch to SRC_URI of fubar_1.1.bb (along
with the patch file fubar.patch, of course). Now, because that is
a more recent version of fubar, that is the recipe file that should
be selected.

*However*, if I interpret this correctly, first, I have fubar_1.1.bb
applying fubar.patch, but because I am also defining a layer which
contains the append file fubar_1.%.bbappend, that append file will
also try to apply the same patch, which of course should not work
properly. (Am I correct in my thinking so far?)

If I'm explaining this correctly, then the fault naturally lies with
me for being sloppily ambiguous with my append file and not locking
it to fubar_1.0, but allowing it to be applied against all fubar_1.x
recipes. In short, when I inevitably get the error of "Patch already
applied," it is entirely my fault for being sloppy.

I'm trying to verify this as I am now aware that a *lot* of append
files in the vendor layer in question are similarly ambiguous.
Does this make sense?

rday


