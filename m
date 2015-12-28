Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4894E6013D;
	Mon, 28 Dec 2015 13:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBSD0hUl016902; Mon, 28 Dec 2015 13:00:43 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qhxyVvEOLyrN; Mon, 28 Dec 2015 13:00:43 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBSD0elq016895
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 28 Dec 2015 13:00:41 GMT
Message-ID: <1451307640.4129.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Mon, 28 Dec 2015 13:00:40 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: RFC: Split do_rootfs into image specific tasks?
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
X-List-Received-Date: Mon, 28 Dec 2015 13:00:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've heard complaints from people trying to create more interesting
image types about how hard it is to understand the rootfs/image
generation code and that its a pain to develop/test/debug.

Having looked at it myself, the internal construction of shell
functions which then gets passed into a multiprocessing pool is rather
convoluted and it places rather odd constraints on when variables are
expanded. Its therefore no wonder people find it confusing/complex.

I've sent three patches to the OE-Core list which illustrate how we
could split the code in lib/oe/image into separate tasks, one per image
type. This removes the need for the simple task graph code and defers
to the bitbake task management code to handle this instead.

This is a good step forward in splitting up the monolithic code and
starting to make it more accessible to people. It should also make it
easier for people to hook in other tasks and processes into the rootfs
code.

Incidentally, the reason this code was all combined originally was due
to limitations of fakeroot where if you exited the session, you lost
permissions data. With pseudo this constraint was removed.

We did start to rework the rootfs/image code previously and got so far
with untangling it however we did prioritise some performance tweaks
over splitting into separate tasks and in hindsight, this was a mistake
and should have been done the other way around. That work was suspended
due to changes in the people working on the project but this split has
always been intended, now is the time to finish it IMO.

The code I've sent does work but is not finished yet and has only had
basic testing. Things that remain to be done:

* Handling of IMAGE_GEN_DEBUGFS needs reimplementing on the new code   
  structure
* Some variable dependencies on do_rootfs need moving to do_image
* References to do_rootfs need auditing to see if they should now be 
  do_image_complete
* Changes need documenting with migration notes.
* The layout of image.bbclass is pretty horrid and needs cleanup, along
  with moving functions to the right places
* We should only calculate the rootfs size once, not once per image 
  type.

This work could also be a stepping stone towards further changes to the
rootfs backends. Right now its pretty backwards compatible but we could
change the API a bit and create the image types as specific tasks right
from the start rather than hand crafting shell functions as we do now
for example. I believe there would be further benefits in debugging and
ease of understanding of the codebase if we did that.

I guess the real question is whether people like this direction and how
much should we change the API in order to improve things? Could we
afford a pretty heavy rewrite in this area to give a good end result?

Cheers,

Richard


