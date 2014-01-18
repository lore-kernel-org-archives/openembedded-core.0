Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 447936E79F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:02:03 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so2223619eaj.15
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=BdpoTfVj6o60HJMFoxFjjrfVJf4KrZO+94+FYZCQ26E=;
	b=YuYEv9ZIIOH2TztEoh6YoQQkkcprXNQLlYpGiyb0CXBwm7ywfyrdr0q9K/P68nmoOk
	EPfWLkY0WmXOAQUsiL1nYQsRpnqysAuwgXE5lsnuW8qQsUxddHxZcM+BR0rwTHdvt+Qi
	bMaqKROpwZA9nTS0GzMzTbd27HPreZG+GDtYiUnIVGgyQFe5WoZOasiwibykKnkBTTfi
	MxY0E45Zq6pJy2bsCYXxPZ4JSmDDi7GtwvSiKlHNHjA4ky3QFG4MQjVNiYJjel+qf/CH
	V2IfE82atFvZbOISAveMD061LQsTpmmRa9GwzrUl8LS1Jd3HOe4BQf4skgjaVdfQgeGa
	ieHA==
X-Received: by 10.14.6.5 with SMTP id 5mr7958423eem.51.1390053723896;
	Sat, 18 Jan 2014 06:02:03 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 46sm19133363ees.4.2014.01.18.06.02.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:02:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:02:05 +0100
Message-Id: <cover.1390052636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
Subject: [PATCH 0/5] shlibs providers improvements
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
X-List-Received-Date: Sat, 18 Jan 2014 14:02:03 -0000

Fixes for [YOCTO #4628]

Richard had few more ideas to improve it even more, but this is good start.

Most important changes:
* PRIVATE_LIBS aren't duplicitly added to RDEPENDS (when recipe provides
  own libfoo it shouldn't get runtime dependency on global libfoo shlib provider)
* warning is shown for undeterministic providers (multiple packages
  recorded to provide the same library) - recipe maintainers can decide
  if such library should be considered private or make sure that only one
  package is built (most common case are gst plugins where 0.10 and 1.* provide
  the same gst modules, but as long as nobody tries to linke directly to some
  gst plugin we shouldn't list them as shlib providers).
* list files which require given shlib, often I was surprised to see that
  something got runtime dependency on libfoo, showing which binary is linked to
  it makes it easier to debug when you have only log.do_package and package
  directory is already gone (e.g. analyzing test-dependencies.sh script outputs)

The following changes since commit 8163854adf87ac42a8f08ee25685d0ce1efb4724:

  oe-selftest: separated the SStateBase and SStateTests in different modules (2014-01-16 12:18:44 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/shlib-providers
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/shlib-providers

Martin Jansa (5):
  package.bbclass: move reading shlibs providers to separate function
  package.bbclass: show warning when package is trying to provide
    already provided shlib
  package.bbclass: add SHLIBSSEARCHDIRS to define where to search for
    shlib providers
  package.bbclass: Don't search for prividers of PRIVATE_LIBS
  package.bbclass: Show which files require given dependency in debug
    output

 meta/classes/package.bbclass | 102 +++++++++++++++++++++++++++++++------------
 1 file changed, 75 insertions(+), 27 deletions(-)

-- 
1.8.5.2


