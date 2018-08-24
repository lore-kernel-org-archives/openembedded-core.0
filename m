Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 718A6795D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 07:16:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7O7GSA1008870
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Aug 2018 00:16:28 -0700
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 24 Aug 2018 00:16:27 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1535094031-35363-1-git-send-email-hongxu.jia@windriver.com>
Message-ID: <b6ef0030-8c15-7dee-e993-681b2aced85f@windriver.com>
Date: Fri, 24 Aug 2018 15:16:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1535094031-35363-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH] package.bbclass: only one hardlink of separated debug info file in each directory
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
X-List-Received-Date: Fri, 24 Aug 2018 07:16:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi RP,

With this fix, we could not use yesterday's workaround fix
`git: create symlink rather than hardlink between bin/ and libexec/',

But it is no harm for us, btw, Ubuntu use symlink in git , and Fedora
use hardlink in git

[Ubuntu 1604/1804]
$ ls /usr/bin/git* -al
-rwxr-xr-x 1 root root 2343536 6月   1 01:50 /usr/bin/git
-rwxr-xr-x 1 root root    6094 7月   5 22:00 /usr/bin/git-deborig
lrwxrwxrwx 1 root root       3 6月   1 01:50 /usr/bin/git-receive-pack -> 
git
-rwxr-xr-x 1 root root 1304912 6月   1 01:50 /usr/bin/git-shell
lrwxrwxrwx 1 root root       3 6月   1 01:50 /usr/bin/git-upload-archive 
-> git
-rwxr-xr-x 1 root root 1313024 6月   1 01:50 /usr/bin/git-upload-pack
[Ubuntu 1604/1804]

[Fedora 25]
$ ls /usr/bin/git* -al
-rwxr-xr-x. 115 root root 2033328 1月  19 2017 /usr/bin/git
-rwxr-xr-x. 115 root root 2033328 1月  19 2017 /usr/bin/git-receive-pack
-rwxr-xr-x.   2 root root 1004840 1月  19 2017 /usr/bin/git-shell
-rwxr-xr-x. 115 root root 2033328 1月  19 2017 /usr/bin/git-upload-archive
-rwxr-xr-x.   2 root root 1084152 1月  19 2017 /usr/bin/git-upload-pack
[Fedora 25]

//Hongxu

On 2018年08月24日 15:00, Hongxu Jia wrote:
> While multiple hardlinks of binary located in different dirs,
> there are also multiple hardlinks of separated debug info file
> with the same binary name in same debug dirs. But in each dir,
> only one debug file with original name works. Because all of
> binary hardlinks have one `.gnu_debuglink' which is added in
> `splitdebuginfo'. It caused gdb could not find debugging
> symbols.
>
> [Before the patch]
> $ find .
> ./usr/bin/foo
> ./usr/bin/foo-hd1
> ./usr/bin/.debug
> ./usr/bin/.debug/foo
> ./usr/bin/.debug/foo-hd1
> ./usr/libexec/foo-hd2
> ./usr/libexec/.debug
> ./usr/libexec/.debug/foo-hd2
>
> $ readelf --debug-dump usr/libexec/foo-hd2
> Contents of the .gnu_debuglink section:
>    Separate debug info file: foo
>
> $ gdb usr/libexec/foo-hd2
> Reading symbols from usr/libexec/foo-hd2...(no debugging symbols found)...done.
> [Before the patch]
>
> [Apply the patch]
> $ find .
> ./usr/bin/foo
> ./usr/bin/foo-hd1
> ./usr/bin/.debug
> ./usr/bin/.debug/foo
> ./usr/libexec/foo-hd2
> ./usr/libexec/.debug
> ./usr/libexec/.debug/foo
>
> $ gdb usr/libexec/foo-hd2
> Reading symbols from usr/libexec/foo-hd2...Reading symbols from usr/libexec/.debug/foo...done.
> [Apply the patch]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/classes/package.bbclass | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 4ce9de2..a2a45f6 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1048,15 +1048,18 @@ python split_and_strip_files () {
>           for ref in inodes:
>               if len(inodes[ref]) == 1:
>                   continue
> +
> +            target = inodes[ref][0][len(dvar):]
>               for file in inodes[ref][1:]:
>                   src = file[len(dvar):]
> -                dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
> +                dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(target) + debugappend
>                   fpath = dvar + dest
> -                target = inodes[ref][0][len(dvar):]
>                   ftarget = dvar + debuglibdir + os.path.dirname(target) + debugdir + "/" + os.path.basename(target) + debugappend
>                   bb.utils.mkdirhier(os.path.dirname(fpath))
> -                #bb.note("Link %s -> %s" % (fpath, ftarget))
> -                os.link(ftarget, fpath)
> +                # Only one hardlink of separated debug info file in each directory
> +                if not os.access(fpath, os.R_OK):
> +                    #bb.note("Link %s -> %s" % (fpath, ftarget))
> +                    os.link(ftarget, fpath)
>   
>           # Create symlinks for all cases we were able to split symbols
>           for file in symlinks:



