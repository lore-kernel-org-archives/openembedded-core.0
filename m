Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UNhHT-0008MR-Gi
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 12:20:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Apr 2013 03:03:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,407,1363158000"; d="scan'208";a="312237508"
Received: from unknown (HELO helios.localnet) ([10.255.13.167])
	by orsmga002.jf.intel.com with ESMTP; 04 Apr 2013 03:02:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
Date: Thu, 04 Apr 2013 11:02:53 +0100
Message-ID: <10041023.xxs08iTcih@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <1365063634-1766-1-git-send-email-andrei.adrianx.dinu@intel.com>
References: <1365063634-1766-1-git-send-email-andrei.adrianx.dinu@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3] Add file information to package information window
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
X-List-Received-Date: Thu, 04 Apr 2013 10:20:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 04 April 2013 11:20:34 Andrei Dinu wrote:
> Removed the package files parsing routine from the
> packageinfo.bbclass file and added it to the
> package.bbclass file.
> 
> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> ---
>  meta/classes/package.bbclass     |   12 ++++++++++++
>  meta/classes/packageinfo.bbclass |   20 --------------------
>  2 files changed, 12 insertions(+), 20 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 3479947..e859a65 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1130,6 +1130,15 @@ python emit_pkgdata() {
>      workdir = d.getVar('WORKDIR', True)
> 
>      for pkg in packages.split():
> +        items = {}
> +        for files_list in pkgfiles[pkg]:
> +             item_name = os.path.basename(files_list)
> +             item_path = files_list.split(os.path.basename(files_list))[0]
[:-1] 

There is os.path.dirname() for this as well; alternatively you could use 
os.path.split() to get both at the same time.

> +             if item_path not in items:
> +                 items[item_path] = []
> +                 items[item_path].append(item_name)
> +             else:
> +                 items[item_path].append(item_name)

This could be simplified to:
             if item_path not in items:
                 items[item_path] = []
             items[item_path].append(item_name)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


