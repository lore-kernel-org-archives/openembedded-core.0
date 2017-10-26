Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4BACF6E650
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 14:27:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Oct 2017 07:27:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,434,1503385200"; 
	d="scan'208,217";a="914040531"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.134])
	([10.219.128.134])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Oct 2017 07:27:21 -0700
Date: Thu, 26 Oct 2017 09:37:23 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-Id: <1509028643.11251.23@fm-out.intel.com>
In-Reply-To: <1509010439.25153.128.camel@intel.com>
References: <20171019201047.148436-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1509010439.25153.128.camel@intel.com>
X-Mailer: geary/0.11.3
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] qemu: upgrade to 2.10.1
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
X-List-Received-Date: Thu, 26 Oct 2017 14:27:21 -0000
Content-Type: multipart/alternative; boundary="=-sw9xxPzqw/MmQntjsHm/"

--=-sw9xxPzqw/MmQntjsHm/
Content-Type: text/plain; charset=utf-8; format=flowed

Hi Patrick

On Thu, Oct 26, 2017 at 4:33 AM, Patrick Ohly <patrick.ohly@intel.com> 
wrote:
> On Thu, 2017-10-19 at 13:10 -0700,
> leonardo.sandoval.gonzalez@linux.intel.com wrote:
>>  From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>> 
>>  All CVE patches removed because these are already integrated in
>>  2.10.1.
> ...
>>   meta/recipes-devtools/qemu/qemu/glibc-2.25.patch   |  14 -
> diff --git a/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch
>>  b/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch
>>  index a6908bdbf9..25569449e4 100644
>>  --- a/meta/recipes-devtools/qemu/qemu/glibc-
>>  2.25.patch
>>  +++ b/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch
>>  @@ -72,17 +72,3 @@ diff -uNr qemu-2.8.0.orig/configure qemu-
>>  2.8.0/configure
>>    # Hold two types of flag:
>>    #   CONFIG_THREAD_SETNAME_BYTHREAD  - we've got a way of setting
>>  the name on
>>    #                                     a thread we have a handle to
>>  -diff -uNr qemu-2.8.0.orig/include/sysemu/os-posix.h qemu-
>>  2.8.0/include/sysemu/os-posix.h
>>  ---- qemu-2.8.0.orig/include/sysemu/os-posix.h	2016-12-20
>>  21:16:48.000000000 +0100
>>  -+++ qemu-2.8.0/include/sysemu/os-posix.h	2017-02-21
>>  19:07:18.009090381 +0100
>>  -@@ -34,6 +34,10 @@
>>  - #include <netdb.h>
>>  - #include <sys/un.h>
>>  -
>>  -+#ifdef CONFIG_SYSMACROS
>>  -+#include <sys/sysmacros.h>
>>  -+#endif
>>  -+
>>  - void os_set_line_buffering(void);
>>  - void os_set_proc_name(const char *s);
>>  - void os_setup_signal_handling(void);
> 
> Instead of removing just this hunk from the glibc-2.25.patch, please
> remove the entire patch. It is already in 2.10.0.
> 
> I was about to send a patch doing just that when I saw your version
> update. Here's the commit message for my patch:
> 
>     The patch is already present in the upstream 2.10.0. Patching 
> during a
>     build succeeds by adding the same hunks again to configure (which
>     seems to cause no problems during build) and skipping the one 
> which it
>     detects as already applied, but "devtool modify qemu-native" is 
> more
>     picky:

I used devtool upgrade and the only hunk I need to remove was this one, 
the rest were applied cleanly. Let me check again and send  a V2 asap.

Leo


> 
> 
>     ERROR: Applying 'glibc-2.25.patch' failed:
>     checking file configure
>     Hunk #1 succeeded at 4986 with fuzz 2 (offset 259 lines).
>     checking file configure
>     Hunk #1 succeeded at 6047 with fuzz 1 (offset 352 lines).
>     checking file include/sysemu/os-posix.h
>     Reversed (or previously applied) patch detected!  Assume -R? [n]
>     Apply anyway? [n]
>     Skipping patch.
>     1 out of 1 hunk ignored
>     ERROR: Function failed: patch_do_patch
>     ERROR: Logfile of failure stored in: 
> .../devtooltmp-6_22hcm3/temp/log.do_patch.31897
>     NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to 
> be rerun and 1 failed.
>     ERROR: Extracting source for qemu-native failed
> 
> --
> Best Regards, Patrick Ohly
> 
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
> 
> 

--=-sw9xxPzqw/MmQntjsHm/
Content-Type: text/html; charset=utf-8

