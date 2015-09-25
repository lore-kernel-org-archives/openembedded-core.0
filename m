Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6DBCC76FC9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 18:24:40 +0000 (UTC)
Received: by pablk4 with SMTP id lk4so15631584pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 11:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=WoH+xFwOAOo4IOD4le1cHe9qhdZZpttIWJQXZYvVgko=;
	b=0AUQWG1SCspLnCYDmuxrLTvw4ssfhlEKNhaF779qdjMfILAOglI7wqvqNi2Acmlfuh
	3NPed938Taw6fv0WaGdqvYZha/40fKSmiFhlC5E/2wliYEOURMzZ62pOkOuBdbqZp43W
	/Etcz25kSdVtt1hAz4pB+QnAllSOvrb6GMRcNa5q/ymH8Yl8hcg4O02rA0SrKZXl3qJ5
	3GO94soAoGn4eIfSUKLc7NMTJNfPQCtdzqy9QhqZ5wZ8QxQgqd3ydDW1fe/lnRWEFIiF
	IC6AQ8xnUOmplthYFT6SJyGqhycyFH/V1Z+i3DbCmnIsajZ5xPwXiOOFfoDhGMNbfUfo
	sQEQ==
X-Received: by 10.66.101.39 with SMTP id fd7mr8855306pab.3.1443205480791;
	Fri, 25 Sep 2015 11:24:40 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:3d41:d820:b8cf:15d3?
	([2601:202:4000:1239:3d41:d820:b8cf:15d3])
	by smtp.googlemail.com with ESMTPSA id
	rz9sm5110797pbb.61.2015.09.25.11.24.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Sep 2015 11:24:39 -0700 (PDT)
Message-ID: <56059165.8030704@gmail.com>
Date: Fri, 25 Sep 2015 11:24:37 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1442413902-65012-1-git-send-email-sona.sarmadi@enea.com>
In-Reply-To: <1442413902-65012-1-git-send-email-sona.sarmadi@enea.com>
Subject: Re: [PATCH][dizzy] grep2.19: CVE-2015-1345
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
X-List-Received-Date: Fri, 25 Sep 2015 18:24:41 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Sona,

On 09/16/2015 07:31 AM, Sona Sarmadi wrote:
> Fixes heap-based buffer overflow flaw in grep.
> Affected versions are: grep 2.19 through 2.21
> 
> Removed THANKS.in changes from upstream patch since this
> file does not exist in version 2.19.
> Replaced tab with spaces in SRC_URI as well.

thanks,

merge to akuster/dizzy-next

-armin

