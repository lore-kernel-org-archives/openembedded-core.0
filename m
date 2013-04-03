Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UNQem-0002rc-6J
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 18:35:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Apr 2013 09:16:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="311810834"
Received: from unknown (HELO helios.localnet) ([10.255.13.159])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2013 09:18:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
Date: Wed, 03 Apr 2013 17:18:07 +0100
Message-ID: <1912854.rCCW1yQxSL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <1365003047-10522-1-git-send-email-andrei.adrianx.dinu@intel.com>
References: <1365003047-10522-1-git-send-email-andrei.adrianx.dinu@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] Add file information to package information window
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
X-List-Received-Date: Wed, 03 Apr 2013 16:35:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andrei,

On Wednesday 03 April 2013 18:30:47 Andrei Dinu wrote:
> Removed the package files parsing routine from the
> packageinfo.bbclass file and added it to the
> package.bbclass file.
> 
> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> ---
>  meta/classes/package.bbclass     |   10 ++++++++++
>  meta/classes/packageinfo.bbclass |   20 --------------------
>  2 files changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 3479947..cafe339 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1130,6 +1130,13 @@ python emit_pkgdata() {
>      workdir = d.getVar('WORKDIR', True)
> 
>      for pkg in packages.split():
> +        items = {}
> +        for files_list in pkgfiles[pkg]:
> +             if
> files_list.split(files_list.split('/')[len(files_list.split('/'))-1])[0][:-
> 1] not in items: +                
> items[files_list.split(files_list.split('/')[len(files_list.split('/'))-1])
> [0][:-1]] = [] +                
> items[files_list.split(files_list.split('/')[len(files_list.split('/'))-1])
> [0][:-1]].append(files_list.split('/')[len(files_list.split('/'))-1]) +     
>        else:
> +                
> items[files_list.split(files_list.split('/')[len(files_list.split('/'))-1])
> [0][:-1]].append(files_list.split('/')[len(files_list.split('/'))-1])
> subdata_file = pkgdatadir + "/runtime/%s" % pkg

I'd recommend the use of os.path.basename() here; additionally rather than 
repeating the same call several times (possibly expensive within a loop), 
assign the return value to a variable and then use that instead.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