Hi Patrick<br><br>On Thu, Oct 26, 2017 at 4:33 AM, Patrick Ohly &lt;patrick.ohly@intel.com&gt; wrote:<br>
<blockquote type="cite"><div class="plaintext" style="white-space: pre-wrap;">On Thu, 2017-10-19 at 13:10 -0700,
<a href="mailto:leonardo.sandoval.gonzalez@linux.intel.com">leonardo.sandoval.gonzalez@linux.intel.com</a> wrote:
<blockquote> From: Leonardo Sandoval &lt;<a href="mailto:leonardo.sandoval.gonzalez@linux.intel.com">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;
 
 All CVE patches removed because these are already integrated in
 2.10.1.
</blockquote>...
<blockquote> &nbsp;meta/recipes-devtools/qemu/qemu/glibc-2.25.patch&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;14 -
</blockquote>diff --git a/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch
<blockquote> b/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch
 index a6908bdbf9..25569449e4 100644
 --- a/meta/recipes-devtools/qemu/qemu/glibc-
 2.25.patch
 +++ b/meta/recipes-devtools/qemu/qemu/glibc-2.25.patch
 @@ -72,17 +72,3 @@ diff -uNr qemu-2.8.0.orig/configure qemu-
 2.8.0/configure
 &nbsp; # Hold two types of flag:
 &nbsp; #&nbsp;&nbsp;&nbsp;CONFIG_THREAD_SETNAME_BYTHREAD&nbsp;&nbsp;- we've got a way of setting
 the name on
 &nbsp; #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a thread we have a handle to
 -diff -uNr qemu-2.8.0.orig/include/sysemu/os-posix.h qemu-
 2.8.0/include/sysemu/os-posix.h
 ---- qemu-2.8.0.orig/include/sysemu/os-posix.h	2016-12-20
 21:16:48.000000000 +0100
 -+++ qemu-2.8.0/include/sysemu/os-posix.h	2017-02-21
 19:07:18.009090381 +0100
 -@@ -34,6 +34,10 @@
 - #include &lt;netdb.h&gt;
 - #include &lt;sys/un.h&gt;
 -&nbsp;
 -+#ifdef CONFIG_SYSMACROS
 -+#include &lt;sys/sysmacros.h&gt;
 -+#endif
 -+
 - void os_set_line_buffering(void);
 - void os_set_proc_name(const char *s);
 - void os_setup_signal_handling(void);
</blockquote>
Instead of removing just this hunk from the glibc-2.25.patch, please
remove the entire patch. It is already in 2.10.0.

I was about to send a patch doing just that when I saw your version
update. Here's the commit message for my patch:

    The patch is already present in the upstream 2.10.0. Patching during a
&nbsp;&nbsp;&nbsp;&nbsp;build succeeds by adding the same hunks again to configure (which
&nbsp;&nbsp;&nbsp;&nbsp;seems to cause no problems during build) and skipping the one which it
&nbsp;&nbsp;&nbsp;&nbsp;detects as already applied, but "devtool modify qemu-native" is more
&nbsp;&nbsp;&nbsp;&nbsp;picky:</div></blockquote><div><br></div><div>I used devtool upgrade and the only hunk I need to remove was this one, the rest were applied cleanly. Let me check again and send &nbsp;a V2 asap.</div><div><br></div><div>Leo</div><div><br></div><br><blockquote type="cite"><div class="plaintext" style="white-space: pre-wrap;">
&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;ERROR: Applying 'glibc-2.25.patch' failed:
&nbsp;&nbsp;&nbsp;&nbsp;checking file configure
&nbsp;&nbsp;&nbsp;&nbsp;Hunk #1 succeeded at 4986 with fuzz 2 (offset 259 lines).
&nbsp;&nbsp;&nbsp;&nbsp;checking file configure
&nbsp;&nbsp;&nbsp;&nbsp;Hunk #1 succeeded at 6047 with fuzz 1 (offset 352 lines).
&nbsp;&nbsp;&nbsp;&nbsp;checking file include/sysemu/os-posix.h
&nbsp;&nbsp;&nbsp;&nbsp;Reversed (or previously applied) patch detected!&nbsp;&nbsp;Assume -R? [n]
&nbsp;&nbsp;&nbsp;&nbsp;Apply anyway? [n]
&nbsp;&nbsp;&nbsp;&nbsp;Skipping patch.
&nbsp;&nbsp;&nbsp;&nbsp;1 out of 1 hunk ignored
&nbsp;&nbsp;&nbsp;&nbsp;ERROR: Function failed: patch_do_patch
&nbsp;&nbsp;&nbsp;&nbsp;ERROR: Logfile of failure stored in: .../devtooltmp-6_22hcm3/temp/log.do_patch.31897
&nbsp;&nbsp;&nbsp;&nbsp;NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and 1 failed.
&nbsp;&nbsp;&nbsp;&nbsp;ERROR: Extracting source for qemu-native failed

<div>-- 
</div>Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.


</div></blockquote>

--=-sw9xxPzqw/MmQntjsHm/--
