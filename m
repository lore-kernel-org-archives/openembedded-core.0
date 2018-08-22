Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0BF0179438
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:16 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id y207-v6so3659151oie.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xFEFLxZ1clRzDerDXAklsaaIJsoX0l1tXn47stVf6A8=;
	b=cOFEQN+OWLmpGxrihCV/cx9CkjwyBWcvVoFDsD0RjMR48twHRYMaKEX/qvJnayMaG/
	MJjk2CvkQHYVxMn9FsXgcXiS7tOoVoYMjni27lFaupZxPXet2BmlH5TLVIRraK9uaGzI
	x3wbl+/SDH0qI13f5U6VxJ4zEFTJXUbQGzzP4A7TPrs+EX7OWjJ6lNzVBxuDZFzmGgKq
	x9OprnAzy75ljPgSHnIL6zjUJWYKgsDV1e2uI37hUyVon6ycnyAXMaBg3RMkMjk/4iws
	b85xK6iD7LizkesXi26AkS/EVi8yW9gzkmfP2CCbtAtgfjOSL9e1xJiyn3+UB18WSVi0
	j1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xFEFLxZ1clRzDerDXAklsaaIJsoX0l1tXn47stVf6A8=;
	b=WhDu99ZjYTH2bnjicViQGbo5AVwp0TVXSwZ5Gtmua0QuhCHW+hOp31Qbbi8C1aO2qc
	Qdf8we/kaDjKtVK4ay6vsIdTYsXioYnMOjgUdwrmhbokc5+E8Zy3t8zFjwjDn+Ko/VFp
	bGC8r48J07Z9e7zq7ifzEKqckwNtttpCeOSYd31sl7o5Hn+4tlgBlZRLFcdyGTPR0hVK
	sRWG0L6l4xabcUU3H4KekwJbvFC+6BhV4+YX8zUSk/qQlIMYHmSvAuXXti3cgRnod7AV
	kDHUNGioq0oNBM6NSo+1SA/Zit4sucYbCCzxkjJ3ZkpLcf1NrmKZRBZRLglru8NMVOtP
	1t7Q==
X-Gm-Message-State: APzg51Ams5Ea71HpoP7xgrVJ5LXJ70d+jquj/WyDAljcnJCcP84DEV0T
	meddA9/kNdNcOFBKInx9zEUlf0gMF0I=
X-Google-Smtp-Source: ANB0Vda1KHBZTnQc5NGO+NwlV4UVvm6E3ETCSxnMH/H9MM3N+ZKGOqpUUbUAzSkeNroIBEJBhk3CYg==
X-Received: by 2002:aca:3357:: with SMTP id
	z84-v6mr4061872oiz.49.1534950557363; 
	Wed, 22 Aug 2018 08:09:17 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.09.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:16 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:26 +0530
Message-Id: <1534950532-23850-8-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 08/34] util-linux: CVE-2018-7738
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
X-List-Received-Date: Wed, 22 Aug 2018 15:09:17 -0000

bash-completion: (umount) use findmnt, escape a space in paths

 # mount /dev/sdc1 /mnt/test/foo\ bar
 # umount <tab>

has to return "/mnt/test/foo\ bar".

Changes:

 * don't use mount | awk output, we have findmnt
 * force compgen use \n as entries separator

Affects util-linux < 2.32-rc1

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../util-linux/util-linux/CVE-2018-7738.patch      | 49 ++++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.30.bb    |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2018-7738.patch

diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2018-7738.patch b/meta/recipes-core/util-linux/util-linux/CVE-2018-7738.patch
new file mode 100644
index 0000000..7322b9c
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2018-7738.patch
@@ -0,0 +1,49 @@
+From 75f03badd7ed9f1dd951863d75e756883d3acc55 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 16 Nov 2017 16:27:32 +0100
+Subject: [PATCH] bash-completion: (umount) use findmnt, escape a space in
+ paths
+
+ # mount /dev/sdc1 /mnt/test/foo\ bar
+ # umount <tab>
+
+has to return "/mnt/test/foo\ bar".
+
+Changes:
+
+ * don't use mount | awk output, we have findmnt
+ * force compgen use \n as entries separator
+
+Addresses: https://github.com/karelzak/util-linux/issues/539
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+CVE: CVE-2018-7738
+Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/75f03badd7ed9f1dd951863d75e756883d3acc55]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ bash-completion/umount | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/bash-completion/umount b/bash-completion/umount
+index d76cb9fff..98c90d61a 100644
+--- a/bash-completion/umount
++++ b/bash-completion/umount
+@@ -40,9 +40,10 @@ _umount_module()
+ 			return 0
+ 			;;
+ 	esac
+-	local DEVS_MPOINTS
+-	DEVS_MPOINTS="$(mount | awk '{print $1, $3}')"
+-	COMPREPLY=( $(compgen -W "$DEVS_MPOINTS" -- $cur) )
+-	return 0
++
++	local oldifs=$IFS
++	IFS=$'\n'
++	COMPREPLY=( $( compgen -W '$(findmnt -lno TARGET | sed "s/\([[:blank:]]\)/\\\\\1/g")' -- "$cur" ) )
++	IFS=$oldifs
+ }
+ complete -F _umount_module umount
+-- 
+2.13.3
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.30.bb b/meta/recipes-core/util-linux/util-linux_2.30.bb
index 6b309b5..a6d23d8 100644
--- a/meta/recipes-core/util-linux/util-linux_2.30.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.30.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://configure-sbindir.patch \
             file://run-ptest \
             file://display_testname_for_subtest.patch \
             file://avoid_parallel_tests.patch \
+            file://CVE-2018-7738.patch \
 "
 SRC_URI[md5sum] = "eaa3429150268027908a1b8ae6ee9a62"
 SRC_URI[sha256sum] = "c208a4ff6906cb7f57940aa5bc3a6eed146e50a7cc0a092f52ef2ab65057a08d"
-- 
2.7.4