> 
> Upstream fix:
> http://git.sv.gnu.org/cgit/grep.git/commit/?id=
> 83a95bd8c8561875b948cadd417c653dbe7ef2e2
> 
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> ---
>  .../grep/grep-2.19/grep2.19-CVE-2015-1345.patch    | 129 +++++++++++++++++++++
>  meta/recipes-extended/grep/grep_2.19.bb            |   4 +-
>  2 files changed, 132 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/grep/grep-2.19/grep2.19-CVE-2015-1345.patch
> 
> diff --git a/meta/recipes-extended/grep/grep-2.19/grep2.19-CVE-2015-1345.patch b/meta/recipes-extended/grep/grep-2.19/grep2.19-CVE-2015-1345.patch
> new file mode 100644
> index 0000000..32846f5
> --- /dev/null
> +++ b/meta/recipes-extended/grep/grep-2.19/grep2.19-CVE-2015-1345.patch
> @@ -0,0 +1,129 @@
> +From 83a95bd8c8561875b948cadd417c653dbe7ef2e2 Mon Sep 17 00:00:00 2001
> +From: Yuliy Pisetsky <ypisetsky@fb.com>
> +Date: Thu, 01 Jan 2015 23:36:55 +0000
> +Subject: grep -F: fix a heap buffer (read) overrun
> +
> +grep's read buffer is often filled to its full size, except when
> +reading the final buffer of a file.  In that case, the number of
> +bytes read may be far less than the size of the buffer.  However, for
> +certain unusual pattern/text combinations, grep -F would mistakenly
> +examine bytes in that uninitialized region of memory when searching
> +for a match.  With carefully chosen inputs, one can cause grep -F to
> +read beyond the end of that buffer altogether.  This problem arose via
> +commit v2.18-90-g73893ff with the introduction of a more efficient
> +heuristic using what is now the memchr_kwset function. The use of
> +that function in bmexec_trans could leave TP much larger than EP,
> +and the subsequent call to bm_delta2_search would mistakenly access
> +beyond end of the main input read buffer.
> +
> +* src/kwset.c (bmexec_trans): When TP reaches or exceeds EP,
> +do not call bm_delta2_search.
> +* tests/kwset-abuse: New file.
> +* tests/Makefile.am (TESTS): Add it.
> +* NEWS (Bug fixes): Mention it.
> +
> +Prior to this patch, this command would trigger a UMR:
> +
> +  printf %0360db 0 | valgrind src/grep -F $(printf %019dXb 0)
> +
> +  Use of uninitialised value of size 8
> +     at 0x4142BE: bmexec_trans (kwset.c:657)
> +     by 0x4143CA: bmexec (kwset.c:678)
> +     by 0x414973: kwsexec (kwset.c:848)
> +     by 0x414DC4: Fexecute (kwsearch.c:128)
> +     by 0x404E2E: grepbuf (grep.c:1238)
> +     by 0x4054BF: grep (grep.c:1417)
> +     by 0x405CEB: grepdesc (grep.c:1645)
> +     by 0x405EC1: grep_command_line_arg (grep.c:1692)
> +     by 0x4077D4: main (grep.c:2570)
> +
> +See the accompanying test for how to trigger the heap buffer overrun.
> +
> +Thanks to Nima Aghdaii for testing and finding numerous
> +ways to break early iterations of this patch.
> +
> +Fixes CVE-2015-1345.
> +Upstream-Status: Backport
> +
> +---
> +diff --git a/NEWS b/NEWS
> +index 975440d..3835d8d 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -2,6 +2,11 @@ GNU grep NEWS                                    -*- outline -*-
> + 
> + * Noteworthy changes in release ?.? (????-??-??) [?]
> + 
> ++** Bug fixes
> ++
> ++  grep no longer reads from uninitialized memory or from beyond the end
> ++  of the heap-allocated input buffer.
> ++
> + 
> + * Noteworthy changes in release 2.21 (2014-11-23) [stable]
> + 
> +diff --git a/src/kwset.c b/src/kwset.c
> +index 4003c8d..376f7c3 100644
> +--- a/src/kwset.c
> ++++ b/src/kwset.c
> +@@ -643,6 +643,8 @@ bmexec_trans (kwset_t kwset, char const *text, size_t size)
> +                     if (! tp)
> +                       return -1;
> +                     tp++;
> ++                    if (ep <= tp)
> ++                      break;
> +                   }
> +               }
> +           }
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index 2cba2cd..0508cd2 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -75,6 +75,7 @@ TESTS =						\
> +   inconsistent-range				\
> +   invalid-multibyte-infloop			\
> +   khadafy					\
> ++  kwset-abuse					\
> +   long-line-vs-2GiB-read			\
> +   match-lines					\
> +   max-count-overread				\
> +diff --git a/tests/kwset-abuse b/tests/kwset-abuse
> +new file mode 100755
> +index 0000000..6d8ec0c
> +--- a/dev/null
> ++++ b/tests/kwset-abuse
> +@@ -0,0 +1,32 @@
> ++#! /bin/sh
> ++# Evoke a segfault in a hard-to-reach code path of kwset.c.
> ++# This bug affected grep versions 2.19 through 2.21.
> ++#
> ++# Copyright (C) 2015 Free Software Foundation, Inc.
> ++#
> ++# This program is free software: you can redistribute it and/or modify
> ++# it under the terms of the GNU General Public License as published by
> ++# the Free Software Foundation, either version 3 of the License, or
> ++# (at your option) any later version.
> ++
> ++# This program is distributed in the hope that it will be useful,
> ++# but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++# GNU General Public License for more details.
> ++
> ++# You should have received a copy of the GNU General Public License
> ++# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> ++
> ++. "${srcdir=.}/init.sh"; path_prepend_ ../src
> ++
> ++fail=0
> ++
> ++# This test case chooses a haystack of size 260,000, since prodding
> ++# with gdb showed a reallocation slightly larger than that in fillbuf.
> ++# To reach the buggy code, the needle must have length < 1/11 that of
> ++# the haystack, and 10,000 is a nice round number that fits the bill.
> ++printf '%0260000dXy\n' 0 | grep -F $(printf %010000dy 0)
> ++
> ++test $? = 1 || fail=1
> ++
> ++Exit $fail
> +--
> +cgit v0.9.0.2
> diff --git a/meta/recipes-extended/grep/grep_2.19.bb b/meta/recipes-extended/grep/grep_2.19.bb
> index 9c162cc..d60ce5e 100644
> --- a/meta/recipes-extended/grep/grep_2.19.bb
> +++ b/meta/recipes-extended/grep/grep_2.19.bb
> @@ -5,7 +5,9 @@ SECTION = "console/utils"
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=8006d9c814277c1bfc4ca22af94b59ee"
>  
> -SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
> +SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
> +           file://grep2.19-CVE-2015-1345.patch \
> +           "
>  
>  SRC_URI[md5sum] = "ac732142227d9fe9567d71301e127979"
>  SRC_URI[sha256sum] = "6388295be48cfcaf7665d9cd3914e6625ea000e9414132bfefd45cf1d8eec34d"
> 

