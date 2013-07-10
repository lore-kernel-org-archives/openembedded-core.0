Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id C2FAF60687
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 11:36:54 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r6ABarBo031267
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 13:36:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1373456213;
	bh=9bcNX1Tld/XLH976eO5SSkvECC6Ku01nSuYIVjc9X0Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Sender;
	b=WhA9FKTfHX+lXTiCj26wjYDN9k60W7a0ZeI+cyrG/5N+5ZhejXdkzrJoyhVh4F7V8
	oNAEo9mqk2gvi6dCGqMjKzDnpu3dKbzPzwm/G7MEBMeqh3vvR3Sb4A8rLpZt+ledc1
	J0ZtBhlpN51ghNSSeGBM+UzrbZnhzIsSN3M6c8lY=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r6ABalSQ005674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 13:36:49 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1UwshS-0001rM-Vy
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Jul 2013 13:36:47 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 10 Jul 2013 13:36:46 +0200
Message-ID: <ly8v1etzn5.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Subject: kernel miscompilation with gcc 4.8 for ARMv5
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
X-List-Received-Date: Wed, 10 Jul 2013 11:36:55 -0000
Content-Type: text/plain

Hi,

is it expected that recent gcc 4.8[1] compiles the kernel correctly?
Kernels for ARMv5 platforms (PXA168 -> 3.4.52, MX28 -> 3.8.13) fail here
100% at early boot with

[    0.404750] Unable to handle kernel paging request at virtual address 00210020
[    0.412468] pgd = c0004000
[    0.415187] [00210020] *pgd=00000000
[    0.418812] Internal error: Oops: 5 [#1] PREEMPT ARM
[    0.423781] CPU: 0    Not tainted  (3.8.13.ipan4 #1)
[    0.428781] PC is at kmem_cache_alloc+0x44/0xcc
[    0.433375] LR is at con_insert_unipair+0xa4/0xf0
[    0.438093] pc : [<c00a6d7c>]    lr : [<c02dc654>]    psr: 20000053

(this is a similar error as described in [2]).  Enabling heavy memory
debugging shows

[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xc8800000 - 0xff000000   ( 872 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)
[    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
[    0.000000]       .text : 0xc0008000 - 0xc0436000   (4280 kB)
[    0.000000]       .init : 0xc0436000 - 0xc046a000   ( 208 kB)
[    0.000000]       .data : 0xc046a000 - 0xc049bff8   ( 200 kB)
[    0.000000]        .bss : 0xc049c01c - 0xc0511680   ( 470 kB)
[    0.000000] =============================================================================
[    0.000000] BUG kmem_cache_node (Not tainted): Redzone overwritten
[    0.000000] -----------------------------------------------------------------------------
[    0.000000] 
[    0.000000] INFO: 0xc78010fc-0xc78010ff. First byte 0x5a instead of 0xbb
[    0.000000] INFO: Slab 0xc0620024 objects=18 used=18 fp=0x  (null) flags=0x0080
[    0.000000] INFO: Object 0xc78010e0 @offset=224 fp=0xc78011c0
[    0.000000] 
[    0.000000] Bytes b4 c78010d0: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[    0.000000] Object c78010e0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[    0.000000] Object c78010f0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 5a              kkkkkkkkkkkZ
[    0.000000] Redzone c78010fc: 5a 5a 5a 5a                                      ZZZZ
[    0.000000] Padding c78011a4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[    0.000000] Padding c78011b4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a              ZZZZZZZZZZZZ
[    0.000000] Backtrace: 

for the 3.4.52 kernel.  Compiling mm/slub.o with -O1 fixes *these*
problems but there happen other crashes later.


A kernel compiled for an ARMv7 platform (OMAP4, kernel 3.4.43) seems to
work (although there might be enabled other kernel options).


Are these problems resp. fixes known?



Enrico

Footnotes: 
[1]  from 4f5009dcbbeb27bdf5dcaebb3b457fecef410ebe

[2]  https://bugs.launchpad.net/ubuntu/+source/gcc-4.8/+bug/1178847

