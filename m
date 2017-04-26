Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BF08377C76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 14:47:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 26 Apr 2017 07:47:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,254,1488873600"; d="scan'208";a="79164454"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.17.128])
	by orsmga002.jf.intel.com with ESMTP; 26 Apr 2017 07:47:26 -0700
Message-ID: <1493218046.3433.25.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 26 Apr 2017 15:47:26 +0100
In-Reply-To: <20170426143942.19020-1-markus.lehtonen@linux.intel.com>
References: <20170426143942.19020-1-markus.lehtonen@linux.intel.com>
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Subject: Re: [PATCH] oeqa.utils.metadata: cope with invalid lines in os-release file
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
X-List-Received-Date: Wed, 26 Apr 2017 14:47:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-04-26 at 17:39 +0300, Markus Lehtonen wrote:
> Don't crash if every line in /etc/os-release does not adhere to the
> expected "key=val" format. E.g. CentOS 7 has empty lines in the file.
> 
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  meta/lib/oeqa/utils/metadata.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oeqa/utils/metadata.py
> b/meta/lib/oeqa/utils/metadata.py
> index cb81155e54..d291ddb960 100644
> --- a/meta/lib/oeqa/utils/metadata.py
> +++ b/meta/lib/oeqa/utils/metadata.py
> @@ -20,8 +20,10 @@ def get_os_release():
>          return None
>      with open(os_release_file) as fobj:
>          for line in fobj:
> -            key, value = line.split('=', 1)
> -            data[key.strip().lower()] = value.strip().strip('"')
> +            split = line.split('=', 1)
> +            if len(split) == 2:
> +                key, value = split
> +                data[key.strip().lower()] = value.strip().strip('"')

We have a function to read os-release in oe.lsb, return_dict_osr().

It handles this situation slightly differently, but the real reason I'm
pointing this out is that it seems like we could factor out a shared
function to be used both here and in oe.lsb ?

Joshua

