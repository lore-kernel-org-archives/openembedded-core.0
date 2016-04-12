Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id AEF276FFCE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 14:52:00 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id v188so130452107wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 07:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6EP8Yi4On1t91exxF8pQ6X4gDj/1sYjFngEJRvQPUeY=;
	b=cJRtbPIxBub73aQ00X1CPzRIT+jq1Q5NlTW4yUX/Vtromt3ayFSEFK1mhhlfE8bYqv
	i6E5T/QIbqIbbXYOSj5yocpbTa8AkQ3OTfvbaaWc7GsYtyuSZ37HdCMINWsTHT9xU7vk
	BnmSg2e2VwEHDUOxp86HX2LO7PZUN65Rkb4/rQusmgApPhbJOrOJJNlRpnrse9qDw8Ld
	o+3KGtJu3MUe0gdRx4hizax0pBujJC1c90MWCeqIyiupmGe5+mBss0BoNUgeUZYblZJC
	C66aRTaRHplNkxyAwQ74alY+o5aplt3VTmlCeVVP4wngdiKpLfPvB3yNqOoHuCq2Xk/f
	UidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6EP8Yi4On1t91exxF8pQ6X4gDj/1sYjFngEJRvQPUeY=;
	b=guGh2PaGxPTRLulp9tdjmZOH3XCll8F6MKR+lMbSpWezp+Dk8rYreJBhSA830SknwR
	nyPZFAULv0sgVcCK6qMx+abJN/4AtlDI6hs24aY6oeWX/WJbMWw0nzxYzDROkVPCOQOJ
	cJ16j6vkdd89LA/h5x/lk61Wan2DnoFwsVQROASW67DTQCcb6op+jGvvb5XPdlX2j3eZ
	3ZsSUY6vFKok5EtUlBZDq213Kfse7gRj8CQjxCwcVBLdFfjrdxMvw2KIsu2ZpKrVTSeS
	zyJ3d8Tn9qOW5aDwHD7exzGfdRteXua+AS0UlK5cRS/34c+8f1ljWBTHeFtXwR9bO9vi
	VcOg==
X-Gm-Message-State: AOPr4FUTR87Lw0XxVi4oWDb+174VUodZEERljXrIcL82858/pGIk3lvMHTNs7yBpvV4ct8Z/
X-Received: by 10.194.6.36 with SMTP id x4mr4219343wjx.122.1460472721211;
	Tue, 12 Apr 2016 07:52:01 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id z6sm23192722wme.9.2016.04.12.07.52.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Apr 2016 07:52:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 15:51:54 +0100
Message-Id: <1460472714-12605-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1460472714-12605-1-git-send-email-ross.burton@intel.com>
References: <1460472714-12605-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/5] rsync: remove upstream's rebuild logic
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
X-List-Received-Date: Tue, 12 Apr 2016 14:52:01 -0000

Upstream some well intended but broken logic to reimplement the rebuild
functionality of automake. However this isn't out-of-tree safe and quite basic,
which means if it ever does execute (say, configure.ac or aclocal.m4 is touched)
then the build fails.

As we delete ${B} and re-run autoreconf on every build this is redundant, so
just delete it all.

[ YOCTO #9445 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../rsync/files/makefile-no-rebuild.patch          | 69 ++++++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.1.2.bb         |  2 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch

diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
new file mode 100644
index 0000000..3d27fe7
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -0,0 +1,69 @@
+Remove the Makefile rules to reinvoke autoconf, they're not out-of-tree safe and
+generally overcomplicated, and we ensure that autoreconf is invoked if required.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/Makefile.in b/Makefile.in
+index 151247d..8f3fdb6 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -141,58 +141,6 @@ gen: conf proto.h man
+ gensend: gen
+ 	rsync -aivzc $(GENFILES) $${SAMBA_HOST-samba.org}:/home/ftp/pub/rsync/generated-files/
+ 
+-conf:
+-	cd $(srcdir) && $(MAKE) -f prepare-source.mak conf
+-
+-aclocal.m4: $(srcdir)/m4/*.m4
+-	aclocal -I $(srcdir)/m4
+-
+-configure.sh config.h.in: configure.ac aclocal.m4
+-	@if test -f configure.sh; then cp -p configure.sh configure.sh.old; else touch configure.sh.old; fi
+-	@if test -f config.h.in; then cp -p config.h.in config.h.in.old; else touch config.h.in.old; fi
+-	autoconf -o configure.sh
+-	autoheader && touch config.h.in
+-	@if diff configure.sh configure.sh.old >/dev/null 2>&1; then \
+-	    echo "configure.sh is unchanged."; \
+-	    rm configure.sh.old; \
+-	else \
+-	    echo "configure.sh has CHANGED."; \
+-	fi
+-	@if diff config.h.in config.h.in.old >/dev/null 2>&1; then \
+-	    echo "config.h.in is unchanged."; \
+-	    rm config.h.in.old; \
+-	else \
+-	    echo "config.h.in has CHANGED."; \
+-	fi
+-	@if test -f configure.sh.old -o -f config.h.in.old; then \
+-	    if test "$(MAKECMDGOALS)" = reconfigure; then \
+-		echo 'Continuing with "make reconfigure".'; \
+-	    else \
+-		echo 'You may need to run:'; \
+-		echo '  make reconfigure'; \
+-		exit 1; \
+-	    fi \
+-	fi
+-
+-reconfigure: configure.sh
+-	./config.status --recheck
+-	./config.status
+-
+-Makefile: Makefile.in config.status configure.sh config.h.in
+-	@if test -f Makefile; then cp -p Makefile Makefile.old; else touch Makefile.old; fi
+-	@./config.status
+-	@if diff Makefile Makefile.old >/dev/null 2>&1; then \
+-	    echo "Makefile is unchanged."; \
+-	    rm Makefile.old; \
+-	else \
+-	    if test "$(MAKECMDGOALS)" = reconfigure; then \
+-		echo 'Continuing with "make reconfigure".'; \
+-	    else \
+-		echo "Makefile updated -- rerun your make command."; \
+-		exit 1; \
+-	    fi \
+-	fi
+-
+ rsync-ssl: $(srcdir)/rsync-ssl.in Makefile
+ 	sed 's;\@bindir\@;$(bindir);g' <$(srcdir)/rsync-ssl.in >rsync-ssl
+ 	@chmod +x rsync-ssl
diff --git a/meta/recipes-devtools/rsync/rsync_3.1.2.bb b/meta/recipes-devtools/rsync/rsync_3.1.2.bb
index 4b91ac7..9637ed4 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.2.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.2.bb
@@ -1,5 +1,7 @@
 require rsync.inc
 
+SRC_URI += "file://makefile-no-rebuild.patch"
+
 SRC_URI[md5sum] = "0f758d7e000c0f7f7d3792610fad70cb"
 SRC_URI[sha256sum] = "ecfa62a7fa3c4c18b9eccd8c16eaddee4bd308a76ea50b5c02a5840f09c0a1c2"
 
-- 
2.8.0.rc3


