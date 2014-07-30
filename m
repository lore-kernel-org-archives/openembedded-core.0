Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A100A65CD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 16:30:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jul 2014 09:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,765,1400050800"; d="scan'208";a="577770242"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO [10.255.12.249])
	([10.255.12.249])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2014 09:30:08 -0700
Message-ID: <53D91D90.3020505@linux.intel.com>
Date: Wed, 30 Jul 2014 09:30:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Patrice B <pbfwdlist@gmail.com>, openembedded-core@lists.openembedded.org
References: <1406714692.31179.9.camel@localhost.localdomain>
In-Reply-To: <1406714692.31179.9.camel@localhost.localdomain>
Subject: Re: [PATCH] psmisc: Typo in fuser makes -M on all the time (backport)
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
X-List-Received-Date: Wed, 30 Jul 2014 16:30:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2014 03:04 AM, Patrice B wrote:
> I encountered this bug in psmisc 22.21. Since it is fixed in main
> stream, I proposed this patch created from psmisc git.
>
> More info here :
> http://sourceforge.net/p/psmisc/code/ci/3638cc55b4d08851faba46635d737b24d016665b/
>
>
> "Brad found that fuser had the -M option on all the time.
> A simple but significant typo caused this, thanks the patch.
>
> Bug-Debian: http://bugs.debian.org/740275"
>
> Signed-off-by: Patrice B <pbfwdlist@gmail.com>
>
>
> ---
>   ...001-Typo-in-fuser-makes-M-on-all-the-time.patch | 44 ++++++++++++++++++++++
>   meta/recipes-extended/psmisc/psmisc_22.21.bb       |  2 +
>   2 files changed, 46 insertions(+)
>   create mode 100644 meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch
>
> diff --git a/meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch b/meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch
> new file mode 100644
> index 0000000..3a4c9a9
> --- /dev/null
> +++ b/meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch
> @@ -0,0 +1,44 @@
> +From 3638cc55b4d08851faba46635d737b24d016665b Mon Sep 17 00:00:00 2001
> +From: Brad Jorsch <anomie@users.sourceforge.net>
> +Date: Fri, 28 Feb 2014 21:55:02 +1100
> +Subject: [PATCH] Typo in fuser makes -M on all the time
> +
> +Brad found that fuser had the -M option on all the time.
> +A simple but significant typo caused this, thanks the the patch.
> +
> +Bug-Debian: http://bugs.debian.org/740275
> +

Sorry about not being clear here, you need an Upstream-Status: Tag in 
this patch file.

Please see the wiki link below for more details:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks
	Sau!

> +Signed-off-by: Craig Small <csmall@enc.com.au>
> +---
> + ChangeLog   | 4 ++++
> + src/fuser.c | 2 +-
> + 2 files changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index fd1cccf..e5f784c 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,7 @@
> ++Changes in 22.22
> ++================
> ++	* Fixed typo in fuser which has -M on Debian #740275
> ++
> + Changes in 22.21
> + ================
> + 	* Missing comma in fuser(1) added Debian #702391
> +diff --git a/src/fuser.c b/src/fuser.c
> +index b485f65..389b302 100644
> +--- a/src/fuser.c
> ++++ b/src/fuser.c
> +@@ -1174,7 +1174,7 @@ int main(int argc, char *argv[])
> + 		usage(_("No process specification given"));
> +
> + 	/* Check if -M flag was used and if so check mounts */
> +-	if (opts * OPT_ISMOUNTPOINT) {
> ++	if (opts & OPT_ISMOUNTPOINT) {
> + 	    check_mountpoints(&mounts, &names_head, &names_tail);
> + 	}
> +
> +--
> +1.8.4.2
> +
> diff --git a/meta/recipes-extended/psmisc/psmisc_22.21.bb b/meta/recipes-extended/psmisc/psmisc_22.21.bb
> index 22f65c5..9f328bb 100644
> --- a/meta/recipes-extended/psmisc/psmisc_22.21.bb
> +++ b/meta/recipes-extended/psmisc/psmisc_22.21.bb
> @@ -4,3 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>
>   SRC_URI[md5sum] = "935c0fd6eb208288262b385fa656f1bf"
>   SRC_URI[sha256sum] = "97323cad619210845b696d7d722c383852b2acb5c49b5b0852c4f29c77a8145a"
> +
> +SRC_URI += "file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch"
>

