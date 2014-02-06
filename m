Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF7AD6B5C9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 18:49:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s16In3p1007561
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Feb 2014 10:49:03 -0800 (PST)
Received: from [147.11.119.223] (147.11.119.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 6 Feb 2014 10:49:02 -0800
Message-ID: <52F3D91D.5040009@windriver.com>
Date: Thu, 6 Feb 2014 13:49:01 -0500
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, <diego.sueiro@gmail.com>,
	Robert Yang <liezhi.yang@windriver.com>
References: <1391245631-10681-1-git-send-email-diego.sueiro@gmail.com>
	<CAMCfZKFMzmfNxOSF+_QymoQyDi_U0c+NMkGFt=9Kihw3swn0KQ@mail.gmail.com>
In-Reply-To: <CAMCfZKFMzmfNxOSF+_QymoQyDi_U0c+NMkGFt=9Kihw3swn0KQ@mail.gmail.com>
X-Originating-IP: [147.11.119.223]
Subject: Re: [for-dora] systemd: journald fix ignored disk space restrictions
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
X-List-Received-Date: Thu, 06 Feb 2014 18:49:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-02-06 05:34 AM, Diego Sueiro wrote:
> Folks,
>
> Any chance to get this up-streamed?

Hi *dS,  :)

Robert, who maintains dora, lives in China where they are
currently enjoying the Spring Festival holiday week.
I think Robert is back early next week. Please be patient.

../Randy

>
> Regards,
>
> --
> *dS
> Diego Sueiro
>
> Administrador do Embarcados
> www.embarcados.com.br <http://www.embarcados.com.br>
>
> /*long live rock 'n roll*/
>
>
> On Sat, Feb 1, 2014 at 7:07 AM, Diego Sueiro <diego.sueiro@gmail.com
> <mailto:diego.sueiro@gmail.com>> wrote:
>
>     The upstream bug report can be seen at:
>     [Systemd #68161] -- https://bugs.freedesktop.org/show_bug.cgi?id=68161
>
>     This backports patches come from 207 and need to address this in the
>     206 version for dora branch.
>
>     Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com
>     <mailto:diego.sueiro@gmail.com>>
>     ---
>       ...ournald-fix-fd-leak-in-journal_file_empty.patch |   27
>     ++++++++++++++
>       ...urnald-fix-vacuuming-of-archived-journals.patch |   37
>     ++++++++++++++++++++
>       meta/recipes-core/systemd/systemd_206.bb <http://systemd_206.bb>
>              |    2 ++
>       3 files changed, 66 insertions(+)
>       create mode 100644
>     meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch
>       create mode 100644
>     meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch
>     b/meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch
>     new file mode 100644
>     index 0000000..a83c858
>     --- /dev/null
>     +++
>     b/meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch
>     @@ -0,0 +1,27 @@
>     +journald: fix fd leak in journal_file_empty
>     +Before my previous patch, journal_file_empty wasn't be called with the
>     +correct filename. Now that it's being called with the correct filename
>     +it leaks file descriptors. This patch closes the file descriptors
>     before
>     +returning.
>     +
>     +Signed-off-by: George McCollister <george.mccollister@gmail.com
>     <mailto:george.mccollister@gmail.com>>
>     +
>     +
>     +Index: systemd-206/src/journal/journal-vacuum.c
>     +===================================================================
>     +--- systemd-206.orig/src/journal/journal-vacuum.c      2013-07-21
>     19:43:28.146183128 -0300
>     ++++ systemd-206/src/journal/journal-vacuum.c   2014-01-29
>     20:43:27.492343295 -0200
>     +@@ -129,9 +129,9 @@
>     + }
>     +
>     + static int journal_file_empty(int dir_fd, const char *name) {
>     +-        int fd, r;
>     ++        int r;
>     +         le64_t n_entries;
>     +-
>     ++        _cleanup_close_ int fd;
>     +         fd = openat(dir_fd, name,
>     O_RDONLY|O_CLOEXEC|O_NOFOLLOW|O_NONBLOCK);
>     +         if (fd < 0)
>     +                 return -errno;
>     +
>     +Upstream-Status: Backport [207]
>     diff --git
>     a/meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch
>     b/meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch
>     new file mode 100644
>     index 0000000..7c59200
>     --- /dev/null
>     +++
>     b/meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch
>     @@ -0,0 +1,37 @@
>     +journald: fix vacuuming of archived journals
>     +d_name is modified on line 227 so if the entire journal name is needed
>     +again p must be used. Before this change when journal_file_empty
>     was called
>     +on archived journals it would always return with -2.
>     +
>     +Signed-off-by: George McCollister <george.mccollister@gmail.com
>     <mailto:george.mccollister@gmail.com>>
>     +
>     +Index: systemd-206/src/journal/journal-vacuum.c
>     +===================================================================
>     +--- systemd-206.orig/src/journal/journal-vacuum.c      2014-01-29
>     20:43:27.492343295 -0200
>     ++++ systemd-206/src/journal/journal-vacuum.c   2014-01-29
>     20:48:55.076356876 -0200
>     +@@ -265,18 +265,18 @@
>     +                         /* We do not vacuum active files or
>     unknown files! */
>     +                         continue;
>     +
>     +-                if (journal_file_empty(dirfd(d), de->d_name)) {
>     ++                if (journal_file_empty(dirfd(d), p)) {
>     +
>     +                         /* Always vacuum empty non-online files. */
>     +
>     +-                        if (unlinkat(dirfd(d), de->d_name, 0) >= 0)
>     +-                                log_debug("Deleted empty journal
>     %s/%s.", directory, de->d_name);
>     ++                        if (unlinkat(dirfd(d), p, 0) >= 0)
>     ++                                log_debug("Deleted empty journal
>     %s/%s.", directory, p);
>     +                         else if (errno != ENOENT)
>     +-                                log_warning("Failed to delete
>     %s/%s: %m", directory, de->d_name);
>     ++                                log_warning("Failed to delete
>     %s/%s: %m", directory, p);
>     +                         continue;
>     +                 }
>     +
>     +-                patch_realtime(directory, de->d_name, &st, &realtime);
>     ++                patch_realtime(directory, p, &st, &realtime);
>     +
>     +                 GREEDY_REALLOC(list, n_allocated, n_list + 1);
>     +
>     +
>     +Upstream-Status: Backport [207]
>     diff --git a/meta/recipes-core/systemd/systemd_206.bb
>     <http://systemd_206.bb> b/meta/recipes-core/systemd/systemd_206.bb
>     <http://systemd_206.bb>
>     index a1a8bd7..e7d0f1f 100644
>     --- a/meta/recipes-core/systemd/systemd_206.bb <http://systemd_206.bb>
>     +++ b/meta/recipes-core/systemd/systemd_206.bb <http://systemd_206.bb>
>     @@ -21,6 +21,8 @@ SRC_URI =
>     "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>                  file://0001-use-CAP_MKNOD-ConditionCapability.patch \
>
>     file://0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch \
>                  file://binfmt-install.patch \
>     +           file://journald-fix-fd-leak-in-journal_file_empty.patch \
>     +           file://journald-fix-vacuuming-of-archived-journals.patch \
>                  file://touchscreen.rules \
>                  ${UCLIBCPATCHES} \
>                  file://00-create-volatile.conf \
>     --
>     1.7.10.4
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

