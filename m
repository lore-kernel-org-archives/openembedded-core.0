Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 567CD78474
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 20:20:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7IKKjX9015749
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Aug 2017 13:20:45 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 18 Aug 2017 13:20:44 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>, Chen Qi <Qi.Chen@windriver.com>
References: <cover.1502879234.git.Qi.Chen@windriver.com>
	<7751264307b6966841699d05c26c8d643fcff3ef.1502879234.git.Qi.Chen@windriver.com>
	<CAHiDW_G9qymXQamiAvFpZmo+drd2TWkOv3eYPTEUxg6pLDNjqw@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <4df58cdd-1d60-26af-cfe4-7e5c25ffb2f9@windriver.com>
Date: Fri, 18 Aug 2017 16:20:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAHiDW_G9qymXQamiAvFpZmo+drd2TWkOv3eYPTEUxg6pLDNjqw@mail.gmail.com>
X-Originating-IP: [172.25.44.7]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] shadow: fix CVE-2017-12424
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
X-List-Received-Date: Fri, 18 Aug 2017 20:20:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-08-16 07:34 AM, Jussi Kukkonen wrote:
> On 16 August 2017 at 13:28, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
> 
>     Backport a patch to fix CVE-2017-12424.
> 
>     In shadow before 4.5, the newusers tool could be made to manipulate
>     internal data structures in ways unintended by the authors.
> 
>     Reference link: https://nvd.nist.gov/vuln/detail/CVE-2017-12424
>     <https://nvd.nist.gov/vuln/detail/CVE-2017-12424>
> 
>     CVE: CVE-2017-12424
> 
> 
> I don't object to the patch but I'm wondering if there is a reason we 
> are taking the shadow sources from debian instead of the upstream 
> github*? shadow 4.5 seems to have been out for months already but Debian 
> hasn't taken it yet...
> 
> *) https://github.com/shadow-maint/shadow
> 
> Jussi


Good point. It's late in the release but maybe
not too late to update shadow.

Qi,
If you could give it a try and let us know if there are any
'gotchas' that would prevent or make the upgrade risky,
that would be great.


There are quite a few functional changes:
    $ git diff 4.2.1..4.5 etc lib libmisc man src | diffstat| tail -1
     83 files changed, 4011 insertions(+), 2020 deletions(-)

and a HUGE number of other changes:
    $ git diff 4.2.1..4.5 | diffstat| tail -1
     9818 files changed, 390853 insertions(+), 7556 deletions(-)

mainly in tests:
    $ git diff 4.2.1..4.5 tests/| diffstat| tail -1
     9690 files changed, 369156 insertions(+)
that could, say just post-M3, be added as ptests.

../Randy

> 
> 
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ---
>       .../shadow/files/0001-shadow-CVE-2017-12424        | 46
>     ++++++++++++++++++++++
>       meta/recipes-extended/shadow/shadow.inc            |  1 +
>       2 files changed, 47 insertions(+)
>       create mode 100644
>     meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424
> 
>     diff --git
>     a/meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424
>     b/meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424
>     new file mode 100644
>     index 0000000..4d3e1e0
>     --- /dev/null
>     +++ b/meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424
>     @@ -0,0 +1,46 @@
>     +From 954e3d2e7113e9ac06632aee3c69b8d818cc8952 Mon Sep 17 00:00:00 2001
>     +From: Tomas Mraz <tmraz@fedoraproject.org
>     <mailto:tmraz@fedoraproject.org>>
>     +Date: Fri, 31 Mar 2017 16:25:06 +0200
>     +Subject: [PATCH] Fix buffer overflow if NULL line is present in db.
>     +
>     +If ptr->line == NULL for an entry, the first cycle will exit,
>     +but the second one will happily write past entries buffer.
>     +We actually do not want to exit the first cycle prematurely
>     +on ptr->line == NULL.
>     +Signed-off-by: Tomas Mraz <tmraz@fedoraproject.org
>     <mailto:tmraz@fedoraproject.org>>
>     +
>     +CVE: CVE-2017-12424
>     +Upstream-Status: Backport
>     +Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     +---
>     + lib/commonio.c | 8 ++++----
>     + 1 file changed, 4 insertions(+), 4 deletions(-)
>     +
>     +diff --git a/lib/commonio.c b/lib/commonio.c
>     +index b10da06..31edbaa 100644
>     +--- a/lib/commonio.c
>     ++++ b/lib/commonio.c
>     +@@ -751,16 +751,16 @@ commonio_sort (struct commonio_db *db, int
>     (*cmp) (const void *, const void *))
>     +       for (ptr = db->head;
>     +               (NULL != ptr)
>     + #if KEEP_NIS_AT_END
>     +-           && (NULL != ptr->line)
>     +-           && (   ('+' != ptr->line[0])
>     +-               && ('-' != ptr->line[0]))
>     ++           && ((NULL == ptr->line)
>     ++               || (('+' != ptr->line[0])
>     ++                   && ('-' != ptr->line[0])))
>     + #endif
>     +            ;
>     +            ptr = ptr->next) {
>     +               n++;
>     +       }
>     + #if KEEP_NIS_AT_END
>     +-      if ((NULL != ptr) && (NULL != ptr->line)) {
>     ++      if (NULL != ptr) {
>     +               nis = ptr;
>     +       }
>     + #endif
>     +--
>     +2.1.0
>     +
>     diff --git a/meta/recipes-extended/shadow/shadow.inc
>     b/meta/recipes-extended/shadow/shadow.inc
>     index 5e6b0bd..cc18964 100644
>     --- a/meta/recipes-extended/shadow/shadow.inc
>     +++ b/meta/recipes-extended/shadow/shadow.inc
>     @@ -16,6 +16,7 @@ SRC_URI =
>     "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz
>     <http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz> \
>                 
>     file://0001-Do-not-read-login.defs-before-doing-chroot.patch \
>                 
>     file://check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch \
>                 
>     file://0001-useradd-copy-extended-attributes-of-home.patch \
>     +           file://0001-shadow-CVE-2017-12424 \
>                  ${@bb.utils.contains('PACKAGECONFIG', 'pam',
>     '${PAM_SRC_URI}', '', d)} \
>                  "
> 
>     --
>     1.9.1
> 
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> 
> 
> 
> 


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

