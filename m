Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id EE2577C760
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 23:46:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2019 15:46:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,441,1544515200"; d="scan'208";a="139111911"
Received: from sdhavala-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.73.52])
	by orsmga002.jf.intel.com with ESMTP; 04 Mar 2019 15:46:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Date: Tue, 05 Mar 2019 12:46:07 +1300
Message-ID: <1904655.CDzVhXoS6Q@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <1548445982-25182-2-git-send-email-chandana.kalluri@xilinx.com>
References: <1548445982-25182-1-git-send-email-chandana.kalluri@xilinx.com>
	<1548445982-25182-2-git-send-email-chandana.kalluri@xilinx.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/3] devtool modify: Update devtool modify to copy source from work-shared if its already downloaded.
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
X-List-Received-Date: Mon, 04 Mar 2019 23:46:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Thanks for looking into this problem - this is a tricky one. My apologies for the delay in reviewing. Comments below.

On Saturday, 26 January 2019 8:53:00 AM NZDT Sai Hari Chandana Kalluri wrote:
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -717,6 +717,72 @@ def _check_preserve(config, recipename):
>                      tf.write(line)
>      os.rename(newfile, origfile)
>  
> +# Function links a file from src location to dest location
> +def copy_file(c,dest):
> +    import errno
> +    destdir = os.path.dirname(dest)
> +    if os.path.islink(c):
> +       linkto = os.readlink(c)
> +       if os.path.lexists(dest):
> +            if not os.path.islink(dest):
> +                raise OSError(errno.EEXIST, "Link %s already exists as a file" % dest, dest)
> +            if os.readlink(dest) == linkto:
> +                return dest
> +            raise OSError(errno.EEXIST, "Link %s already exists to a different location? (%s vs %s)" % (dest, os.readlink(dest), linkto), dest)
> +       os.symlink(linkto, dest)
> +    else:
> +       try:
> +           os.link(c, dest)
> +       except OSError as err:
> +           if err.errno == errno.EXDEV:
> +                bb.utils.copyfile(c, dest)
> +           else:
> +                raise
> +
> +# Function creates folders in a given target location
> +def copy_dirs(root,dirs,target):
> +    for d in dirs:
> +        destdir =  os.path.join(target,d)
> +        if os.path.islink(os.path.join(root,d)):
> +             linkto = os.readlink(os.path.join(root,d))
> +             os.symlink(linkto,destdir) 
> +        else:
> +             bb.utils.mkdirhier(target+d)
> +
> +# Function to link src dir to dest dir
> +def copy_src_to_ws(srcdir,srctree):
> +    target = srctree
> +    if os.path.exists(target):
> +        raise DevtoolError('source already in your workspace')
> +
> +    bb.utils.mkdirhier(target)
> +    for root,dirs,files in os.walk(srcdir):
> +        #convert abspath to relpath for root
> +        destdir = root.replace(srcdir,"")
> +        target = srctree+destdir+"/"
> +        copy_dirs(root,dirs,target)  
> +        for f in files:
> +           copy_file(os.path.join(root,f),os.path.join(target,f))

We already have a function to do this - oe.path.copyhardlinktree(). I appreciate that does not symlink if it can't hard link as you're doing here, but given the side-effects if the kernel source goes away I think we'd prefer "hard link or copy" rather than "hard link or symlink".

> @@ -852,10 +990,12 @@ def modify(args, config, basepath, workspace):
>                  f.write('\ndo_patch() {\n'
>                          '    :\n'
>                          '}\n')
> -                f.write('\ndo_configure_append() {\n'
> -                        '    cp ${B}/.config ${S}/.config.baseline\n'
> -                        '    ln -sfT ${B}/.config ${S}/.config.new\n'
> -                        '}\n')
> +
> +            if rd.getVarFlag('do_menuconfig','task'):
> +                    f.write('\ndo_configure_append() {\n'
> +                    '    cp ${B}/.config ${S}/.config.baseline\n'
> +                    '    ln -sfT ${B}/.config ${S}/.config.new\n'
> +                    '}\n')
>              if initial_rev:
>                  f.write('\n# initial_rev: %s\n' % initial_rev)
>                  for commit in commits:

This change does not appear to be directly related to the rest of the commit, can it be split out and properly described?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



