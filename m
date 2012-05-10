Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SSHNh-0004FT-93
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 02:37:21 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 May 2012 17:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164206190"
Received: from unknown (HELO [10.255.12.218]) ([10.255.12.218])
	by fmsmga002.fm.intel.com with ESMTP; 09 May 2012 17:27:22 -0700
Message-ID: <4FAB0B6A.6010303@linux.intel.com>
Date: Wed, 09 May 2012 17:27:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336608479.git.josh@linux.intel.com>
	<934fed48b0c07e606c80023ba045c6c2471bf1b0.1336608479.git.josh@linux.intel.com>
In-Reply-To: <934fed48b0c07e606c80023ba045c6c2471bf1b0.1336608479.git.josh@linux.intel.com>
Subject: Re: [RFC PATCH 3/3] sstate.bbclass: ensure sstate files are easily shared
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
X-List-Received-Date: Thu, 10 May 2012 00:37:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2012 05:22 PM, Joshua Lock wrote:
> In order to make sstate cache's more easily shared ensure any user of
> the system has rwx permission by calling chown on sstate files after
> they're created.
>
> Signed-off-by: Joshua Lock<josh@linux.intel.com>
> ---
>   meta/classes/sstate.bbclass |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index a8c98e5..6707ecf 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -454,6 +454,7 @@ sstate_create_package () {
>   	else
>   		tar -cz --file=$TFILE --files-from=/dev/null
>   	fi
> +	chmod 0777 $TFILE
>   	mv $TFILE ${SSTATE_PKG}
>
>   	cd ${WORKDIR}
Why execute permission, and should it not be restricted to 664 for group 
level write access?  Why would multiple users be writing to the same 
sstate file anyways once it's there it could be read-only since a change 
will trigger a new sstate file, not a re-write of the existing one.

Sau!


