Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D06F476FF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 05:27:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8P5RMr9020593
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 22:27:22 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Thu, 24 Sep 2015 22:27:21 -0700
Message-ID: <5604DB37.4060107@windriver.com>
Date: Fri, 25 Sep 2015 13:27:19 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, Rongqing Li
	<rongqing.li@windriver.com>
References: <1443157556-467-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1443157556-467-1-git-send-email-rongqing.li@windriver.com>
X-Originating-IP: [128.224.162.211]
Cc: yhu2 <Yadi.hu@windriver.com>
Subject: Re: [PATCH] busybox: fix a ash memory leak
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
X-List-Received-Date: Fri, 25 Sep 2015 05:27:27 -0000
Content-Type: multipart/alternative;
	boundary="------------080902020706080805020708"

--------------080902020706080805020708
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

This patch has been rejected by upstream as follows.

Regards,
Chen Qi


=========================  Original Email Start =====================================================

On Wed, Dec 24, 2014 at 6:53 AM, Rich Felker<dalias@libc.org>  wrote:

> On Wed, Dec 24, 2014 at 10:32:19AM +0800, yhu2 wrote:
>> The script which triggers the leak:
>>
>> while true
>>    do
>>      while true
>>        do
>>          break;
>>      done</dev/null
>> done
>>
>> someone had fixed this bug, the commit is:
>> http://git.busybox.net/busybox/commit/shell/ash.c?id=4ba6c5d3ba3d2c7922aff6b5c2e73b8325f1cf17
>>
>> but this commit results in crash running some shell scripts, so it was reverted.
>>
>> I am trying to resolve this defect,any commnent would be appreciated!
> There is no easy fix. The patch you sent is incorrect. The problem is
> that the "stack model" used for allocation in ash is semantically
> wrong, and needs to be replaced with a dependency-tree model or
> something else that can handle freeing one object without freeing all
> subsequently-allocated objects.
>
> As a workaround, it might be possible to code a hack to reuse the
> existing copy of the string on the allocation stack rather than
> allocating a new copy whenever an existing copy already exists. This
> would not solve the general case (e.g. when the redirection uses a
> different file on each iteration) but it would solve the case above, I
> think. It might be worth pursuing this approach if nobody is available
> to work on the proper fix in the near future.

You can try using hush instead of ash. It has no such problem,
because it does not try to be clever, and just uses malloc.
_______________________________________________
busybox mailing list
busybox@busybox.net
http://lists.busybox.net/mailman/listinfo/busybox



========================= Original Email End ==============================================



On 09/25/2015 01:05 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   .../busybox/0001-ash-fix-memory-leak-in-ash.patch  | 54 ++++++++++++++++++++++
>   meta/recipes-core/busybox/busybox_1.23.2.bb        |  1 +
>   meta/recipes-core/busybox/busybox_git.bb           |  1 +
>   3 files changed, 56 insertions(+)
>   create mode 100644 meta/recipes-core/busybox/busybox/0001-ash-fix-memory-leak-in-ash.patch
>
> diff --git a/meta/recipes-core/busybox/busybox/0001-ash-fix-memory-leak-in-ash.patch b/meta/recipes-core/busybox/busybox/0001-ash-fix-memory-leak-in-ash.patch
> new file mode 100644
> index 0000000..87c7ffa
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/0001-ash-fix-memory-leak-in-ash.patch
> @@ -0,0 +1,54 @@
> +From 8dc9fef3ba088604527b067310c6da64221b3570 Mon Sep 17 00:00:00 2001
> +From: Signed-off-by: Hu <yadi.hu@windriver.com>
> +Date: Fri, 25 Sep 2015 12:36:07 +0800
> +Subject: [PATCH] ash: fix memory leak in ash
> +
> +Upstream-Status: Submitted: https://bugs.busybox.net/show_bug.cgi?id=7748
> +
> +The script triggers the memory leak:
> +   while true
> +   do
> +       while true
> +       do
> +           break;
> +       done</dev/null
> +   done
> +
> +adding stackmark resolve this issue.
> +
> +Signed-off-by: Hu <yadi.hu@windriver.com>
> +---
> + shell/ash.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/shell/ash.c b/shell/ash.c
> +index 42c9125..f5e7153 100644
> +--- a/shell/ash.c
> ++++ b/shell/ash.c
> +@@ -8336,6 +8336,7 @@ evaltree(union node *n, int flags)
> + 	void (*evalfn)(union node *, int);
> + 	int status;
> + 	int int_level;
> ++	struct stackmark smark;
> +
> + 	SAVE_INT(int_level);
> +
> +@@ -8375,6 +8376,7 @@ evaltree(union node *n, int flags)
> + 		status = !exitstatus;
> + 		goto setstatus;
> + 	case NREDIR:
> ++		setstackmark(&smark);
> + 		expredir(n->nredir.redirect);
> + 		status = redirectsafe(n->nredir.redirect, REDIR_PUSH);
> + 		if (!status) {
> +@@ -8382,6 +8384,7 @@ evaltree(union node *n, int flags)
> + 			status = exitstatus;
> + 		}
> + 		popredir(/*drop:*/ 0, /*restore:*/ 0 /* not sure */);
> ++		popstackmark(&smark);
> + 		goto setstatus;
> + 	case NCMD:
> + 		evalfn = evalcommand;
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
> index e4d9f97..54f3314 100644
> --- a/meta/recipes-core/busybox/busybox_1.23.2.bb
> +++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
> @@ -36,6 +36,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://sha1sum.cfg \
>              file://sha256sum.cfg \
>              file://getopts.cfg \
> +           file://0001-ash-fix-memory-leak-in-ash.patch \
>   "
>   
>   SRC_URI[tarball.md5sum] = "7925683d7dd105aabe9b6b618d48cc73"
> diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
> index ade72f4..71b725f 100644
> --- a/meta/recipes-core/busybox/busybox_git.bb
> +++ b/meta/recipes-core/busybox/busybox_git.bb
> @@ -41,6 +41,7 @@ SRC_URI = "git://busybox.net/busybox.git \
>              file://mount-via-label.cfg \
>              file://sha1sum.cfg \
>              file://sha256sum.cfg \
> +           file://0001-ash-fix-memory-leak-in-ash.patch \
>   "
>   
>   EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"


