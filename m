Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TkeNB-0008L7-6U
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 18:21:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Dec 2012 09:06:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,303,1355126400"; d="scan'208";a="235170224"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.59])
	by orsmga001.jf.intel.com with ESMTP; 17 Dec 2012 09:06:19 -0800
Message-ID: <50CF510B.7040705@linux.intel.com>
Date: Mon, 17 Dec 2012 09:06:19 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Alex DAMIAN <alexandru.damian@intel.com>
References: <1355743753-12947-1-git-send-email-alexandru.damian@intel.com>
	<1355748923-24459-1-git-send-email-alexandru.damian@intel.com>
In-Reply-To: <1355748923-24459-1-git-send-email-alexandru.damian@intel.com>
X-Enigmail-Version: 1.4.6
Cc: damien.lespiau@intel.com, otavio@ossystems.com.br,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] init-live: default to initrd shell if image isn't found
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2012 17:21:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 12/17/2012 04:55 AM, Alex DAMIAN wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
> 
> Adds "debugshell" command line parameter for live/install images.
> 
> If the init live fails to find and mount a root-fs image,
> dumps to a shell after timeout so that the developer can figure
> what's wrong.
> 
> Timeout defaults to 30 seconds, but it can be changed as param
> argument.
> 
> Prior art in Ubuntu. Also, leaving a system stale isn't good form.
> 
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>  meta/recipes-core/initrdscripts/files/init-live.sh |   18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
> index c591f0d..d99a8ea 100644
> --- a/meta/recipes-core/initrdscripts/files/init-live.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-live.sh
> @@ -45,7 +45,13 @@ read_args() {
>                      console_params=$arg
>                  else
>                      console_params="$console_params $arg"
> -                fi
> +                fi ;;
> +            debugshell*)
> +                if [ -z "$optarg" ]; then
> +                        shelltimeout=30
> +                else
> +                        shelltimeout=$optarg
> +                fi 
>          esac
>      done
>  }
> @@ -75,6 +81,7 @@ early_setup
>  read_args
>  
>  echo "Waiting for removable media..."
> +C=0
>  while true
>  do
>    for i in `ls /media 2>/dev/null`; do
> @@ -90,6 +97,15 @@ do
>    if [ "$found" = "yes" ]; then
>        break;
>    fi
> +  # don't wait for more than $shelltimeout seconds, if it's set
> +  if [ -n "$shelltimeout" ]; then
> +      echo -n " " $(( $shelltimeout - $C ))
> +      if [ $C -ge $shelltimeout ]; then
> +           echo "..."
> +           fatal "Cannot find root image on media, dropping to shell "

I'd recommend being explicity about what it is looking for when
debugshell is used. Which devices where probed, what was the file it
looked for. Save the developer from having to find this script in the
repository and look it up.

--
Darren

> +      fi
> +      C=$(( C + 1 ))
> +  fi
>    sleep 1
>  done
>  
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


