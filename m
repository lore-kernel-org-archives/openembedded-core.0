Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TGo9E-0001HU-DV
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 11:43:16 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 26 Sep 2012 02:30:24 -0700
Received: by obceq6 with SMTP id eq6so368822obc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 02:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=PlZlEJYCoDwk0ZEo6DrzvvC3lJr2BSsHaB4KNFxtVNU=;
	b=aWOLW8+WveiQMR+kvZFzG1aPqjxTKoj3NFmzdQBFxnB2KDyf0i9WnDL0f9zgsFEz3T
	oB23yXXBa32HI3/6J2AKwfnJHxu9/xI+qhX7SPe2Iv0ZU4LSNznipS8Ze9kC8Aws0NGF
	WWUsZLQ/qL6ZVORMBZnGbAy4hTPnfhwszftX/l+m1Uc05/Y/wlT67keb8YbLrXaCyr1U
	VEGQ/nqnGCNykwXMcGwgGkrZUss8Phfken4sy3XOAzH9YIw4GYzFq8IUf/NC8LHG7yQk
	+/YNLgcwL+UcJWRaSzNxxL1q49zujqoHMj4Ub5DO35nOsRgolgSKWRABgc1R+DLJP3/I
	YDFA==
Received: by 10.60.12.106 with SMTP id x10mr14360430oeb.103.1348651824135;
	Wed, 26 Sep 2012 02:30:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 26 Sep 2012 02:30:03 -0700 (PDT)
In-Reply-To: <CAPj87rM=D6hSXGqY6O2qOoPb=NiGSrTRSpakcwJQTkssDMYtzg@mail.gmail.com>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
	<1348516546-26005-2-git-send-email-msm@freescale.com>
	<CAJTo0LYe6LuFQJS_36PYVsjwnp=N9J-XuiFVMntBi76qt+i4aw@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6A6CE2@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAJTo0LZ7LrDg8JfOH6bVDV2PK6mnpqUsdHPwnvmUm1uen8uzMQ@mail.gmail.com>
	<CAEsOVNfCLUhhpM91OBLC_paOXzsoS6PMeVXdp2xSnajqGuBcyg@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6A7790@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAJTo0LYcfqespv9vnEWUASJN6-Psh954FGHRoWhAmUYkFWwtEw@mail.gmail.com>
	<CAPj87rM=D6hSXGqY6O2qOoPb=NiGSrTRSpakcwJQTkssDMYtzg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Sep 2012 10:30:03 +0100
Message-ID: <CAJTo0LYNQrgg3=krn2ezw5w-aByV++Wpw-mszNL6MGGeMdCqRA@mail.gmail.com>
To: Daniel Stone <daniel@fooishbar.org>
X-Gm-Message-State: ALoCoQlqqPja1sqjlgK5oN9TR4P2UsP0leYwb6gWPdpE4FsRkrDg06QXLpNaPwiSneX+2eHAtDnu
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
X-List-Received-Date: Wed, 26 Sep 2012 09:43:16 -0000
Content-Type: text/plain; charset=UTF-8

On 26 September 2012 00:11, Daniel Stone <daniel@fooishbar.org> wrote:
>> The best fix is to just #define _GNU_SOURCE at the top of makekeys
>> then, and push that upstream (mail patch to xorg-devel@lists.x.org).
>
> Actually, it isn't, as that breaks non-glibc badly.  glibc takes
> _GNU_SOURCE to mean 'please add useful GNU extensions to this POSIX
> wasteland', whereas BSD and/or Solaris take it to mean 'please make
> this only GNU and don't use any other extensions at all'.  So we have
> to do whatever AC_USE_SYSTEM_EXTENSIONS does, because that really is
> the only thing that actually works.

What do you mean non-glibc? :)

Ignoring Minix as a build host (I think that's reasonable),
AC_USE_SYSTEM_EXTENSIONS  defines _ALL_SOURCE _GNU_SOURCE
_POSIX_PTHREAD_SEMANTICS _TANDEM_SOURCE, and does a compile-time
sanity test of __EXTENSIONS__ (because it's possible that some
combination of these defines make the system headers unusable on
Solaris).

This is annoying.  How about for oe-core we patch in -D_GNU_SOURCE to
src/util/Makefile.am's CPPFLAGS definition and I'll discuss with
xorg-dev for a proper fix?

Ross


