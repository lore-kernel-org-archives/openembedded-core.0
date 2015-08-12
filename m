Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1158276486
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 15:39:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2015 08:39:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,662,1432623600"; d="scan'208";a="540521053"
Received: from menright-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.21.215])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Aug 2015 08:39:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Wed, 12 Aug 2015 16:39:45 +0100
Message-ID: <3601082.HQKmVvNWcX@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.3-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <dd54452b17ce0907c59d8f1fee0406265ae80533.1438667914.git.Qi.Chen@windriver.com>
References: <cover.1438667914.git.Qi.Chen@windriver.com>
	<dd54452b17ce0907c59d8f1fee0406265ae80533.1438667914.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/8] oe-publish-sdk: add script
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
X-List-Received-Date: Wed, 12 Aug 2015 15:39:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Qi,

A couple of issues noted below.

On Monday 10 August 2015 11:18:04 Chen Qi wrote:
> Add a script to publish extensible SDK to a specified destination.
> 
> oe-publish-sdk <ext-sdk> <destination>
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  scripts/oe-publish-sdk | 124
> +++++++++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 124
> insertions(+)
>  create mode 100755 scripts/oe-publish-sdk
> 
> diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
> new file mode 100755
> index 0000000..90bedac
> --- /dev/null
> +++ b/scripts/oe-publish-sdk
> @@ -0,0 +1,124 @@
> +#!/usr/bin/env python
> +
> +# OpenEmbedded SDK Tool
> +
> +# oe-publish-sdk publish <ext-sdk> <destination>
> +# <ext-sdk>: extensible SDK to publish
> +# <destination>: local or remote location which servers as an SDK update
> server 
> +# e.g.
> +# oe-publish-sdk publish sdk-ext.sh /mnt/poky/sdk-ext
> +# oe-publish-sdk publish sdk-ext.sh user@host:/opt/poky/sdk-ext
> +#
> +
> +import sys
> +import os
> +import argparse
> +import glob
> +import re
> +import subprocess
> +import logging
> +import shutil
> +import errno
> +
> +scripts_path = os.path.dirname(os.path.realpath(__file__))
> +lib_path = scripts_path + '/lib'
> +sys.path = sys.path + [lib_path]
> +import scriptutils
> +logger = scriptutils.logger_create('sdktool')
> +
> +def mkdir(d):
> +    try:
> +        os.makedirs(d)
> +    except OSError as e:
> +        if e.errno != errno.EEXIST:
> +            raise e
>
> +def publish(args):
> +    logger.debug("In publish function")
> +    target_sdk = args.sdk
> +    destination = args.dest
> +    logger.debug("target_sdk = %s, update_server = %s" % (target_sdk,
> destination)) 
> +    sdk_basename = os.path.basename(target_sdk)
> +
> +    # Ensure the SDK exists
> +    if not os.path.exists(target_sdk):
> +        logger.error("%s doesn't exist" % target_sdk)
> +        return -1
> +
> +    is_remote = False
> +    if ':' in destination:
> +        is_remote = True
> +
> +    if not is_remote:
> +        dest_sdk = os.path.join(destination, sdk_basename)
> +        logger.debug("dest_sdk = %s" % dest_sdk)
> +        mkdir(destination)
> +        if os.path.exists(dest_sdk):
> +            os.remove(dest_sdk)
> +        if (os.stat(target_sdk).st_dev == os.stat(destination).st_dev):
> +            os.link(target_sdk, dest_sdk)
> +        else:
> +            shutil.copy(target_sdk, dest_sdk)
> +        # Unpack the SDK to get the sstate objects and manifests
> +        # so that client side could do updates
> +        logger.debug("Unpacking %s to %s ..." % (dest_sdk, destination))
> +        ret = subprocess.call("sh %s -n -y -d %s" % (dest_sdk,
> destination), shell=True) +        if ret == 0:
> +            logger.info('Successfully unpacked %s to %s' % (dest_sdk,
> destination)) +        else:
> +            logger.error('Failed to unpack %s to %s' % (dest_sdk,
> destination)) +
> +        return ret
> +    else:
> +        host, destdir = destination.split(':')
> +        logger.debug('Making sure %s on %s exists' % (destdir, host))
> +        ret = subprocess.call("ssh %s 'rm -rf %s && mkdir -p %s'" % (host,
> destdir, destdir), shell=True) 

This makes me feel very uneasy. I really think we should not be doing rm -rf 
on whatever path the user specifies in case it's wrong.

> +        if ret != 0:
> +            logger.error("Making directory %s on %s failed" % (destdir,
> host)) 
> +            return ret
> +        logger.debug('Copying %s to %s' % (target_sdk, destination))
> +        ret = subprocess.call("scp %s %s" % (target_sdk, destination),
> shell=True) 
> +        if ret != 0:
> +            logger.error("scp failed")
> +            return ret
> +        dest_sdk = os.path.join(destdir, sdk_basename)
> +        cmd = 'sh %s -n -y -d %s && cd %s/layers && git init . && mv
> .git/hooks/post-update.sample .git/hooks/post-update && git add . && git
> commit -m "init repo"' % (dest_sdk, destdir, destdir) +       
> logger.debug("cmd is %s" % cmd)
> +        logger.debug("Unpacking %s in %s" % (dest_sdk, destination))
> +        ret = subprocess.call("ssh %s '%s'" % (host, cmd), shell=True)
> +        if ret != 0:
> +            logger.error("Failed to unpack SDK on %s" % destination)
> +            return ret
> +        else:
> +            logger.info("Successfully published SDK to %s" % destination)
> +            return 0

It looks like you are only doing the setup of the embedded git repository when 
the publishing destination is remote - that's not right. The destination might 
still be local and shared for remote access. Could this be refactored so 
rather than having a big if statement at the start and having completely 
separate implementations for local and remote, you check it when running each 
step and choose to wrap the command in ssh, or run scp instead of cp etc.?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

