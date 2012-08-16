Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T1yRE-0003kQ-Vr for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 13:40:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7GBSZXi030056;
	Thu, 16 Aug 2012 12:28:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29642-03; Thu, 16 Aug 2012 12:28:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7GBSSC9030031
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 16 Aug 2012 12:28:29 +0100
Message-ID: <1345116507.14667.51.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2012 12:28:27 +0100
In-Reply-To: <1345116093-5872-1-git-send-email-andrei.gherzan@windriver.com>
References: <1345116093-5872-1-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH] bitbake: build.py: Add stampdir argument to cached_mtime_noerror
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 11:40:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-16 at 14:21 +0300, Andrei Gherzan wrote:
> After commit 2718537b4b04eb3d80ab4d74171b58e7b8dd68b8 (bitbake:
> build.py: Only execute mkdirhier if stampdir doesn't exist) build
> failes as cached_mtime_noerror needs an argument - stamp dir. This
> argument was forgotten.
> 
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>  bitbake/lib/bb/build.py |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/bitbake/lib/bb/build.py b/bitbake/lib/bb/build.py
> index d64077e..b484d19 100644
> --- a/bitbake/lib/bb/build.py
> +++ b/bitbake/lib/bb/build.py
> @@ -465,7 +465,7 @@ def stamp_internal(taskname, d, file_name):
>      stamp = bb.parse.siggen.stampfile(stamp, file_name, taskname, extrainfo)
>  
>      stampdir = os.path.dirname(stamp)
> -    if bb.parse.cached_mtime_noerror == 0:
> +    if bb.parse.cached_mtime_noerror(stampdir) == 0:
>          bb.utils.mkdirhier(stampdir)
>  
>      return stamp

I suspect I'd fixed this locally but pushed an old version. I've merged
this, thanks.

Richard



