Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 059A4719D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 17:32:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Nov 2016 09:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,574,1473145200"; d="scan'208";a="11707699"
Received: from unknown (HELO mlopezva-mobl2.zpn.intel.com) ([10.219.25.91])
	by orsmga002.jf.intel.com with ESMTP; 30 Nov 2016 09:32:48 -0800
From: Mariano Lopez <mariano.lopez@linux.intel.com>
To: benjamin.esquivel@linux.intel.com
Date: Wed, 30 Nov 2016 11:32:53 -0600
Message-ID: <8520976.4hjWThuJ93@mlopezva-mobl2>
User-Agent: KMail/4.14.10 (Linux/4.4.26-gentoo; KDE/4.14.24; x86_64; ; )
In-Reply-To: <1480457845.2973.3.camel@linux.intel.com>
References: <cover.1480429545.git.mariano.lopez@linux.intel.com>
	<310d0b7be34ba56f287e60209a53474809e1121a.1480429545.git.mariano.lopez@linux.intel.com>
	<1480457845.2973.3.camel@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] oeqa/utils/metadata.py: Add metadata library
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
X-List-Received-Date: Wed, 30 Nov 2016 17:32:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, November 29, 2016 04:17:25 PM Benjamin Esquivel wrote:
> On Tue, 2016-11-29 at 08:42 -0600, mariano.lopez@linux.intel.com wrote:
> > From: Mariano Lopez <mariano.lopez@linux.intel.com>
> > 
> > Adds functions to get metadata from the host running the tests.
> > 
> > [YOCTO #9954]
> > 
> > Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> > ---
> >  meta/lib/oeqa/utils/metadata.py | 77
> > +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> >  create mode 100644 meta/lib/oeqa/utils/metadata.py
> > 
> > diff --git a/meta/lib/oeqa/utils/metadata.py
> > b/meta/lib/oeqa/utils/metadata.py
> > new file mode 100644
> > index 0000000..3be805c
> > --- /dev/null
> > +++ b/meta/lib/oeqa/utils/metadata.py
> > @@ -0,0 +1,77 @@
> > +# Copyright (C) 2016 Intel Corporation
> > +#
> > +# Released under the MIT license (see COPYING.MIT)
> > +#
> > +# Functions to get metadata from the testing host used
> > +# for analytics of test results.
> > +
> > +from git import Repo
> > +from collections import OrderedDict
> > +from collections.abc import MutableMapping
> > +from xml.dom.minidom import parseString
> > +from xml.etree.ElementTree import Element, tostring
> > +
> > +from oe.lsb import distro_identifier
> > +from oeqa.utils.commands import runCmd, get_bb_var
> > +
> > +def metadata_from_bb():
> > +    """ Returns test's metadata as OrderedDict.
> > +
> > +        Data will be gathered using bitbake -e thanks to get_bb_var.
> > +    """
> > +
> > +    info_dict = OrderedDict()
> > +    hostname = runCmd('hostname')
> > +    info_dict['hostname'] = hostname.output
> > +    info_dict['machine'] = get_bb_var('MACHINE')
> > +    info_dict['distro'] = get_bb_var('DISTRO')
> > +    info_dict['distro_version'] = get_bb_var('DISTRO_VERSION')
> > +    host_distro= distro_identifier()
> > +    host_distro, _, host_distro_release = host_distro.partition('-')
> > +    info_dict['host_distro'] = host_distro
> > +    info_dict['host_distro_release'] = host_distro_release
> > +    info_dict['layers'] = get_layers(get_bb_var('BBLAYERS'))
> is none of the upper statements going to throw exceptions? otherwise
> try/except as appropriate.
> > +    return info_dict
> > +
> > +def metadata_from_data_store(d):
> > +    """ Returns test's metadata as OrderedDict.
> > +
> > +        Data will be collected from the provided data store.
> > +    """
> > +    # TODO: Getting metadata from the data store would
> > +    # be useful when running within bitbake.
> > +    pass
> > +
> > +def get_layers(layers):
> > +    """ Returns layer name, branch, and revision as OrderedDict. """
> > +
> > +    layer_dict = OrderedDict()
> > +    for layer in layers.split():
> > +        layer_name = os.path.basename(layer)
> > +        layer_dict[layer_name] = OrderedDict()
> > +        repo = Repo(layer, search_parent_directories=True)
> > +        revision, branch = repo.head.object.name_rev.split()
> > +        layer_dict[layer_name]['branch'] = branch
> > +        layer_dict[layer_name]['revision'] = revision
> same here for the try/except, did you test with usual cases of zero
> input and unexisting path's, etc?
> > +    return layer_dict
> > +
> > +def write_metadata_file(file_path, metadata):
> > +    """ Writes metadata to a XML file in directory. """
> > +
> > +    xml = dict_to_XML('metadata', metadata)
> > +    xml_doc = parseString(tostring(xml).decode('UTF-8'))
> > +    with open(file_path, 'w') as f:
> > +        f.write(xml_doc.toprettyxml())
> > +
> > +def dict_to_XML(tag, dictionary):
> > +    """ Return XML element converting dicts recursively. """
> > +
> > +    elem = Element(tag)
> > +    for key, val in dictionary.items():
> > +        if isinstance(val, MutableMapping):
> > +            child = (dict_to_XML(key, val))
> > +        else:
> > +            child = Element(key)
> > +            child.text = str(val)
> > +        elem.append(child)
> > +    return elem
> > -- 
> > 2.7.3
> > 

I'll implement the proposded changes and will send another version

Mariano


