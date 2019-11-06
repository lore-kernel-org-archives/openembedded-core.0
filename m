Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 214D87F82F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 22:12:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 477gl85wd4z9v;
	Wed,  6 Nov 2019 23:12:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573078373;
	bh=piOO6oHRPDQHVkGwVAfmvsTp3+F8t5kqhNx+zfQUvZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C2xw9S9qNHLKCUCB1NktNv5JldnGee2W3AORRwNwoewMBMgU+RDFLwiE9HL4D4HbY
	63MhZlAoEa0xrUPUaldH46Nnx/3urF2REAJMgQ4SzeRXI533dKseLpL2NrnxG/nkml
	PqkR/wiyM6KIhzN0YGnC8wS2lvKRNiy1e6y1e7KkZkr4zhStF2Ft587iLfbFgRsDBq
	pyAY3qwWzmC6itAX4uMXbdHgzKsxSIEcvmVchIo9KNSk/+wxJYz1CKqFhnHknqSly8
	hm8aX3OCEq95kB7Zk+pUaAJgryXi7Obsu1HuUItVY57vSKUjhF17lhn8rhSRcH9yvK
	kQW/61/LzYMyNYEqiHak+WD6aertVJ4eEwrpx232yUjQwwTE3Yj+v1rS2SxInJYsfm
	r76WIwB4wcPWdqkOzcKCUBO/fPx5Vda2PzV1R+zouWvWidOj7MBAufjn3WWkRhlEYU
	rxjwc+aOMTpHDOSmz+AQdM0cM1qBWm3zTqzIl2AZTyCHrbwCKm2bihv/zJG7Wt9KOm
	JT9wdtG/ukyiYRJqQaEzWbCG0UIQkK8IA7zsmZ8Q4a0CbpefB6kfZCRTzG4zOQjao8
	oQ/n+uqi5mays5aOkRfsn0tEtlREXL8t7Pnc122Y/Ph9wQyYGH69aSl1MQN/v58xe9
	OhioGR1NdaI0hbExXZ2UEES4=
Date: Thu, 7 Nov 2019 00:12:50 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alistair Francis <alistair.francis@wdc.com>
Message-ID: <20191106221250.GD14721@localhost>
References: <20191106181819.12517-1-alistair.francis@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20191106181819.12517-1-alistair.francis@wdc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] tune-riscv: Add support for hard and soft float
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
X-List-Received-Date: Wed, 06 Nov 2019 22:12:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 06, 2019 at 10:18:18AM -0800, Alistair Francis wrote:
>...
> +TUNE_CCARGS_riscv64 .= "${@bb.utils.contains('TUNE_FEATURES', 'riscv64-f', ' -mabi=lp64d', ' -mabi=lp64', d)}"
> +TUNE_CCARGS_riscv32 .= "${@bb.utils.contains('TUNE_FEATURES', 'riscv32-f', ' -mabi=ilp32f', ' -mabi=ilp32', d)}"
>...

That looks wrong, what would you put in TUNE_FEATURES
for -mabi=lp64f when -mabi=lp64d is called riscv64-f?

Also note that this is only the floating point calling convention,
whether the compiler emits floating point instructions is defined
by -march.

It would be good if this would start with a plan how to handle
all possible combination of RISC-V ISA extensions, ideally better
than the arm mess.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


