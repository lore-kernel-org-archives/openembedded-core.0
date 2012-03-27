Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SCWIP-0007B9-DX
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 15:18:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id C7D06315A8DD;
	Tue, 27 Mar 2012 15:09:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id czOWILMz2ZFx; Tue, 27 Mar 2012 15:09:36 +0200 (CEST)
Received: from [172.22.22.61] (drms-4d014418.pool.mediaWays.net [77.1.68.24])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 710B2315A8DF;
	Tue, 27 Mar 2012 15:09:36 +0200 (CEST)
Message-ID: <4F71BC0F.6060905@opendreambox.org>
Date: Tue, 27 Mar 2012 15:09:35 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1332848153.git.paul.eggleton@linux.intel.com>
	<198e1157afad1418826484e4044f59c7741b57f9.1332848153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <198e1157afad1418826484e4044f59c7741b57f9.1332848153.git.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] scripts/bitbake: add/fix some comments
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
X-List-Received-Date: Tue, 27 Mar 2012 13:18:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 27.03.2012 13:50, Paul Eggleton wrote:
> Add some comments explaining what this script does, fix one grammatical
> error in a comment and make the tar-replacement-native comment give the
> full reason why it is needed.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Acked-by: Andreas Oberritter <obi@opendreambox.org>

> ---
>  scripts/bitbake |   16 +++++++++++++---
>  1 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/bitbake b/scripts/bitbake
> index f02e89b..a8adeb7 100755
> --- a/scripts/bitbake
> +++ b/scripts/bitbake
> @@ -1,10 +1,20 @@
>  #!/bin/sh
>  
> +# This is the bitbake wrapper script that ensures everything is set up
> +# correctly in the environment, builds pseudo separately if it hasn't
> +# already been built, and then runs bitbake within pseudo.
> +
>  export BBFETCH2=True
>  export BB_ENV_EXTRAWHITE="PSEUDO_BUILD PSEUDO_DISABLED $BB_ENV_EXTRAWHITE"
>  
> +# For certain operations (i.e. that won't be actually running any tasks)
> +# we don't need pseudo
>  NO_BUILD_OPTS="--version -h --help -p --parse-only -s --show-versions -e --environment -g --graphviz"
> +
> +# Some options are useful to pass through to the initial pseudo build if
> +# that needs to be run (for debugging)
>  PASSTHROUGH_OPTS="-D -DD -DDD -DDDD -v"
> +
>  needpseudo="1"
>  for opt in $@; do
>  for key in $NO_BUILD_OPTS; do
> @@ -29,7 +39,7 @@ if [ "$py_v3_check" != "" ]; then
>  fi
>  
>  # Similarly, we now have code that doesn't parse correctly with older
> -# versions of Python, and rather than fixing that and be eternally
> +# versions of Python, and rather than fixing that and being eternally
>  # vigilant for any other new feature use, just check the version here.
>  py_v26_check=`python -c 'import sys; print sys.version_info >= (2,6,0)'`
>  if [ "$py_v26_check" != "True" ]; then
> @@ -53,8 +63,8 @@ float_test() {
>       echo | awk 'END { exit ( !( '"$1"')); }'
>  }
>  
> -# Tar version 1.24 and onwards handle symlinks in sstate packages correctly
> -# but earlier versions do not
> +# Tar version 1.24 and onwards handle overwriting symlinks correctly
> +# but earlier versions do not; this needs to work properly for sstate
>  float_test "$TARVERSION > 1.23" && needtar="0"
>  
>  buildpseudo="1"



