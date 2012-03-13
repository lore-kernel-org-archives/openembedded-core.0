Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7VSe-0006ME-Ik for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 18:24:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DHFqf7029750
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 17:15:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29092-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 17:15:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DHFgdS029744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 17:15:44 GMT
Message-ID: <1331658943.18586.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Mar 2012 17:15:43 +0000
In-Reply-To: <195b9ad9e78ea2355c0a5594436293e803bd460e.1331605922.git.liezhi.yang@windriver.com>
References: <cover.1331605922.git.liezhi.yang@windriver.com>
	<195b9ad9e78ea2355c0a5594436293e803bd460e.1331605922.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] package.bbclass: create debugsources.list if it doesn't exist
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
X-List-Received-Date: Tue, 13 Mar 2012 17:24:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-03-13 at 10:50 +0800, Robert Yang wrote:
> Serval pkg's debug pkg is null, so the find-debuginfo.sh would not
> generate the ${WORKDIR}/debugsources.list, but the processdebugsrc
> always need it, there are a few such errors currently:(53 pkgs have such
> errors in a core-image-sato build):
> 
> log.do_package:sort: open failed: debugsources.list: No such file or directory
> 
> Create debugsources.list if it doesn't exist would fix this problem.

Why can't we modify the code that uses debugsources.list not to get
upset if it doesn't exist?

This change seems a little backwards to me...

Cheers,

Richard

> [YOCTO #2076]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/package.bbclass |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 9b6862d..8e76ef8 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -243,6 +243,11 @@ def splitfile2(debugsrcdir, d):
>      workparentdir = os.path.dirname(workdir)
>      workbasedir = os.path.basename(workdir)
>      sourcefile = d.expand("${WORKDIR}/debugsources.list")
> +    # There is no debugsources.list when the debug pkg is null, but the
> +    # processdebugsrc needs it, so create one if it doesn't exist.
> +    if not os.path.isfile(sourcefile):
> +        f = open(sourcefile, 'w')
> +        f.close()
>  
>      if debugsrcdir:
>         nosuchdir = []




