Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5AB7760024
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 08:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5T8LN96032299; Mon, 29 Jun 2015 09:21:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fW6paKVbtkAE; Mon, 29 Jun 2015 09:21:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5T8L927032208
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 29 Jun 2015 09:21:20 +0100
Message-ID: <1435566069.7287.22.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Mon, 29 Jun 2015 09:21:09 +0100
In-Reply-To: <bf978a7894f51c909ede7f64c28b6da5495d981a.1435135356.git.liezhi.yang@windriver.com>
References: <cover.1435135356.git.liezhi.yang@windriver.com>
	<bf978a7894f51c909ede7f64c28b6da5495d981a.1435135356.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] file: 5.22 -> 5.23
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
X-List-Received-Date: Mon, 29 Jun 2015 08:21:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-06-24 at 01:55 -0700, Robert Yang wrote:
> Updated 0001-Add-P-prompt-into-Usage-info.patch.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../file/0001-Add-P-prompt-into-Usage-info.patch   |    6 +++---
>  .../file/{file_5.22.bb => file_5.23.bb}            |    6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  rename meta/recipes-devtools/file/{file_5.22.bb => file_5.23.bb} (81%)

I've noticed an additional problem with the file recipe, specifically
that it tries to run the file it just built (in the -native case) and
this links against libmagic.so. When it runs, it can use
the /usr/lib/libmagic instead of the one in WORKDIR. If you have file
2.22 on your system (e.g. Ubuntu 15.04), you can get an error.

The fix I found was to add an LD_LIBRBARY_PATH to the Makefile:

	LD_LIBRARY_PATH=$(top_builddir)/src/.libs $(FILE_COMPILE) -C -m magic

which is ugly but appeared to fix the error I was seeing. There was a
bug a while back I was unable to reproduce and this is likely the cause
of that too, it all depends which version of libmagic you have on your
system.

Cheers,

Richard




