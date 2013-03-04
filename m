Received: from mail-we0-f173.google.com ([74.125.82.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UCVBC-00078a-Eg
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 14:11:48 +0100
Received: by mail-we0-f173.google.com with SMTP id r5so4355431wey.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 04:55:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=Fe62x2f22+6/QZiLwlpkIiWVo2UxVrFaodnIsseQth0=;
	b=equHqJ0LAHDkxUdujyhDnoYJRnE9PKE1mBEUmGBIv7yiMnZ+HrpzO5WaYoTxMWgOwT
	IlSr5EmX9y6UiMworZqqmiNHWYVoPfb2j6RChKZXO9vJsHCaWXDhhOPi1LHaHF6DTJAS
	20LjXPhw+pqEz6UVEBYatjlrsIx69ae2jbiIbqWIfZ/XY4IKDc3CFhVh/+6Pg4u7qHgs
	D0oXYMD5DuE9IvccUhkkdsyEe8/WjCdOCPYxnd+Hlq3/GBOowWbaC+K5x++ByoZu3ugi
	K9o2W+4bQ2DSw03UvnBIfwtPJ6LVhbTif2RSjoHSkrfde0Fz7ipoQJ/Nxrjf+0m3RGfr
	pXjw==
X-Received: by 10.180.85.97 with SMTP id g1mr11379908wiz.29.1362401714002;
	Mon, 04 Mar 2013 04:55:14 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fx5sm15460507wib.11.2013.03.04.04.55.11
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 04:55:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2013 12:52:43 +0000
Message-Id: <cover.1362401323.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlrXHcd79cu5LIBFT7k/cI4H8I3AJTcD9l1iOpvTM+918ld3omP5Ws70tO7L89jhqWCjqhx
Subject: [PATCH 0/4] Don't build gtk+-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Mar 2013 13:11:52 -0000

Hi,

We're building gtk+-native (so the X stack, freetype, fontconfig, etc etc) just
to run gtk-update-icon-cache on the host when building the rootfs.

This series adds a recipe that builds just that binary from a GTK+ tarball using
a bit of hackery.

For a benchmark of building sato-icon-theme from nothing (no sstate or tmp):

master takes 13:25 to run 1037 tasks.
ross/gtk takes 9:26 to run 629 tasks.

So that's a four minute gain and 400 less tasks.

Ross

The following changes since commit 226c4384643da635fb668cdf0ccd32fea943875d:

  btrfs-tools: added PV to git package recipe (2013-03-04 10:04:27 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/gtk

for you to fetch changes up to 1c10f4983ce9470f80083d3f943a095df6bbc9bb:

  gtk-icon-cache: use virtual/gtk-update-icon-cache-native instead of gtk+-native (2013-03-04 12:39:19 +0000)

----------------------------------------------------------------
Ross Burton (4):
      gtk-update-icon-cache-native: add
      default-providers: add default virtual provider for gtk-update-icon-cache
      gtk+: mark as provider of virtual/gtk-update-icon-cache-native
      gtk-icon-cache: use virtual/gtk-update-icon-cache-native instead of gtk+-native

 meta/classes/gtk-icon-cache.bbclass                |    2 +-
 meta/conf/distro/include/default-providers.inc     |    1 +
 meta/recipes-gnome/gtk+/gtk+.inc                   |    2 +
 .../gtk+/gtk-update-icon-cache-native_3.4.4.bb     |   44 ++++++++++++++++++++
 4 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb

Ross Burton (4):
  gtk-update-icon-cache-native: add
  default-providers: add default virtual provider for
    gtk-update-icon-cache
  gtk+: mark as provider of virtual/gtk-update-icon-cache-native
  gtk-icon-cache: use virtual/gtk-update-icon-cache-native instead of
    gtk+-native

 meta/classes/gtk-icon-cache.bbclass                |    2 +-
 meta/conf/distro/include/default-providers.inc     |    1 +
 meta/recipes-gnome/gtk+/gtk+.inc                   |    2 +
 .../gtk+/gtk-update-icon-cache-native_3.4.4.bb     |   44 ++++++++++++++++++++
 4 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb

-- 
1.7.10.4



