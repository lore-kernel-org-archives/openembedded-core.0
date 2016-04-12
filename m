Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 78C3A6FF60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 14:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3CEqiUD017436; Tue, 12 Apr 2016 15:54:21 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vLFqGXIdYqbK; Tue, 12 Apr 2016 15:54:21 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3CEsHtc017510
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 12 Apr 2016 15:54:18 +0100
Message-ID: <1460472857.9308.63.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 15:54:17 +0100
In-Reply-To: <7251ce8da0aed3f9ad921daa66186a2c2fc6a932.1460467072.git.pkj@axis.com>
References: <cover.1460467072.git.pkj@axis.com>
	<7251ce8da0aed3f9ad921daa66186a2c2fc6a932.1460467072.git.pkj@axis.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCHv2 1/1] Revert "useradd.bbclass: remove user/group created by the package in clean* task"
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
X-List-Received-Date: Tue, 12 Apr 2016 14:54:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-04-12 at 15:18 +0200, Peter Kjellerstedt wrote:
> Removal of users/group when cleansstating a recipe as implemented
> here
> totally breaks when multiple recipes install the same user/groups.
> 
> This reverts commit b5304ce438666a7418746f4ddd32703ae3188089.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/sstate.bbclass  |  5 -----
>  meta/classes/useradd.bbclass | 29 -----------------------------
>  2 files changed, 34 deletions(-)

This is one of these situations where we can't win.

Without this code, there is no way to clean up these users out the
sysroot. Having to tell people to "wipe TMPDIR" when the parameters
used to create a user change for example is rather bad. It also has bad
implications for build determinism and the expectation that a "clean"
undoes the changes a recipe makes.

Have we ever documented we support the same user being created by
multiple recipes?

I'm open to proposals about how to fix this but an outright revert
doesn't seem like the right thing to do. Making it optional so you can
disable it for your multiple recipes case would perhaps be a better
option for example.

Cheers,

Richard



