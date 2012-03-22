Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SAjpG-0003IX-Iz
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 16:21:18 +0100
Received: by wgbdr12 with SMTP id dr12so1272762wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 08:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to:x-mailer:x-gm-message-state:content-type
	:content-transfer-encoding;
	bh=DATjV8UClB4+cUikvwfZSidiZNZu/X6lrqEKmrnuk4c=;
	b=KOJnz78tVvYKa6rzOLPblEo6JWITLvYX9xrRqE3/fqJ9lpoY6KNdYyGZ84avCtzYQb
	YDFVCAg8eWDNaTaW+F2oOc4pDIhDCg8BWo8Pun5DQPNGsrMbM6NxqvKmBq4oLbb89p78
	NojE89S5/kp3/HtunSGc09HhC9v8pEbiAAYVTkye/aDxU5iATVenfXfR8r5Xcdlbyw5b
	jKzBNcSxiyND8XyYtgXAHVIp6LGQ1nhYVDjYvn2Baune73Hq40gV4otwNzkxqCzNYpk9
	zfiE1QK1WzlX6dDWblIfajH59OZckxVXGkKWvw/r7BVO2OgKKRbwZ4ZQwXnbZe1Ardg2
	X5xQ==
Received: by 10.180.81.166 with SMTP id b6mr6000587wiy.0.1332429143806;
	Thu, 22 Mar 2012 08:12:23 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gp8sm5887554wib.5.2012.03.22.08.12.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 08:12:23 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1332427771.9740.240.camel@ted>
Date: Thu, 22 Mar 2012 16:12:21 +0100
Message-Id: <7F144BE0-BBF4-4EE0-9A1E-A6842C846E00@dominion.thruhere.net>
References: <2207E1AD-E06F-40D6-9FD7-1452805A4CF3@dominion.thruhere.net>
	<1332427771.9740.240.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkpUqJNu8usjhm2aqZqVlyV3ZF7qxf81MRszoMNWAGnxBYbNMZSnKHWn2OtZguOQtktIuVN
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>
Subject: Re: Syscall backporting and linux-libc-headers
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
X-List-Received-Date: Thu, 22 Mar 2012 15:21:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 mrt. 2012, om 15:49 heeft Richard Purdie het volgende geschreven:

> On Thu, 2012-03-22 at 13:22 +0100, Koen Kooi wrote:
>> In my never ending quest to get consolekit/polkit/etc working =
properly
>> I've found that CONFIG_AUDITSYSCALL is really usefull (it's usefull =
in
>> other contexts as well, but that's outside the oe-core set of
>> recipes). It has the following problem:
>>=20
>> config AUDITSYSCALL
>>        bool "Enable system-call auditing support"
>>        depends on AUDIT && (X86 || PPC || S390 || IA64 || UML ||
>> SPARC64 || SUPERH)
>>=20
>> No MIPS or ARM support. There recently was a pull request from Al =
Viro
>> to get at least ARM support into mainline, but I'm not sure what
>> happened to that. Anyway, I backported the ARM patch to 3.0 and 3.2,
>> but to make it usefull I'd need to patch linux-libc-headers and bump
>> PR on virtual/libc.
>>=20
>> What's the OE-core position on backporting syscalls to
>> linux-libc-headers?=20
>=20
> Why can't we just increase the linux-libc-headers version?

In this case that would be perfectly fine. And bump PR in virtual/libc =
of course :)

> Presumably
> someone running a kernel without the patches won't see any issue, the
> syscall just won't be present and software will fall back?

Exactly

> I think the big concern would be deviating from mainline as its not so
> much a backport as a divergence at this point (and this is why we =
can't
> just upgrade)?

Speaking of divergence, what is the point of having =
linux-libc-headers-yocto_git.bb ?

regards,

Koen=


