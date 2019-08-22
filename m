Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB577C7A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 16:20:13 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id t16so5998177wra.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 09:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=JOW1cgM6FoCm5tzG3d/OX1LQQEBYMhlqCFfJXQeh52Q=;
	b=UdAKwmpDC9mOSXQA4x7rUPvm+ak5NQ11AbK9OlB3TN6/FUm6tEt0mWQ13W9vnhTGGt
	sl1dqX7FZ8s+ooCBviN917RKlfVxCpDQw22t5ujCzeIatTU+7yu4q+6pJjdLeaDClQmb
	n4FN9LSYUaI0TmWg23PKdsdBXPGpELpMaoong=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=JOW1cgM6FoCm5tzG3d/OX1LQQEBYMhlqCFfJXQeh52Q=;
	b=JtlR76P2BoiixtGD+YcXDVq+HnAPL7UkpZFSTqiEgo5q3CQyDBS4ftDlUWntV4yBN5
	V1uo8CU/bBmElITbBo4q2KNMAcwesvmL7Vi3O0E3ovDJMwwO1R8+Or3yu28Z507EjDay
	m56Ep3Aifg6pqT1spKk8GkyMdviNYhm1qwXxVjBNIYdvOvFvcXlLQtq/CPnwviUGvByE
	Ep+PSE3P0k2sq8vw4XrjR6HZ0c8adPlBvNBgtLqNve1+zg4LKfbmcSDsOCDu8kFeOLW3
	1au8fTXx8RWRSQ1YSun53MHNkHaX14lG+4+xebcQseHfUGfF1cCIEoZhrL0z722RByEG
	3tzQ==
X-Gm-Message-State: APjAAAWTcYqH4xrxTVfy9VPaBh/2H9GOI/oiWz1F3xIjwkiK//B7CFHl
	cQhELf6fjqCw0SnEUbsXolP43jmbWHb1wA==
X-Google-Smtp-Source: APXvYqxi+XX6c7PtsZ6UeliXaTStNDrQmbaOPDLi14HxJd+Olq3lMZZKSNUdgj8g2rOocqe5Nf8XIA==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr51083756wro.190.1566490814329;
	Thu, 22 Aug 2019 09:20:14 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k124sm11465867wmk.47.2019.08.22.09.20.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 22 Aug 2019 09:20:13 -0700 (PDT)
Message-ID: <7f3ba0cee887064b4716353f31bcd2e64b1ce291.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Joshua
	Watt <jpewhacker@gmail.com>
Date: Thu, 22 Aug 2019 17:20:12 +0100
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Hash Equiv Server experiment results
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
X-List-Received-Date: Thu, 22 Aug 2019 16:20:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I wanted to summarise what my local tests with the hash server
concluded.

a) the opendb() changes I made in:
   http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=ca04aaf7b51e3ee2bb04da970d5f20f2c9982cb8
   broke things as the database is opened for each request. I have 
   local patches to fix that but it only helps by about 10%.

b) the overhead from the separate receive and handling threads is not 
   worth the overhead:
   http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d40d7e43856f176c45cf515644b5f211c708e237
   This probably halves throughput.

c) I moved the database writes to their own thread with a queue but it 
   doesn't seem to help much other than allowing other threads to 
   handle requests in parallel.

d) the ThreadedMixin regresses performance further and is the worst 
   change I've tested.

e) Using ThreadPoolExecutor along the lines of:
   self.executor = concurrent.futures.ThreadPoolExecutor(max_workers=10)
   self.executor.submit(self.process_request_thread, request, client_address)
   doesn't help speed. Its faster then ThreadedMixin but slower than no threads.

f) The profile data I have suggests we spend a lot of time in TCP/HTTP 
   header overhead and connection setup which confirms Joshua's 
   thoughts.

g) The most optimal setup is therefore the original server with no 
   threading.

h) The autobuilder would need to cope with 9000*40 requests in under a 
   minute, preferably faster. The current server does not have 
   anywhere near that speed.

My conclusion based on this is that we need to rewrite the way runqueue
makes the hash computations, perhaps seeding the cache in advance so we
minimise the number of single calls. We can make one query for all 9000
entries to the server on a single connection/request, or batch in
blocks of 1000 or similar.

The other option would be a custom server/protocol but I think what
we're using is fine, we just need to change how.

I have some profiling code for the hashserver but its doing profiling
per thread so doesn't integrate well until we decide what form the
codebase should have. Simpler is looking to perform better.

I haven't had a chance to work on these patches, nor will I over the
next few days as I'm taking a break but I think I know what we need to
do now.

Cheers,

Richard



