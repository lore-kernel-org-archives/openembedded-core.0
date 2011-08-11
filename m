Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrctc-0003Zq-K5
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 23:34:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2011 14:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37660641"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2011 14:29:58 -0700
Message-ID: <4E4449D6.1000408@linux.intel.com>
Date: Thu, 11 Aug 2011 14:29:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312952945-3415-1-git-send-email-ldorileo@gmail.com>
In-Reply-To: <1312952945-3415-1-git-send-email-ldorileo@gmail.com>
Cc: Leandro Dorileo <ldorileo@gmail.com>
Subject: Re: [PATCH v2] scripts/combo-layer: a simple way to script the combo-layer conf
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
X-List-Received-Date: Thu, 11 Aug 2011 21:34:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2011 10:09 PM, Leandro Dorileo wrote:
> This small patch introduces a a very simple and basic way to script
> the combo-layer conf file. With that a combo can be shared with no
> need to change its config - associated to the use of environment
> variables for example.
>
> *Similar* to bitbake it considers every value starting with @ to be
> a python script. So local_repo could be easily configured as:
>
> [bitbake]
> local_repo = @os.getenv("LOCAL_REPO_DIR") + "/bitbake"
>
> or any more sophisticated python syntax.
>
> This version updates the config file description so users can be
> aware of.
>
> Signed-off-by: Leandro Dorileo<ldorileo@gmail.com>
> ---
>   scripts/combo-layer |   13 ++++++++++++-
>   1 files changed, 12 insertions(+), 1 deletions(-)
>
> diff --git a/scripts/combo-layer b/scripts/combo-layer
> index d129175..07b3382 100755
> --- a/scripts/combo-layer
> +++ b/scripts/combo-layer
> @@ -79,6 +79,14 @@ local_repo_dir = ~/src/oecore
>   dest_dir = .
>   last_revision =
>
> +# it's also possible to embed python code in the config values. Similar
> +# to bitbake it considers every value starting with @ to be a python script.
> +# So local_repo could be easily configured using an environment variable as:
> +#
> +# [bitbake]
> +# local_repo = @os.getenv("LOCAL_REPO_DIR") + "/bitbake"
> +#
> +
>   # more components ...
>
>       """
> @@ -91,7 +99,10 @@ last_revision =
>           for repo in self.parser.sections():
>               self.repos[repo] = {}
>               for (name, value) in self.parser.items(repo):
> -                self.repos[repo][name] = value
> +                if value.startswith("@"):
> +                    self.repos[repo][name] = eval(value.strip("@"))
> +                else:
> +                    self.repos[repo][name] = value
>
>       def update(self, repo, option, value):
>           self.parser.set(repo, option, value)

Merged into OE-Core

Thanks
	Sau!


