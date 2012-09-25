Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel@fooishbar.org>) id 1TGeUi-0006m8-R1
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 01:24:49 +0200
Received: by vbbez10 with SMTP id ez10so7831305vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2012 16:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=pHs+K+z8ZVP/DBFso7AdFTv1waz2yeX+56G/0o++ZnA=;
	b=iu91Sxk/cNluYeIAE7PzworoKMrIF2i0348J+8hwkquVer+Gunp9k0I0url8rX1c/1
	EUf58wzT36hkLEqIcOLGfLdmGg3rL30XrjrGP3+f5r5Jg+9yhu6hJLgWnOMuZEehtsL3
	4GAruUoSpPsj1XnRxiRCGZJnhsliH6QWeKYItpuk2IFDGEVJF1r0D1g3gbTNLrBlyO5j
	F+obe3cOrfFhzpbUutZ5IGPAzvUI62wlOcIxMJfvx2cFNQFY/Yw550/5gKfLFEsjmnHf
	gQYRx41YOG+ik2vD0BrXyeHLnkd1leB6uhyg3I3pEOJ90AAU6UcTIoMPMWaDs3EsvYi/
	JgoA==
MIME-Version: 1.0
Received: by 10.58.0.7 with SMTP id 7mr6210708vea.18.1348614718707; Tue, 25
	Sep 2012 16:11:58 -0700 (PDT)
Received: by 10.58.161.231 with HTTP; Tue, 25 Sep 2012 16:11:58 -0700 (PDT)
X-Originating-IP: [27.32.230.226]
In-Reply-To: <CAJTo0LYcfqespv9vnEWUASJN6-Psh954FGHRoWhAmUYkFWwtEw@mail.gmail.com>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
	<1348516546-26005-2-git-send-email-msm@freescale.com>
	<CAJTo0LYe6LuFQJS_36PYVsjwnp=N9J-XuiFVMntBi76qt+i4aw@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6A6CE2@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAJTo0LZ7LrDg8JfOH6bVDV2PK6mnpqUsdHPwnvmUm1uen8uzMQ@mail.gmail.com>
	<CAEsOVNfCLUhhpM91OBLC_paOXzsoS6PMeVXdp2xSnajqGuBcyg@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6A7790@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAJTo0LYcfqespv9vnEWUASJN6-Psh954FGHRoWhAmUYkFWwtEw@mail.gmail.com>
Date: Wed, 26 Sep 2012 09:11:58 +1000
Message-ID: <CAPj87rM=D6hSXGqY6O2qOoPb=NiGSrTRSpakcwJQTkssDMYtzg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmzavy3TnnaJgACPum0cpYOeqO5YO6gMI/rH8kpFWtDGAG5gydoJisWV2x7dyX4PoKU1gPc
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libx11: fix nativesdk build on older distros
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Sep 2012 23:24:49 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 26 September 2012 05:09, Burton, Ross <ross.burton@intel.com> wrote:
> On 25 September 2012 19:55, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
>>> I read somewhere (very informative - I know - but I've forgot where)
>>> that you are not supposed to include config.h for CC_FOR_BUILD
>>> targets? I'm not expert and just double checking on this bit as the
>>> correct solution.
>>
>> Found it: http://sources.redhat.com/autobook/autobook/autobook_270.html
>
> That is a very good point, hadn't thought of that (and I recommend
> that book to everyone, clearly I should re-read it).
>
> The best fix is to just #define _GNU_SOURCE at the top of makekeys
> then, and push that upstream (mail patch to xorg-devel@lists.x.org).

Actually, it isn't, as that breaks non-glibc badly.  glibc takes
_GNU_SOURCE to mean 'please add useful GNU extensions to this POSIX
wasteland', whereas BSD and/or Solaris take it to mean 'please make
this only GNU and don't use any other extensions at all'.  So we have
to do whatever AC_USE_SYSTEM_EXTENSIONS does, because that really is
the only thing that actually works.

Cheers,
Daniel


