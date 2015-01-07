Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3A44C7201A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 06:39:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t076dLpx007691
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jan 2015 22:39:22 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 6 Jan 2015 22:39:20 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Jan 2015 14:35:41 +0800
Message-ID: <cover.1420610929.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] layerindex.bbclass: Add ability to fetch layers from layer index
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
X-List-Received-Date: Wed, 07 Jan 2015 06:39:25 -0000
Content-Type: text/plain

How to use this class:

For example:
If you want to build python-nova, first you should know meta-openstack layer includes python-nova.
And then, add meta-openstack to conf/bblayers.conf:

    ...
    BBLAYERS ?= " \
      /buildarea2/clu1/source/poky/meta \
      /buildarea2/clu1/source/poky/meta-yocto \
      /buildarea2/clu1/source/poky/meta-yocto-bsp \
      /buildarea2/clu1/source/poky/meta-cloud-services/meta-openstack \
      "
    ...

And then, run "bitbake python-nova", we will get following error:

    $ bitbake python-nova
    ERROR: Layer 'meta-openstack' depends on layer 'meta-ruby', but this layer is not enabled in your configuration
    Add '/buildarea2/clu1/source/poky/meta-openembedded/meta-ruby' to BBLAYERS. You can check conf/bblayers.conf
    
    Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Check conf/bblayers.conf, the meta-ruby has already added to BBALYERS.

    ...
    BBLAYERS += "/buildarea2/clu1/source/poky/meta-openembedded/meta-ruby"

And then, run "bitbake python-nova", we will get following error:

    $ bitbake python-nova
    ERROR: Layer 'ruby-layer' depends on layer 'openembedded-layer', but this layer is not enabled in your configuration
    
    Summary: There was 1 ERROR message shown, returning a non-zero exit code.

We need add meta-oe to BBLAYERS and continue to run "bitbake python-nova", still error:

    $ bitbake python-nova
    ERROR: Layer 'meta-openstack' depends on layer 'meta-networking', but this layer is not enabled in your configuration
    Add '/buildarea2/clu1/source/poky/meta-openembedded/meta-networking' to BBLAYERS. You can check conf/bblayers.conf
    
    Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Check conf/bblayers.conf, the meta-networking has already added to BBALYERS.

    ...
    BBLAYERS += "/buildarea2/clu1/source/poky/meta-openembedded/meta-networking"

Continue to run, will get error:

    $ bitbake python-nova
    ERROR: Layer 'networking-layer' depends on layer 'meta-python', but this layer is not enabled in your configuration
    
    Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Add meta-python to BBLAYERS manually:

    ...
    BBLAYERS ?= " \
      /buildarea2/clu1/source/poky/meta \
      /buildarea2/clu1/source/poky/meta-yocto \
      /buildarea2/clu1/source/poky/meta-yocto-bsp \
      /buildarea2/clu1/source/poky/meta-cloud-services/meta-openstack \
      /buildarea2/clu1/source/poky/meta-openembedded/meta-oe \
      /buildarea2/clu1/source/poky/meta-openembedded/meta-python \
      "
    ...

Still run "bitbake python-nova", will fetch layer automatically:

    $ bitbake python-nova
    WARNING: Fetch 'meta-virtualization' to '/buildarea2/clu1/source/poky'
    Cloning into '/buildarea2/clu1/source/poky/meta-virtualization'...
    remote: Counting objects: 1461, done.
    remote: Compressing objects: 100% (791/791), done.
    remote: Total 1461 (delta 803), reused 1262 (delta 604)
    Receiving objects: 100% (1461/1461), 303.15 KiB | 158.00 KiB/s, done.
    Resolving deltas: 100% (803/803), done.
    Checking connectivity... done.
    ERROR: Layer 'meta-openstack' depends on layer 'meta-virtualization', but this layer is not enabled in your configuration
    Add '/buildarea2/clu1/source/poky/meta-virtualization' to BBLAYERS. You can check conf/bblayers.conf
    
    Summary: There was 1 WARNING message shown.
    Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Check conf/bblayers.conf, meta-virtualization layer is added to BBLAYERS
Finally, run "bitbake python-nova", recipes are parsed.


The following changes since commit 2674ddb4b0c0645c91d1794cbd9166418b984351:

  dev-manual: Some minor fixes to some text. (2015-01-06 14:27:03 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/layerindex
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/layerindex

Chong Lu (1):
  layerindex.bbclass: Add ability to fetch layers from layer index

 meta/classes/layerindex.bbclass | 154 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 meta/classes/layerindex.bbclass

-- 
1.9.1


