Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QSNDF-0000Kk-Px
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 07:46:25 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Jun 2011 22:43:12 -0700
X-ExtLoop1: 1
Received: from unknown (HELO [10.255.13.71]) ([10.255.13.71])
	by orsmga002.jf.intel.com with ESMTP; 02 Jun 2011 22:43:12 -0700
Message-ID: <4DE8746F.2000100@linux.intel.com>
Date: Thu, 02 Jun 2011 22:43:11 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1307040964-11468-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1307040964-11468-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] base.bbclass: add cleansstate task between clean	and cleanall
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
X-List-Received-Date: Fri, 03 Jun 2011 05:46:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/02/2011 11:56 AM, Martin Jansa wrote:
> * sometimes it's usefull to remove only sstate cache and keep downloaded sources for rebuild
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/base.bbclass |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 8f4ef1e..6f0484e 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -408,10 +408,13 @@ def check_gcc3(data):
>  	
>  	return False
>  
> -addtask cleanall after do_clean
> -python do_cleanall() {
> +addtask cleansstate after do_clean
> +python do_cleansstate() {
>          sstate_clean_cachefiles(d)
> +}
>  
> +addtask cleanall after do_cleansstate
> +python do_cleanall() {
>          src_uri = (bb.data.getVar('SRC_URI', d, True) or "").split()
>          if len(src_uri) == 0:
>              return

I do this _a lot_ manually. This would take some of the guesswork and
lazy wildcard usage deleting more than is necessary. Is there any
documentation necessary to make it clear how this new clean directive
would be used? I know there is some resistance to adding additional
clean variants - some docs might help assuage that?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


