Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id E7BF26BE2D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 06:37:45 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id y7so6517559wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 23:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fyF8jJdYEDomDbg02NLRGLXy5Qfqs81yuz+WxkSWsiM=;
	b=EhIcHUhsP9mdgUTcPsfK/S4h2ScSD5Iemx9iKglxvarZorDss3l9qYWQ04+iYXj7zq
	4Z/XjyD2YkBXH29UfTe7KTmAmrJfkhLfIP0KBBgDK4yobNCQPSEjdS1g50l4h5j1kv5c
	IhyJy7j2M5G0NriGjpmtuaRuml9ZuW/CzyALej4mtMwR2jnnMdyus7noag0LA9rFUydL
	NsW+94v2LNrh1SiN4Gp44laDNsCGzsInvFl7C3pAqaOwFq/wyIjJUYFHi/+zQ+nPNYDd
	d8VQSZeBcF1X1cScImQaYbzhYp1elu8HnUGxqDWdjrXpw/YPMlPwU9w+nhIu6KIbQAiz
	y+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fyF8jJdYEDomDbg02NLRGLXy5Qfqs81yuz+WxkSWsiM=;
	b=kMS/98855UTqK+1TSBoCHdYOxjZ4YF3NXyjWRTM+42U0d/I8vWytmmcrOb2dusO/k/
	xqxc233E45k7YXNUo31BI3XHT5DE0uggXJtmOvhfywc4KVUo5fS+6m0sT/p1BKsfgg/V
	4T4ZPGISuAstJ83xJjN51rmf4P4nKT2cqP5UTAYZ/p3fB54dSXZKRco3zcP01vNFVOEL
	KHmpm3vYLDKxeIgYptthsY864Owk0TsfDwMlRCE77vktURU86+7gQXJaDRhS1pwUsIna
	0HMRI0PDWcDSw8HJguzjcSXBjRuS5N/NoLJvDFGYBUdCnE2YZL7oyZCc3cGT1VPiZs7E
	ImmA==
X-Gm-Message-State: APjAAAVhvaAbLjMVYlUX+0vf6mGF9Wb0sP0sP2cs0m5QTRlZVDDtmRTX
	kxphkvjHlAkTxuNGRTZEBhCORA0R
X-Google-Smtp-Source: APXvYqzvcetcFTPI/6m0JuhUM3m6VoTW+DkCk79XJOlRLBY0zY77pUQTXU5ivpgR8RrMxjYooOXPFw==
X-Received: by 2002:adf:ea0b:: with SMTP id q11mr6790267wrm.233.1554446266366; 
	Thu, 04 Apr 2019 23:37:46 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D917A4978A6EAA704508.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:a497:8a6e:aa70:4508])
	by smtp.gmail.com with ESMTPSA id
	g132sm1185443wme.3.2019.04.04.23.37.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Apr 2019 23:37:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Date: Fri,  5 Apr 2019 08:37:23 +0200
Message-Id: <20190405063736.29750-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 00/13] meson/gobject-introspection rework
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
X-List-Received-Date: Fri, 05 Apr 2019 06:37:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Make meson builds aware of unrecognized config options.
* central auto-enable/disable gobject-introspection for meson builds + 
  unrecognized options are triggered for meson & autotools now
  
Note that native recipes are build gobject-introspection disabled (as before
when building with autotools)

Did test this series with my heavy-heavy-monster image but there might be
fallout if 'unknown-configure-option' in ERROR_QA is set but:

* It is better to be aware of options set wrongly (some were discovered already
  by this series)
* Patches for meta-gnome for packages not accepting gi on/off option are in the
  queue already
* glib-networking upgrade was done because it reintroduces on/off config option
  for gobject-introspection

Andreas Müller (13):
  insane.bbclass: Trigger unrecognzed configure option for meson
  gobject-introspection: auto-enable/-disable gobject-introspection for
    meson
  libmodulemd: use gobject-introspection.bbclass on/off mechanism
  gdk-pixbuf: use gobject-introspection.bbclass on/off mechanism
  json-glib: use gobject-introspection.bbclass on/off mechanism
  libdazzle: use gobject-introspection.bbclass on/off mechanism
  clutter-gtk-1.0: use gobject-introspection.bbclass on/off mechanism
  pango: use gobject-introspection.bbclass on/off mechanism
  at-spi2-core: use gobject-introspection.bbclass on/off mechanism
  atk: use gobject-introspection.bbclass on/off mechanism
  libsoup-2.4: use gobject-introspection.bbclass on/off mechanism
  glib-networking: upgrade 2.58.0 -> 2.60.1
  gst-plugins: move 'inherit gobject-introspection' to recipes
    supporting GI

 meta/classes/gobject-introspection.bbclass         | 14 ++++++++++++--
 meta/classes/insane.bbclass                        | 12 ++++++++----
 ...working_2.58.0.bb => glib-networking_2.60.1.bb} | 10 +++++-----
 .../libmodulemd/libmodulemd_git.bb                 | 11 +++--------
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb |  8 +-------
 meta/recipes-gnome/json-glib/json-glib_1.4.4.bb    |  5 -----
 meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb   |  6 +-----
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc  | 11 +----------
 meta/recipes-graphics/pango/pango_1.42.4.bb        | 10 +---------
 .../gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb   |  2 +-
 .../gstreamer/gstreamer1.0-plugins-base_1.14.4.bb  |  2 +-
 .../gstreamer/gstreamer1.0-plugins.inc             |  2 +-
 meta/recipes-support/atk/at-spi2-core_2.30.0.bb    | 10 ++++------
 meta/recipes-support/atk/atk_2.30.0.bb             |  8 --------
 meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb |  8 --------
 15 files changed, 39 insertions(+), 80 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.58.0.bb => glib-networking_2.60.1.bb} (71%)

-- 
2.20.1


