Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TGYWH-0000Ok-7u
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 19:02:01 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 25 Sep 2012 09:49:10 -0700
Received: by obceq6 with SMTP id eq6so1706139obc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2012 09:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=AVdgCXnNWZhjgApF2QWhcS7afIA8Rya7rApm8vD5ees=;
	b=G8aEkIH+NjQkVEHnaXGZtrRNMaxoJ2SsSvvHEiIv6DJw45XodFjenYYtZ3k4+yzdz5
	ooFrruH+PkJSpHNEYWpr0g0PbvEAa0q1zeQbiiwL/9FXGTSDGL/hC1UUReyZaaO1Wvg5
	1JyOTXwJ4WqtMoojMm7Y64d+dcrfI5b4zmmVg9IhBX/6uB4t92wahgQOEC94sCmMLNe2
	pMJ/PxAel1I3ka4+7txS/nkmMpRn/k3Or9hhHxAN9BX/udTKx2HM/ymGVqUyFD8tArIH
	ntWDs93YAx+3yWMhTssWg862feWcnz3OpF+wCpgDSJn7KIbOWE9vlNjCZ0Eo+YgvuwTv
	jaqA==
Received: by 10.182.179.100 with SMTP id df4mr13061752obc.59.1348591749174;
	Tue, 25 Sep 2012 09:49:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 25 Sep 2012 09:48:49 -0700 (PDT)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6A6CE2@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
	<1348516546-26005-2-git-send-email-msm@freescale.com>
	<CAJTo0LYe6LuFQJS_36PYVsjwnp=N9J-XuiFVMntBi76qt+i4aw@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6A6CE2@039-SN1MPN1-001.039d.mgd.msft.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Sep 2012 17:48:49 +0100
Message-ID: <CAJTo0LZ7LrDg8JfOH6bVDV2PK6mnpqUsdHPwnvmUm1uen8uzMQ@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmmmlMdpPbJSpC9h2G1qhdEEGmuZX0SZgcOgamsz/yOrlaujzh++yx8WhGqT0kEyV/Xeftr
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
X-List-Received-Date: Tue, 25 Sep 2012 17:02:01 -0000
Content-Type: text/plain; charset=UTF-8

Whoops, I dropped oe-core.

On 25 September 2012 16:38, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
>>> Older libc do not have this defined, we can use the -D_GNU_SOURCE
>>> to the compiler to prevent generating calls to this function and
>>> make linking work
>>
>> Why isn't this from configure.ac working?
>>
>> # Set common system defines for POSIX extensions, such as _GNU_SOURCE
>> # Must be called before any macros that run the compiler (like AC_PROG_LIBTOOL)
>> # to avoid autoconf errors.
>> AC_USE_SYSTEM_EXTENSIONS
>
> Do these make it to CC_FOR_BUILD? Here is what it looks like before:

AC_USE_SYSTEM_EXTENSIONS sets _GNU_SOURCE (and more) using AC_DEFINE,
so they end up in config.h... which isn't being included in
makekeys.c.

So the correct and upstreamable fix is to include config.h from makekeys.c.

Ross


