Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 344DF6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 08:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3C8jirg024720; Sun, 12 Apr 2015 09:45:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QeY95j38Qf-m; Sun, 12 Apr 2015 09:45:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3C8jVet024704
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 12 Apr 2015 09:45:43 +0100
Message-ID: <1428828331.6976.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Apr 2015 09:45:31 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: Performance regression (binutils and gold)
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
X-List-Received-Date: Sun, 12 Apr 2015 08:45:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

To allow us to upgrade to the latest binutils we ended up enabling
building of gold. Unfortunately this is clearly visible on our
performance benchmarks, it leads to a 3-4 minute speed loss in overall
build time :(.

Locally, benchmarks for building binutils-cross show:

Just ld:

95.87user 48.36system 1:05.66elapsed 219%CPU (0avgtext+0avgdata
162480maxresident)k
0inputs+1030184outputs (0major+7753895minor)pagefaults 0swaps

with gold:

366.22user 67.25system 1:14.29elapsed 583%CPU (0avgtext+0avgdata
435488maxresident)k
248inputs+1205792outputs (1major+12572236minor)pagefaults 0swaps
richard@dax:/media/build1/poky/build2$ 

So whilst it only takes 10 seconds longer overall for me on what is a
pretty powerful machine, you can see a huge increase in user time and
CPU usage. I believe that on our slower quad core performance benchmark
machine, this equates to a few minutes.

The question is therefore, do we have a better way to fix things? Is
this performance drop acceptable?

Cheers,

Richard



