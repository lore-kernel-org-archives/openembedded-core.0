Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6414D65D59
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 09:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sB49tpM5009994; Thu, 4 Dec 2014 09:55:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BqDiV9D_8cX8; Thu,  4 Dec 2014 09:55:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sB49tZFU009986
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 4 Dec 2014 09:55:47 GMT
Message-ID: <1417686972.15614.51.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Thu, 04 Dec 2014 09:56:12 +0000
In-Reply-To: <0f0404871231fee1f0f3d6448e843fa2089d7d90.1417594233.git.hongxu.jia@windriver.com>
References: <cover.1417594233.git.hongxu.jia@windriver.com>
	<0f0404871231fee1f0f3d6448e843fa2089d7d90.1417594233.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] archiver: execute the probable tasks between do_unpack and do_patch
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
X-List-Received-Date: Thu, 04 Dec 2014 09:56:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-12-03 at 16:16 +0800, Hongxu Jia wrote:
> While archiver inherited, we edit a recipe (such
> as gzip) to insert four tasks between do_patch and
> do_unpack:
> ...
> addtask test1 after do_unpack before do_patch
> addtask test2 after do_unpack before do_test1
> addtask test3 after do_test2 before do_test1
> addtask test4 after do_test2 before do_test1
> ...
> 
> While building the recipe, the archiver will
> missing these four task in do_unpack_and_patch.
> Because it is hardcoded to execute do_unpach and
> do_patch, did not consider the probable tasks
> between them.
> 
> We make use of the value of _task_deps which
> provided by metadata to compute the probable
> tasks between do_unpack and do_patch and execute
> them.

_task_deps is not provided by the metadata, its a bitbake internal
variable and it should not be being used in public API like this. The
bitbake maintainers reserve the right to change structure and existence
of _task_deps freely. So this patch *cannot* merge in this form.

I do appreciate the problem you're trying to solve and that its a hard
one to deal with.

We should probably add some API to bb.build which allows the code to
query information about tasks. I would prefer to only expose the
information we need (the parents) rather than the whole contents of
_task_deps since that may change over time. The main reason that
structure exists at all is a performance optimisation inside the core of
bitbake.

Thinking about this further, have you looked at BB_TASKDEPDATA? You may
well be able to extract the information you need from that and that *is*
public API.

Cheers,

Richard




