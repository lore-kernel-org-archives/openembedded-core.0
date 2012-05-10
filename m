Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SSRYf-0007fF-Ob for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 13:29:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4ABJS9I009190
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 12:19:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09048-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 12:19:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4ABJJKn009184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 12:19:21 +0100
Message-ID: <1336648759.2494.127.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 10 May 2012 12:19:19 +0100
In-Reply-To: <85fc58ba361854e47f2cd078ab62b8f28ca95324.1336608479.git.josh@linux.intel.com>
References: <cover.1336608479.git.josh@linux.intel.com>
	<85fc58ba361854e47f2cd078ab62b8f28ca95324.1336608479.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC PATCH 1/3] lib/bb/utils.py: add optional mode parameter to bb.utils.mkdirhier()
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
X-List-Received-Date: Thu, 10 May 2012 11:29:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-09 at 17:22 -0700, Joshua Lock wrote:
> The optional parameter should be an octal file mode representing the
> desired permissions of the created directory. If mode isn;t specified
> use 0777. This is the default of os.makedirs() yet is not often what
> the created directory ends up with due to umask affecting the call.
> 
> The use of chmod() in this patch ensures that whatever octal is
> passed are the permissions the directory will have after creation.
> This is a behaviour change...
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  bitbake/lib/bb/utils.py |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
> index 7a73419..33206fe 100644
> --- a/bitbake/lib/bb/utils.py
> +++ b/bitbake/lib/bb/utils.py
> @@ -531,13 +531,16 @@ def prune_suffix(var, suffixes, d):
>              return var.replace(suffix, "")
>      return var
>  
> -def mkdirhier(directory):
> +def mkdirhier(directory, mode=0777):
>      """Create a directory like 'mkdir -p', but does not complain if
>      directory already exists like os.makedirs
>      """
>  
>      try:
> -        os.makedirs(directory)
> +        os.makedirs(directory, mode)
> +        # We can't rely on makedirs having set the mode correctly as it is
> +        # affected by umask
> +        os.chmod(directory, mode)
>      except OSError as e:
>          if e.errno != errno.EEXIST:
>              raise e

I'm afraid there are a few holes here. mkdirhier can create parents and
your chmod doesn't change these. I also agree with the comments, I think
this needs to remain unchanged behaviour wise, respecting the umask and
only set a mode if its specified.

Cheers,

Richard




