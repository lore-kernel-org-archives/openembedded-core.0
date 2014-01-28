Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5BEAF6E6F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 18:49:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Jan 2014 10:45:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,737,1384329600"; d="scan'208";a="445953785"
Received: from unknown (HELO [10.255.13.109]) ([10.255.13.109])
	by orsmga001.jf.intel.com with ESMTP; 28 Jan 2014 10:49:31 -0800
Message-ID: <52E7FB3B.8000000@linux.intel.com>
Date: Tue, 28 Jan 2014 10:47:23 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Jason Plum <jplum@devonit.com>, openembedded-core@lists.openembedded.org
References: <1390245778-9252-1-git-send-email-jplum@devonit.com>
In-Reply-To: <1390245778-9252-1-git-send-email-jplum@devonit.com>
Subject: Re: [PATCH v3] meta/oe/lib/path.py - check mount points, not device
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
X-List-Received-Date: Tue, 28 Jan 2014 18:49:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/20/2014 11:22 AM, Jason Plum wrote:
> Signed-off-by: Jason Plum <jplum@devonit.com>
> ---
>   meta/lib/oe/path.py | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>

This patch is still not applying cleanly to master, I am also still a 
little concerned if this will affect performance since it's used often 
in sstate code.

Have you compared build times with and without this patch?

Sau!

> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
> index 46783f8..dab20fc 100644
> --- a/meta/lib/oe/path.py
> +++ b/meta/lib/oe/path.py
> @@ -90,7 +90,7 @@ def copyhardlinktree(src, dst):
>       if os.path.isdir(src) and not len(os.listdir(src)):
>           return	
>
> -    if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
> +    if (getmount(src) ==  getmount(dst)):
>           # Need to copy directories only with tar first since cp will error if two
>           # writers try and create a directory at the same time
>           cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p --files-from - --no-recursion | tar -xf - -C %s' % (src, src, dst)
> @@ -257,3 +257,14 @@ def realpath(file, root, use_physdir = True, loop_cnt = 100, assume_dir = False)
>           raise
>
>       return file
> +
> +def getmount(path):
> +    """ getmount takes a path parameter, uses os.path.realpath with os.path.abspath to
> +    handle symlink resolution, and returns the path to the mount point of the input path
> +    """
> +    path = os.path.realpath(os.path.abspath(path))
> +    while path != os.path.sep:
> +        if os.path.ismount(path):
> +            return path
> +        path = os.path.abspath(os.path.join(path, os.pardir))
> +    return path
> \ No newline at end of file
>

