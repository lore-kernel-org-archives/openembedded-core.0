Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EC1B56FA85
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 03:30:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2014 20:30:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,962,1392192000"; d="scan'208";a="521787689"
Received: from kmaligas-mobl1.gar.corp.intel.com (HELO [10.255.12.167])
	([10.255.12.167])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2014 20:30:27 -0700
Message-ID: <538D4152.5030308@linux.intel.com>
Date: Mon, 02 Jun 2014 20:30:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Wenlin Kang <wenlin.kang@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1401760525-17167-1-git-send-email-wenlin.kang@windriver.com>
In-Reply-To: <1401760525-17167-1-git-send-email-wenlin.kang@windriver.com>
Subject: Re: [PATCH] fetch2/svn.py: fix Unable to fetch URL bug
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
X-List-Received-Date: Tue, 03 Jun 2014 03:30:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2014 06:55 PM, Wenlin Kang wrote:
> For svn source, when download a revsion on branches, if the download
> revsion < the branch created time revsion, then it will fail.
>

> The detail description reference the Yocto Project bugzilla, please see:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=6258
>
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> ---
>   lib/bb/fetch2/svn.py |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/bb/fetch2/svn.py b/lib/bb/fetch2/svn.py
> index 8847461..75e21df 100644
> --- a/lib/bb/fetch2/svn.py
> +++ b/lib/bb/fetch2/svn.py
> @@ -98,7 +98,8 @@ class Svn(FetchMethod):
>               suffix = ""
>               if ud.revision:
>                   options.append("-r %s" % ud.revision)
> -                suffix = "@%s" % (ud.revision)
> +                #follow this line can make the fetch fail when download a revsion on branches if the download revsion < the branch created time revsion.
> +                #suffix = "@%s" % (ud.revision)
>
Will this cause other failures if there versions requests at a specific 
revision?  can you detail how you tested this?


>               if command == "fetch":
>                   svncmd = "%s co %s %s://%s/%s%s %s" % (ud.basecmd, " ".join(options), proto, svnroot, ud.module, suffix, ud.module)
>

