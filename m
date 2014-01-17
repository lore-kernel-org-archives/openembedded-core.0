Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BCDE66B4C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 21:34:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Jan 2014 13:34:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,676,1384329600"; d="scan'208";a="468488348"
Received: from unknown (HELO [10.255.12.195]) ([10.255.12.195])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2014 13:34:00 -0800
Message-ID: <52D9A1C8.7040400@linux.intel.com>
Date: Fri, 17 Jan 2014 13:34:00 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Jason Plum <jplum@devonit.com>, openembedded-core@lists.openembedded.org
References: <1389910093-8950-1-git-send-email-jplum@devonit.com>
In-Reply-To: <1389910093-8950-1-git-send-email-jplum@devonit.com>
Subject: Re: [PATCH] lib/oe: copyhardlinktree - detect mount points Add function getmount to detect the mount point of the path, as os.stat(path).st_dev in copyhardlinktree fails in lxc containers to detect different paths as separate mounted filesystems (cp -l failure)
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
X-List-Received-Date: Fri, 17 Jan 2014 21:34:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/16/2014 02:08 PM, Jason Plum wrote:
> Signed-off-by: Jason Plum <jplum@devonit.com>
> ---
>   meta/lib/oe/path.py | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
This patch did not apply cleanly, it's possible you patched against an 
older version of master.

> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
> index 1310e38..f1905c3 100644
> --- a/meta/lib/oe/path.py
> +++ b/meta/lib/oe/path.py
> @@ -90,7 +90,7 @@ def copyhardlinktree(src, dst):
>       if os.path.isdir(src) and not len(os.listdir(src)):
>           return	
>
> -    if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
> +    if (getmount(src) ==  getmount(dst)):

Can you measure the affect on build time with this change?
>           # Need to copy directories only with tar first since cp will error if two
>           # writers try and create a directory at the same time
>           cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --files-from - | tar -xf - -C %s' % (src, src, dst)
> @@ -259,3 +259,12 @@ def realpath(file, root, use_physdir = True, loop_cnt = 100, assume_dir = False)
>           raise
>
>       return file
> +
> +def getmount(path):
> +    """ Returns the mount point of the path, using realpath """
> +    path = realpath(path)
In current master, realpath() seems to need 2 args:

Exception: TypeError: realpath() takes at least 2 arguments (1 given)

Sau!



> +    while path != os.path.sep:
> +        if os.path.ismount(path):
> +            return path
> +        path = os.path.abspath(os.path.join(path, os.pardir))
> +    return path
>

