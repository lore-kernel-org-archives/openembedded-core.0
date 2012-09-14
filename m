Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TCfO7-0007K5-GW
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Sep 2012 01:33:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8ENKtLi025146
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2012 16:20:55 -0700 (PDT)
Received: from msp-dhcp28.wrs.com (172.25.34.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 14 Sep 2012 16:20:54 -0700
Message-ID: <5053BBD6.6000202@windriver.com>
Date: Fri, 14 Sep 2012 18:20:54 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1347664421.git.scott.a.garman@intel.com>
	<674d84a9020d9fc0abfe8a45e6476ef63987d3a6.1347664421.git.scott.a.garman@intel.com>
In-Reply-To: <674d84a9020d9fc0abfe8a45e6476ef63987d3a6.1347664421.git.scott.a.garman@intel.com>
Subject: Re: [PATCH 1/1] runqemu: show bitbake errors to user
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
X-List-Received-Date: Fri, 14 Sep 2012 23:33:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/12 6:15 PM, Scott Garman wrote:
> In certain edge cases, bitbake may fail to run and cause setup_tmpdir()
> within runqemu to fail, and not give the user a helpful error message.
> Catch this case and show the user the output of bitbake -e.
>
> This fixes [YOCTO #3112]
>
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
>   scripts/runqemu |   12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index e843946..8bb77ff 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -283,8 +283,16 @@ setup_tmpdir() {
>           # We have bitbake in PATH, get OE_TMPDIR from bitbake
>           OE_TMPDIR=`MACHINE=$MACHINE bitbake -e | grep ^TMPDIR=\" | cut -d '=' -f2 | cut -d '"' -f2`
>           if [ -z "$OE_TMPDIR" ]; then
> -            echo "Error: this script needs to be run from your build directory,"
> -            echo "or you need to explicitly set OE_TMPDIR in your environment"
> +            # Check for errors from bitbake that the user needs to know about
> +            BITBAKE_OUTPUT=`bitbake -e`

I'm not sure that is a good idea.  If there is a failure (anything on stderr) it 
will just be dumped to the screen...

If it does succeed, it could attempt to load that variable with many MB of data, 
which also likely isn't what is desired.

It might be better to dump the items to a tmp file (securely created of course) 
  ;)  and then keep processing the same file for error messages, warnings, etc...

> +            if [ -z "$BITBAKE_OUTPUT" ]; then
> +                echo "Error: this script needs to be run from your build directory,"
> +                echo "or you need to explicitly set OE_TMPDIR in your environment"
> +            else
> +                echo "There was an error running bitbake to determine TMPDIR"
> +                echo "Here is the output from 'bitbake -e':"
> +                bitbake -e
> +            fi
>               exit 1
>           fi
>       fi
>



