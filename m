Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EB22E606CB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 09:35:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 05 Dec 2016 01:35:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,747,1477983600"; d="scan'208";a="1068049829"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 05 Dec 2016 01:35:08 -0800
Message-ID: <1480930507.13463.35.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: mariano.lopez@linux.intel.com, openembedded-core@lists.openembedded.org
Date: Mon, 05 Dec 2016 11:35:07 +0200
In-Reply-To: <fe5c6f63b0523cb18bb8a8ce4988895c82a063c4.1480525452.git.mariano.lopez@linux.intel.com>
References: <cover.1480525452.git.mariano.lopez@linux.intel.com>
	<fe5c6f63b0523cb18bb8a8ce4988895c82a063c4.1480525452.git.mariano.lopez@linux.intel.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: [PATCHv2 2/3] oeqa/utils/metadata.py: Add metadata library
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
X-List-Received-Date: Mon, 05 Dec 2016 09:35:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-12-01 at 09:37 -0600, mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> Adds functions to get metadata from the host running the tests.
> 
> [YOCTO #9954]
> 
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  meta/lib/oeqa/utils/metadata.py | 83
> +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 meta/lib/oeqa/utils/metadata.py
> 
> diff --git a/meta/lib/oeqa/utils/metadata.py
> b/meta/lib/oeqa/utils/metadata.py
> new file mode 100644
> index 0000000..ecbe763
> --- /dev/null
> +++ b/meta/lib/oeqa/utils/metadata.py
> @@ -0,0 +1,83 @@
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# Released under the MIT license (see COPYING.MIT)
> +#
> +# Functions to get metadata from the testing host used
> +# for analytics of test results.
> +
> +from git import Repo, InvalidGitRepositoryError, NoSuchPathError

We introduce a dependency on GitPython(?) If we do this, it should at least
be mentioned somewhere as a new required dependency. There is also
oeqa.utils.git which could be used (and extended).



> +from collections import OrderedDict
> +from collections.abc import MutableMapping
> +from xml.dom.minidom import parseString
> +from xml.etree.ElementTree import Element, tostring
> +
> +from oe.lsb import distro_identifier
> +from oeqa.utils.commands import runCmd, get_bb_var, get_bb_vars
> +
> +metadata_vars = ['MACHINE', 'DISTRO', 'DISTRO_VERSION']
> +
> +def metadata_from_bb():
> +    """ Returns test's metadata as OrderedDict.
> +
> +        Data will be gathered using bitbake -e thanks to get_bb_vars.
> +    """
> +
> +    info_dict = OrderedDict()
> +    hostname = runCmd('hostname')
> +    info_dict['hostname'] = hostname.output
> +    data_dict = get_bb_vars(metadata_vars)
> +    for var in metadata_vars:
> +        info_dict[var.lower()] = data_dict[var]
> +    host_distro= distro_identifier()
> +    host_distro, _, host_distro_release = host_distro.partition('-')
> +    info_dict['host_distro'] = host_distro
> +    info_dict['host_distro_release'] = host_distro_release
> +    info_dict['layers'] = get_layers(get_bb_var('BBLAYERS'))
> +    return info_dict

I think it would be better to have a distro revision (i.e. the "main
revision" or "revision of the main repository", for example oe-core or
poky) and only list additional layers that are not included in the main
repository.


Thanks,
  Markus

