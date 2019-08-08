Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EBB467F2FA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 20:17:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x78KHSlW011497
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Aug 2019 13:17:28 -0700 (PDT)
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 8 Aug 2019 13:17:27 -0700
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>,
	<openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
References: <1565275147-17250-1-git-send-email-Trevor.Gamblin@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <6ed6a5c2-cf02-e18e-084b-d2bff0ac2b1c@windriver.com>
Date: Thu, 8 Aug 2019 16:17:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565275147-17250-1-git-send-email-Trevor.Gamblin@windriver.com>
X-Originating-IP: [172.25.44.5]
Subject: Re: [thud][PATCH] patch: fix CVE-2019-13638
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
X-List-Received-Date: Thu, 08 Aug 2019 20:17:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 8/8/19 10:39 AM, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
> 
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ke-ed-directly-instead-of-using-the-shell.patch | 44 ++++++++++++++++++++++
>   meta/recipes-devtools/patch/patch_2.7.6.bb         |  2 +
>   2 files changed, 46 insertions(+)
>   create mode 100644 meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
> 
> diff --git a/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
> new file mode 100644
> index 0000000..f60dfe8
> --- /dev/null
> +++ b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
> @@ -0,0 +1,44 @@
> +From 3fcd042d26d70856e826a42b5f93dc4854d80bf0 Mon Sep 17 00:00:00 2001
> +From: Andreas Gruenbacher <agruen@gnu.org>
> +Date: Fri, 6 Apr 2018 19:36:15 +0200
> +Subject: [PATCH] Invoke ed directly instead of using the shell
> +
> +* src/pch.c (do_ed_script): Invoke ed directly instead of using a shell
> +command to avoid quoting vulnerabilities.
> +
> +CVE: CVE-2019-13638
> +Upstream-Status: Backport[https://git.savannah.gnu.org/cgit/patch.git/patch/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0]
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +
> +---
> + src/pch.c | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +
> +diff --git a/src/pch.c b/src/pch.c
> +index 4fd5a05..16e001a 100644
> +--- a/src/pch.c
> ++++ b/src/pch.c
> +@@ -2459,9 +2459,6 @@ do_ed_script (char const *inname, char const *outname,
> + 	    *outname_needs_removal = true;
> + 	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
> + 	  }
> +-	sprintf (buf, "%s %s%s", editor_program,
> +-		 verbosity == VERBOSE ? "" : "- ",
> +-		 outname);
> + 	fflush (stdout);
> +
> + 	pid = fork();
> +@@ -2470,7 +2467,8 @@ do_ed_script (char const *inname, char const *outname,
> + 	else if (pid == 0)
> + 	  {
> + 	    dup2 (tmpfd, 0);
> +-	    execl ("/bin/sh", "sh", "-c", buf, (char *) 0);
> ++	    assert (outname[0] != '!' && outname[0] != '-');
> ++	    execlp (editor_program, editor_program, "-", outname, (char  *) NULL);
> + 	    _exit (2);
> + 	  }
> + 	else
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
> index 85b0db7..8908910 100644
> --- a/meta/recipes-devtools/patch/patch_2.7.6.bb
> +++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
> @@ -6,6 +6,8 @@ SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
>               file://0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch \
>               file://0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch \
>               file://0001-Fix-swapping-fake-lines-in-pch_swap.patch \
> +            file://CVE-2019-13636.patch \
> +            file://0001-Invoke-ed-directly-instead-of-using-the-shell.patch \
>   "

Again, you only added one patch but you changed two lines above.
I assume this is due to a merge conflict that you incorrectly resolved.

Fix and v3 please.

../Randy
>   
>   SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"
> 


-- 
# Randy MacLeod
# Wind River Linux

