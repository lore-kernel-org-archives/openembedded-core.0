Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406E4C6370A
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 07:11:43 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.7701.1670483499485246944
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 23:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=KGj4k+T9;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1670483500;
  x=1702019500;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Wt9e6lLEs3tlkYo5PGLJ9XjTpIidrmxWZveKrj+xObs=;
  b=KGj4k+T9E9w6AwPAK8/QAeL7fOMSWw9NscjjK3D6xmPrGwdPB1EpWm1O
   zLWUbnALghaRJYSMiI90M07a568YnhLmstzDTfXFWEsYkNZ/YV4vpgm3/
   kh1hPxWK/HRsQmvJfl4iJt+RGVc1eaX7TYSkgMiXFSDv7fg1hxZEu2AVa
   4/3x3ExihsmdSP1m6HcvF8zJWE85qBLQcvIanU21fwD+cbzdpLyeFEdZo
   EDwQxmAg/y6AfwR2kEn1SmUSb4yFmsxqA4f85bk7+HAqhYgMWJVskDMZv
   T5/iamxKDFTaTE3jJ0RVCDsr9q10YYOnZ6TVj9Te9FgJD1oAnAQLO9t5T
   A==;
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH RFC 2/3] Add QA check for 32 bit time and file offset functions
Date: Thu, 8 Dec 2022 08:11:35 +0100
Message-ID: <20221208071136.1967696-3-olani@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221208071136.1967696-1-olani@axis.com>
References: <20221208071136.1967696-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 07:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174387

Check for known symbols that should have been redirected to 64bit
variants when -D_FILE_OFFSET_BITS=64 and -D_TIME_BITS=64 are set.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/classes-global/insane.bbclass | 132 +++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index df2c40c3c5..b0e99c4c3f 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -506,6 +506,138 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
                 trimmed = path.replace(os.path.join (d.getVar("PKGDEST"), name), "")
                 oe.qa.add_message(messages, "symlink-to-sysroot", "Symlink %s in %s points to TMPDIR" % (trimmed, name))
 