--------------080902020706080805020708
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">
      <div class="moz-text-plain" wrap="true" graphical-quote="true"
        style="font-family: -moz-fixed; font-size: 12px;"
        lang="x-western">
        <pre wrap="">This patch has been rejected by upstream as follows.

Regards,
Chen Qi


=========================  Original Email Start =====================================================

On Wed, Dec 24, 2014 at 6:53 AM, Rich Felker <a class="moz-txt-link-rfc2396E" href="mailto:dalias@libc.org">&lt;dalias@libc.org&gt;</a> wrote:
</pre>
        <blockquote type="cite" style="color: #000000;">
          <pre wrap="">On Wed, Dec 24, 2014 at 10:32:19AM +0800, yhu2 wrote:
</pre>
          <blockquote type="cite" style="color: #000000;">
            <pre wrap="">The script which triggers the leak:

while true
  do
    while true
      do
        break;
    done&lt;/dev/null
done

someone had fixed this bug, the commit is:
<a class="moz-txt-link-freetext" href="http://git.busybox.net/busybox/commit/shell/ash.c?id=4ba6c5d3ba3d2c7922aff6b5c2e73b8325f1cf17">http://git.busybox.net/busybox/commit/shell/ash.c?id=4ba6c5d3ba3d2c7922aff6b5c2e73b8325f1cf17</a>

but this commit results in crash running some shell scripts, so it was reverted.

I am trying to resolve this defect,any commnent would be appreciated!
</pre>
          </blockquote>
          <pre wrap="">There is no easy fix. The patch you sent is incorrect. The problem is
that the "stack model" used for allocation in ash is semantically
wrong, and needs to be replaced with a dependency-tree model or
something else that can handle freeing one object without freeing all
subsequently-allocated objects.

As a workaround, it might be possible to code a hack to reuse the
existing copy of the string on the allocation stack rather than
allocating a new copy whenever an existing copy already exists. This
would not solve the general case (e.g. when the redirection uses a
different file on each iteration) but it would solve the case above, I
think. It might be worth pursuing this approach if nobody is available
to work on the proper fix in the near future.
</pre>
        </blockquote>
        <pre wrap="">You can try using hush instead of ash. It has no such problem,
because it does not try to be clever, and just uses malloc.
_______________________________________________
busybox mailing list
<a class="moz-txt-link-abbreviated" href="mailto:busybox@busybox.net">busybox@busybox.net</a>
<a class="moz-txt-link-freetext" href="http://lists.busybox.net/mailman/listinfo/busybox">http://lists.busybox.net/mailman/listinfo/busybox</a>



