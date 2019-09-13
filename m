Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id DBF3B751D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 12:22:27 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id a11so22126190wrx.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 05:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Il4qsnBT8LOySfazm+7++YQj68XSPwNeN575yEyFKtI=;
	b=ysbXESlL3mWNKxL1JMuPvkC7GFbJ0ZvTOX6PSY0a4iN1Sx3kovMEye4YFxUNvLqkrX
	eJ1i4VEX9olQmjdjZ3p2nwSNed60Rjr5l6L14krG7pvokFDSpvHBBtexHNp8kOU5oQJ/
	nby5a/6sHx/DnLAWAPqH2Wwc08TrxAjJOrfzDwu1tZ/PwQn//Zyez0d/zyi5z5cDqBNh
	NYjjtirfKlxgXW4hGLGHmO9zSNE6ZEhs88Nw13GHa3Yt1xb/wjOHqwmuPeDgveG/mMrU
	ED/N83sgH8CMVmQxkkR9rk9T9GpOuTkVun14auyJxhN+o/TgIR/W2E872cIh3YwknklA
	nhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Il4qsnBT8LOySfazm+7++YQj68XSPwNeN575yEyFKtI=;
	b=OMfQv7uZWtnveXDJk2ou5Wv/BsUYw4vnt6Vijtoaa0USBxGHDU97Nhe78MnMVyFAiw
	VT0+XOAGWJw6WsQPcibOLoqrIB6CQ6LlYT+c273QtMhygWPa3Bg4pq4ovMWoPd21caEp
	2F/dXwHylmyNMein+8H7AVDp3/92nG3EJvvwdK+1QMlDsSamgZXoRVJeIV0QO7eMfhvn
	Da06jbrI2LkbwBlhJ9vUln02h1eJGMy7mijDoIiWW1KgHjup02cuTdXyEFFf6STmC8Z6
	iyICsrV1jrpUxl0LQwNZNooXcgjRjy0m121MvT7gIpVABQ49Cjra3yQ3vhs+j+nVRnaB
	a7yw==
X-Gm-Message-State: APjAAAUVbdJfoSt2Vmu4+A5R+oSuzidla+jca7I5ieBcGMFKwK4GMI31
	faP163FRfikfOOCrgyJbRq7iQ/WtNcw=
X-Google-Smtp-Source: APXvYqxGflWgGUFkhwF89Dk9NvWJw2GOBVn5szHqIoyjWw7pr/6LHKo6yy88tgUUJq6ukM0bqpagTw==
X-Received: by 2002:a5d:5612:: with SMTP id l18mr39330605wrv.177.1568377347942;
	Fri, 13 Sep 2019 05:22:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y186sm2640721wmd.26.2019.09.13.05.22.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 05:22:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 13:22:22 +0100
Message-Id: <20190913122222.19350-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] adwaita-icon-theme: fix rare install race
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
X-List-Received-Date: Fri, 13 Sep 2019 12:22:28 -0000
Content-Transfer-Encoding: 8bit

There have been rare errors during the build of adwaita-icon-theme, such as:

Exception: bb.process.ExecutionError: Execution of '.../temp/run.sysroot_stage_all.45186' failed with exit code 2:
cpio: ./icons/Adwaita/32x32/legacy/_inst.34160_: Cannot stat: No such file or directory
cpio: ./icons/Adwaita/32x32/legacy/_inst.33428_: Cannot stat: No such file or directory
cpio: ./icons/Adwaita/32x32/legacy/_inst.35421_: Cannot stat: No such file or directory
cpio: ./icons/Adwaita/32x32/legacy/_inst.34533_: Cannot stat: No such file or directory
cpio: ./icons/Adwaita/32x32/legacy/_inst.35366_: Cannot stat: No such file or directory

The problem was that a previous optimisation (oe-core cd9af17028) to massively
increase the install speed (by parallelling the hundreds of installs) was subtly
wrong.  It was essentially doing this:

  for i in list; do
    install i &
  done
  wait

In pure shell this does parallelise the install commands and then wait for them
all to finish before exiting, but in Makefiles *each line in a separate shell*.  The actual Makefile is closer to this:

  for i in list; do \
    install i & \
  done
  wait

The backslashes are required to write a multi-line for loop in a Makefile, but
note that when the loop ends the shell exits and all of the install processes
that are still running are disowned.  The wait command then executes in a new
shell, and there are no childen to wait for.

The fix is trivial: add more backslashes so that the wait is part of the same
shell.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...001-Run-installation-commands-as-shell-jobs.patch | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
index 6c38e237f40..c4d7e2583bd 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
@@ -24,7 +24,8 @@ index 1c940a5..3998ee6 100644
 -			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
 +			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
  		done; \
- 	done;
+-	done;
++	done; \
 +	wait
  
  ## FIXME we should add a way to remove links generated by icon mapping
@@ -45,7 +46,8 @@ index 86f4d7c..3fae8c1 100644
  		$(mkdir_p) $(DESTDIR)$(themedir)/scalable-up-to-32/$$context; \
 -		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32/$$file $(DESTDIR)$(themedir)/scalable-up-to-32/$$file; \
 +		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32/$$file $(DESTDIR)$(themedir)/scalable-up-to-32/$$file & \
- 	done
+-	done
++	done; \
 +	wait
  
  uninstall-local:
@@ -61,7 +63,8 @@ index 24aac9b..61ba071 100644
 -			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
 +			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
  		done; \
- 	done
+-	done
++	done; \
  	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable; find . -name "*.svg"`; do \
  		context="`dirname $$file`"; \
  		$(mkdir_p) $(DESTDIR)$(themedir)/scalable/$$context; \
@@ -72,7 +75,8 @@ index 24aac9b..61ba071 100644
 -			$(GTK_ENCODE_SYMBOLIC_SVG) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $$size -o $(DESTDIR)$(themedir)/$$size/$$context; \
 +			$(GTK_ENCODE_SYMBOLIC_SVG) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $$size -o $(DESTDIR)$(themedir)/$$size/$$context & \
  		done \
- 	done
+-	done
++	done; \
 +	wait
  
  uninstall-local:
-- 
2.20.1


