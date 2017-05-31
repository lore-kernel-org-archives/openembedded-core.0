Return-Path: <dev@codyps.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3A6AE7803F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 17:20:01 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id d14so17286946qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 10:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PoqM1uV/uFHUN2whCW3H5r4XX2d03nBd8LfvfBDfZJE=;
	b=GxZ3vppkHjsxd7Z298pLYC6RhvW6+wC2vyFUpPlq6yOlhpPg6uBe7VmNAsdk+BsqKc
	9g2latMVmJUD+34VuolZNPfZ2qH8lX14F5mZ7Wj/+I/g4cZhYC5BGCwI2Z0uGi3o297c
	x4uJy4MKzO9uY8ssIcELX+W5BagoABVSRsi/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PoqM1uV/uFHUN2whCW3H5r4XX2d03nBd8LfvfBDfZJE=;
	b=q2L/lBYKUN2YG3AUCWqMMvf7R1rvgI+ezz2MPAtN92vuF0AqzHeRkkE/1demhDa82V
	JfFLh4buliEqH0wMftu4hCfPtudNl2D1loyrVaJSfyOz4/h7YtaFJS5h6h2g30PmoSV9
	7rglnrD6Wbya6iCtkF6FeGRSXkIk58V9S36hXHwmabS2jkDdAwo/VFmrfVGA+IYSmrNS
	GPruiMdY70joJTA8GKNaqaZbhgOPwwbQ7RRw7NHVJW6GUKoCDoydjmqHfq+siKa7Z3lM
	pU2m8SF1uJc4QZ18CZcmc8fA/B6ljSBP6yjS9CKxRYgucbORMmE4e0YFSFG43A4wJzN1
	m/Aw==
X-Gm-Message-State: AODbwcACuN3mpHMsCpwpzMjytJwjGIysq91Ksl+PAo/Hf27HdYFjJ64p
	JbzJOxo7CNSq192uVovemIn/UTn2SISq
X-Received: by 10.55.200.209 with SMTP id t78mr24699123qkl.178.1496251203160; 
	Wed, 31 May 2017 10:20:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.189.168 with HTTP; Wed, 31 May 2017 10:20:02 -0700 (PDT)
X-Originating-IP: [72.74.84.52]
In-Reply-To: <7bed8363-bd79-0233-3e91-1a74f26fca37@windriver.com>
References: <20170530211436.16397-1-dev@codyps.com>
	<CAPoQQ-1uznmcUSkXs3iLYyK-Bm8gDaT5de_Bi-jF4Su6+KjKvw@mail.gmail.com>
	<CADkTA4MoY27QPks7oJVP-tfs1+Yr1yY9StmXToNT5Rrs9mYJAA@mail.gmail.com>
	<CAPoQQ-00id+nBQ1_n=b=7RNrixOxPZb_5puOvCFmOspQB=O3rw@mail.gmail.com>
	<7bed8363-bd79-0233-3e91-1a74f26fca37@windriver.com>
From: Cody P Schafer <dev@codyps.com>
Date: Wed, 31 May 2017 13:20:02 -0400
Message-ID: <CAPoQQ-3k3HBh97T855_qY4PtBy8Z2qTVuU_BawnBJsvcBCoe8A@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu-export-rootfs: don't change RPC ports
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
X-List-Received-Date: Wed, 31 May 2017 17:20:02 -0000
Content-Type: text/plain; charset="UTF-8"

> Non-root user can't create privileged ports.

I presume you're speaking about tcp/udp ports here? (having the
program numbers referred to as "RPC ports" in some contexts confuses
things). Or does unfsd tell the kernel about it's rpc program numbers
(called "RPC ports" in the script) somehow & restrict them too?

If it is the first, it isn't clear why that is relevant: I'm not
trying to have unfsd use privileged tcp/udp ports (it's already using
non-privlidged tcp/udp ports). I'm trying to drop the custom rpc
program numbers (which are referred to as "RPC Ports" in the script).

