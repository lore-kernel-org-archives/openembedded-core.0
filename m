Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA577F21B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 14:55:29 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q12so9028464wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 07:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=sa4mtJu2moLspcOLewHgYwjFVhnsJF/krin62lrsdbM=;
	b=Ocg+sqD9oIJXNlE/XrS4ictEzAnK0ztrvpPe6wUgVXFx+US9ZZGZvFv/jAVs8dSHc+
	JFrCqRpcmq15f+SJHhQzqnTMEEs/0koGkU/Z5eHgbd6hh8sh7vPsK3hjHWtHZ0fjTLw5
	XLwRx5Ceir+ScBJMFbVuOJDlnEyfMXTdFN5Tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=sa4mtJu2moLspcOLewHgYwjFVhnsJF/krin62lrsdbM=;
	b=gLAJSPMvb76UIqroKug5ui+KAIrGIhFnXWg4e6f/bFt0dFLD4GGuVIhpdDjDJfgppN
	fULgouFS/Gj+aUUPUkXVjNJodKUGtP1gM1akRl1BSdk+TAyFDzoEK2ws3wcHRpmBmLK7
	NT+JjfWLxXSoqLaGRapXkOAzODKadwwWuT4GYKrhf+RUY/49pGh9SHPY/bi34Wc4MqfN
	ffmMiM84zW4l3xL6aOnnqjHFKuTsBruG9K1ciyPquynxX31qCU+OIkpOqX1fFrFwu/GX
	pZIpo0gGOvwbj80QnRyrOiMUYYnBs1lvzR3o3J4oimcMrbOdE0aEP9nzIEQOCn+5sJzF
	UKsQ==
X-Gm-Message-State: APjAAAXYEeZlmZlFbm0aNW8t5Df3pqHJtAy0n1bA0SJzmBU4D9O1pzbY
	zXyeTv2qS7nA/vcqMF/qNhJYeQ==
X-Google-Smtp-Source: APXvYqz90VYoNNwuW1Hvg41FGEnsIiT9DIAqq1/3ijT65n5qu4PLfPAd7Tza+6w6owxM5fpJANPnwQ==
X-Received: by 2002:adf:8541:: with SMTP id 59mr27938560wrh.298.1566226530649; 
	Mon, 19 Aug 2019 07:55:30 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g2sm30359168wru.27.2019.08.19.07.55.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 19 Aug 2019 07:55:29 -0700 (PDT)
Message-ID: <28dbc362015c3cbae5b8550e8636e74802afbfc3.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>, Hongxu Jia
	<hongxu.jia@windriver.com>
Date: Mon, 19 Aug 2019 15:55:27 +0100
In-Reply-To: <CANNYZj9y6uP-=iSDLj=wQ-LTuAgBTsHL7F84eiCSs8=aycjZMg@mail.gmail.com>
References: <1566221602-123706-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj9y6uP-=iSDLj=wQ-LTuAgBTsHL7F84eiCSs8=aycjZMg@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: decreasing default RLIMIT_NOFILE on qemu bsp
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
X-List-Received-Date: Mon, 19 Aug 2019 14:55:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-08-19 at 16:01 +0200, Alexander Kanavin wrote:
> Should the limit be simply raised? The 256M setup is crumbling on
> several fronts (runtime tests, modernisation of X, various non-x86
> qemu targets). Adding per-image/target exceptions, custom non-
> upstreamable patches, or sticking to deprecated configurations isn't
> the right thing to do, I think.

What kind of devices/uses are we meant to be targeting?

I believe OE is suited to optimised used cases where constraints on
size and performance are quite likely and supported.

This is *exactly* the kind of thing we should be exploring and
supporting. systemd is not designed for some of the systems we target.
Changing some of its configuration shouldn't be a surprise.

Having NFS taking up half the available memory doesn't make sense,
particularly when the sysvinit limits have worked for us for years. I
therefore appreciate Hongxu figuring out what the difference was and I
believe we should change this to something more suited for our target
audience, unless someone can explain why this is a bad idea.

Similarly, forcing everyone to full GL stacks under qemu simply is not
acceptable. For example I might have a single container type image
which I want to load/test under qemu. Forcing such usage to require
512MB memory for what could be a headless system also isn't right and
will just frustrate users. Users need to be able to access headless or
2D configurations of it.

I'm sorry I haven't been as active with general patch review recently
as I'd like. I did say that trying to change runqueue would distract me
from the usual day to day running of the project. We need to sort this
problem out but not the way you keep trying to.

Where images have specific memory needs, we should increase the
headroom for those images. Images with SDK tools, or stap make sense to
have more memory.

I'd even possibly accept a case for higher memory defaults for graphics
images when GL is enabled. Pushing the default qemu memory size to
512MB everywhere is wrong though and sends out the wrong message for
the project.

Cheers,

Richard



