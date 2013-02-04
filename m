Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U2Q0u-0002TS-Nc
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 18:39:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r14HNc00028383
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Feb 2013 09:23:38 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 4 Feb 2013 09:23:38 -0800
Message-ID: <510FEEAA.9060706@windriver.com>
Date: Mon, 4 Feb 2013 11:23:54 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
	<bda5674ec4d39456cc53b1cf22f349f4880d3202.1359935562.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <bda5674ec4d39456cc53b1cf22f349f4880d3202.1359935562.git.richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 03/22] package: Process package stripping in parallel
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
X-List-Received-Date: Mon, 04 Feb 2013 17:39:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/13 5:55 PM, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/package.bbclass |   58 ++++++++++--------------------------------
>   meta/lib/oe/package.py       |   45 ++++++++++++++++++++++++++++++++
>   2 files changed, 58 insertions(+), 45 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 527ef31..9c8cdbc 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -309,49 +309,6 @@ def copydebugsources(debugsrcdir, d):
>               if os.path.exists(p) and not os.listdir(p):
>                   os.rmdir(p)
>
> -def runstrip(file, elftype, d):
> -    # Function to strip a single file, called from split_and_strip_files below
> -    # A working 'file' (one which works on the target architecture)
> -    #
> -    # The elftype is a bit pattern (explained in split_and_strip_files) to tell
> -    # us what type of file we're processing...
> -    # 4 - executable
> -    # 8 - shared library
> -
> -    import commands, stat, subprocess
> -
> -    strip = d.getVar("STRIP", True)
> -
> -    newmode = None
> -    if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
> -        origmode = os.stat(file)[stat.ST_MODE]
> -        newmode = origmode | stat.S_IWRITE | stat.S_IREAD
> -        os.chmod(file, newmode)
> -
> -    extraflags = ""
> -
> -    # .so and shared library
> -    if elftype & 16:
> -        extraflags = "--strip-debug --remove-section=.comment --remove-section=.note --preserve-dates"
> -    elif ".so" in file and elftype & 8:
> -        extraflags = "--remove-section=.comment --remove-section=.note --strip-unneeded"
> -    # shared or executable:
> -    elif elftype & 8 or elftype & 4:
> -        extraflags = "--remove-section=.comment --remove-section=.note"
> -
> -    stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
> -    bb.debug(1, "runstrip: %s" % stripcmd)
> -
> -    ret = subprocess.call(stripcmd, shell=True)
> -
> -    if newmode:
> -        os.chmod(file, origmode)
> -
> -    if ret:
> -        bb.error("runstrip: '%s' strip command failed" % stripcmd)
> -
> -    return 0
> -
>   #
>   # Package data handling routines
>   #
> @@ -902,13 +859,24 @@ python split_and_strip_files () {
>       # Now lets go back over things and strip them
>       #
>       if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
> +        strip = d.getVar("STRIP", True)
> +        sfiles = []
>           for file in file_list:
>               if file_list[file].startswith("ELF: "):
>                   elf_file = int(file_list[file][5:])
>                   #bb.note("Strip %s" % file)
> -                runstrip(file, elf_file, d)
> +                sfiles.append((file, elf_file, strip))
>           for f in kernmods:
> -            runstrip(f, 16, d)
> +            sfiles.append((f, 16, strip))
> +
> +
> +        import multiprocessing
> +        nproc = multiprocessing.cpu_count()
> +        pool = multiprocessing.Pool(nproc)
> +        processed = pool.imap(oe.package.runstrip, sfiles)
> +        pool.close()
> +        pool.join()
> +
>       #
>       # End of strip
>       #
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 6b1c1f4..9a0ddb8 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -1,3 +1,48 @@
> +def runstrip(arg):
> +    # Function to strip a single file, called from split_and_strip_files below

Minor note, the comment above is now confusing as it's unclear where the 
split_and_strip_files is.  It might be reasonable at this point to simply remove 
that -- or change the comment to indicate it's from the package.bbclass.

--Mark

> +    # A working 'file' (one which works on the target architecture)
> +    #
> +    # The elftype is a bit pattern (explained in split_and_strip_files) to tell
> +    # us what type of file we're processing...
> +    # 4 - executable
> +    # 8 - shared library
> +    # 16 - kernel module
> +
> +    import commands, stat, subprocess
> +
> +    (file, elftype, strip) = arg
> +
> +    newmode = None
> +    if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
> +        origmode = os.stat(file)[stat.ST_MODE]
> +        newmode = origmode | stat.S_IWRITE | stat.S_IREAD
> +        os.chmod(file, newmode)
> +
> +    extraflags = ""
> +
> +    # kernel module
> +    if elftype & 16:
> +        extraflags = "--strip-debug --remove-section=.comment --remove-section=.note --preserve-dates"
> +    # .so and shared library
> +    elif ".so" in file and elftype & 8:
> +        extraflags = "--remove-section=.comment --remove-section=.note --strip-unneeded"
> +    # shared or executable:
> +    elif elftype & 8 or elftype & 4:
> +        extraflags = "--remove-section=.comment --remove-section=.note"
> +
> +    stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
> +    bb.debug(1, "runstrip: %s" % stripcmd)
> +
> +    ret = subprocess.call(stripcmd, shell=True)
> +
> +    if newmode:
> +        os.chmod(file, origmode)
> +
> +    if ret:
> +        bb.error("runstrip: '%s' strip command failed" % stripcmd)
> +
> +    return
> +
>
>   def file_translate(file):
>       ft = file.replace("@", "@at@")
>



