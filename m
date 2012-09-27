Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THGXa-0001ZI-VP
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 18:02:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Sep 2012 08:49:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="214468024"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by orsmga002.jf.intel.com with ESMTP; 27 Sep 2012 08:49:25 -0700
Message-ID: <50647584.2010200@linux.intel.com>
Date: Thu, 27 Sep 2012 08:49:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <1348590946-13319-1-git-send-email-laurentiu.palcu@intel.com>
In-Reply-To: <1348590946-13319-1-git-send-email-laurentiu.palcu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] SDK: trap any IO errors in the relocate script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2012 16:02:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2012 09:35 AM, Laurentiu Palcu wrote:

BTW: in the future it's good to say the "filename: <commit subject>"

So this would be "relocate_sdk.py: ...."
> If the files being relocated are already used by other processes the
> relocate script will fail with a traceback. This patch will trap any IO
> errors when opening such a file and gracefully report them to the user.
>
> Also change the exit code from 1 to -1 for a better adt-installer user
> experience (like pointing the user to the adt_installer.log).
>
> [YOCTO #3164]
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>   scripts/relocate_sdk.py |   14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
> index b247e65..637ffe9 100755
> --- a/scripts/relocate_sdk.py
> +++ b/scripts/relocate_sdk.py
> @@ -29,6 +29,7 @@ import sys
>   import stat
>   import os
>   import re
> +import errno
>
>   old_prefix = re.compile("##DEFAULT_INSTALL_DIR##")
>
> @@ -171,7 +172,7 @@ def change_dl_sysdirs():
>
>   # MAIN
>   if len(sys.argv) < 4:
> -    exit(1)
> +    exit(-1)
>
>   new_prefix = sys.argv[1]
>   new_dl_path = sys.argv[2]
> @@ -184,7 +185,16 @@ for e in executables_list:
>       else:
>           os.chmod(e, perms|stat.S_IRWXU)
>
> -    f = open(e, "r+b")
> +    try:
> +        f = open(e, "r+b")
> +    except IOError as ioex:
> +        if ioex.errno == errno.ETXTBSY:
> +            print("Could not open %s. File used by another process.\nPlease "\
> +                  "make sure you exit all processes that might use any SDK "\
> +                  "binaries." % e)
> +        else:
> +            print("Could not open %s: %s(%d)" % (e, ioex.strerror, ioex.errno))
> +        exit(-1)
>
>       arch = get_arch()
>       if arch:
>
Merged into OE-Core

Thanks
	Sau!