========================= Original Email End ==============================================
</pre>
      </div>
      <br>
      <br>
      On 09/25/2015 01:05 PM, <a class="moz-txt-link-abbreviated" href="mailto:rongqing.li@windriver.com">rongqing.li@windriver.com</a> wrote:<br>
    </div>
    <blockquote
      cite="mid:1443157556-467-1-git-send-email-rongqing.li@windriver.com"
      type="cite">
      <pre wrap="">From: Roy Li <a class="moz-txt-link-rfc2396E" href="mailto:rongqing.li@windriver.com">&lt;rongqing.li@windriver.com&gt;</a>

Signed-off-by: Roy Li <a class="moz-txt-link-rfc2396E" href="mailto:rongqing.li@windriver.com">&lt;rongqing.li@windriver.com&gt;</a>
---
 .../busybox/0001-ash-fix-memory-leak-in-ash.patch  | 54 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.23.2.bb        |  1 +
 meta/recipes-core/busybox/busybox_git.bb           |  1 +
 3 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-ash-fix-memory-leak-in-ash.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-ash-fix-memory-leak-in-ash.patch b/meta/recipes-core/busybox/busybox/0001-ash-fix-memory-leak-in-ash.patch
new file mode 100644
index 0000000..87c7ffa
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-ash-fix-memory-leak-in-ash.patch
@@ -0,0 +1,54 @@
+From 8dc9fef3ba088604527b067310c6da64221b3570 Mon Sep 17 00:00:00 2001
+From: Signed-off-by: Hu <a class="moz-txt-link-rfc2396E" href="mailto:yadi.hu@windriver.com">&lt;yadi.hu@windriver.com&gt;</a>
+Date: Fri, 25 Sep 2015 12:36:07 +0800
+Subject: [PATCH] ash: fix memory leak in ash
+
+Upstream-Status: Submitted: <a class="moz-txt-link-freetext" href="https://bugs.busybox.net/show_bug.cgi?id=7748">https://bugs.busybox.net/show_bug.cgi?id=7748</a>
+
+The script triggers the memory leak:
+   while true
+   do
+       while true
+       do
+           break;
+       done&lt;/dev/null
+   done
+
+adding stackmark resolve this issue.
+
+Signed-off-by: Hu <a class="moz-txt-link-rfc2396E" href="mailto:yadi.hu@windriver.com">&lt;yadi.hu@windriver.com&gt;</a>
+---
+ shell/ash.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/shell/ash.c b/shell/ash.c
+index 42c9125..f5e7153 100644
+--- a/shell/ash.c
++++ b/shell/ash.c
+@@ -8336,6 +8336,7 @@ evaltree(union node *n, int flags)
+ 	void (*evalfn)(union node *, int);
+ 	int status;
+ 	int int_level;
++	struct stackmark smark;
+ 
+ 	SAVE_INT(int_level);
+ 
+@@ -8375,6 +8376,7 @@ evaltree(union node *n, int flags)
+ 		status = !exitstatus;
+ 		goto setstatus;
+ 	case NREDIR:
++		setstackmark(&amp;smark);
+ 		expredir(n-&gt;nredir.redirect);
+ 		status = redirectsafe(n-&gt;nredir.redirect, REDIR_PUSH);
+ 		if (!status) {
+@@ -8382,6 +8384,7 @@ evaltree(union node *n, int flags)
+ 			status = exitstatus;
+ 		}
+ 		popredir(/*drop:*/ 0, /*restore:*/ 0 /* not sure */);
++		popstackmark(&amp;smark);
+ 		goto setstatus;
+ 	case NCMD:
+ 		evalfn = evalcommand;
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index e4d9f97..54f3314 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -36,6 +36,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball\file://sha1sum.cfg\file://sha256sum.cfg\file://getopts.cfg\+file://0001-ash-fix-memory-leak-in-ash.patch\">"http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
            file://getopts.cfg \
+           file://0001-ash-fix-memory-leak-in-ash.patch \
 "</a>
 
 SRC_URI[tarball.md5sum] = "7925683d7dd105aabe9b6b618d48cc73"
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index ade72f4..71b725f 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://busybox.net/busybox.git \
            <a class="moz-txt-link-freetext" href="file://mount-via-label.cfg">file://mount-via-label.cfg</a> \
            <a class="moz-txt-link-freetext" href="file://sha1sum.cfg">file://sha1sum.cfg</a> \
            <a class="moz-txt-link-freetext" href="file://sha256sum.cfg">file://sha256sum.cfg</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-ash-fix-memory-leak-in-ash.patch">file://0001-ash-fix-memory-leak-in-ash.patch</a> \
 "
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------080902020706080805020708--
