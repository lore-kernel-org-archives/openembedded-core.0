Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B3B5B731D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:39:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 10 Feb 2016 04:39:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,425,1449561600"; d="scan'208";a="912272441"
Received: from klim22-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.179.126])
	by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2016 04:39:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 01:39:02 +1300
Message-ID: <3179458.vhSGDUP26M@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.4-300.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <1455032081-212934-2-git-send-email-mark.hatle@windriver.com>
References: <1455032081-212934-1-git-send-email-mark.hatle@windriver.com>
	<1455032081-212934-2-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: Re: [RFC][PATCH] buildhistory.bbclass: Break up the find to catch failures
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
X-List-Received-Date: Wed, 10 Feb 2016 12:39:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 09 Feb 2016 09:34:41 Mark Hatle wrote:
> If for some reason the 'find' operation were to fail, the buildhistory would
> not fail, but instead store invalid history!
> 
> [YOCTO #9031]
> 
> Note this fixes the symptom, but not the cause of 9031.  That is a separate
> issue, see the defect for more details on the work being done to resolve the
> cause of the failure.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/buildhistory.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass index 5e2581f..189881e 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -439,10 +439,12 @@ buildhistory_list_files() {
>  	# List the files in the specified directory, but exclude date/time etc.
>  	# This awk script is somewhat messy, but handles where the size is not
> printed for device files under pseudo if [ "$3" = "fakeroot" ] ; then
> -		( cd $1 && ${FAKEROOTENV} ${FAKEROOTCMD} find . ! -path . -printf "%M
> %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 ) +		( 
cd
> $1 && ${FAKEROOTENV} ${FAKEROOTCMD} find . ! -path . -printf "%M %-10u
> %-10g %10s %p -> %l\n" > $2.tmp ) else
> -		( cd $1 && find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n" 
|
> sort -k5 | sed 's/ * -> $//' > $2 ) +		( cd $1 && find . ! -path . -
printf
> "%M %-10u %-10g %10s %p -> %l\n" > $2.tmp ) fi
> +	cat $2.tmp | sort -k5 | sed 's/ * -> $//' > $2
> +	rm $2.tmp
>  }
> 
>  buildhistory_list_pkg_files() {

Would that such contortions weren't necessary, but silently getting bad data 
is worse.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

