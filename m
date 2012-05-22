Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SWmSt-0005ZX-0L
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 12:37:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4MARAG7009974
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 03:27:10 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 22 May 2012 03:27:09 -0700
Message-ID: <4FBB69FB.7030801@windriver.com>
Date: Tue, 22 May 2012 18:27:07 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1336445265.git.liezhi.yang@windriver.com>
	<228b3adfffa660477cc65e00fc32c95f2bf976fd.1336445265.git.liezhi.yang@windriver.com>
In-Reply-To: <228b3adfffa660477cc65e00fc32c95f2bf976fd.1336445265.git.liezhi.yang@windriver.com>
Cc: "Zhao, Zhenfeng" <Zhenfeng.Zhao@windriver.com>
Subject: Re: [PATCH 1/1] sanity.bbclass: check TMPDIR is not too long
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 May 2012 10:37:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


I've rebased the code to the up-to-date master branch, and pushed to:

   git://git.pokylinux.org/poky-contrib robert/tmpdir
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/tmpdir

// Robert

On 05/08/2012 10:50 AM, Robert Yang wrote:
> When the length of TMPDIR is longer than a threshold, there would be an
> "Argument list too long" error when building gcc-cross, this is the
> error from the exec(), the maximum length of argument is defined in
> /usr/include/linux/limits.h:
>
>    #define ARG_MAX       131072    /* # bytes of args + environ for exec() */
>
> It's hard to determine the threshold of the TMPDIR, here is the
> experimental value:
> len(TMPDIR) = 182	Success
> len(TMPDIR) = 192	Failed
>
> So set the maximum length of TMPDIR to 180 seems proper.
>
> [YOCTO #2434]
>
> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
> ---
>   meta/classes/sanity.bbclass |   11 +++++++++++
>   1 files changed, 11 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 687ddeb..6aaac1e 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -30,6 +30,7 @@ def check_sanity_sstate_dir_change(sstate_dir, data):
>       testmsg = ""
>       if sstate_dir != "":
>           testmsg = check_create_long_filename(sstate_dir, "SSTATE_DIR")
> +
>       return testmsg
>
>   def check_sanity_tmpdir_change(tmpdir, data):
> @@ -83,6 +84,12 @@ def check_create_long_filename(filepath, pathname):
>               return "Failed to create a file in %s: %s" % (pathname, strerror)
>       return ""
>
> +def check_long_path(filepath, pathname):
> +    # The 180 is just an empirical value
> +    if len(filepath)>  180:
> +	return "The path length of %s is too long, this would cause the \"Argument list too long\" error, please use a shorter path.\n" % pathname
> +    return ""
> +
>   def check_connectivity(d):
>       # URI's to check can be set in the CONNECTIVITY_CHECK_URIS variable
>       # using the same syntax as for SRC_URI. If the variable is not set
> @@ -353,6 +360,10 @@ def check_sanity(e):
>       tmpdir = data.getVar('TMPDIR', e.data, True)
>       sstate_dir = data.getVar('SSTATE_DIR', e.data, True)
>
> +    # Check whether the length of TMPDIR is too long to cause the
> +    # argument list too long error
> +    messages = messages + check_long_path(tmpdir, "TMPDIR")
> +
>       # Check saved sanity info
>       last_sanity_version = 0
>       last_tmpdir = ""