+QAPATHTEST[32bit-time] = "check_32bit_symbols"
+def check_32bit_symbols(path, packagename, d, elf, messages):
+    """
+    Check that ELF files do not use any 32 bit time APIs from glibc.
+    """
+    # TODO: We should have some DISTRO_FEATURE flag to check here
+    # if '-D_TIME_BITS=64' not in d.getVar('GLIBC_64BIT_TIME_FLAGS'):
+    #     # No use checking if the feature is not enabled?
+    #     return
+    import re
+    # This list is manually constructed by searching the image folder of the
+    # glibc recipe for __USE_TIME_BITS64.  There is no good way to do this
+    # automatically.
+    api32 = {
+        # /usr/include/time.h
+        "clock_getres", "clock_gettime", "clock_nanosleep", "clock_settime",
+        "ctime", "ctime_r", "difftime", "gmtime", "gmtime_r", "localtime",
+        "localtime_r", "mktime", "nanosleep", "time", "timegm", "timelocal",
+        "timer_gettime", "timer_settime", "timespec_get", "timespec_getres",
+        # /usr/include/bits/time.h
+        "clock_adjtime",
+        # /usr/include/signal.h
+        "sigtimedwait",
+        # /usr/include/sys/time.h
+        "futimes", "futimesat", "getitimer", "gettimeofday", "lutimes",
+        "setitimer", "settimeofday", "utimes",
+        # /usr/include/sys/timex.h
+        "adjtimex", "ntp_adjtime", "ntp_gettime", "ntp_gettimex",
+        # /usr/include/sys/wait.h
+        "wait3", "wait4",
+        # /usr/include/sys/stat.h
+        "fstat", "fstat64", "fstatat", "fstatat64", "futimens", "lstat",
+        "lstat64", "stat", "stat64", "utimensat",
+        # /usr/include/sys/poll.h
+        "ppoll",
+        # /usr/include/sys/resource.h
+        "getrusage",
+        # /usr/include/sys/ioctl.h
+        "ioctl",
+        # /usr/include/sys/select.h
+        "select", "pselect",
+        # /usr/include/sys/prctl.h
+        "prctl",
+        # /usr/include/sys/epoll.h
+        "epoll_pwait2",
+        # /usr/include/sys/timerfd.h
+        "timerfd_gettime", "timerfd_settime",
+        # /usr/include/sys/socket.h
+        "getsockopt", "recvmmsg", "recvmsg", "sendmmsg", "sendmsg",
+        "setsockopt",
+        # /usr/include/sys/msg.h
+        "msgctl",
+        # /usr/include/sys/sem.h
+        "semctl", "semtimedop",
+        # /usr/include/sys/shm.h
+        "shmctl",
+        # /usr/include/pthread.h
+        "pthread_clockjoin_np", "pthread_cond_clockwait",
+        "pthread_cond_timedwait", "pthread_mutex_clocklock",
+        "pthread_mutex_timedlock", "pthread_rwlock_clockrdlock",
+        "pthread_rwlock_clockwrlock", "pthread_rwlock_timedrdlock",
+        "pthread_rwlock_timedwrlock", "pthread_timedjoin_np",
+        # /usr/include/semaphore.h
+        "sem_clockwait", "sem_timedwait",
+        # /usr/include/threads.h
+        "cnd_timedwait", "mtx_timedlock", "thrd_sleep",
+        # /usr/include/aio.h
+        "aio_cancel", "aio_error", "aio_read", "aio_return", "aio_suspend",
+        "aio_write", "lio_listio",
+        # /usr/include/mqueue.h
+        "mq_timedreceive", "mq_timedsend",
+        # /usr/include/glob.h
+        "glob", "glob64", "globfree", "globfree64",
+        # /usr/include/sched.h
+        "sched_rr_get_interval",
+        # /usr/include/fcntl.h
+        "fcntl", "fcntl64",
+        # /usr/include/utime.h
+        "utime",
+        # /usr/include/ftw.h
+        "ftw", "ftw64", "nftw", "nftw64",
+        # /usr/include/fts.h
+        "fts64_children", "fts64_close", "fts64_open", "fts64_read",
+        "fts64_set", "fts_children", "fts_close", "fts_open", "fts_read",
+        "fts_set",
+        # /usr/include/netdb.h
+        "gai_suspend",
+    }
+
+    ptrn = re.compile(
+        r'''
+        (?P<value>[\da-fA-F]+) \s+
+        (?P<flags>[lgu! ][w ][C ][W ][Ii ][dD ]F) \s+
+        (?P<section>\*UND\*) \s+
+        (?P<alignment>(?P<size>[\da-fA-F]+)) \s+
+        (?P<symbol>
+        ''' +
+        r'(?P<notag>' + r'|'.join(sorted(api32)) + r')' +
+        r'''
+        (@+(?P<tag>GLIBC_\d+\.\d+\S*)))
+        ''', re.VERBOSE
+    )
+
+    # elf is a oe.qa.ELFFile object
+    if elf is not None:
+        phdrs = elf.run_objdump("-tw", d)
+        syms = re.finditer(ptrn, phdrs)
+        usedapis = {sym.group('notag') for sym in syms}
+        if usedapis:
+            elfpath = package_qa_clean_path(path, d, packagename)
+            # Remove any .debug dir, heuristic that probably works
+            # At this point, any symbol information is stripped into the debug
+            # package, so that is the only place we will find them.
+            elfpath = elfpath.replace('.debug/', '')
+            allowed = (
+                d.getVarFlag(
+                    'INSANE_SKIP:' + d.getVar('PN'), elfpath.replace('/', '_')
+                ) or ''
+            ).split()
+            usedapis -= set(allowed)
+            if usedapis:
+                msgformat = elfpath + " uses 32-bit api '%s'"
+                for sym in usedapis:
+                    oe.qa.add_message(messages, '32bit-time', msgformat % sym)
+                oe.qa.add_message(
+                    messages, '32bit-time',
+                    'Suppress with INSANE_SKIP:%s[%s] = "%s"' % (
+                        d.getVar('PN'), elfpath.replace('/', '_'),
+                        ' '.join(usedapis)
+                    )
+                )
+
 # Check license variables
 do_populate_lic[postfuncs] += "populate_lic_qa_checksum"
 python populate_lic_qa_checksum() {
-- 
2.30.2


