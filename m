Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SB5Mt-0004e8-6t
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 15:21:27 +0100
Received: by qcso7 with SMTP id o7so1967387qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 07:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=EVLEg/YRtXzi01TaSMNFD+GDs3mI179dOX+6OyZF9uM=;
	b=WHOJ2NbCrJ9atBrcJUYtykxbL4cp7lZ4bScNIl+0fU+w6BaPrwj5xW0f6j3YF6eKHA
	e5mef0+IdM6mQImwC5n7MIHn5BX3TwI+iVaROpDapZkuufJLHktfXdsXQKDSOuzjtOxK
	C0ODx3qUnpcwpjPPwCcgUpMdVIRwHrrZzYi28TrdijHv0IY6ruJ2nqOD3HHDT5o4SSEt
	P7C3RcwTSbm+k2lJOCq6IvSZvzFarxjNXX+7v8fYZaYtu3KtUChfKn5v+Yg0fm5qA9t2
	ZGIJZnjpO4VZX9Y4bvGwx07JRxLDO7ZvDFSxZzrBrVp6/bMn1+7jlJx7rZWYLjuWKCkR
	iz4g==
Received: by 10.229.136.12 with SMTP id p12mr4654534qct.125.1332511950745;
	Fri, 23 Mar 2012 07:12:30 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Fri, 23 Mar 2012 07:12:08 -0700 (PDT)
In-Reply-To: <1332506475.9740.409.camel@ted>
References: <4DCCC4C4-51F4-43CF-ACF2-BF3D2BAD7BDC@dominion.thruhere.net>
	<1332506475.9740.409.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 23 Mar 2012 07:12:08 -0700
X-Google-Sender-Auth: 0TtCIWmBoeV7ro09amaIk_ci5kY
Message-ID: <CABcZANm-V7QSXhdu2aUj6G-oekaHpdNohVxFRywrwmTB_GoXGQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: sstate reuse for -native, -cross across different host glibc version, how to make it work?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 14:21:27 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 23, 2012 at 5:41 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-03-23 at 13:22 +0100, Koen Kooi wrote:
>> I turned on sstate mirroring for angstrom recently and I'm getting
>> reports of build failures due to missing GLIBC_2.14 symbols:
>>
>> arm-angstrom-linux-gnueabi-gcc: /lib/x86_64-linux-gnu/libc.so.6:
>> version `GLIBC_2.14' not found (required by
>> arm-angstrom-linux-gnueabi-gcc)
>>
>> The sstate tarballs are built on a Fedora16 VM and the breakage occurs
>> when it being used on systems with an older c library (e.g. debian).
>> To get rid of this problem there are multiple options, but I think the
>> 2 most obvious are:
>>
>> 1) inject host distroname and distroversion into the checksums
>> 2) build everything against a native libc
>>
> 3) Use an older version on the VM which is the oldest distro you plan to
> build against.
>
>> Would it be appropriate to get 1) into oe-core before the branchpoint?
>
> We've talked about this and its been on the "to fix" list but nobody has
> got around to it. Its hard as we need to come up with something that
> isn't going to kill performance of the checksum calculations. A cat
> operation on a few files for each checksum for example isn't
> appropriate. We may need to do something at the bitbake level as there
> is also the issue of checksuming local files such as those in file://
> urls and including that in the sstate checksums.
>
> So whilst I'd love to see fixes for these and they are bugfixes, they're
> going to have to be well written patches and its late in cycle for
> invasive changes :(.

At Mentor, right now, I'm using a ConfigParsed event handler to run
lsb_release and inject the DISTRO/DISTRO_VERSION into the metadata,
which I then use vardeps to ensure get into the appropriate
signatures. Not perfect, but gets the job done.
-- 
Christopher Larson


