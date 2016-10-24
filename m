Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0A9F4719AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 12:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id DB6BA3183CE3;
	Mon, 24 Oct 2016 14:16:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id nTP0n4E7xicq; Mon, 24 Oct 2016 14:16:12 +0200 (CEST)
Received: from [172.22.22.61] (55d47c89.access.ecotel.net [85.212.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 8CAE73183E34;
	Mon, 24 Oct 2016 14:16:12 +0200 (CEST)
To: =?UTF-8?Q?Michael_Bl=c3=a4ttler?= <michael.blaettler@siemens.com>
References: <1477297414-14338-1-git-send-email-michael.blaettler@siemens.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <1f4a5fca-f3e9-f7f2-88d6-8d48c01ac7b9@opendreambox.org>
Date: Mon, 24 Oct 2016 14:16:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1477297414-14338-1-git-send-email-michael.blaettler@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package.py: New EXTRA_STRIPFLAGS variable
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
X-List-Received-Date: Mon, 24 Oct 2016 12:16:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Michael,

On 24.10.2016 10:23, Michael Blättler wrote:
> The EXTRA_STRIPFLAGS variable can be used to pass additional parameters to the strip command.
      ^
both description and subject don't match the actual variable name.

Best regards,
Andreas

> This can be used to remove additional sections or to keep symbols.
> The removal of additional sections can be useful to enable reproducible builds.
> Sections which contain paths or md5sums of the debug binaries (like gnu_debuglink)
> can be eliminated with this flag.
> 
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> Signed-off-by: Michael Blättler <michael.blaettler@siemens.com>
> ---
>  meta/classes/package.bbclass |  5 +++--
>  meta/lib/oe/package.py       | 13 ++++++-------
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index a6f0a7a..cd93643 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1055,14 +1055,15 @@ python split_and_strip_files () {
>      # Now lets go back over things and strip them
>      #
>      if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
> +        extraflags = d.getVar('EXTRA_STRIP', False)
>          strip = d.getVar("STRIP", True)
>          sfiles = []
>          for file in elffiles:
>              elf_file = int(elffiles[file])
>              #bb.note("Strip %s" % file)
> -            sfiles.append((file, elf_file, strip))
> +            sfiles.append((file, elf_file, strip, extraflags))
>          for f in kernmods:
> -            sfiles.append((f, 16, strip))
> +            sfiles.append((f, 16, strip, extraflags))
>  
>          oe.utils.multiprocess_exec(sfiles, oe.package.runstrip)
>  
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 02642f2..757044a 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -10,7 +10,7 @@ def runstrip(arg):
>  
>      import stat, subprocess
>  
> -    (file, elftype, strip) = arg
> +    (file, elftype, strip, extraflags) = arg
>  
>      newmode = None
>      if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
> @@ -18,17 +18,16 @@ def runstrip(arg):
>          newmode = origmode | stat.S_IWRITE | stat.S_IREAD
>          os.chmod(file, newmode)
>  
> -    extraflags = ""
> -
> -    # kernel module    
> +    extraflags += ' '
> +    # kernel module
>      if elftype & 16:
> -        extraflags = "--strip-debug --remove-section=.comment --remove-section=.note --preserve-dates"
> +        extraflags += "--strip-debug --remove-section=.comment --remove-section=.note --preserve-dates"
>      # .so and shared library
>      elif ".so" in file and elftype & 8:
> -        extraflags = "--remove-section=.comment --remove-section=.note --strip-unneeded"
> +        extraflags += "--remove-section=.comment --remove-section=.note --strip-unneeded"
>      # shared or executable:
>      elif elftype & 8 or elftype & 4:
> -        extraflags = "--remove-section=.comment --remove-section=.note"
> +        extraflags += "--remove-section=.comment --remove-section=.note"
>  
>      stripcmd = "'%s' %s '%s'" % (strip, extraflags, file)
>      bb.debug(1, "runstrip: %s" % stripcmd)
> 


