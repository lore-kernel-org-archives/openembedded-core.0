Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.11955.1606837236056488672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 07:40:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pm8QnYEw;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: jatedev@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id n9so1003091qvp.5
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 07:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iHJHyrNxVM1XL15EHEoY2Rb3lN6HH2+JJAlIUR0UgtA=;
        b=pm8QnYEwbG8vhlUx8qmLET9KbFDQGXhhSdKXhjc/hdbiGO5OZPUxWTopPvxn80dhEG
         tvu5DjweiKOwnilxToEhsnE9VnZ0CB215OQXCbkplWLRzZ6mwLiURzP9Jow0Pf+VWyvk
         N9EseWOy7c2lZGlLWfRRTGgKVbHs3RZCrI3B7Mt01ukDk5oc/8NY/jQrbxQZdBGdNgbh
         DIEHBOIwo6rdALC0/Xqb9jwfBvqqfcx2RTNzufk1K4n+s4fCbCMEKj4YMCONe2teaN54
         VeNrnNGTDSwKDmCiEFktFTuy2OTH7pVLiqcML1rcbOFDC57K+QE7M4d1WBZT/hv3INLY
         GTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iHJHyrNxVM1XL15EHEoY2Rb3lN6HH2+JJAlIUR0UgtA=;
        b=IxqGrNh1nOAf1taBurgFpOH9DX36JaSiJD0PDBG0P4lc1cNKHvVYN5/Aq0WrLqWLxx
         5PIErOyKaUbbCKnRCF2K8mPus9dKVnZkftfib9my3HCo1piYs4wVFY1AzmoZAB4nbyLn
         NzUlUaKYegLuxmV87I+/jvsCEQhFetxmWOVICuMVFn4Wx+NK0jdKv/YzOqSn1QwhwDjb
         DYeTBDdpYnk6Gpyh7ZkagK3lAo2ZfOqdpFbdHmpHXKPCRCLqhrOeq2OKjhlu7JcoSdty
         v1VYZ4Pd9VOAL4MIcjZ907iLApSic4urdAnfYhQSN+jmyoeejb58cnizEVvjO8bg4jpW
         9edg==
X-Gm-Message-State: AOAM532t9uncFu+j9RpCt3luK0ojS2Wj/ZjBvwfbHuhlfdWlFr5maCNj
	C4OzBAN8DAb9B+y4nmysL59dYUlPqvI=
X-Google-Smtp-Source: ABdhPJyjiSesTSnFKmiTzkXJsH3BqksA3iADLxiVar6ihzpBn4+Tqdx7H5k5BqqNt3560N6K+Tt0kA==
X-Received: by 2002:a05:6214:12ab:: with SMTP id w11mr3344065qvu.42.1606837234880;
        Tue, 01 Dec 2020 07:40:34 -0800 (PST)
Return-Path: <jatedev@gmail.com>
Received: from localhost.localdomain ([63.148.217.19])
        by smtp.gmail.com with ESMTPSA id x21sm1984947qkx.31.2020.12.01.07.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 07:40:34 -0800 (PST)
From: "Jate Sujjavanich" <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jate Sujjavanich <jatedev@gmail.com>
Subject: [PATCH] sysvinit: Add bootlogd patch restoring console detection
Date: Tue,  1 Dec 2020 15:40:16 +0000
Message-Id: <20201201154016.487-1-jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bootlogd program will skip any non-standard serial ports specified
in the kernel parameters, so restore the detection of the device
underlying /dev/console. This allows the serial console on some embedded
systems to work again.

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 ...ogd-c--Restore-dev-console-detection.patch | 101 ++++++++++++++++++
 meta/recipes-core/sysvinit/sysvinit_2.97.bb   |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-bootlogd-c--Restore-dev-console-detection.patch

diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-bootlogd-c--Restore-dev-console-detection.patch b/meta/recipes-core/sysvinit/sysvinit/0001-bootlogd-c--Restore-dev-console-detection.patch
new file mode 100644
index 0000000000..14b5d84c78
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit/0001-bootlogd-c--Restore-dev-console-detection.patch
@@ -0,0 +1,101 @@
+From: Jate Sujjavanich <jatedev@gmail.com>
+Date: Thu, 29 Oct 2020 12:31:43 -0400
+Subject: [PATCH] bootlogd.c: Restore /dev/console detection
+
+Restore function that detected /dev/console's underlying tty device. This
+causes bootlogd to add the kernel's choice for /dev/console to its output list.
+
+This also helps if the kernel's default console is not in the defcons list and
+bootlogd ignores console= definition in kernel parameters. This is frequently
+the case for embedded systems which have their own names for serial drivers.
+
+Upstream-status: Inappropriate, embedded
+
+Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
+---
+ src/bootlogd.c | 29 ++++++++++++++++++++---------
+ 1 file changed, 20 insertions(+), 9 deletions(-)
+
+diff --git a/src/bootlogd.c b/src/bootlogd.c
+index 8b07903..909d3e5 100644
+--- a/src/bootlogd.c
++++ b/src/bootlogd.c
+@@ -110,10 +110,6 @@ void handler(int sig)
+ /*
+  *	Scan /dev and find the device name.
+  */
+-/*
+-This function does not appear to be called anymore. Commenting it
+-out for now, can probably be removed entirely in the future.
+-
+ static int findtty(char *res, const char *startdir, int rlen, dev_t dev)
+ {
+ 	DIR		*dir;
+@@ -169,8 +165,6 @@ static int findtty(char *res, const char *startdir, int rlen, dev_t dev)
+ 	chdir(olddir);
+ 	return r;
+ }
+-*/
+-
+ 
+ 
+ /*
+@@ -250,7 +244,7 @@ int isconsole(char *s, char *res, int rlen)
+ int consolenames(struct real_cons *cons, int max_consoles)
+ {
+ #ifdef TIOCGDEV
+-	/* This appears to be unused.  unsigned int	kdev; */
++	unsigned int	kdev;
+ #endif
+ 	struct stat	st, st2;
+ 	char		buf[KERNEL_COMMAND_LENGTH];
+@@ -260,6 +254,23 @@ int consolenames(struct real_cons *cons, int max_consoles)
+ 	int		fd;
+ 	int		considx, num_consoles = 0;
+ 
++#ifdef TIOCGDEV
++# ifndef  ENOIOCTLCMD
++#  define ENOIOCTLCMD	515
++# endif
++	if (ioctl(0, TIOCGDEV, &kdev) == 0) {
++		int r = findtty(cons[0].name, "/dev", sizeof(cons[0].name), (dev_t)kdev);
++		if (0 != r)
++			fprintf(stderr, "bootlogd: cannot find console device "
++				"%d:%d under /dev\n", major(kdev), minor(kdev));
++		else {
++			num_consoles++; fprintf(stderr, "bootlogd: %s", cons[0].name);
++		}
++	} else
++		if (errno != ENOIOCTLCMD)
++			fprintf(stderr, "bootlogd: ioctl of /dev/console error\n");
++#endif
++
+ #ifdef __linux__
+ 	/*
+ 	 *	Read /proc/cmdline.
+@@ -311,12 +322,12 @@ int consolenames(struct real_cons *cons, int max_consoles)
+ 						goto dontuse;
+ 					}
+ 				}
+-			
+ 			num_consoles++;
+ 			if (num_consoles >= max_consoles) {
+ 				break;
+ 			}
+ 		}
++		
+ dontuse:
+ 		p--;
+ 	}
+@@ -329,7 +340,7 @@ dontuse:
+ 	 *	guess the default console.
+ 	 */
+ 	for (n = 0; defcons[n]; n++)
+-		if (isconsole(defcons[n], cons[0].name, sizeof(cons[0].name))) 
++		if (isconsole(defcons[n], cons[0].name, sizeof(cons[0].name)))
+ 			return 1;
+ 
+ 	fprintf(stderr, "bootlogd: cannot deduce real console device\n");
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.97.bb b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
index 98916f7f19..6187295405 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.97.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
@@ -20,6 +20,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
            file://rcS \
            file://bootlogd.init \
            file://01_bootlogd \
+           file://0001-bootlogd-c--Restore-dev-console-detection.patch \
            "
 SRC_URI[sha256sum] = "2d5996857519bfd8634d2e1debabb3238fb38440f65fbfdc46420ee8bdf25110"
 
-- 
2.25.1

