Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T1dac-00065o-TO for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 15:24:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7FDCqAY001379;
	Wed, 15 Aug 2012 14:12:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00424-02; Wed, 15 Aug 2012 14:12:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7FDChTe001373
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 15 Aug 2012 14:12:44 +0100
Message-ID: <1345036362.538.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2012 14:12:42 +0100
In-Reply-To: <5824e7f06b2263fc89efa12f2aeee13f6cf76c54.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
	<5824e7f06b2263fc89efa12f2aeee13f6cf76c54.1344946189.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED REQUEST 55/64] chrpath.bbclass: Account for case when ORIGIN is in RPATH
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
X-List-Received-Date: Wed, 15 Aug 2012 13:24:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-14 at 15:13 +0300, Saul Wold wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> This fixes a case when RPATH embedded in program have one of
> its path already relative to ORIGIN. We were losing that path
> if such a path existed. This patch appends it to the new edited
> rpath being created when we see it.
> 
> so RPATH like below
> 
> (RPATH)              Library rpath:
> [$ORIGIN/../lib/amd64/jli:$ORIGIN/../jre/lib/amd64/jli]
> 
> would end up being empty
> 
> but after this patch its kept intact
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/chrpath.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
> index 10b5ca0..e903b65 100644
> --- a/meta/classes/chrpath.bbclass
> +++ b/meta/classes/chrpath.bbclass
> @@ -49,6 +49,7 @@ def process_dir (directory, d):
>              new_rpaths = []
>              for rpath in rpaths:
>                  # If rpath is already dynamic continue
> +                new_rpaths.append("%s" % (rpath.strip()))
>                  if rpath.find("$ORIGIN") != -1:
>                      continue
>                  # If the rpath shares a root with base_prefix determine a new dynamic rpath from the

Shouldn't this read:

                if rpath.find("$ORIGIN") != -1:
                      new_rpaths.append("%s" % (rpath.strip()))
                      continue

as the code above would add *all* the old rpaths to the binary as well
as any relocations?

Cheers,

Richard



