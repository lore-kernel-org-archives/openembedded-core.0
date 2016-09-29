Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA6B6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 03:15:01 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id A72C3C495D;
	Wed, 28 Sep 2016 22:15:02 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: "Robert Yang" <liezhi.yang@windriver.com>
Date: Wed, 28 Sep 2016 22:15:01 -0500
Message-ID: <CB33D621-D8CC-4880-AC2F-EAE42D42F943@seebs.net>
In-Reply-To: <23b689b2-d61f-d6db-f49d-86682c9f84fc@windriver.com>
References: <cover.1475043600.git.liezhi.yang@windriver.com>
	<CB05DC3E-85D6-4866-9EA0-7341AC8C5FEC@seebs.net>
	<23b689b2-d61f-d6db-f49d-86682c9f84fc@windriver.com>
MIME-Version: 1.0
X-Mailer: MailMate (1.9.5r5263)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] pseudo: add prefix for log and make log consistent
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
X-List-Received-Date: Thu, 29 Sep 2016 03:15:01 -0000
Content-Type: text/plain; format=flowed

On 28 Sep 2016, at 21:31, Robert Yang wrote:

> Thanks for the reply, I tested your patch from git repo, it doesn't 
> work,
> the message goes to the terminal:
> Child process exit status 4: lock_held

This, it turns out, is a result of a much worse bug which somehow 
previously evaded detection,
and just happened to work by blind luck or coincidence or something.

Which is that pseudo_logfile() was returning, not a file descriptor, but 
"either 0 or -1", but I was then treating it as a file descriptor.

So actually the messages were going to fd 0, not to fd 2, in this case.

Fixed with a one-line patch:
-	return 0;
+	return fd;

(And actually, I think it may make sense to go change those messages 
from pseudo_diag to pseudo_debug, since they're basically useless unless 
you're debugging the startup code.)

-s

