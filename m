Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA5F61883
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 14:30:38 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r6AEUbkS032492
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 10 Jul 2013 16:30:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1373466638;
	bh=bXLtRTdL6griJnA7cfddq86EiTnetA/5f3wpIenMxBk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=jFbH4LsBBoI/BHevx0KsDuhCxo6q8r49PgnpX69Bn3MTWJ0jp38ZahXK32Hg18pZe
	f6dxBvHY42g63Uym2yqBXVgaVFIF+16up+M2ruz2MX8JpdPRK735l5vOAQ1naI4ZEU
	hXVN2P4IQU/P+ajVIt0q0qwNbaG02+oprdFubTY0=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r6AEUOVS025831
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 10 Jul 2013 16:30:25 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1UwvPT-0006o2-R1; Wed, 10 Jul 2013 16:30:23 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <ly8v1etzn5.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<ly4nc2twyk.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CADkTA4OgktutnmLz87ps4paqanUZM1P4hYz-eu580-rWZBsZzg@mail.gmail.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 10 Jul 2013 16:30:23 +0200
In-Reply-To: <CADkTA4OgktutnmLz87ps4paqanUZM1P4hYz-eu580-rWZBsZzg@mail.gmail.com>
	(Bruce Ashfield's message of "Wed, 10 Jul 2013 10:57:02 -0300")
Message-ID: <lywqoymqrk.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.0
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Bruce Ashfield <bruce.ashfield-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: kernel miscompilation with gcc 4.8 for ARMv5
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
X-List-Received-Date: Wed, 10 Jul 2013 14:30:38 -0000
Content-Type: text/plain

Bruce Ashfield <bruce.ashfield-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
writes:

>> Applying two upstream kernel commits
>> 455bd4c430b0c0a361f38e8658a0d6cb469942b5 (ARM: 7668/1: fix
>> memset-related crashes caused by recent GCC (4.7.2) optimizations) and
>> 418df63adac56841ef6b0f1fcf435bc64d4ed177 (ARM: 7670/1: fix the memset
>> fix) seem to fix the problem for me.
>
> Correct. Those are the same commits you'll see on linux-yocto-3.8,
> we've been soaking them for a while. I was waiting for LTSI and -stable
> to pick up the changes before updating linux-yocto-3.4, but that hasn't
> happened yet.
>
> If you are using linux-yocto-3.4 and can confirm that it boots for you
> with those patches,

Sorry, I am using a more or less vanilla 3.4 kernel.  Patches fix
the problem there (device boots) and (after knowing about them) the
problematic code is easy to spot:

$ arm-linux-gnueabi-objdump  -d mm/slub.o

000014c4 <init_object>:
    ...
    14fc:       e1a00001        mov     r0, r1
    1500:       e3a0106b        mov     r1, #107        ; 0x6b
    1504:       ebfffffe        bl      0 <memset>
    1508:       e1a03000        mov     r3, r0          <<<<<<<
    150c:       e5942010        ldr     r2, [r4, #16]
    1510:       e3e0105a        mvn     r1, #90 ; 0x5a
    1514:       e0832002        add     r2, r3, r2
    1518:       e5421001        strb    r1, [r2, #-1]

With unpatched memset, 'r0' points to end of buffer.


Enrico

