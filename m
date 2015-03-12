Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F0F607393A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 18:21:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Mar 2015 11:21:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,390,1422950400"; d="scan'208";a="691232904"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.24.97])
	by fmsmga002.fm.intel.com with ESMTP; 12 Mar 2015 11:21:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Thu, 12 Mar 2015 18:21:19 +0000
Message-ID: <1687842.XY6UoZ3apI@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.7-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <1425905799-9101-1-git-send-email-patrick.ohly@intel.com>
References: <1425905799-9101-1-git-send-email-patrick.ohly@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] combo-layer: make Signed-off-by optional
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
X-List-Received-Date: Thu, 12 Mar 2015 18:21:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Patrick,

On Monday 09 March 2015 13:56:39 Patrick Ohly wrote:
> It depends on the diligence of the person running the combo-layer tool
> whether the Signed-off-by line added to each commit actually indicates
> that the person was involved in validating the change.
> 
> When the import is purely automatic, it is better to not add the line,
> because the history is more useful without it (searching for the person
> really only lists changes he or she was involved with) and it would
> be a false statement.
> 
> This needs to be configurable, achieved with a new global "signoff"
> boolean property in combo-layer.conf, in the "DEFAULT" section.
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  scripts/combo-layer              | 4 +++-
>  scripts/combo-layer.conf.example | 6 ++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/combo-layer b/scripts/combo-layer
> index 19d64e6..60ead5b 100755
> --- a/scripts/combo-layer
> +++ b/scripts/combo-layer
> @@ -75,6 +75,8 @@ class Configuration(object):
>              self.parser.readfp(f)
> 
>          self.repos = {}
> +        self.signoff = not self.parser.has_option('DEFAULT', 'signoff') or
> \ +                       self.parser.getboolean('DEFAULT', 'signoff') 
> for repo in self.parser.sections():
>              self.repos[repo] = {}
>              readsection(self.parser, repo, repo)
> @@ -471,7 +473,7 @@ def apply_patchlist(conf, repos):
>                  if os.path.getsize(patchfile) == 0:
>                      logger.info("(skipping %d/%d %s - no changes)" % (i,
> linecount, patchdisp)) else:
> -                    cmd = "git am --keep-cr -s -p1 %s" % patchfile
> +                    cmd = "git am --keep-cr %s-p1 %s" % ('-s ' if
> conf.signoff else '', patchfile) logger.info("Applying %d/%d: %s" % (i,
> linecount, patchdisp)) try:
>                          runcmd(cmd)
> diff --git a/scripts/combo-layer.conf.example
> b/scripts/combo-layer.conf.example index 010a692..8ad8615 100644
> --- a/scripts/combo-layer.conf.example
> +++ b/scripts/combo-layer.conf.example
> @@ -1,5 +1,11 @@
>  # combo-layer example configuration file
> 
> +# global options
> +[DEFAULT]
> +
> +# Add 'Signed-off-by' to all commits that get imported automatically.
> +signoff = True
> +
>  # component name
>  [bitbake]
>  # mandatory options

So I'm OK with adding this in as an option. However to me a name like DEFAULT 
implies you're establishing a general section to apply default settings for 
all components where the component can override those defaults if it chooses, 
which doesn't really represent what this does - so a different name might be 
more appropriate (GLOBAL or _global_ perhaps?)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

