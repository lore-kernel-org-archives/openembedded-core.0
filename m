Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SSRbf-0007iF-Lr for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 13:32:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4ABMYcB009219
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 12:22:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09172-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 12:22:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4ABMPtT009213
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 12:22:26 +0100
Message-ID: <1336648944.2494.128.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 10 May 2012 12:22:24 +0100
In-Reply-To: <4048abda9d53e155e0802663af9c78f542499e8e.1336608479.git.josh@linux.intel.com>
References: <cover.1336608479.git.josh@linux.intel.com>
	<4048abda9d53e155e0802663af9c78f542499e8e.1336608479.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC PATCH 2/3] lib/bb/siggen.py: create permissive files and directories
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
X-List-Received-Date: Thu, 10 May 2012 11:32:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-09 at 17:22 -0700, Joshua Lock wrote:
> Create signature files, and the directories which contain them, with
> rwx for everyone so that they are easily shared with different users
> of the same machine.
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  bitbake/lib/bb/siggen.py |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
> index 8c79b17..bd6d59b 100644
> --- a/bitbake/lib/bb/siggen.py
> +++ b/bitbake/lib/bb/siggen.py
> @@ -201,7 +201,12 @@ class SignatureGeneratorBasic(SignatureGenerator):
>              for dep in data['runtaskdeps']:
>                  data['runtaskhashes'][dep] = self.taskhash[dep]
>  
> -        p = pickle.Pickler(file(sigfile, "wb"), -1)
> +        # Create file with permissive (0777) read/write for easier sharing
> +        f = os.fdopen(os.open(sigfile, os.O_RDWR|os.O_CREAT), "wb")
> +        # os.open() and os.fdopen() are affected by the users umask so brute force
> +        # the permissions with a call to chmod
> +        os.chmod(sigfile, 0777)
> +        p = pickle.Pickler(f, -1)
>          p.dump(data)

Why not just run the chmod after the original pickle code? Its not as if
you avoid a race this way :/.

Cheers,

Richard





