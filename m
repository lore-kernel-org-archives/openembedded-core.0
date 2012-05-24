Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SXNPL-00036n-M7
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 04:04:07 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 18:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="143993958"
Received: from unknown (HELO [10.255.12.49]) ([10.255.12.49])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2012 18:53:55 -0700
Message-ID: <4FBD94B3.3070304@linux.intel.com>
Date: Wed, 23 May 2012 18:53:55 -0700
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1337816265.git.josh@linux.intel.com>
	<3cdd2984697d7068273ebaa3545fa25caf806fb9.1337816265.git.josh@linux.intel.com>
In-Reply-To: <3cdd2984697d7068273ebaa3545fa25caf806fb9.1337816265.git.josh@linux.intel.com>
Subject: Re: [PATCH 5/7] sanity.bbclass: add extra information when SSTATE_CACHE unusable
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
X-List-Received-Date: Thu, 24 May 2012 02:04:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 23/05/12 17:03, Joshua Lock wrote:
> If the user does not have write permissions to SSTATE_CACHE, detected by
> the check_create_long_filename() test failing with a "Permission denied"
> value in strerror, then suggest they might want to use the location as
> an entry in SSTATE_MIRRORS.
>
> Signed-off-by: Joshua Lock<josh@linux.intel.com>
> ---
>   meta/classes/sanity.bbclass |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 39da14b..e86edf7 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -100,6 +100,9 @@ def check_sanity_sstate_dir_change(sstate_dir, data):
>       testmsg = ""
>       if sstate_dir != "":
>           testmsg = check_create_long_filename(sstate_dir, "SSTATE_DIR")
> +        # If we don't have permissions to SSTATE_DIR, suggest the user set it as an SSTATE_MIRRORS
> +        if testmsg.split(': ')[1].strip() == "Permission denied.":
> +            testmsg = testmsg + "You could try using %s in SSTATE_MIRRORS rather than as an SSTATE_CACHE.\n" % (sstate_dir)
>       return testmsg

Whoops. This one breaks when check_create_long_filename() succeeds. I've 
updated the git repo with the following hunk instead of above:

+        # If we don't have permissions to SSTATE_DIR, suggest the user 
set it as an SSTATE_MIRRORS
+        try:
+            err = testmsg.split(': ')[1].strip()
+            if err == "Permission denied.":
+                testmsg = testmsg + "You could try using %s in 
SSTATE_MIRRORS rather than as an SSTATE_CACHE.\n" % (sstate_dir)
+        except IndexError:
+            pass

Tested with both an SSTATE_DIR I can write to and one I can't.

Thanks,

Joshua
>
>   def check_sanity_tmpdir_change(tmpdir, data):
-- 
Joshua Lock
         Yocto Project
         Intel Open Source Technology Centre


