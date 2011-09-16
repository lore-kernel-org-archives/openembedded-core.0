Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R4cIF-00026x-57
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 19:33:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2011 10:28:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="49183430"
Received: from scimitar.jf.intel.com (HELO [10.7.199.70]) ([10.7.199.70])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2011 10:28:21 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2011 10:28:21 -0700
In-Reply-To: <59d019bf5d9aa00d5c803f7417f99151ae827c60.1316192786.git.paul.eggleton@linux.intel.com>
References: <cover.1316192786.git.paul.eggleton@linux.intel.com>
	<59d019bf5d9aa00d5c803f7417f99151ae827c60.1316192786.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1316194101.2325.1.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] sanity.bbclass: add a sanity check for KDE 4.x konsole in TERMCMD
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
X-List-Received-Date: Fri, 16 Sep 2011 17:33:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-16 at 18:08 +0100, Paul Eggleton wrote:
> If the user has specified konsole in TERMCMD and it is version 2.x from
> KDE 4.x, raise an error as this version will not work for patch
> resolution purposes (it forks into the background and returns
> immediately).
> 
> Addresses [YOCTO #1294]
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Signed-off-by: Joshua Lock <josh@linux.intel.com>

> ---
>  meta/classes/sanity.bbclass |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 93008cc..faacd70 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -333,6 +333,12 @@ def check_sanity(e):
>          term = termcmd.split()[0]
>          if not check_app_exists(term, e.data):
>              messages = messages + "The console for use in patch error resolution is not available, please install %s or set TERMCMD and TERMCMDRUN (as documented in local.conf).\n" % term
> +        elif "konsole" in term:
> +            import oe.terminal
> +            vernum = oe.terminal.check_konsole_version(term)
> +            if vernum:
> +                if vernum.split('.')[0] == '2':
> +                    messages = messages +  'Konsole from KDE 4.x will not work as TERMCMD/TERMCMDRUN, please specify a different terminal or set PATCHRESOLVE = "noop" to disable interactive patch resolution.\n'
>  
>      if os.path.basename(os.readlink('/bin/sh')) == 'dash':
>          messages = messages + "Using dash as /bin/sh causes various subtle build problems, please use bash instead (e.g. 'dpkg-reconfigure dash' on an Ubuntu system.\n"

-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



