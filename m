Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 06ED57706E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 09:19:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 09 Aug 2016 02:19:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,494,1464678000"; d="scan'208";a="746213773"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.25.186])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2016 02:19:52 -0700
Message-ID: <1470734391.2881.7.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Jose Lamego <jose.a.lamego@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 09 Aug 2016 10:19:51 +0100
In-Reply-To: <4a01440ac6492364d910f3c7d87ab00bb1dac5b5.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
	<4a01440ac6492364d910f3c7d87ab00bb1dac5b5.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: Evolution 3.20.4 (3.20.4-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH 20/20] oeqa.utils.readconfig: Read self-test configuration file
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
X-List-Received-Date: Tue, 09 Aug 2016 09:19:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-08-08 at 09:23 -0700, Jose Lamego wrote:
> Improve oeqa-selftest capabilities and UX by placing
> test configuration features and variables into a separate
> configuration file.
> This library reads a configuration file located at the
> oeqa/selftest/conf directory with same name as the caller
> file and the conf extension.

This patch to add the oeqa.utils.readconfig module should really be
applied before all of the changes which make use it. It's a relatively
minor niggle, but this should really be 1/20.

> 
> [Yocto 9389]
> 
> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
> ---
>  meta/lib/oeqa/utils/readconfig.py | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta/lib/oeqa/utils/readconfig.py
> 
> diff --git a/meta/lib/oeqa/utils/readconfig.py
> b/meta/lib/oeqa/utils/readconfig.py
> new file mode 100644
> index 0000000..1534ce7
> --- /dev/null
> +++ b/meta/lib/oeqa/utils/readconfig.py
> @@ -0,0 +1,18 @@
> +import os
> +import re
> +import configparser
> +
> +
> +def conffile(codefile):
> +    # Get test configurations from configuration file
> +    f = re.compile(r'(pyc?$)')
> +    fn = os.path.basename(codefile)
> +    configfile = os.path.join(os.path.dirname(codefile), 'conf',
> +                              f.sub('conf', fn))

This seems like it would be simpler with os.path.splitext()[1] ?

> +    config = configparser.SafeConfigParser()

Since Python 3.2 that's just ConfigParser()[2]. As we require Python
3.4 or newer for BitBake you can just use configparser.ConfigParser()
here.

> +    read_result = config.read(configfile)
> +    if read_result == []:
> +        raise configparser.Error("Failed to get test configuration
> from \
> +\"%s\". Verify that file exists and format is correct."
> +                                 % configfile)
> +    return config
> -- 
> 1.8.3.1
> 

Regards,

Joshua

1. https://docs.python.org/3/library/os.path.html#os.path.splitext
2. https://docs.python.org/3/whatsnew/3.2.html

